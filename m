Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535747ACFD
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357164; cv=none; b=kRlkauzWZXyVu8Empu9s17d5k+ym4E43Z4tc1zLOpk8cSVb6skqkGoTlZzroRUVuq+BB/0P4GOmefLSpDN7NizdkxfH+XUfAzi/t5ISHXxjByX2PJkLLZPsUPZEaugbNFehO5ckQj8h6xntL+tTYmX1G9v0/RbbsSChw4J3B/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357164; c=relaxed/simple;
	bh=jhVI0R+4vrT3l5buIfyfVPeaQvF5Do7MQWKlRsb+oaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhbqgqFSz+Lvfa9FzecOs7IllDjaUg0tZfpwZhFiOkn4TFCotru8kj2YjRG9JNQUr5jct1Ff6S+sUN5QqH5wQKHzmor3PvgozP552UEf8bwHxJl7ZHg+oiUymnaDuHkWbo20FQhterDdiusiriOeHAaESvr2rCBPru/J/OPYBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQoQaAhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjhbEwSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQoQaAhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjhbEwSX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DHmMC1047667
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 13:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=; b=AQoQaAhc3WQ7s0LX
	f+JGdQKzFQGe5R5h56Jp+wetPEdXDwaOcySIzF4myt5OTHdGfnTab+iWNj4ZtQkO
	rLuNTIEkhPY0tly9rmrGa5nWApKtlvRyr8eHebFPeAXHMk7t1WXL0KAY6d1tI6DG
	cymAGk5FKJweF9OpP2fbuQsbyJGmzWegW2+FfG2vr3wy95KkvPk+Y0j74vSyywmz
	ezA6jo9aZfjwbsWuCe4au4jKMqv1b9QkcsApL4jUy/RR8vgzXaPT5qVbjwrhjZIB
	6+pBfKVGAwrO/423auc2slsx4MD+6DoQ+G1bHJisDFpNGZiGUZqYNG3VFiGnL3d0
	IXzTQQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4r45g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 13:52:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso34567137.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357162; x=1788961962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=;
        b=KjhbEwSX5TJ1CTV1lMBeUgtdZvMYP26Hl8vyZtCnQRiyWkVMfqlve50wzwwYCEQ2+5
         KezSbdORGZnjhy2YehmBukvHiMn4EF78Q81X2nlbKv2qtggjNlNSYR85SvpjX8zCFT0a
         xFsYx8vFJmJR0QAe0ObxssQ4CMD+/d7FIX7jNP6thviuPHl7kU9f/AMsFBLKrSgnknj6
         bwrVdNxp3bdAkZ+ZRz+uSv7ikvy6er1jQQ/72LvTqwtkM9Ou4jReLnp598QD+JD991LY
         tp3y4pIB9llOh9qhXj0L2uUDBWcUG+ShhqSeh8LtJdFq45jhSwHZDswglqqvk1Dsbk0K
         J8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357162; x=1788961962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=;
        b=ew6VQIFMWRZAj2/DMbHtQsdgokQIrJBZMZx0pRLTOrIS8su/IRj8hotBSG0JLPi9mk
         xcFyJ5TTPFL7kLvfH2go2kwyTMcb1sPanVGb+Sg0dO1QLuC+c8wVCXIDvS2LKn9nGZ8r
         f5zansIVf93Tuj/c2pdozfovgNAKkDWOUCHZDP4vn7bbfgeYVCbXL6cu0sfbJZwqKynh
         aPArowGzlZOB+U3P9WVcqfyo6HVYaueC2l8paalIuk0yIW0a/ESFuZ54M+eTj/z6VQmV
         aQKzEEVnIXkEAi6nDboqFteU/OXUpZR1TZgNpdh6JDOZNxe4c7QcE9dLCdUXFQJEi1/X
         Yhuw==
X-Forwarded-Encrypted: i=1; AKwUvBwlsNWXlt6GfXYOEGOZPymhS/NHWiW1Lr14YZLTqZStdPFlvOJ6winX8PiVG2jhLUBXgoYm5ThGn7Jy@vger.kernel.org
X-Gm-Message-State: AFuF++lNEoDjTRhATMu8uPV1Ytfz74KGS6yfA/76/xlvWpFQEGOOSCZv
	UZ7CC4wVQIv6L7dgED2kwkTQvXj9CUX9mlOkzLOYpARs8ddIgJRfOTq1e+hW+n+fC43RJeOWgn6
	8Z23EFk5uDbeodTQfmWNVXuZ1bjllzUcAD2tsHQUDq4aEdyWvGZsN1g7TG76usYqC
X-Gm-Gg: AYBFou0QdGjTVcNVbimwPcikc1KmpU8uvCfUCD/uZMM6Op3hC3PfPaEr6iLBm/1U/c9
	lqoahcGdoY1jJbVryM64QrRCvriCpE/64ZVRAozBlWQXBXlaZXQ4iiYwR29t7YXtKmMed44vvSQ
	tpIBHVt1ZXda7ZuTq5BVmFJZx+ySbxYO6VmXSAla2wwqdPFGVZDkbqT0xYbzRRELHkcmalELAcs
	XVlD72VtD003mnw+K/K0PeAme9YvX5/8chyXKY+nABh2Gsoo+P29SBG4GxpuIRJqWzvFKJ7AXKv
	CfCzcsz/ZRtOEyCRHLnfHhDbZLNkGXzyv6whDxy7Lba5mpuaNVP+Bk/wgbY9yj3qC8vYnH5GDY9
	HwJrbIOgt2XZtkMc9ljjxfw==
X-Received: by 2002:a05:6102:38c6:b0:784:a169:1925 with SMTP id ada2fe7eead31-78a1f3110b0mr583915137.2.1788357161526;
        Wed, 02 Sep 2026 06:52:41 -0700 (PDT)
X-Received: by 2002:a05:6102:38c6:b0:784:a169:1925 with SMTP id ada2fe7eead31-78a1f3110b0mr583898137.2.1788357161046;
        Wed, 02 Sep 2026 06:52:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b23fa3sm604620e87.32.2026.09.02.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:52:40 -0700 (PDT)
Message-ID: <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:52:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX6kZO8YyG3jyk
 zIcwaryt1fZxVMCT+Y3YOQ3WxmWzl5c/RypILykPZBOEUCf6J8aNZ+JmR4r+iaAY0P23SaZWTgq
 FQbnXisscbUDAhh7t8f+AEEBJfYD8v7h+Xv2cVlmXmSZ1dL4qvnxWWfIbgzscKuj2gVkHEgL9Yl
 1SkGbDS1eIPxKJjr/259Aox8wD4isdRw6I8rl6RZhcOT4mrUYC5GqU/EPhxsaQ2D4aqYLWvCpj/
 j/JRWwXW9mbUFdRdUwLNXgscVlbCL77xZcASTghVd/1DZEiDL9nx2pv4w4mseVHVHyGSmydukJ1
 lCnBVuCzv0PD3+IH+gV4DwoEX0N3CNGorOAgfxw7o4NdZIoihgYazDqF5Jet2YMwY4yAhax0dMU
 AvpXRiF2a6b12vRXMrtjsc8fchdDusxGdJgrrlmquTFbqUqkjTGhBui4QaKQP2c+VApV8rx6diJ
 TCSDQuxOZUh3Z9oct5g==
X-Proofpoint-ORIG-GUID: 7TgaD-eUZO3zFQY1l66i28RRg5DuABzv
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a982a2a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uLxBzBmvjvUxPvobmToA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 7TgaD-eUZO3zFQY1l66i28RRg5DuABzv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXxV4v9QmDnLV5
 nIj7ldZFiK1M/NbweEIIMdv89OSVi6y3p5IG0r4qLl0g2yxWBu+Z0JgM0CCIwQ/VYx92xcdcM7d
 9b2Q6zofGU7Uc9lOWnI+mywspFKhd9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:20 AM, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

With our previous discussion at <ao5Vh_d_dAlJknpl@QCOM-aGQu4IUr3Y>
in mind, can we reasonably assume the ADSP description is fine as-is?

Konrad
