Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781535;
	b=aWwNpfrtu23TT7ierJdcTpMlLFu5ojF79khQ9fiP8McvWRxdNVB+2QJ2Bi8HvZFpxzrs
	 je0zUoLSvbFBfcEW+MUQcT8sjoFGw8BALKy4dpw9JH8Is/Yk/I3nLqR4/TG4IThwxurIg
	 dqBuJWkRwabAl75rUAuSBLOp11tqBwbTDPIpe7xkJw8ZmRuNy5TX5bXJqPaOvx2BwTtyW
	 gOz2ppyBbm2u23a2c8w5zGs9jURua7XmZKeAZASS9sa+OVHnc1DvyK2MoTaU5bSQrnw/h
	 sbKSzy0ZUEfw0vFM0Ed4oPMad5aIJapwOCUatG28JKn5mEPMB0l8FOYk49LeYSmiWBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
	b=hNNcFqNosNsZy3FDXfs1tLcDSsVtDvusXCDzVeTcPoYCwswxzolqfdwJO8kDnwuktoBx
	 870SLXKu86olBN6KNcnJQdrEaA9Jbq61wKyGxI5KcIrfR2kwAbxjQs9OMe8zWdcrDqcvD
	 UXb/EImYUs03F8PDQyTI0A7vwwnkoI9VyD3PDbw7Uefkwf3/nuKEwVSesk/gdZ3+OZ5ge
	 Mrt2BjaPPg5QYDVziaZALBW1kkXnL7FDgxxColXqOuee9cTRXT+GYU2XgN8gL3zAAq2Om
	 PRqRomUxXQFMNV1WyNVanMBYS+4WByqRUZslKnU95PQqnAKtK7zSA2TzgrVifcVy54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1pFbnPK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xx1ux0y6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E227606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E227606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1pFbnPK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xx1ux0y6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAoxux1961771
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=; b=O1pFbnPKMw/99LPC
	VHlQ0iWwfS95+FHu6vdLLSlwCMqWLq/38ZcVeDFXEvf+CXayhW1YysxmL6dCSZHV
	k01JzIgUUUSj1PFnGlgwDVU4KHwQd9xAXMBLQX+P2qUvrGguRQ47RaFl6eBOvHD/
	x17ZkkKR2Vr0RPYthuEPe4BZZ56KhVBK4yChFnAOxwCMEh2D4b2ALvYiDZ1+gT7c
	LkC0yEbz3lX0Xpu2D3EM4RARb781XfuEmQ9N3oFMV+VHHIWdqKe6H4+r5Xww4bnO
	5R7UpcR9gMXYpiWpF2duZwB1QFmSmVaYfqtE2MzneVRPiJhafE8RHJ5rss8sdQ7M
	A/pHhw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htxqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:12:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-71ae7623db7so206053eaf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781534; x=1796386334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
        b=Xx1ux0y6InN5Eylb4qauBKH41UZdZALBt6OrT4Ha9lZNwsBM+Tq21FuDe9WBo2zV9I
         gT6jwn9EYjr1QJyDBWg6a4M+umIwWCjyjXHS48cULG4XkfZ7QM+VmYGpHO4R3pOHzg3B
         HR6KmsrbzgmfwbRF8toR7KoSpQSDU/ZSE66nlmU/nCv3WLf+vXXXYqP1wwaju4NUA4pq
         Gok8V97p2UHr1UtMFYP0Ko8P2FOe+FyFc9M+FR0w323uL8haZT4afK/SpEHp61g3b2B9
         H+Cd6C11uMLHdhwum2vnVFdfhgyPpQgM0HbUzbVH+WLZDG0KFhHpiEguzCdoG6WHb0I0
         xaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781534; x=1796386334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
        b=LkoD6Ztpz2DSX1SlCp+/MFEsFbIXq3MEqfmIMtmH7Oy2PakZCW6phTvXw8PW7F3onF
         LrcxHg3ggkd2OUHYKTwHa/D1QZoJYDCroXsac/1mEVM9Su9k+zhZEIeLz9O+JBkmEH9g
         JHumS90b1qWC4Uo0sFfoLRx54LYfDYfX6PuESxjojwkFA2lTFE8nFXooBtZDjvT0pnIO
         bPA5XbEUvcSH+jrga5Jn3l9VSGul1BbSjsworYvMxXkL3DIiaHTwhOVkYnxAbXk95BAO
         zvFS9c1isXMuzonFtMKQSRlwPaLeA/M7kp9GArnsiiwM6JVJNxNc89o2QNAhyNUSbK7M
         CrdA==
X-Forwarded-Encrypted: i=1; AL+hErEbSGKEEqVqQG8jnFX1fW5gTDoWCSilXgnOkq+9o+xEF8bGoCCqU9N6hho0W7QhvLBhGW6s9f4HL38z@vger.kernel.org
X-Gm-Message-State: APuU4Z8T6e8rdqk6FKTrpmozlIzZXRMoC0K9zto1NOycZ4gR/QoP7Yym
	P7mHO60y1qjx8VNaSq+aArDL8M0BG7t/PUQuRcRdNV2eXYrgGAOfHyPptaLDyZv2bscyP1WwAqY
	pbdjNbdrMhi9DBc2r15r37x4l6bY75urTRTchapsb50TCkHEF4oY3f+Eg2NHI0vTu
X-Gm-Gg: AZFdTZc608D0EMClUtOcfY3oWSVjSSi+zY1sGSXGQh1mPJ47KkBqQvHM+/cdoSg8CFz
	p7Ofcs6izYrIaiHYFhm9qwVfhZhpDEJv26I8Gvaw8jJg32gwoNptPjs3s3jySS/zvr77hgGEAIO
	xy0f4cIpNcTdeIc2YMAaQ60gw1vExf0h8eMqHgLymTM16bjeBsOUEr2T0ycfyFVKYDnrsiQQRAU
	/4MXdP5jkMzJB9cYk0sZvJvuRQpoD41y4wrf7LGVpgTpw08JN81tZ+AbI0TtZ9sFojwFYXKO851
	+mXiUl8+x2iYnScNxwUtubFV7nk+zsk6G3GswK+6CUgFtIcszk1+R3cRjKMYQLWNt54kAtaAZxr
	y2GbRh0DhRZgu6NyM6YLZ+g/rOqOzs6tLlvuwA5/se1GKSPbK4zjbXiT0c3elE2/htknoNK0=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23495339eaf.0.1795781533960;
        Fri, 27 Nov 2026 04:12:13 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23495294eaf.0.1795781533468;
        Fri, 27 Nov 2026 04:12:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm843067866b.76.2026.11.27.04.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:12:12 -0800 (PST)
Message-ID: <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:12:11 +0100
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
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Jeff Roach <jeff.roach0@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
 <20261114020509.632311-3-jeff.roach0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261114020509.632311-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXzLH6PQ/vCm/u
 zRpgxL3+uB1pOrQ4g2rPN/YYC5P9WrxWGgHBNoX52nl1mQYZ1aKXC1pHttQFjLi04rPyr1VLR2m
 3QS8ePIRIbdFAFp4q6l+DIq59nFDj5g=
X-Proofpoint-GUID: ATXDrL-oG6aN3nuz3Tq5bu15KiOGlKnN
X-Proofpoint-ORIG-GUID: ATXDrL-oG6aN3nuz3Tq5bu15KiOGlKnN
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09739e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xy8Gs_GerH8zsfeW4bcA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXzYFTH+r955Yd
 hpr8YRnQ3hPRmzlLRdTnBRW0PAwHuJZsVaaQ09WLL4K42G0bFUtb8/Wze18q+g7+pcQJfgd1OWy
 FuClTqJopDhHDfkSDxcHbJoN/jibHo3/DZfb6DLmueIDK8dlW2KG75Nl12IOIHG35WlI10n4iLL
 d1irGloY5b6K0o1+5tLHhe8AElhsumh1ydYGABHAE653KDGU+KjhIiM96G8Rk/opgyESOigua7E
 Lokz8N6bawNk9nGu4OexV6Vi/FjCz3Bp73wGmG487Ur+twEHzOs9bOpv5Zqs1joJVqQu5fJ34K2
 yAAiVYxrcMWrTRPft9GDAfQdbzlzi6lctuo1yDxUMEMugyQgPtS0aFiWTimntXw0uO5/RzVj+ye
 Z4M/+l+reeMrrUj3PB/1g8DwAmURoYvx0fxYCPZSbO8G77HbIGHwMsJj55b40TszIXeGXCz72Nz
 eWo88+lBOGJHQNQqWcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/14/26 3:05 AM, Jeff Roach wrote:
> Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
> Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Supported and tested:
> - Keyboard, touchpad and touchscreen over I2C HID
> - Lid switch
> - NVMe SSD (PCIe 5)
> - Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
> - Two USB-C ports with orientation switching, USB PD and battery
>   reporting through pmic-glink
> - USB-A port (usb_2)

[...]

> +&usb_2_qmpphy {
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_2_qmpphy_out_usb: endpoint@1 {
> +				reg = <1>;
> +
> +				data-lanes = <1 0>;
> +			};
> +		};
> +	};
> +};

Does simply leaving status=okay also work here? I think it should
simply never enter DP mode since there's no altmode notification

Konrad
