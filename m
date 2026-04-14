Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD403ECBC8
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182929; cv=none; b=n3AO2IOhNls+FgJ1V1PaZxdGJ/84ELRE7BFfXF1tn3ByI43HYVnP1glva4OZJ2cD1TbzjUipc81Fj+0pJnw1bZ9oyw7Z66d0W9bWpaI6aPG8SbGOZyGVVzPMHfxNvS+UMs/KZImVT+Z/GZDftlCWohT8CtrJlP94GNhL2dx0GH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182929; c=relaxed/simple;
	bh=NLPxfCULJ2qsyzWK5Dp9rEP9OSVp/KW/yC3MBmQjmNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdC/aMhqmiodt5ztIdFAEKoITRCnfbQ0O4DsokaPl2syt3TCoekPEnV/5PsoR25e0TUHELy+Vo7pSNu9mvyP+wLTvwinTH7uzrl0xgmQsXeTK7pkmfKml/v1lTkT9zlMJ/Q+Z5yxcjVr1bDwVS/qpLef5Fw7CRqshDdGs8OH33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iO5njQB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id9n8DBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iO5njQB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id9n8DBQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4X2B2005561
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OMMN3K/G28gWnWSgwg3WpgA+
	sO0LinqKSjxUMdtekxs=; b=iO5njQB/jKyw8tzNN/hl02mzwX4eJusRtcZgbpic
	iHoJNYCZqLwq+7GDt0UwoNXUTV5RakjkpCIHAbOWHgcqYd8tO1sROhW4tU/uxHye
	Q+NGJbc/ROWYr4GK92H3D3axLu6flLZMiiuw+bpcihb91+h6AEt8V2U5p2a3I4vS
	aZhLg3mEBe1ndpAogRZVov2/bhhhMHzwpM77UX+Um7uHjI3wvrr2y+7kkWkT3kzH
	BIOQGET9nyyeDtm0qzd+uufrXA35G2ZJAS7C5BRoqT9UPTN4XhbrjmJ03fUyZ8XE
	qASyaBZrVt/Ev/pYTnx4UUvxIVBN42P3fxJ87MAr7Vy73g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjr0sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:08:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-61010bc9c12so1230766137.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776182926; x=1776787726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OMMN3K/G28gWnWSgwg3WpgA+sO0LinqKSjxUMdtekxs=;
        b=id9n8DBQK6AgEboBptj/QGIuA/7CG4WqLVEff2tLRLzFXGv5aK+YcfBUezvq6goqr3
         CrJ8M3Xn55OF5mz2bKvBaSXnxj/8g+1PFDnc/n4RJj68zBZIUk5EOEXraEeRO9L7JrIE
         /vU/B95nVj05W1Gl+YMloCAMsghMSEDwxEjAYucteTk0lbdbVI+6GuYb09LIniPbamhs
         8EVWXlVrH0F1TYe2KGHbrpnFy8cgMKW7N3Cwv+YMdOwGn6yACC7hlwAwmsd4E85qwEHD
         BUgKSxYwDveBwT8ksZsd838EFeRM6WnV1zbDPwNgEtlLFBGvG/WQNka7q3m2uvCWOw0+
         eqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182926; x=1776787726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMMN3K/G28gWnWSgwg3WpgA+sO0LinqKSjxUMdtekxs=;
        b=bOQOaCZSPeruuHDgb/PDAFbawE2k5CMFjruw277nZmYu4OuphKNNitldv5pBxTnpUE
         W6BbkqCeHV+MvwVip00132UQ4w0z2r6w3BxG8jPVCY+k7ucUb7RAm6jbN8IIusfEfYdv
         EjUZFdHd5AXNsAK4u1NzTcX2wsB6dzy9IeN0HhVEZMgdV/e+IxSUrqTUrqxlpGEgHz7l
         XGfvvE6qhfcX6bIzTUuIQJVc6n6yf68eym6aCpryt6/retfGqsWsgTi/qOWRr1cBqNL5
         FQCwj0nilwE/Yhow3/0dH25Gi9aYg1Xv35gykVnfCGX2LdGccdIKn90OiIzQB/MI9b9I
         /oXw==
X-Forwarded-Encrypted: i=1; AFNElJ9AVRhJu5eIpfOlcLQXYxP7JLrMj4D0VlbgCsNJN+cC5o5BPmshXbpzuUiJkA4z38wOF2Ne0NpOeqKV@vger.kernel.org
X-Gm-Message-State: AOJu0Yytx8ayIDb9tOikFttxezElvNOIwBfKYx2zpET3qcXNzvfjbCU8
	Z2HEUp2zJyK2vNr7RlLtCi/FMau64Sia02tJMu6z28tXBH8qC5PTfgdNpktDmGL7x/z2yB02FOV
	Pree2T7YbqnXLQicB/PHF4AedJzlpKDEnD1e77avwMCFOBP3ezdEMoTympPnBZ7FM
X-Gm-Gg: AeBDievhmeHR5E7jtem8ojc33oDRmTewlSz/aeHAR5gP3xNtPj2AXXpZkEEcNPAV3Wg
	AggKC/d+4SIhxyqJ+5jw3D/8GuOmwtmlIHjTURlte72tdVqE9GnNl8Cwrq1dOLDku81DoCgaDkw
	h5zi/irKh3H0xAGGSNh5WaavokbwFowxOtzVULMxpNybWpgCKvxhlEe2xAw9e54reZRKVng3/hL
	mgsoMgvEF/FaQo79YHoT0haVzXB+4GRYSqJxS8O+tMmG65KZdx+wR7rzId6Vz+Ymqp2g40TbE/h
	gmt/4fu6mxnRUvkrR94a0Tua2QRw4x4Zq1IkyHuqHIwupNnssgTr5r9O5exsLlGcpzuitg4+A+1
	MCLy/UjuzysH0oeVWfXTIBeb0gGfr3ml+jkcoA4kVSPiT1ktf6FAZDQvLqNvPyCaPDXXF30MRZl
	GpDvkarciAy3Vxn92EUhCpfYKHnXEsUFXIugxhWijO0VUVtQ==
X-Received: by 2002:a05:6102:2907:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-609fe7a57a0mr6837791137.2.1776182925814;
        Tue, 14 Apr 2026 09:08:45 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-609fe7a57a0mr6837725137.2.1776182925246;
        Tue, 14 Apr 2026 09:08:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86a45sm3364301e87.11.2026.04.14.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:08:43 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:08:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
Message-ID: <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de668e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mFfd3EELJfy8KQ5yalwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: L8CPCEnToxzwxXBJEDCPdZiJ8-trAjOC
X-Proofpoint-GUID: L8CPCEnToxzwxXBJEDCPdZiJ8-trAjOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0OSBTYWx0ZWRfX764uYN8TAuZ3
 eGqtXnFo9KOQVt5vMVcgMANBC+TJK0FLHGu9tZLmVIDVgdPjZxBboXBiTuCMmH+CjSCkszQwlD2
 7gfMz14BuL3B7CFX+u5hNxAQX5h3tH4qQoPRsUyoIX3Rk87S7is/JtI3Eglx98AAmwP1bHVx5Jm
 NGQsGBv7ZKXIT4GmFYhAguUV3j5bjNHAEXGPWZdt4uscm4QfsSDPChIV4AXtQqnlym0ygJVXDOV
 maJPpdt7OjNUlpX3xguADebDtPOICXwAyUPA8rprsF/tL06jFbzMXMoOS/UXjSNOPqrO7/63PYx
 On3z6E4/GOFABFBXzyp8UYHl/hwZYOvgTU/i6Vj9khifVdNbU9DktxDlPF1J4HEBhYjow1Ccqfx
 o8GYc/wpB1ZKfmCI8m4DxRT0itjxV8ORmL6cmCW9rWGCiarl9SBp9gs03k4luOpR2CJghP35VsH
 uS+ybFj60upRtVr8tPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140149

On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
> Few CAN controllers, part of RTSS sub-system on LeMans, route
> their RX signal through a I2C GPIO expander at address 0x3b.
> RTSS subsystem is an MCU like sub-system on LeMans with independent
> booting capability through OSPI interface and supports peripherals like
> RGMII, CAN-FD, UART, I2C, SPI etc.
> 
> Describe this hardware wiring by configuring the expander GPIO 4 pin as
> hog with output-high, asserting the selected line during boot.

Missing platform name in the subject.

> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index a1ef4eba2a20..b8371bdf9933 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&expander3_int>;
>  		pinctrl-names = "default";
> +
> +		rtss-can-sel-hog {

Why is it being described as a hog rather than a pinctrl used by the
CAN device?

> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "rtss-can-sel";
> +		};
>  	};
>  
>  	eeprom@50 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
