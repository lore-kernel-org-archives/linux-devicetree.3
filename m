Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A85E3B47CF
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284606; cv=none; b=cnTxoNOhjN2kMrO77WAEeemLSz4f1hkJX3P77QCUV40WK9nAmjoaj2+Akn/VeLVvriHazeUHqW1L93Eg198RQ2PI0lgh+k2/3NqBUaCA9uc9PAxn9c+ueCI3Mx3gteDE7LKZfFKaLmQdCPzpiUZMic4M1WeYEvLdh3xr7PksCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284606; c=relaxed/simple;
	bh=df59Xk7yR3KlM3Nop9TG33Euc01Wqj3JKaFTj1LdW1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cflv3ER6Cnm4vZm+IMLcQwo0iodY8loJs70rGHoTF6HgUSE1P9dkDA3nLSRTvnK4U85xRLwAmBvultHISk7aDF8qDcok8/sG+TEu5kCgM4mAU8t+k68/mpLIiUDuvQPyLMlqcOLlzXlg2krxc6luN+Om271zI2lrF16BkFtv9ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocljP44C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCOEhINc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocljP44C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCOEhINc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T7OQ3639521
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UySfCgJ955LJs37rWuiTegFDYRglF9oeDO5PYw8FEcs=; b=ocljP44CtJkbAB/z
	Qoc3gQ2MQ4o2ZXOenOsn5fH363WaY0ST/PXBY0+G4x34isCBAIRNRPi54/JwyJa8
	jtzTY9KXk0y6NuxAMGRSno/IKvfs/Tbn4R9zIK4HqSet5q871lBYyVtX5g/AK/Cc
	gKZkidEgo/MafZTvBt6klXYjBevbgH317qh/JdAj0yPxeipu5ZziF6ggaY+9vAAL
	9G4ueM07g5Wid80WUS7twQfaxU+gjldcZD3hE/FxHcT2vSWx0H/EGJMnGSZeJnMZ
	sRa3XS2Rd/j8Ea2o91urF5K7LA9XBa4F3HtSG96PHtIaIt3d6EJewfT1zc5oM8uJ
	j7t5dw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya01k8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb0b93e90so22141861cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284603; x=1777889403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UySfCgJ955LJs37rWuiTegFDYRglF9oeDO5PYw8FEcs=;
        b=KCOEhINcDEqXQndDzbf4Z7MdxHN3KYKnk/HMQFy9x6E8YeGKwyDL6SdMKCDW0FrfGh
         k5U5T6w6fKmYedeJWKUBy/4GGQ3NtITTw0CDHr9uLW5d+sRdgzQ/lnW6lwFSq70AwiWI
         gqMfA8V0cHBvCUTGnmHQHuQEZoBZaNN883s+vp8RDH/iJFT4cIhLEKXNz+nFHqOLyoxE
         J7NrzzM9bXCTeZjd5ibDkFmiqKH13M/CCauKnbwKIICkq//Kc8F494RAnbH0O2fEve/D
         3pC+A/uaoX+Q6KDS1cU1yRye1Djwr8b8TJ4sIoHHBaIlMhyT/ONYZAkcDditMtQ0BxD+
         w2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284603; x=1777889403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UySfCgJ955LJs37rWuiTegFDYRglF9oeDO5PYw8FEcs=;
        b=qvx3VvbX7KgDb1Va2uKfQeZj45Em58wl8iuta8A1iDhhwvvEqjHnqT7ppoIOmxlwX0
         8LkwTs6uHZ/QmfisalsmsPdIfOOM1mLJyIH/s/ApeiRVuF3sBwAuDLQmvhNaW6265J8u
         iNUcSJh6Zs7w537p9xVYiqvJxM3czc4UNIEeDjjx3l/OoiFzhOwmn/CdoTjo/RE/+h5x
         qb2I588mkOsgthZo0hr2Yj9EF8vypZDWgmcodE753ScOKniiRX+/78IRFp9JpT2yLJ+e
         7tBlL8CDF4zUe1ugGmQKOa7HaMW21gkNP5HT5p6w+T0+LR+AheTS2GoYmbkvc3A219v2
         +RMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b5ZRnuQZtnXASSNytjzCm9o67ePv5HEbMfhgNZ0Lt/wq+gJbnhiDb//RdHOG4byiESyGWBL51OpJz@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJ9a+6UqTWWPGl6Yb/efCfO6yYQIh5rMHK4NWdjLwlzYd8WxC
	0kCHBgKSElQi4SGg2633YtjQduRjt9h1w/lvFy44/jJKG8apEtg9dnTlR1tkywWN2HZA7GbMbkU
	YDlSfgj+pnajiT7NVnnT44a2xsAOBbT28wlX4Oi0Sf2XIm6oxIErKltnXpi4nDq9L
X-Gm-Gg: AeBDieuzCzJU+44Qz89UJK7iphS65DmCVuuZvFddJFS7xTP2Tq7RrdG9bZZVYHEp/Wn
	gh+CvLaZieK4ZZSc2rYlVKv0tFDdp2Cf2jl4B6KB4SMoHj99mcwd4tS1p4H1Mwi4kcj36/wPAWQ
	90IE64vCx3/nuLEww8u12lmTW58eoeQFW/897pwjnoTIYc1umJSLcy5MA73B6FFfitPABK7EgvI
	AbZ29PDZmbB2/mjYKM9X90U98w/V7wHch8pfP/qwi/i79GEiP7BVuUj0eaK8HyZCLr8Sx/KwwUk
	xYBtgufmMjWD3OHvw8gQ+aYKRYHOjiEAkfmhGNZ6Q3RKpT35SFolh6JcW5thO/7j3adGkLJ+3Ga
	vKMi1ajVXkg9fzOn6ONCIpinpVeZJEkk/QQk23ljO6DA8xBrZNx5QgDxHQSRd7wXGOesR4ocPlX
	EW0WXNbgxfZMfBjg==
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr303493201cf.5.1777284603363;
        Mon, 27 Apr 2026 03:10:03 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr303492691cf.5.1777284602682;
        Mon, 27 Apr 2026 03:10:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdd2b8sm1107652966b.25.2026.04.27.03.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:10:01 -0700 (PDT)
Message-ID: <97c230b5-167c-41d4-9f36-e62b97ff202d@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:09:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ye-DBj2FuNzkMl0CFgf0CXGu3xq_wRex
X-Proofpoint-ORIG-GUID: ye-DBj2FuNzkMl0CFgf0CXGu3xq_wRex
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef35fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TcQrU0szjGiQgjDi6ycA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX4JIPhsr8op0l
 0xbSPTWvHUj7hE1dIMYLbDQ0NWUTzV/JM9HeRN2ghXcQ0a7M9IOozPAHDEKlIa7va7MsdoxwSGo
 ShnqAb0mTvDjhvjIakEjy3pz9Lib/tNx9Jl8+bPs3JD4J1kSZ5hk/1HyZ0tKKTF/6qSToIALQDQ
 JaZ+e0AMg7sajSWrP+HxSxk00vK2XUQymfhOsPvoRwBCFhfQUSL+WgxJY5N9GBv6Ti9ctaChZuk
 nIjJjlXt+R/1gSvxjJFcOpAyUme0GeJ5qQrarud5z2MFCqEucfo7OAUAf7z79NME+uWO5hCaVSP
 cEHYkzbkO5h9vf4++VlaoTnUJfU+LsR3SQX26OXolsnZt8z6aKbSPa0Q9SUMk1Z0oZyxooZCwOq
 I9rUpHalmJMxorttuvyRTU5WVFkmMGuxAittxUv97mLN7ZkjwMch8aeYSchtMBqg2tSHCsoGOeD
 O45jBAqLRyvWWpGlZEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270105

On 4/27/26 6:33 AM, Jie Gan wrote:
> Fix the wrong connection for the qdss replicator device.
> 
> Fixes: 0f43254763b3 ("arm64: dts: qcom: qcs8300: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

I'm afraid this patch will miss-apply since the visible context is not
very telling.

Try setting `git config diff.context 20` (you can revert to the previous/
default value later because usually the default is reasonable)

Konrad
