Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEA29B8D0
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246602; cv=none; b=sdb2UFtpVPhL7eVHDjIvjjuMS42heiIWk1adv8Zas4Y8oDduhqbMf6XbS9Qa/7MA7h+jKbGLqRM2H6y7Uw5Y6OdKPOpP09XztPIHBDeWdykWJ2gb4OuoQ2A0DurxxrPrcKKXOLTObmGTF9ohGxpyc/S/7reLoiKzFRP36/G/HwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246602; c=relaxed/simple;
	bh=nicpf7w7xnowpW8CwGsvVs1tmoiVOrraY+0ayLh5qwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MMUklrvkJGXFA1LhIkSNBpPUXqkcR6rGiW2gYHN1WhT0lYHhDRPEovkGvYJYZbrWz5gDK/d/sOsBxbk3nwN+c9ErcSc/l2UExAlJo05s6kqwIx9WLXjNUTdB4756WFsgtXUXXRz+NXxcur9bimyW2xGEq8FRqWLCFyritCB1QFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmN2F9yv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmN2F9yv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4909def6a21so10303375e9.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246600; x=1780851400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9aGyOa+1OUxgTA+TIJa/R9e01PQ+OBq8qsCAu4u2YQ=;
        b=bmN2F9yvBIXPnIla54LOOyw2O3UUQ3NIcZL89J17kGPsi+jqbitZ7ssSFCWdLrFNCP
         OjUWzS5DbeNMkla1/4E2CNioOUTPiGUWOR19xKIJesTX3AToiZnbTo3VUicnPzdDbLn6
         a8YKVa4xS7ub/dgHP7iWgB70efsy+fjeFVV/eUlXNQmEPW6cNz8gavmw2XuTFxIrJIze
         O4D1ZQni3zyvZiLPxmHaTcHKV6PyuWlKcUp4UiKNqBDZu1WVaoejchtb7qCvBfWgfd0X
         2HSCvLf4qVR4EFDXxJziBW6oI9+oc0Fv+5V5wOBmCCy88BEL9w6YJIqoLwg/m9NJ0WCV
         juzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246600; x=1780851400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9aGyOa+1OUxgTA+TIJa/R9e01PQ+OBq8qsCAu4u2YQ=;
        b=ks/hR2ObomujI7NtU1tZ0UDWFDOXLXo00eHzdNLrtJAT/n5diRgyzoLOL6HHOEEINZ
         D2jjCMG/ahBUUsHHvOYYit6ejaFmr6IsGgrCPOYrBnqKxXRMvXN/kP4G3y/tzAd+oYO8
         y6W5si3SEWwkl/srXl/wxqUC5aMb2a0eJuXviNhPIRsPC8LQ2E6yiXyYvmSk1RONFlpF
         uW8JvPEZDkeJZferBxofTo6Sf60fvMCJdSX/adtf5eIdFmdxHg3DVm1lFNhC1i95Kxrm
         YtENCWVhkKo1+3GD44Gd8oxQlCSLrCMkGrVSqnQsVuWhYBC2DwDt3dEQYcNmCB1jjVfS
         JTgA==
X-Forwarded-Encrypted: i=1; AFNElJ/pPmEVHS2YSA/BiRS6T70nhX8doF+9Vhz4lrG2V1p2vshXiGO4GJEmgOJOAxsz9Xr6GOxkQWy9S4QP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1T7Y8Uss4HgqoA+5CewkwDlxgHgGtOhwbi/1hklt9Yr3TuzwM
	EO2XLWD12La8SjH+LKomzCVXWJfzjB4LFQ+747JlYvDRgfIG2aSaNrby
X-Gm-Gg: Acq92OHwApFGd65Ej9rFNjVYAzGWMZkyH8KMmqZ+9Lwd04hBWVlpV0gJsNaR2aTXmgB
	R2NDKcaCaReBv+2gdkDmBZtOhf50q5/+T2xi6SSbX/0GKLhDuLBtSW4iAL5RbMg2wGpL/MkiPuW
	NzTeBOGdUQ+jwTxQWM4v+t8w1tecO0d+gkLvCf7F65hMfu+an3DqTeyAOPw790s+jqu3cfnMR7R
	is8rvff2X5Z4Roz3auZoQ+f44ulzWDXj/e39Ty5PjWOZCkToZ0OjmaUTKBH5YHRa6+I2IkEJsmT
	keYN3xc0yODif/puj09xOcY9uTY4JXUBgk4kMDd2DdlOCynRpeXy/ZyLdHGAd8SatoWHoAiJUW9
	oXoeJjsQS236GG9M6Fh7HK2SoIbAE7lsJ3//b2NFeVeJ67G+1DOf4GzoITAfcecDsOAloFJ3Un5
	SIMR4iZq500NqPmlm7aeiqmk99WlqTKf8kMd3g+QRhs3vzXlt6riTIcAnupeIh1vEgH1ngh+mnL
	g97mRynf5iaB+fn3vPRDC8NQUi/6q/SXBlv+3c6kq1Fp2BPmWtRO6rL+9WPZCMUvrJtB3JVwDcb
	0LeiDsHCVyR64YnHfRvd8T4VQ+s9RxMNU7Uxau5wqpj2nt2uqpM=
X-Received: by 2002:a05:600c:6d2:b0:490:5368:743 with SMTP id 5b1f17b1804b1-490a2946a23mr91908945e9.32.1780246599601;
        Sun, 31 May 2026 09:56:39 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0:c287:187e:fb7a:66a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c09acd3sm57648445e9.4.2026.05.31.09.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:56:39 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v4 0/2] iio: light: veml3328: add support for new sensor
Date: Sun, 31 May 2026 18:56:34 +0200
Message-Id: <20260531-veml3328-v4-0-f9b65d71d917@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQrCMBCF4auUWRsJExurK+8hXcTM2A40bUkkK
 CV3N3bt8n88vg0SR+EE12aDyFmSLHON06EBP7p5YCVUG1Cj1a3RKnOYjMFOEXr/QEsa/RnqfY3
 8lPdO3fvao6TXEj+7nM1v/YNko7Qiai2yY+7ochuCk+nolwB9KeUL6jchvKAAAAA=
X-Change-ID: 20260530-veml3328-d2ccb26d02c7
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780246598; l=2303;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=nicpf7w7xnowpW8CwGsvVs1tmoiVOrraY+0ayLh5qwk=;
 b=pcji/Cs6ymGZeiu4h7dYP4caaRI4X6xD4N6muW8tluOrlfArBoHC1GE3QjWu/EX+bTUsZ+G16
 B4SeY6HyOMjAIWwLTkebRsv7CU9cvPm8ZNRJJ6wKwXGLR9/t0Wioh9o
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This patch series adds support for the Vishay VEML3328 RGBCIR light
sensor. The sensor communicates via I2C (SMBus compatible) and provides
5 types of 16-bit measurements: red, green, blue, clear and infrared.

Reasons for adding a new driver:
- Existing Vishay drivers in the kernel do not cover sensors that
  handle RGBC and IR simultaneously.
- The register map and configuration differ from other Vishay light
  sensors currently supported by IIO.

Testing:
- Tested on a Raspberry Pi 4 using a VEML3328 breakout board.

Datasheet:
https://www.vishay.com/docs/84968/veml3328.pdf

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v4:
- Fix PM_RUNTIME_ACQUIRE_AUTOSUSPEND() macro cleanup scope
- Add mutex to prevent race in veml3328_write_raw()
- Link to v3: https://lore.kernel.org/r/20260530-veml3328-v3-0-dd562eaee8d9@gmail.com

Changes in v2:
- Add additional IIO_LIGHT channel for ambient light sensing
- Remove separate dt binding file and added veml3328 entry to veml6030
  yaml
- Move driver to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() macro
- Add missing headers
- Remov redundant mutex as regmap handles it itself
- Use regmap_set/clear_bits() instead of regmap_update_bits()
- Removed redundant dev pointer
- Edit commit messages
- Various code style cleanups
- Link to v1: https://patch.msgid.link/20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com

Changes in v3:
- Add 2D array of precomputed scale values based on integration time
- Fix chan_spec masks
- Simplify read/write/avail callbacks

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

---
Joshua Crofts (2):
      dt-bindings: iio: light: veml6030: add veml3328
      iio: light: veml3328: add support for new device

 .../bindings/iio/light/vishay,veml6030.yaml        |   5 +-
 MAINTAINERS                                        |   5 +
 drivers/iio/light/Kconfig                          |  11 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/veml3328.c                       | 422 +++++++++++++++++++++
 5 files changed, 443 insertions(+), 1 deletion(-)
---
base-commit: 7b84b1e9dd850a5c9b55e27daa4ecdc2dd5b3431
change-id: 20260530-veml3328-d2ccb26d02c7

Best regards,
-- 
Joshua Crofts <joshua.crofts1@gmail.com>

