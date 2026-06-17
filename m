Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318244E021
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708610; cv=none; b=oILZzpbqJ0Ln7P5ljP8WVHYEWHwcacZbRmRxT0DDlXonUM+kIbzMZ9FIbVkxdSlpN+6YlZH+Y1ObakMX0a4cK8ChzuCsgsJPz+1m3Rb/TkISf02wWyE1Ntitanuemei3uo7PNCtHgosRs4COjGhiOsxifG3Bbm5+yYqLmp1Z1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708610; c=relaxed/simple;
	bh=qzyT0dzNYNRzCgv3FFeDbY8FMLcOkX1xXai2XHOpIog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAlfZHw4fY5z4sce79sWypjGOvWGIz1FzmQCp+saoXTbVCwTjrlnlik7izE5SBBoO2Zo3XNEthAjbWMsFOeRACRwD+Cn0vQhUyY8uj/dvZI2Qw+KgNz/26Ao07Fq5LQcH2s6fVD4k4ltelNEtNLTnVv9E5JTWFaF07W6R2tQUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anCgHfDA; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anCgHfDA"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-662bb8b1f93so1715523d50.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781708608; x=1782313408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tOnNk1sZYLOxT2mttvm70Wp3djDGUiIpBw1iucl4JHk=;
        b=anCgHfDAclc2V4UxZki+xwFGDlx3HUXFyn5hz00iJ7OaLfXWU4Kq/8+jRbJwSKbQqE
         4ys1TLKCA2+eIq5qt1k3c45lPnrHAx3eUMAtu26K7GZe6afVpGSEPckK93H8q7Hns0AS
         85ggMzH9hcpV5RIzTE2oytvriekTid5DTSac4Wtm8Bm61obF3Qe6ZtytvbwN0I8pjc4q
         C7i2rD8eR5rplF8TSCz1o0PV+LTY65Y8o8QTQn69Gw6Xl3tdh2LQd6KdQCtwewGbaXH+
         8xlrtJtZbYBzMmuJXiNaQsDfyLl2fgjUDy4pRbqPy1lheeipN43iIkjx+8UOGnU/rpA1
         Lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708608; x=1782313408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOnNk1sZYLOxT2mttvm70Wp3djDGUiIpBw1iucl4JHk=;
        b=aWYEf0rJZtGPUPNu2Yshm9z6YQR5eU18fM6i7DV8OrE3xt9lvGS+xIAgURpJSZ4Ay4
         l4lUW0N9dKHgL8AJvudSU1y9YD+9rg9zco/TlZL5tBGMaocBIXHz7XLIKQkdFC5spu6L
         lDFpmUEEBiHAAJTaFOUn01fNb72QVtlxrl4D5cjRwTFVNCD9H35BqqQcY2NlEjEQzywg
         XhRTqhzxxNRoPyxlMlTlLqzGcEhnyiux6S/vhM5P2PXyeCDspb8A1kPqBNQhr3dip93J
         UgaP2KyXAiI9zgKLo8Ckl010kU4aiaybwbac+QWFF7bSS7mPn2nvE+yYjQQctChEsW7N
         voqA==
X-Forwarded-Encrypted: i=1; AFNElJ9VAWKgjLouRplsHzShPf4OcTxiPAxcPnRgjdxSauz8kI5AzIAYJPWyGMd+OObHaSBIX83+H3b3hWZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxISoPaHjKxkDfX6K7JsXK8HNHu13BnsYgSfQK3JRX7uirTIT/5
	9k4PWLjaCxGndQAphVsv6TTNBohVx+dcEnWozOq09UGzppO+yBybcly6
X-Gm-Gg: AfdE7cnTmU99eADw8reDDTAusdwcqDIO559O2LxreOuxDvBbh4RoQ5GvydNWNl862iP
	3ejfRdJtvL26aV1R01dXzhaqiXlCrOKrGf0kJv0kpz6yXoMh7HhDGyovOi0jRfdco2xaKCbaP+A
	cgidYpdS2PWEAdsxNU3oUok96vXg9EjrAkrhoOR2AQiBoQ9NCRTMYttqdIoKdMe0LpTt0vIxpkI
	TWsA1eODAaYjTJSRCtZsivV44o/F6xQ7l03ZVlPi0rei/P8TFzazzXxjtJGXA/8NqXEMONbcW8i
	BLCp0sPB2ZLQWHlmZ1/s0MDKZ2WE6MJIIR8ljcMejyOWrBcIpdiwEBfxtAO/RuKBLVqFND4Unl2
	sQg7ovRbvPIS3H7pA5kqEGua1R040hAOqupbEhUS88cBg9E+nDI2rNjucfAtjhKV33VD0WmCob5
	+2IIAGMMbvKQ==
X-Received: by 2002:a05:690e:480a:b0:660:5a04:9a02 with SMTP id 956f58d0204a3-662cd7a0977mr2345514d50.40.1781708608042;
        Wed, 17 Jun 2026 08:03:28 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-662b976e47csm4387677d50.20.2026.06.17.08.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:03:27 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/10] Input: cap11xx - Add support for CAP1114
Date: Wed, 17 Jun 2026 23:02:39 +0800
Message-ID: <20260617150318.753148-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
and hardware reset support.

Patches 1-4 perform driver cleanup and DT binding tweaks.
Patches 5-6 add reset-gpios support for CAP11xx.
Patches 7-10 add support for CAP1114.

Changes in v4:
- Revert cleanup operation for CAP11XX_REG_SENSOR_DELTA.
- Move the LED unit-address update operation to the CAP1114 support patch.
- Limit the CAP1114 LED unit-address range from 0x0 to 0xa.
- Link to v3:
  https://lore.kernel.org/all/20260615142103.352163-1-jerrysteve1101@gmail.com/

Changes in v3:
- Simplified the logic of the reset pin operation.
- Adjust linux,keycodes configuration for CAP11xx.
- Drop unnecessary CAP11XX_REG_SENSOR_THRESH(8).
- Checks for the presence of microchip,calib-sensitivity and
  microchip,signal-guard properties before processing them.
- Link to v2:
  https://lore.kernel.org/all/20260612072237.1177304-1-jerrysteve1101@gmail.com/

Changes in v2:
- Drop LED property tweaks, keep only reg changes and node regex
  update in DT bindings.
- Split microchip,cap1126 LED reg constraints into a separate patch.
- Replace usleep_range() with msleep() for 500 ms delay during
  reset pin handling.
- Add missing <linux/delay.h> for usleep_range() and msleep().
- Add CAP1114 to unsupported enum for microchip,signal-guard and
  microchip,calib-sensitivity
- Add constraint for linux,keycodes to support CAP1114.
- When reading CAP1114 button status, mask STATUS1 to bits 0-5
  and OR with STATUS2.
- Adjust code style.
- Link to v1:
  https://lore.kernel.org/all/20260606150458.250606-1-jerrysteve1101@gmail.com

Jun Yan (10):
  Input: cap11xx - clean up duplicate log and add probe error logs
  Input: cap11xx - remove unused register macros
  dt-bindings: input: microchip,cap11xx: Update datasheet URL and LED
    reg range
  dt-bindings: input: microchip,cap11xx: Add microchip,cap1126 LED reg
    constraints
  dt-bindings: input: microchip,cap11xx: Add reset-gpios property
  Input: cap11xx - add reset gpio support
  Input: cap11xx - refactor code for better CAP1114 support.
  Input: cap11xx - guard unsupported DT properties before parsing
  dt-bindings: input: microchip,cap11xx: Add CAP1114 support
  Input: cap11xx - add support for CAP1114

 .../bindings/input/microchip,cap11xx.yaml     |  90 +++++-
 drivers/input/keyboard/cap11xx.c              | 274 +++++++++++-------
 2 files changed, 254 insertions(+), 110 deletions(-)

--
2.54.0

