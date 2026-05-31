Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D5243951
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218588; cv=none; b=oyRREc0lv5HGxT3lLwNOSbO8q7bCZ4vIltWBHU7VoOzVqxAGewA0Vp/vReAltmmwk72U/CznZ5EdZZlp6+Lr/IR9NrL/IU0b+7ChWvobLNCjuhk410liO0G9P3l8IKgwZfVh4Qc39Bd/hXnEHJ2gCjqaZSZQCmUgwDHCFO9QUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218588; c=relaxed/simple;
	bh=ATQcVAvp1HmKNaEgs932roDbLg512YFmXXFGjFzdtqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmEEq95efNq5h874OVhisYSNF8dYuI9dvp6PkJKe2YI3tQOXRdeKslO/wh6PrMCt1S1xIhVEZlnvqcSspnfDeRMzJq60KkWQiOzdDqoQaDRd3zT9oVwMMqI7Q6yyMjXopkTVovfXRGp6WRXyoyywnSXhGav67Tig2gL2jrwo2KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKmDk9PY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt4ad+fc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKmDk9PY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt4ad+fc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V3wcJe3886929
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=foegc0ml0k0+ipyBYI4YuHEj
	n4nzcMp7/HF3r3HeSAI=; b=KKmDk9PYf7GSIPB6r52rmmiIwz0+RFNUmfs9aMsH
	deRkMPJyUQ60vSmt87hnn7pHnOgKuSVk8qgTRA9Mi6XJhu4GFt1LV+a7p5QS5M9S
	IKfi0zhJLh97AaC+uRTc5LHsesVVa/+p6nJ269GJAsj9NW639vWYVDS6Jz3OIs/Z
	cLaNi1rPJkM+iBJ/9gTrm2Nr6hg+YtJpthRjuy3gk3d2CWeKyjYxmle83/bDz5F0
	k9ILnXOPAQZ2WjJI8Om7Gq6tQyFRKGjdthhOpPB5sO7au6sQbs6zMVLQMtM6TF8L
	/RydzRRJe0+u+MBq2zY4gusHOuXVoDuIZZ69atIJTDLyOw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66u07c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:09:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso155391137.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780218585; x=1780823385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=foegc0ml0k0+ipyBYI4YuHEjn4nzcMp7/HF3r3HeSAI=;
        b=Qt4ad+fcQ4HosI5yoRuh2+0fgnQlt8n0M5kUTdsP2qfNl4IafJ4PbWwob+YdzCCBKm
         DCyohtcwkLK/xS+GtItfpHucy5rEo7cqqFJReN9HnQydEcTzp3pRUH4Zxx2yUXIjkjpT
         +HWWQGOxv5iA91p/IYobYP45jF1BwFUWe5NjaGZbja8zMWQDs/r978QPqBuSqHHar29+
         aBXYiSCxVcvEJ7bteOICMO53uo1VFKxH8M3bbMWZ4TZ+L7JAJV+LUHpToHtn09sNASF6
         Wf6YOgV7Ejpm9n2I7tN64HyloZaWUDhKzmK9pmFRhoCmPgH8huiuetYQ039NeqsOODE/
         Z4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780218585; x=1780823385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foegc0ml0k0+ipyBYI4YuHEjn4nzcMp7/HF3r3HeSAI=;
        b=PPES9dxJwiO036uXiC9S6NxWdids2/4R/fPYHTos2nwEPLZ0hdk4OCW879oJu583y1
         7nOlDlhltK1RnyVU0KkLvJmT9TwqLV0SwFlK4FTmcarQoA858gBqcaJgCb1CnEjdIMX/
         vcC1/h8p2tjho9abOBLSUvCKaPEEUHMZs1I+4hH6RNOVhpd+eMa0xM5OIRi5xMeMg8Fy
         fAayhNMAF5KA2sOgQyQGm1GzDkBoy9j1JfPHydCjo9eu5gJF9rkljhrDtZpdMp240utb
         ubsDIjLbfviwIQ/oOra+kwOv7FsznkrSFeKOasKi7NVWtTWB84hO9fWyOPmkTJ2px6cO
         ia4A==
X-Forwarded-Encrypted: i=1; AFNElJ9MunySWPtHijpyPhC6oqxdWGuBd1HKgOY9DiJjxMt/kRDRBxhsMIkIONBpuiLAoB4zEKYZYIC87Hhx@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlC5OJZ8X2ZgUeFBc1UwCyUWzUWHl7vgFzv/FwFOkUR4px/ur
	7eOhl8pCwl2yAehvBm6WNSfi3/YGTEZ8YZR2IwHmfCigk5XAxZRN/bbvEZs9C1tk4HSQLjFMMfc
	+f3/gysdZI3D+TDS2L6xg67g6Lpk9TruHtllNawDMaYYYKlN+o613nnqV4SeGP650
X-Gm-Gg: Acq92OGdzcuxE3xeDddlz4tsge1XB9l1Lm4RDCABiWnd6iJutJa+Diq1VDalrAnXNr6
	OWQex4ZxO34gZf4zFl3ZTfqs2yVPjAMyFsQ4HWs1NXx4XlzEX+TWX9Jbrr46p/W/1nP7WToeH3f
	ZCs5XZ8d9Wrcta87jXXl/L6hZ5P469PHjmVeE6xZTOqoFiU7L4DkwyzBzA8Oq/w2UvOR10frCkv
	smpkCtXJwX9xpQmMpGUSNoRqkqhQkwbrTa7r58QXEV0DMRU3BKC0xTbjWctblBdDZCJPjTI+4sq
	6Vt1lYiLoXeXW+VrNNiOkqldb+nwfXaQ7CYeuAL7a9pe/GYuUG2PleE6pyUZdP5PT9E+IJ160L0
	V3Yy0e2reLyKkjxQOisqoQonpgjvUWKA2aZt99p4gbcXKD5TXz6eyPQrI500Ab5VgOtkgW/9LD/
	daZ6avCESCH9dIxMCTIZFSdGQw7wkW4xkVnAZVqwzJSA5egQ==
X-Received: by 2002:a67:e717:0:b0:639:3b08:d64c with SMTP id ada2fe7eead31-6c68cd85929mr1935443137.13.1780218585339;
        Sun, 31 May 2026 02:09:45 -0700 (PDT)
X-Received: by 2002:a67:e717:0:b0:639:3b08:d64c with SMTP id ada2fe7eead31-6c68cd85929mr1935437137.13.1780218584856;
        Sun, 31 May 2026 02:09:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5bdbd5d4sm1395643e87.72.2026.05.31.02.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:09:42 -0700 (PDT)
Date: Sun, 31 May 2026 12:09:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
Message-ID: <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDEwMCBTYWx0ZWRfX4XgtcqtOMXKS
 YBvo/qhApsHqzbdbZV63HL8b4TdcJJ7wdGNj7spv7qp4cpahl+8Lqwsd5BZbbDP4EPgEftye91M
 bE35NCFwI3Tb+kOZ0lNbLQHOYB9XHoSuiC8fs87bWiP0K2BHUaqBxuhdokWMfVO1gPDrEB/Zlha
 +JxkUpBy393z2JZilqVdJxvZW6Co6dKffRXOWhXiwYF06tutsM2ruRl6P9i5jCqCQkBouz9NzIM
 +eFVVG37AkQNS68aYJf/t124r3k1f5DSbaFmkrMoGCNAYDyyKyY/Ijn2ilNwEbaUqmi+9yPabjc
 xAr4g81ZNsbrPx9WU/MW/lZSbZ+YYv3Txeg6oA/UEmPbAqGTVxItI75o4CjHHzPwlOEzJue6ARF
 0K1JKy+AnFwrjsjZLrPRYQUUPKx4f8SP3SZVBcBXRVXdnBUb+KAlroa8vE1wEe0ZyldB6jGY4UP
 OJuAiONRhxKqMrOtq/Q==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1bfada cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6o1Pfrvaqi4n_z-QX6IA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: vnmWSL8YSOZZJKEK_XeS_O43-4ySd980
X-Proofpoint-GUID: vnmWSL8YSOZZJKEK_XeS_O43-4ySd980
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310100

On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> required:
> 
> - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
>   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
>   LDO regulators consumed by the wifi@0 node.
> 
> - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
>   management.

Instead of just providing a summary of the patch, write something
useful. What is GPIO54, how does it control the RF, why is it rfkill?

> 
> - wifi@0: describes the WCN6855 endpoint on the PCI tree.

Drop the useless parts. It's obvious from the patch. Try describing why,
not what (yes, AIs are bad at it).

> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> The Arduino VENTUNO Q board uses a QCNFA725B M.2 PCIe WLAN module

Is it just WLAN of WiFi/BT?

> connected to PCIe0. Two GPIOs are required for proper WLAN operation:
> 
> - GPIO56 (wlan_en): The WLAN module enable line
> - GPIO54 (rfkill): The RF kill line

This should have been a part of the commit message.

> 
> Testing:
> - WLAN module (QCNFA725B) successfully enumerated on PCIe after boot
> - WiFi scan detects available networks
> - rfkill block/unblock correctly toggles GPIO54

Drop.

> 
> Changes in v4:
> - Replace regulator-fixed + vddpe-3v3-supply with qcom,wcn6855-pmu for
>   GPIO56 (wlan_en) power sequencing
> - Fix module name QCNFA765 -> QCNFA725B
> - Link to v3: https://lore.kernel.org/all/20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com/
> 
> Changes in v3:
> - Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
> - Reference wlan_en from PCIe node via vddpe-3v3-supply
> - Fix subject prefix
> - Link to v2 (wrongly named v1): https://lore.kernel.org/all/20260501051918.1990713-1-qian.zhang@oss.qualcomm.com/
> 
> Changes in v2:
> - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
> - Improved commit message readability with bullet list format
> - Link to v1 (wrongly named v0): https://lore.kernel.org/all/20260425031712.3800662-1-qian.zhang@oss.qualcomm.com/
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..bd5b8a161e7f 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	rfkill-wlan {
> +		compatible = "rfkill-gpio";
> +		label = "wlan";
> +		radio-type = "wlan";
> +		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlrfkill_default_state>;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_state>;
> +
> +		wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;

No bt-enable-gpios?

> +
> +		vddio-supply    = <&vdc_3v3>;

Please explain in the commit message why 0.9V, 1.3V and 1.9V pins are
supplied by the 3.3V supply.

> +		vddaon-supply   = <&vdc_3v3>;
> +		vddpmu-supply   = <&vdc_3v3>;
> +		vddpmumx-supply = <&vdc_3v3>;
> +		vddpmucx-supply = <&vdc_3v3>;
> +		vddrfa0p95-supply  = <&vdc_3v3>;
> +		vddrfa1p3-supply   = <&vdc_3v3>;
> +		vddrfa1p9-supply   = <&vdc_3v3>;
> +		vddpcie1p3-supply  = <&vdc_3v3>;
> +		vddpcie1p9-supply  = <&vdc_3v3>;
> +

-- 
With best wishes
Dmitry
