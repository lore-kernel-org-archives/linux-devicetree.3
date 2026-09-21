Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0C44F54F
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979962; cv=none; b=LvzuJBKRwTsIZdWqHqtabx4IB4yMFuHzl/0HRvf1jeo4hv7gacgUcrlAHfMOS2y89y3JOPx9AHdZO/4puMEYSVWJA2V6wKYrW1VXm/TDWOBMJ0qi6/ntXA6b/Aj+UC4rK7k26m7iwSO1+f0rcY/mUG34Ab9n4MIoxL6T+ovdWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979962; c=relaxed/simple;
	bh=XTE0kn2MoO/iNGwudDMabaFjWA+xpSyJN666f3dQZbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOpdeYUemkrKPPBAhaomB1YO1nSBLNxwpKp6D9Er2KwpQij8xGNyEc+BDmnC+jpxyJGINhp1XBXCYhVLtFOiAKswow1aMA8dmRjjaAxoEuIpFWquSAiYcBuucbgunrUxz9pzUBlvSxfMQWlNG4rS0WfQowD/V2QV9kppYBgwoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7O/avnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTAdUcmH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7O/avnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTAdUcmH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7EI9W759266
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=; b=V7O/avnOinz0Bj8m
	MDWMHBuCMNM0qt/ooJDqcxX084KssfcDxzEKco/h2pp46wfYTLsD4AICKc7j7TsQ
	53tQ3LZPEvl0fnqvNPHoHnDv0EXZHmaBofuwt755qsGC2YK5nrjyvVOY7pNXf4xD
	D41z94n4K0fJhkKjl2hUFTygKC94AKfnusJEgsCr8eyynao2o4s/6RtnTUDd9uuj
	8yDs2DBkMOMGCNGZf4YxRw30wuii6YqqVaqWK6anuc21n1irEnLdgg+Jlno/XV9k
	lZZFmWF2q1E8Z5JLmYwih5ULAmAyZnFAnd6nIw2pm9Ar5pGgCGGwr514v08DJ4Qj
	ruLS2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118af0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:39:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so107742085a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789979959; x=1790584759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=;
        b=GTAdUcmHotNiJwur+ijsX+NyMuvJWO2Tot5+0lzYMVuEZunOnigHrMClLT0kON0dUQ
         GW3b0EyUEGZ6wavn4zZcTWc2mThRhdA0K8u9ZQuJl1fbOhXwZM324zml0kmnG27N3YKT
         lXgqVaKjKCTyIDXgZ2szkh1D5ONtbl6ICAtGTlQac59j3z7IklTrFRkE9kfWhODG9Zqx
         lKqtiqMpqLZemJEOy+9V1uavRzZyK7tXjzlA7uovict1YueXDE8W0lgXzSdsyhdpRqj5
         1ehyhP+dZSOTLULj7aICaBBlgk59sv3mLTqmk/AXqi7gI1HpQIE9VY6gdkmueBYxi6bE
         9yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979959; x=1790584759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=;
        b=zMh6gxFV8ldRnNrzTE30W3HsSmodbu9OuyLMajQpceKn/hM/ckYS8RtMACFbihzzHG
         7mMPVDDA4pSfR3kilDzjhjh+ZeisGsL14divgXATcomsAgHT8K22XOt6bsoX4pO7BaP8
         5a9isPXKVj+XlgMyA1HJS6nlevY06v3avYi5cqi5T5AHZkJ2gC8rfHI8Xvz8PZBatm2x
         YxHFZ+0gjYebss4BRvAIwxX1faHtO3pUgIKQBk8FFn3WmczrPwntCI3e21wKmlwgfTUx
         Cp0HLvULI1DSGtC1NLO6LoRgb65wkgZCJQbhuCUr0y99JNOwqHVYgsh6BRSkG27w2Bfi
         TZtg==
X-Forwarded-Encrypted: i=1; AKwUvBx9R+hQpHRwkJfmMTAei2R626e2Pv/l9eNMzAxX62LktO8bkzwEBHkKj5Zp2mnQ0H5sPmpNWtWRz3Y/@vger.kernel.org
X-Gm-Message-State: AFuF++ltT+ol4JG+me+lmTRiBZnMPL0MUE3JDKcT7uHH/Y1IkBvZV8H+
	c+R83DZEh9Y6TS5cuJ4J7Se7JsCR06BMTO89t6grpkt8d0CZCDz0EDYS7HZRqP2zmY9GD7Ta/ob
	+eWM7cdRsWmzADiFhhBZ+kyGPAUEfsgk/ahAwKrw0voXDw0DpAYVRbJzXIQYvx6Kv
X-Gm-Gg: AYBFou10zlfjg2vyPwWkdDnE/2mi/XmrLa/Gmorlev146ycLB2cgssv9JuuXLAY0njC
	/4OPuxsfsDsB/D7mLTcbgtwwP4tUCtoYD2+z7GTq/7nVz2RcFXxe/j6gKxYMSbrvX6f0mw3lDi0
	7TCgcsHijCUm+GBUg+NEGWb81sFaopLr9IJqfuzLP5cI1s5Sbz3aABs6FJtNgUAG0/MP1myYxJu
	DMnVyuB1aciY0Rk8UcpwcQvchUthNENH8jj/v2Hk8KqGKxtvLlS6eHSFHFZkKPXBXZYuEzz+GGa
	bsZ2sI4GNSVvC7JXNMgWPv9Qa615rMCJBlb1vmi69b/E8qNQRaRlTxZ/5H18cir9elKW2oXuPx3
	zVEeIvxeQN90nuPWfDvMQlw==
X-Received: by 2002:a05:620a:4592:b0:939:e9a3:3105 with SMTP id af79cd13be357-93bf58b5b11mr914962685a.6.1789979959563;
        Mon, 21 Sep 2026 01:39:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:e9a3:3105 with SMTP id af79cd13be357-93bf58b5b11mr914960485a.6.1789979959176;
        Mon, 21 Sep 2026 01:39:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dc582csm3864765a12.16.2026.09.21.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:39:18 -0700 (PDT)
Message-ID: <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:39:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hzWLQ8Mc_a95Tqn2H9_WxkOcdsOtFoOy
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab0ed38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=zKUMnf7IFlsw2KSWKZIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX4Ooug6SSSrxq
 CFNEll72rlBRIdRvpgePNDYyyPEgsqDvCLipKWGKat9iCAo/nuBx/2nqVwrsArdTaDKiVEk1CYE
 mgsMq2RDRVrgPuMFAXtVf9EBUv/faZwkQUiGyakvkyCvwFiJgwBF5SYshl5Is7RUkh3CaA8pJbw
 EwlZwKIm3W1HyMJM9E9msOJKA9PDf0yXwO9MaiY5Is2TsYe88YY4+mEKNyqKwnhxeaaDt7JgMnN
 waK7d4CRUY5CBnjUip4+t6oCFD7Lb34iBauqBbVRPEf+yX4OZHWUh0kVatX8mOpeapnSKxisk3f
 jH4ZsVcsddUSYJHPS2j7F2rdV+bksgwoKH8rfT6qMRdGfd6uzboH8FE6a47kkHgHwO3X+mbAfmZ
 AfsApTgxSoR7fHZ9IKQ0l+iCSLkMmiTt27XWMBpv9waYSIg+F/oNuybV1tP/jY4T7EHEnKVKFbd
 WSCPBNYl89mfXlh78vA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX3BO8XA1iiV8g
 H9bcsh6BKL3bMVpbXu7SkkuKYVuqbDJBAuA1vHtshZvi29L0R7MuRJF1yU7qrJytRptNXxd15/o
 1l3MJL8mVkcejVLRf1iJb1qbKE0eR78=
X-Proofpoint-ORIG-GUID: hzWLQ8Mc_a95Tqn2H9_WxkOcdsOtFoOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210124

On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> The Qualcomm PCIe host controller driver added support for parsing the
> -power-on-us property[1] from each Root Port node and programming it as
> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
> this, T_POWER_ON was expected to be programmed correctly in hardware or
> by the bootloader, but not all targets support this, which can lead to an
> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
> behavior.

This is a good problem description. Does it have observable effects
that could also be mentioned here, beyond perhaps lspci reporting
an odd value?


> This series adds the t-power-on-us = <80>; property to the PCIe root
> port node(s) on the following targets, so the controller programs the
> correct T_POWER_ON value instead of relying on the (currently incorrect)
> hardware default:
> 
> - kodiak
> - lemans
> - monaco
> - hamoa
> - glymur
> - talos
> - sm8750
> - kaanapali

Because you said "currently incorrect", it clearly applies to all of
these platforms. Are other ones that we support in the tree also
affected?

Konrad
