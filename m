Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027086;
	b=3FpFTY7ILdl1w2DeXrNlFvB4wRsMZ3uVgxK2f/xV4n7DZmwJObUUXrn1zGTG+Pp1z4up
	 Vz8xW1T+OoBGyjjrwssC331DHwf9Iv0kq4cFys00CZCp1FxBWhI+8ERTXiPiRBiaUU1Ej
	 /4I6DUFXWN1CNQJtkasI15lo/xrHAjl61AX29FFYj4122ypnws4lMc0+9m800h6/pUH6M
	 bmsRVcuBDWyxeYAIV4ivGjq1tMLKvq8kdyuIeJ/GkuTOfA1JMe2zEXtvkxD6mHeBrKFgw
	 Iy1JF7aZ2WRKdbexERNpX462I16Dz+p0+fl7zsoX4ldBKoeZ4XdQm4ih8P2w2/E1/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
	b=plxxsoE6R3GMC+rtckX2Y8Bg2E6/IPcYMLzjgnZgkwNNgd7VJchMAWevkokWZbc+FUMU
	 /G7Oy+XKIw5xjAv0Sn8s+CXAZANz0pMkMr4RGAXeB5chiQCGiOg1qXo5VPigQ9A0KmYLX
	 mtcPJ6A18BU9vvyhOCca9xQnWiAYkV9q+MIT+/orOQwaZtjxWdOfSL9OLDgDjZfJVYK+d
	 /Ya4U5NsodS6ca0S5xrWR6zmOMwndvAzt1F4qQaIwxEKTJcEdugJGc9yZctj+e7fleYqR
	 83TOLzDn+1eI9xGwaeaiP36CgnssMXbKMNi1YUjVA3346DOc5gcYtHLe1Z7heORf1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hi3CS/w0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C3A606A339
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C3A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hi3CS/w0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvZWu3618550
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=; b=MQCM+Rmp+OZKHlj/
	ciKNByeD1VCOEeHm/cod6l/pyvN2YTQHAFlhorvZqwiKHrUqvJkCMMcy5+8NzsJe
	dMMeh21KUtXzbdhwyWnjSTWfoqDqaz+ua+npTwqYYVPbVaR4wcuIPmXxaV+Z0Soj
	7bvziDtshD6feN3rD3xS4cQSlN466v/4zq9C1aaPSG7sL5YezH66fQWFD4B1SgW2
	ANjibawOqc4WYIMXjujy6A1t0z72lzPVBkAtQJQnbGl+/fMMAOcyHF6r9cpgBhJE
	oDxNwtLwXz3Hw58HMTyQswM9SIaYHH9TunVE28H5F6B9VDmUJRw/Q2bHUg0ZM1dv
	zrVBdQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrgy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-555eaa3ff0dso601495b6e.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027085; x=1793631885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=hi3CS/w0VZhpnvpAzVfNK1wzX0z9QvpV8ZWs51pe3ru7ISKFgRpjPHnnoGHumVU6qr
         f5DOUQt00G4rL0bQe/BEXfvgBFAzug/jtsdCOuYpn+lRZyDSeX69OnetF74gB/0AGby+
         Su3o4a4D7xdrMifOcemeeE/7vPf6hs2cWiDdXTrNugPCICgLLWn0BQxJNodWyEz6KItf
         UpkItjM+H52+K3Hnm6ZZJrSIkbG1ZnCWArtwtseSLBifS8j02eVJVPVJgNW7vi10dQ/l
         UiGUBjCFqpV4OSARb8Sydc8r3QEVh/B62xeJ31LO0ZsZW1t6OzIkXvrDfjCIjhMyEt/C
         jQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027085; x=1793631885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=MWbqxT9yydd+YTJHjsVK4cdpyPxFFEbqxt1NJDggiml8v7G45ahuKN5mXiA496F1PQ
         hb/n3BYepysFLLpEs/ueIxlmj8JSipSJDtxS91KlOOMaREHv8c7g0dqwkWHVMsh3HkCc
         UGK6ey1yxu7IAKcDHJ2hM26YBIT+UzjG5rlAIGPmaQmamEyO1Vqm1NY+zANJ1SamYMme
         /VD5p5Kpaz/3iinzfq8K3mcMIhqeiDXZxQ/XNYQWFvYVBA4BpZghK5r4fVjsDdz9j6LU
         AFQBT4Q/ywKfVpPNP14A6b3xAc3PVJxe1RpMUZhyQOUhm/RqLSokrtnzJ33rx++VSi00
         Y/Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzR7m6e/ulYOi3fxxVnVOJlrTJzCK8FDS4BDZD3fcsyPKqvaasXLw6VI0qCoH6BK5vKW8FZ5EC/lNE6@vger.kernel.org
X-Gm-Message-State: AFq9FYJe+wGyb/g0aVm7tTPvdffDqhdahFmmWWLwzfw6+L/gondEE0wg
	lES+QCTIs46yeRrAIhsUFlBQ3u8FAnFTnUIfbNTUt1ZRu7qEZN8++yTwNZ9Dcvf891G+Sm800QI
	zrOwBSQ/rhdgH+VuD8Nsu0N4iDevaZIjgt/l3y28C0AmHwMHN2W8yHYH1Qo5bNymQ
X-Gm-Gg: AYBFou0wBt5F6wU2sf2pw2YUJAvGhSDSTnNDpy4Ky7SwCW7MpFtuGkr9tvxymQCkwXg
	kHIo9WvTGRF+Ff0ZeEw2CJodSuYVylWg+y0rbdBRAa/SWnWyw/WzsF9OnB0w/AFvOeeEpsKKWx0
	JkPFxiCBtfm22fcWeL57mfRF7u2ROuoEWLR9yw2lzKFXCNclMBfjMYtCBwHvMIeM6iB9u9dqOng
	Hn1gLucto0Ro9lE3mg3wzhIjPCAD8ZZ6Vk15OdV9aMdrYU9pTdUYtfeQE5bgAd7TkkGtz6JNqeu
	L7A5pSR3F3L6sJF5nNJpVIK4O0MmhnqcWjNjosyj4FBN/RI3ZqbxgcH95H2WEKZrNiBm/8Bwcsz
	0WcA8Y6E7ZlYbROQlLdVUjw==
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808458b6e.0.1793027084522;
        Mon, 26 Oct 2026 08:04:44 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808389b6e.0.1793027083999;
        Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3844350a12.9.2026.10.26.08.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
Message-ID: <2d4e66f6-7187-4642-9371-4385a46bbfed@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:04:38 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
 <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AcpHTKYh71N3XOrvir1KQP9A9hEBjD1a
X-Proofpoint-GUID: AcpHTKYh71N3XOrvir1KQP9A9hEBjD1a
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf6c0d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=CrGEZSrvnsKXYSFoqd0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX3rI1jAG66NhJ
 hBt73DVVPgHEYPm4LycOq/9LQ0PwZkLE51GVEr7sOBvb0EmmyfieOzm2IxPc8d5AFLzw3SA+SVH
 x7wt7/OYkh8afSFgCQyT8JYYIB5tKRa4VpQ7BimASxYbtMo5gtPqWEugVOQVXcXjGT7Shm6I2C+
 BNUgyFQBi+BNDBNwJ/flmrvOgJmeD9Y7B0MrDMWZbJzelcTykV7Yl3HOolCfiW0aoFxmX63wXtc
 h8R5+9majk8MY7+MToNCPG8JJVxJi5TDHLMi848e7ZUG35XkvfWE6J+G2CSAa38x5bjgKVPhdle
 stchDuF4YPWgds9cJWM7rFSICZYmyyTJDpN6qQLVPl8gJUOl5bbrCdy4imjae1lxqjF0Bjlmtlb
 R+Pz85yBTTwCMwP4dOZUyFcTmIWKCQePyZgsd7cdhxv+nIskrx/o3cZQkh82bTrJKgNGz437rqI
 kuiz7WJoOAH2k54vXkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfXwDas671EtaHx
 Ap3Sff1tRl352+JlA8Q+TCofu2OWNB59d8Yo4w6EM+7C71LdE6GL5WH/z8/vdjiERwfylNbsvzQ
 F7fB4dgQs2CKrcZTK2dco03c4ywoITk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/11/26 6:51 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

[...]

> +/ {
> +	model = "General Mobile GM 5 Plus";
> +	compatible = "generalmobile,shamrock", "qcom,msm8952";
> +	chassis-type = "handset";
> +	qcom,msm-id = <QCOM_ID_MSM8952 0x0>;
> +	qcom,board-id = <QCOM_BOARD_ID_QRD 1>;
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +		serial0 = &blsp1_uart2;

You need to enable this console if you want to use it (stdout-path
also points to it)

Konrad
