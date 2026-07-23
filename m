Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089E3F5BDB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808323; cv=none; b=l/hz1N/y5SVjkknx8jntyGN52yhwlGmFVndmDzEkhBD84EgyAjoAbdzue3nC/ZfQUHetuCuUEm2JyW4HSXSyb2u5/oG+Ip1v+Kb/MJy1zC5B0cLPVbCHZFHRzkJZBo4N6Dj2FtEMkPVXIFnAW0iaccS1OQXqcGP4JNT6Z9V9zv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808323; c=relaxed/simple;
	bh=ACzxvPV7vra5qA+hMv+7yW6gYZx1YXG7wPPaYGWThks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f13uK0Rm9AGbh/HH+wUkTjDEFmoghnc+UWYMa0BXOp0qx+AkdmjKk9iWFayc3cvHRYIIzvaXe+PMVb1SKh7s2tlYqlGSIlbVDU5EKkrveLuA3WB91SQizEA4m/CLf0fPI+nWf2UFITh3GvHbSjbReDo9A0th6fKjehjLEaFM0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jv6pkxYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7x6fsgY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jv6pkxYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7x6fsgY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qeql3648898
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMKUqxc+rIEZeKT8ufnpN8oi8S7g7PqEIVgl3NYOaK0=; b=Jv6pkxYrcfEXFfuK
	DR+nXozpfiZJdN2a8xxu9dRl/sj2KNF/ryiY95SdCtQBdhoPqx9JEcPrBxUsPTg/
	zF1DZnxzle0DuUc/gWeXx0Ie6TLswgoExanTtjn/Fa58YZtafjhB2zK4E+JJfW76
	6RoinSY7iy3tfAwY6ls+yE/mjDnZ0hnRUO9wMCWX6I1mnHVDA8EwvlvtR4/R8dej
	cUwGJCdWFBtRrfpU3h3vdqKI2pyFA6ulc7dZ+9ud5Y4J/HW5NJXddwxzaBwjzd+Z
	NBfj1Go6cRt2rq5U4yYR/eAMZug64EhPDYZyMO3jgDQldpByD4qUT7eqcW7SPCKp
	iBNVCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jw7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:05:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso213641cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808320; x=1785413120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMKUqxc+rIEZeKT8ufnpN8oi8S7g7PqEIVgl3NYOaK0=;
        b=D7x6fsgYneBBwfI89oci4BFLkkZCSTJ7SKq6eI9hIvI795gesrkR0eU1iEEWQldl56
         Y0exytOJqVdpYlQwkRwxJbJZF4FQAdHd9+Lbnm25SsfZaKR9AZ2NTopg8CpEnHhaC+qY
         iQrBw9EQ9lrZDn+AbJf3d8jQWt1wibItoy1I0AjBjkCLjyepuIQ+zfFph90bmxdQmGqL
         AxXtj3t3xi9jBclyddpd9MF/ttMIBQl5lAy2xEzpvbzh+AGDuwHj7z3zuXAck8ub3ohw
         3G/w6QiFLEhF1R0NIkX+/youmNkPlrJCqIJEHW4VnvjRGi78Y2iZPlBpk8N7e0lHM4nw
         ZGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808320; x=1785413120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMKUqxc+rIEZeKT8ufnpN8oi8S7g7PqEIVgl3NYOaK0=;
        b=JBj7lJd5gabQjHSRbKZHsqXpZUp8q+ppQ5L7tfbJcXEBLMH5+EldiHAF7//lKhYjf6
         o7W6Jk4ZD2Y64865vCCVwFqbJZ3L7Pqe7XtwjtJcxDFAgrEyqB8n8Qj8MWujOUAFvgVH
         cReyWmOaRm7cRSYPIdS5MReBisgLAFZrhIbbnkvyCP1T2uy/xRNUOq+L0WCF/ZkPBqwf
         o6e7GnBe1uDumrbI5MTTHRXBxtsApOhixUc8UG+V/7IgvwAytvVxMwbZH7tM9seaXN01
         cj5DNpRKH5bGHiqwQPrWzxo+GwJkY4MoZy+lhLNUff3C1RczzTTuPqfNtJYdy19CfWI9
         ivcw==
X-Forwarded-Encrypted: i=1; AHgh+RrBTN8UQ0KHby5lsAG3UUMV7F5gmQuu4AnVRyWDQqMTFB9i+qRwqyX1ZTHCWXIM5V7y+ydRQpLVWqUC@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMNIsYrm1ku7o6vm9/EUTXkkzicW/mqe8zVhINycKffgBnHZ2
	T/ID0dfjVOdR7+PgV6EXJSuA4RQjvePtQo6JzP2Kn94yHWYiVDDrtcbwz/pQOhiphWXAH/4mgXm
	maYq98O1WuaH8wHcFGcFuJPUPKsRzJMGTj1R1WEqaeYyuOuhIIAkasG7eVlIvmTS3
X-Gm-Gg: AR+sD10D81JNGQhYg4GHP8wrD7YWiqK0IdG/DXlnyBLafdYA9Vp7g+C5IC1ltzf5dc/
	wxWuwej9jUsHyCIluz1Xv9mccNsgX+cwbLZy7y9PWwggxb7ptcr4SczUzhuCa6gyo9L26UqBAIn
	AnLwq7cMyRlCSdzwY58cdUevN0AcBSsAB/6OvecNPUJIFXnBrU2AI8LgD7uMdB40GhTwTVJGvoa
	imt5nMBW5F2QbEtEOTssaB7aDA3A6hI9RlmW8w6NrEZGs0c552g7MOFY0IJYmCtGDlzQ4HbDyk+
	6D+LvNm0yS5t/p/h0NHStv62Vo0L9P3neoVKj1w+mVzx9Oixdbgcmg1+kn4pOTivP76OlomcVuG
	wZRSRQXdANMJHSG6m+4Tq4YTJ
X-Received: by 2002:ac8:5cc2:0:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-52846fdf76amr2142371cf.3.1784808319815;
        Thu, 23 Jul 2026 05:05:19 -0700 (PDT)
X-Received: by 2002:ac8:5cc2:0:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-52846fdf76amr2142091cf.3.1784808319339;
        Thu, 23 Jul 2026 05:05:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1b9dsm1994224a12.6.2026.07.23.05.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:05:18 -0700 (PDT)
Message-ID: <5d6da74a-785c-4c02-b065-876d8a46f2b2@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:05:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add initial Motorola Moto E4
 (perry) support
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        linux-clk@vger.kernel.org, Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
 <20260723014627.63310-4-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723014627.63310-4-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r1c85_A_OSsFwyM_9cAXWj5fDE5WZOKR
X-Proofpoint-ORIG-GUID: r1c85_A_OSsFwyM_9cAXWj5fDE5WZOKR
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a620380 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DhTvykhhAAAA:8 a=QjXiKPweKVnjtAxLVzIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOSBTYWx0ZWRfXzJEqIi8scvbD
 2pqbGQsOnWd/4KCsSh+dmRzWrNGL88SIVY9dHUlLQwPWRW1pqTkqIUbzWrNMzCQrmdsrEriRxrR
 FXRPnnMgW95/0EFTzIF3oWmwg6ldRmI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOSBTYWx0ZWRfX1hj6DteYFGLe
 ajRbnV0IkmeuR+oCRwDFfCLzn8EkpeODk8887emqbQw9JbeAnsasd7ZZQiPJxWJir0hXoq/jLIW
 F3G6LKvynJt19IBH8FmBi1kq4ikBq8jSzRwN0IbTex/QPx0Z/2dbMXj3hKgLjfXvHnBoL1Kr3RZ
 WGJwoVyPJXf0hO0GoZdTNrnpm7v0rPKCm0mSia8BleQGIhC53DjAWvcWgG6iOCwstw1Rtl8J3EY
 fqlf9QyuMi64K6SBLI1Jjd84IoYvlEyoKEpUiQjvrmI5MBRlW9VOmo8/ny6utF5jgTltrghRKEg
 NPCVGdyQ/f4XGBcFv4mn+Y6uWAW9xd08+CpMwPkeb1aRjkDFHrL9c8wU9WU/55rMHy5NLU2M9qG
 ue3w4ZINZ8DmjG8m+CmSZjco2AHFY4qKq/e8gZSyKawvCZwSaFET7CoWPnKR8ZuYu9WC6DU2RFk
 7e2XYYpcZu4hj1+DbNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230119

On 7/23/26 3:46 AM, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> Add MSM8917 and MSM8920 board files for the Motorola Moto E4 (perry)
> sharing a common dtsi, shaped against in-tree msm8917-xiaomi-wingtech /
> msm8937-xiaomi-land so every referenced label exists on mainline.

Do we know whether both MSM8917 and MSM8920 variants actually exist
in the wild? It's common practice for vendors to include an oversized
set of msm-ids in their downstream forks, either because of negligence
or because decisions change during product development.

> 
> Initial subset: regulators, eMMC/SD, USB OTG (gpio extcon), gpio-keys,
> Synaptics RMI4 touchscreen, BMA253 via i2c-gpio, WCNSS Wi-Fi
> (qcom,wcn3660b), and PMI8950 WLED.
> 
> Deferred (missing mainline SoC/PMIC nodes or drivers): DSI panel/MDSS,
> IPA, QDSP6/WCD audio, PMI8950 FG/smbcharger, modem/ADSP/Venus remoteprocs.
> 
> Validated on XT1765 under postmarketOS with a fuller fork DT carry; this
> is the trimmed upstream-first subset.

You should definitely validate the changes you send on their own, atop
linux-next/master

[...]

> +		/* Early console deferred with MDSS; panel driver not upstream yet. */
> +		stdout-path = "framebuffer0";
> +
> +		framebuffer0: framebuffer@90001000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;

Please use memory-region instead of reg here

> +			width = <720>;
> +			height = <1280>;
> +			stride = <(720 * 3)>;
> +			format = "r8g8b8";
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>,
> +				 <&gcc GCC_MDSS_MDP_CLK>,
> +				 <&gcc GCC_MDSS_BYTE0_CLK>,
> +				 <&gcc GCC_MDSS_PCLK0_CLK>,
> +				 <&gcc GCC_MDSS_ESC0_CLK>;
> +			power-domains = <&gcc MDSS_GDSC>;
> +			status = "disabled";

Is this disable an oversight?


> +&blsp1_i2c3 {
> +	status = "okay";
> +
> +	touchscreen@20 {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x20>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <65 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended = <&tlmm 65 IRQ..

[...]


> +&usb {
> +	extcon = <&usb_id>, <&usb_id>;
> +	dr_mode = "otg";
> +	status = "okay";

Please uniformly keep a \n before 'status'

[...]

> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Val Packett

I'm confused as to why Val Packett's copyright is there. Is that the
same person as the aforementioned Catherine Frederick?

Konrad
