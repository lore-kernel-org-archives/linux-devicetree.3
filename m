Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429F2701D9
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017228; cv=none; b=BPn2G+8iQxqBLVfdxwHu6Rfu4iTWaSUkUOrXOxPjlCGdUVBu1roFJrLGB/w3sbOB3QQBol0Qx3/x529748/Zi0Tb/0Ko5bW3G1KEEdn5WMgZb4HKgOS3uCvK5+xEQSqxuaLoVSouXkp66nDrIDi9MG94FyX/OxsTXOCFecMBT8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017228; c=relaxed/simple;
	bh=ix/oHhBAo7AENnf1SkoR2nZG40XnWLkYO0tbe1FXolg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JYQNsfXRGcMCJrW2SHzXvFaaRL2LsWBVEpdqCLUDj0wJG359CCrTos1ldreYQvCMvAgO8WkOD0WlXvbQmtInmHlWOBLtrQphr4Ho6Oo8RMfgbfScn/iF2QwWbTWwoXhYjqHcHMioIJtIb9sq0LIuK72kQqGV980iIcK+o/MojcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEF8a3ET; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEF8a3ET"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84232e83ca9so2409125b3a.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017223; x=1781622023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IByXirxo3bMCvCa3vaDUgSZFbqo9DDHPOgxMY9rP5MY=;
        b=SEF8a3ET9QEPLuQi/svOG/Mm9B1pPJCHHrME/9hIDDnmGvb6YNq3FlpRdomninKA7P
         uH1qPsYpskKH4T6kzlVsM/4f/8+H221Ys41nFKuEk7adc9PRjkFp9VnQd/76whVOdDnQ
         kgXtHdRefk9AM/fxBFeAQeYc1XhnDVWigrJvvbPjxxIooC9Xe1NOi5LEfYBrAF50royZ
         UfAGqTf/snybA8m4k4uP04XJrJtyVcIdyIdank3EKvdHMTxmTHsgtQuDbZWUVi1lKFl8
         jfGgfthk28VWxzrH2s9EV8yJAzRk2jTphynCjaigeZjqzv8Gpjqc2aBXhIw6s2CFuWg3
         CfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017223; x=1781622023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IByXirxo3bMCvCa3vaDUgSZFbqo9DDHPOgxMY9rP5MY=;
        b=CbssAHn5nZwbsjRicTqHkIg7AtFDLRVkuRCcfPzBlEjHilYzOk8O+ZdE8bevw/mLyZ
         2x3mU6Nss/Oiw4A40qYjyz+jF5iw3t14MwSHzm82Qo4eQASlwfcbw5ybaoyrJIV+o3R+
         n6FFJavnNHDUhVUWGLBreCSQdOaiXF16w7bczq1iAPqr2RmgeJWjn8zTNcCoMLD9Txan
         Ti4EqnJ5a17rcpCzkJz1rZ3dhBTmCilNo5+jrxpBBl5PxNfks4jk8d4+iva5JKrmBuHb
         8ytyK6N5tNIT94/6dTpPD92i/TcyVxF+fEQ2IAP6X4HL+YiV5JS3qVgfT0yCxM75ccGB
         UPBg==
X-Forwarded-Encrypted: i=1; AFNElJ/m9BK9JXSBXdA+sDUE6gnxAcv4cJgDT1GvjNC7P0BoE74Az4PpVs5g2GBpz2zpLAH5kmFli+QTXDQL@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8mg4hxGuSvIsLDfDbrXO6xK0xAAz6TiA9i+RnmiJElsBYE89
	i6YRHsSeTW0gMdqLCAjxQVm/tkapHpgGzUSfpN3nQ2He5QVPkDl83Gup
X-Gm-Gg: Acq92OHw3cAyjtzK2LIcy6qzzC0GPXb2UZ2eXkMLZlXCkudgcIKPolQEPA3wCXg4mbn
	c0KYNAO0itdbH/x1PVusZy0fmo3Jk34hSQi80O3wxu0MLSEiowgA4JtRwwRtUkJj+kUk2F+pj7k
	2PLVPnBsv3IhLtwEeb3MDPLFhmaR/eNWS2AHNwUGacBX3yxb+b36T81i46ySHRxSYr4TVHy29FI
	kLxl3GsOj801oUTbdoaRD4s5eOE0U5LanIABVfTw/rqMEEtXqdcQyi7Il0tgMDm/XFfknsvwjgq
	GQRomwbupgUTiHOtH4zR5j25rOkk2WnDJsE6LnL3PGmKiWgkH8fWGiDWwvg8dP3pIRbqRXZzoam
	opgNO1xGZp2t+9MT/eP5K/iafRjwtD8tdEsOSvruKhYawQtFaAGAdivpAIqbAuHfZfEzJnpYkHR
	FrXHKtiooEDQLmmTLAtDbRv7hG7wq600NIbz2reuSNuxHstxb2wPmZo/ulGFDaiMI6tkop5Fx3N
	s5XBCJAwB83/G0U/lHfNN89hQtgfHqF/tY=
X-Received: by 2002:a05:6a00:1746:b0:842:6482:adc with SMTP id d2e1a72fcca58-842b0f1ed44mr21080433b3a.9.1781017222588;
        Tue, 09 Jun 2026 08:00:22 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm22773929b3a.15.2026.06.09.08.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:00:22 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH v4 0/1] Add support for Microsoft Surface Pro 12in
Date: Wed, 10 Jun 2026 00:59:04 +1000
Message-ID: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v4:
Device tree:
 - Fixed some formatting nits in the device tree
 - Clarified NFC only available on business sku.

Changes in v3:
Rebase:
 - Rebased on next-20260528
 - Removed ice device tree changes

Device tree:
 - Fixed C++ style comment in &i2c9 to use /* */ style
 - Flattened mdss_dp3 port into &mdss_dp3_out directly
 - Whitespace and formatting nits

Changes in v2:
Ice device tree: 
 - Updated to use 0x0 formatting

Panel: 
 - Add edid to commit message

Device tree:
 - Fixed formatting and ordering nits
 - Removed extra dmic audio declarations
 - Added suspected devices on i2c busses
 - Fixed incorrect usb regulator
 - Describe panel pin regulator
 - Added defaults for volume button GPIOs

Already applied:
 - dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
   (landed in linux-next)
 - firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
   (applied by Bjorn Andersson, commit 667d05a09db3)
 - platform/surface: SAM: Add support for Surface Pro 12in
   (applied to review-ilpo-next by Ilpo Järvinen)
 - drm/panel-edp: Add panel for Surface Pro 12in
   (pushed to drm-misc-next by Doug Anderson, commit 02f48ffdf96c)
 - hid: Pen battery quirk for Surface Pro 12in
   (pushed to hid for-7.2/core by bentiss@kernel.org)

Pending in this series:
 - arm64: dts: qcom: Add Microsoft Surface Pro 12in
   (reviewed by Dmitry Baryshkov in v2/v3, minor style fixes applied)

Will be done in future patches:
 - Camera support (pending purwa cams patchset)
 - IRIS jpeg decoder support (pending purwa iris patchset)
 - Accelerometer support via ADSP (probably userspace)
  

(Audioreach/ucm2 changes for audio)
https://github.com/linux-msm/audioreach-topology/pull/32
https://github.com/alsa-project/alsa-ucm-conf/blob/9577cd31121546b288759097901025376141177b/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf


Link to v1:
https://lore.kernel.org/all/cover.1778498477.git.harrison.vanderbyl@gmail.com/
Link to v2:
https://lore.kernel.org/all/cover.1778822464.git.harrison.vanderbyl@gmail.com/
Link to v3:
https://lore.kernel.org/all/20260529011619.9586-1-harrison.vanderbyl@gmail.com/

Harrison Vanderbyl (1):
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1194 +++++++++++++++++
 2 files changed, 1196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
prerequisite-patch-id: 30b1f6eda08f0e6798cfc9dfd29ea0951e9d8dee
-- 
2.53.0

