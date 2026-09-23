Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93285348883
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179981; cv=none; b=NiR0AQiRqvH66q1Lz0tBcpXEY5YW2K4Q6aTT6nAOSVmGdB/2rHy2tpQCswIYPg9oa/rrt/ybyUsQ+z2uirKfYTYrwYWIcbpyvXeMcV6gDVWEtjuY962UetzHyfuIsCxkWNPSuC3i95ZSQuTqQzLDIpUGI9EDcUkrSXUvmB08D6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179981; c=relaxed/simple;
	bh=WEsX3nfOwJeTjm+sDD5a1HWuCIPHXuq7a0qd05FXfSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYRCf1lCVmMbzzAGqjd+LCQsC8nieiXAMMiXErcC+FEW+9+4e10CpCJJEOBmdCyZt/5fpDl6P/Zk6+W6GYsdg354leWpy6Y1X0AGaOM8gUZFDuB3xG2lZaxNGvTu5roThyZCv9U/Tey8i6CMa/kIwjw4tWku8D/fsBY3mdp5VKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwlwzVye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPPVb3JH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwlwzVye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPPVb3JH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NG9k4o3893650
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iX4hJuIcUIaSD9eZWRKK+hn9xZsLliBabPjwvtMt+nA=; b=jwlwzVyedKeA0Uw3
	pYcH7l/EImfd67eQa7xUKv50QoG57GGvENLqAitEBZJaZhKdf2ck0gZmiFIWN1y4
	CeHWgRUGqopCFoI/jgplF1AZGeDvkgW4giLS6EMyyKp5pX1KE/b5cTc2rA4OTELK
	o5yxheJKBy0aCbLO+WCvOIh02SwY3CJQ8ITjAetkzr47pkZt2b0wlBITMj5aeh7v
	7uvgWt0Sz/AiEWLi1q1F1qs7xaWOEpwEFJSKkr7AIA973Twfdz6I/6Qv5HgsDjjR
	Y0//8iTFv9aCyX2cxPmj+bBg5nQDNkVa2h6r/46/DrZQa/lnz30TvLyjbR55adg1
	yZoDjw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9s7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:12:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso16304137.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179976; x=1790784776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iX4hJuIcUIaSD9eZWRKK+hn9xZsLliBabPjwvtMt+nA=;
        b=LPPVb3JHHRcgjBWR+O3ETuWW8zKdGdyFHJbLyQz8js6ksIW+9NC1Xq7ZwHjS/6Gjix
         JIKPIDjiOkMLdeRXaMbUiENesfBQJD9X6L82BaGlr1sjgNkHFKrMH6XHrBfsox2AIil6
         ZNYRaQ3UmB58Rgmnwed/w39Ne0Bhj8y66hfSM56v1v/6DrfJ1Oe3CMXC/KslFaE6QxY/
         EGVnM//vZ21+PjKU5yFU8AVBaCr9bno+sodEoeqbtWDuPsBa4GZ4ahyluDvOmQc4e5TB
         aFlV5lSunIho9lADOJ47rg59MRG708VX2IFY42tf0XsIaLv+nRRKUdGI20oai/b8dTrC
         Jh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179976; x=1790784776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iX4hJuIcUIaSD9eZWRKK+hn9xZsLliBabPjwvtMt+nA=;
        b=p0/L40xQYyiBOy2b+QA1BS8L8/NMG/E4OsRIV136Mg9ZQ2MMBilkt77ytHI8KPvlM8
         lbeqmvmA5Odpr1LNWHY7aQ0oWEoGpSFti5gIeM0kq7yfQbU8jesQ1PNWuAUAtJB1Vjr/
         dxXiLQoxou6Il+1chJEAGsnrRELui5NnxB2PbEQcjspVasN3N+6p5pI4GmGJoLpI3FPo
         daEoyJ/9sTcPKpELRt9k7k5fOlwz27+sS7jtAVGCqQRNV/Ddf/roB6MFN3bcRhDP1mX/
         ppm8g4MjlLi0yA9Sl/pOxGjKBIFxTw6qc7Z8nzQO/D0wLoxRYjEwwK6fq/Dis34NGYcr
         2PhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWvGLVxftxkQ2VyN05duSbhzjRbk/wteB9yigNb2teBwBF73w+JAckfRui13+OTFNheeIO7n0Y1lLj@vger.kernel.org
X-Gm-Message-State: AFuF++mJxBUmMu7nk/OM3e5F3DrdMW/BHJGeTwRqje3GL2q9yar4nd0F
	JilwNMwdH83pXkacQn0Ufh4TmSgvTu1fjzZzd2mq9FPXxJuXT5jLtZ0wkt7K7OJXuqkTGDlf0nX
	t0Xje9Ft5968llE3vYS8Fv0kYuglR89GQA9jVH3c8vlYTFysclOgo+Fkou7mMFB47
X-Gm-Gg: AYBFou13195X4hggZVdh6mmr+wtDaQoSJ6GommcYRui3FgggsScHvE/Qfhv9XczMTZA
	j3wMoHUfkB4GZgRXJ1hU+TrSy58MvS8KV9JSKjfrKbdnMGAIsimcXrSAKApo/L9AmUZ4t8V6lGG
	H1ljau2QVy0tMQ7j5WYbyMuWtXnkfl/zukn/HBWLnndcoHvmhizgLGQek9PwWcrEZzeNIgzGo1T
	NpZKTzDG9pr4cWF8D8AUF1mUFRFX4DhuWBpy3w0NdJTG8afa9gtICZK8FctB6C0yj+58cdX7h03
	qo1r1r04sHXiDSbuCIiNkJKnfBTKXnzu8HggDPWpZonoKHT1JZ7xbi04Ftm/nxTsFrhTF9L7wOZ
	N6rxyh8fupDk1VDBekOI1Yg==
X-Received: by 2002:a05:6102:5e8c:b0:79e:3401:403d with SMTP id ada2fe7eead31-7ac1d0caf80mr2471818137.2.1790179976405;
        Wed, 23 Sep 2026 09:12:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:79e:3401:403d with SMTP id ada2fe7eead31-7ac1d0caf80mr2471786137.2.1790179975654;
        Wed, 23 Sep 2026 09:12:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6c6944sm152523766b.55.2026.09.23.09.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:12:54 -0700 (PDT)
Message-ID: <1640b77a-a3ad-42fc-a16c-6bd3b279ebc0@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:12:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
 <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
 <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfXwYGqWFiqF2JI
 4C78k3yh+BoCT05BccR2xNDoQpzZ1sJTFMD+OX/leMWvLdxCUmRBRQLq2urS9Bw4veqypw5qVJM
 HtkUdIxh9WvwU+d0SSvOLjiN2TiM9Y4=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3fa89 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=YG64nluAAAAA:20 a=gZmbXTW_CG-Mw4ipQQMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: qWVI-CniHwZU_3qRNjQmicFl5xzXhkPr
X-Proofpoint-ORIG-GUID: qWVI-CniHwZU_3qRNjQmicFl5xzXhkPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX+MMqTcVNcmrI
 NyJ3CylnusB8jBg3OA9WY0knJCUBK5bXbfkEkXoAZFseOR9LrRY4U7Jp9H0+Qc1yLDgT6/AfFLo
 OtNFGs8R+VXRSM23u4bNirjvAZ2li2H6Y94xyHlaZia8g5oQP9txfKjaQYLyr6pRDP1ShOaevPN
 1lKkXWPKKq/713X1UBJrxN5NSOlmmb8sqjTn/rs7/6b0miboYcY/mJ6t2c1/SI/bYcjMHKv7b25
 1vmvoN1CPxJ9bFvKuvNJvHigp8JurUdp3RmH2Dm9odFouUd2IQYfKWTdWyIGq3EXQ5/IbCL6rpp
 dCWpzi39G5hMZSAIDuFTA+YWUxG7eDu7riUxtEvTATS5/A/nIDwkaWQ49KRNuPhEBTiwCBZ//Pe
 7aIDzdHvuRxJX+OaCi3zEIAPP8DbY224tyYRJkjHoRjtk8dz+jb7NbXtK5ZpPh2F4M7eSKqsuyt
 V0YB+/jETJdr1/BCGlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230064

On 9/23/26 6:11 PM, Neil Armstrong wrote:
> On 9/23/26 18:06, Konrad Dybcio wrote:
>> On 9/23/26 2:16 PM, Neil Armstrong wrote:
>>> Add an initial DeviceTree for the Valve "Steam Frame"
>>> codename Deckard. The Steam Frame is a virtual reality headset
>>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
>>
>> [...]
>>
>>> +/ {
>>> +    model = "Valve Deckard";
>>> +    compatible = "valve,deckard", "qcom,sm8650";
>>
>> Sorry I missed this before, but you likely want
>>
>> chassis-type = "spectacles";
> 
> I wondered what to set, but I don't think "spectacles" is correct.
> 
> I was thinking proposing a new "headset" entry.

We can figure it out later. You'll want to extend this list:

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/root-node.yaml#L21

Konrad
