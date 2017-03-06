<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><br />
    <p align="justify" 
        style="width: 900px; font-family: Arial, Helvetica, sans-serif; font-size: large;">
        <br />
            <span>Over the past decades, caching has become the key technology used for bridging the performance gap across memory
hierarchies via temporal or spatial localities; in particular, the effect is prominent in disk storage systems. Applications that involve
heavy I/O activities, which are common in the cloud, probably benefit the most from caching. The use of local volatile memory as cache
might be a natural alternative, but many well-known restrictions, such as capacity and the utilization of host machines, hinder its
effective use. In addition to technical challenges, providing cache services in clouds encounters a major practical issue (quality of
service or service level agreement issue) of pricing. Currently, (public) cloud users are limited to a small set of uniform and coarsegrained
service offerings, such as High-Memory and High-CPU in Amazon EC2.
</span></P>
<br />
   <img alt="caching As A Service" src="images/CaaS.JPG"  align="middle" 
            style="width: 608px; height: 180px"/><br />
    <p align="justify" 
        style="width: 900px; font-family: Arial, Helvetica, sans-serif; font-size: large;">
<span>
In this paper, we present the cache as a service
(CaaS) model as an optional service to typical infrastructure service offerings. Specifically, the cloud provider sets aside a large pool of
memory that can be dynamically partitioned and allocated to standard infrastructure services as disk cache. We first investigate the
feasibility of providing CaaS with the proof-of-concept elastic cache system (using dedicated remote memory servers) built and
validated on the actual system, and practical benefits of CaaS for both users and providers (i.e., performance and profit, respectively)
are thoroughly studied with a novel pricing scheme. Our CaaS model helps to leverage the cloud economy greatly in that 1) the extra
user cost for I/O performance gain is minimal if ever exists, and 2) the provider’s profit increases due to improvements in server
consolidation resulting from that performance gain. Through extensive experiments with eight resource allocation strategies, we
demonstrate that our CaaS model can be a promising cost-efficient solution for both users and providers.
        <br /></span>
    </p></center>
</asp:Content>

