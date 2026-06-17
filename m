Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6093BFE3A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695199; cv=none; b=oPSe7lo+iI4DRTnh3NsjClfLGJtc0T82iw5VDM/2NRNKxvTnkm7Z1u7TkUZ5+UbMWhqdzB+Vbs0nMThvzBfRuNwA1WM5adNsMKkABNXfcSG0k3ZPgONMt2TIAVqZlmtFoVWs6wNdCAqW+VE0K/GrTqkNZXL+VMHkHIOQ/+OXugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695199; c=relaxed/simple;
	bh=N7hQ0ve3hQ0taNvLoev6ThCQ+wIGyMmvtRFa9+rvnPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOWqNBGbOkZHVBKPQzjRXXCjPLXoBIAePYfLJ/SQtoEt4KQo5m8l68/5ZzsR9s6ICjDFGJuKauv/o0ptLJQta7dEDXr/om4vACbGYxOTnVeJgYawouzRIQJRTiPSue1xplx8GOlMk5JoLsGjZ1RGU4ZapYGSVn9QZFZyn4hoSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrdRtrR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqzagMxn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrdRtrR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqzagMxn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HBAhUe2635426
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4kk4bGDUgiuSTAQ9QfRGI+PUxx2rIh17EttmS0Tp60=; b=lrdRtrR1V9NN2StA
	7MjqMLTMNbkWUcn+RLbOkFdmJNAFeUYdBTqgzCt4STG5p+4dZVsdSLlWuu1yfIrN
	GKnS6b5sDOmduH6o7/2nHnzw5ZeuwQ2mpQrKzkPr+Ac+J7APPVFWEVDbZ9b/75yk
	9fcWwihVahJcxWV1RyjcZjUNhUxUMXMdAGIqOan9t0gqqUfT5eEP05yd4PvIp8gD
	5ZiH2eZrAXSgiIoH/gf9V7GLtGHJamcQQOfYf7w6qs7GTACIlFdIn1b/4aY/Ywe4
	7pWxfZED2z6X8mw8Km8c+rrAv+N6lQqzvPkCfbuVEOoe1Ef9COuoioMuPx6DFkvl
	HtrRyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2awb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:19:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-917fd2bafdbso97006685a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781695194; x=1782299994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4kk4bGDUgiuSTAQ9QfRGI+PUxx2rIh17EttmS0Tp60=;
        b=CqzagMxnnlSTwTV2s8OTetIzkBoiYbVAsEApaP7UkfA3i1ilS0IgRSWndVFpDZ/7Co
         hWqjCCMKc834HGnD9jplaLPdOURsHmGxaVuR9Vv905IlyDRVt0N9UCCz0NucKn1RVIqS
         Frm4DGm/Re4uppLDVcqWcdew89yin1ADnT99ZkG0kldAGm0cQM7dm5swP3g1BUSnQROA
         PZEhRWuMqvQ1qMb2r4aqeqkXFjlAAF7c+DpUhuDnqSabOOo/0dUsGMQ09LKyRZv0qKuq
         lyj4YubPjuicmGrtQMtEjqLa+qaYJWwGuINWeGoceWxFe77pO7heRJeWn/8qiskVcsG7
         2DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695194; x=1782299994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4kk4bGDUgiuSTAQ9QfRGI+PUxx2rIh17EttmS0Tp60=;
        b=oBo0V66MLkquekOxVN3vtzDi0LEc6VBGiMzDxRPIj6f20usMRO+S1cn+6RLSHlV974
         lhvP1CNjR/G0M20vK3opFLAH7tVFsefDPgOqvQKaYPCC1VV4V42frKKH2/0+E7c49RIe
         SWPu6tnMINJJ/bzaHdcuADExHA7Uty6Ke4ffkiXv69bvS1LK78KXFtqPNUNIu0uQeDlF
         NG4nvfJ0muXzKfJwyfldfit8yiju2wrcdCHmG14JhNdAdTZVH9fPhgIwIU6a39RrVJw2
         /8NeEtwFIsz/djTNB8Dc8xeTz/OtkFBLLiIcki1vpfzPU90nMr5cCnj4xVN5wDoU0ZaU
         792w==
X-Forwarded-Encrypted: i=1; AFNElJ9i6IrKrUGXEK2Hz5GddVdeKgBl5ichNPu74zg9W/p8+axb2udQuP5wXUrHcnC4I95vWRe5hvYapsuv@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcVs7usBvASbnVbDjNROl2vD9HosBsjD3Tbkx2F2XtJIv5D3J
	TM4TWaFBsoANPRx2RWiPBqAT/EMf+LllD0/btNMP5u7GFADRkeuwbP5gZB1hPucrBMiur89uyD8
	PzxQuZNI6J1eYiMFQwDaYK0XKw0b2YbUhUr89OaWpagC53lcxxm7XMk5prIbVswJx
X-Gm-Gg: Acq92OFRMEM2xXjkfWgEFCFT2s+xAbhmFaHUP8MX9VDoUKSWLuUFOBcpkTFq2gXfrNu
	OftNh7jbGprKLMrBdB7/bmEUkKydCQOwYUCTa+xVFXKnN5MQrY9f4zzfn22sU2glyDrTYKhYaw5
	c1UfQDzNXsBOgbk0nHLaBq8L6GEhwXEkWI2gN+WSe/9c2h5IKqvbSRy40RxMRmkCNfnBbjSaXfZ
	KGA/OffTdlodzxp0NrqS2QyKptfPk5ShfRShpdy5+U8e2yitQOqy6p5S/VpPxtNKac3a1QqxzxY
	HUXT+3RiStz4BLKXunLT7otQty5dq38e4BROJrc8LHEjISkC4MTvTkEQ8/xXTzHjqBaP9t2C6ea
	zwN6eO2vUOjZf5clme19yJeiHS8K10RlnT/4=
X-Received: by 2002:a05:620a:bce:b0:8cf:d953:b4ec with SMTP id af79cd13be357-91d8acdc2e3mr370448185a.3.1781695194291;
        Wed, 17 Jun 2026 04:19:54 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:8cf:d953:b4ec with SMTP id af79cd13be357-91d8acdc2e3mr370445385a.3.1781695193816;
        Wed, 17 Jun 2026 04:19:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b54asm6350689a12.3.2026.06.17.04.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:19:53 -0700 (PDT)
Message-ID: <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:19:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a3282db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yy-yr3CCGAyhAjPN4EIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNyBTYWx0ZWRfX7c6nJSXGzdEc
 4PQstRHM03yXwlOo4WRfc8Yz9Cbivko7PqlANy9uD5GfOSkkwRlqjlM1CqCxnl93DnPfpuZHVXk
 E47qnfDh9IUKvwqTFAStzbITo44BnCM=
X-Proofpoint-GUID: WFJp0_VzJpzc1DSvjDxbKHma0vi4wE6J
X-Proofpoint-ORIG-GUID: WFJp0_VzJpzc1DSvjDxbKHma0vi4wE6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNyBTYWx0ZWRfX74x27fQ5hgoC
 VifHEyEEs6dI263RzDu04Jitogt0WW3i0dJNa1lmXyaNn1i9r8stMR2zQnIoUQ/wvsTjRrEQSlo
 b3dZJmV8tth4zkQvvPsrx3HUqfr1PjomFRiUcQ0OfyHMpVVd9wMXeTqAEpLFWUOJMC3jVxuvjYK
 Zrdl/PaQVA4ioukSLUNowFC0aEETm61v8iTawcnu+ZkcUcUgsUznp3TWCrZOFdQ5Vm8ptaKigs5
 0KmH6Ue8JlJNnFa8W5yjnha3sE388+2ieHLJm/zamjlakW4Bmc0e7eVOYzCILvGi0sImqbF6SFj
 erEUYKigxNnizIvLFd1VEFc8Bjv/DxPY5oY0I3aoiXcBCjvBvq/O2wR7tZ0KnHzw1KctRu93YAY
 g6k7Mu25S58wbmAlZJMr56vpdwtkDhhcCx1uOU6/ArNWCGMN9ooTL9N1cr77riCYj087Eeccvrh
 q2s3mmUhgY5oThDjouw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170107

On 5/19/26 7:47 AM, Qiang Yu wrote:
> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> nodes.
> 
> Update the DTS wiring to:
> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
>   &pcie3_phy using two-cell PHY arguments
> - configure the shared PHY node with link-mode and dual pipe outputs
> 
> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +		pcie3a: pci@1c10000 {
> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf20>,
> +			      <0x0 0x70000f40 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x4000>,
> +			      <0x0 0x70100000 0x0 0x100000>,
> +			      <0x0 0x01c13000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> +
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;
> +
> +			linux,pci-domain = <3>;
> +			num-lanes = <8>;

Is it fine to keep num-lanes 8 here even for configurations with
bifurcated PHY?

I would assume so, given essentially this is a x8 host, whose 4
lanes may simply be effectively NC 

Konrad
