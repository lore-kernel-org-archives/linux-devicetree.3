Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8D41DEF9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339050; cv=none; b=SoFedka++fL43Lqjge2KWsly3orqis15Co/70+11GFiQW1gVATUuyTHpsy3N8eVn3H6iPNGyXb20xFI0jTvPzqo2ez/27V20d+2vS8aHYoz4UxqmPB8uz5auxIVyslODLKFC5+WcY1IVz+rP9XZJ2otrKWneGsAPHLluNfp8+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339050; c=relaxed/simple;
	bh=wDS2mqY26T3CGm8J28Ht6S/UzddQUEAWXzdhe/lQL20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCzKMllGrqCeiI/vRcepaZfcM+WwLhJtdNDp3XI/vYNgXVO6Jn7mlsIynyV46py0IAP5JNAGyVKLl4F1iR1QLE8t6dJppdh7GNmWzk3i7nbIbMPHWSkFMu5XXF8WCTIZqgwRB5nad50X7SRXSU93r+GMSUm3hXHxu4kWErjgLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/qAKNWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkmaABIS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/qAKNWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkmaABIS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOBM245771
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Me0MyoIVH0sMpm7In8imokOusfmHoX91WUrEBl0XvhY=; b=N/qAKNWCJReerKQd
	MG1oXaf66ALgDNJYwO6KL0uN9UkbwTMP9Z5uh+zco7rJIt8mLx9Tnmu+h37yegHU
	UoUAys2+/DmjuAxdRY0f7dMRxs5WmBg8+iAzz+KbBuDIaxUa++bJ6KWbbl+HXCPl
	SldcwQpsb/SXp+YoFAeCJiIL96sy3nAe4/HUc36+4+6GbSx/JFzUSh/GuMHOavbW
	g91BOv4JyTtycRS/WVh1P3/X/lW1g9use6HdnAh3RNkZa3V7LBku7gobesMGDtK+
	H6FgT0LJtnpLy5nNacRX8x1m2a3mzdhhMQ+W88aI197qwgegXBmbSLC4RHmDi4Re
	Dn42uQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gd3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:57:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so6935181cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339047; x=1783943847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me0MyoIVH0sMpm7In8imokOusfmHoX91WUrEBl0XvhY=;
        b=VkmaABISOWTL/N8DYR8thFfABXBDwE+Yd/y9RFJY5NM9j4CmoS5mivmDc5hst+nVW8
         /PVpGYRfjkMQq/Myq0mEhe7CBVuwZSzr2DyP7yBbAiDcoZnehddFB4Hb7yXDw5/Tmrpi
         Av/y63ODjvpriXwdSAYj8yqlT9at5yMH9lZ71FO3chkX1bG1u2sk7cbgHfjE2IN1AcAz
         +2bAsbd35cYQk5pQRV82W0GN1yNnuTmA3eGNFFm1RCwGbbU5GdQ6uAvUkydga5HPEBRY
         JbovbPG4fjB1PujljfaZV2BD3TPxUOF8QAgpEANCVUOQAGb+NWbQ7zqj7+C7KbOWi/67
         A6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339047; x=1783943847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me0MyoIVH0sMpm7In8imokOusfmHoX91WUrEBl0XvhY=;
        b=sjZ3+/u3un4AtYtSZHd4lzEzP7BpMsOT0wq6AJRLnnQWn5T6FqQyYZPi9pLhBmTqse
         Tn8uOcs1OqGv9WaMJwMqUjQWQjYNzjwy0n3V2uqvFY16aXwO7uXziBnVG/fWVJHUR1R3
         YJx5Y8A9ssCvnS8SpACFVLMyMX+6QcsEsDvemTzleNsJqcVAQ6CHIwnPNReGzfgt5XlQ
         QVjvQwCdh6z0CTINJEaMuN7xUNrPsjg4udQ+Uvvx9W7tPWRYHzxjoQtT/FTRGl4/DrjQ
         qyP+o0t27tbnp+Wv7hkz85C7iyWRSWNh9cCFBXGajMb/CSFfKVJ4ce8HpoAkzio8Xvm8
         1/yw==
X-Forwarded-Encrypted: i=1; AHgh+RqrMJHitxrQdT3K03cw5/RBgA934M4fAhTrxqeMk43nnehVn/qHZiVQZKyRFSFVvwZhCu0AdLF4NI0X@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsp6ZWxN5CyyP6fnDUEp8ipEHrc3am6ASyMBWCFQxrycrtaeC
	wUui4vbwIpODmVmhGT4CaikX8KfJWVWj5V7htEuC0VyhRdgIy2qfxER3eiEBIMUqcFTA+m8thVh
	UCusyzq98Wobue7jiEc8Hje2SrR43AJsxSkrTs9uiNvoMTJ7B4b5qcHGsxV8IlLIN
X-Gm-Gg: AfdE7clFej0RfTxxtfQBfstdcmRmb9sWyEMFkgA24H2fyz8qJJrfplTNIItEh9H4yaZ
	phmKjRZSDETseIb6J0WpD7P3EFgcpp0h+64HF+STeCg/JDxjiE3VPthGQujKC7cIe5s707mFFlg
	p+5Yz4u5ciZyvhec5wr1yCV1LNB09aErCxqqL1FNLS8dCWgGJpztK1bXlDpbVtfMHvL3cmSCkTw
	TLTFGyLAnsdRNv+wOhIIqSgKjaOdiUvMa5IsI0NEeLeX0gMgFZJWfFAUbGkudKVg+RHUxhyaluC
	FVKesFsGlNrfT9hd8kMVOi026ntX8B4kb6sM7pfdNHv4EQcN6Avzk3Tn8GQ0neVg/EsolagZKwF
	3fCSMtqXm8dtPaf+Eb+QIulRW+NKRuSpBWPg=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr89588241cf.8.1783339047278;
        Mon, 06 Jul 2026 04:57:27 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr89588051cf.8.1783339046794;
        Mon, 06 Jul 2026 04:57:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm729266666b.42.2026.07.06.04.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:57:25 -0700 (PDT)
Message-ID: <21f13da7-94ee-4eb2-b2bd-6200d70f38f9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:57:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b9828 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yjWOilcczNxlq6oZqccA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX3QoLoGO7R0sQ
 fRvXraRP97YbUX4jea0lHeUCeMxvjl33lQWFR1ipEPEG9OB3Z4irbfIiapj3Ia002zBzpGLox6X
 y8bXVUg4rnNwwDY7cFK1vN3xTvNArp58aBppnfq8pJ2MD3UaJn/d+Eja+Phr1XfCxwbISAS37dh
 SWcV6++1xMG+JCWNb5lEnEZ4t9+P7ERs+Gb5KAi0CtQP7vbDaisdCAt8+Jynx9XNCaShWOZPUTd
 tTavsQrLEI5PBk0sqW9iq0Z1Rst/SAi9sMstVSj4bOnb3gN8JLNWBmwA/s+Dyk93SwZFXpjtxGF
 R2xwSt/w2TL2Enc6zvi06lOp5QTF2B9IMhij+UDkH+b6Jtoz0EBs3+upYTQiFjvW7kUkYS2lJzS
 1KhFHPJ8mrUFrzX4ti2hbKxjs4EYoTlrcdQKgKeGszPqVtUB80CKwnLcXf7KNaGsUa/9ZMYAWEi
 5CQoFdxHx5S6OVRqqzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXx0zGSY4nfbb7
 bA6zn/uv3ODy7skYWxFJlnoUrxGPjm0VFVJ8SSJWL62b5HuB8lsRwfW20zM/udyEDTz/u/X3o2j
 Y26hyzVkTKawMrxCylM7J0E9DJV+XKo=
X-Proofpoint-GUID: MkSAm56HvTuoIJAApD9t0LenPLAhE88D
X-Proofpoint-ORIG-GUID: MkSAm56HvTuoIJAApD9t0LenPLAhE88D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060121

On 7/2/26 7:22 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)
> +#define TIME_WINDOW_MAX			((FIELD_MAX(TIME_WINDOW_MASK_H) << 15) | \
> +					 FIELD_MAX(TIME_WINDOW_MASK_L))

I am having difficulty correlating this mask to the register
description I have available. Are you sure what you call
TIME_WINDOW_MASK_L actually exists?

[...]

> +/* Constraint configuration */
> +static const struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SoC domain constraints */
> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },

Similarly, these offsets are difficult for me to correlate with the
register names in the constraints/0x0ef3_d000 space

[...]

> +		/*
> +		 * Enable/Disable PL based on the value:
> +		 * - If value is 0, disable the PL (clear enable bit)
> +		 * - If value is non-zero, enable the PL (set enable bit)
> +		 */
> +		FIELD_MODIFY(POWER_LIMIT_ENABLE, &reg_val, new_val ? 1 : 0);

!!new_val

Konrad
