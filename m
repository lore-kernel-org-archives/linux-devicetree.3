Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EEF32B135
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063595; cv=none; b=VZl5r6AT4QgGzCzOMFVqp+IfUrvudVtpDPpx04cTwoPrVZMpvPxyn0fW2fwyXdsE5bHMXxEh358E5llOVygQfD1+EfJvceJyneB+6l1CnRkNG7lUq6QCVcq7AbNxFWWjk7+6MS0W9eJLnu/YqZytNrqpmZtn7CN+7eHDywlNsJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063595; c=relaxed/simple;
	bh=F+jC2JZdLctk3NBnz9HeD4OXLJBXRAv7UNFVJjBhlRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1GPHarzubDABjpoK9WDhF61yWoIrpnK2MhjCiW9YixSTUgSoFibQTtK2JpchAWNHA/LLXLdIZvcZhCsDYsVmj5HkdDHEArnAhE7ytd9a029rhSP/51A64TGY/k7eqKL/cw3ZDtzkGHt6kX2UTmJ7WgShj+gyhwydfK+yiXhAo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOJuZ0MJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOJuZ0MJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so8349330a91.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063593; x=1780668393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=rOJuZ0MJ3itvBL3EHYETS4xhAYopOaEz1+CRF2RY97ZPxhXkalDm+f35L6LtBysX8O
         Bz6yjrZ9jiSkskd1Rkqpu9QW00gttHNneW419RgzTq/gKe6u7t6soc7PWS6gEONwxQXw
         qrdyFFgFx0e8SSRFBEa1KZSrhMDpz3t/T0o+wpbaw9XUV6w+5HE7YIgowvRwIvPCLRBZ
         9Z8FTXhvDbaJ0bEL2pFUsAgWQmb+3czIqBnw/Sv8GYjTyQo6ovWWeJYZYOCEA7AMGLZI
         /c5hmQ2gL2f2h5tPlulW/pI6o8IEGx2syJItkDI0zmx6OgbhcL++fDdWQFI8LMs+QTvG
         wslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063593; x=1780668393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=HtmldmIuLUYEIceW+JJgnRgj7Nom6YE+gWe/Gm5lGULgjpAoZ8nH040vPDHgQG7593
         Q2a9mkr6/nCK2DlltA9kG/uz5TA+CdighVtn1hjb6Kv5oe6Nrxu1XgEEQhf4bK5Sg+lv
         7k+v9y5bd6SahfyImyCSo/wKr2hJzIBdWmpyUYKxie7cADCKReeu3R3j/AO+zuoBs28H
         aHvidB97dqzqDXL7ry4aLP2HZO5DApnRjqHViafUc9tSLKunWBh++MqPOuxz9RLgtK5d
         P6Ri00D/FjxvMCLWInv/fo0PHU7oOoN8IkkhD8H2gLRQyB53pWvyxuoJ6Wi5QAR+5iqW
         rn5A==
X-Forwarded-Encrypted: i=1; AFNElJ86eWx2JeJG1UnstMULGNs/DZ+O62DiIHCmimlSpXMyHN0yK77+TpHhTESgGaXaPGU0szD43+PbmCjX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3r8WGZwF8e58iZ4whwghv5ucu2QwZcbaRDd3b2K9VecYXVXGe
	TSMbz3Dy48V7K5AdpKOQFVY5x27Uv9HYXcIObwlJFVUeTAFvuZQgnBfj
X-Gm-Gg: Acq92OFklGePAU1qtTvRNZ4csaGcMu29c6Q6KcV/Gka6SgrijvpsVz1RUNn9JY8UQjG
	wigds0zWB446GGXu/xk2ePrEab9Dja7AI1zwaJOXq0KIZryDhBwgWAInAVyn4Gg7E1QsOg1w9Hk
	vvmxpb2nipYQMBjJ0f3HhKRIrv2flQos+Wc7ZzLs8+HOtgQTsSCRvTXnZuJabFIe09ZAUPJaBRe
	N+W+mJ1RIseMJOsYjFSIZ4iSJRIhZOAzBLLGfeidOJ+AiuMdVcHvRHkikv7ofkB5PDfOi1zwhBM
	77t+zdaRT+H+nNWKte5BAFflmvvL4zZfwm6xsZsO1DzcpgqHtLxWIJJD9vXw3zf2ZWU8axn+oI+
	Gj/Yt7KIaaFckavvAGZhQB72MNi835AwtHryn4fOYRK6maEeNHC/caYN7CNaUnKfBbLCB9Iqxuo
	YYPcVoxyqKlLYQpykY6KRWWCrQnJWnupJQk38hTLuedIgNofDpkt1EDnqPZXrd
X-Received: by 2002:a17:903:1aa4:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bf20be24e6mr40686275ad.34.1780063592523;
        Fri, 29 May 2026 07:06:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:32 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Fri, 29 May 2026 22:05:59 +0800
Message-ID: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
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

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.54.0

