Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F3400DF8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475110; cv=none; b=niR3W0pD/wzcVnqdHAolkMz1h34hSBa3zX3xhxpFs71mWsQ1/RixXgfkqSKUhvJCMbV1bPCtu4s9LD2YCRHcoJ3ONSxbVDq2RiX9hF5wsg4dhWX0piBKDp1DPgpN9uzOc4Sy7lBa2MrobqkYIYq2UdE/smm3PFEsAKWgfOgFrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475110; c=relaxed/simple;
	bh=H7Apo/wyT1cuOzi9mmTzmIGJyBfo7WIHLat/+zpVFzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6c6EdEmsIuKyVitGy4w/TGq1rJNEm7m8j1AhGaOtse70OUB8Z6lFPzxpb5VUvzFekMMixQOrmXNYFb03hu9wqApIZnhDULxq7zpzbhYvzAlF6b0bxZNoLKHfrVCIgRkWkFxkxLjfppYHCrMgebonSEqpzXlUP2cgIL6sQRRYcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cue4EPr+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cue4EPr+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3493962f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475107; x=1781079907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=;
        b=cue4EPr+oKZRTHXsrrJLrFx8F149cWHiSjayCJxbNBwcZucVkjiryx0oRISEELOYpC
         qoR8I4uKcDieWv7R0fajlJEM0U4dwg7DvkLtIIwq8pDeoNokkHJUwr85PWjKPC/K9Amz
         kszFTYLIS0cmBYLH5HFiAaCGDKQTetIv/QiVnlvkadAEy+AlQrTW6+XD6ZO9dWjky/Nc
         +ybNQOQNuGpX+KA17fKE/5QVmpOCaOwH/LA6MTJxi/QQghAAetFPX9O7CdF4R4LKv8ru
         ++oF2884RudyAPmNXQ08K9Dr2imv8VGor/CR6piQ0xp6CiixJClI+f2iSWEqzKp6b8Em
         aiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475107; x=1781079907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=;
        b=KMvaD0Jhh8jx/mw8rhmqOunqnhvVZlxtvVua9SpX6yqSDIuDCdvd9NsjmtV/qSglPI
         p2uSLTsw5tLRZcePGE7tIp8MSjP3P2kyduOuYAmKLOPop3n2KV//Q3Y9w8n6TfryP76q
         CRzlm47rzCfOy78pKBWBddFoeEYv9qW3YnL0u27i4PQUJ8/GdW5fTrAPrwA1kupwxy4d
         MG52DWeGKiD19O5FmDoRedcLILHj3cS8aKScHXrYLXQBuJXrt+gpO+RhHHTwLlkNtuI4
         98KYecHhCFknTHHC7iZ1IBnvT5aBTUj8HTcY+ahoNCVA9hjJIsKQ0ED0MPM8AQnfy9kf
         J7RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Tlv6nCUe9V4zwSI5zvu31tFfwYi/vkpyBtR9XyQtlQYZcxz9idp+I0fiu+gwh19lUke039Aq0HV9n@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPzN4cJGdnWk2PBVFm8WIUO4bpOvfy5dR0warUxwuoLl2dkW2
	O2i2tUxbWF2OWrNwWXGyeg+4rP33M9UEcOAL2K8y95uOkZtyaIRmuigQ
X-Gm-Gg: Acq92OF8S4uZx8OLnxjs/v7BwpPTgDTYZ7VXyTrWxGFbDreqMm+oJnvk6j/gObhHpUr
	TTUSVpN/iuMvY8kNoSJW2vf6IuRB9kzPohfMS6cxtcgyWJwYBXQuUeKPLUQPFZzI5Kfle1GvEv7
	DUr632/5nzHeD7wEKa8+p1ZOlqlK0O2lLjjskfrQOW3fmLLYzo40g8kNb9IAknrE1xvCobtngHZ
	XGKGsq2Qguq5FFEUCllPIQteDPNHty89tUDLB5DxVD1eI4Rw4Ybi37UqYi0YrylKutmethXKEQa
	n1Uc/B/t/5MXzPMseA3DfxaDNrALpkqU/ICvAmmQ7F9tjALwQgL0cUlp04GaeiDhCl+TWd8qvyz
	HSnjHGtJqTV6SN+SlyxhBLS7vLJkO+Jf8+YYMQDq0T6LjEuyi78sMJa1Wzbbv7FSP/V6fIUHuI7
	B2EfwQiduR+fxv6enxoE9OO/mleY6yO+kCaGQbm7/gxwN4RBc85DcdwxX40PUIEljBwynJMthY4
	cdpsAsj+4jGkZWJ72jvfjbP+dDAzZNAGzvHiYmLvOU1QCwA
X-Received: by 2002:a05:600c:6290:b0:490:b9d3:a9ce with SMTP id 5b1f17b1804b1-490b9d3aa4emr14885625e9.30.1780475107253;
        Wed, 03 Jun 2026 01:25:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 0/5] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 10:24:59 +0200
Message-ID: <cover.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

v2->v3:
 - Use reset-gpios for the TPM instead of a GPIO hog
 - Add ADC1 support

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

Stefano Radaelli (5):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
  arm64: dts: imx93-var-som-symphony: enable ADC

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

