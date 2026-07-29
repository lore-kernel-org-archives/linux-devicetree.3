Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5F43E08A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316272; cv=none; b=gwfRpPjoo5bj3S0v+t5y1qsuGz7BpDy9y2HlWwzupr1U9woyLMUhi9dbieHFbCg4dPRRxnLhzhCSJ2GRG02/mdnENuz3ccEre/C+rCk5mD8CcDVrEv8WGSiNjVc54Je3fMCtwQiD7ckIYGXSyNEGuYB/5l4iHT4GtjcBxOrIVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316272; c=relaxed/simple;
	bh=QoddJzJhebR8IjYCrkbLAN0s0tIW48jnNL4y2MIVi+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzJ394vbXvsiwEBYibLg+cZjqeObdzDFju/poWO1sb47ogr8oYHiXgxIIUnkDTPCcMfhz3YUCKWGObPm7KgOLBeJYhqSWEW9OobfEbXQaDF6h+K5WFXxaui9NeHUIpGdi8KCjWL16HhKm2S3OcVAtHi7CMNGjk4w15JOUSk+xrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olgukxVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkezUdmv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olgukxVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkezUdmv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fJOJ1089137
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wXnburUlupRiHpSJ4CDRreFD
	5mzaQY+gxtna4BDSfRo=; b=olgukxVmAsWZ02LcXQwlyT8bYAehDVFa3R7kbCpe
	DakOUQidq6ip4mUR00onnJBM4zWYIk5wcpYS1Iw4gQjhjvgu5ndOyN7NMeEUVXji
	B4Mqf8T4+ZSuwcQQlfOcEXCYLcZtP+HyHLNrx93ael2OvAhZVYr9lG1lMlj6Yylj
	VtSRZ8ia63bA5kpjFI5ZbmKSfSt26FQvf/7un5Cm2vxsR+3ANwMdX6sUXGCKe1Ir
	6aBcJO9ZBNaaOhxueO4fjxX2x4qD6nQqqaDFBOSDMvuX00rqJLtKs9AF8nV1R2W/
	pw/uISdOUS2rbhY/+Gsi2YyWBQhAo+8TY7O7aBGMGhW97w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sahygg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:11:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1055200a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785316270; x=1785921070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXnburUlupRiHpSJ4CDRreFD5mzaQY+gxtna4BDSfRo=;
        b=fkezUdmv+7DlD74zMlqjvarAuJrxM53YW31C0ElV5QwQkwpI/LmRp6RO0TyiOThKRV
         CqCHoUtdruRGlSxao3k1aZB4KOoyovrXyP/8pCRnFjAhYnursJ5KdCQcEA5wApjGhzW2
         diJ26vciKisW4BYz+cM15zvGFQdhcQEzDWYqDez6OfDDKEXB0M+yOXTzaYo7okjqeiqE
         bc977GK5uROovC/bYOmO3W55TfqRJJQ5Kexj0UL7gaY5G/MHWfHwnCJd2FoijRTJgFJS
         8w3Despgzn+6Jx6pTfocFpuAmH49iMppGB4nk+FfqHg+1vWRHdVbKHeWtbYay1vNDoNH
         rWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316270; x=1785921070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXnburUlupRiHpSJ4CDRreFD5mzaQY+gxtna4BDSfRo=;
        b=LCYGcddzQcP1l0njnYsrTViXAap7qYJ0vhOnAUGZgvco0/uXPG1+cRGasK1qEXoVVo
         I66OqvyKSe4CM/0p2ruBmSaxv7ZXZVgOHySH2LBDYJTVaVVMFlL+S2FZ9GiKe8oHsooS
         TuIZZETtPP/It9Kg98crOUx3tSBRyZTzAfo8i/63e1uhkUf/AUpHHuDjlEcvaxILb0lc
         fc0mVn5ETRBMQNSEqv49iVSqVayrVdyi6eLPZSnoB8IyzY/9dXX8XLSHt0p1tEySnHbj
         PO6sGCljtmwBkMVJ8kpDpe2dBimO7lWlFMw+W/6MRLkQj46RR7473GSLN8rZCD+bigpH
         FKIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9vPjnWSI1dEvaQac3YIHUX68xDmnOIvShFQuh6kSZRhycECC+lY9TeR2O3UwJ3vl16JrfPcFwwMHT@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbGY+w/MQJt2SQ22uMq4h468yCyn9gK1Lr+YV6mp703mBxjS3
	QZ7Thqs09/BcitJfpJH5BItQVHXV9F/5HrBgjRi3RiziC+Fo5XnrcLragcVwK9BaNwuXQfB9PaK
	lSELBp+PeIv/raR5VgbVCZsd6dmJHp716Zw1M7f5uSma7bh/IwS7lA5qwBElKhmCJ
X-Gm-Gg: AR+sD104nV5XdxPBQrrYOUt49VK1v6/JnxcQ13Phei57af/LKyIZBWF6QYQeznGSTDe
	zovS/19fwXQ23u+Lhnv69+q4oOrfxABDcVrQLi/TkNbe0Fgj9v50FAtozjvnfZY2guoG1knNPaZ
	Wmz3ODFdzLACNl8nkGnDxH+RYBtuQeOzzdtuKbCMzzNwSHViUxTw+aF9rqjPK1OXrujmK84zBhQ
	PtsxCSigBxrJ5SSMrgAIugr+qhOAAehXIJ8HI/v90x42IzgoAo/I/p61r8Ak3RQGC38LueV/V5r
	DqHVv0IY+/kyDgNTWhIVpr0sZtFa0jLWkjsrAfVN9k+6L2PmgF/Gbbuww0pe39H9SeWHtVgaVp8
	2KAYt7X1SlK6xTWbll4hrwl8la2bfLBzwF2Dbp0xyuo2e/r4=
X-Received: by 2002:a17:90b:17cb:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38f6a5430c5mr5909560a91.32.1785316269608;
        Wed, 29 Jul 2026 02:11:09 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38f6a5430c5mr5909528a91.32.1785316269144;
        Wed, 29 Jul 2026 02:11:09 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0edc1csm1058184a91.3.2026.07.29.02.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:11:08 -0700 (PDT)
Date: Wed, 29 Jul 2026 02:11:06 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
 <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
X-Proofpoint-GUID: byQvOKxYGCfWmkMz8b8dRDplM_-u9iHd
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69c3ae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iYY4eBxCTIKzZHblZ3kA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: byQvOKxYGCfWmkMz8b8dRDplM_-u9iHd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NCBTYWx0ZWRfX45FrSag9e29u
 IHE5JcL9IqgLwZ2svS0x1Nb+aDleIJaw7XTnYLH8qVgCgLMm82A1Q7O9E04RdWaw38Gz0P2O061
 1z6bD29c55rDcw/FMl9FqFzRnU8Tl0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NCBTYWx0ZWRfX+yWyJH3DSWPV
 2vBJwKcB1zMwBIPBvs7lM2bAX7n9ya8xc5Vfydt8/eAGGQ6TW5JAWsqHYe4WRhxk1MLthxzDHLf
 wPv8tZS30Rl+IIkvSu6PA0c2HjE2uw3Wx4zqdwdfam+4Q9nUdgj7T7PQL2j3US4IQdA7ZZhm7P1
 1/gxz9Hom0VDhx0RCg3jfTv8eY4blr7xh30RYFAWlgfz7QzXEhXaVB89Ykg1U69brN5zBWpGmxI
 nHbhjMVxrcNBAawWGs4lq9TsFaaxYCwxz6IwQrDZrGPBNRf5yfCIgXBjCCFVQ1+GCyopZx+9e8s
 z9pLNvF/i6YB4lsYHIeIptge21/BCPxsgfuD22Vzk8Z0raktW3/SjGQphuSAWGU7DTBrXuJkW1G
 lGuWpLAgAOqI7/gZ1awl0UDc+r001LDcd5QhZT/0b2MqJDNs6BlfFC8ja9RoMTaIAVnHyDxP/Fb
 oTnNKnnNNj9VEjCX5nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290074

On Wed, Jul 29, 2026 at 10:30:27AM +0200, Konrad Dybcio wrote:
> On 7/29/26 8:45 AM, Qiang Yu wrote:
> > On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
> >> On 7/24/26 12:01 PM, Qiang Yu wrote:
> >>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> >>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> >>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> index 6125617de82a..0aae613a33ad 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> @@ -28,3 +28,11 @@ &mdss_dp1 {
> >>>  &mdss_dp1_out {
> >>>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >>>  };
> >>> +
> >>> +&pcie3_phy {
> >>> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> >>> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> >>> +
> >>> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> >>> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> >>
> >> I'm guessing you also meant to enable it here
> > 
> > No, we need to keep it as disabled because pcie3b is not enabled by
> > default on glymur crd.
> > 
> > See the fake pcie3b_phy be dropped, it is disabled
> > https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> I think there are SKUs with dual-NVMe that use it

But the pcie3b controller node is also disabled, should I enable it in
this series?

- Qiang Yu
