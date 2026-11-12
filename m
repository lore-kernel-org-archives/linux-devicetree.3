Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458190;
	b=bmCSNjmOSoQ2d6Ig+STsl3zp+O7uA6kaq0PnTnnIFYz3HCp+YZ+6dPi7yRMb80HvIEDF
	 KTdBZGLetCNdzTkCMSFKzr9+SSSsEaEbhgVWLq3/vKk30MzvVq6Jgb0bsC5dhdS8U8BUd
	 e/GM6tZ+JOk4JBAoqbduUplKwAPVjSIAmXy8ZDFslVlUO50XGtL1a+/L1Dx8ErgiUv1rQ
	 f+GzO7TL7SuD9A2K4cuNiyaWwGSPch+WgSwoLvlVCUEMh5kcVz5THDyQ4Vek0CbLzKHiP
	 s7DPcLKg2npGjh8Sgo0+Cxl5TlhcZkMuMCgXceltiADGHDYEp9QnVNAfXZBhdgILRcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
	b=F0AoXPhiODbyEnfHpkFqBiWHUNMxTC6rt5YCbxibKqe3DIhWKAyTlG9nhO12ht3dPXQX
	 6RQiauYgyR7X4VKsqdr5oUuZ8wpRwcgWNk3afcWy2LdOQYAxZ5OiBaZwOy9PooIO45PaX
	 HRijcdBMWovPxYfPgmF2kxe0LidMSdnLjdmFjxNxDMXJRLl4woVhg8lJ9xHWvcsctWMq6
	 6RaknqcJK2o+mpD+8MMvKRHlKvT7CVBGfRGJEa4gFHcrwIOn9YqCIUqoqwHj8Ge/eseai
	 t9T3v/J8zq8gDPHexyAd70LGzPCqZ5mn9lqT/XH85KoG5NU9DCHS4ctiFvyOeb6LsyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns+d5HWL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P74aSqQc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5CC606A333
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5CC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns+d5HWL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P74aSqQc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zw5O904507
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lyC5qj4Ry53YUg++hgJJ/B
	hVmj+JSw6oRJbx5/GvGnQ=; b=ns+d5HWLXtp1kuxb4QbwAYmVXKAzLeXlKBB2Cd
	b49/K3RSx2v2/RodiYVAfrXSS5fXrncu+KnUNVpy94fsKw9UGqyWD2qrbYXWueXX
	u/5ImCYAXWZe70Izjd+LpOSpvpjdhL9FZCBsmqF7HplxtL1jWJpVMqLjcdwch4a9
	wX0x8MpkU9wFhkJmxM2tY2vETOWVSTlxF2jceZoM2cgN5fEGXuoYDk1s6ED5tfaI
	aqdCKSuKPSQD7CP1xAtxOgl4nU43yMpcgIs1oo/DuV8ttoYq5RpT5P6W9YauplAB
	st851Be2ck+T8YyCBNx16VlH05XBqcrYEux1NDONIwvPyB2Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uay6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so327073eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458188; x=1795062988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
        b=P74aSqQcJcrIy/etpHrTn1Pez41gErW7sTU/PjXFz/GUIS9WIKgY/UW7ezvge32nwi
         O4Hxz1SkSP5fjYQsnEWNyVFMQMwepDl7hfDvi0teSmeRiovSB2wtCm8AOEFJSEYvf0rH
         uxBIRXRD/0F3ZtssWtknzwjibEGz9pbl9Zf9hCB1bACU9T9fDzlNDOgR+VKm/RUnztX4
         vIdqLzxvOhhtPEexadRTDWo1CKEiddZ/GCsEdV/uDGiwlYVP9Xnc/k2rMNydGZJ8JuUI
         lNYWToZFoi+mQV5vg8LO+APmKeFl0lAEe4meMds/ax2IrNMkk3wGtABsuzUQM7VeyKgc
         kaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458188; x=1795062988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
        b=e6Q2MRHCTv6tSuaRudgZ4nsE2fjbStAFJAzAeWl9icpkyn61B+MWkFIVzpwSW549z7
         wBDMbf80JJljXEtO8i52J+FBiNr0SOf0FC3CarUuyLNHOwkYMBTVsR2YxrQfWjQ96h+5
         660Mnk+vQ4il5jUNMA0+hcCVue+tal7VOxhJe2mVKRQr/WLFn6olGQjSf0ZVzwYf3ZLJ
         xfg+ZmEndiWVH+9rhWOLWreOxNXDfEo4zN3Bv4riow648Gz06TpISwjELlbzYBIFzTV6
         QH2XJO/wWRNFY4MpkHr4Zn2db8nTPNHQu1uHsQEDN9eLmGDhoMZWUgPKcrkKADSoWUHm
         7qug==
X-Forwarded-Encrypted: i=1; AL+hErH574RBa4fDcKBhkGCR78FNvPPa23PemtTzU0al0rHRy5fgKocMdv8u2KyhzMDgnTpF8h5siMkw+iye@vger.kernel.org
X-Gm-Message-State: APuU4Z+i/k3LmdOR39oybmZYLY0UNzAvXuLneFc/55fKQuLHXg7UaB7f
	6w4H13IRqGJhrfOlgoVyVVWbEKvoJPbqwlW0++yLZarI52UAeCz8d/8BMAhhsFfRFpau+kXnOj+
	Xjr/5NAUtw/izN5YwBSxIsu58ZQ2s3eFl2hcfAvRy/e71rvcQNcLXqXmkFoXtmsie
X-Gm-Gg: AYBFou12rg/vlJDo1hwoqdknFwtmUXI25ypiDUJCQ0JFbsulXXeNgfP+bWCx7+Q4kJD
	MO2IONYn8UXi9+KbRCHVqNaTNBRmLko0AQCwsVt+z/Z3Gb6pZw4i+OJrjEf9+Ar7nwz+FAcVww8
	3m8CuN+Xqd/Uqcqh7QJClkUpmfodcWTB3BZtyipMlrWGT4z1dpKitAKhLnJ8sCh7pmJZHqx3OUZ
	zLva4/s8VU4hOZZO71LEHoiHdZJlYlh/UEfA6CebCbyCk1gCMqOPv7HcFL0bN4OntYoD+r6aNRf
	GC+1pIUJVeUBW6WXulJVfQFWiXGqwdeDVmJbL+U3pmwIafJ571jgk7EuM6LUu9gBh1MqdXqpYbh
	G0FvSlxfrQGANQ2MWAHLOhrGNbJaWMb1pmo7zDlp/3R6Vvvz+cCfaRojPbA/0Xrk6Ydzq8aMsto
	meFt0esHfojZkudyUzvkWxgRNwmvdhM6hclVCKMgctcDJFQExL+lAZyXct/HW1LDaSySUGWjG+R
	MWkVH8=
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr1291787eec.3.1794458187953;
        Wed, 11 Nov 2026 20:36:27 -0800 (PST)
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr1291758eec.3.1794458187208;
        Wed, 11 Nov 2026 20:36:27 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:26 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 00/11] Enable mutliple peripherals in IPQ5210
Date: Thu, 12 Nov 2026 10:06:19 +0530
Message-Id: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENC9WoC/42T226bQBCGX8XiuoNm9oxVVX2PKBd7IqGOoWEJj
 R353buQBiPVSL4AdoHv25n94aNIsW9iKva7j6KPY5Oars2T6tuu8M+2fYrQhDwvGDKFGhWggTA
 kiIajc0x7zVyRX/7dx7p5n0UPj5/zPr6+Zd/webNwNkXw3fHYDPtdG98HmJxEhBN/jCnZebX97
 vv8AIlD4z2MDBCoUo5RFZn09LNLqXx9sy+TrMynHzcFqEiikYxMSYIRFxoIRtvbkI9fti3bfD3
 Z1rZ3Cglz7337BCNlkzZSGrTGCVPfKyCUVIlcWak140IBg0N/PqXz0NXloTu/dH/Sobm7HEZ5g
 +K0QQQ81NbUXHAf3Q3BFMlzk4auP81RjzRn8i9V/ZVq7gyh9tGwSMIHCv+pZtPIVjTJhZ6Scqj
 QKRORSbVB8xXN+ELnEaAW0RGnmhu2QYs1LRY6j0DJqMhSTr7GDVpe6WrVd+4BpBFRWifRiS1aL
 fT8MXzRatq1yovojVIimA1ar2hiC52rAK1d4EGZYOTW2uZK0/U/HHMVECoSSJWUyKsb9OVy+Qu
 AkZhK6AMAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX7J2EjL2+kCpd
 9GF4V0UkyZ/k1Xc93ZS4r/fWBxg0kFrJ+90sTRQp8jpyv2hHGcd/ppzXHqb01EZA8Z7LB76RQxQ
 eIO994LtcPJFktQ+gBMZipWLUesikLg=
X-Proofpoint-GUID: aeasaj6fAuuJWf0z5zGFnGwrR82-RCXr
X-Proofpoint-ORIG-GUID: aeasaj6fAuuJWf0z5zGFnGwrR82-RCXr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXwMPLKj7n4gzS
 IUGKVAtfUQI2iGezZO1Ea9mQudV98Hs3y41WKImBp7uOfdNBrV5wBwuX/ZELXFuMjOBY1AnNkfE
 EwauICh3lAoO+sMOahaC9FeD/ffoo6uScSbJ+09BwwLomswb4fKoo7EHa3jEENETJMD4C/6AAyg
 tYecDp1laiAt5DVPs7ppdGiY5BckZL+IIJTzgvqPsTBjF+mWDzMkuVdTNaeIE7F7E2X7gPg2Y9O
 9jy7NjGlII3A1QfHEJP42+II18rkQu4BRvKFoSWb+oh+0t3aZICoHBcPVNPUywRV3x+f8hpU44/
 Wur453NzXIDHh7w5dLkoqgpZgba0C+rW20jVoY86k0qhyuFYRseBTygWvB4eOqlXQH3omDRcMz/
 OQ+FFZV+RtJa+gfMQOTQ3GXL/pcm4JEQ9zKaJfYPV+VhBiNp+zdWo2dGn85JCRlLMYbqcntgtSm
 wRbMXRjGJtYTbqw7FnA==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af5424c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RaWcFzTeoJQvQ5yBV20A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

This set of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v9:
- Rebase to next-20261110 and include merged changes from [1]
- Add qcom,ice = <&sdhc_ice>; to mmc@7804000 node
- Add qcom,ipq5210-inline-crypto-engine change to dependencies to avoid
  dtb validation failure from sashiko
- Link to v8: https://lore.kernel.org/r/20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com
  1 - https://lore.kernel.org/all/20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com/

Changes in v8:
- Fix pcie0 & pcie1 nodes' ranges property
- s/wps/WPS/
- s/cpu-sleep-c3/cpu-sleep-0/
- Moved ICE out from sdhci to a separate node
- Keep pwm@1941010 enabled
- Combine i2c pin defines into one node
- Add opp tables fro spi and i2c
- Pick R-b
- Link to v7: https://lore.kernel.org/r/20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com

Changes in v7:
- In 'Add nodes for multiple peripherals' patch (it has R-B Konrad)
	* Reduce critical temperature by about five degrees per recent
	  calibration updates
	* Fix placement of 'efuse@a4000' node
- Move 'spi-{rx,tx}-bus-width = 4' to rdp504-common.dtsi instead of
  rdp504-nand.dts
- Change 'reg' details in spi@1a80000 from 32 to 64 bit
- Add #address-cells = <1>; and #size-cells = <0>; to spi0 & spi1 nodes
- Fix incorrect placement of rng@4c3000 node
- Link to v6: https://lore.kernel.org/r/20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com

Changes in v6:
- Didn't touch the existing patch as it has R-b
- Add DT changes to enable more devices. Not sure if these can be squashed
  into a single patch. Please let me know, will squash if that is
  preferrable. Following were added
	Random number generator
	SPI node definitions
	I2C definitions
	PWM block
	Download mode support
	ICE support for sdhci
	C3 CPU idle state
	Support for WPS button
- New compatibles used are documented in
	https://lore.kernel.org/linux-arm-msm/20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com/
	https://lore.kernel.org/linux-arm-msm/20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com/
- Link to v5: https://lore.kernel.org/r/20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com

Changes in v5:
- Pick one R-b Konrad
- Do not remove ipq5210-rdp504.dtb from arch/arm64/boot/dts/qcom/Makefile
  and add it in a subsequent patch. Instead, move the ipq5210-rdp504.dts
  nodes to ipq5210-rdp504.dtb-common.dtsi and include common dtsi in rdp504
  dts file and introduce rdp504-nand dts in the 3rd patch
- No code changes
- Link to v4: https://lore.kernel.org/r/20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com

Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (11):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file
      arm64: dts: qcom: ipq5210: Add support for WPS button
      arm64: dts: qcom: ipq5210: Add C3 CPU idle state
      arm64: dts: qcom: ipq5210: Add ICE support to SDHCI
      arm64: dts: qcom: ipq5210: Enable download mode support
      arm64: dts: qcom: ipq5210: Enable the PWM block
      arm64: dts: qcom: ipq5210: Add I2C nodes
      arm64: dts: qcom: ipq5210: Add SPI node definitions
      arm64: dts: qcom: ipq5210: Add random number generator node

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 276 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  77 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 752 ++++++++++++++++++++-
 5 files changed, 1043 insertions(+), 81 deletions(-)
---
base-commit: 827b0a511f329ad072f0f689407b3595a104cdf1
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
prerequisite-patch-id: 08aa18faecd4f3588cfd01f3330eadb1a76dcd13
prerequisite-message-id: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
prerequisite-patch-id: 72e661bc72d8535e1dabc144e81978bc5161c3f5
prerequisite-message-id: <20261021-ice-v2-1-3dfa8f343ceb@oss.qualcomm.com>
prerequisite-patch-id: e6cdcf2043620e898c6dc3a5c266678a2b08137b

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

