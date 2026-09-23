Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BEA4A2A6C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168522; cv=none; b=OcMCjrmeQuCc2Bw001m1hWMqoxthMPOS5czaXOGAYd9mL8z52Ot2FjjnZZ3ByznsqdeLQT2C/q+Ray0WYxmAcJOtNFn+vm8a5kvlyqo4Gk+NF+jkDx+OXk9+XvN0SxGINbrCCsiRtcTvoFjHwyOyjWnxl5yjpN6crGQGcTUtbzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168522; c=relaxed/simple;
	bh=ryP4MM2q3ZaOLSb8YBJYkfHCciUpLA5qQC+kQ9G1bT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOjLef34VlaYInmLcxGgGBW+BVTRMY8L8oknH12EiX87+qMnxCRT/BpRsiJkNYV17/8sSHD+ogkpA9lB0VgwWoaU8ltczWp8gf2EDBno3euR+0Wk0RnSFbYJeOi52CFfM+jrb1pqnfa/oxIf2Qw7+T3Lu8SBPp0UyZ8FDHgR3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Umt/qPyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICmDucxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Umt/qPyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICmDucxi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSvc3295494
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09OEgRVsFzhh/5OAzejmGXnyO2HglXDVHYpTFACy2dA=; b=Umt/qPyuSfLVqleb
	NrCB8j3fD7DjWXJq1nvQl1e90I9VlC2QZ+UHPV8bpU7U3bv9hNLIevapbe+D84Lk
	2cXm/KtXrRoy49Qe4Zabwv/nusTV/MIW+R+ml3yj9f0LFEo6YrIEyf3Lt0Zka8kE
	Zpdwz96gF7/S5nN09Bk5UVhG2wqaqsuU9AIhSOHHZA2mlI0LsD8KLqFcMFh+R14s
	YgS4b8FPRBIOUrSfX/U/RX+xb8txaLPhoGOnTUo4GInQPceFL0R5Ngm1Sar0oXDs
	S8f3sBX8qL/pxreQYV1q6Y1Kz48crlQ3njzGFA0TfSbzvBcdao8fvzs/8LbAU6YI
	04NvRQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8wtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:02:00 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c3c28d463fso68150b6e.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168519; x=1790773319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09OEgRVsFzhh/5OAzejmGXnyO2HglXDVHYpTFACy2dA=;
        b=ICmDucxiZZKz5OHCritjkjofzNpiWLDf+zbBAUyRLrpVcBVOrOyh3Mp/BvXznd1x0/
         daOcBunLYCBUN+W8g4NSrDyjoIz49mtM1RU3UfRx53Yz1L4tSkO9IGrT8YBy4iSv/uNo
         IbZ/+woIRwx5SielthFcsHQ/S4k8j95Hzgv8AH2O/cCvu7vOnKOdfF+5QlcFR9UbnEiO
         zpafbE2yMe0UoX35qfz8nWtY8MBEtWUtQfXIQKkxyVKB1X88i+5pkg3/eV1ywEw7mwAT
         U+begRRVP5P/Xf7icu0p4FIgDF66lfKSNiYF1sG+Ih9J3quuTPsMTXow8H89dlSfiY66
         xtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168519; x=1790773319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09OEgRVsFzhh/5OAzejmGXnyO2HglXDVHYpTFACy2dA=;
        b=Pvst5F3/MgWY9UnIELCTIFI//gkM8YuE+6djQyFuA3Iytts4z9INAymE/5JUW+N4lo
         gZLi5cq3x8rcx+RKXBHs9dEeYz+PCY9K9ThT0v1oxoL8E8KviUbsxZajDqqe8wbVgpj4
         Mfl50uw4d4Il1pxxyYMTY2ffaKybc10XeedxuxMkGF4W6F29t1zrZ3wCDJVvxUNaVMhi
         8NPQiNGLfnY1yuSc9tx0VeM/cHqAt5QAbBgKIplWk+m2TDS7LNVZvKRpR204qFHrlxYk
         WYmzBM4OHc5ipsNaYPtFEb7Lmm5bt559sz+RndiOkNZpPOtx57ZwtlaKX8gZVfkwYgHS
         tY/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzO7oH4BGjcc+BOqdH2w3+K4ep+15ewVaSvSCcSKp8psIlgcEKu4lo6sAFR6sGBa6adh8DVHMDaVDfv@vger.kernel.org
X-Gm-Message-State: AFuF++lOXkQAv2jlNGyMi2boUaLxXFA44rSM3L9u61kXSGCiWhdhprIe
	hYV7g/eHOuGsPOFnw8wrs5446B4OiE3TCduhrBXZjOQCPr3+BW5D1uC4t8Rfv5p2tOLhE0aIdQf
	mYo+FWeASlTdLl40dGIlFlW6V3wZ/WB9wOHsL7Ks3JhmdXXjv2FBFXCq3aRDr7LoT
X-Gm-Gg: AYBFou3FCSH0dOHc4EQ2etBiSQh0+ZWnPa/BBp2c29dapW5KouUvcP3TuYXtpmX1psS
	COQqoDX2P9zoBWivl7jlcMzyzdfVLq1tr6KDMJSVqelbqptRzTaNxaznwtoh6FiFHbdErVFu/5T
	Z8Yb0TvMgrtQ7LildQlzJnu93HAvdOszit2qnqqYaErdgUrsxrrQMJJiRaH0FkoTkXj6PvQNC4C
	K7INixteQFOQgvuGh6kpFHR88I/SDbTZcRli4JCHh+bVhVY1hw2IlH9u3oH2xYWXXGuqOXMm3Yk
	q3tbTB2w7lzkfRuJLMd41hZt2ahEv/G0t3fHR6TQ+vDiyv9Jm2LwvkY4qqPAV9za1UYA02PMi/4
	DdZXfT/vQieR8wjegT6UnpQ==
X-Received: by 2002:a05:6808:2214:b0:4a3:f036:f3bf with SMTP id 5614622812f47-4d5b6397023mr2926995b6e.1.1790168519136;
        Wed, 23 Sep 2026 06:01:59 -0700 (PDT)
X-Received: by 2002:a05:6808:2214:b0:4a3:f036:f3bf with SMTP id 5614622812f47-4d5b6397023mr2926926b6e.1.1790168518613;
        Wed, 23 Sep 2026 06:01:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33d7e0sm115494966b.2.2026.09.23.06.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:01:57 -0700 (PDT)
Message-ID: <77e0b643-1e7c-4dba-bdd1-8cb945205b5d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:01:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 5/5] arm64: dts: qcom: shikra-iqs-evk: enable
 both Ethernet ports
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX8Qr7+fTu//kh
 nQ5NR2iWpHZrlvqNTBoq3LG3vUVUF809SOtvDx2VzTRdwirdDF1ksgfGzTLiovo4Jdw6wOPDmdu
 G4FI+vcaea1nYH6snlYDkd1EZp7Qnq8=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3cdc8 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U_cLpEdEjkfHclHzYWgA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 0W_ciLggJ16gOdfNLwbCAdL7embJBqIX
X-Proofpoint-ORIG-GUID: 0W_ciLggJ16gOdfNLwbCAdL7embJBqIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXxaybwzj+FaeZ
 EMFyGcXkRdFpFEl9aancuJ9GaV+D2O2XpkY3wikWxY+H5XOhl927wHNk2RkX81Vfh5SvlgUNi7G
 bf8JMAfsc7IkmIePdzkF80onAidG8kZOqfNGH710IpyilAmOzr9YxCwrLxk+J3m0ANKbPIxE2i0
 rHWY8/sqUyYQOnkHtm1YiDMmRVK7e4aaWsENqywKNaZxKFVOh5P7GV5Yv6uxCmWqlj5RU/alDOR
 794eJjcTgoeFvi8bz+zHWJPL9vq53bzDh8HCUy23pVZA471ij1DtiPp7Lx67OVDSELgsSJuYdRr
 XR5DoKKAXwBMKlI+6cP2POkCg1aErJQ4/K8DhGCR1uOlgUPr4SdjqgLaLaYko2zVqlwT+JtAZTk
 jM07BZASKXUj9qK09aRdfKaqcr7D1jKVkZ1ND4GhpJ/712AvKcdTp0g1n+N+FoH5dnyUJpVp594
 rjQiOJB0zp9Ak1NkWwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Enable ethernet0 and ethernet1 on the IQS EVK with their respective
> TI DP83867 RGMII PHYs. Both PHYs are powered by GPIO-controlled 2.5V
> regulators.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

[...]

> +&tlmm {
> +	rgmii_phy0_pwr_default: rgmii-phy0-pwr-default-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	rgmii_phy1_pwr_default: rgmii-phy1-pwr-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};

and in both places here

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
