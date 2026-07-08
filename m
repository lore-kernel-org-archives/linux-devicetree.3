Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306437FF43
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523775; cv=none; b=IsdiSTzAa6JE7meTNwgTXBVIxdgX/uznKH45c4SDmuGHLSZV80PQj1b/OZDtXHHBRSQ8Qr0UXgwcDExHnTOeJiE46oIs7xjIo87IfdRGkAmmGVa+CihwNhVPiu8gcoSQshHlcFaMHcXbSzIjJNJEqUvbo+a3W1UuNmBN6tIa7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523775; c=relaxed/simple;
	bh=p4j5G4quTDHyGe3b3amO9/mJmZjRILpAnL7eDql6WJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzr9+lf6fVJxd4KJq6m5wyiCB9DswURTdQ9X8D5ev8kef1OBmOiIMui2jShKB/bAf1kDchG/qrVXAZLqSntCvgGvVYhprRG8HEzLYKjiDbMwBqBWg6H3PX+kZ6SdbDagCg6MVl/Y2ys4gJ5Qkg5On65U+96SEv444Mj9ImNdKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgMEKQ53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihNobtFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgMEKQ53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihNobtFx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3WfI2727523
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YaBYtPepMdqaWBjSOuHgDR7wn2sbsIujCr1femId7w=; b=BgMEKQ535wUP+Vtg
	CU/KtFdphTQJZJ86inIpvODazCp5qsmoX/b3C5E8KTl9Ipu9E902d/QTHnQmPS8w
	KGVuaAH50HN+9f31+IEHRkEaEdSJY9at8KYej1cNx1nNnlzwixTzIk/KDk4BJ5Jn
	6q0snjoTMIjCMP1wI1Z7x6on98g0cdVKeDgs8qCyykL0wsNIfZqpADv8n2GOoIm/
	uUYORG6ksSHi1bm+qi5IrJU6c4tQo2VW79t306Yl0uNWlEW237nul7uZevKKvp3W
	7zF/YaP+a6HekUvkisBzl9SkNBIcHlsTeU9PzWgtsa5t4AUjUsSZruA7EafaXUa7
	Hg1TBw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6ab97h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:16:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso22397945ad.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523772; x=1784128572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YaBYtPepMdqaWBjSOuHgDR7wn2sbsIujCr1femId7w=;
        b=ihNobtFx7FEpt9RXshzRtykkTm9iGb2ure3mOdW3ivzvk5BJDZsebbwmQ8BYiJrQKE
         ly4dPE+NfDryPl3lWnL00aANSICWr6WI4LXWTl6qdoXw/WJz/iZbZ28lHFBbpKmarRQZ
         AlhL6sIgOkUuVwPJyMAO6OOIOKekbQ7lHlzBL1DJHFGyMyoUQ1YZ9UgtVIAYC3KIH01z
         mPouSYxVNOFhfkzOVLBrjSY0XXaBLLRpWsC2P5zA7kp3u3eEp+W3/UIZOxuuPPpNbCR0
         LkViZcDTdhyImc0Jft60Q4mAEtwiwOHYII4fejJFLoiQ4mCGbaIUdoOPcnfpiRTdEvG2
         EQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523772; x=1784128572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YaBYtPepMdqaWBjSOuHgDR7wn2sbsIujCr1femId7w=;
        b=E2X8mfVDOI8ty6+MMDEPw++SM2gWqJSBu9FG7WHCyNv0gLrRixS4TzqYmwFWT2Oxzx
         hnbfL2v3NxdeAs2Wv/qZUCG7BYDpkhtN6FBG6j1BL9bw93FopJBLg10vw1cDXNgRHVtp
         Vko04tyxzMFedoU6YXD63AZowKwBAo9UudyryCQSnJnnMFYciA8gmoi68k64dwjpDsko
         Z3TRrWw8lHCQhEauCfvKrsHxuPS19sOx9gzeCqGE5aYyvu5SyhBq7qfXHfr7TGG/DmsN
         ke2OcsfHlkfekRJNQsTG058G+o0aPQE4g8uuoaB0/aA/6+nPj1cjoG7P5JZ72+pwikR9
         pAlA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr8Av8jXZFoFE/N6++VYmHl5m9vBLbgCwwb6Qb+LYs/Tvl/1BYYIRpZwKAdAxU1abLuH05y2fW58qd@vger.kernel.org
X-Gm-Message-State: AOJu0YwJIbDvY6N0IXWrV0TXxcHEcu5KLjpWmO1urhOacPlGCxDL4wwh
	Yc09gizeVKgTy6V4FzUvY2P3yzWIE1w7Zn4R2j3Ryk1hQgOSXiO6C1E78OXUZOMnMjrxXfWe4Ct
	Ehlsk7drQ56r3GJlH7RvajcwEj1GGQ8xoPQNYyLHtcfp/Dsl04cYFySp1beQfvOJa
X-Gm-Gg: AfdE7cl6p0kcUREZEShXEABl29NTu/SfHL/6XyuuZ9YQEnRNd3z1MEdNYzBPpwa5RnN
	8+IHuEGK4K3IMHP1FQnr7lM+q4dZZtcZDGHqh9wgYW6SZn0ZmAe+HRPjYg+xt1irwnXgfV3ptXO
	Jbj5tWAP8wN8NYBFHgXMP3q82R5CIkVzQRhZPjcSU8h0qxYo505VjQ3GG9va+mUeIdkQso9Rpbw
	gXwOyaobwFlLiEv4pN+fdPTXgj34J/GJTo14bLpUgYT/P8CVsK/z0Fiuc7XTzYB2XOx7AVYKsjW
	egtDskxZlxEXOxkWfiObqpCCCEAy6oBpQH5Yl6cJUzzOM6nXWTZRT9c2jmyG10IAYE/RtBmS/L6
	xgEcSKUhl/k+yJZFD5/LP+NU/lSRWLHBg1uIjd8FbwfJXf3ssZQqKD7be8Cn+W/d109GWhi6NTN
	zI+g==
X-Received: by 2002:a17:90b:3c8b:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3893fe5b9c2mr3633438a91.16.1783523772276;
        Wed, 08 Jul 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8b:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3893fe5b9c2mr3633392a91.16.1783523771782;
        Wed, 08 Jul 2026 08:16:11 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm20954746eec.2.2026.07.08.08.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:16:11 -0700 (PDT)
Message-ID: <916c7405-704a-4487-aa2c-824933ef8837@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:46:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
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
 <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
 <91fc1aa6-b237-49e5-be50-87d6a06c6bd6@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <91fc1aa6-b237-49e5-be50-87d6a06c6bd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXxPcRheSYHetR
 1U5XDVrKsCTHHbMlTVp1eCeXQCcEQwO58jZvHSAcxdXUsDZ/PQVS8m0uNsqp5+X+iQWKkfvWOTA
 XI/nMg/1iTbASHyKU6cpI014HIUWeReJmmQHR/X7fKdCRCbghF4jSJWdw0RHVVZIecP8JS79NhE
 oDUWYDa4kgTNvyTwnD1UaNJjO6o5RfR4fIAcYziES2ij9Zesaw/tVOPy5v6Al+c7DRewOk7ZVMs
 xL9KkGBlk0Pkki1U0jNM56XvbXePHQPhz1bcBLM3n/QhB2dPf+dgYZI0AbMXn+NKq76ft1SBB1X
 BEWM9jQ3kDJJqosNZ2unz6bdRrm6pBH2yZOIY1VF48O4GuFmIF6tZj735TZy9470jHhZDcQReWL
 h+M+jlnm9Up2XwbI4q4JhDzOsJX4sMnUPwDq3qkDjTcl/aSKJ8inS34AuNDwM4wjQZdirNEX9lN
 aRA5t/w3Hkwpcmfqb/Q==
X-Proofpoint-ORIG-GUID: jsTQTPOmkuZpRHlSoYgvMdvM6r7WxFU3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX+Q+LtuwMRPOc
 VaFsyRik4xvb4BzmwvxWAKHai3XGcWWyCcAWe+Jpjkb8IqPlRyEzf28reXtCZBGYdBdUiRJK7XQ
 Y2ndoVFNQlEFGgVIwp7aKsDrDZaXZEY=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e69bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lW0qd329ZGhoXQ_XPREA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jsTQTPOmkuZpRHlSoYgvMdvM6r7WxFU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080150



On 06-Jul-26 2:42 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 7/3/2026 4:43 PM, Sneh Mankad wrote:
>> SoC sleep stats are present in RPM message RAM and subsystem sleep
>> stats are present in SMEM for Shikra.
> 
> minor nit: use RPM MSGRAM term in above line as well.
> 
>>
>> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
>> was used for subsystem sleep stats since those stats were populated in
>> RPM MSGRAM.
>>
> 
> [...]
> 
>> +---------------|----------------------------|---------------------------+
>> | SoC           | subsystem sleep stats      | SoC sleep stats           |
>> |---------------|----------------------------|---------------------------|
>> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
>> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
>> |---------------|----------------------------|---------------------------|
>> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
>> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
>> |---------------|----------------------------|---------------------------|
>> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
>> |               | (qcom_stats.c)             | (qcom_stats.c)            |
>> +---------------|----------------------------|---------------------------+
>>
> 
> [...]
> 
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> 
> other than minor nit:, looks good,

Sure, will update.

Thanks,
Sneh

> 
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Thanks,
> Maulik

