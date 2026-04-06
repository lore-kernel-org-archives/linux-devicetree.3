Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC9D20C477
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 07:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461007; cv=none; b=VUzwqD7G+WKKmB6jzG+Lkm03QQfs4sb1o06SAwhLG9iT6RdjcziNv2x/R6sTSxxNFTLAOjwQ84j5KMLnaLfA+8BW7QCt8AqM23YT99SISwpW+KSws57io4nfGqTLQ+HHmzNHmwH+Z2vPxmXdnRjZOO5TLkhTxd0tkCaer2A3oiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461007; c=relaxed/simple;
	bh=A5j6e3cqOg7yNX4hMaA5bMWHJ0RiNTfPfPFuKO7Imko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALEz6nlmxyNvHSMChIRpd1U+HaQ4RCm9St226oXuchCbgkADZaCfFCmycs06TJ8yczqBqho5+XRsHZJorPGO7cWdhlUYoKf/9KwiTzUpHFuyrN6iEwyEc6b4FZmAIZdblLRn4YB1JqzNuEwZByKBFnBPG9/R7cvKSvqtu5Gx7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCy6Qgz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYa0TLu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCy6Qgz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYa0TLu/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635JaNR63450012
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 07:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=; b=bCy6Qgz1f4bT6KeV
	/3e+cNg3Ex/VZzvTHkZwmtrwr86SCLI70JbNkIkLzNQK3eAhBeBGvILLaNFblJu3
	IO9df7W8NiplnRi8JajqTEMjaTXsPXUPIPALPHw87stS3FPn1R75hK7snY/EJFk5
	n69r1nBKpAEwO8/WJ8fx5znQE1d71TmAzSIYmd/IO+Jkrvuu1zZu/n+6FBjLZIu7
	vO+ikPgKkONqVfdCABY6fFJ8Zsjbs+in3trmOl3fnsXuU+OMrrAYRE533Tg4MVjP
	O/qZ1bN0nOVT+b1w1jDdzcuLIeO2BP1xtbjcBUAWPbvUNa4lZWM0E0Hq8MfrtVZa
	BaShMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthc942-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 07:36:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so97361605ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775461004; x=1776065804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=;
        b=VYa0TLu/0y+bG5xbX7xVIshdqGDsAlTHhrSlzLvti5qn1GywC3O9+5bqQtBoTTUnBi
         nl84PrAlrHkn16Wmzs/cL1giOc76cPg69J6aOx9h0/Y6iqm1sRyZpTK9izY0kUjJ1KQX
         t5b9g/g0OYRL2T6ORla9hEMEK+pRTUNDXl8/yr9tohR/Clokj9UUbvw3fVLf8ou1Z8D+
         DyWQQn5edk1WPBc9T2yvr5oUe5P+rMFAnLUQMgZxAf+Yn7nehUU34EANUShYmr9us27H
         kIlA/IxG/APOji4rBP+wsYKImdfGXnruID8q6psRrZDoDVL2O6afBBXlUtkXiuuDGYGa
         1vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461004; x=1776065804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=;
        b=JCBLwOWE77mTmG9++MkViB46boSndIaZURjwjR85x6DQJ7vzVU+3Wr8hFq5YyVKLXc
         pSmAY1b/YtXSsxCn/6cXlE5AuDHiEVHrl5YLyL7+2gW25Fhma7GdDoxFWIgd0ZL/RNgJ
         MBBlXZnWW1+HT0DO/aeGXB3kxZ74zeLQEJEBcjls5thkm5MlbgV2eCJqTqTmRumMQgIm
         C2GiqYIIBo6T9ZqwGVmOhk7dXdPjNcHVCBjcuoTtx4Lbzs86cUwUJg5XqEQdlqmulilV
         bfEUeQI6p6iJWWRXOGOXD8qcQoQQ8Ezsg6lCs0tzMUI/oJWth2jcIJLGFVBsUmMhnvxB
         LTlw==
X-Forwarded-Encrypted: i=1; AJvYcCWjmZ6rXHg5+EKiI2PBdSf3/dX1DuHd8Rv7Gjx0zT920W7h1s7oKnYltOaU/FaIjU7rMtUqf9CdCEH8@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjHX+D6eLGz6z6Y/8PYqJ7pIJ6EFvknoTsPeQ5r5U9VpNjFVc
	ks9ncPRjNLTokK6s7u/RI36H5BoETQt0XOFPnC5DKDsrqQ+dPW62b4bKRqFjOMKksdBozhJD3i6
	lX7B9hreX3LxWwdLd0rczBBZAFUa/6+fVc6yuboAoXCRbpU4eo3X73gBAssYNQbyL
X-Gm-Gg: AeBDieuITg3wWsZ7eKMtyVP47DNjO2qJ5F1oU+A/3OBlmAc+H6jV+QF2YmnJGZmRct7
	fwF1d2o9OeIzW7PT027T74GNwL8jBNzBBIsnxMF7i+5kEQ15IGF3yuZj70B26nvieNYnRyJCR62
	nVHLe7zAFcn0iBwTRhhXJsYxSrld/sjjQAfKPRgiYrc+76qUqU76JDzpsKyDxVnzPEO46TG3GrA
	ANoRXDrHWFqbv/3iyHevIk7R+bwfqJw60x7ZYHmfIftq3zmsRQiobDxzS7d2fwosXsLJ1PSHoRb
	tYQW60NPHRdTWaSKSkzuyi+g8IEi2jc0Y8Groa8axdK73IYa3bg1CkggtesDeluRSbCKuX8/jAN
	KoTnwguzNuUfiSoCNN/kAfGho0hZuEYoz3TIRZTTEwmqgtZENYCLL0OBV3h6bAR+fjNlWkziCRl
	gN9p/uUMQDOLs+Cc0zz+MgLcevAw==
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr10698404a91.28.1775461004599;
        Mon, 06 Apr 2026 00:36:44 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr10698388a91.28.1775461004071;
        Mon, 06 Apr 2026 00:36:44 -0700 (PDT)
Received: from [10.50.10.255] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35ddb973ffasm11678053a91.2.2026.04.06.00.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 00:36:43 -0700 (PDT)
Message-ID: <c8fbb242-c1df-4db5-8fda-705e9df4a894@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 13:06:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA3MiBTYWx0ZWRfX9u0VPQmxTuQu
 bCNNoi0Hzkp7RQecxryp2vsJOCN/ati/tLJh5RY66/+4kKQ0mYK4TxHaNUSjeWkDyaHBiG0q2AE
 LWd6Ksu9kKJrJy7m4vvNPQaFnHj3XKCAsZIEbyW8OMjMj2nwfkNHauZynSGrw1qEDgJePPyVM5M
 96tl7ho5/QvHCfj8Zui/bgRhfHOG7XZ/np+4MDv/GAloF908fAzpMyfNyEKqJMu2HfVM0Lh3p60
 6WdzcEki1sjdDQUIlUUmgMTwCQkFBbeZtj+lqD2JP+7MxpGkPpqVrIqOHd83/WI9SUY4/2d9VwL
 ueb/cG6/3NTkKbDJ4cRg/1gNCRl70nPAkgjd8RU2paKi7MaKCwIWam7Faf+xy6FZ007vKdrmOii
 stPv1IfS07Df3Ej3agNGCBjeeDD+6o8RT/zPyy7N85LlCZJnCMTpuZLqa93gBE0sqJPTaJffQ20
 QcNYhE0bgBntmvszM+Q==
X-Proofpoint-GUID: H9qorGRx1uGNqE7ZU3MsBBDs9RpLmtE0
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d3628d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RXLY-4Gv9SH2gAdi2bgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: H9qorGRx1uGNqE7ZU3MsBBDs9RpLmtE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060072

On 3/4/2026 11:33 PM, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that registers with
> reboot-mode framework to provide this functionality.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
> arguments (reset_type and cookie) by encoding them into a single 64-bit
> magic value.
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
> 
> With these enhancements, the patch series enables:
>  - Warm reset and cold reset as predefined reboot modes.
>  - Vendor-specific resets exposed as tunables, configurable via the
>    SoC-specific device tree.
> 
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
> 
> Currently three drivers register with reboot-mode framework -
> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
> list of commands currently added across various vendor DTs:
>  mode-loader
>  mode-normal
>  mode-bootloader
>  mode-charge
>  mode-fastboot
>  mode-reboot-ab-update
>  mode-recovery
>  mode-rescue
>  mode-shutdown-thermal
>  mode-shutdown-thermal-battery
> 
> On gs101 we also pass kernel-generated modes from kernel_restart()
> or panic(), specifically DM verity's 'dm-verity device corrupted':
> 	mode-dm-verity-device-corrupted = <0x50>;
> 
> - thanks Andre' for providing this.
> 
> Detailed list of commands being used by syscon-reboot-mode:
>     arm64/boot/dts/exynos/exynosautov9.dtsi:
> 	mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
> 	mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
> 	mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
> 
>     arm64/boot/dts/exynos/google/gs101.dtsi:
>     	mode-bootloader = <0xfc>;
>     	mode-charge = <0x0a>;
>     	mode-fastboot = <0xfa>;
>     	mode-reboot-ab-update = <0x52>;
>     	mode-recovery = <0xff>;
>     	mode-rescue = <0xf9>;
>     	mode-shutdown-thermal = <0x51>;
>     	mode-shutdown-thermal-battery = <0x51>;
> 
>     arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>     	mode-normal = <0x77665501>;
>     	mode-bootloader = <0x77665500>;
>     	mode-recovery = <0x77665502>;
> 
>     arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>     	mode-normal = <0x77665501>;
>     	mode-bootloader = <0x77665500>;
>     	mode-recovery = <0x77665502>;
> 
>     arm64/boot/dts/rockchip/px30.dtsi:
>     	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>     	mode-fastboot = <BOOT_FASTBOOT>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-recovery = <BOOT_RECOVERY>;
> 
>     arm64/boot/dts/rockchip/rk3308.dtsi:
>     	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-recovery = <BOOT_RECOVERY>;
>     	mode-fastboot = <BOOT_FASTBOOT>;
> 
>     arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
> 			mode-recovery = <BOOT_RECOVERY>;
> 			mode-bootloader = <BOOT_FASTBOOT>;
> 
> Detailed list of commands being used by nvmem-reboot-mode:
>     arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
> 			mode-recovery = <0x01>;
> 			mode-bootloader = <0x02>;
> 
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
> 
> @Florian/@Kathiravan, Please note that reset_type in DT needs to be
> full in itself with 31st bit set. (eg: 0x80000000).
> 
> PS: As advised from Lorenzo, "PSCI maintainers should be added as
> maintainers for psci-reboot-mode".
> 
> Previous discussions around SYSTEM_RESET2:
> - https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
> - https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 

Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

