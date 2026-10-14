Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56016522EF0
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986748; cv=none; b=PHUbzllaUzkJXdpdSu0vd1YhqcBQw0i1d9wHR8g2CrKmBy/E/53ekdVKvKFLPGoxuQtNqGkW1D7CDf//qNcUcLuM7IxbPrY0Noryht05Sdjd/oQa6PrApnnVWT/Hv4hMFlJPOrEYIwMJitHExui/BbVnsg6EfBhYNk9XnPAAVRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986748; c=relaxed/simple;
	bh=ISgqwQwd1WJVQMG+3HZ82LwF02NXekQ8kwdnDHTu7qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLH4Noc7oD4RPOn7Ku1LXuaZ+x30HHJol2MknZWE848gO9jmHUpPd0sRGAZCcgccNjBHkPOaVICdEZ7i7hzjkhWFbofWeP0GT4Ib6vwoREtaQg6We2ufElGVIO/+ob/F6F911WHoqVEo/LgifmBQ42U4zzQHyDXx+yN/eodrqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCe1EvZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKdMGIGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCe1EvZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKdMGIGq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR4Z3466270
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=; b=nCe1EvZP/0aHf93I
	BdHU2vT98aD5USlH/P+wqwb22JSku1+uqNnuW6l3q9f2qtOUMjuDDyhS/AKwQ9f/
	YZsVsxjWmMn76m0UhAtPtVVw2OnpgqJrj86RhZrv3D1SsYGwuvAbIDXGTTIjU9aS
	6hIIK36//VRJj3FSeXCdrzcZgAjxwDYT4pQrKcalEL9FlbJYj3+WuAots4Hqm7PI
	m2KpLgQ81UN21xtv0MJ6aRUs4pP5ExZS5S/81C9CgovP1HKAtUzm4iqtzku+GXDc
	GyGD9QLmffNJ4wX82sO2ms12M2t34WgmqIhOLjMtPm5QGX2Rnjt3ImmytdLfFg4F
	ZV+MAw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80crts0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:05:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso142095e0c.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986745; x=1792591545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=;
        b=TKdMGIGqBaUsFvOYj2Z5eagxgq/Eye+f86Qpei7NhtMBEHi5tcBvuwDRv0PTqYLmiQ
         yw2RPCNhFTUvsZkssqUG1GJBK5yxJLjbQpvd049JXpgnm751WCpmTr7ym8xvftzeOFee
         2Dn5DL7TaaYKmxLTgum6aW6SJqovRt7pNY0SNp5T99sPXKVy5Od6UddG6xJFCswfMCvZ
         Y8b6v4z5I2igzitdsSCVKKOZmJUcqpHPOsFd7TUHP1fnRitrx2MxDxE8qdTSO6uohmY/
         2xzL2vTe3hdYSxRxA8ewCl/qj9JvO8V9TgU9J279/n/Ulbx3p/ttZHAsW08z369LXZ3H
         YCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986745; x=1792591545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=;
        b=gNJt95WdUfKSMVL+ERVJ2Yaxx3LmjVOsNLmGGxdMRuYXgCyRGYa917Eja5uzGsJFJg
         9cqXLdDsJ5sEhfRgWbKghpu6ETZyPIKuAI6aVDbxUSiyuiko6WsusBC62uydyG0O/F/I
         cG+GXroxnBnFGhfCinidGDLPzF+52v/bpaa2mZFSl/cHKUEkj0GWRBkhMMDcZpaFpbSH
         8Kw4j0hFM61P3l/HoV5z65GoURiBtOZorcM7hI01aFFYp7Hgr97MOAKLWKI0IAxowP51
         C9T5FdkX+mJPB0rUnDqEyf6wmyGLd5H5HQqKnf5l/nbM6E0QjRGSnd5X/aM7XRt2N6TA
         wZNA==
X-Forwarded-Encrypted: i=1; AKwUvBxWZHOB6DxJ8oZg7d7JuF4J4nLT9hzss9z88qqwaxiuINE1Ev98QGCcBiS8JQgy5y2UJoiACQYq7pml@vger.kernel.org
X-Gm-Message-State: AFq9FYIwHDRZXH0+ANSNA1p6imNw9whGw88/1br6ie2ME+JPBqH2DluX
	lDPfxXLnlLZxcbuffB5OtUU+7CxmdlEVBm6WxUBRvFZp10aUjy20qHT+RK8giGMyHItJ3vyW8eV
	aUcntxwoiSdwLbyhOKo1nZ+GOSdYhZCgYJQVEQ49FsN5td/OTAD1C4mro9Aby56Me
X-Gm-Gg: AYBFou26hOlZcB/5rJDdIIDason/7cIkh4WEz9TIrqrFZRmX3ZAuV1eE/6p2QF7r4sr
	QkmlDvhPU8Y+bUCZEEZlVQsdRe5jJJ18e5O7usjuJZ5SVw28VcBtCAvrSP8cst7GmInwTahVhna
	y3uyJiWX4K/X5XzPKt3MljtanFEOJ0+D9jsUZ5W6kvBxjPaySPbt4GcUW7ChXzhsl4jcpYDMcrJ
	uf6QiZb4vbG+p+wLHuxywcDFW3BJCjp/M4kzqAcB1ptVTLcwHMD8HFczSIyN15FAf13q6u3Q+Tb
	bsvIvBAi6d/3Ag+W2SA8wEY38tXv7yGYrZf/9Iv3j2wbGEbR8zdaQP3Ge0u0S+sgr/mcNYBl4Zi
	TsxWnIeCAVoHSh0nIsFECSQ==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3449597e0c.3.1791986744675;
        Wed, 14 Oct 2026 07:05:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3449553e0c.3.1791986744082;
        Wed, 14 Oct 2026 07:05:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203862c4esm1222206a12.16.2026.10.14.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:43 -0700 (PDT)
Message-ID: <d2ab26d1-2feb-4759-bdfa-7db9b923e7a6@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX1nonnhB6wiXD
 baJJXolCaJpZH2JCExN6YghcI8tIAdrOxhQIFLJK08k148zlyCpxc0mtbURQVt+g5l3gboyyhPX
 Y1kbhFzN/rqBnm/VdZF2CGeiW+zB7Sw=
X-Proofpoint-GUID: mDxDwIM9V72pZ-vDXOXSq3bysfl2lh2-
X-Proofpoint-ORIG-GUID: mDxDwIM9V72pZ-vDXOXSq3bysfl2lh2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX55DNwEuIlPfK
 Ye39lmLpUWzC3JBDpLoRhtaI1OUMnoiZ2vR5oK0Pi7zTR6RpuZPOIFaSqLwbBfNlhHLOFigd8Ez
 +tq8qNL3aRDJMUTGIHvL+OCNtHI7++zvGaf0S4QYaPxjrlmmuGdpjbcQ3FBM6/3Vcc1pNnAgFt1
 s+paRyY040t8qerYBp7wujGQ8hekFHgyfX+koCiCVTy5IfQnwuoW+XeKMnPfTHE1/67GWVB3ZA0
 aMWfzJjO7V+NwCKaWblfK6//IGwhDkAKj2aM2sUj5hUOOyEaQpFEJAD2n1H2goz7orBNt+xPRPY
 Ic89ZFig/yoZdWTmbLesNvIFtA7+u0cZqqjk3c9dhiVq4wozI6XSjvR3U3pmyGdhvzSu6jA4pWp
 FI1KMfCjDDtLlHyqVTphvQPAaoiu3TOBlJo4FlBuqC8/VhXFVEHHhdChy0sNX2GpWHJh5OpGc0J
 OuM3Ql+Y4tAPWJTFhyg==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf8c3a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PngBsCrCUa3bum75zpkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140056

On 10/14/26 3:02 PM, Abel Vesa wrote:
> This is an RFC: I do not expect it to be merged as-is, it is sent to get
> feedback on the approach.
> 
> Some values a platform needs (for example the WLAN and Bluetooth MAC
> addresses on the Qualcomm laptops) are not always available to the kernel
> in a convenient form. They may live in firmware-owned SPI-NOR storage
> (e.g. a DPP partition) for which there is no straightforward, universally
> working way to read them from the non-secure world.
> 
> As an alternative, this series allows such values to be provisioned once
> into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
> provider that exposes the contents of a UEFI variable as an NVMEM device,
> so the data can be consumed through the standard nvmem-cells bindings.
> MAC addresses are just the motivating use case; the provider itself is
> generic.
> 
> The first two patches are the actual proposal:
> 
>   - dt-bindings: nvmem: Add UEFI variable NVMEM provider
>   - nvmem: Add UEFI variable NVMEM provider
> 
> The remaining three patches are included only to illustrate how a
> consumer would use the provider; they are not meant for merging as part
> of this series:
> 
>   - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
>   - wifi: ath12k: consume a "mac-address" cell
>   - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable

I think we can take advantage of Loic's work here

https://lore.kernel.org/linux-arm-msm/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com/

Konrad
