Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624083AEF3A
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415679; cv=none; b=lKCUjF1AFOLAeyDQS15Blh+/mgtov4yhREQ3fJ/V+in0Ab3aoQkBU6UCrgMtC9WrSQAhiaCviSlZsr0Jn9Z7ugngvV0x8zkH5uI8o2bkY+GcdO19gEleffQMsECgc05k8m0OPRA7s8WSGnvwPv06UZQ/VMq4a/jaoRWA8tSJojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415679; c=relaxed/simple;
	bh=l1EaDFY9lVbPRb6NM68LmhtFzEdCUmxstw3Kjtxw8Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TpItAia3bq1Lthxz3q81kq9K+8m18wbGYBaNQiSeGUjzKnk0YEy0neLHzKIDa7TmsmVT8GdIPZJBha+YsDdlTHZkJBPGIJR+gV2C5SHI4Nu5T6tiHRp4EBmflakd60KYubp35Mzvsjfqtq41ciS/k+UijbMeEEZYZnd222qW5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo45Rkdd; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo45Rkdd"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66f8f556f39so567407a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776415676; x=1777020476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEET8vV8bxTC95bwA4y5KBbwm94kt3IaZw5P98527UI=;
        b=Vo45Rkdde2F5/WgwCbyanHBmuka2jHjMmHFtJ8W7rRWhROMemTcfeLn5Qt14JSKpg9
         MbHYD487omApR0wL/vVBpeSeYH5CtYXWhcWTc7HiCD7kdDhuAa8a2nsbNehuFti16wkT
         lbbg8DaQQ7SsT5Q4SwoYCmQ1OVm/cLFNuUdYmhpkeXCMVQfUpBmrBGwAmISivhMcFCDz
         mDQUaY1AZBvT7iWg46gzti3jlzr/Bs/2QsPYIAykeZpdftKI4lxl/GwK1uWyuFMyWKd8
         MZKcs1eMOEUllssFvrlIULGSxWDJFX3XgSQTOTIhSme/pqJpAI3p5JOVpaky5wK6aeJD
         H82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415676; x=1777020476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEET8vV8bxTC95bwA4y5KBbwm94kt3IaZw5P98527UI=;
        b=BgUn2LyEh0FldLcsP0QEAo6cvP+wXUjnKtmzcJUM+IC4/qHOnuq/qoovGF1FQQ9B0u
         pzN7hoXK1+BQi6HwPOPH5Di4GDH1QWQsDllkt9NfQeurHD5Bp/8Cl+LXDDOif06ClnvK
         4+aNc24r4mF0cvn4oPjSsJWBAPd7soh+CS/iDjbyW+i9RHwpKQkFHgX/Rv7+zNeviHsX
         4hFteAC1bXogLqDf6swsWzgKzN83fbrDGFEphfjblnN0CouEWyyY6zDNJQDP87X5B5y5
         m8Wsw68xPSxNAAgEpH1Brh6inxBLft/ms/DR55A5vBbJM7k2Qu21vwx6UQi4MLBrbHKS
         XDDQ==
X-Gm-Message-State: AOJu0YwMQ5J/2NN3TFP/9mIcUkCgaOV7E8Nwpx81C/xsm0ifumFyEzD2
	G/IGrgMTCMYFr/9WMUxj5TNd/L64EDPGCSvC3b6tO/e+2xx0tf1BxCK5xa4x2Npn
X-Gm-Gg: AeBDies8CgQb266Rd8wC84RKw9hFbbl1GrE8Lb/XKk2SRfbytwU6LyBMl0phujxGuCi
	Fkco5NPxw/xXqWRRAx2nOwYSaNDVqhPrYoVif0I5zZbbt8m0lnxaef6razMM4+81Roty8p1LpmR
	7t3+aB+5Ja1rK5rlZoUbZ2JHXPoZ3Cwzn6xiVpGO96OpWhyZ6k2zANUg6FaV/SiJCQF0//sLS4I
	/tul7nEqcpidIoO7DewoC1BQoCGoGlQ2RpgUKqIUT1Vj7TtvI+P8Bn9TH80c1kApOf/XQsySuRl
	lNhOMjMCJCsdNeO3Pnm/7Pdvk5qeQ+Af5FkdFIiQ4zhnGxSAYhcZY+3XHRZTexuC8VmbqtXiG1j
	KwVpB3RNL8wpAe5ClOFJmcruphv82zyMo0tczuHx8twlaK/miOcfSIzCn3uleAh3C68eQGQUAMF
	snSwcRbGrNONaPmQ1X4j7i3A0sUDvWW4witv/K6KE=
X-Received: by 2002:a17:907:6e94:b0:b9a:cb5e:5354 with SMTP id a640c23a62f3a-ba4190787a9mr107349266b.16.1776415675273;
        Fri, 17 Apr 2026 01:47:55 -0700 (PDT)
Received: from workstation.home ([178.230.164.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm32789166b.43.2026.04.17.01.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:47:54 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	val@packett.cool,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Fri, 17 Apr 2026 10:47:47 +0200
Message-ID: <20260417084749.253242-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v5:
- Patch no. 1 - no changes
- Change vccq-supply to vccq2-supply in ufs node as it's ufs2.2 (patch no. 2)
- Val's patch for goodix-berlin didn't have effect on my touchscreen,
  therefore keep the touchscreen szie (no changes in this regard in
  patch no. 2)
- Link to v4:
  https://lore.kernel.org/all/20260305093941.305122-1-zstaseg@gmail.com/

Changes in v4:
- Patch no. 1 - no changes
- Removed Konrad's R-b tag, please take a look again (patch no. 2)
- Fixed vreg_s2b_0p7 regulator name to spmb2 (patch no. 2)
- Switched bluetooth to wcn6750-pmu (patch no. 2)
- Dropped qcom,local-bd-address-broken as it has no effect (patch no. 2)
- Added wifi calibration variant "Xiaomi_taoyao" (also sent board-2.bin
  files to ath11k) (patch no. 2)
- Link to v3:
  https://lore.kernel.org/all/20260224114424.1966947-1-zstaseg@gmail.com/

Changes in v3:
- Patch no. 1 - no changes
- Drop unit address for framebuffer node (patch no. 2)
- Add Konrad's R-b tag (patch no. 2)
- Link to v2:
  https://lore.kernel.org/all/20260216120715.3432191-1-zstaseg@gmail.com/

Changes in v2:
- Add Rob's A-b tag (patch no. 1)
- Add explicit framebuffer_reserved label (patch no. 2)
- Use memory-region for simple-framebuffer (patch no. 2)
- Fix reserved-memory naming: make node names consistent with labels
  and intended subsystem (CVP/camera/video) (patch no. 2)
- Convert mem-type value from <0x02> to <2> (patch no. 2)
- Fix s2b regulator comment style (patch no. 2)
- Remove unused gpio-reserved-ranges entry (<32 2>) (patch no. 2)
- Link to v1:
  https://lore.kernel.org/all/20260204115645.1343750-1-zstaseg@gmail.com/

Stanislav Zaikin (2):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
 3 files changed, 909 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0

