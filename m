Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536043A9625
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485769; cv=none; b=VTeeQRrCluGSy6PFDa9N2vZ8DkbyLixVGqRZdHoXlgEzEan+Segi80Wk7sYx8/tNQPoNAI0n5wyL0D/cxpqXZR9By6wwnHGQfrzl+ZH+LuOkApb9HG203wYO+3uGSY2Tk5F5wYe0w9LhybbOkTDdd9ap997c7lgDV7EME2Gt+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485769; c=relaxed/simple;
	bh=PKFdbLOtezmddcHtLj3hd26ATJxGdOHkO0A6JXK5y1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6qzTVm+5O6i0G4kjLH/33itvjcCzUvd2NPz1N/BFCLLP8qErPeVg1IlIcxFS1WBJzs2qIm2WtCuSwD5SkzZ6aQgxeGgNug2m879pS2JSE4wfWVkFVUW5TsGGKbuH6Q1FrCHE+rYxKYkhffOmwbKCbEVfnxbTJbQ96KEH8u7miQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1muvo8S; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1muvo8S"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so3799338e87.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485759; x=1779090559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B403X2O1b8FGNNeGhrK0Mv2epOELGQnn1++DaG9H56c=;
        b=e1muvo8Slq/kR6z4gGStjHgCUHJX9kUIVl1C/UtK3/Yk+iWHXbKOmntyZfRjndxR8k
         enn4L7lzqqxibN0jq/insFVuwTU8OkyenOMxLGzGScyRDA1aZnTvEu9FULfkgbIFoKg8
         jy0ZTODEIkWMi9C8nRhl7SX9xZx0NJO1PNW8GeZSs/sqcvlELsFUGkxCdPx2O0xl3YKo
         l6q8xH0Ah/zgsXMTMmKE2hj8vFOYAY+/He4+JcstkAKnvnz7OYotzD0cRFJm95WPIozF
         4q1SIt0VSaaF3qR160Q0Wpa1LGbyRmq94DAiIyKDE0KFvgTaTxs9qX0JsHUAXaGSifAn
         LBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485759; x=1779090559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B403X2O1b8FGNNeGhrK0Mv2epOELGQnn1++DaG9H56c=;
        b=s5qeHUY4uImvTbENvC4ExKOpugMC9hdH4WWbcCOmazVHSwwIp/Jd8djeJalFIuKo3N
         wddB+ZSf8d+LfFuuDa9cxcV9133x8f29JFaFkbsMr38xZCFA6bhlcI7ayaVqqH5U65As
         3nWuOlzyRnqErBm4BBIj3hkOUkezpc3TlNFUQks6LtygoPMim6jWYWEZhCL7sCcK74Ni
         tbGw5mEOjDF+LgURgul7+0KXO8QH3dTJ3DIG8Um02Aj75H3lzah4q8PAZOHxq4uwqv9y
         0YJB5C8SVHL4UMwt0AZTlYlnc+3LEM+ZfDzUk/TkZTOhSG7lJExbbiYfAnKNl9syM78a
         +jxQ==
X-Gm-Message-State: AOJu0Yx31x0hdUMW6gBxgE35Sor+HNi1wyDa5l6mPs/6qbTicuLUZ1wF
	9GfPRGOZgwe3zQn6n2UgNRGzaTAElPf09BQ0tcMJAZ9x5bBFFuDM8QNx
X-Gm-Gg: Acq92OEu60ad0+3VKiEV2YysXkEarxKHFuGf5YZW9CUsdLKtPTNQb7q1dhQs21RxPXC
	xdOej2QHXXlndDYqT6i5555EfTk3BQ3dhFUrV/Swgi9frcPRJEL6/QLMgOxsgTEXu3kM7SijVjv
	xrHKpEriqXQEcusN8RP8JOIH11rgY/sjRmBAhREaRGr8ZKvpx83DUUZ43dUQ74leXvUghnw50ZO
	YCfZovLrg7DKkQpx8XWbtw72oR84xnKZXxWkikm9QKYzgyuqjWPGP0IeEa5dVblHsWeXUsCYlmp
	c83SDXl7RTp/zkFYdDv6QeUFtTv+/fNZUF0AhP0LTLaCA1/+8t/5ukJqUigzE9hKOTgbzMiuY7H
	zeR5VYbE3ZmTyMeLaZYwcubLnDkIflWCRqCiyi9Z4koZ6iUFriaT5RfXugfZvViRR8ogj1a56WQ
	is5u8MX2f5Vj24KuWNT3Gzigc=
X-Received: by 2002:a05:6512:401f:b0:5a2:843f:5800 with SMTP id 2adb3069b0e04-5a887cde847mr7386529e87.23.1778485758654;
        Mon, 11 May 2026 00:49:18 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/9 RESEND] ARM: tegra: lg-x3: Set PMIC's RTC address
Date: Mon, 11 May 2026 10:48:52 +0300
Message-ID: <20260511074859.24930-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG X3 devices have the PMIC's RTC module located at a non-standard
address. Set the correct address.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index d2a5904cebed..60e8a19aa70e 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1297,7 +1297,8 @@ pwr_i2c: i2c@7000d000 {
 
 		pmic: max77663@1c {
 			compatible = "maxim,max77663";
-			reg = <0x1c>;
+			reg = <0x1c>, <0x48>;
+			reg-names = "pmic", "rtc";
 
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
-- 
2.51.0

