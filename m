Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77B3E4514
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561039; cv=none; b=gDgS1Syo4HB6ztpSv64ztI4+Fi7rW3CtU0R28FQ5LZc2GGRsLuUzpQW13gW9r+yaEhkD9aihBler1xHsiZIy5qI7m5rBdBc7VZH8i4tK4eSxFWgb8UZjpt/nFeleBs7/4b0itLYMEiISkPncmZeLfNzo15Ho/fg9f4pN7DzKM4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561039; c=relaxed/simple;
	bh=7TZ6BT5J+bgZTyuXp9ni6k0112+91YFuwxbUPLAtwJo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CCK9Ri1Yq4wp6CTdRAY2qQYWtYxhKhg3BL6zJYFSUq/9P7eYLQpB2OHIrrOB0RuILfOgz9mRQ9XbDzd1Q2YUNhf3fxlUZkayP1jMcYXSdz+kzyASXuL08gw/J4Cid48aQDSpZ55OHS8rrErRPtuUvQ9EhWFVZrUX/xChOAeXDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5bevLhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWehpvG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5bevLhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWehpvG1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RFRl3067007
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jT3A+uuNEEx2wO3bX5dlnE3EkGmrkKO4st4GcQ7MV8Y=; b=V5bevLhgYzSokvPY
	REZMyRZEE7CeUm5xxuSwFkWFgN4+bRKsPjQOP7Cx+mYXYDB8tPsNMnTM6WIaEHsu
	IFMBZPYPyMUgZVTFHMAhGvarxRrstHN2N5sQIIKIchu+0jcEk56UFMJ42uEEWK1a
	Tbj48giRj80NAkv3uZp/Ur6HCQZMya3vni/qC2VH8EaL+3t6jekzEzz6a1GwqR1H
	thKGnvv7CwSq3VfQjdUC0hdi7jGK9OO0HN86ZGD6vS35xFezZbHG2XAGuPCUcgzX
	zdBEmmX+zp1LnfO6Jm6+gWUls5WxeFMkeZU4wSH8KGidReQ5RnKHGbVlAtLAjXCR
	yrRDIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphqtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:43:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4578055a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561036; x=1788165836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jT3A+uuNEEx2wO3bX5dlnE3EkGmrkKO4st4GcQ7MV8Y=;
        b=bWehpvG1zeLyxDeBLPmH6Y8xtcEPdeqwBYvQWUmw3kPPvFCBsgZwRBrjyWhUokRcKN
         ZBYzi2+oLdyabvhAyaYb400OMhoLHXXOcdxxtVsKlwtq1zphCVgGWAEtrWM0/vN/PsBl
         R94gRecAVIR8SskwhkZfiWEdxRTpQG6Ease7NMnjE2uGTaSv4Cc1iIfa5ycMpPxglwEQ
         35sZWWW3knfIWiHqD5S2bP7fvf3qHkyiS5DB2OPmrgZYEjYrPRChQIevPZMxpFffESBp
         6hXX79GHFRtVFgt7lIn36DzkGMqBeQtVJUh+5NmKravPETE5dv7cWTzY00wrGIJQe9b1
         bNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561036; x=1788165836;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jT3A+uuNEEx2wO3bX5dlnE3EkGmrkKO4st4GcQ7MV8Y=;
        b=jGvrLrvAKqhh2oAKG8RmDfT8C59dpXJhrSpP587dgNF5oVPuskWC09YCG407Be+nqI
         VUYRqrBXq6JwJsE6EKYALt1dznHOEt5mCB41rW7OvsSgQUJAQgKBYq+3ITZEplF3F3vk
         BKnyOlrN5KsdAUDCxr4Vk9WVF/eX4cx0jLHb7EQS/wpH3mgcH4XcALDRZPiJ9jl82YkI
         ESiJCRjYinRaeYfMfG00GHvyyTVQncDo2X+NDqvuVnX3YyS6zdTi1WSfOtGe2lpD5HFZ
         sRgbL2SqxEXJG10RQ3iapgTIzOCiGZTWxyM9DK/dt5f38M1nvx2yqXac/LiuYx42eb5e
         pQTA==
X-Forwarded-Encrypted: i=1; AHgh+RoJvYSnq9am7YZ9kQCIJI6T/kj/E+DwyojYWKtWRwEXVC1Gr1Y9Bh4DmW9osP/g2sLIrHQH1f0LW8KO@vger.kernel.org
X-Gm-Message-State: AFuF++kLipNFje3GoBiL7n0Xorp0IuhYuGk7mMfn57W/jaZhUVDrdh2m
	CwULK9xGxmGabchi3QbZkqqhiKZVMV+mHeJtlEhtXv9SzpciBeU09PR+YmheEs+mq+Om5QFpHHL
	oEJZG3YfJOxUC29Qxg/XgUTFGTQ13pLXVG+6bAW35v22uQXJ9LFJPsQlHz5ZpWkdzEMEmz7pK
X-Gm-Gg: AR+sD11idnCzyiGTGEH8qDlcRO6vrYD7TLT05mjXINYLtwpDkcKjNfz047mWG0l+se1
	/M76+8Amx+agGNu8qsSUK2uu4P6+eRjtQ02AxiM6mIZGHgiOmjTsXN7d0ctDRZW21PnvPqeC5M1
	JngPmRudZzC/gNqoqEHhNNb1ctdW3YzetYyl48DE3iWPT6KKKIXMy37xOHwhm/eUraeWgVQNhxG
	fBWAF6FTzPh+pXcAwlekTH0ndl0riTx5HqCJ+3RupfBy88+XHFNrZI3/fdzz2+B7ZUGxvhlk5sn
	Km2zjSYfIXVV34U9LJF+fMjEI9AaGDGHE5EqP+chyWG8OWQUysKtxhTodTYEY5NeGB3Q4MLKf39
	IwBhtnXKL8CvYEluyNss25C3PcBQDb0s=
X-Received: by 2002:a17:90b:37c5:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-395c4c35ac3mr22803813a91.3.1787561035807;
        Mon, 24 Aug 2026 01:43:55 -0700 (PDT)
X-Received: by 2002:a17:90b:37c5:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-395c4c35ac3mr22803768a91.3.1787561035341;
        Mon, 24 Aug 2026 01:43:55 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a1597csm9226982a91.13.2026.08.24.01.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:43:54 -0700 (PDT)
Message-ID: <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:13:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfX4oIRi5uVsBSy
 9pPf4YOmnSCkRUjbVmiS0b86rJ6+CtyUMzAOhLGZOfTt+lHRLKUJ2dnet4nAYZJZuMh0frun8/c
 915M4mhxWJnem5vzzKRllmryFwUgXQrWSlC9wZrgGft1KeqU0+0R16QOvO3aA0/IED2Pt1U2gbb
 B3QhhiB8ijRjg1MLpLFdgWDx/4LoNRiHSXwxtwUZ+zoSNaS9Azma5R6XONx9PYy6NGATP3aIBUN
 3PKjnoFqGYc+eV+nnGIFXYjdWOgQBwHmDM+aLiNmGJ4WI/wRhWWd4ZHVCR+cL9hXGoCUM1CBUkF
 aDYdztigujqaQy8dH3hJXjwhcYoDdjYrEn/ZbGZ4qpDlj1xLGir6O/2oXeHPFFiJ0ips8U7uMYu
 cAy2NI4i0OhGihWyIsm9lpEmYAmnmwhhxsbu2eJkJT1zUZ/zDakyPWKjxC4zJyRuGLKb72WliYC
 elmnRZpy4RZYvyLwJUQ==
X-Proofpoint-GUID: DunyLWu0b15qFOGEJpJr93G4me-q4s0H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfXyQifDfxT5TL7
 ZHyl7PmPlArOZwE1YJimCqVcWtOFpkEKZmEBxkgWnBtKNj23+lui2TsmHbUp5AytDFFLETtMKiD
 EGKYL7+94Ed/Sk6OZPu94AXKLAXLrGA=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c044c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9btBknafKP0QppeIf9oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: DunyLWu0b15qFOGEJpJr93G4me-q4s0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240076

On 21-07-2026 12:43, Kuldeep Singh wrote:
> On 07-07-2026 12:41, Kuldeep Singh wrote:
>> The series is combination of below 2 series sent in past. Since, both
>> need to be picked together, combine them and send as one series.
>> - https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
>> - https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
>>
>> Document and wire the SDHCI to ICE relationship on Qualcomm platforms
>> where ICE is modelled as a dedicated DT node.
>>
>> This series:
>> - adds the qcom,ice phandle to the SDHCI binding and enforces the
>>   qcom,ice vs embedded-reg modelling rule,
>> - enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
>>   node,
>> - adds interface clock and power-domain requirements for the ICE node in
>>   affected DTS files.
> 
> Konrad/Bjorn, could you please review and let me know for any comments.
Thanks Konrad for review.
Bjorn, can you please help in picking patch for v7.3-rc1.

-- 
Regards
Kuldeep

