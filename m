Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAE7330B15
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138626; cv=none; b=hncvdC4qthhy6HDVqDv7Ews5LDZqjfbzyDYLjNPF3KaFjqkdf7S7fM95NmAgwi2WbdORk9ioYfDX6iLHQmm99tk4FY5TdfR8YeyUAwTAbA0fKvrN70tWLzzYDfstw0JMfRSLGplZFMrrCoa36XrxKPElwczV7GctDqfX1IPp0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138626; c=relaxed/simple;
	bh=9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hs1o+sg3njTiCeQEjbAeRgC7JWrgLw83Pj8wsW8NX1I9PXEr5dS2lNjl8h2bYCpY2meGk2TvlJEDEFCMPrqoMSQw4KfAnB30vjFdQYXYGNt0Ov1t2IhZBoZ087A6gbu0JC0/XoSTB1wT+upeuCxz5dLDsGQAUukmnF6aQw03m+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCLK/Hbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XANhDWTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCLK/Hbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XANhDWTY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7pdV4078045
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=; b=jCLK/HbgkdosKVXY
	8w0nQREHfGx7bIMDkPKncmyL8DkZVRNLfHr6gbGlXrlOAKjFVIDSLAmQHpUPm1di
	xe1TB4vuXxukQbZNvYArOLKV8GumWTeka2jfHu0WzTGvLZ0n+5Tbdvya5Qbz+2ww
	lDZ8GDaaP/Mu+VyZAM91TsdCofPTEq0kaHitF5yCfmIWawQ/gqBzb/ADk+QRzmmN
	TQ+UkLH71PepT8JU8mtyVFaeDmtx3xBZfabo6aSZmhgFddYRQXk7yqjWgxkdOkeQ
	Hv2E1lulc6I3saNizbILMQYxY+KqdMeBJ2X+OQYSDlWxvCgr0+UJSDDK2PdIipoY
	923n0w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnavx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:23:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so784212a12.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138623; x=1787743423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=;
        b=XANhDWTY2URs3Py5hBaqUcKkSQGrtT6lPUzH/RB28a8gVjAwDb0HZtvhIUhHo+vyDf
         fvm3LR7aTibztL+EyhLrmfGJS77lSdK3x1suVm4CUDS4eTnsnFfAd3dyjwhj2W9SKvnc
         74zTnyQoqrY1NiP3oYXW/R64KqK41FWx7xOB2aenxdqN65qUwe6AvWZJ0J33nx9NHJUi
         AQffys8W9oF7qrByTSuTEnVoauDW7X+nfhDqe87klRPxHm6xIbuXBRYY6lcVUkwGaSU7
         O3d6w64WZOx8DTjqgYMBvGZZX3/a5U/iBdb8TcbwgmHVX7wgjMNdEfDyylv5yG2/MiHd
         rwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138623; x=1787743423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=;
        b=Sw6f6xPiy6HWrXi5tjj2fEO153prHujw26sSl+cnaK8QppEKFUCH26MpZIBNIX6OXF
         qcjvCnij+uA/koBWhjW9mmks0oao8GXlFrJ+AT7gPi/VlU6/vz//m1+njjgQqEupV0mN
         CDO89FTfpyvzqH0reNj9BklwCY4YbZLZc4ZowMcdLwbCssH5ziHS93C6tPuwvhZ3MEXp
         iBcHb30wKOFUpegtu1P0KK/pWEgkVy6fahEXrkMGG6l/DlyEjLfNRO/2RtAYXkEcGhhu
         YIG78FfBc74XhAh4hTOQLyOrSF4EK2+4giRnlE1CAFlBx8sfZh7Km37iQ8yHyai3FYzP
         qKpw==
X-Forwarded-Encrypted: i=1; AHgh+RpNfoc++VtToNh5Wd4992ezuI+O+PWXYGQtMgXrCzYMiPtPSLBgp0VlgjUlIg7u2D9OQgAKxIVa5G/B@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNBjbHuVVm6hqmI8w+ggoDX2fpUN7AYFZeTDnvnIFqQGpXEL/
	yUKxv2O0gOtxSXL1xaX2d3FaPpksytetifoPIuOikZ425VC1jE9bpyyDi7ZuweW0fcvVUnCnXHb
	sLPywT0FXfWy1XGIAz99xL6iO/Vjg9EdbjVwd3GTChWp9FvOXlMNplrhGNXEtJNyJ
X-Gm-Gg: AR+sD12XQySNfhrDbMbRdrpvzlRpy034WOlgRMeEtSKvw+Cw7J61BEnc4Y1zeMUzUzQ
	Lc7tCU4jcI6CKM+yb1XnyPvHnPdpwQe0UjYigVZ1QC7R3mQBLLwZIkCbsMp/xRbEPw6UgiHZPpG
	VINLTbUl4kkQwK5DxD3fYlgCdHjIq2DNUeVniBVnfv3mkTMnSGsOCZNUYWSGjOiUf0mZqHSkh6v
	reW0ySgttc6sg8nyTNFg2QR8Ao583oSzsMFvkFHJexPWguo0TDXUuenGpyU9ZL3eMnQheQXn4Se
	mtQUYLSk8peSmu/glJn/4dkzM7INSeqJo0dEYlS0D7E/FS3+AaTI0UW6nv+eh3e1w1lN2tb1mfI
	oN7jJU0ZGFv53BF5Zw64swwB7xHdtgljMvQ==
X-Received: by 2002:a05:6a21:6e88:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cd016b15bdmr8241858637.3.1787138623065;
        Wed, 19 Aug 2026 04:23:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e88:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cd016b15bdmr8241752637.3.1787138622509;
        Wed, 19 Aug 2026 04:23:42 -0700 (PDT)
Received: from [10.217.222.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm10823348eec.14.2026.08.19.04.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:23:42 -0700 (PDT)
Message-ID: <b523b910-c645-44b1-9e76-1d25fac16468@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:53:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>
 <20260814-modest-rose-salmon-7bb60b@quoll>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260814-modest-rose-salmon-7bb60b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a859240 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=xR3Y2up12dx3HEdxvAEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zTbsYD7So-4PwLM6kLfDk9mSN5SCoJNf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfX51N4Z7Qsbjj9
 uYIcpUv8ikZ8xUpWxElNKhGIgX7SQV56y+8O3u/UsdGY/ihj/WbSajSvP3iRYChfHd8FxA08yGd
 73+c4ywsBM6l5/iXV9MPS8XU6U+B2So=
X-Proofpoint-GUID: zTbsYD7So-4PwLM6kLfDk9mSN5SCoJNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfXybE1Y27h6Iy6
 oXOmrr/DE8e3aD8vgnsRdO9WTwSSXDekMMVD/+JXL2zvZh90DFIXJaU5zysBzv1o0tcVgvJZjD7
 TzX4nMKz4u6mWHhEJsyUVGDI4pglVzWLTmqvloM6ljiB6dF/HkbQ3Vb6avVWC3UPnDNVzfGErKg
 vXRmTuJTtfI9hX0+zN4PZXd6eK8lDe+RswFWtGZorGNzpPljDLNPZGYoXQAJdRnSPqhEFRGxkqo
 HJ0SXNql4enKnjn3KIXDiWnQOl2nM4pojmi0zpy13e3yGrX6aIcW3cZcLutkuWZULAVTIbajelK
 FGAc/STmSZT8+lLNXcnUsd97X5kMnYR/Ywa+33SB+rERTcMO3g3FG8vnv3iynL6wyFa5fOIPYYJ
 8aeLhRGlBdjDfZ7otVM/Z8K/VUQshlmj4j4P5BfhyedpSMGAQWq4lk7sT+LcOYnDzqBXTzySU8S
 b6gfvl+g4kSubiKRrhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190088


On 14-08-2026 02:35 pm, Krzysztof Kozlowski wrote:
> On Thu, Aug 13, 2026 at 04:55:54PM +0530, Vishnu Santhosh wrote:
>> Allow an optional bam-dmux subnode under qcom,shikra-mpss-pas by
>> referencing qcom,bam-dmux.yaml.
> I still miss the answer why. Last time you said in present tense that
> this node exists there, which I objected. The answer to my objections is
> to provide proper reason why you are adding this, why you are doing it.
> Answer almost never is: repeat what the diff is doing.
>
> You change something in the bindings because something exists in the
> hardware and it was missed in initial submission, and you explain the
> impact of that "missing".
>
> Best regards,
> Krzysztof

Understood. The reason is not that there is already an in-tree DTS that
fails validation today. Rather, it is driven by the intended Shikra MPSS
topology.

In the earlier Shikra BAM-DMUX DTS posting, the bam-dmux node was initially
placed outside the modem remoteproc node. Based on review feedback from
Stephan [1], it was requested that bam-dmux be moved under the modem remoteproc
node instead. The rationale was that placing the bam-dmux node at the top level
makes it impossible for userspace to associate it with a remoteproc instance
(in this case, the modem). This binding change therefore exists to describe
the intended Shikra MPSS child-node topology.

The DTS user of this binding has not been merged yet. Its next revision is being
held until a separate discussion regarding an XPU violation is concluded. Our
intention is to get the required binding changes merged first so that the DT patch
can be sent once those discussions are complete.

Please let me know if adding the above context to the commit message is what you
are expecting.

[1] https://lore.kernel.org/all/airpBYZ2pRdNaE1v@linaro.org/

Thanks,
Vishnu

>
