Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE7481FC7
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997197; cv=none; b=oyeLQOU6s5b/PBCA7fara5StO39qfV2n99mERM57zqG8cJAwyzUJAuXueFXwtwapfOboq0KpUgerGzhwH1wybpQR+FleJRWg0oUQIftNPht+joE1Q2p4I+lJaV5LG+yjaI1PacIzd1QvJ+KyNjF3wbecRwdp9oecC2omKN7jog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997197; c=relaxed/simple;
	bh=UWvZJMVvdMQqYBPk16YJKrNtxTeNJqcgBDsGBMVGGyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA5IITycY6Bpwt1HIqeYc3u7MymnBLoh2kzvYhHgGpyQDbqA5r6yQDus38CADqH5i1Z7bNO79yFUQBJJtje+XOIleVfuPRc1AJ8JwKaU4rmzrCkA0dAhxiUOzkj4POH6PJecK7tLl6Zl8/w2oFfQ7WoIdqrpgZNQhIN3LDRm6O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr3KFva3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr3KFva3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so69822815e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997194; x=1778601994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MKKxEhH/PG8dHPKGObXTAHe3ka75aRhCwPBKx/xAmY=;
        b=Mr3KFva3jrrlXEqCsx/VoWpuIR/R729qpYvKjefywOt9SDtwRoJJqDH7S6BK25ZqL2
         sLIb64/mNg0M64F4Gs5PUjsEzVvNo63btyNdvzwvn+iUnGIuBgQ7cuMIvMZHKkBKrdXP
         biUj/EQESKgXmJkWD4MtTEgf0j4INY0ewqlUP109M37TMHmSP7VDbYdB/jyV0XLoVvBk
         NA3z0TaAFSjlG8S84Ed/wrIj2jcbSjUNQAzLGdF/dZyVx3IPPsQc2XtwVMmn2KccIyZf
         uZwLY2hAXSFspV6c6lz2E7Ez491Asau2fh8O6dpW6hvmkpGVCL6AQn7Cx8gvwhJk6nFC
         x2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997194; x=1778601994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6MKKxEhH/PG8dHPKGObXTAHe3ka75aRhCwPBKx/xAmY=;
        b=gGXo9YI4Ish6aeET0AncS6pW4rBlWziua14ABKdD/4XMVU5sLj5psN8+br2feI793h
         tzQhr6qVG7MHB5WfzAkrNRXrijHRJdOa2tYLp/e8mSuNAwshTmgjc7v9uI/ND+/TWGMV
         pMd7nuAkHYGyZ1L7SK4kMvDZIfISsYxkq88AuR9E/E/KtW6XIZkDfrYkaJEIwlj8PwW6
         zJfii8I9Rd5JEyO1beEu6W58MFeb0/5LjG/wx8V92yrdxlROPWkrj1MMunhEJEn0JRet
         rA1RErHaiBZ9rTkZ/zEv31oewjOYEEsDfBYKFGNkE/ntL50jNA55fzDRXF0bN997wzjI
         trYQ==
X-Gm-Message-State: AOJu0YyfRi3bQbPtJAxKLat1bz8LihyPM2qQsQPf1LzxbFpMeXEat2ZC
	HvKjbwc6U+ySrRHsr9lVAScTPPHVIIqfSTYWUa5umbPRQ9nDPvmszgQM/o+UVBXG
X-Gm-Gg: AeBDietgcTXKqY2F4OH61BPW+kVLJN8NMWuSkXx/4cIvlBn3bU8l9fYJmBggqABlGo3
	d0SKZIuk2diFe/cIVqRWKOMd7q4y6Iwt08Tms+jyCQNKTnitqnuLtHqgzNWv11ty76W1Z7Byp8K
	P8NyqzopppyLqxOMx0aUOV/H/Qc4SRqXkw88YCC9B6XOnsTBnsvJLkAtVyfF7R//WaqnfMwLKiq
	OqXxK28GpY6+wPvQEwXsJRDFfT+453cCm21yMMhjLoN1ZcE7gCYl5BwUzmZXmXSo+s7puH8pK2T
	Y04TWZWVuA0+ZDxINXsEz5kDLm4RNUWWt1TNk9tOdBbRj7XDtKIhume+g1n+h3oB25qXuUtpM3n
	XCFBq7tPfT7jAm75oYO555NvpOpzKprQm2oJCTu4izJO60lK7Qiz0jhkIlGvyQT3tDyoggHjF/p
	3D5Ooh4ex4N4XaSXZ0AKiojEzxn9rkMBrV92xa2hO9SsdLAwMnne2ikryYgPLW/tnPcuv+Dv3VR
	9stDtQ=
X-Received: by 2002:a05:600c:a118:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48a9865e188mr184980115e9.14.1777997193775;
        Tue, 05 May 2026 09:06:33 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:33 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Tue,  5 May 2026 18:06:20 +0200
Message-ID: <20260505160623.1369347-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
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
index 3ba6244952b63..edeeac501fad7 100644
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

