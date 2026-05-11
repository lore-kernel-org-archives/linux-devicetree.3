Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A036C0CA
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497892; cv=none; b=EVppYGjsSIekBb1MBp9h/+zqb2GJYPKiVtBYEIq0uGAndHOxfWzZm5YYazobFQBhLhdKAFVsxGZULlSmIazw1nkhSJlKexd7tNbwkqpOL1Yj9l8zrjHwzcUg4Z7Obw8uDBVUwFBL/uPuJP9obKIOiGqGf6xFYYNQOJcF4MofnEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497892; c=relaxed/simple;
	bh=So6dtc/mtLT18T7lCE47WhNd/bbpowldVBDhemYpOdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0eghaZYOZlYVBmf0QUad8zEmmJXLspprZtMQe8ekVpMRc4uWrLz0Jnr8ZvpB6nmxauo/M4Ndii6iUoV+j5N5X2eBI4jhNREVHgO2i9ehGBBUB2RPFZYr33xwyZdUU2ai/DdTYlGFdCqc8fyH0kx92mUUwYcoDJRhzMieOadbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/4r3Shx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/4r3Shx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so48988625e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497888; x=1779102688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgBb7+HyM/yF2DYP9WwoCarbZkeV4f+jLfQyPowzDrA=;
        b=X/4r3Shx1GPLvDZ7qRtegd2phNuGLI1F7ND3s9mtc7I0Ah5lefdKAAfTGNfWJEDpnL
         XXejBu5tt32Pi2oObxgRpUC7RVdzd+tHQNm8qp6yM+h1fIswKV+dg0FjD65Ndc+v1CMI
         a8a7sZQA4HMiyBsgQcdr/QwBaP3pH1VgR+yzU5uLKHyq9jJm9rv0wmYoa854oAi2dAEw
         QIXiU7sovF1/yX7pAY7QO8ZCn7U2WLWZVeTIC9fTAcQAA5GN4NsP8v79atypnHn6Ehhk
         lRlUoYlCwzPEoun7rmHg/XUswbkNGuZv9VsO0klN96GQ3gvTv+ZrrmRJXHR9XB2XFz8h
         +2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497888; x=1779102688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgBb7+HyM/yF2DYP9WwoCarbZkeV4f+jLfQyPowzDrA=;
        b=oXU3mE+VkLvEndX31tqrNuEo2Lu/CdsbCjOIpvTEzN4c7wnShe4OFZiU4UXAaiZzJN
         vT4I5pPYksx6WothY4QOz6jtloAc9cEpPlGTtx1mNpHQlkZBxoNFUSdVICSakKnOaL2V
         pFoe2T2WFW87n5GfFKxkgW5qwQKvyO39Mn+/0zKpXEVjTKTSCiCJjtH0fvnjdbnOIEeJ
         wvdIL0zmiNCYV5tMiVYv0hHq5ak1b4h12lhKRElQHdZx0Yn69tWESOVEyte0nMlTUQiU
         GIKMoP6W/ZNxXt4glOAsCBx7OAekpvBtIQ/uuyAO3u1h6KokmjVLFeBehFCF/v4cVAhb
         JwFw==
X-Gm-Message-State: AOJu0Yy/+8nm3qJNCNPl3s0CgbkgUA0m9WDwH4mFEIRHRA4/hI4JEzfp
	hplD4GThqBzkm1kCfkyIwdUQiWHGTix/gg9LllihG9l5v8ClT7CiAjXS
X-Gm-Gg: Acq92OH5mHluTvWzBgfgAYNfD4/F7fysnaMHmvAYaUL85GAg6XB40ftF+fwLD5lRcmF
	zG0GXDIobVWrLrBSm31Vfv6kriuH/KkTwG4rxBvWNXrNrESR8I6bvE9wJPRU8aUri2xozJGW66g
	rZjZSthmSsHoTC2OqHjA6TKGHYm9dDXqjeWbLXLE6S3TcWk0IuEGtIGZBm6Sv6eu+pE4uMcSLK/
	YpG9+TQNXnxNSCOkLWbYOnMsRHewPPRLK8ewLSFz5pHZ9HwefYsAP2WB3e8sgyTTnT2Vxi32Sdx
	G7Q1u7DNaTh0Lv8naNC1/JR9CVPC03msfodmo6RJAWljMt/AwyiWgY7daFpKvmKBu+sJV5NRKDJ
	h2yavz2r7mnS5vxRKcXSy9YKEvGPvPKMyrW4zX7Zq9nnlmZvjB1H4urM1nF+50VztdCNExd5/vn
	p8yL+zsrj28XgkxNvlMFBhzpXkA/Bdg5JhC16Mm8U6wbzFIXo09/C1zoVsdmVm/eOzyw==
X-Received: by 2002:a05:600c:8287:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48e706c0827mr141592035e9.11.1778497887546;
        Mon, 11 May 2026 04:11:27 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:27 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Mon, 11 May 2026 13:11:13 +0200
Message-ID: <20260511111116.1109643-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 2d3e30f0bd806..c8bf776511c94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0

