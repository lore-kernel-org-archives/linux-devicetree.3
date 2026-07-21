Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05F40800F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621333; cv=none; b=H+q+mnrqGAwrjx7jel1R3yGSdSlOxgIiminCQpDIdLz2ehU9KV6Fs/KyQbmvoDH7J5zLOEO2Y6hOK7Hdhufasx/whYzHtofEPOUp3gaYjjduVX7BrfxXQUeB6c3/9go4Z/xcU/30okQ8HkvZYKOCRzu1j1ftzNfjFT8Si6cZ/Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621333; c=relaxed/simple;
	bh=MnJJznTNb0T2HRhw/9Df72HjOjsDh+evdHwrOlq8d/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKTzrQCzMLciABbu2IpMhTg/Pv9gcFr4dImtDnu210USk8oV4+nArpZKzH2Ti19cYE37hR1AnEkNu402Wv6nyAYX2RvEGYct8+Xn9kQQ6czNPfcob2CD6k3igjqXieR+VR2gyOWopC3Y9TcIBHQdvBQmcIDE14dvMQQxz3LcJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/rlAThi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+sux/ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/rlAThi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+sux/ev"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L7veLw092270
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HtLBlAg4r0+Aka+/4sxNKNln
	C5hTN13yNk/Kzymsu0U=; b=C/rlAThiRCvbpy6/usGw/BT5RxBapOsPrC6mOdfd
	HltX+qIiRmq1taP0prZ5nI3P7aTQAuJoWy18yyLmrPeC7LQXl3VnB6Gay75Y21i3
	AphPtpb1w7EqaIL/Abm+a8VyVNWhtdpA02wLOxSag8DUvHueUdLI4a8LCb82IfVG
	RWLQ2IL9N1+UC3L81gV0qsF3hslskbcVuw0OQp4mE74UrcKwh3NarEe+wJnPtLRd
	nXXc4iazYR5kwtpi5F5kJS97VrdaAZJONjlVXLvjHAdTFP7FP8fW9J/IWneEUDby
	aHsU4IVjFWGqNYs1lP2O4WzrBS88ZgsxtQ7ML1jEsB01ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a98td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:08:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so214770451cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784621330; x=1785226130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtLBlAg4r0+Aka+/4sxNKNlnC5hTN13yNk/Kzymsu0U=;
        b=e+sux/ev04b0GU+/G9lhbPFbxdudwjFy0daiUmvABaKlx7fMrJ7gm5nS/KzPXMPOn6
         VpXiqe077q4ATxRy8edOHgFkdbrri2jaPgAiML9OwjPHmSeiYpIAlX+COdHFkOQts/2/
         vrGE5SmGB+y0H+2rntITC2U3ge8u1Nz1LF/Pq3DxOQQsJUsqM8G9AQYjcDMzYsfdEIZp
         cO6EWKOPr5WLJ/RTsZ1D8dGU1WS84AOsd2tdmEm6TvAkWRvtxqwCxNKyc/fJ/wvCXe7W
         Zjhaw4gaSFiE0jxVqqth0Yuv8tNvqNdwSJ3AwUv/mxT+BDOSp1iKP70mc9onwsb6mSlb
         c/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621330; x=1785226130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtLBlAg4r0+Aka+/4sxNKNlnC5hTN13yNk/Kzymsu0U=;
        b=XGkeKqQze0ktRljg1w5tf1xVSn6PPQIi0v5zdFx7q9R5ZgxxCuWrGXN4ANcK8dby0m
         6P+9cLmMf2vzzAh+VHFzFKrOByQ1QkZE5QTg51qx/vIuUBQTt04Qoq8OwaIrDtp2d3R4
         Bw0sU0FF8gfduwW/bSXhG1N7gF8QBXPm1NOfBk0Y7RT1JOL0sHo2h1qwUIufy05CXaH2
         6qPla92C600PJcW5zjWCrhGTlxP0QURf+vB2mnNfsSJVURtq6JmMXDy0szmIsMr99hiE
         JUjS7NDRDoFFdDFTiI98Li0rekWbYzqksiaMVUdYM4keeSk+XzlZdUJhY18H0xtrTHAs
         6thw==
X-Gm-Message-State: AOJu0YwPKDZh/ScHZcm5rNNh21E18hKq45bduX/cHAw5ZShmw+pqgAzf
	hYrSHKnBUb367sxKJno0uHMY9cEsxpRHHTAI34ziFgZIROSP6wUEXUYT7NIRSGqzhLITDcpMbu4
	8KZDhtTfZQ3h5D0TKY9iV/AC12dycNiIlzm1Cjig0C5C59lO0sHpZ6Hotv0qQdnPtvTYCHWK2
X-Gm-Gg: AfdE7cmQRP6V3s2DCmU5fui+R3PQbBOOhCvhj1PAUAErLoGfJ06dTstrMgaplkr1ToG
	naUp6z6rjdpPdt329M0hPhyklZdv7QCNPo7nDe5RFLJHEx2jdoRZONjPgnMXpg4IqnWEanCoHFK
	qVjizn7YNSMz0r386KBkwJwQqg9cWJJ6vixh+uaGF9qGFjYFX+GHlJikoZV7TC5SWvdWAM27ijV
	j8IWTiyVVMUP3VkTOwWOMbVejxDD/yyGzTSUhs04yJNzJy4TR5wGwfnd2Jc+4pZPpQQG3U3ftMR
	eDAZtfAQzVPT6l5tpymUr8BjCkhAQQ5Zm/jkMQwhbazi1qYTC0xLThIcfxlqrOfnYvqSSqs1F1b
	e1l1G3XumcAmaUUc=
X-Received: by 2002:a05:622a:ce:b0:51b:ff00:46e with SMTP id d75a77b69052e-5213c7e64b6mr167047861cf.32.1784621329918;
        Tue, 21 Jul 2026 01:08:49 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:51b:ff00:46e with SMTP id d75a77b69052e-5213c7e64b6mr167047641cf.32.1784621329310;
        Tue, 21 Jul 2026 01:08:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm35872990f8f.37.2026.07.21.01.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:08:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 11:08:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Message-ID: <64uogzqxtz4sfwhg3kyrxcspuv7bmq6u3kxelbwun3d6wmf674@rayzujuahc3r>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
 <20260714134955.CFFC51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714134955.CFFC51F00A3A@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f2912 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g-jXLJ6NlkpF3N7jzMkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NCBTYWx0ZWRfX54EJ9F5WKbuU
 Mlgfbn/0dSXG0LOEXSPfxH2bsM2H4Wufuu3yo7KbJqtZqCuKVhuhyzzFjFbemj/MEUeM/x8WeSm
 auQ0HaFTpWhPTVQStmTIAZlAzy1y/4/qikQ9AxjX6dbZ3cK8A0ci7KCeq1GQ6Zyp2jz3RZliZ13
 0qOQkyR7JX2KBU2oZPlpPnPiY71wOp4bD3sRU7HRcHzzLym+EjDZn/LW4tCqLps/ZuUpBGjImkk
 9W2ZebBHlQM7UMa2nYvL2BUaqClIDukpu6KHKLzPhwjT9n/wtCNFEQTAD+yr9FqWTcBoeXo+ZUz
 pQHT2EsVpAAIb5fpcSNqsCEqgiR5/IrKeGA/ZOKAP3t+7qn774VB+bnB0pabIq5qPZCYj7DVF3O
 Ma562EidHTUVxFWWDhyNDVm4D9atnZ/THtA/KT2TY9QmcFL9mE4igi9BZQY1n3OaCBtbm2lnMC/
 c16O1nImbwzn3aJ23wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NCBTYWx0ZWRfX+gLsazmQiX/V
 ypF/nVatB3C6mARkqxBK+JRgzrnWeJkyJcKFDltaH8bSKy00CLAZjHFCNMoVS9rmoJBE76zxxZ4
 Wl9O0w4D84FzO5T6WjT0LGnwlDHxovU=
X-Proofpoint-ORIG-GUID: YsEuv_k6-ycxa3UmdWSySXCrUMxXBQJl
X-Proofpoint-GUID: YsEuv_k6-ycxa3UmdWSySXCrUMxXBQJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210084

On 26-07-14 13:49:55, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `remoteproc_cdsp` node is missing the `glink-edge` subnode required for IPC.
> --
> 
> --- Patch [2]: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc ---
> commit 5af49a73d9e2d56636adad16779d928f64bfc0a3
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
> 
> This commit enables the CDSP remoteproc node on the Eliza MTP. It provides 
> the required firmware names and sets the status to okay to bring the DSP out 
> of reset.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > index a7d6f9d52ef31..7de4ee3935e63 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > @@ -484,6 +484,13 @@ &remoteproc_adsp {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/eliza/cdsp.mbn",
> > +			"qcom/eliza/cdsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> [Severity: Medium]
> Is this missing the glink-edge subnode required for IPC?
> 
> Looking at the base device tree definition in 
> arch/arm64/boot/dts/qcom/eliza.dtsi, the remoteproc_cdsp node is defined 
> without a glink-edge child node:
> 
> 	remoteproc_cdsp: remoteproc@32300000 {
> 		compatible = "qcom,eliza-cdsp-pas";
> ...
> 		qcom,smem-states = <&smp2p_cdsp_out 0>;
> 		qcom,smem-state-names = "stop";
> 
> 		status = "disabled";
> 	};
> 
> Without this subnode, qcom_glink_smem won't be instantiated for the CDSP. 
> Will this leave the DSP functionally isolated since the host cannot establish 
> RPMSG IPC channels (like fastrpcglink-apps-dsp) to perform compute offloading?

glink-edge subnode will come with fastrpc as a separate patch, since
it wasn't ready by the time this patchset was sent.

But this is still enough to load the firmware and start the CDSP.
