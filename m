Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AFD3074B1
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302845; cv=none; b=FpD3g5XtHqmYTuROCWt6Bp1ivOfrKxcCO6tYduJl/XzT2WwdME1kahmXvuUwwh+EAYjGDUnlfEXU+CdXmcrQhIb5Chs1tplsPfHP+4Xf2cNhi9m5ZeIlEHk07c6KQREGu/Gz48k/T2vYMhR2xyZnZxh7AAteQ0lL7Ig+eOOUIM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302845; c=relaxed/simple;
	bh=5BT6+KwpAbR8LD7ehgy1GxNxSo9j2Iyzz+1xtPCPeJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcfcN3zUh+Az7fxObKxkXFyLZmuZcUIujfIjBa/W9IHvfi78EzN6u7UA8sk5dxdccDax7Qp9V9ighKSzEKcebbZh3IpyqlqM1qaiW0YmwsmpzDfuQlnNvhWtM+3p5PG8EOFO90EcFRYWWSAfrZEybcw0M7/AYpdeEbkKNu+mmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbvSMr29; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQXefoTq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbvSMr29";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQXefoTq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANcuq2869106
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVf27dYT2ztufkmqcB0sEI22fPVNpZBH2UoCxL/YMMA=; b=dbvSMr29FP9CJiXz
	0xlHHMrrLtQWkPnQgcYBgmLogFu2kWKipTapa/bgxCZoehdxCvgG47tHGXxALHC/
	J86EFM75WfGZRxu+7p6I2hbYEUvJOJowaOa6I5N4IHt8siOeMqyfc/AAAgShQOZW
	+M+ZhdP9mRhYdgRbPptFODe7eq+yCsmc0pam5XEbDiKkpExCl01F4jZSTQ0Fx37n
	GjpUsrw8f40YP/3V3KPAmRZw++N6wtwI4swXRd2kFNZ4M8jH+uHx0XMPVLQEIAxs
	gdYa9IRnTkGVAYcgOKAeG/MPAF/2N2wRPMnnYQYxBgVFyfl2UsMdFQXu7PqbDNwJ
	qXS58w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq12bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:07:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbceb4fc27so21787e0c.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302842; x=1782907642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVf27dYT2ztufkmqcB0sEI22fPVNpZBH2UoCxL/YMMA=;
        b=VQXefoTqL/9EFGasU+D4vkQK+Fd2VXq6bYrOhSwCuEUC6nqmkc/TYtumGIm+i/SSCF
         T8Qc9CCo6NZIDeO/OSFrRYnhzogXu/V4sgKH/uqde5qs0AY0YtIA+fM4yqAs1XTjTaE6
         O9swb2tA43um2ddfqUnhSElGhEqwZxHebrH9Z9Y5jAC6bxYOGZwuE30rAu9YPKPq6cha
         I02whxSosGL8cSHe55MxD5TOQec+zJWiC59aiZAOIZ2uv1RH1e3JjbaT7luj7ghPlLR4
         3LLeocB2DQY8qnBVVevZm8Two/yI5yMjV2yp6iOU9E+03PPM20qpl+kWebKU/Yu0oGy0
         /A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302842; x=1782907642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVf27dYT2ztufkmqcB0sEI22fPVNpZBH2UoCxL/YMMA=;
        b=qGeXhPMFWJNBRsfymjPV/R8w5fZ8/FkmRDQYIyE40PmKuTyaNKVu6IofDfAWxIvqNY
         qJBa2h6Z0N/babVx0PGBpXd67M96YdV3++wEKX5Dron8E8dt9rxmfWJzg4fK8HOF6eDv
         3u8lLu2AcvNu08e/ZSrRcQt+FVKWIXtp6c8SrVQmFjYtJCcMS4HNK6gk8aZfhSInQPIi
         oa6eoF6n8y8TJ+Rcz44R45YUPuGDzRJtLX6MEBxjKzFQgBDO/+TbgjC3pRoHr8lWGUDY
         ODz3jAANPY7rKiMj2CbfKdnS0b7/ZLq3/XUccbgMKqPu+Bl1+/rKwjwZmh5i5A9bfYAM
         O8gg==
X-Forwarded-Encrypted: i=1; AFNElJ80rcSiZGPqTcThm8DQiiYmwD5mGNqAlYwcsbsbchH1QtU3gKgFnswpgiaEEhpn/S6SKX2WrOBMkD3k@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXoZd2kvP0aBiSC6+nl32DXGV0GLXYnjfqRLr/JLq5jZaNc2e
	VkuIVT86vnL+m1YneHsLIg4dPoCdTo1JRxK7IFANxc7y/BG7RGXhHI8ucMcQN00ga/A+cYak47c
	o53HUoNJ2+1hAHvZAR3urtR0xxnDNcgjBAOVZ+CYzw1ddQZhClJCCA/HHj42rgo4I
X-Gm-Gg: AfdE7clYk2H0u+TNNYg8PVZ9amMghN7KDlYfL6MFDnXa0mWbHdw3EY/Wygli56CqKO+
	zfN+7dB9G4dXv9aXEpY1mwCbtHnTR944vTGaZ3ns97YLpXmo+iTRWfSCpdH1BDAqWgxMmMhsJMi
	tmCK7EKJRWwiC7HfkUsuMi+LcKEs4R7hZEv5B2seSXiZ+pK03diZjQjG3eL++LhpQ5qkAd2WeWK
	UxkxnrB1UDmen/1tMgb9ONfbzShwzCstjAPgbs1Hs264P7+wAihCh7MfBYagpvntKi6eY/Q6V4k
	lYdegNYw1+UzBpIEd6J/oCkMXzqCUjZEUreffEvmr0t23sLMziYVuL12xqpIDL3LfP4PMWw89mh
	ohJotG7kFKXcYeMqZXyiCd3K9a41MNTxDKcA=
X-Received: by 2002:a05:6102:4b01:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-72f3a37df96mr2210348137.4.1782302841990;
        Wed, 24 Jun 2026 05:07:21 -0700 (PDT)
X-Received: by 2002:a05:6102:4b01:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-72f3a37df96mr2210299137.4.1782302839645;
        Wed, 24 Jun 2026 05:07:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm642093766b.4.2026.06.24.05.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:07:18 -0700 (PDT)
Message-ID: <5b3559ba-7c69-4418-a0a4-c5fa614830c4@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:07:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260620175210.19563-1-mail@etehtsea.me>
 <20260620175210.19563-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620175210.19563-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX6Z25ZM8bECQd
 O2OVXxKyjMv4gz/8+OJe2AsI90UpCJJHeEgrvRuw9n2J+iUE5ND8Sh9ohjes3I0DeQQJsoSiD2g
 PmBjr/vNeV3SkZEPiShmX8jyj665vW0=
X-Proofpoint-GUID: ESI3tUIR_v-0FC2DfGkWFwK4l8zoHSkj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX9Bbd5T99iAWI
 A/hHo8b/vUHb6DOE5hhfhkk7bhm56MCMstu8PGW4JiP2yk1zLxGvb8vhylHPR6xmPDOMaacKTEh
 zPs5GTk1pNTKEaMNe1b05bbD9dOajfHteVaA6tK0vkFAioO/2itbUvXr7EB5atGJ57ypcHorIrg
 BVIw7lDqOD5jOwGBEdC3Dd+S/lTqit6Hdh8QBQ/WItlC05jh6S8EGlpl6y3NvHpy19HUq8hlfer
 dLM6ouKG8P76lB8wyN0wyb9F4wPsY8IKQI173kPYT6TmfL7OtzUXce9EkTcphc+/4YvbPFSJ461
 rLGu/0mcbO3n5vp0JHY+ctxrY0VMx3+B1yzGTfBK63iUPd1NYaCTsmqTuT82sAKdZ9XrYUPa2FT
 5jA6IK8ChCuAkW7nmsgMVDH1v9Bu7Q==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bc87a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=M-mfNm6K6QyoT37rDngA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: ESI3tUIR_v-0FC2DfGkWFwK4l8zoHSkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240099

On 6/20/26 7:51 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].

[...]

> +/* MP0 goes to the USB-A port(USB3) and FPC */
> +&usb_mp {
> +	/* Limit to single port */
> +	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names = "usb2-0", "usb3-0";
> +
> +	status = "okay";
> +};

It's fine to keep the other one enabled, if only to make sure that
it's powered off sanely

Konrad
