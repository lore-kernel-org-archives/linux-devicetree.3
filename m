Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B32F8E93
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640256; cv=none; b=G+1KnkMdbX3LpvXboHdocBPeYh7ddC/QW/VFUSB0l/BBY46Okcr+r7pGKToA1kLSlT6QA3uwQZFFzqWzWDRrAZIh0WOiJIVsFUFMFKClxTJRe8yqQcsVJzCzpce2WagETAC5dthoDxSp0UaeRX0Igelnm0NjQeCS5mxzw7Uobkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640256; c=relaxed/simple;
	bh=EmZ/SXlYIoH6oNWoGBBMTimPLa7HdbufD2s4lqhmn40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVypYFU7AZzV3Bmfw48XpdHQSou4PFqO7LUS6r/+azM+RbsMrC3Lp0NIBXoa3/U038yBU0yPXZAknRbrQobCqio/SLAikiRx+NXpf85D3/GLG9oG3J365+kjyh65LumfdCb2H1a2K3U0Sg9ii4dqUL3DO7353zFUsxpHVwluPLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkOKxoDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVMTrMnh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkOKxoDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVMTrMnh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFUJo23501012
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=; b=PkOKxoDj33bdC1P3
	oz8NpOzn0Lp1h1EdjMAjYPkLjvV9J8h5B0/ydH0Xrw8mg2kXZBQ+vt4FwRpLSKKN
	ujh1Zw9ZNYMlTrA6CAQpQc+GfZvxKKvn5deaktJ6h1si/hqx0j/XkNRJgSvutuAf
	2tcAebQbWHlARVvNyPdyHGjZfzxSJ5hBk1rat+oKiQ03Yae379QpnEKn7iLvhl63
	uOA10hcsjzjU4ZKabT16dozbRL2yhbibJhNA7HdUKS+RWnxRIcxo/favVHZ55PGE
	a/G6p50MV6afL9Tsdro7D6cOX237ga1lwSMhs2xkg8m32fMkvgL7vRqG68H0BNAX
	rVRGAQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18182tr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:57:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so54948a91.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786640253; x=1787245053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=;
        b=PVMTrMnhlSFDzzhEsg1AnyaRmc4y8WsKlC8qWrozLmQWZH04GkFp9T3rBedAkN+CuL
         GV7nAE5caMLDgw+MJui+stoQUfF10pH0CHYexkRsCNKbVBxtMBTZgSXHfrhhbyu+sxuf
         bwycRIhWUx1x/6iebN3g1AnG1bS8hWMm1NIn/DwlSaoJe4j517QB/qKLwietnziLlUrD
         jAUc6fQlKirWva91QfbYOksRozALWDcWr7KJKyFn5/il7M0TGcoBbfXwzmtfPvY4ZxfS
         WlgRUwb2GLfea2ITbWQ9kJXn2YadydvQ0RG4vlvVmjW5MDxGJYcX3DHR3gRRO027pI/X
         1mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640253; x=1787245053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=;
        b=rVYFUSocpOxfoQf4LOtNAL3LCOEUrav5PE9a1U8VFnEHM6zaRinoBrTUWORVpaMHhl
         EM04p0S0597JNYcFLX7ZzT9SA1lvL2cAtTni3VKePeuNXBVwl2OnokcZWvPrg7HX3M2C
         8Z+styarBSF/3/FSWNb0/kE7u36u6vZs4v0HoRNsOiEyB+j5MexEL4a0hfz0SsBG48xQ
         vHSlBbnsUZxBPA1Y3KZdQQRJrfVj3A8n4UjI7BbVKv2My2bL4KtqaMMLU0IJLqruWlU1
         zvPXFJ/B4uRANSo8nh2odRVxmd7LGCfilrG+tp1HDvbDywBmS2L5M0dhWebuFtzX7ehH
         2w7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvrUMh0MsKlq2ZOkXdaQFwJZMPCBNMcwhTEbJvVVEly8CpLcnHwgj5/xCH+cMQf+rxbtbTNUItzwvT@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfDTvDK45S9q8LeqWFeDv/Xt00CoazfD1c9DMdcTY0e4DLi1K
	sAVD6NgyFKknVXYQgsLYysPUZYL6/JAO8AMZh+N54f3kCrGlpE09fKTYNydH9npcVE1saaffdW2
	WHxWX6z4vI18u5YPfj7CwltBusH/dnKr9p3Nw2127P0lPh8LvFlR3SKrX1ZyL4SHR
X-Gm-Gg: AR+sD12oL26xX78h10Mq3SOoEFhk41p957Im59DKrTeUCReaTfe/e8gNe4X6zSKkF5C
	kfQmjpslSrc3s/ElitN3KgyXlxJEp13c14fd+R17HBqAttue9GBaeiBjKz0U2uhk5S4zv3r8uwH
	A7XU5DTJV1AFlXnw2W8NcPBvSxFnl0HghLYGCBwfRRsPdztsBKI5RRqF91eswvRWzlgz/lnfBOW
	/eElKS99M+eij50zpkSAiYJM/LgtYjzqlNeuxVlAQTbX4DL7tgae3p2PI9td0vrkOL9R9VLIFhn
	t0Z/AA64SdS+/EZ3ValX9DR42U8RDnAnLK39yHDmQv1dQ2yykFB8pX2hkjBpvd1YWPlfL2igp//
	lvFKDNAk2Wz6/nhuAwTJmIrybhqgkHpY=
X-Received: by 2002:a17:90b:1b0c:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3931e2069c3mr6772685a91.12.1786640253069;
        Thu, 13 Aug 2026 09:57:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0c:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3931e2069c3mr6772329a91.12.1786640247833;
        Thu, 13 Aug 2026 09:57:27 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.19.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm4121774a91.7.2026.08.13.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:57:27 -0700 (PDT)
Message-ID: <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 22:27:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
 <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyMiBTYWx0ZWRfXwHVqXd6eq2oJ
 McnlWkspVmqEgmXnQBjV23My6mXGCR4s8HxBxFelBpBROzcrwLjki3V3py6ysjM0aAGxRT+c0QV
 UWCBGTfbFrRGyStwumEi+Aw6+MpH/vs=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7df77e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=o18eRHaKI7CUylSTromjKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TlKW4IKFNLZu7OIdjWUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ptp8kGjbkHuDwRtFA5JH91l7SxBAqhlL
X-Proofpoint-ORIG-GUID: ptp8kGjbkHuDwRtFA5JH91l7SxBAqhlL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMiBTYWx0ZWRfXxjGOYqRYEZYE
 QF69lDe5idYLEwje1Ci+D+VA/UQu9dSWi0NP5D9fQSO+tsSOfY/noyFT0eKKSm+33D4uh2L/HIG
 1dl1agYAQsr2KxSb+uY3ZJ6XwoRUFKCtJm5EIzcE4XwJ1+faG2e+DW2ZZdzHFaqLJnXKnuN+tUc
 pujm1PHYeZ+DTu2/4knpHj87yu7mC0jAhNvM4Px6NuhmaY4/bT3L+04dRGLoTyRh5iHGkQmbcMP
 /XTNN/F2y77jNyU2ZI/0xT3W+7HI+3BH9bSDs3v6XjNy7Ld1BqNdA3WDH4hawyMd+WdGyjU2Ub3
 fcJT1yzXMfgoxthauFnHGwHHF/p/rH3KtCmhue8sUyZZhUpCZf9SfEPyItNrQEOKVjw2zp0b2nP
 RnEFIUVPR2u5hHdTi+EZU4DUnOTY3vdyP9vbImHon7Pfv1+y6moR6BIcdbqknBjQYwjR0c/+Kni
 izIBxsUabMtUSlkjC6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130122


On 8/13/2026 9:31 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
>>> On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
>>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>>>
>>>> Peripherals included in this initial set:
>>>>    - Single Cortex-A7 CPU with PSCI idle states
>>>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>>>    - GCC (Global Clock Controller)
>>>>    - TLMM pin controller (110 GPIOs)
>>>>    - Interconnect (aggre-noc, cnoc-main)
>>>>    - GENI UART console (QUP SE3)
>>>>    - SMEM, hardware spinlocks (TCSR mutex)
>>> This is pretty limited without any storage. Does it NAND?
>> It has serial connection. this is enough for a start. At least one
>> communication interface is needed for early upstreaming.
> Yes, but then, as I wrote, it is pretty useless without the backing
> storage. Also, it would be nice if we new the future plan. Is it going
> to stop at this point? Is it going to be expanded in the next few weeks?
> Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
> support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

Hi Dmitry

Thanks for review.

Kuno is 32-bit ARM (Cortex-A7), so follow-ups will be `ARM: qcom:
kuno:`, not `arm64:`.

This series is the minimum-viable base (console + core infra),
following the sdx55/sdx75 pattern. Storage and the other drivers will
follow in coordinated series on top of this base.

Best wishes,
Hardeep Sharma
