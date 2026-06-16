Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D23A59A3
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611294; cv=none; b=k3vuRz4DI04e9iV+gigxtyefF0CPNdHNWkbeHe0OzCM2GkXscyb8yiX+oT6ikSCPv+c5guV73GK4dZESSVOksSasqAXeih8tu+eHwKz9avj/3cLxtN2h/cs0LRMpsNUVWAmRlut18WcmbY9jRYL8MfZOaSvyt0Jhq+vrHZsM/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611294; c=relaxed/simple;
	bh=hynp6thCVYAmrL6SqdYPRJ7dHOMNvaccD5sK5f6y0wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlUgXIMUqDn6fBlciv0iqyJ0eVFKDYUX1vdsbEJe+wCM4BdwKYFxtrWR9P1YNbd9B79ZKN4SKAXGgmImK/kk3bmn93vq2lL+N/WXA+5t9RM1yVKABnLwAceqxcbAOpsisQK93X3ybk7UIWioZQ36WYulRykLzpN5sK3nJ8LUfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4pWvAlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQtLTFps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4pWvAlL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQtLTFps"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Ae3256227
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JlxpDVrPhg2ZsWuRW7hsIZHghtGrPTfnyImlkmRxEU=; b=N4pWvAlL7Eq5FdBW
	D2OVPhhhgJ7AAWanktjR2Bgwofm/NadGLvpwoSCeFZhwW69aseJi2WK4hANEM1MU
	9lru7heSSoQCq1+j3NXBNAp8hnaR0zS1hwlhwi+YbYLsWYTtskYqG5KzE8UdqY2H
	3FcqidsPJbIAT/n8bBDA5CqYFw0rK2Osi2i5+vGm4tt8iCd0tO5AqBADJoI+VM5s
	WrhPkXKCgjAZvHhXrcq4Y9qNbzc7Kv1LWm4L9vKvljkggQqoTytrZnKOTbl7r/o6
	TfNEkrjAxxl6dd4Jo3q5AEe/gHdCiVTEYBonGRU0FGhYFFbICchGjk+fPMNecLcO
	7Mz2LA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9m9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:01:32 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e5f56b8b91so2183795a34.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611292; x=1782216092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JlxpDVrPhg2ZsWuRW7hsIZHghtGrPTfnyImlkmRxEU=;
        b=JQtLTFpsKjpqjpULE43umLHzkrbxKGPrZgRta4ZckOLrHj+xpwLFnhtPdTxZvOOuoR
         lxEgir5ajS92KTLdC6s8m6Iq7XHgE/5+z8fCOykeIvh/jWqytdGf6YyA+mtj0I/126iz
         F6uZ9aH0EZwoZSp84+Sl7shLEDjpNYVl8zJfctXnzty62Im5qH7Ywa2PvQ2HvEStGwOx
         A3dhuR0UhmX1rWN4AirvVL+guuNDLoeKbH6wCbxxHUGEHz7Xs6Z4tq9pau9zbK8jsL+S
         1WafQTCgiZ6R9Ine39f/7BTrgQsBrxahQUo9z2VpgF5lxfJnfIiGjRybuHVnac0qIxf9
         Sguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611292; x=1782216092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JlxpDVrPhg2ZsWuRW7hsIZHghtGrPTfnyImlkmRxEU=;
        b=U/LlpwcN1IshffVPCWG9S3pVgAEp3t3C1dBJZmCgL+YQEQXNxkVshXPZ/tQ3QcCgv7
         WXO7lFydH1LuJcRD1I7Nq2XyFvQCRKMTKestNRJDRH+R5U3CqOkDr5nxbDGkrNASXzGz
         fKxXfcjfaJUlEMNISQl+pfX+gTwksjAiDY9TANI3gxZpS9yo5vIJsYjaLq4oCpkujMpU
         MJjmlMrD7JP9WOqvXEUiFfErIKGmegucMqrTOfe6koTzdkDstPW11irZNPGCfTcsjyfz
         8Bw9ycwJm4CO5/DB0bquAuXZq90EP11fYGcNg/VPGWl9KZtA4WmDkKyJvpVLKEcTc9VW
         nlFg==
X-Forwarded-Encrypted: i=1; AFNElJ8Hs1zodWka4kg8tdAKVdbLNNxjtRIbrQIiUpJ4/oTubA+vaI+fQHC7J+ndRCC2kwY7swXrjBGxo/3S@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLI+R5MVpt/4oleZdXnjJ7tbRc012w6VoeDypZBB4fUEX+Ek8
	uXrMITIJiVZDNBBmbUN9lppSw0R7bewAr2WDuT3uqPwPgOnM3Xoc4wJY8eXAGeYvrQ1gFSXh3Yc
	BCTHgoa4duD1iUwtCtpoOFg0o/KWqRMkj8ycsYDrf0fUbKoEjvy4JjDUjYpPg5shU
X-Gm-Gg: Acq92OGWSYV02o3vG0ZDtbPz0AxqqRDoiaR0w38WvctZdgluLssvrEFlwy4x5XrMBBz
	eGCLoJJidr/ei8eS0zogmzvX18MQJIqQ4knRJ/aSLa6OV4+++yGe5/0XPURgD/MHgfXJ3OrWC4m
	Y+mJlyRJRNIDMxprpUb2SAONvH1rfmvGdI2wvdHeIgG3hXMw05KvXo69SPUu5v7aAa+33lJ44hO
	6dc6MRtjEH+WeFFuMygWJ+l3+x5rCrNpjDCRtu4clOY9bJwBooGAAEGw27blyu6Rk1S2mcfeigW
	34WCPIxOQfkeLxza6iuwj7H+AJNEbcFvuO4mnZ+Mwtl3siRsgMx9fgOXo50VePi2NlPKTnLgZ9C
	+H+s/mo4aQjQODX7UUxtetNNtjapomtG4HjrSpdzwlS6NdQ==
X-Received: by 2002:a05:6830:4115:b0:7e6:e162:913 with SMTP id 46e09a7af769-7e7847583cfmr7195431a34.5.1781611291390;
        Tue, 16 Jun 2026 05:01:31 -0700 (PDT)
X-Received: by 2002:a05:6830:4115:b0:7e6:e162:913 with SMTP id 46e09a7af769-7e7847583cfmr7195385a34.5.1781611290862;
        Tue, 16 Jun 2026 05:01:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm635175666b.28.2026.06.16.05.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:01:29 -0700 (PDT)
Message-ID: <8ae67f39-3faf-4db2-acab-ec7149215bb1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:01:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk: fix sdhc_2 vqmmc-supply for
 UHS-I mode
To: monish.chunara@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        jsodhapa@qti.qualcomm.com
References: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX08EadcqrYu0D
 XtV81ufPRGuvv9ISScjoh9MAM9d/5FlZ+5PVWOFBXFFZqlqQSiuUx0iZ6i00B4zpoUuHlnJXuXy
 jcaM695HQpyYKadF/yN3jXyyVByTAgo=
X-Proofpoint-GUID: H68TiarycYN_etMM6nb6GOE4O0mKbbHM
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a313b1c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uRqv5Ot6X4B4uVllIekA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: H68TiarycYN_etMM6nb6GOE4O0mKbbHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfXxAdVJbbFAPJ1
 GtfFlUFJc7DdffUGKiUxXL+q5bGUm9KsKp/DsSphIB6//nJ5kEYUJAiPtJUKs92oalyD+6goun2
 g4aFCkWFxgpd1BHWgUdgVtwcB1mMqCS+Uj+qT2uNRBfpKXIr+CSugwT1ANfaTOZMRiLc890yrLl
 FBtx5dvfRWIlvuOTl7YKQcbetNp45ky1KvAGj0D/C2kYBBXmvMZ6N5Q7Tm8QqK+AELAjBeDA1GN
 0wcHWHj0bHj9UgnuyfdrYPW4/P1wr6cDs2XgQwfXbpq7EZDPZQCurtCHtQd668CMp1NAnnO68pD
 lY9ShiJXEkNVgA2ungb25iQ0bXjY9DZYjZvHXKjLgHUxHJpuy/ndQ4+jAFVKlSf6zNW1QQU0Jdk
 dZkldmM1MveHUkteWp/iAm4c4XpeYxxK5X+gSedo3US6L52ZMnK4d3g/P+Y7TTJOztEqYbsGUsA
 h+AMWDjlT5ceUjykvoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122

On 6/9/26 9:35 AM, monish.chunara@oss.qualcomm.com wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 
> Signed-off-by: Jaypal Sodhaparmar <jsodhapa@qti.qualcomm.com>

Incorrect s-o-b chain - is Jaypal the original author, perhaps?

Konrad
