Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B03B71CA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280361; cv=none; b=XcM6/NAbJnItatq0sQWudFURJb+LE7t9y14u/pWWGzzKlyP+DZVJWmSw8E3RHboio4HSvUfRFXrXHmdxUQWxRkob6Y+wW0d0ZDPd2Dg41hsvwK7X34QiAKFInjQKAokJmL/Q8C87p0S5FIJq2nAFsWGgMdVoD+nxG1nIJVZpFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280361; c=relaxed/simple;
	bh=UUu0yhwA6E69V9YantX0L2H5+v2Hw2KIgH6t8T3r2jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrjt3EdkDCmzXVg9v9BL/CVEp2b5DCdJV4souIjTzQrdlLTMiUIpgzyoFVfFM9S9OIYmMgHhEVnxyatpj6cARE1bSM+Bt0IxJKHXNg63uuC/jt9dqHlpcDrUEfzJqKkWCLdag3l71wfuHx3/IJhaMf3fNB9gVfdKgB894Q+/G0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQmtDInR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeWLYXIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQmtDInR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeWLYXIH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9L84w1461608
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtH+sYSpZT+y6pPmChaU9tOu+tanPYeojGGHeDm89p8=; b=TQmtDInRRYSNWJut
	JqnBphO45X22XNBtCJjHCdoHFq+iG+LsjqbCy12tnaIZL89hlHNVJK1AiV4Aj77a
	7qVVI3BWfSQ4YK/p1l0dtZFz2kzf2efnyE8uPxffnNZ2ZQiVeveGMeAMXYhSt/ZV
	WNQvhqr7muz7sG1CFP79qnlnr1XJ13aE8y7Nqhcuc9iXq/2NsmRTP9MmOEXL3T5M
	OofL6zPZVveu5EBRMMiWL2l/SEyrcfRgTLe2FNqdRtrsuOF5+a9myLiZhGuroksj
	Fj4+pQjT8c7n3NLiLEhVqgdKsF/jKjaX1e/hUp2rx9r1A88l6DdijzXr0bamH1L6
	S+WYLw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfg0m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:25:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso50877691cf.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784280357; x=1784885157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtH+sYSpZT+y6pPmChaU9tOu+tanPYeojGGHeDm89p8=;
        b=aeWLYXIH+kscYkXDI6jgJSt7MyLJI6KNu6rsEIj6vG2VKX045MDX5B/XqBCEsn/+DS
         7XMaW0ciivAISoOCKgmVs0r6iJwpABxt0pdYaoCK7sdmf9JOL7YB0XZl+bn+4AJDmtK3
         8JuJiwHfve00wYm36//m1DIO1yLoYUfQsauz1n6YH3SF89iEv9dVRRaYEmnoHjQ8RtTX
         JIo+/UaZ9ddByru6eG0jOHyRuO6MCXu9CyKUX1gaZUI+adpn2Ou1ez/P9h5oIEJeHSeW
         5+vhSI8GFGEsNpvf/c21ZGQbt9abZ4e1w/dkcYpXqodB22y0uMtkTZ7u8z8NrU9tFExc
         PioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280357; x=1784885157;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtH+sYSpZT+y6pPmChaU9tOu+tanPYeojGGHeDm89p8=;
        b=WXWYVbtnqqYvLtVzXOTlnZj1ExFPg/zlQ9Eprna0WBzO2HOth3GuJNPQXv7IBF/aqq
         k7glms5HvHCncXCcodq6poniAVFlpfa4vbx9rrWEVCYzazrw2SkMn56lIhXeLU3BneRz
         p00pM+xzmpPpS/m64aeX3uVhgVZUDdGmm344qUe8qPVgwA06Fv+AdlSdw1GST/cZl9za
         8jgJ7RoNUMNv4/V9RRvPNMbgj0zppOiQwm3z9AcsQmld2phhvF/4AOZu9JJOS4njCXOj
         g8YiwujuMKXE98SC1ThCNka8YI8958t+gjacekPRXp+01+4cUrSh5KbLq1jHlSD2dTb9
         Ippw==
X-Forwarded-Encrypted: i=1; AHgh+RoioBQtuwBvcIOgOAAD1SXcfcVIsQY9PuSiPfNEmzuFFRjHoGCwBXxMJ5nbOC/TbtsQhEV6mrMkIsvF@vger.kernel.org
X-Gm-Message-State: AOJu0YxsDR7ynS1LgLw710MuOSdXGYVsGsxievQ/fWJBww92MjZovD74
	hbiM1/W6RDwoA6PNg9H29+TXZrqs0WOFaeFleGu8zsUWXEbZgZMchEsrbhnBkIWfC1rlgXWCJSF
	d+QE0I1Ih1S1SFGgt3HUvYVHlP2Rs01InfssorX5qSz/iMpeb/j/US9xwl32L1PC8
X-Gm-Gg: AfdE7cmFA0UEbmduP1zok55MMZ50CqzGKu75aqZFIZJpfUME7Wm+N36xUQ0hMX1DkCA
	bY0Wtq3kB7RyXUS7g2W1r+vxEmPUEleNsXHGUQVmo3yvi6IyxPMUqArSkE67Kl87A8/eA/oMPg6
	7fJZTLTDMQuj815lD8iyf/vLpMIZ3i4+7NRTk6fK5rbuPJW48JXfnidXSwPJXWbBwlDs32Z53Xr
	SQXXSwcXfzVwnHM7tXFgwVhAbseo1eBfSZamseCVGNn6U6vX/k7Gh03k3UMr+NyJrxSDAwNs2mZ
	OVsVjQBdntyX7/6vY1oZg8YBbT/bOy5t8RG4Z8m7DFcaBowyjp2sYsewu28RHuLkYBxnQqxyvOc
	oggb6MpzAz392iv//aVyo6Fa6HaC8jQ==
X-Received: by 2002:a05:622a:2992:b0:51a:8945:3136 with SMTP id d75a77b69052e-5213e48ad0emr12623451cf.56.1784280357522;
        Fri, 17 Jul 2026 02:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:2992:b0:51a:8945:3136 with SMTP id d75a77b69052e-5213e48ad0emr12623301cf.56.1784280357135;
        Fri, 17 Jul 2026 02:25:57 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm34097465e9.6.2026.07.17.02.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:25:56 -0700 (PDT)
Message-ID: <0da6b426-a9eb-42c5-9476-9227a61f0794@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:25:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX6SjBPazN7oLZ
 ntNIlG1e11HMHkY0PyWi6aValn6t3snSs5XrA0HVyPlkXOJfB8c9pT1TRxLk6bfxRq8TGI8g3yc
 XU8Be+o5tzKyr3Zz4NoxiHbcpeu/0uE9ZSWaap3+QGNhHYqtLNIibaVN9oqt8o0l1CL719Tyni4
 E04ZjaY9zeRnlakeoD+5Kkfb22JdqGHTbcpyUsyAuOb+kA4eh3IttYR5rCnepNIue8512EvunP5
 6JLKXafqichFuG+H9ATwGkumTb0lFe0RXNEXBRNOQhBKB/M1Jt3S75DLo0E7hbjIT2s/qghT0Ss
 0n0GjoVr0c9D2sX9x102Xwy4IJkYnbyqU2t/uUsHEi1wsiMwlGC0g1zD1wzJUvO8nylyzStEnni
 TMk7KxWGhnYH8ycRmGdz6cUqSnmYqfe4ii4MAxS+RTww8NYXc6sftkV0cvAbQEjYIULDd1LVgsu
 RH7aUFHYYDe3/ekRXvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX7LYmiIYL3sgG
 1PL20UH+IGAGnDZ+GaGYHFoD3qvvVbhO2vIY8YaPp+4WN0+qfd09MtJSFF7cREoIqjRoq7LiWTp
 m4jl8QaTpFDCz57kFj+eL2hdc+JDyBU=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a59f526 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CtGaIe7eZSrXIIjUQnIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8qpG-68jDirpvtW5Tk6BHhHu_wXQpx9O
X-Proofpoint-ORIG-GUID: 8qpG-68jDirpvtW5Tk6BHhHu_wXQpx9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170092

On 17/07/2026 09:28, Fenglin Wu wrote:
> Dependencies:
>  - [patch 2/3] depends on [patch 1/3] and they should be applied together
> 

Why are you cc-ing internal kernel@oss.qualcomm.com?

I already asked you TWICE. Both times you ignored that, so that's it.

Best regards,
Krzysztof
