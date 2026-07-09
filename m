Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0829994B
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608342; cv=none; b=d5xd4jSgYi9vwAED2q3w7fSXtZzZQumU87PLB15QDGZIT8eJMRYbPDKGAGFJyy6cY9MxeXtq+J+CaOs+SYTiMX8B0d2g16yShavZ+0Ft3NQatdN+6ym18gZdDHYVXzJqUjiJca2+EoXAIdGI0zooe0KMQ9GgZ/z71t7H4bs/zKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608342; c=relaxed/simple;
	bh=tXWfnS9QrYJVjwLQmP9pKe+9UsmOp/aDaXYeqzx2T3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qCHp+uUvs6o6oX0lCn6xFSKj1jIYmdJPSmCaMS+RcA21EPxlc1DhaqS7hxUmiDZI+5XhzQAwjz27jlXNxX6gDZRTQFeLifKGn/nVbY/OuvL40vsZHXp9+v3l2rqGX1cfwlsQIOOkS894BOsj+5EuBgKBdhslI8PGDMuWgfg28VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0UXS/Zp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0UXS/Zp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df440fcd5so887566f8f.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608339; x=1784213139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=;
        b=j0UXS/Zp2EcG8+sGgetko/TLteEG4tg3Wai0flrI3F/X28J2XDwb3OLPNJByFHmmbM
         h485m4PTTRIszU/ERAwhTWvDowjDdxN0i4J2g5lJwobRqOCvyfrE4g+3G99O0F1N8eKH
         9DURwl/dIN9OGB9r9pbM59Ku9k1khguppyL+9SrV6R+ZwkxOTZn4exLvIgRsgkjFZ5e8
         rNsqXkfE0lW9gaq+hLdgPWs5/HyDjNW7gyKKbAkVNuTYFec5DxQ8uoxFB++nn6GmJH/Q
         +a64qG02kmDPm2P+F6YnjPmuvWkffbx8gAP7Q92llibGEF4OA5bUpPfPce2mTfszw/0k
         hW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608339; x=1784213139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=;
        b=oEAVmPcMOCjqRJ7CJDM9KlcY0fZ0Ezz5jMTlYeQ5PTprEIHRWzFZsWZLD0/brGPAt/
         hTAzP2h8xUNnIZA8tYP4O5b7ntrNwT/gXERZ2IrJhV+ZIkt9bjhbxqV+Ad2yOzZEHVT5
         f/kE17jeLLS9UT+vVBGS04bjGDF7nKz8n73yME2aTkenaqHuB6yBcW9xTfjiVGRflYpD
         5RPvfunycF1Zs8G3tLxIGl1bjSANSFGchbULRXVh2wFSNW8j4pM4NF4yhmPKrImQMz0W
         vhGpa5GTjgnFCmA7ndQ1jnqckMDBc2z7Ag30v/icv7J3EC2GrRQ849YreLR5Da38YKVm
         MygQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYfsKLyDt/s1Bn0ZZzNaLxnjE5jvSa67IVX0rSLomLY+oYPegjXJ/jGCK9oFh1VpGhRGk467/2RWNk@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1Rmk7gEJibS4d/5rtahE4NpOLWBXYdLC1Fm56/xwAyj58day
	yDwiXmXFbOUltAFrhAKxzX+FEqJ8tEFHOLd8Qtwr7wpIbYALwSH5J+7RKjzbo8CLI6k=
X-Gm-Gg: AfdE7cmEJP6lkypnz7NocH9kL7MHswzwhdgpcABpYzU9LibvLe2/96VPTbFrTT95p6U
	ahbCJ7zcDlrLmdy8JTza25KQ/w1UdRCfeZejNGi6ErCTOfeM+ZC06PSVX6i2rRC7ihn595//med
	rhf5Y3uh76S0iG3Mr2OHHgHYXGBH4Vi1kcodFZMSjQwceG0tdqiMDsSl9AmVKkhNI2Bc/PpaN1b
	orKNXxZaKRljf10YkKrkOng9oia5MI+EV84sLRkTI+3h3Xpzxq7QJDPcl06inSUf4enTJSRY8v9
	hKi6+ujUYzPfV766TvJFiWWhtL4dPrbH8fseTvQoQIELevKzl+KnZt/t6ednEqTMFknU9Dqvz8o
	3kVk6hAcZr52q0PwPMTb0hkvS/shoL8ldUI3w0S5FSte+fe2wmy4Gi9/nPJ8QhO/hNld47pIDYf
	gMvTGAb/7r4IO9kPGpW4LPhAHmLYO68awYfOFlRDpN6XKWuUGE00wvq4SxNm1XAWe0eD6F96JTL
	VZA
X-Received: by 2002:a05:6000:2909:b0:476:504f:7a8 with SMTP id ffacd0b85a97d-47df081e2c4mr8073399f8f.55.1783608339161;
        Thu, 09 Jul 2026 07:45:39 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/2] Exynos850 AP-to-APM mailbox support
Date: Thu, 09 Jul 2026 15:45:35 +0100
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+0T2oC/43N0QrCIBTG8VcJrzPc0Uy76j2iC6eeTdjm0BiL2
 LvnuqkIosv/B+d37iT7FHwmx82dJD+FHOJQQmw3xLZmaDwNrjQBBpJxYNTPtyFmtWfUjGDGnvY
 mdHWcqUVkVjmplVaknI/JY5if9PlSug35GtPt+Wmq1vUPdKooo1pxX3MELdGeujCYFHcxNWRVJ
 3hJgsEPCYpkzR7RIWrtxJfE3yTQPyReJOXhUGnJlBXyQ1qW5QHqSyCbVQEAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This patch series introduces support for the AP-to-APM mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

It will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- updated regs, masks types to u32 (as requested by Tudor)
- device_get_match_data() moved to the beginning of probe routine
  (requested by Tudor)
- number of channels selection moved to driver data struct,
  added description for that field, data->num_chans is used in probe
  (requested by Tudor)
- new define for Exynos850 is added to hardcode the number
  of channels
- updated trailers via b4
- Link to v3: https://lore.kernel.org/r/20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org

Changes in v3:
- exynos850 dts change is split out to a separate patch;
- updated commit messages to a proper name AP-to-APM;
- added comment "ring the doorbell" right before generating an IRQ to APM;
- renamed regs callback names to intgr, intgr_shift, intmr, intmr_mask;
- Link to v2: https://lore.kernel.org/r/20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org

Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (2):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 drivers/mailbox/exynos-mailbox.c                   | 72 ++++++++++++++++++++--
 2 files changed, 69 insertions(+), 7 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

