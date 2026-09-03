Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9B3D16EF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426222; cv=none; b=G+0VRrtEwsb7+jKGCLqhgOpwdxtn7kbiKnkaGDy0vervoV18qYW2Qn61EPi3mXJgXXp4UUNLH/l9tPOD4SYHUBQqRrnqwDo4rY6tmq8WCz3e1sdI5FL7Ru+2VZ9V61Q3dGgWE6T0A3JLsNRG5IJ/Tr8G4d9+PuFUm4ab7cf5vGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426222; c=relaxed/simple;
	bh=xy8aNWgnRdRY1DlWK/SxqljKRpkWft1mvEFWwBjDRBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCTGK6EhgwmY8VFJJyZfItpDDO27tARSB5OWJYb5Mk2w2ZunphGmIHMvPwxlYhC11v/8msUgglQuQ+Y1pJPt/NgDRE4G/vx1rlTK6LDf0EiG8J582v2nPBvcRir7qvsxnSiCvq6GsvoqQ87SrL7n5MC+JMFAaxLt1OhRhvW6ZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8cWCKc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0jwzaIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8cWCKc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0jwzaIW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392vL4269141
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=; b=C8cWCKc61Ft9Yhem
	nFhK6b4/VPHl5oGbuLcKXnF0W6iaJ+x43knEjYXdaxs/SpMVThuyXiNxsp9D/DMh
	xYsqAJfWsu3G/DB8QshstYvP6aQcCJv+TciEfNug3G3L3iX3lhZM+1Z+fgA6ITd+
	wHhtGZhdJ7Nu9wdhjrMV3caY0kfgdBwl8AdpJpILdN8bCM04ro/8xexSDM2iH+iu
	df9nLhHVfJ+G6H5Jt6B4W3LuWWIHRCYA2R/iy427iRvMv8sx6hsfS7ZaWv0d74Ke
	RsuGofUSV3N8VnL7em/TLSCRjJiNQhuFdwwbRo9wxErUtBucVRWPqFwYyXME8gnQ
	71MstQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhcbqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:03:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso83040137.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426140; x=1789030940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=;
        b=A0jwzaIWEbI915hxik49VWLmjv1L0hh9Xc2Ca6tV/D0gVyILoaO/AMGb3bAC+2LmH2
         doPI/NiKcZt8uLyZUz5qf5NyCG6IPt+pofuKgGta3H2zcvpdg/uQfk60v5nct05mFExP
         FVkL9FpFleTut9ASDswtk52f/MhrX27TQaG9cZMLawLzExDCZNMysL6//K0XgclyQVDa
         ritImXsRx+EE8Tt6KiqFfMt4n+eVKUQUEFVX2xleAhXm3pOaFI05foXIhnOwwaPnpR85
         qVlducE6h4mVK/HYYjxUOmnYx3GEf/hU7HVqXpcdcMXPjTDej3pWS5JLATpmlWTCVZML
         xS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426140; x=1789030940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=;
        b=JbdI8ZXbW2ZWxVTlg9jPQ0r/cc+nP+txw0hViRp9wjzSuMg2ICR/KYM6CW7ocw9IAy
         2H1K/QXtqqAosgqVZdL9OKSBHTbX+2/h3eWIGy+/uzMSR+OJn97sv2z3eoIBLXvgQ2Pj
         on488F+lIAeX/3HzRggHOiS5FLvnJb0Zfynan3tkzqa219u0pJ4qQaaIywQuS0MY7BRy
         ClrH64j1alVkSMilFZazbmZj1+JNW1J/LvFqlBBqj2rE6POnJlXbh5invnGWvxcITUEZ
         Ge7GtTOklGuZf/CBn+TDBtqVz+UKFicCBJt+ow0njXMeCqXiVej0TYGkunANse5lreHE
         5U1w==
X-Forwarded-Encrypted: i=1; AKwUvBy1unEnZR95OpLaEj8lZ9FX+xL9fVKJIhOpS5mr0+qA2yAFQioDHYowRq3JCqV31Cl1atGW/h5OsL88@vger.kernel.org
X-Gm-Message-State: AFuF++ne0RdCmBu711AuJ+ul8slogU3G9Qn/rHC2sFmLZSGt2V79K56J
	Wh4CT5AR8wA7hKfz05RFZQxhIA6m9fQN0wRlZvBXfNbLaniyrsr6elI2Ejr+vE9KvHZeG2nBiNV
	sRz5AVuulIAlQTKE8kc6FS/UNQ59TTroCWyuvFF1+v3Uy1nm8fSkednkQHW9x34S2
X-Gm-Gg: AYBFou1p/tm/Gjpz0T3zip0GE/jZZ+V0rhma5P6wlIsK7si105y+W1qfSq0M+eJXXt6
	2xyXYk0ZfZwsWpIHYsPG7Ps2Cpio8/hTFaf9iP/wtO7OBrE+hy7vJTsM0SgdYrx45f5R4qnLQC7
	HzJjEjfubPt0aeLoDy5ghUsZ+qNdmY8cONtuwAVeC0D0EawMrbPF6Fp4PSdLGx7SqyBCMFuuhiC
	a3M3MbPP8bBrkkE0dnmzgFd5sr/lV+D00x/KsdW5CDHFVYWVp69OptRYK+p4/ATpm/gblwGlio9
	7pKiPs8BY9J6xURDIh57l6PovxjIuxcDZt465CtVgWt6sB0jXe052gV/+WbD374iSncXyVpAC7x
	yAsDHb4+92koGRk814xxAMA==
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1655447137.2.1788426140082;
        Thu, 03 Sep 2026 02:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1655435137.2.1788426139512;
        Thu, 03 Sep 2026 02:02:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172032sm67248466b.22.2026.09.03.02.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:02:18 -0700 (PDT)
Message-ID: <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:02:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KyddN60pmOxwCda5i8CziJP4g2clyH2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX7Je2KDcpiU2b
 bAm+k9UlWX+yEFUTJ0KjRjLF+me5wZ/U52tU2sUj2lE0YRYTermFhtnCkXkalC2BudUg05+yXm2
 FX1NuhWM1fROgrbtlURha8Bu2RaSRp/IuARxrLW8izIT+7MR0MXVSqCflFFAHGvI0xJIpANbv9D
 qR7OWOX/JDz8vu5ettEVuHcfwYIZ/j71PHu95Hf5vBsEXIaSUNCX8gGQ9MQUplrdvzFNlBveVuw
 7zgLYV9BA6ZKLuTmu6GIhv32QViVj5DWDrQ9tUJFRYJLtmPV0Ug+4nTpeRngwC0xF454nvYWLpj
 ZSLyiEXw6vnbVLEoSQAPTLGmVkcDjUwjqvPPolqEJfG1HVMhy9hwWuvtf+ASCKIYb+awlrb1vS4
 9fAavQPSul4Ow6cu3lkPRaQ4z7MJpr9xAtdmzOmDSD1SSw6R1OHILIxTTmuDQ40w47cPS2t13zG
 79q7/VZd7M87O/vnZpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX+SkDNyk0qTA+
 OSU0ptu0ne2qLiU12KQrv6tdbgQspnfEFD9KEWner3xDXPIDMnqsDQYiCGLTAgiOFVRkV5HJzUv
 owDQb0ZZArJVOlb/r+1GliKjRXFTFng=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9937eb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qI3sZz0o0dxpMlL5iVwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: KyddN60pmOxwCda5i8CziJP4g2clyH2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030077

On 8/24/26 4:49 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---

[...]

> +	msm_therm_bridge: msm-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	quiet_therm_bridge: quiet-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	xo_therm_bridge: xo-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};

I see the SoM also has a PA_THERM0 thermistor at AMUX1


> +
> +	thermal-zones {
> +		sys-1-thermal {

Please give these meaningful names

Also, the XO one can go to the PMIC DTSI since it's always there

Konrad
