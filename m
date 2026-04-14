Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D2313E10
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190178; cv=none; b=rWvvk6qW5YfmUkbo70fdxa0BoKX59YPQvuhbg13Yd9//UWe2K39KZ+SLqZlfH14zo4/U2x6SYKnfIa0VaY5wQxbYpM33yAJ+7rnxNn7tjSvdr2bwTkwPPrty+a01t0tt88qzPUT9Rt3cLeyka8Rl+GYAaMTL59Y6RIy/zdrufhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190178; c=relaxed/simple;
	bh=5w82pKv2WXWufedJS7qwaq74wFIN3FEp4pAdIB3xyIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpQGdsjCes4YVFIDczbJ12Aggbilxf+h/lzbP8J0XD1TqbS1qKRXsybWfQpynhN51xwfoMDlJF4S3IcUUULlrz/KxEfC+cBNvluWwruGIDUH7fJiWTg/aFjvprp+cN60K7aMVhNljPYIBGpKXDLHjD9WltIv0QMTHmPpwtyellg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/wX7mNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfpRw3Yo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/wX7mNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfpRw3Yo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbYCg1701737
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQW4iwUWFCyZ/sLRwcLBhiq2
	cIYCo+JQjo0/ZUZNJxc=; b=T/wX7mNbSFD/lS7IypR04Pg08Xt+/elmHObc+CtY
	PV8d0sfcC+HkfoV1oELHC4DI32KYL+taLtuDfa1nVXFCV34i9GxnGDSmnNqSx4Q7
	laJfDIjOdppBYk1O0bFqMB0ugtgTVaFmRrLoGv+yNoRaaRY2l27TwtMEaoenDjt+
	THZisUhsKGRq9AJUvOsLl5DSM1WHL4qsd9x49fbKR6bU3E7Xm60e7CPGD8YQbAm+
	x1NVLn8VNwRrLZd26wdwH/9NtNlArxKEWKoEg5hNcefN6QvDud4GRHvFdoIQcRQ6
	fZrFy3SAaFYZNBfgbmd2JOa5flbM32JXvQGNWICvoms38A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r45q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:09:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-956732444ffso7172979241.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776190174; x=1776794974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQW4iwUWFCyZ/sLRwcLBhiq2cIYCo+JQjo0/ZUZNJxc=;
        b=KfpRw3Yo0Vags5xa3gbIE9L5AigsyQaRbuNgUokLqqKGWp1ZhSwEZwuMXf0PddOljb
         6ktBDt9cbinongzYnbKePF7ot0me9N2mLvQ7LP+CNKVUUraLpJiQTR11sHXLFGuKBnbR
         kizbU2QIwnDeBrOnefVnWMKkOgF+TIKFqf4zCOS85QckUlhqlknq4yAo3xVJB+tg8CA3
         1VZGMGfOy2irE3B4l8uDmnlGoPtyjOSh0/H3zaw7KWfRv8aw1uosSfBZ6Usa8+sqeso+
         uYU810HL7hALaSzhmcjpTvmJBoTFy8m1X3W64UcDoX2vGFsKRExnPSa6A4cwwKUHDAXa
         lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776190174; x=1776794974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQW4iwUWFCyZ/sLRwcLBhiq2cIYCo+JQjo0/ZUZNJxc=;
        b=eHbKP+dBnl2Fia1de27xSWgINMuXLEPGG+il8AAPNmSnnDADEHruwiq6VFWw9zD/iG
         VuryYKjibLQMQTv7Cap0PlLYeh0ogo2H4HCtFb08UP+0YN1Z1VtNWHe6IbnsaBoG0uhp
         VW4E0q1rT9u+fCZHamjWR4bDyi9QOQHFRGx6Wmob+FOB+5BqveFlbgxEsDpgnjF/GbGx
         tB54vOrCBOaF5/BeVGohi4tKYxjmWyb4UwydM30EP+/9Lnv4MKLQCWFkTlnMz3lVrNyR
         rHaohHD/Vcj1cUIZUNMuJH6CusCfkAZSZxrulpE/sbkbYIaWhLLiwW+CYc0KHzhK2V2/
         k3XA==
X-Forwarded-Encrypted: i=1; AFNElJ+wf2XboMEPbvyYFGPRuuCRzIKMV2humw3fk0/JFtku2mBHrHGe5aHFKZotPNJ1pgJ1puaGNtuBAtkG@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQB819kMMptrgOGqkYvyx+hQGJpMtJNpFdSDoc78sQkpaE7+w
	YkktsZyftYOW/3jgeBZyLpsiQh6fqsJDCL1J3GQpAOH9rGsXSvjqxPUTeC5XTqNNyvxKsVVbFAD
	dcEOjiJNbf8koXrJuGDt0exyEk2tT/V1kh6fHSUBF5vEWlPXh6svhWsi4zx4tyvve
X-Gm-Gg: AeBDievvdfBvp3nQhgMIxsCLbcAUpqTFDfOMPyNCH6KiOLYgg08R5KhvZy6OzF1zvr5
	LQgblekTyxR9FMKxb/TD4h3nZYOS/n6H+gTJuJSXchNiO3JwnucNvLkq4WsQmUsIisMISv+O/TD
	JZoDEKrvqKCjYSCeZZdQsb/DyNobl7+3A8L1qB2Ss5rbswn+0ZpCmBFi4nbtun0DfgPMa2UUHKp
	8w/RvJMg8o8MPwprmMVGNdjvJITuybfaf9heDopoRKJxdLevNOWxttNHgqLXTWV+zQXpwhZ4jGy
	Lk1w5DOA4hCLiqx7ed6QQwTUUZ5TTuqJhUcKkq+z3WW0j7TgmUA4cHxHPSGrAwoDpA0sovKGIh3
	owByHgcyiYzFogSzQsTRq7+6UIGWfYc6PvnWKxEOBDHuRS49rElDjpM7e79GH3KJp4ersw/J2zs
	9spIP8lHA2gP9Gxyajw9O3J1Ob9rhKkacxX0WdKGFl8MGJnQ==
X-Received: by 2002:a05:6102:6a94:b0:605:2ab5:5c1d with SMTP id ada2fe7eead31-60a00840e84mr9198633137.22.1776190174104;
        Tue, 14 Apr 2026 11:09:34 -0700 (PDT)
X-Received: by 2002:a05:6102:6a94:b0:605:2ab5:5c1d with SMTP id ada2fe7eead31-60a00840e84mr9198625137.22.1776190173741;
        Tue, 14 Apr 2026 11:09:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86641sm3393244e87.3.2026.04.14.11.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:09:32 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:09:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
Message-ID: <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
 <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vvv48TAnmzZYnKlmPEOtc0k21dZ-rVkp
X-Proofpoint-GUID: vvv48TAnmzZYnKlmPEOtc0k21dZ-rVkp
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69de82de cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fqqIX7z1rOFd2Gj4uCoA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfX5cFqtGDk3NbX
 74ylY0j9WGDQuCtwuvv/uHFMUzY/I5kQS47psuYmvvnpw9/TAroCHnI7AOTDdzi5y/TX9eTRk6A
 NM8UHVJ9PY9UYp2rXZ/OXz94HgLshEIu2t02p4+0uIMJvqqeiB3klGFCzKi3J7h310uKNfDFzCP
 HpTDZ/TpAxB0pQEYOEz8uBu3qAv2lTfxlzFrQF0FeYCP5E5FzRuuAwAp80mW3jj8XU0cjrSkdxA
 K1GWF44Ca7xH0exGb0Q52daZbzEKOy+onQX2x8klihiVq2DpbLiIVFwh0tvBzWcXUpFfFHO7Lqo
 z6NuK1PT0aO9pMIHVec0KQ//OAAWga2Hrpzv5JAUr/FppJy+ZKNiyLciwnn0iGweN2cuosQdqBd
 Wub8Ady1Cj6wGa7GxAIzBMVTq1KkJ86mXK/1q4FaLkGbZ17RONkAzDUZ7RTDJvx0J8c3euBwwz0
 Fdu+KAzgyQfcCfaEKOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140169

On Tue, Apr 14, 2026 at 06:20:14PM +0200, Konrad Dybcio wrote:
> On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
> >> Few CAN controllers, part of RTSS sub-system on LeMans, route
> >> their RX signal through a I2C GPIO expander at address 0x3b.
> >> RTSS subsystem is an MCU like sub-system on LeMans with independent
> >> booting capability through OSPI interface and supports peripherals like
> >> RGMII, CAN-FD, UART, I2C, SPI etc.
> >>
> >> Describe this hardware wiring by configuring the expander GPIO 4 pin as
> >> hog with output-high, asserting the selected line during boot.
> > 
> > Missing platform name in the subject.
> > 
> >>
> >> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> >> index a1ef4eba2a20..b8371bdf9933 100644
> >> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> >> @@ -615,6 +615,13 @@ expander3: gpio@3b {
> >>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
> >>  		pinctrl-0 = <&expander3_int>;
> >>  		pinctrl-names = "default";
> >> +
> >> +		rtss-can-sel-hog {
> > 
> > Why is it being described as a hog rather than a pinctrl used by the
> > CAN device?
> 
> My understanding is that the CAN bus is managed by SAIL ("RTSS")

So, Linux can affect what is being required for the safety island?

-- 
With best wishes
Dmitry
