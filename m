Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47230E0F5
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366647; cv=none; b=QPygIlRpv3GxD+8QBuykzfvTzaqWtfwwO15l+m4WOCkxAvPPjo4NVe6JzREHnvEVOFE107iv9bnYl5BQbBARKu0eV/IuCEGXQ/8BliveO/dOg7rAPrvIKaHhiu9uLG9sMcW1ZwhBVKBIrV26NEerexl/4YJy0RicRTcS46XeBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366647; c=relaxed/simple;
	bh=tIYbPwBNRzf4MU6/1kcaWv3czp8UpZVwpenUBXu7sYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaCGXs0AYNkv3TBC004QF7kj3U1QKheAB2W3b9y5WsBXmc2LzSUPPRbuiJIID0qXcVsNKPuWpWGvVvRc9JoCnhbIBNIlavmaP56Qhq73qc7NDPUb4Ommq36EUVnwinpG6OTw6460cJwCuTec1HRn4tvibBH6zW0QUum4Am9eUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYuHzv3t; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYuHzv3t"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccf6a63a45so33725066d6.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 19:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780366645; x=1780971445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5w453nUQQLD9tjxflFUtfWBEuj25pvmqXlOYsO+hXg=;
        b=iYuHzv3t8QRWNkURqGEHYeuTAw29DoKGwzm/OhnF4mfLtqf+VAE0nGemGSKo3vz1vX
         PW14GWU9tezdXyu8+09itMK5HY/ILNKOCseFRl8En8h1as7Q5M9GkIuAq7ZYmqHH8V/N
         6YqqP/21Jw5Dy45TzvWNyy8snfdTfT3iGQkAsvsHtslymw+sJ8kfRa+UdG83yfq/f+Lu
         hRB8XxbbOYk4+OC1sfYDU7ytA3uFYRFuZnHpZkm+YLoh4yPD/Fvif+dOQpPpqGIWUzZo
         qYk+Fij5C/P3cQl9uGLc/bQxOvVeD+7ogYN+j6MGVxLpoYq2aE/ODnEra89ju74KXHs6
         Md3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780366645; x=1780971445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5w453nUQQLD9tjxflFUtfWBEuj25pvmqXlOYsO+hXg=;
        b=tHofnmnjst6yamWhu9Lu4op8xD+HhoNMlcoq7HFLfbh9t5eaV455KE4/y8HinFN/1j
         WllgJP6tb76h8+O9wSoftKxmAbVDcbmuEZLw1QDvOqfsy1YH4BlrF5licvqqlvmzZK9J
         inW/iQ5M4xWd54c+87QDFPmhvQSeuWbIGUAnWSrO5V9kH3XyxPoLhdYPZorjV6LFFRUu
         KkjYd8La17p/w+zkH/PXFK8t8cD6EgEXwnG3cKTm3ufjuVikHiCyvzNKWqNKOPBgcQRl
         6VYU5RrJfaulmaKIUEszPFrq7rlHdnrtXQrxqpbN6QnZi94ypgZnWkyERggKxwhYVYhX
         9vXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zvVNcUYgEZBKllBfVOlXkin65Id3TgvfIjIWXPa5xe8XwpJF2HLJmf/To10jQiRSJozMU4dNBGiVP@vger.kernel.org
X-Gm-Message-State: AOJu0YyVBdRRYoY4YF7DQA7ugFJZclOLREo3BPSGI5bF9elo9sGq7sT7
	r846Lu64T9KS/otpBqbA2bp7ehdKdad9MQj5cbClCHUSjPVdr+vGIr8N
X-Gm-Gg: Acq92OGPW2Xf1Zs0j4XJ+NSAMElffc6ZX6wbCuZ3XmIXys3Fsm/qBAAmNcXXG0s/Dne
	FN9aLiwKQzSazmhO6WJPaTWrOi21v9RTvY1imJHqkfDVn05VkKEQ3qyWeAXQYV96mPdY5h438wq
	RpJGN9sjL6L6Z9pve7Rby+evme/m7xVcwgpySgWdAWRHg92+WElCAZ3CZaffZfmq05MJRYAPOMO
	RQjU91rF8fuESxiQTzgX7XIfY/us+BTvLynZmKOnD7jpXC+Q1q4Ij0r19TCr/L8liEW0ZFgfCzL
	brgd0Xv1VGUhvdGv15pUo3OD6tMAM/gC4mt9Ra2QDa+D+8riWU1FsK+cUB/3GqILbFwOw/jBHNb
	VKqFpTdD8x5j8r/T09Rb7Awc+BB5WXsaFeJloyeBt/6r3LLOo5n3rZLVzha5neoSLomNoOEs3dB
	SLl4upWfwF3M0uyNgeuDBHcQc4VcsjBIDzQ9Go6A==
X-Received: by 2002:a05:6214:4905:b0:8ca:2413:607a with SMTP id 6a1803df08f44-8ccefb25d5emr247289166d6.5.1780366645479;
        Mon, 01 Jun 2026 19:17:25 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea227f2csm106233896d6.40.2026.06.01.19.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 19:17:23 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
Date: Mon,  1 Jun 2026 22:17:22 -0400
Message-ID: <20260602021722.30760-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
GPIOs. The hunk in the original patch was dropped in the commit because
it depended on an unapplied patch, which is now commit fe9f4a46895d
("arm64: dts: qcom: sdm670-google: add common device tree include").

Fixes: c4b423835ee7 ("arm64: dts: qcom: sdm670: add lpi pinctrl")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 0f57b915186b..b4854801a5f5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -522,6 +522,11 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	/* sensor gpios are protected */
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.54.0

