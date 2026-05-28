Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C59B3C07A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981618; cv=none; b=SJc93kQTtpkY46FZbjjRLk3JcvFeOfISnmLAIPHf3oVcpYKcfdA7CowRLRDb70qlruZ3uaccFzlh+dyne9vvxTZ1LohVx31tvvLfHaoxE792PHDKeS5NxoC2Cd2sxqlCxo/PmqxatMqh0KbiCN0YbJqNjcV/txyGo2Yvm2julu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981618; c=relaxed/simple;
	bh=jASwOlwleBduesjaGgfPwOFOW0CwfRtCb5gdkoYtzd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsZr7Qj0FIAfQmYRNDarkj/k2L4esY4wlKPwRRwYZAqIZ5ssOHM7RYLw3qJwsRfzPMSNmITjYDGpYy9la7pwr/ROqx9GekIyzWOfBU4KtN2dWPJwpA71TIURHqaos+zqt7xyqDXNJmAArZOTaVE2SfvZmwq3tlUwlABp/B1Ghx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9sSyUHB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9sSyUHB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso10816467a12.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779981616; x=1780586416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUCdcH9eZ0VhK0ZArX0DMz4U0Or2nWxmRJGAlVIStUw=;
        b=e9sSyUHB0zmjV47HYONA78fvVTzE3N1KGYyAG5C2LNXNGs9p/3LBp22BP7bal9bVXI
         xpHnjdxY1gp042XNKmWZFkyZnllZh/xSIDbA9gJUhPbyT0Cg3OjrFPHy4vyJ3ik7Ahvt
         QjrEjsMiEa2SUWkzkDhXdYCoeRPQNnkEMM98I5Hynb7ypWwB2vL1YkaAI0j9BnxEly4G
         0PNK73RX2QW2tRSn+lpq6IoYMnnS8D6pEVEbxuEYtGg7NcO4E62KrDSbOFfpc7IY2b66
         ZxNNMW5xKP6+pldieP0vc/0xsPofMtMMwUdJ8W7Nl542A/x9iKsL13f8yLROEty1pbeo
         BSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981616; x=1780586416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUCdcH9eZ0VhK0ZArX0DMz4U0Or2nWxmRJGAlVIStUw=;
        b=UQRBcQrZNoq/0qRscnvuabIUu8z6w6SdystMoa1Xu+1UXt8mUCxp4S/n7Qpg82B101
         LXuh0F/56VQ2CRYoNXsRgRdQh8RK7zO3vvBT6msf4npPzxgNHabw+rUzajnq6BtfoR/D
         Bcg/v0ODT1FlqD7KyEUjWu51NsJVZCoAZTgbGF1yXGxSUp3thd8Bz35cqHjD3LnGY3fJ
         5hOIvCqJhV57Jfn3/ANACbgTZxHNG/PCsYrPgCaQOwvc+9dZsyHoobCDqrHVLllBCxaA
         LrNYesE1OW5kN2dD4LxZlgvpnbrqBMqJd0WwwhguuYvc7V4VDAO3dfuusJLNUcWv1iNm
         5oYA==
X-Gm-Message-State: AOJu0YxJquFlObXqwe3XVxKG++6+4sTblFbFOF6pYk5RAzVXApF9uZgI
	a0UAwl4Z4rh+elSBivB2Pwtgb0yzlrUvi7R8dtv19kHyX2vu/7B88aqD9kb7okAK
X-Gm-Gg: Acq92OF73FH5xWNgHgh0qf7ar6SMIirP4O7Vkv6g27QZFQOWaQEA6cwth4qTNpI5ynG
	e3gH42yT2SNz5r12zsieuhBSfcbP+47sIEabkYWmnbk5S8FxqPa76o1KQh6Y0m6e9vEQKBc8XNj
	JfuMtqP796qOH97sUMVrL8HpmF+CgVl8NUUP35gmTn63Sr0TxH4AYJFI8dZrXjcucIf4mk6+TX8
	x84RANJ1/GI50YSmYmOfjSbsPz/lgLANfS2Ka+VfW5yALtpBkf/N3QgW0nluueeVrZ2vO+AInw2
	43JE2YAdvckUZLe/T7z68gFNrNAPoLccz24vUTioqH+4k8wVjqmf5QR/O2bRSUZmL/PRZ3BUZxe
	71d2HAPqO4JNnStIkcdy0ufyFuKrylhsNCMONNj3f7j5Jnxv9tICpgaXLPBmGFS3AwBxD5tDEfY
	RnJbx73a3d31RMAkQZE+KB9cp4xe0pGfHzDAk1/Y7fuHxCo7dj3bYmE1s8GBSln9PZ09eG3RU=
X-Received: by 2002:a05:6402:320f:b0:67d:5c3d:8633 with SMTP id 4fb4d7f45d1cf-6889cc6f56fmr15145927a12.26.1779981615745;
        Thu, 28 May 2026 08:20:15 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb31611sm1984404a12.22.2026.05.28.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:20:14 -0700 (PDT)
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
Subject: [PATCH v7 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Thu, 28 May 2026 17:20:09 +0200
Message-ID: <20260528152011.376711-1-zstaseg@gmail.com>
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

Changes in v7:
- Patch no. 1 - no changes
- Patch no. 3 removed. Dmitry Baryskov addressed that in a separate
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
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 909 ++++++++++++++++++
 3 files changed, 911 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0

