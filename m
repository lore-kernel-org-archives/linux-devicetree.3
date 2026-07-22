Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689DD44330D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719934; cv=none; b=QOA58sXgsKum7Su3Sx59zn8LFsUPagdsIhsxSua6ggXyZtYETsz23p/7uyVRk75SubfSEGFu0I8h2LXp7O5tjOQxiwOQ4vdYG3xF3sSaImRPSSSAUijq/PfY2wx8QdOHtx9dqJw01BJd16Pjno0z6iFGHRbhRQ3r+HB7pubNQmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719934; c=relaxed/simple;
	bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0ebSnlmoSOiuKe3ArkF59z34sVhPStWh4lvpz/XVzOPtaHb/bSAMTz9XKGBAyNpP0RflEqZG16Mzmoef0g0AO9jwd+sXWmkhYPcFO/ockITXuDwh5wFM7ISjM03SIyIZYPo4i/tf+P7GXlZeroM10+h4cUQCUrT9XO2DmDfr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGLkj2Gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvTOxBWs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGLkj2Gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvTOxBWs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xIV2141442
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=; b=BGLkj2Gled8Qow2w
	c08wNVRVuOwwNcjRSzgbe96UVGxhcDpWg45YV1wIQPndq2xHCgCl9l3LLHsozSQ4
	ONfauQVnmFz3AEd9f81eDbDnlbF6AlHe2VIHebAYRRNvj5cVI5Dvr3jplsF7v+fZ
	Aw22psEiXZ0+IVI1NwabLx0i4MwtmppCSMDGIOWRdYVb/P2xPoGpPgEg0QENyxLj
	/A/rktWBChJTvWSe4TiPxaCxXB4Fvyavy6fl3BqnqJV7uXc2pe2OPFAz7GyrAIZl
	vST1Te6MYkV0GHdJQsoC3K3Gat0Yx6zBqZmb5Vjw6owUrJc64ylcSt9z4XA6FRFp
	ipb+zw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2rpp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:32:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e01a62d99so2516638b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784719930; x=1785324730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
        b=IvTOxBWsNACs60oINtlJzCTvi8xK+vQC/PJRFZ9fmI6rkUr5gh9P9G2RO4X+SREVHL
         1OPil2ze48h65mbvKm+J6ByQ0PYH2iErZRQJ0wDJnUi6A1ZRpDkSOWqjCsWlM/epv01x
         EzKteT7Ns9DDo2RBGrr+z8pCvmgtEVPuKR8Dw8f/pcgE4baBxi935sErrZi8+jRW+zlE
         qdzKRk7/DkE/LyjKqyTof2SLg/8Cf2Wjq04lnxI2qDGK9gz0Mh7hm0XAcBEgaLVSlNgI
         15fA5sOyetMDFvp0YiFWWuWqTnv9zC8oskmHPzMw1OMR1oFTnXLfizLVcCtUzW5CnccP
         p1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719930; x=1785324730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
        b=p8T7sVjd3IEEhWgHy/N23T7n384IgKV+sh+qanGTvaKK+BnSs5m7tRppid0EIR0SvD
         1ho4rNkxJ4j4DPdw/NQgksxFaY7TQ75hEG1+YAF1j6M+yk8/yMOVCkxYvzgrvAKkuBMh
         zMrAZ002xhbBcue2y0UPH+DzHTB6ls+2ScuQ8gPpT+BgndX5hgoT6LbsYYsHMCySM/0N
         PMBnVrL/Fv7GIaTHFoogKPAJHeTxkVWq2t6zZ3muxSDGWwVVFprVAvPcQttLMHWiB8hv
         wnEDlUkQKH7tk/wZGRDUPZC7le2L/9F1Cx8/iQiU2AhfPjUT3kFuqaL66TIM+Yn2gYCd
         eVBg==
X-Forwarded-Encrypted: i=1; AHgh+RrMvMRMvZuAIIXN2DOHqG8gcd9mVbAAx7o0Edr5UOh3c2Pjcv3LAZ6Yr4hFVPHs6cglLgRrfKWNpXHf@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLzJmt2+Ryu3f/suzIBHcIlDXnWOidrtUMN+CQpYBdwFc4oqv
	C93yOGQPO8G+foC2XipvwRUDLQFfRnHYJspcxwLvHCNXDgXFOMRWBJ/5g3c6O20kiY5Ct/clDFq
	64rInyLbYgeDr2YTHLe3p1YPaZzPv5MGcAJ3CidQOtfXxO2dvbzCAVAkAuZMDzTMT
X-Gm-Gg: AR+sD12Y/nAUqnI9K1Rz0G4VZhmIZaG22HGKBF6Hnqd9gAKv/Ajxl5DJdf5xntRLMDW
	44dAQzlMao3ONhkyIHDAyG7rzjz86r+ON7ieyBxIhsnkWCOKxMIh8WEAvFxjR1JksH8NycOV1iV
	pIEcHm/fau9lg0pyIsk+kU+B1dskHe7xew2gaUe6FVOjgXfTfanpzYPFhK/7ZatHDhkeyuMGczE
	5akjUvunN9z9VNlTAUUIZQ/nIGWKTiWqiLmfqX/QBK8TmsrN+7UdQmbjDtd5VNxrvpBBW2kUghN
	r+64Fk/sUrnTlJ36p/tKHp5QvSp0DiQddEGM6e2hXwYWz9LmEbhK0qkJbQwppAKd/oFszuhst/Q
	/6OfTPelPyZOxlxbBnWsx88Wtt798Zxcymg==
X-Received: by 2002:aa7:914d:0:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84c292d0d55mr23779008b3a.9.1784719930064;
        Wed, 22 Jul 2026 04:32:10 -0700 (PDT)
X-Received: by 2002:aa7:914d:0:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84c292d0d55mr23778979b3a.9.1784719929579;
        Wed, 22 Jul 2026 04:32:09 -0700 (PDT)
Received: from [10.219.49.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175a29aesm1172711b3a.41.2026.07.22.04.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:32:08 -0700 (PDT)
Message-ID: <a3505150-0a13-4730-b051-2034e0e2ff3c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:02:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExMiBTYWx0ZWRfXxKwJN4irNGs/
 kjxryF75OlXfIo7T8wz35O2LQa6kJloIBajshCq3YZaufQYD2x0S2uEgQbENGYcwmF1ho2JX6MU
 S0Am8KWTlyZlpbgYrBvKG3hHohgrlR6iQiikIUSiX/sgqMYMmkuc7lGi62eAHoP5Q3FtgyvUsqc
 Br7s2EqbUX98Nxm4hlXJzagRJ6TA3xu8tW9H7Nx9GHMQlLk7gLf6waJB+MrUz8UPTm4hlQdjYlN
 GAUXWp/iM/rFR2bdAIjSRfEtduWYOGn6LT8PjSov3bsYjYkZL6aOJtSxSerLiK7PlPUH8lapgoG
 YZyLliT6DqY3mvEBBYey6IZUJCggKRqGox6eDrUXg31pjDh+BFdOZftPps88+Iw4uTTXKMzx7Ce
 f5zRl5GxzaRAW+Klf1FQuL4KqNsPpSskeVoIGREjy99K1igpu7HdL5HP1Lc2nI9pdN2NKeL+WwG
 VHlvNWmEdDvb0dqWnmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExMiBTYWx0ZWRfX6yCdcM4T0ZB/
 7AK7WB+EVQLxKm50p/NyiuJ/Wx9zuG7pNmFRYUCWLzw6VnNRDRKdYfweLlLuUPyr0lDSmMQibAl
 0zd0Pwxui+Km/r2I+NWjm0iwA7D1FGA=
X-Proofpoint-GUID: a81DekqQSvRqpPhZ2w7aEOWnZGEdGLnE
X-Proofpoint-ORIG-GUID: a81DekqQSvRqpPhZ2w7aEOWnZGEdGLnE
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60aa3b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lHG6SDQFHwzuY-o0dyQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220112


On 7/20/2026 7:12 PM, Bartosz Golaszewski wrote:
> On Mon, 20 Jul 2026 15:05:07 +0200, Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> said:
>> This series adds support for LPASS low-power resource (LPR) voting
>> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
>> platforms such as Hawi.
>>
>> On such platforms, LPASS requires LPR resource voting via PRM to keep
>> the subsystem active. This is handled by adding a new clock ID and
>> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>>
>> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
>> dedicated DT binding and pinctrl driver.
> What is the merging strategy? Is an Ack from Mark required and the series
> should go together through the pinctrl tree?

Hi Bart,

Thanks for the question. The only cross-subsystem dependency is the
addition of LPASS_HW_LPR_VOTE in qcom,q6dsp-lpass-ports.h, which is
consumed by the Hawi LPASS LPI DT binding. My expectation was that
the shared clock ID definition would be merged first, after which
the ASoC and pinctrl changes could proceed through their respective
trees. I'll clarify this dependency and the intended merge strategy
in the next revision's cover letter.

Thanks,
Prasad

>
> Bart
