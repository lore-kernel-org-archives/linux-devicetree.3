Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597693DBD41
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789360; cv=none; b=FGE9mh+vkp83ZHxvegw1hPGIsedmIQIyA78mibKLnIlGtHidOwRnZ+OV4XyG0MuiikJcvo9oJ/fKaGjD6JePmV7eiBHrkVu6TovJJGeeTS0cWB7by4OghQ6gjkFaiqtD6O0bvR3qRjmS8w2+OMvhq1HMflN1avJoGOm0X/jaFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789360; c=relaxed/simple;
	bh=mlHHjNKGYQGNjY5v8lTGaasIrG5x+Vk7zbuAseigc2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrMLvBOSVUVC7xfeSSrckrMuADggOQ3JoygHpK7vhDjNLK2of4mM7jziiZBPnmSliUE+o8NJwA5WDqYbXmUtF/mJ9NRXK4E9e3W4s8r1PXtDtWZr06ssQwsxn8dwvJ5GABFxnpAyfYTazb4XR4/iwHfUEPsHSHpHueP8Rbw2xBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDYlyd9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvZmZF8Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDYlyd9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvZmZF8Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICs1Pw1320090
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbTxqabv9BTt+Gi+0SMc0DCQCI22NSxs9fC+qa6TN8U=; b=KDYlyd9hT1kV3IXt
	YW1lt0/NinbcVT1I6plb8ipoe+bcPvdBnLuaibWd7nm51B3msTTiWq0uhZ3K/q8j
	WQT0A5XVXkQu5pd9KdKKTsgVipgQTl9LTh81rUY1xIpAWYR+dbX276OfkSHdEk0U
	5L0u9hZ1QIfdDzVSqPq4XEXUCMZBDsnD3jrsF33j0h1g2XsN5rmuUG/c2vhsIbzc
	OpGDG8u2ASbNzX9r7p5mQwUOA/rlosxQ2Rmzqs1kOEnJV4m51EEGu04K/qUXxUlT
	nToiCdq9EaAvthp9tCBrIUmnDJfKkBbJ3DOAdclLANc0nL9t1u/Dk5LpLAL4Cwv+
	m4LB0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2ccpbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:29:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157b3e5182so11614085a.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781789356; x=1782394156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbTxqabv9BTt+Gi+0SMc0DCQCI22NSxs9fC+qa6TN8U=;
        b=WvZmZF8Z/f23GfgBMyXn2vQv9ixk4FbbMpi6kwDz7HV3iPXnD8uvfKXR1NHYPj3dgY
         Ghmr+f7xZVhFVPWcbgSFrNbTDTlm0gNiPH+/yzj/WHIxrMMJsW8d83qKL+dElKdFpz8I
         vUAvPbSniTvI734HGTPKMPGJU559Atd9fRpVrGeFu1Cel2uKLHSB/SjrLlgOxqBy9kU1
         nYkZe/bRNYeumcPFdSzzNNZMhv+TcMtjXxv4FeM8YH0Kdv3hPJxUaRwXlqihyEQNMoQU
         Y/RNVwo72XluvVNNJCgei6hsWHVTLQ6ZEI8Bw4dDlXuqvS5/LmOPOQPTzLv0GazR69ic
         Z1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789356; x=1782394156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbTxqabv9BTt+Gi+0SMc0DCQCI22NSxs9fC+qa6TN8U=;
        b=hjzz4x5j1rtHfUJdJ/2jLxjGBsHiCeWn/x5ljzMwzhI4LoIMp1zpKnyqisZyZ+G62d
         DQw9Dq6bjhacSpdmj7Ja0F8DJY8ehgldb2ALkgCYDAKr6cidTlQizVHubnHH6JLhdsMV
         cRv6UxAEaiXraf8J5cC+z7C2f+Qpe8DXfV2fek171HIZiHn1sgaIVApXtowdqypbSv2M
         hF6vGonwYyR57WmJKaYws9UrJ9gmkUdH8s8NZixFSUn6Vk0U2OtxqTRLgipj5uXtyRrp
         VzaAgJaaD0cTM3f7htJDTs7Oeg+NWQ/o6dU5a8jwPpdR8xhh9n3Id1JH0Jw3W8jczPTY
         txnw==
X-Forwarded-Encrypted: i=1; AFNElJ8mqPW+2D1+bmBzSQpCN8CSnHxQVUSKBggpxcFqZB2un48H/MIhVFx6sXfkUQIxc418oA42yb0UlSDP@vger.kernel.org
X-Gm-Message-State: AOJu0YzMDvj40Poj3tKA7hAq5EbLvTEaI9oszhAATq/z6/2+4q2a6VwR
	48Y/VDFc0o/z2eWFLtGaRSIKSkPmxEoaL6F8jup/TrYRZIRdKxuoOw0wY1HivgQ1SAC+wUm6UL0
	fFzwSyC04UB14/9xbxb6GETIlnU5W2Qy9yK6S/14zEi/PUiGXPmdBTjDQvvU6AG1T62EQrzde
X-Gm-Gg: AfdE7clznCA2HwERnwA2jM+zYRYaFT57zx7DJqx/MkxnNz3JVnCDtDGLuhsmHe0VRyp
	BYqaGkc+ueZAI7QUzRtBNWjd9X1yyl5g7YCTu7Q3/spSolO/mOmtUOC8/FKwRt7T343h7lRqpUp
	AyFipt10Uael8QodnIJ0NvOR4Erq2BxAeefh03Otc8IHJ7x8wyrTPZ2aBZrRPs0EKrpvIGdDzMw
	OrTjsEGACdm2EfpTyXbkfdhDqy4kASKyu84SoPAAH7ND1sWxkRULfbpSJx6Ob1D7zw6saUuNTu8
	3Eu8RGYFZb9ESt7Wm7Lnc5XX6WapDAZJTS0N2MwlBL+NJgNMFMFdeUfImACWdksztAkTzYlK5wa
	clQdPb3lWgNUN90eCI3BLWa0oNJwkqJJp9qI=
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr773859385a.1.1781789356358;
        Thu, 18 Jun 2026 06:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr773855085a.1.1781789355838;
        Thu, 18 Jun 2026 06:29:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c08234bf58dsm44455366b.29.2026.06.18.06.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:29:14 -0700 (PDT)
Message-ID: <18467cf7-a487-42a8-b2e6-b994da8ebf0e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:29:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-qup-pinctrl-v1-1-8950644af141@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-qup-pinctrl-v1-1-8950644af141@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyNiBTYWx0ZWRfX2h4FJdH3WTqA
 xCTk/o+D0nJ+k7KGKqg7kVauMMJvtpaIJMipKnPTnO7y9FuPdBlO17Ta99oGjPxiY0QP6+lI8o0
 u3lVA9IknGyfL5Ii6eKv+U4hiPVS3yBoklIYRhxBH9bQPPz2tEi6PNRQ4NkD4o+mpEGSPS4VmFj
 bQ6U3fdSvK8WTXnxmEO/+7YrIZttHzwnaN3UG9CxzUakrX+CYbyOV8UDQjRt34YZWzfEvMpIN0U
 85vgHZYtYGPwQiThdB1vVrG2yzQYpuY8nb61an1hTUEjdmGtD4tF55102NqXKk3rI6DcM1tbkg1
 t0M9mGRK62OR9BTRxb/+cjvd1XLtnk0M/U2jjV5Ng520XbrrsGo/wzVw5t25fF5WEzBJWCMr2Nx
 STOOBHxREx01nQrUHvwYE7p4B5Y0Rv+d9Nl3agKAULtIhD8h/PrCnbTpF1JweO4xQXQPtmNEMvE
 BLTsBCspyKb2haeo8hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyNiBTYWx0ZWRfX/0LmA3dyUiPN
 HyiSMuUvPe5o7cENlxvpJZ0/kTi1mpPAUrAO54JDzUpGtIOqxnKfxRI4La+a/3SK0cgSg/ybma7
 KQOILkg09rS2vaMDv+VmS+YmtJB3nQg=
X-Proofpoint-GUID: ZxnBXjr-Zv13eV1eyPsB4J8vEcwB8Rxu
X-Proofpoint-ORIG-GUID: ZxnBXjr-Zv13eV1eyPsB4J8vEcwB8Rxu
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33f2ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=Q99fjW5FZU2odprlntsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180126

On 5/7/26 4:44 PM, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.
> 
> Move UART electrical settings out of the shared SoC pinctrl states and
> into the board dts files that need them. Update the boards that currently
> duplicate uart2 pinctrl definitions to reference qup_uart2_default and
> override only the required bias and drive properties locally, and do the
> same for Arcata's uart18 configuration. This reduces duplicated pinctrl
> data and keeps the shared SC8280XP states reusable for future QUP users.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +			qup_uart0_default: qup-uart0-default-state {
> +				qup_uart0_cts: cts-pins {
> +					pins = "gpio135";
> +					function = "qup0";
> +				};
> +				qup_uart0_rts: rts-pins {
> +					pins = "gpio136";
> +					function = "qup0";
> +				};
> +				qup_uart0_tx: tx-pins {
> +					pins = "gpio137";
> +					function = "qup0";
> +				};
> +				qup_uart0_rx: rx-pins {
> +					pins = "gpio138";
> +					function = "qup0";
> +				};
> +			};

I find this overly verbose. Let's go for something like in glymur.dtsi,
where the common defaults are defined. I think we can even keep the
bluetooth/4way-uart configuration default as 99.999% boards will use
that

Konrad
