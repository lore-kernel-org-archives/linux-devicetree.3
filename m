Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152B3E5A2D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063581; cv=none; b=uS/2bbegpp3EBvIMvP4BQkUxPz/Qc4t2F6VkqY+QtrxgGZUhz2BkETu12D141lhutozkr2r7tRbQpeiNI4DmE67BfSn+x4L+j37ZwBXaQe+0LDJNLJ9XIuD2EGDWgnKdHHg0oy//Uvmm6dOYfl2bvznJOuwfJmKj2T2R3zZ198E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063581; c=relaxed/simple;
	bh=emwF8EW3IDXCXh8FAI4icEZNDtjr81MNxY4YJJPsxAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gr86ksBkGtxp6yZsaXIUmqhcXtLE4RBXgoKAy1ojr7avby/S98ge43isYpNIUdV4CfUoimlEok4gKt/CSaOXwbqUUAGeNliejpUMWLWogFDWXB9nY//Nn0BYnpuPWG4s4FfFJDkDmumgNRqwKNv8a8ooxy+z1ak+9nfz7xP4IX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMwX9NT0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMwX9NT0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1160823a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063579; x=1780668379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=;
        b=hMwX9NT0aceEUn54Z/Z0A33aGfL92ieWw/RmebTkEEcuIBzBBbsoDXJmn2avcnzlqp
         Uqbg2+Pyk+o7YTaycSA8P9/4U5b+0U15lUbTW/i3fK83GZdxQ83fwxzCtGEh7QzUeP4l
         2mtIzmpPhoIdk47s9KQHK29ZY27B66JAaQ+mp4khEKdegJmBKuQZTSS7nDwcR4xZKCsP
         fJi6RWz9sKc3Tp2xA/ChHskTqyvtLgd1Qbcp3V5dkFEU9AyHxQ/DtqTu9cL7A7OybrTc
         co52KmzgLevUQ483l+qSig+MPREfI8dR1C0gH6cNTznFwNrid2k3jPtbnOlMpJZPGxss
         htLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063579; x=1780668379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=;
        b=QlTnnrLEQ+/X+Lqrzad11K6d3pk8SFpftY6KHuNKZgdq//QIezfnSNPGOO6wmVZr8P
         JueBuYj+u/dmuUctHaXmfA5cgMfXu6QHlx2doT0fsAO1JkcuF2G88z/gjRrQY5UHnAOd
         X4TIU8y5g78/p5luBE+eZXuXrNBKPayDQEAFprElcYCg6CW87jwVS5OKrdAsu2V3Gmvu
         mkNrXJdGJhOEyhbsr2Rsp8Nobqrumme0QY+VQStj4isRW/lIVuuXgLZeqPjp5ZiUr2fT
         0nYvWzx+a94/HcYSTbloOTWsLwMNUP28BjhHs4OpX0ehT+6MfmKvvnkvegqnj4jLWdrN
         lk0g==
X-Forwarded-Encrypted: i=1; AFNElJ/ggEQ5ZyaLykOQPhoZUpQdXC6AuJ6YyItBVb6R9KOO94GYyCcQhUl7JOEoBnDWRJTFWV3oePAnufBp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlyp6a0VLx2SZ+OIboWXuSTzvV1Yx/Rgv4/SncA1MqUVilht1O
	hw6e67Kcg/TgT9w82mia5aS2DfoNbzNwjL4lD/CeDx+NPYIP6zOEv3+4X9gXrKOU9gM=
X-Gm-Gg: Acq92OE8X3bvXSYqiG4S8yNY4UJkIhOUsmjtG5nrWxdQmSpsU0O4LmJ8BvXAkN4zxUw
	jZf49p0goN4yAM0sVWE20qP306cDxPHKGWkwwEpjCPFb11Mk7qr1zqmCHPwrkrDc40lJom3Clz7
	H22kSswVO/dhrCl47x/kdBgPi8TtNzHAg1fx9fVf05FeXZZHIrZ8r3UTW4j0ro3Fi9/Y1VrZwFp
	+ahqjW+PFbQ61cUgANS3Q5AgCKpx3+IEnlH07pNRcu+g1Xie7ZDwR1jySL7hg9SlkdlqRabxi/3
	4QxAxRZ7Cdkk9L5JE7cE8fsc2Juk/pSoY6/CBRJ3dcs/OpcuNkVea0r/KUOAX2pkDjw1wmR+u1z
	1oWaer+P0kGv0NKUegv8dw6vKA0DgSJpJD27qJzFISV7JAbI0X8ZVUlhpJC0vZXC1GLzRXHggyW
	54k8Zj0aoVbnyg0SjuNex5iRMPSwazfM++CFZHpM4lhuULCKNYgJn+urkKkSs9
X-Received: by 2002:a17:903:2b0b:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2bf205132ccmr42462425ad.11.1780063579099;
        Fri, 29 May 2026 07:06:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Fri, 29 May 2026 22:05:57 +0800
Message-ID: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..b7a7f4fae7dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0

