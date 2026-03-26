Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B7134EF15
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501862; cv=none; b=Teux6UpPEVFBMz+bWzVNy++5zD/KfWtufH9HmXaYhTqlSQ5fgvTmxXNOARW8t1/aGpnEEB8/kegzlaik76OrMQwoQlF6ikmR3nB0+X6vKLpcXbO/omQxbbXtI+tH2xSJxiJC2lI0bsRTvsECaEzleZeu8yKuO1PV3EnZLY9yyM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501862; c=relaxed/simple;
	bh=qXNG08BBCTUiqxDvrQD0Dj45LazxYXPDdsDBovIDXAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDENGSpZplmz6oy7jQP4xJZtl+U2eqOlAQHmMrLDsYK5aAxfKRBgQ85v7tVqcEXCUukF8WZReFtvbCWIqre5+hKWmioPjMbGgk4M8LhQ0vSW06RGKrfwT8RAq5BGdiUSY+E3QrD1//Cm/awLcXRD0GPZRMXXVG4YppD/t/TSX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bISMWj/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7wS5+kE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bISMWj/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7wS5+kE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0l1TP3958265
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=; b=bISMWj/gMVkNeIHS
	mMXgr3kGp77EyfFWpEE4jLYGnPt5Cs1vAMK22lc1ocwpx1tzRhFlFgOHI/WWJNoy
	917pXeduA6Jwg75oZqdfXNoTpfo0iLF3K8em2eEGZzDMdXix/XA6GI2i6kKN8aif
	kjaJD9/tSF5GLkHiGo9Sbt+7ZGlFPlzMQeaP0JI751l3Ccw7mB4kiVrK5m7+u7t1
	gLw5y0SrrutiKhxnVLOHULGE5JxplPJz64HLsfuMLlZT18aBkbBuvlgAYD8erPlx
	gRgljDy9aJexD2yJUz/HXV515iFPbbEJR6JzD8IUI5r43EeKbw2rM+CtjiKHUnJ0
	3uGMog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjagnnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:11:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a782029b7so486232b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501859; x=1775106659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=;
        b=G7wS5+kEhTDIJqxrQC0LJogG2DNKXosNJH6O0rjNIRofa9ttXEZH+W3hmzhCmrC5wC
         IuouF2+pQgQ6tJ30o0hl5IA4gzz+Kqaw9HcitEkbiPEQcDH0K/n0zzSEqQa7yNOlUAtx
         dy+GgUleHKvziSDSZ8jTKOdx0cdgcXMBDtl9qGK1ZqA1S9SFQpBfcLoxMjhkm5UILLGW
         4fHhXVl8f8jogg/Eyib4l/WtfGdppjVkNGrUCHzMLUCtMFCgNfnDw88JU+0T/fYOmN01
         B+kqnGrjGvbCcJ8jrQGOj5iCEolwUo7TDzGRC2nXMMt0iJx6RgRN6e8A6CP9Osr54Tz0
         WTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501859; x=1775106659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=;
        b=KJBc+YWSIfgE380jBabpTdu4I3gw6+2ssHRkU8q9Bh8Owobkj7sBPc37VL6x9ysHfq
         24Qx4okzPqxc5etPCxYfVrkHMu7wlqpbXvvymOPEdZeqrieBtOe/miew13LBUG9tAF7y
         BjGGxgRfiky1er7owz6I5nd/gFHCTPPCETHb7zY3m0427V8g/piWxVBPW+tYu076z+s1
         K7FxzZjnsN6TnDa/TUJUrHoRodGqkzWsaZ+w6bhEhlfJ6Re0NiGwDt3mlDnH2rIpIFXc
         02T2e42E6TtGczxd8WwXRSIVMAHgwT1uBwtqkJMHBRYZKOl99NYSNmfi/sL94VRb5xa1
         1sWA==
X-Forwarded-Encrypted: i=1; AJvYcCXo1NFTrWFIqg8gSGb2J3BKn465ZCMAp0g0ik8+5X78I3ViD1/PEZg51yCFKpDURhQgOXc9MnyvhtLV@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFJITRK0SSz2fFUcyM0hDBIXtxuwa1Ys/hRZOeEat8wHR+fOa
	vAp1vgPeb6ULRAv/nmZbYw6uJil6MI4Mme4NfS1kMyo8g5N5qC0ARvbVTS267CLXcY48O+D4cka
	oq2GUo/PgMPChc+CrLYkc0QPOQJ4qI0Rs+Jg7JYS51Tf0J5OPJG4cWe6r/Pxb23dNC/YnTnhe
X-Gm-Gg: ATEYQzzj+nj2dbNYS8c4v4MB9VV9/gsAlawnPJOcpS64v+DNrxSPXYO1n4etthYivIT
	DuKKmqTG5pkGmq20xIj7amcTMNH0VCivrB30GZSLhVy8Fz9RdRrXgiYLWhMqd6mBfUmcusHRzE0
	GTUoNbGbRvsfcyB0uFe4+vh21t7mj++0Fk8foP0uNh7V+MMMAWJkNFALpWUUjqssQBlngDAi5hP
	px0Z/9AN/VsENtDPGsLrN+7DRDzebV6/eo3TqppXZCCbxHhOjQBpi8fH7fWnGtePMKuNFwarNb6
	RtTHXOjYkC8+0mqWBPlUOt62f9b9kVLt6DtfJB7S4h3XgDcpZm8z/IPoAS/IRo9V37fPQZH59v8
	N+psJ1bA04kHZvq0b8Se+OfBwIleH7HbVT9a/fP9jfy2Df5Dxyg==
X-Received: by 2002:a05:6a00:4bb3:b0:82c:7876:a027 with SMTP id d2e1a72fcca58-82c7876a666mr2759744b3a.18.1774501859109;
        Wed, 25 Mar 2026 22:10:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4bb3:b0:82c:7876:a027 with SMTP id d2e1a72fcca58-82c7876a666mr2759715b3a.18.1774501858647;
        Wed, 25 Mar 2026 22:10:58 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3f9593sm1246249b3a.53.2026.03.25.22.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:10:58 -0700 (PDT)
Message-ID: <c0f0d46f-fced-415d-b2ee-30339a0a0049@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/5] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
 <20250518-ath12k-ipq5424-v2-2-ef81b833dc97@quicinc.com>
 <12cb2f34-2142-4a38-9e73-49c2cf66d8f8@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <12cb2f34-2142-4a38-9e73-49c2cf66d8f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YutZfKOaUpe6pr9mqjkYj6eDlbB6dSNV
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4bfe4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=xSzTO1CcoS2zrBndkREA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: YutZfKOaUpe6pr9mqjkYj6eDlbB6dSNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNyBTYWx0ZWRfX4nHNN1Gzza6J
 7rH6axtMqoYarlZoue2HN7BBvW41Pb6VYgyQOo0g1vVrH9RgPvDQVBF680KX2AgSD5QteXUAQ1f
 Vk4MaHimSi2AYkBioH0U3SNi0sO5j9plvZZwx0A59SoVMwFIi6RjQDBgN6hK71DEfxbg/hKjLoP
 AJ05yOgMK7CDn/JlrlnM7ZPnvL/6H/AlsEHPcSMCXP4vjJyMkLJJgii9J95Z8U5RKLBdtzgND+b
 y8JzcvfD5nd2WWPv+Wp2Al2+lwbVDaf98nIuKXdO3xkaxTY1WLyQALp6yy/G4jX9mVvam+JYMBH
 u6JojV6HCr7ZD+1YesTBLP7CWrEi4iftNLDZ22MOvqcSkB/2v4KPtXFunmmkSSCdv252W5G1zeS
 tSdskMiX1praTc3l367112OG4wTHuiahvVsBiGuiI4PETcjUp68TF63LicGrknci03IrwwMyE6j
 REUGa8x+TNaX+vrcSyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260037

On 20-05-2025 21:29, Jeff Johnson wrote:
> On 5/18/2025 11:22 AM, Raj Kumar Bhagat wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
>> index 7e2cf0fb2085ab014fc14a5c81074802674b154e..866de53f37bb5af94e16c796a0052fda39eb4ea8 100644
>> --- a/drivers/net/wireless/ath/ath12k/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/hw.c
>> @@ -1590,6 +1590,84 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>>   		.ce_remap = &ath12k_ce_remap_ipq5332,
>>   		.bdf_addr_offset = 0xC00000,
>>   
>> +		.dp_primary_link_only = true,
>> +	},
>> +	{
>> +		.name = "ipq5424 hw1.0",
>> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
>> +		.fw = {
>> +			.dir = "IPQ5424/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,
> 
> Until the firmware is available in linux-firmware I cannot accept this series.
> Please work with the firmware team to make sure I get firmware via the
> internal release process so that I can stage it.
> 

Hi Jeff,

The Firmware binaries are now uploaded to CLO:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main/IPQ5424/hw1.0?ref_type=heads

Will send the next version and resume this series.
