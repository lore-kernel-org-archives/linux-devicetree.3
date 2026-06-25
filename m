Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07AF3DDDDB
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389406; cv=none; b=fPzrJIBEP37PGvzfG1p/l9abMB7vNPF7H4EfDHPPMiIQvisA58d7MbvLhX1thgxX0JCMrZniLaORi21G242jsMRWQ53wmH4MoN4DaFG6GSi5mf+XWPn/H5gzEauMwktPgJsvMr0R5NewzujnOlrRIFTP0UjoUewhZWD4nEmFXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389406; c=relaxed/simple;
	bh=qVSccV+PPFn2ycSFxupGD0ezxiHk4cFL6ejjLet9SOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGH8ZkY2nGV5LG9u+jhBKFOk8gYyXWaNagfhjXrACvAS6rOmvjJhnkJHeg6O2o3nsGM+SbyQqtx03ULfLncsNBNNUw7NTGxh7mDcE0lAaqO6gU50RT9YEYUJsf2bQ7M6bgsjP/WWiDBbDGouTyAY0bgx4OSSCRfq0yGG3wkg6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftHyWL46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnQ+31Sk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftHyWL46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnQ+31Sk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juj31723164
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=; b=ftHyWL46+UvCxbEq
	ODj5vQoIGKmTwGswKZQw7HYJHMFGnmI29QoAaaNMNByr7ovED9q8U8gvH/8KKDvK
	rlD+0A5t6TpaXTKvp08VgwtY37MsrbGcpvm/0ehsd47pGv20RP8sNpGzltO6Na1q
	oxFtRmEp6MC2LRl9NWVw0aBd1CXzR+8qcPMWQ3VBqxJklXAOCbPxlvK0PUBnYWvU
	e004Ej7AwMZrj3Kd898PV73Gh6l8gMKVLuIdbLX0gGqRVDqSWmpIEooQZjIPTzyO
	Y4BMb8MmNQxxKT4OVV8W9/BsXt98ggICZL0zxuQ41u8ZRBZO1CBH4QbrauYsLPXP
	jX4jRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dv6hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:10:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a15cef334so2486041cf.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389404; x=1782994204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=;
        b=AnQ+31SkMPyHiymIvFs+8Hk2dGYGGTf767RQJRBmKddiNvEC62j3XN+68zsor8tRx1
         prGNatf863q/dC4af5FNlvCWFS1LOHBW6Xd2QU/xBX2L7sKFSJW1hfUlecbiSLsHdkXi
         X6TuecZk/CWnoMjUSysaitrK1idvPM6ZIIHzECKYXNSlVgPn9qIRxNoTFS/0viOLnYgC
         lui6lRoaw2ZXnt23oiNZ9l1HaNpAOF4kS1PeuGQHO9T+9HcGPYSZa92glebPKrUzIOUd
         Wjwg96LGw+UW53qhHZZZPbWUy2T+AWVUaBx3brN9PW3VKR4PzcSBssCl+yFbNXrh+5kp
         /74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389404; x=1782994204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=;
        b=o76vFB8yvBQYWhi3OQyPy+X7Qt2a+w7wX2awrgD+5YUOGuH7qU1l0tn/+fZu/IwUaO
         rpmvzTf8AEWlY2cDzBEHWnN4IFYNmE+OZ6O4lQdZl1FyoiJCKJWCd2iPEAqKhknVhKKl
         3cuFdRTqCEjBvfpWrto4XlYT5w6N3x8/JTSXEtMz+fCYKLPlgo+K1QVpYBSUxeAoHc4z
         7Vu4Mnws6L87PjC3678JZUQRhN13AwelVxBC0Qzbvvx/VohgEFq0S85Iqhjs9s5qQxaH
         +a5N0UO8sKYLowV8Tnf0pGv0ygIcw2i+yF2C0YXQXBcq+FZObHtz2497pxFZgw5ges6n
         9gIg==
X-Forwarded-Encrypted: i=1; AFNElJ8O5nSqmsFDZHVxDE8j6wGAIjNYODyM3v3okC7xYZkR8NfPWR469GcnqOm+hrd/NqiIlP4JEWSvWy20@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxw6ApVjBhT7BOUyP5VAbLoGNa2flx1P3ubQsnfbpoJFA9SdS
	7v9wtif2zRgEa5Yg6SUQBfpGYQkuaA7SZWO/mP0xGXCwlrE17HCUs9ZzJIB1WUkLwxXNKsiDqEC
	1NA45mUciZdeWcVYNautPOmIfwbnHuX7LBLftg/WZitLdXm7ddBYhvaRyfm/fpXgP
X-Gm-Gg: AfdE7clF1zjR+f/aDbYwksjcEF7D4hi6IarzI2E6xl0tNOqhZ3So3iHeIaUcddf6odz
	r9wHDLpMLRkDb78hjiCfMTCyZ1KOf0LpWXuoQTt8fml0+AG5Dz5loJnzHJ/jDL6o+f8NeHEODx9
	uEa6ovzLAKngUbgkZMmyALCxjbHt5LYmcablvRwFCVhKboQfmOHnIrAvKHBLUiLPQOMmbnEUlnN
	Sg0ehHKyV27Eh4TA6DLcdlIzHSWHYSxCos7AXAVK/vq8REl/iri6ZxrOPVkbWXB2jF38imtqFUW
	I9oVo7Lfxzo3JgCc8uOIPt/cULXWe3gUMB2IriSwRUo39rjYI5bXv8N6yDnR3FC7rAiQgTk+PrM
	A2cXS9cZRgO7MAB7ZQm+wL+LZBoqOAbreaHc=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr17703611cf.4.1782389403696;
        Thu, 25 Jun 2026 05:10:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr17703141cf.4.1782389403074;
        Thu, 25 Jun 2026 05:10:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe0742fsm166255366b.34.2026.06.25.05.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:10:02 -0700 (PDT)
Message-ID: <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:09:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: gpucc: Add Nord graphics clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UQV5uIZUgwARxn6q2aOMq2laVRAvE4R1
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d1a9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cQiK_xN199hq2pa4WXYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX9Ih5sZfU4+R+
 N5DLROFxf8ctf4DgEHieVfN3jwOdsw38/IMYiEYf0xc0MRCJJGw+lZpnPCGVCibSa9GbxSomOt+
 h+udq2S45yL/fNxFb5p02voFhp2s/Io=
X-Proofpoint-ORIG-GUID: UQV5uIZUgwARxn6q2aOMq2laVRAvE4R1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfXzpYtmJohnw3Q
 hl8+LSpDTxt30qb52boxT6Pw4ye2zyzNEF3lQRZ7AJ1Y+7WD+LlwPpqtwPGhDD1t1RhpdKdKquC
 01EF4VSrSGLvYHOeoY7R+XoRuPZo42k0geYxKLoR7XEW1Uq+xH4M0mLzWm0YBxLb1Wwb/3grCzt
 6TABInDxhfdxxEGQFT1ZZGboV0wcHqQAj6MIcCGFio/0N+W1Ea1wmxgcd6nR2sVkXg6vuyTXhwe
 cDClue1tEx1Zo6vgJ5gVO5qyd9u7wJOSm2CBv5RYHF8EbFlRIqah2rGkiMTkR+7oh0CbUy1U6Gu
 0K1gcKopMItQ23gF14tw1fO/qljLCVJUZE7f8kAFG5b7mIQqvJoGUqlz6gXl4BzrHHyBphgtr8/
 RJYnCf2t2a8dOqHdKDJSzZZrBJsnAw2RjnPZdcKe3t/iagqEeVgSQMKzLp7inG9jStYl7hb3F0l
 QNDstpjObH36nBP/kMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104

On 6/23/26 12:54 PM, Taniya Das wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  11 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpu2cc-nord.c | 546 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++

GPU_2_CC and GPU_CC seem to have a different set of clocks and
resets. If that's not physically the case, please align the
lists. Otherwise, please use a separate bindings header for each
one

Konrad
