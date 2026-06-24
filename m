Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D93BB104
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311061; cv=none; b=d/X31u7Cv2fTvhWUtBchNi+vbHTFnkB09jvDL61ITFFqMS+FYyL24JdMUFQCELGVEYtmEEz5ptkhGXsBgDeAKFGsvG4pibJXz7vaSBBVqX05BWTYeZalj19qVWOKDQdHyPyHqiI5+nBx72gG//qpcFDjUtjfHTAGhXV72WQCvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311061; c=relaxed/simple;
	bh=sUH4mhOJLeZVGxgqP/fn1DEaZud1uq+TQEi69PSdzQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqEnNiuyrPL+U1y9MeCzLix3AQM8fpp1YouxY6R2a5fzdnB4XbgyDtbU+Z0oOKK+9JvAZXwyn6+L0RFcyuTOLxZ20dLt1QOYJdfbN1ZUIgPWEps3Ue+E9AhsrEYlJ5VmR6r8JBU8TPEsAsdE+JzpS9JD5Go/j6ia14Br8HY5KsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7do+JOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhhXnoDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7do+JOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhhXnoDs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANY5x2869036
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=; b=S7do+JOEZtLF251v
	kZ8G7PLpc/Jl0VwEErglZbMtl83QtidpQZ3YkR63hScXqeAsGCcVZZOYN7j8UiJP
	Xyf3Hi628woSSAnLCc1aFfpAfSiKTBGWsN+3s8AZ2zG6RF64j0KGa/nDM+f6s9eE
	6NYWD4jHtoK98HFwUA/stx7gEK96fLh9biXI/I8zgstSQ+WwwxyqJIXOe0zRoaJu
	zCXAWshwu0OjpjjZrBK+ICJ7GQp9xl6+GL8rf5stDGKVygwhoWt8Q7lEX9wfmtQe
	TNMFyCtqDMN/cvIXAL+Mxg0HTX7cvJG13tW7m+b47pf4KvMran3+EvgC/Qko8k/8
	8ijxog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq1k3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f6247c6so1539231b3a.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311058; x=1782915858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=;
        b=GhhXnoDs61wWbUkdBEEJ6PwavlRDebFms1KetHckHbGrGrDnKsyK+EqD0VSSilxjmz
         BB1we9SJOCVw2Sya4okuTkx4BU6lFrjGoqoYhHLUHcoIh4T6bzlcx3hmpUEh51JH0SLs
         Qk9d3zgYG+MQO66d5tA55zRhBJTGSlfE9d8KRAoTCIfTSRyD0ClkuG5L/S9e9/V7O5ll
         67werX9yckKfNIFq0+FYDnO16gEo8NoJAoyWbBam//DeYCAQXSLX82Fx5jsU0JMhd9Ta
         XoDJWN6tmxRSxyfevKnN+fmKkTmcEHx7p1nBOCJ6NafLp7PBKcXCA0R76m1FDK7cHF84
         29OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311058; x=1782915858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=;
        b=J7qO6Dw86qd30pqbQokADZWtKSdx0gT1nYtYQZC82cf3b4qnGwbqZV0Vyvr8L5JSP6
         NSqZ+FUqJhJ/gUZRjKl5KRFaNQht+RGGFqfeW9H3iQ25QLo+F/MfVREOQAcg9mhtguVP
         Rgh1h4ZGkhpQoNCsWRzInOLv0M5kuCzTPJDuItgFvi9S0RY8e1R+TjFkLVBwMObTn+/j
         BHAlRucwPLGilLQGs/zwjrXsGjoMT2lG15d348CFHxQ5eIupcPvpp2hJ/gity7OLPtMd
         fOgrcgYn6VnLWz4lzxZHHJnbg1YKMnwMIrbBANbPe5u3OIYDyxoX/tMk/QFmzDIJ5xtZ
         SjUA==
X-Forwarded-Encrypted: i=1; AFNElJ+MqLLu+jjl1DDrSj4e5LSOS2eIepjLe85kzqUFX4ef/8l7MuyOm0DFAohL8QQ2mrZTJIknEceo/gvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1M3OKz9nNqkUZeSN+yDehUfa6NK7VuLxlwrUAPHGVqah6Sja
	AeUp/EYDM/tX/WKVDTHipsl/rIZOb/6aChTT0qtao/ZX/oaXLrIBZHTzvmyYvsHTn+q7HlIj5hX
	imNAUI9uSheWBSfLYEg1yAy+W2+X+GSVwUPnNZc9ZIfHhL/CeFP2Qw/PGDkzg5dZ6
X-Gm-Gg: AfdE7cmO/qTOX0DyhJhj1xqKum4dhUQhFM6oRbmh91DCmY/hwq8ImsoCF2OKg5Zb2jl
	8pekgPZoIMMdzbJwE/SXFQeagV20qJgW4QJGaat4Z6QG4GxLie/mv14mjz5m2ime+Jwzph/sl3i
	SWHeyVxXO92VoOsBSSSlETrNHbbfjmzd9Y1cNPmtjBEdBIlnZ4g0CPdIbFoILSAYHbELCCufdyB
	jvQoFPkP60tKTPcBSnSlSYRXuqzeiKTVBlsZ4MGnkAtVgoFm3e19JINnf+dRy5PkzPqYPmn1Tfj
	T5MwagOLP4r5OQ4RXnPVTlXPWL9AGOqUOP2ohqD4+zxUFJFZ8BoDb232h7jE+F0eJlOSUSZXnXr
	Jq0sjBvIYUsbbLQknlnPfh6+SDJU1FxuSWuPsWQ/Y0x7o
X-Received: by 2002:a05:6a00:12e0:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845a2cca4a9mr4360611b3a.45.1782311057769;
        Wed, 24 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e0:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845a2cca4a9mr4360575b3a.45.1782311057370;
        Wed, 24 Jun 2026 07:24:17 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm2464066b3a.30.2026.06.24.07.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:24:16 -0700 (PDT)
Message-ID: <bf048b4e-e6a2-407d-82d7-05fd360f8276@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:54:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX6o6JrQJHKSd4
 RMr+nvpNn4EtIFMoIZO4G9eyiUBl4UvXQP3dECQ8xxt0ukCoUAMCrnVLS3ntV1pHaxhg4vOqF5n
 tUfyjS/TSUrPW2MsfRe4moF/ISRVFnY=
X-Proofpoint-GUID: yzkuWcRNR11X5_r2czYtRau8OrlTt1sA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfXwFHhkDUKzWU8
 4IOmEBrwy13G/zvvfOQ+oJ4vvI4MZUwbWyLuBM6vVvIoRz2LSugNlislyxSXEs8mVSSJsVJr5i/
 Z9WahVsqdFsFSPmSkl6/DwBCfAESMUprGRufeqehdQZxswJDzkju4GHkEdpcO500JcWjOuyeg1M
 9s7f1yAeVqMjlnZKOJbWKRym0c7YQxWeRwLy3nmRTDmA5BDOhqYdNhgGiXkOSCksIsoUa6nGFLl
 1kRGVKUfUOvTmHJjpxFI81XsXzrLpKdS6XTU+cwYLx7+nigGciWAU/G0nUelOw61k0Xozao9VMP
 aIogOB0jPanKkumLp5jQK+ct+mAPbdX/1DF7m+yd8P2YT0kYEpl7Se+j7NJXnF7WuL8KW1DFCnp
 lYcekIB2r3Hv2rieGcywr1v8Y3Y0Zw==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3be892 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jQEFaFJIMzOOsnW5sskA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: yzkuWcRNR11X5_r2czYtRau8OrlTt1sA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240120


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> As the Iris driver now supports the QCM2290 hardware too, there is a
> race between Venus and Iris drivers on binding to the corresponding
> device. Follow the approach used by other platforms and skip QCM2290 in
> the Venus driver if Iris is enabled.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
