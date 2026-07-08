Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F0634D3B9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523715; cv=none; b=uKEeUC5LaByzfV+0+KSrjctLoogaK38mTRJq31vjjHUw95AOaD1KCdE3Q2WT71FOh1ba4EufmZYinviioV4ikFtjYJFVR1Og+KtoO77pDRmNCPaomeAHz5h8GFC2QHmZWZ2snVvhV+utRr9pBEw4oaw8p0cTdSCwENhF6SlVM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523715; c=relaxed/simple;
	bh=06pp6G3KkhWYzK+vY3emAkxSkwfpFDDYROrrg072vf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S22FOxr8Mn4pPd9WIaQI8ohbmpHrPTc50DX/EMMrEZcZ8u5AvwwwGRdJuMiFta2Ft5fWt6nomKwjzGm9ge5pwkvto3D7ewELeKYE3Jw6CCTpTck29QU6L/shdSKr7/K2myM+OSarwIFS2tW+kVtr6lFzSZBt34A03PJmgSCj61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zz0An9vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCkdRjvV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zz0An9vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCkdRjvV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Wf42727523
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Q8l08ZeJoDDd2lDvSh+I61vIGH6bhJAPIGzGpxtJ2w=; b=Zz0An9vktjmHRSAP
	uF4EvjhIlutU+oeYel5T+WPvSLW6oiNoLue5fvZGdKVpDX2gVHdVNNqW+EmmdFQB
	EVSbIOzksBZy8d9/U6FOG0ZUNNXkwj0EJKC+WM+pIhbzYNAkVxAwKnE7V0oHTQfO
	XLNnPvx6NRIKyOrvkdq186PP+YTR4qG7ZRQit5SAkPIxXKPZ+C5rn1ibLipZNZuX
	MGPIOXonHaf6nYTH+w/bZiY5uShfOJ7GNZjOZQ5/1MrAXzvC0gzKuzkVElRKrMic
	L1Fe35NGlXVzOr3Zh+HSlY5b4xxqP0lLS5SHZ/eOxtTq0jdu9FiVT8TKo25kEusJ
	d1Zr5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6ab91g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:15:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1634018a91.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523712; x=1784128512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q8l08ZeJoDDd2lDvSh+I61vIGH6bhJAPIGzGpxtJ2w=;
        b=ZCkdRjvV5geRgzTM/NGAA7pIGzckr2khB0Mf2AqqAyh1rjMFN+G7/R2015dNM5+oeQ
         XwldmZVX84OPD8SRCisFLWvSaYH1CcT+FPci59SWBbwZZCQV03Hc8osEFcdfzSnvMuYY
         6pPZMTNbLO2c+3fiJUbjH+BrH5wrYvK4vFqYhHg2AmNNZ4YTTbN913lWdByeaai1CWne
         3leYpu0004Y2ssSwMKix7dCMlac3YbUoYqMsmDW0Us1q3wGSen9xhyXxr8GNSVRcCZCO
         fxlbk5Frb9X/0O5f+XN9qI6jacm7n1BiNpcifecn/NKOZvsUdqXK06OB0prYhpOdIyM6
         L4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523712; x=1784128512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Q8l08ZeJoDDd2lDvSh+I61vIGH6bhJAPIGzGpxtJ2w=;
        b=iSOiC0FCxpYRpvSSH+Nbfxuo/Dz+fupmWZLCorawutp1/AGeJ2O8edVLAqtoT7gJYN
         Zxl3ewXjosSnMll5Yu8ZXxwmTn/h1mvGRUSlIINDXLeGlk15MRx5Z500ncrKD4ZMrklI
         +S48CvOq1+p0cU5iNTNSL4IO3iTwuCFWWJ0eKvEhhPPjlYXk7CcpspkzzmtGbQ7W7+26
         +RaGnCUBFlxZrNQKi0jmusRhV3q75KCsPuG5s7wgFvVvosfF0CMhbJtByeKd9PH+ewiG
         BhOORCSqIk/7w44TK0YJ5xIG37+jVCLMKMGKuK/5w9t83EaJhucaFCwS403CWDHU1WoJ
         k8lw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8u4Q3+lF+UZCYEC2fZLL+Ex8e+5c8Eq6GB2jgIO6va7yoWPOnNufiiszQR3K1DkLEyAhzuDitDJYL@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKxE/5PbnmKHT6qxhdPY1pgsZvkW6mSWIuZZiICc7ODSKjWL4
	suKGakTHsAha8McJLcHeF2m2K6PyWqA4RdoNfZt7+lN87HDCT6N4Z9tyFA5zaOFCbFKl2BgNY1s
	1owIFO4/MM/5EmsrYbVR17qAA+vchITY46ZgwpNNNw2O6DunYSk4M2xfpAWKAskwo
X-Gm-Gg: AfdE7cna5y/o0ke9FM1zD1DehkgKi0N/ZmUKP7szK4lpeiAHOwpx8BYsNxmrMo7S+nA
	EowiSAr4Fu2WO0bdyKl9jfG8zGMgDkpP7E01Ay1m/4Tobi752I2UpmE9kFpSXjncVSDE/HLMZCu
	z0H8A/db139KOtnDEV3dCkm5J4JBcmWaVjeBvxWCVRs+XSPf5lxeG5thDJrFfRETyHL2+HcWgrU
	FnBhH59hK7JZTyZR8KaCkebDtTDJK0/vF21+LQLMB3YTn85c/jwJbymvu9r9VV0wt3xFoSrV3az
	tIbyZU6njSjN72JM/R4bKFwJcsZVUzE4dNwCiNdSCn1s9JVDs2584946wDReJt0Y48u57xv8tsI
	GxmPxtovFyqfkZd4qdozVASI73A6Q2xADVvvPxvWhmqJx67kn4Txtn/PaLeX8hS20XuTiKxcee6
	ocEg==
X-Received: by 2002:a17:90b:3fcb:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38941cc76camr3267647a91.26.1783523712148;
        Wed, 08 Jul 2026 08:15:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38941cc76camr3267592a91.26.1783523711707;
        Wed, 08 Jul 2026 08:15:11 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm22558561eec.27.2026.07.08.08.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:15:11 -0700 (PDT)
Message-ID: <f95666d3-3349-4598-84fa-bbe1c868ed69@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:45:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
 <93513477-d606-4881-b5f2-0e04e3a4146d@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <93513477-d606-4881-b5f2-0e04e3a4146d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXyFvDXSLWMeCA
 kwUb7K6rN5P4KbC/g3M2jqoXrQlLxkPhhWecakgwkzS0gp38bMe5KTZ5jKo/M8fQiihumNPIVTz
 ZgZ/W6oqW4judvgWv09DQrROUDiuKrNnzFS+G2W5kGN0qwMx/FdJJIYaqNfdjFTTAEhPGEct5so
 S4xe61QTBcyMIwguzNmMNtQGNQ9tDrezuS9LKSq7SExLindLrZfk4yNYzefFgCNoVnLdq88A8J7
 Vq5ag/brAlpc4r34wI9mSuzUSlelG6H45cqZuf2LKx+IGGjAPqX/yghKjl+xEC2gNs7TrVeSFi/
 2Cnjy7ps5B9qBt+FbMRZEK9DGQB2DfdE51VNVfUwo32/CKJBiqZ0WyQp7P2722ahQ20dDH/UT/S
 nzuRzsPcqQDuod4pvHbIMT0t9cpWXLyeUMZ2tLnRRkB0A5fXF4ELQbM5Cn+CZRCrkUlkYYQsiIf
 rygKF7QRteM+pJdGM3g==
X-Proofpoint-ORIG-GUID: 5zPOgc4nqbgXtFwTcxgdtMgsSNyLCAwC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX6bWU9FixaEs6
 xKd+U7XvWEZRc0fL9Ll+HA+Eu5WLRtJjDNii0wque9ZxRRm1EmEcOgazTKJ+P+/rbVTkndSZa/w
 wYOQfTKoEflpmQdRk9kIqKcFuyivswA=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e6981 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4vn8qff8xjHfPtou0l8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5zPOgc4nqbgXtFwTcxgdtMgsSNyLCAwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080150



On 06-Jul-26 2:53 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 7/3/2026 4:43 PM, Sneh Mankad wrote:
>> Add support to display subsystem level LPM stats for shikra.
> 
> Instead of,
> arm64: dts: qcom: shikra: Add LPM stats support for subsystems
> 
> Below better explains,
> 
> arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific
> 
> Generic qcom,rpm-stats only reads SoC level low power modes like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level low power mode stats
> along with SoC level low power modes. Change it.

Yes that makes sense, will update the explanation.

Thanks,
Sneh
> 
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>>  		};
>>  
>>  		sram@4690000 {
>> -			compatible = "qcom,rpm-stats";
>> +			compatible = "qcom,shikra-rpm-stats";
>>  			reg = <0x0 0x04690000 0x0 0x14000>;
>>  		};
>>  
>>
> 

