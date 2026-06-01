Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050403D25C2
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326479; cv=none; b=ZmrYO2fR59kePmfqx/vK3Q6feKtSE0K8gNknwp1r46p752uj7PJy9HwW3o3kgeHPPmP2VEnZZPg7zXznnJ5wa/HfknVn1Xp3xXoleiTpdYtdrb6QhU7bXW8wsJDV5cYxSmRBE4LxDESezdzedYhxbJqzYXelcYI0YuQoCpLusBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326479; c=relaxed/simple;
	bh=3VVaulGMeplgtqgpL4n/uqk2CVZZytxplVZEn/dOXxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzMgpP+5mIV1m5ObVw8VJ5oSf6ayldzLVgU1Mg6D+UtqLKyv/jcee9ust5/XjWkV7x8zH+L2qKvLUvzH/dgnV0zoHQclNMtWwQN8x2fWP2t8cEzRSq3a9wfQ4jEEgAcLdFnkq83ZRTVGSVd9nOC0YfbV1D+BcfhI8ZIFFhL8gg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuwN8PGP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuwN8PGP"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so5670267a12.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326476; x=1780931276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/xePLwzWpzxbmPIhpf8UeZQgMntn3mfOmofUFvGYSM=;
        b=QuwN8PGP+YJpm6DkJqF3uBgKASBTF+5TmW68HoM2FzuoeP3ZRNd0Ss+MwJyFsrGEH3
         b6U7aX1gylGFllnANst+JMZdmXdlVuO8n06PNKUlmgh3fAVmlFIZ2iDrbcL65K3u/3a/
         5287lOuBalwuGVQJRCH5+FfuGshxHOOZazJpVFCToPvLLvtryNWKsnmfNIwkmAkqwNF0
         t99zTbHjud6n1qhRteFFXOaNa25vEq0iCjXTbiKkISjkSD7gVb2ACsiJm29SzxkTZrCT
         noPl7mlfibpBbxT8NojpmbTqBISFWExXvKD/In2idBITmPk/1lpPRtjiWWaqPoYgBIih
         +7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326476; x=1780931276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/xePLwzWpzxbmPIhpf8UeZQgMntn3mfOmofUFvGYSM=;
        b=a5pJs4x9piuFiX3vQCRPwazbtxOg96E/7iv2DiGnNyLciwKKYkgMHTaTzRZTcReKTt
         3V/KorVznMQleDk25Qj+r2npvu2ziu9YcVBrP4i8LC49mRC1p1v8/rG/GjhDb1OBmIym
         7BSeTQku6WI7uVi+FEEgguaeRM1/QQ+Ptz7/JA5KSG6pJvyf/UfRa9Yo5Vqip3/rT0Fg
         mZPgBss4ZwFPk4krkzvS8pUmcQ0I5kYDlDp2mbJAhOxbkj7J56sFhlyjrWo4bu+Vjroy
         fo13h6XNJpODYwQHyYlrFhjaBLSs+RGzuc5yA55kIt863DhFq9k6ELSSqIXda94BvALa
         MtWg==
X-Gm-Message-State: AOJu0Yx1kTjkSa1pmFTOL7o4iihZc4uv8rrZZiZpdAco/tbJOY5oI6N7
	gChwICojpSgEqlG2gT7HubfB9MpdyFyl0Vcepv1zHfABVRAkUuUuj7rUDunLFAuq
X-Gm-Gg: Acq92OGUSyoJ1ayosPdX8kn6iRzb73Mg6kEQyDFIfkbtCBZdTqyQSJSo9Na99/MgN2c
	AvvF4sZCMTgiPqcL1+RqDN7g369tMg/RHLaj949y+VSS6v2dTMp/fHX3GGO/lXJ783dgcHF9ASo
	3v8jbZYMchbj4kmBWI0Gh155GnnPJ1zuHiQIECAnZbsDL4/IGhtpy1gqHI6UjsrL3LykXgDfSh0
	6gnusjaHXHKBB4n42Yaaq5RLU3o6TiP7VyU6wq+OuTq0G34zmI5uRpAm09vasNtc5b/Rgzr/LY6
	afdOSyqfbLSY7uAfLrpYcKjAe6zxlzaMd3KaKUun1te41bJWvqGrShL4XkosRAXCQhcAh/3Uf1m
	YGHaAEh9G5P9DKgCFe7dJHEAcbLWps4dtbcNcXQXuasLSDzAdR1A1yNYlSdM/p19las15SfFRTd
	GhJOVIoXl+knx5GeZAmEK3ilZyFobVQ79pvdYBF6YmFxHoXb0M3yoOzknVoQuUGy4QvdIEo8Q=
X-Received: by 2002:a05:6402:3554:b0:683:5306:d41b with SMTP id 4fb4d7f45d1cf-68c8ab2d864mr5521619a12.7.1780326476054;
        Mon, 01 Jun 2026 08:07:56 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb852272sm2085659a12.20.2026.06.01.08.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:07:54 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v8 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Mon,  1 Jun 2026 17:07:50 +0200
Message-ID: <20260601150752.666393-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Changes in v8:
- Patch no. 1 - no changes
- Drop dr_mode = "otg" as it is the default value (patch no. 2)
- Drop usb-role-switch as it is already defined in kodiak.dtsi (patch
  no. 2)
- Fix USB Type-C SBU endpoint port number: port@1 -> port@2 to comply
  with usb-connector.yaml bindings (patch no. 2)
- Use downstream adsp_rpc_remote_heap_mem memory region to avoid
  overlapping with cdsp_mem (patch no. 2)
- Link to v7:
  https://lore.kernel.org/all/20260528152011.376711-1-zstaseg@gmail.com/

Changes in v7:
- Patch no. 1 - no changes
- Patch no. 3 removed. Dmitry Baryshkov addressed that in a separate
  patchset
- Added record-size for ramoops node (reduced pmsg-size by 0x100000)
  (patch no. 2)
- Fixed unit address for rmtfs_mem (patch no. 2)
- Link to v6:
  https://lore.kernel.org/all/20260516090853.2873223-1-zstaseg@gmail.com/

Changes in v6:
- Patch no. 1 - no changes
- Added a comment about reserved gpio ranges (patch no. 2)
- Removed "output-low" property from "hst_bt_en" node (patch no. 2)
- Moved common IPA properties for sm7325 devices to soc's dtsi (patch
  no. 3)
- Link to v5:
  https://lore.kernel.org/all/20260417084749.253242-1-zstaseg@gmail.com/

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
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 913 ++++++++++++++++++
 3 files changed, 915 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.53.0

