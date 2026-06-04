Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C03F4125
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563490; cv=none; b=PlGFCUGnzEvkyUczahgDKr5Kl+1AKEeAaYNNU0Qi6/4GletyiI2e26UZxnr5s/z0pa04rEnS3StfpNWK6b5YVi0avih7z4pq8KSAGlIFglnob8MMeEO4niWqvrQBut641g9MZ8jqHRrlmRZSu8/LUq7n0ClVNbBn8zOfpNMiX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563490; c=relaxed/simple;
	bh=tTiYS27nSnpEKs9wnlbHd155zeIpJLCxQNIRoDP37HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RT1Eu+uju13UQF1UIa1FOIytpiAd13KSFH03W/kH+zBOD+RSk5Ct+/PuZ4jHYElxT3fwRGwmwKBjQJG6THWrwcyHXEEWFPyQzGodFJw62wTUN2XfnhK8LtV3Bs0SKzm/AtMFP6uG3oy7Aq0tmnRkGd6FGg82QykcP5RPr+8eqFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdryVky2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaEFArcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdryVky2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaEFArcx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543ctIY3234472
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrZ00qlB+fsN6ClHGlnfNiEqXVZZKRHWDPPLYfu/Wyg=; b=BdryVky239977hUZ
	/hpYhIeCEFwVlgkaWv9LZprOGTTZeQEMaAqmXvc7hgD9XrEFg9sqEyeAk+kHzgNH
	rpGT5Dye+KDplgfwhrleaTF4L0gmbP7jinkp7ob8DWmvhre0HOCABHnWxfEqCLr7
	TRS6/YNzC5uEZ/bBM04mmG3Cs+L5egD18kP1+Uu2WPYR3wVJg9bAoSi8osuaADA4
	7Yw6N+7JBL8nhGByNhYqYhPTS9zSHv8j/Yyx2WgOWy+1uLjAiZEWz5PAE1VC7c6F
	xE01tpdSyzlf4yIPjwrQDvb0leA3A+a8QiUox9mnBHQeeLpKHo6PeGi5LtJmtYIN
	TENIVQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s2v3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:58:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so307153a12.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563487; x=1781168287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrZ00qlB+fsN6ClHGlnfNiEqXVZZKRHWDPPLYfu/Wyg=;
        b=SaEFArcxkQw91tohEEttkfPE4EXm+T+XMSHd8TSZ1C+qv7EEpLgngfxX071avz9NIa
         E12x6bZe0+/r7v33vC6qHNP7yz+T49+GXl2TdTfYBYlXKBFjThXpcszLaplI94nkqZa8
         u2hQBhf9UOW2/bM9ruptARX0XcI37AxCU6LpTnntrM3h8wYE29hZqKUfIr7aD2pWFNSn
         de1b6LwO8U6p7St9m69UDs2RIYYMnTgFFh1alHdnZ92ExcOMZznhpSXSUCaVCurIiaOi
         AXE6pmernT5CX551DZja+8CB4YYjQ7nr8mVjTZjqGrh0gg+xsBWhrkn6iGVDkLBKtknW
         vdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563487; x=1781168287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrZ00qlB+fsN6ClHGlnfNiEqXVZZKRHWDPPLYfu/Wyg=;
        b=ioigSEBkpYNskHq+IGcL9G507FDOqXz5PigM2z5fbxl9CBvG4eoz+Xz5Hy6yEMO3CW
         +WkuVTqEzdT5zkl0K5NBxVJM0HCy0oQhWcCDx/q50yychztfrBc0IZhfchpRV6mkXjbH
         189vKu1fF7YYByKrnAOFr72gIob9E+vtzxAge48/iypmMj8zwEdYzjpht5hxm35CLn4n
         fL8OTP4ay7D6h2jzEYxE4h8Tc9qDJqAesrLtivTKVExUjL4KuBYPk/Nc1T3YXp1msfZS
         5Bd1tMdwbqB/W6kx4V1L+x2OMYoTsh0FjxfpnPxf7/6lO/2n+sNbx+KoVUTVpClyS8US
         L4rg==
X-Gm-Message-State: AOJu0YxzQ6pSFXKVYBNGRmpSpqWJcTML+kbVn/77uMpHxER72GCI+tD4
	F5OMDkSFEkDmHl2qzXXseabQq+5YRqycqMMZ1NolD9HFoBdA2ENf6Wb6aZToPJhgMTlbgetG6n5
	yn9A4whvl7Ax7CeqbJRUMk0fR8Pf2oxFZXcOaUev+nMVQbYInTx8l3xLRriequrWV
X-Gm-Gg: Acq92OGN+zLjquqzM5JoeBqWygFHhV71jbFzmTG7D9AlFQV08Rd8yIZ6KXaEwkH2k8t
	uf/5MOaA9ugfc5FOTTq8xBPgV3hliqbHpPHg0jtJ+9B3Jk+4UDb8yc9gxWnFqv05D5QTgUumKkR
	+V8APHLGITAWEP0dIe6OJTEfjqa+h150FWDa8Og7+V6UVuiu8iWQQC8pE53WDT5gHR+kkpL+KET
	73rWKo+k640WT2Tp5YIkDOOUGkTLba79kkXk6xcBmdOGELjb9vcCaT8RM38kJ36X9ARw5if02wt
	M8REEnne2O0STedPRIz9twyoGEWtBn9uEWqCw2AjEFvc6BjL2qC7G4uBwL+2I6ixUh7NJpG4MDm
	8ZSiaV1RO0Mmlc/cAR8VEoZ+WRXjnQkHBzPZKu0AvjtKhdUATF8hHFYP+L2Q6cNQrvBSr06X4MC
	5N
X-Received: by 2002:a05:6a00:4510:b0:842:7324:e679 with SMTP id d2e1a72fcca58-84285015ca2mr6666490b3a.50.1780563487270;
        Thu, 04 Jun 2026 01:58:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4510:b0:842:7324:e679 with SMTP id d2e1a72fcca58-84285015ca2mr6666464b3a.50.1780563486722;
        Thu, 04 Jun 2026 01:58:06 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882156sm5250343b3a.33.2026.06.04.01.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:58:06 -0700 (PDT)
Message-ID: <35f1ff50-74f5-412f-a52b-9906fda0edb7@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:28:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <20260602164512.9F1CC1F00893@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260602164512.9F1CC1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g8zpzq-YQ4epQExa6vSceESyHgiKwtv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NSBTYWx0ZWRfX1fzL2wioDMm+
 yEyDnsNc9FbsakvrVIRPzyR/ADOaH63aY0WgKH0+OpH88DuBUvk3md5MQa21XyBiqwexzFK2lgv
 P6qr0k70I/Sn2XamSN46grbr8/gmknOzEH0wZIyADYaJxry22hC7/Zehgvq5CauZ/L4ZF3vzfm2
 JpY0RvyaYVuk0+gH3DuuqwkQaK1oLuk0A3vEkRfI6kXMe9x7ZPpGa5dOO/Zaw6/3qmebomPnGAo
 drNon6gRhM6zNDUljI7uewyOcxsguWXIu68Ncrv4BsOfKpJkoKy1Pkj2rAwtSpaQEGbuQkZf+Fd
 vjJKg/HFWfKEUdsA/sC2s72oYp2y9XdCOcO9iOoWSo61TBp4kFYCErdNhknlm921KiZ+6VVkt1L
 famgpMvRhZcdcDGJipeZ40ZK5HFePe2OROPhJbFccWT1xLlTguc9UV0Y61NFVdcwK4eoio//1pd
 qEUetD0LKseTTZ4Xr1w==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a213e20 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3c7NOeAuTJp5I-PFVUMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: g8zpzq-YQ4epQExa6vSceESyHgiKwtv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040085


On 6/2/2026 10:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Missing `phy_exit()` on error path in `qcom_pcie_parse_port()` leaks PHY initialization state.
> --
>
> commit a3169d2cae3bc2449e374f733bcb358e726cc377
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
>
> This commit updates the device tree bindings for the IPQ5332 PCIe
> interfaces. It moves the PHYs and PERST# properties under the
> Root Port nodes to follow the new binding style.
>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> index 79ec77cfe5527..7fcf632e289f0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> [ ... ]
>
>> @@ -46,13 +43,15 @@ &pcie0_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie0_port0 {
>> +	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
>> +};
> [Severity: High]
> This is a pre-existing issue, but does moving these properties to the
> Root Port node expose a PHY initialization leak on probe deferral?
>
> When the driver processes the port via qcom_pcie_parse_port(), it calls
> phy_init() and then immediately calls qcom_pcie_parse_perst(). If parsing
> the PERST# GPIO (now added to the port node here) fails with -EPROBE_DEFER,
> the function returns early:

EPROBE_DEFER will be returned when the GPIO device has not yet been 
registered, which I believe should not happen because the GPIO driver is 
enabled by default on the QCOM platforms.

>
> drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_port() {
>      ...
> 	ret = qcom_pcie_parse_perst(pcie, port, node);
> 	if (ret)
> 		return ret;
>      ...
> }
>
> Because the port is not added to the pcie->ports list until later in
> the function, the cleanup loop in the caller qcom_pcie_parse_ports() misses
> it entirely:
>
> err_port_del:
> 	list_for_each_entry_safe(port, tmp_port, &pcie->ports, list) {
> 		list_for_each_entry_safe(perst, tmp_perst, &port->perst, list)
> 			list_del(&perst->list);
> 		phy_exit(port->phy);
> 		list_del(&port->list);
> 	}
>
> Could this lead to unbalanced clocks and regulator reference counts by
> skipping phy_exit() if the GPIO driver is not yet ready?
>
