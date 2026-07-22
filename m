Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2222E7375
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784697167; cv=none; b=ZBGBW+qNEiRtia/6fzDNrgvPlLzKVWl5pLlaSH5eYKqpCNsxYqSkLnGhD3eV1+zn7p1rm64DvAngCtR1Voi8TkUuXg1Po0mcKnlYtTEFwgGiUhEW69IdUesPzg5ZJqTQt4xsj0q58i60D4i41uFTb1yQYxUfUv99fBc0QJUNxFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784697167; c=relaxed/simple;
	bh=+PIv0zwvDK7Dtbw1NzJOdvZU98UCOcchphiEw93P0mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kv8kvec3XFOAiH2Lr+IGeVSt6XF/RKhjz5RxNRKl9U0IBwhFKMcsCMieT1BtMozG1M0Bflf7DRIDSPbQH7lU7ccsfcAq883d6UdllLzdZW5L+fm1qTdcFVc1eQHP4qt8KnG+6D0edLXvATsFc2qRJTBI80Uhfjm0qut1zRl4H5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8fhP/Dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ofdzer1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8fhP/Dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ofdzer1u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53YAx3767515
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=; b=L8fhP/DzzjI+4mig
	f6yDPP96K2hL9htjwPruMMxRjoq+Ib1UytQ6sZ42PottOlu2coc0WLo++cSBv+Ow
	Tf5pfW4RzCKXSG64+BZA6sVUYEXR7hNZ2Vf6sqqtWERqXl1seW5TXiErGotIe2sD
	5YstWsP6TCn9idoSltCOY3+2GpmRafADmaPqxQmTkK7ce6tdgxCov0HSqqj0bDBs
	kfL1xpiZdhOp+dRHuvF/DlwXkicCYfUtFWrLWT6j3UuZtFcy3Qemz6uuWDwv2fJG
	P57/G2fa4ULpXkY5LC0V4GqijO3KvPzOn9ydfMV8z0m9jihO1cngi8v+Cqcaiwdp
	ieB8uA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rbf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:12:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so12605045b3a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784697161; x=1785301961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=;
        b=Ofdzer1u+7nSSbRrP2+2K/0FH4hEe0eAJqGxcDS9xgVhNvcmMTFPWfSTk/I6dQbGST
         oBy4462QvOOaDOgCZKXfnuTIhCgbBue/DcYTLecCkSsNrok6fplz0WeDfS0vJZN1NL4W
         0/xDdoZRug3yvinGaiRWvU9MmuIbEDraxLMHBrui6EUCnZybQUxzsZAbH2ZBaEeNQN1S
         sAJr4YihDp6p6t3+FIgzqOBbbnAMgzJkEsLv6P5rO1qF78CsnV/IFpny4pIsp6xNBdSd
         kTbuyrT+yA+e5AjPUCP95BbK84F50oswIFo8p4wtbgxCFluvNPRxVO/EmEfEAf0HcCe4
         j28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697161; x=1785301961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=;
        b=K57sSShNcTvaT2Uq22kYEPbi6lTSQYce7ob7qAtB9CWTA8q7P7+wsXOq9rAO3LXFys
         p0cExjISlgs6QL4Q8ZZZ4+REdNNbSwJX+Uh2zuyPXjf3zKbhve74flTF+42d4LGFRmSV
         V8UAILeIaqZeCe0ssKqRc+p26ASU2TFYDdYywMZqiMSJ1K8Ev8UMnFk5cma4KITH06o+
         kcgUtSB66bC8IkqMbaB5/AWnv5oCpFZim59UtG7ihOuBPVuqmH9+63dNxB3asAd9GRye
         oCYIo4q1OBehyoJW16+4sZXv+L0LcgV1h0hzjT/77Y0GEdZb1Ca35y69akZBNW6PKehF
         Ku8w==
X-Forwarded-Encrypted: i=1; AHgh+RqapGg+kP1ux9GtnXhiuEdbtvsA0hCNHCqKd4D/NJrb81plOT6lzJvP7ABNH2kOqtkb92JyUKTRIneR@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4VP0vC8/StYnTYvDXGwl9dXR+cGP46EEfQ3h2YzdGDIjy5F+
	HyoCsZJ8dVSkQ2FMuJ0QFNobQ5Rh5sau/UboKtxW7M3J0OahizU3rmTft1+C/YQuoTQZEhwXuG2
	6mkvuHGgGV0rRiwyBD5+fcbJbH+NJ2aNGprwEDGsIX9RuxjQ8yMXF/q6mzUq5xC59
X-Gm-Gg: AR+sD11bUeg2FzQqtX/ymykjybbZ5+XzIQTEXMhDdH7ZaQGACC8/LoVRck8BUxGAhW1
	TpY0+CmnheJzceQcUPJzunkZtUlOeIsUedqUTsCh8WxZAsT7AO7QM+p1kHuGKB+bGJw2KQv1xcL
	6wCfI/71kHWRBDHQ+8gGFYQiQWyfiHn3A9ugrg7Fn1pV/H96y9IH641dz1WwwC88F9vyxgMmCYg
	cujCkQb/4pzp/cn1v7Wnz1TA/Iu1W+fZhxbMnDCT253WBTVOntuidcgRrVGezvlKFWEE3CbvR0a
	MnGtyqAOyk6VPk/QxXY2KQFw4SJeEurL2un0TSgdwFb+MxvAbhXJRVgNb0OfrkOU5sxthtlrimJ
	Nh9lp9aUcRgxtN3Waf06pSB3rx0g=
X-Received: by 2002:a05:6a00:21d2:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-84c29333c94mr20107635b3a.17.1784697161185;
        Tue, 21 Jul 2026 22:12:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-84c29333c94mr20107612b3a.17.1784697160756;
        Tue, 21 Jul 2026 22:12:40 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1728566dsm701761b3a.18.2026.07.21.22.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:12:40 -0700 (PDT)
Message-ID: <7c7448fb-085f-40eb-a471-9ed81c55973c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:42:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
 <20260717135608.GA476084-robh@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260717135608.GA476084-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0HRjISIFJ4bDexNqjMeVmznCKImUgoD9
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a605149 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fkvVebzWtNyKPa1jhH4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0NSBTYWx0ZWRfX4SYdLRIiosGg
 Ikl7x5TwE2RoyoCNY9KvrEZ8YjM9RHeMnwmkpVLxfxMQhF9tqalkq69efTlU/ckYWAKGp54IhsA
 Z8I2+qz/t/Xorun6KjzoyHev93QPH7/BnsEKV2atWDLGuaAfmah0VShhXeqv0jNB/+vDLV4/ydF
 33gYQpG6xTcVJAP3SN2l6nI1lMvVSZU5086L/uSp1pVGNdDdxs5NUMVs7RW96vtly9npt2F9DQ3
 sH8BXR+J1m4RzrJTkyC1UB+PzvEUBTCg9mq2P6f5dJn3YHn0OqTfyGiUUtxeTs7CQjtLe66YuZf
 0HmyD9TzzYJCcl6j3VYFm74QiOW/GpkMWJshH6qEM4dAD1l/znL/mIlIw6ZIso/vPm+Ci9W7e1X
 AriuZXcWcNhdXgsQaJWvewRtgrd76soKZZE3jjxXs/ua4zg/Kpv6TaqsqoOVTfLOiYPZzWAA1bn
 0qBmLaAnkjUFN7AvCdQ==
X-Proofpoint-ORIG-GUID: 0HRjISIFJ4bDexNqjMeVmznCKImUgoD9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0NSBTYWx0ZWRfX1cXqbZw3hxjn
 2I0Toc+Z+ZrnWQt+EiJH3e+HmVlFZ+Zean2Eiq8iVpDpS0Ylkn+joj1t6UHnX/mcXJrwn+xfTfY
 5mHmnS6WqMT25axG2ircuCQSHgEVVTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220045



On 17-07-2026 07:26 pm, Rob Herring wrote:
> On Wed, Jul 08, 2026 at 11:55:06PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
>> that provides clocks and Audio Core CSR that provides resets on Qualcomm
>> Shikra SoC.
> 
> This should be 2 schema docs. They share very little.
> 

Sure, I will split them into separate schemas and post the next version.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
>>   .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
>>   2 files changed, 139 insertions(+)

