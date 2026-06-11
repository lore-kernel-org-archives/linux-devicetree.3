Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74583A7F75
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209637; cv=none; b=OVJoEECVw69/h4MYP8wb5ZzaLHsapRYkfmKejEep0zVlewK5G0fWUpVVN6RXeekjB2vc6vlVTMF7q7I4aYnRJhnL8lQlYgV6z0j9zji+P4d8MTbL6hOMCSX0EwFuEvhNj6TXWjQAW0RVSrMfqv2poAbxdJY9UyhJ7Ed0iGsHXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209637; c=relaxed/simple;
	bh=SNKhpV4UsCOuxobndaMzPRySz5cmpw3LpqlDlwJPfWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sf4QHhniOexISZht5/nx83kGTIeEs0vr4OHl/T5OurefJmyhG3QoqWsP3tdVo2GTaAU1EB+RU6em+os0yh4MqjGj5fd4fgQcwayUwiUqe2HPo3aHx1rTGXF5S9puLa2zrOywlShVZQHdnMBEqOBbUUo60nJlHnds0YTmMUUIGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtjZFCi+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+wFUiCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtjZFCi+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+wFUiCo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3OB71389253
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQBF4pKHDzaZb4PUrojp9IHT
	+Wtkkpm3p6FxhUuFZnI=; b=EtjZFCi+YDAbkqtaTOokqjuQgy2XDfvNcDZTasiU
	3lOPPTwDS5nVY8Ci83Tg6GGSApiU0OLe5zNaPZbrNa+TgZgcMtOX15yKPw4hCUAe
	v76QobYwRu/cWg7E/My26Bu5Uqhsryy/yJAuCNLtR8TrnytcKAHQHcEdCaBjj/JE
	con9MGR0r2YbqXXwAjFQlQaxaiVDZoZg2HZpMI0js8Bu69dqO+ImeRziy7QNf5te
	HSfQ2RW6LXfks2guTxX5Os/k3QRto67iGzE1yv/zAJ0ApMlcz/HnD/q3t/Blk1nj
	FW5CuHR/8Lp7ug9XeUFBlYkg7glZwGlBOIlKYApVwVNwzw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658ue5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5794db0eeso187133137.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209634; x=1781814434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQBF4pKHDzaZb4PUrojp9IHT+Wtkkpm3p6FxhUuFZnI=;
        b=F+wFUiCoCX+7pzWaK5AKHb3dh9WarrdlkgGofjSvd039fZcyrmIZPjEyoIxbzpGPHb
         YDmKpmAI3e5iju5hQmTVO11Ov5laFtICsHn+p/uqzHX/Ptc2VVgJWnPHV6YIOh3cZmTw
         qiJ4vxHqReL/7AdB/PvGf3Bhy5/50/qWodM2qC+jyj/HOul3UPLXFRD1bPmnnIK77Yzs
         Ew6HM5Cm2GguRHcLpIj+w9c+xJ4D9njr0lsIWR2akflj0KPkUrmEZiy6kIdwjIV8fjE2
         XWJ+ebHBT1JK9sWLRinRaNFmiopely3AW4k7fqLT9/VMxOaI1jt40LsxOt3JvWJtzwJT
         uKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209634; x=1781814434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQBF4pKHDzaZb4PUrojp9IHT+Wtkkpm3p6FxhUuFZnI=;
        b=bQxIQvmcIqKZXU7Unm9EygMca8onDlJqwgX8bRhEteSc0t23AYG0hEYpNrj/b6hjOo
         6tfYTlWB/q4TYUglqyZ9uA7WgBj5tm906OGlloX92rSBh8lsAujXW1aT5uvVmZuXdJD4
         rwqGU78g9nbw+m5+u3qTWgnRTEDV5ceovtE/eQcUd9ESa/KRNOsDxyB56zr43GSIsVYf
         DkTef9+zt+c0ows6uAEHC4QqrhR2qHSbAzQroy7nmk1o9X218XbODYC6kkDIlpnpWCqg
         uIQX8Z23+hGYVdYGiqKy4oOlbEgTaNVQUBv3hOYmiJaCk4hQ8ReVf4o/ojHpeUm3LQjZ
         ngZA==
X-Forwarded-Encrypted: i=1; AFNElJ+a9E0RcaTjZ7AlINZF6txmHrydTHnVQovGsaneOwjhUccqV29D337t9KdyF9gKmdsNmtHV5WrFf8bd@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7ICBBmi+c0JgVL0lCuTvXlgLJDx8ATdEw/EqzMPrmPc0HuGt
	NjeQLyw3wU0HOVffOzjEMk0PLzyJoBOhFqNAa8s93Ou94YtkbfwUe4BsTQ0hDbhAL65ArIo4Mye
	FPov9QBU3qxkI92gJcrnOem1c7aAQZSpL/u9vQG3IhHeFrJBwEwyCUzyc+RcV/h/N
X-Gm-Gg: Acq92OF6SyttZ86mwfvbmgGZy/trrAUoTVm8iPLpAUH4f/v9QNY6wlYryn0g3IcdHOI
	xtEIr+gvuEvcV1P8CxUywAKGmowIooXUhBM1pZyEUHNsiw331tUpvbWm8GcN0G42zOb6MuoFYMn
	XvmD9l7L9tgARZVE0DHgdX0YL++HmnivwD6l//mkDi8g43FMebGpRyT5w6St3Az86/LFLJSFB9k
	cN1pXgK0pQ5h/tgeUtox/V/vaK0VH+10TAqEvAxTBv5Ziiu4rMr0RBMgJM/sAYrVy+ihlmyByl6
	esf2JEIM9jvVEXahHXSjbjzDLaxtSXBVdqBW9RxFKI9FUuXknV9+x7/McwTQcrQQRoVB+8fcDAS
	OCgcAQfZX7MsjP9ovZEZDKYIAFJ5YL0HqPe2qYYgsTf73v75PjbSO/xOUgWY3AzZWzniQNWbnLt
	yU2WkOKdTlBos7Lup1WZ/Ce/zHxPA9sjHdYYY=
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr3089279137.20.1781209634116;
        Thu, 11 Jun 2026 13:27:14 -0700 (PDT)
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr3089259137.20.1781209633698;
        Thu, 11 Jun 2026 13:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c2ba89sm300791fa.5.2026.06.11.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:27:11 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:27:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add
 ina232 power sensor
Message-ID: <dtees6izgdfuiwkfhc36h7h5ybjyuajumsysaig4yucsijtqw2@b3wo3yys5uq5>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX3GXn3e6GqkJ9
 ICBlRfv8y1yFTpkCk45452qDdRBwmYpiD7G8zIHlGtKqXtpbXRRAOjkpgY7kb+MVpvvY2ELaPes
 /e+xrvfKSe8NTUdOMe/jZc6+kaeLSqpE9bRBsTQhtEIoRD84c+jsXUz/mx2fOaVMj7T50Vowm19
 aYkeGFmoo8jDkiY9aIWgSbO/mj1fCSTu7XjT5T+ep6DD8Ty0hmV5tlBEeHJxEMfZjjHWZG+WbP/
 98v1QSEHRsnL4zR9w29HTiKY0uTHi6l1pv8rclZvSTQGMewZIQqvuc30RGIWyrGQk3bzOc2KUo7
 QHA+dceSzDU/wmeSJpv0Xi8oCmwBQsXTmt4udDmBkUt823vKdi7z9nFR2j1/Ll+VUKCA2V2piYw
 9D9XkwfkOlFYBGUH59BuWb3DS4YkYe51hIwIY2huuOvEWRMjdjYTaxOdFpJrbhN9fy0aeAQNJ3t
 N5b1Xa9knl7+gAoLA5A==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b1a23 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: sL1T4K5BKm7kFVpHIJokDVNNPi9Ks_aQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX7e4HjWT3QrCM
 N8TXuCdWMo1HxoOd71Au4dj5u5YJGloF5zR02bM5vuKtUuniOn1r/z0n31zurY3wY1orhoLCaUX
 9rlBsSS1UNwJa1yY+IKTXzulhco5Xc8=
X-Proofpoint-GUID: sL1T4K5BKm7kFVpHIJokDVNNPi9Ks_aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110205

On Thu, Jun 11, 2026 at 04:05:26PM +0200, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2 milliohms shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
