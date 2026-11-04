Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781453;
	b=H16cEFeExr1xIQ3XBIQJa0363xY9xDkpo17ayRO86YhIISL23O7NBpQV3s1AchqmNNSR
	 ddPV3zc0CGZ9YBoGxRVgVltm1ts7sJ7EkV7cxsNc0JMltwNtL2Dhl2opnSqmRDj8rCKni
	 UjuKyyHGb32/eiCtYwds03eVVssDNW9mXUJHOAzR/xfgJTYMNfwAAacXxZjPdhnv4QrD1
	 q6etENv9XNjz+b2k7sFa6uRoct7k3D3U3bw2gwzjLrq5/tZBURoeE8XRFu9jF6a5VAYIA
	 0dPX2BOlNsvp76OAPsXjW5w0gI1ueJbJwJYrFYwsOpYLToeSp5iiYFsTC6y+ds9O1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
	b=yQY+NQeGVCPiTs5+Fx2g3mnRmZpIYr+ti7ySccqBv+Dp0bAxrhCr4x/jcO6y3mVNTtN/
	 Q9dXx0EmMtnm1/H1XmbBc3tSYJ/LWewSel10lCY1YBHHH5gDJsE5Oi10B6a+xDw0BEHE9
	 HhPMiTqkzy+HZ8fIZoBICOLX2qGe7Jo5vC2x6FbyepoWv1oTxlPQCn6fdytruY8ZTbuap
	 PmPFONuh/LIVpaPT2d6HeyQXe9b+V1IWSASW3CrgQrqphkeoMPUJS7jWbpOLbbS6t1cxg
	 7AJDxch5BM+ahGeuD1OzqtCS20v3Fca3NhhUMThW+2OPJ60lIbpiQCxV+hYStiUI3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9253606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9253606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KLZl918413
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=; b=ZklL7L7ZCWzQ2sZv
	tFpS+HVTme9ImWkasA4By92hM/ckOxk1UZQ8dB8KKqny2rV56YPm02nuXkapFpa0
	/93w5AX3YB6/kSHOCKGY5PMWQinMs4bkaFtqyLBeykadLqLEb+0GHIvAN4/XKl42
	7maxi98XZ4EyhRQc+FU78lpXJr//wyijsjg8MJ2trwdY8N9o3d5RJ8rKw/TUYhfN
	touLwV6tCFBe12u0myVNKQR2g1hIOMZBpyE5Jhu+leDxLqJSWcbAdFm6J4ihWtLx
	HZNV3xfDGU9p6alhIBG+iplWJVDNRx9hMh7P4NMH+uGiFC9OmsYdeEKEshaHsiR1
	+N0GzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg955p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:37:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso1382751cf.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781451; x=1794386251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=SR0beHqpbclrsxfec93AMxzw9QKXVpjS1WpzP218AT5Xj97T0x+G+ypmj3Va7cZ1kf
         ZLgqtCK+apakHbojRjXVq2AdVQ2eZy7YnfL/XyyJQgEuFkAup5HZKe65T+KaGMi58ouo
         oOKVe0XBEKHuo27jOimkkcS8+vrv65ABsmRNyDDkKvbygb8MxlxCmm1viHvgIpu06TxX
         y7kvH0OjSsDp5pt9StUfaYprediGs5fDEwf/z1pXcr8wXRbKfAOrCMsjL7VkeDGaLKFg
         u78OhaU+74FfVgF90IIg7vwee8Eu5cKIx7yh8L+o3K6cTCktIvl/+/0c/YHa4cIJ2SV+
         K0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781451; x=1794386251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=cX3+6/Avof4MlOvi8gOpreeA3aeP3hDK9iF7UyhNay+IDDG1oE5plwhJ/5nYPI44NW
         Wxe6zBzOiRnqjfYFzPe0lvBc5w20SpgQB+++iZnmQF3mHi4Lj3rq7Jq8OndczyzDVuFl
         hCb/xm3FnwQvGX9516VIaoyAx4m0vUf+fwU4km9CrcnvRondoo2FmPtzyr4vMt8uTqjz
         817blT28ilsVeRwshr/9L5Flc9y+2tpml4mq5cW7iLKOJzN1o3PH+9xeH7P3fuuHVZ9x
         PLd9UXyBoluJFA7Q7eeDyp3wiPUG21opU0o97jxctIfpZnWEcCAJYCp/DozS3SQkFM1g
         M8+A==
X-Forwarded-Encrypted: i=1; AKwUvByNXKz5yrdpUAof9o8m0ZkX7mCwrjETeEjGKwTWB39IAS7tAnLkJVL4NsJZCye8lFDo6lAmSjzDRJWh@vger.kernel.org
X-Gm-Message-State: APuU4Z/VdrHVMCmv3+oow9onZyIYvH2CkZdzfZ2QjiSSByegbEKkT0Ao
	h2a1GH6xbxkXFhts8wNSFT6i4qFNYle+PY3ZEZtzRcjH9obTQBJIoyb7k/8yNKC1nh+fsuu7Eu3
	MvjpFrAe1dCutcWsl/exFQbnej5WRlZ9HJIBH5lNa9CtGTizZgLyNzIUeNQzBD+CY
X-Gm-Gg: AYBFou2R4relCtjnJUaVhZQ4G2w95KbZvSQRr6WjMICotJxwRJdEVDQ96rOfJw5UlzN
	OmB7xqAZPOMwB6PisDvlwfmRacSzMwvbbGJTZSEVptsHU9yj9HItWgNw7GbKA7C21qqukADYlMF
	BDj32v/51gHNlr0x3s0XiqcMIi5lKVsQFiYilL+koOGnf9ciVk89HBqA+Pg10jipx4OZrZvUFhJ
	V5PPQGMEspbrm4Sb+VtKqrgu+Dlmi27mZO3bsjxTiXvwbYb3eoD3PhMzBM1UglUrVxKY+mA5yUr
	LwFma2tm3MsDR3nGcXDoE17w36mfXTqVshI97PvKmhPx9ukeZI1+6guAVvgIQmyAab8ve4/OG0R
	ESkxx8I/ZIC9YMZX6uQfOJwDeRpuGT8wMjjVnjW/HXIDuvnfrz3d3fQrcqzE06/K0Wkk3
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481151685a.0.1793781451240;
        Wed, 04 Nov 2026 00:37:31 -0800 (PST)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481148285a.0.1793781450641;
        Wed, 04 Nov 2026 00:37:30 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm538339a12.5.2026.11.04.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:37:29 -0800 (PST)
Message-ID: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:37:27 +0100
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
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aursRfQRr0AOL1Oi@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaeecb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=iGHA9ds3AAAA:8 a=dNOK39mv2ItteVrz7R4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: lnPIHVnHmBmIewm2cj-wzuqncgNhUCvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX/84SPw/a0ywc
 wZHi96IQTc00FGT5y6gjEFO4fsHfArQTbUslZYnBftzSJzsZ5X+ww6doUU81Unprbq1bpUnix11
 kwS0OrcX99HiynTjdLqcfRmP9lvPqqaHRIcNKGrKTC2A6k/pNFH6A2vhV9hnf2mYW0t/kkL9SzS
 IgpV2i5wvd4bkyqrndiqX5J0NvRqv/WGkTkfj4d1wTYet7ZmLWDYE24utMDPDEYJlpoVYybTTSW
 NYy0tG7NjR4SvOE0IWA3N+wPk6McOG1HSu7BgFyCBGsiHJFQpoU3wUdaAiTLdGOWbKjmdSlFXs+
 ZWDpLBJYSmPG3KNkhemhh/FPv6vz/HXMAuF/tunmV9sqslGspyLx7A/QymZpDQBE1wlMNO4PUtE
 AIk3SQQnuCtdH0XHVOnLrHaptZuMQCFO8vrZUkcINov9AHNsMOwRBn7uUyuOp4gYewjbVyW/wrK
 gEdtchaoD9ARk144dqw==
X-Proofpoint-GUID: lnPIHVnHmBmIewm2cj-wzuqncgNhUCvn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXxGZwQRR4z7Lr
 od9NuMLziKIPtl8cO6D27NGt2c0AwaH801di1i3ZQy0Pec+uACp0b9MepDePzkJn8zzLB49zxlB
 8i+GNWennIo28Q0fz1pdHFJGSegBYlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> yocto kernel maintainer Bruce)

[...]

> With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> in arm64 builds:
> 
> LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> 
> In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> get applied in the final .config etc and one of the checks is for dependency loops which now
> fails with 7.4-rc1, full log below[2].
> 
> To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> now can exists in the kernel tree.
> 
> Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> loop to and from LEDS_CLASS?

https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Konrad
