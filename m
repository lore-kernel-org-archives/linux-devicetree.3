Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D033876C1
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655158; cv=none; b=UtPRBctov6kFkbZVbkVrOCOaGFy/F6s+dmNk/DZwHPNqk+Wk3nzcCejcgPk8oQuXNoC9gY4OzmP0BkjCblQZApDUqjjL//Ku2cG9xh8p7GHm+tpXU+7u4v1LF6kNMhk1Ma7YpmwIXpSW8WCUERiMWYYH2dAUZGJa0bkMZbdkIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655158; c=relaxed/simple;
	bh=XX3qEm907aHruAI8TZ2340Vb9mz3NyRZrDjcinuBtQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfbGx/999zmCk5M8gkG66r0I6obG5az1HBzT5gDZuR9L1ZoCNvlOxFRARWTjcw3gaM3SdfOxvAht/s3txc4Wo3U8dH7/NzLvbVzv8Smo2qMlSGqQIW84erhUrtzZeuzgfDKzscXQXCMUSiWXx51OkrsWQz+5JI5qHmXAUMEn0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBehY+M0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdE13r+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBehY+M0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdE13r+j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638AUCKe262912
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 13:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6RvOwvFYEYCyXFzHd+gy+nHIBkNAGshdd9r2tXEymo=; b=kBehY+M0qav69Qet
	5ajjor4PS9U5phswhDEmanQbecRTIxjQkdHqhF4NtLP5+xxkqfqUh2xO9BG81xgV
	k6obVktxjCuWzBW98LLSnYKMlO1UesW5hFhzIpTCHT1G+eE7cNbofMkRQyckYdu4
	dY+twkQcsdBJxw3Wo33I4F4aFPSuGM+lJJey994WLjG3K5+dkaY3dQt9NVWlP5uj
	uuTrFZfyzP6kuLu1Zn5H7N/1OZc8Ol0d4llDTZEOQOCdFybB13kFJSnoXfCCUsV6
	kzfYcWFGZLe+k97XifhYyN25y3gbJQ2SK5bsJKLO0Ph0IeOy0NIFYmo2ClX4qEtz
	pwEmkQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t23hj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 13:32:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so21295246d6.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775655156; x=1776259956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6RvOwvFYEYCyXFzHd+gy+nHIBkNAGshdd9r2tXEymo=;
        b=IdE13r+jBSgxf0mtPgcldNodGgit/S4VL4KRJvxXryLDYHrvZr4Dn6VjVOqDvLpi/f
         vbEhXpmxYK8ShujyqeRdKu4FY34G4Xooq1RG57lCHqKZlj03NyGSt0HTSHtwbEfROLSD
         vzIqDCyGiN/YFpMRHSge5TxEtpz6PELqlerGv1rHJIs7lvEE0d+lWXwNFjT4Dp6G2oaQ
         Cic1SJWQdwfBOhdLdKSb36LU+CMamfyh6+LH8wVly527lSKlpj12BxJPv3yi93q2e9Hp
         9Blt+nvgGGE5h6glqtb10KCsV+PjkTX6hpALDfOUk40KBvb9dKgCSavgefXINMVenupw
         hE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775655156; x=1776259956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6RvOwvFYEYCyXFzHd+gy+nHIBkNAGshdd9r2tXEymo=;
        b=AZrJmmvkUg2wqcmpGoEv9dPZ/e7DqHtOAoiAVMjEUQJBPJOT5TrDrASleF8n9+N2kl
         l4SroKdj6xhB8wWX80mcrhfdXbqwr+/8yRnqE7AlmCEwq9a4kuDeDdqcG93Qbjz8PBm7
         KJvT0qsGs42MLv8q9DkQfm/bTCTwCDK4Jqmcxy2pBFVu49+dBU0T2e94M+swoi1Q5e7B
         XIxGOmCW1mSzPNt1HDrnkTeM7H89wRmYOFWDOJRLoawwr+2u3eelHFVFvwd9dqMOSx9W
         CT/yoBuCZBNcOyPl6c65K1k23PORZPo22K4sU0Ihth1I4y/wNx6/gLC3I9+deCY0GlVO
         31qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWplGXYKk+UOt0aOZoVRImTPHNbnD2RE6YXJtLUBTa6WoGj2IkeQMee1CxFh+I9YusM8IyzK9Y07+Pr@vger.kernel.org
X-Gm-Message-State: AOJu0YzX8LEVbcwHVIZn0VdMKytNhIUIZyWzpbmwugb0bx5KoThVVD5W
	jhzdp7+s7MXB+rS9L66LcJT5LJkKXfR3MJIkW+dc6jW1OBBOgUJPvgOoQccTJcsFANaOY1fqjBW
	pUwSG8TY95zWh2F+ats/qBxtNq0B2Ftv4GiiV2EYydGw67qBw7M2HjLNNe3M+ArNg
X-Gm-Gg: AeBDievkjBrm8psJrJIGVxWT/v8nB1zSd3qkIh0fD5d5kHTZZ4hsh7eu/K8gbKr7HH/
	TSpzr8dFiqISuNeHr2i1099txdhludgqewOKurf7D7jsdQbzfkyzwfp5IFKD/va+11NO1+/LNam
	mKT/Ge7YsUjmIcLSPGwj4MAyvEmmyEmj7oPbGAo+C5k1a/x1S/o+a+IMgDHsJZ23wD7pc+nbAvw
	pnbd+Vdwp39uXC30lrfEmt+AZEArdQzWtv9Up6XZ6OKIsCBadXHg97xSGiQgB0oRTNsm0vzSF+I
	jqYq584krqtOYa7VHZV4eqPMGnRNIFxtx5cqIsg21zWvtw0vgOnSF/zg/NmAYBaMRKFmIfWG9fr
	6CaZKNydZAtKriFDebY2nMwU2pyaTNINsbMN8NrGwFcEVNpnoDVRoOPeg836XSrxCgwMacSzQnT
	qfQJY=
X-Received: by 2002:a05:6214:29e4:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac63fcca40mr36122616d6.3.1775655155388;
        Wed, 08 Apr 2026 06:32:35 -0700 (PDT)
X-Received: by 2002:a05:6214:29e4:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac63fcca40mr36122206d6.3.1775655154784;
        Wed, 08 Apr 2026 06:32:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c97218esm647078566b.9.2026.04.08.06.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:32:33 -0700 (PDT)
Message-ID: <437414cc-e2a0-48c7-858f-65cc982d0861@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:32:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-5-725801dbb12b@pm.me>
 <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
 <hvcBm15eFRX0ZonD34zzneuD50ceOzKGo1pE8LkQrQL1qEb4t0pEA4ankxEViVr7lwghJeGOoYp2ub8Ti2idrIzMfBXHBqnXejwukigxz9s=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hvcBm15eFRX0ZonD34zzneuD50ceOzKGo1pE8LkQrQL1qEb4t0pEA4ankxEViVr7lwghJeGOoYp2ub8Ti2idrIzMfBXHBqnXejwukigxz9s=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d658f4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wpl9K_kFG4-g1iQaUfsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyNSBTYWx0ZWRfXw9WyY7CaCHZB
 CoE2EyHR/InwaSqfmquohqleAdlUL4NyZu+nwsucmLCuCPntbzjIj4/+Is9Qc0ZjZATb4uLyeYB
 5B8y80As+QDTMC9OglJhhM4oecbnSrYsDtrfGvIAGp5TCCPFS+Ih/CLyrL9L/EpAXVJOpjwGv09
 1YHH5/G4Bihn0qxOzBIsTr4GGXlvLy5vCDP9MX30GaoqiO/AccF+L0LEuydbMdr4BkUPz1LsjHJ
 p9Bh02fqQH55h9K5C/GGMjX4eDyk/eSTsihPIpxZ4cJe7fDfy7KD4yjScXUoEbMbZEJmPKHpT8o
 krOeOeR/cq4xAUtuHj7xn8kTKyG8C/WHlnYbJ7KsutOgax7MYovAvSFsWQ6OcyWTgXvSriWpE+K
 /yAuEcGGL5CRSm+WJWSob4RuEBPGeFMLe9ceAEyt4WbHCGCrtIl0+UOdiXEr2c7zs1V7MRbUK7X
 CvtXG2X3J2y9DJwXyJw==
X-Proofpoint-ORIG-GUID: BkEt6RC7JvjTMCiTW-H8BExpbZz-qwQP
X-Proofpoint-GUID: BkEt6RC7JvjTMCiTW-H8BExpbZz-qwQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080125

On 4/3/26 12:14 AM, Alexander Koskovich wrote:
> On Wednesday, April 1st, 2026 at 6:15 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>> I may be on an older tag or something, but:
>>
>> $ diff /tmp/downstream.txt /tmp/upstream.txt
>> 24a25
>>> { GEN7_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>> 27,28c28,29
>> < { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
>> < { GEN8_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
>> ---
>>> { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
>>> { GEN8_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>> 31,32c32
>> < /* Disable write slow pointer in data phase queue */
>> < { GEN8_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
>> ---
>>> { GEN8_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>>
>>
>>> +};
>>> +
>>> +static const u32 a810_protect_regs[] = {
>>
>> $ diff /tmp/downstream.txt /tmp/upstream.txt
>>
>> < A6XX_PROTECT_NORDWR(0x0ae00, 0x0),
>> < A6XX_PROTECT_NORDWR(0x0ae02, 0x4),
>> ---
>>> A6XX_PROTECT_NORDWR(0x0ae00, 0x6),
>>
>> -> the difference is that
>>
>> SP_DBG_ECO_CNTL and SP_ADDR_MODE_CNTL are not protected
>>
>> that might have been a part of the ^ difference
> 
> Going back for v2 and making sure this is 1:1 to GRAPHICS.LA.14.0.r5-03100-lanai.0, I
> think I was going back and forth between my own downstream from the OEM,
> GRAPHICS.LA.14.0.r5 and GRAPHICS.LA.15.0.r1.
> 
> GRAPHICS.LA.15.0.r1 has gen8_3_0 support, but I'm not sure if there are any
> devices that actually ship with it on that branch. Seemed to be fairly out
> of sync from LA.14.
> 
>>
>> Also it may be that the better name for this table is a830_protect_regs[]
> 
> Can you elaborate on this? The only names I know this GPU by are "a810" and
> "gen8_3_0".

gen8_0_x is A830 (8750), which seems to have some sort of a common lineage

Konrad
