Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545921E9919
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 00:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988438; cv=none; b=H4AkqzpB0idSdPzZSQt3tyGIN1GqR+bbN22DzjvTuObH9t3n2rktIgov2Ra0b/Az6VHzENTjBqla1UCj71FhttAJWsD1jda77iryzNV+uHKid7sWV9TR4MB4sVxj4PegDTeaAvEwKgzg9cDmiWjNTYMtMcVYfazsDkjmYmOIx3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988438; c=relaxed/simple;
	bh=yTZUC6jKZaCOtbJ/3nZWWXEu0NQbc2ytDJaD5GmrxC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhAT3XMyOYNWyhz6WEfh3iDJcOkvlMCWSw60pSN7MOX9XEAawDh5V3jjIBnbzNm8woI7YpAWF4J6KDHW1eDnazf+3LYWq9PRWHNuUwAgEDDnK7PoGOGvqyTV0k/Qc+mmM2z6Ljrh8Ve3wpDAFKKR/lQTYq48vpobk3mihftATMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVAl5iG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xcgl+DSv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVAl5iG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xcgl+DSv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nf3aB2503360
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 00:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+oeytl8ILE2lGP9tC08C8X3AyaLqZaWEZaYxX5SV4c=; b=MVAl5iG8Lo15jt5m
	aeO2/4y4NEt2oIlneY7iMQe6SPm7IIkm4YUip77RwFIkhAgq1b3DC7UVkazVlyWS
	409t6yFoHgIwQ8qaeBQKPURlGKJj8ZmU9TlgPjuq8Y+o8dRmh781mTMtT/9zRukg
	aqejn/IrWOxKbonrlb424CnFjj+1i4hhgGOkMxu6XXX/ZJQWH4j9p05yrR+iJOQx
	uKMlBYqVpHDoi5ZFbrGkrUlQ1gLyxAmnyUrxPeRT8xmJSu6rBufePqJzZycbBRy3
	GZhkIc1A5q15OAAPUwl2nKBBAQ8lssJAibEHtkVwisgzX+ADk+xfVTXyW6rWqURf
	3+SbBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8st5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 00:46:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc40759b2so14022485a.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988419; x=1791593219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+oeytl8ILE2lGP9tC08C8X3AyaLqZaWEZaYxX5SV4c=;
        b=Xcgl+DSvnatLxMgCFHg5oWD+xMtlBHD4ItvEeNSLDL6CRitQHzbcnjl6fPAXwvN/7i
         Za/U2YSKGFlJhwBGfmKPJYUka8/vCfvUaOkXp23MFGGw7/5MqyeRBuPdzPKC/TcGlMAe
         D9hCltriu8mwCvlPTRdIokuLNM5NK6tlqU+3G01D02QK7MZdTojeTBlFrAxqpAyils0z
         SgEEqyIJxQqQMqtji9DctLUKW96U8ycITMYT1Z3D/nd0nzi01MzSbR7NVUfF7IQkalrz
         TC7VwFgbYGy9ld2pYg2Y32en3YdzxpuQe9G5rzyymzWrE7SUy0cH1IT9BR0Nh5ajs1UX
         OVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988419; x=1791593219;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+oeytl8ILE2lGP9tC08C8X3AyaLqZaWEZaYxX5SV4c=;
        b=r7w54rxBOb/VZXCP3P24PgweaXsPkkdU32XK6Terpz634yWJqfBcBj8suPpytn29Yv
         Yhdc6oc6PdMeLKlD/cKdoj2aiEL6ZcZbNEubijasFJRe/AeDsCdsFpdfW0eyoeUXpUbh
         wPUrGiqUp5SOX35hQlzIVCFScr2XeF1lWIXL/uvoNBnjGBjkq+lzs36x4s1QeZhlisKs
         iz4Ms+ZWfJI8Sqcj2FPqcpSDdiATOzXo5KAB+FnDJ9dQGWRnEaZoJ1H2VSxlIk+lHukn
         fllEeD3lX0OX1w2MO13N90mL6BA64qdHh+u+95PKvf1sUNCfd5VKErPmqlqamCBelxH0
         i7Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwfkbi8kvUe+f2rMuMBHhE1TCU6IHZ+1/eFy9RfKwRIj8kxvXQRIOSadFHvy0e9rEwVc8NG8ieGv+wq@vger.kernel.org
X-Gm-Message-State: AFuF++mcmXe4+6zrCi3odIhyStjV8dHzgWOIo7JeAefSQFbwLPoqi5jl
	TR/IcuEj/MViVZCxv0+UEOWzov7tT1C0jL9cZk7VelZ0riDA7A8pSvv75LPL+dNDhNQh7Bir03R
	ym25bQMcILDSVq6tt0LV0kpa+cA32Lf7VfYd/ZUC/PsphOpJiiNeEpkbBLLAI4KiZ
X-Gm-Gg: AYBFou1T4xbpTur0OB3szNvT30orKxyQFnNTOkBXKCRn8x5iN0pUAzmbDi+gbw1KLld
	qtuKNx5/DqeruKoSl9LaXwAy0HkPduLKMDCVE6Xr7+wMsYxaAnhl/0WSgZqDnRSbKcrY/d1dH2w
	z6Hsfodi5PjMRz9Qtaqu0MjH/AjmxXUDkDu4CZ8x4wmlTtN0RyYHHc0XM4lQrP4rUjcdNpr/JRk
	mSeke49Kp3A6ryCdJS3XYe+RoOzUcTJ05xSnyeh80XevF3l0xrSdOQsjRi0beiMCrUNLRT0lqJS
	/CMVEvr+ulZOflmln3QomKmyy4OYuYGgjwbUzhJkrEHAVlR6P5YryXJXE7BY1++kXnSEJtTjcoR
	jmv2CnmFaPO0CGKCpthG6mTPNbae9bmTRSSQ0w8YV8EFMiGgAd0FVylLkcWSmx4XeO9NwNN+BLV
	S+gc/mJGiLXptG
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr819174985a.65.1790988419235;
        Fri, 02 Oct 2026 17:46:59 -0700 (PDT)
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr819168185a.65.1790988418537;
        Fri, 02 Oct 2026 17:46:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/19] Add Initial Support For MSM8952, Add General Mobile Shamrock
Date: Sat,  3 Oct 2026 03:46:52 +0300
Message-ID: <179098834078.3641559.798772743228949994.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: piZerDDZgJkdTjE7oWxlmOm9MSoYl52u
X-Proofpoint-GUID: piZerDDZgJkdTjE7oWxlmOm9MSoYl52u
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6ac05084 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=sFPzMUYdAbi3-6yuofgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX+11fHuuQUfHp
 4jG9W7MvICEchMRBW1+yCSaKmrut9c0/5DTy9NYnfIso2Iutojlb49yShDi854Qm52K7FiVHmNG
 J3iJyo5ELsbBOTGZ0z+HZCpn4Sg03cM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXyHfcMP4AF9RQ
 0tUenJru7QF4d+Hm/vfAifs4HxZmiaFP0LnFE2KFCjf6N6vO+Io0/WY8tq3PgULJhutOnKGNSd4
 uGuZW8lgDXh2V5AjAV1Zh6KS0Q7hZNMJm7IYdn5B9eQS7fKgm+jiclMScnuFxDF8PL3ZU+5acG6
 CE7EDjKrR2Oi7fnmyG7WVx3P90HtLn3OfXGsc9kZ56ZFL34xLqaOvonByUHRAx6GOVHNPoFdLyA
 hwVHhUEThWBWCgWudYWW79xoRrZuv1gDWnu2GmJ+yBL5wGafUAr/bd6ZATwXMppbfpT9V4xrerB
 hpUzZCfNmLgiGPKfjTm2SnE5CtGp12Avft2SfZ64qaV3YzwVR/ICRtv9ldiF8mkyaoy8/inGbWT
 f3NDfUSCUFIRYFQQtK0lwgHRNGreQugif2uVZszDJ6ICYFdomOX7lVuDNSSxY7wGbxYIU7Zth5S
 Rc/dGCJ6bx+VJwWkvtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Mon, 21 Sep 2026 21:18:51 +0300, Muzaffer Kadir wrote:
> MSM8952 is a SoC with 8 core cpu and Adreno 405 gpu.
> 
> Ported without uart connection. ramoops and usb
> mainly used to debug.
> USB is not enabled in this series because it
> depends on the not yet upstreamed (and not developed by me)
> pmi8950_smbcharger.
> 
> [...]

Applied to ttt, thanks!

[01/19] dt-bindings: clock: qcom: Add MSM8952 global clock controller
        (no commit info)
[02/19] clk: qcom: Add global clock controller driver for MSM8952
        (no commit info)
[03/19] dt-bindings: nvmem: Add compatible for MSM8952
        (no commit info)
[04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
        (no commit info)
[05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
        (no commit info)
[06/19] dt-bindings: vendor-prefixes: Add General Mobile
        (no commit info)
[07/19] dt-bindings: arm: qcom: Document MSM8952 SoC binding
        (no commit info)
[08/19] dt-bindings: iommu: qcom,iommu: Add MSM8952 IOMMU to SMMUv2 compatibles
        (no commit info)
[09/19] dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8952
        (no commit info)
[10/19] dt-bindings: display/msm: qcom, mdp5: Add MSM8952 compatible
        https://gitlab.freedesktop.org/lumag/msm/-/commit/df6ce9e6447e
[11/19] dt-bindings: firmware: qcom,scm: Document MSM8952 SCM
        (no commit info)
[12/19] dt-bindings: clock: qcom,rpmcc: Add MSM8952 compatible
        (no commit info)
[13/19] drm: msm: mdp5: Add MDP5 configuration for MSM8952
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7af226f9aa59
[14/19] soc: qcom: ubwc: Add UBWC config for MSM8952
        (no commit info)
[15/19] dt-bindings: thermal: tsens: Add MSM8952
        (no commit info)
[16/19] thermal: qcom: tsens: Add support for MSM8952 tsens
        (no commit info)
[17/19] arm64: dts: qcom: Add initial support for MSM8952
        (no commit info)
[18/19] dt-bindings: input: touchscreen: goodix: Add binding for GT970
        (no commit info)
[19/19] arm64: dts: qcom: generalmobile-shamrock: new device
        (no commit info)

Best regards,
-- 
With best wishes
Dmitry


