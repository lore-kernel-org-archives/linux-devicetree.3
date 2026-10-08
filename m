Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28E47DD66
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450877; cv=none; b=U9kamaQ+uAdJUdLFHbUfoxRUKBf2W6dq9E3YesFEsXrqy50HCogmZGyovII/YXBp3El/4FhjLvx6HgJUhD9RBCV7KlQZF1QqCQm2algwMnLP6A6fge+f2t1+XA4pJcsChsCeR4ItUVatmZiX9hE0I+zzwJc5Gbu6swhQBw1V6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450877; c=relaxed/simple;
	bh=wU23XgnnOZb8CjlibsrxqIgiv9aXkOuab8OboPS/yNI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=upy0VKQRB08yD0AjC4npGJpYX8RIWZ18rSTu4COe4S5a4wFkkBs2fP03g4tdwrGXnydHp2QC5Kx8iCJqLobNkO2C57nRjxC+0WMsUxiraF/fI0NlcofbdxGHqFa9KjYoyHPw3Rea5qWCkdqt3mNdjCay1HmtdYCDRsiwS7WDFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ip80DPrs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jx3o0SL+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ip80DPrs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jx3o0SL+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K1S71341626
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tVFIcKre/d0NZ3JFD/dsmn
	0M3vg9xAkhUUyeMqJYOgA=; b=ip80DPrsm0o/WHZgOO+VKF/hvKPj3hHBabtSq3
	hyWAuNhnBlZ3yoX6cf8UYrfu3CtUWajl/UqbeRHZ581fSz5Si/W1/dl9pXeroy7g
	0csX9DQOT5ULmuMHJGvzhAb8aJHcpDUA17VKSWdH2/DGqspCABBCrPrpspGLReRF
	RMoaUIivaLKNYoipd+BsdPVi21ZydQ6Im20A0ahhY0PifmqjlOtcU6uRoEUB22NB
	8picwEG/oL1tknRJCXvACi9kN0CVlwcS/18M4CQsrY6GxoEHhn3tIE6Rc3Jeucpz
	0KbbAcLTjBgmWBUHAl/aaSBLoTVKX1i+c4ZKWM8a/lpugXXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t483-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:14:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so9740396eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450873; x=1792055673; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tVFIcKre/d0NZ3JFD/dsmn0M3vg9xAkhUUyeMqJYOgA=;
        b=jx3o0SL+cRLr2BvVXcKst/5h1VxcO8bMy/NLz1l2sw+9ZAYkYme74BH9LWpx+6snLn
         zQu9kbbnMlSw7lmKYV3h+IpkDO8JYlGLzax2iEEn8mAcnelPQk+leRj+ZIk2avswqOzY
         hrQ6d6a0+mPoCQpKcHws/k/I0GDnXSQ3mZvx5YvAP7QqCRkwRLUuuHWXJ5bZEHi4NqlZ
         ivy7i054Ddp+X16x3KADSDU92rvH8HS/hHdRW/pLau5o7sABiL/xZJPXZ/+iWw/9xku5
         X3Q/h4ZaBCG8LXzYuCGvnukFICzb8cztE6hTaFwLuTW0/DE7XqmQtq5bUhJFBrfhN1SW
         w4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450873; x=1792055673;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tVFIcKre/d0NZ3JFD/dsmn0M3vg9xAkhUUyeMqJYOgA=;
        b=HL9xUmdo63vKF/vgI2d2SHwn9qoUOcWHwSfsWpQXZuXHlivDWcywl3OBxrEupYtxuW
         yDP3T8pEBsHCZ7fyGA65Mt+wpLwSvnJ9qbjJNOvgWieb0J06Mwo0zVNQve9l8wJ3OPY2
         Gn9NIrpaBjYGnZ5FaRtXeRs6jV4dvzagnj+R+uIOJwqVkErvjChSKsYddi1e3bDudCmH
         W+sj0nX+kF+D0RXvhic4enPjQK9fN4d9OwK3VghvtzDjZ7JbJlFmMsYs5HqWLZZPxVBR
         BxMG8CP01ecbyQAW7W+5iNwcGJojIHjK4pIURDsJrx6s2PvSvkOyxPt+R8FWTzyQJzUd
         1JfA==
X-Forwarded-Encrypted: i=1; AKwUvBy720j//yynNYnjQCbykUPFS7iD9jEXCwYfpKDzdUiuVFCgAfCvWRWyNd1D5KsOpeLLISoBC0ci7PN8@vger.kernel.org
X-Gm-Message-State: AFuF++n7nTcIiywe9FooTsIxHEsCMaQy+pIzLz/chEzGODkefoHsa0vU
	OE2a+NbXLCLhPv7A6fzsgBaFImXXYP69fOrwr5OHzIjNVxC5X3HCcZiiXfFfkJytqNBbzNQf2sq
	JhkIi2ttVwJgb7/dr7tHc2dkY209jh2FBXG/1g818A0ItyjVxTJdBcl4jnHmDMs13
X-Gm-Gg: AYBFou2u3rD4pcSMh9gTsawh4bddQ8ai1WYv9tazd1UfTKKmGhtiLFaIpc3y+2QWASr
	4l6QQs/SwJJCFd3RgGbDAwFSbe6tFb/FXw6+gSJBhM4CpEYEqtRpfxRftyaNUenbhM1d6IjrqXM
	QgMzmRd/c3AulGjhcR/CYE+/vN7HyIGEMCjRaISkIcYtL3JeSVctjFhpaNUaeT10NV/KUvbTY3P
	OA85UFoeOE0+RklbJvOv1e4pQ2AWqI/AXAYakfc2vZgDcdWfzjEFZ+eHEzr0eCosIHc2fsrN+85
	h7/aHOBC5J0QNIidD6FmcpXvjM02vQ/SxihONOSZrCmULKcxukoDi03GTscnt/mFE85ZVrD7/dL
	EFSPe1NF5wLzqRv/sBZEwQ5rCw0tNBmpjU6JHXRxfuGj2Qpx8Bxh0DGu6Js03PlMgZ0j0JT5+6n
	5gd4RI9Bmny93IqLTZ2RdJ1UW+8S29
X-Received: by 2002:a05:701a:c90a:b0:151:8280:2c1a with SMTP id a92af1059eb24-162079a5d98mr5106065c88.42.1791450872591;
        Thu, 08 Oct 2026 02:14:32 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:151:8280:2c1a with SMTP id a92af1059eb24-162079a5d98mr5106037c88.42.1791450871977;
        Thu, 08 Oct 2026 02:14:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v6 00/11] Enable mutliple peripherals in IPQ5210
Date: Thu, 08 Oct 2026 14:44:20 +0530
Message-Id: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1ex2oC/5WS3W7iMBBGXwXleo1m/DugarXvUe2FnUyKVyVAH
 NJWFe++k9CySAtSexHHY+Ucj/3lvSrcZy7VevFe9TzmknedFP7Hoqo3sXtilRupKw3aQwCvgFQ
 zFMVkICUd6qBTJR/ve27z6yx6/H2uez4cxTecF6sUC6t6t93mYb3o+HVQkxMBwsRvuZQ477ZeP
 MybObQq17XK+4PTCGpEBSo5aaJpE1sPv3alLA/H+DxJlzL8vC3y6IBEQUu0Go0NCtUY+9jI8yd
 2y07eb7GL3ReF0jKp/ct26kh6ShSCNyvyRn9H0HdPZ0Eg5wgiJUvtbcE+DvVmxo1jIJMSOWtsN
 LYhb31gZ9KKI6NtAzURtaumCDa5DLv+bY52xDmDjxTDZ4rznbY1kxa4brD5r4HZNOorGt2F1lM
 i4CF5YtDO36HNFa3NhZaZgmA5ocHWkL5D22vaXmiZKe/YY0RJuIU7tPtHr67OLWdQjiy7KH9Us
 rfo0+n0Fxi3aeceAwAA
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX4yd5QcooO0e2
 hz5tCkNkVbbndEI7tsZ4z2OlmgiRyfiqiIsKeHvvJnHadYb4cOQUqImHE538qsP9FTjz8Jnan7D
 6cZ/Z9M8IG3c8hRBFKnEYf/PfOGUXIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX+ucESCqYgXZ6
 7AwypMh2BxJk96t3ayOyIJcgh7gg7jTJzgc+Jfyc8AhUiqoZFJxjKV5y7QG0saRg7KnwplvDJqM
 7Y63zkiSBTVIbkl1JHY4/1l2shtv0PltnYyx6vOWra7+47sDMCjWeX4O97nBuyvUh6KWIfVa36c
 dwfW/4efv9CsNweiMbe3wSNq8sp/hksd+CgJbU4XxJkqn2OpEyirnGDY5SGGucn4YquEVxd3V5/
 +8GsfeMX45869q3fP+DXKY2fjYd99BTqNIIUBdohVPQL1V/6iMiQuya8IcnDo8AiBMV4gJ3VI/R
 UWn6fzHHDlUhPYZi8hPQiFOrBvmBaxErQrtTjaoI/eDNpHgnMg4ag2kAtbfPQ3VWq/P7dwNfAvW
 fdnEGMKXX3I1XE2EcDrk8fLYFI5ApE6qT0mFMLpkqlUHhZYh2Qxly0u5/+T1DT96DPdH/sUastk
 /o2vep81g4h3k9/H/zw==
X-Proofpoint-ORIG-GUID: MSq4hOxzSuY-rOGn_N-0pHkYOcWss3xX
X-Proofpoint-GUID: MSq4hOxzSuY-rOGn_N-0pHkYOcWss3xX
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac75ef9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GufdBAS-4xYfCIfsBd4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
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
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 267 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  29 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 725 ++++++++++++++++++++-
 5 files changed, 1014 insertions(+), 75 deletions(-)
---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com>
prerequisite-patch-id: 5d4c92815c73188205f1b05d0f42b02224e9f51e
prerequisite-message-id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
prerequisite-patch-id: 08aa18faecd4f3588cfd01f3330eadb1a76dcd13
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

