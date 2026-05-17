Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252722FA0C6
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027234; cv=none; b=BDLUJDVRm4C/Ry2zHkHVwMwv28WRR81U5e55JQSxitEjeUICz833iQOvR4Vv3aQ25lvyWm/MImTmalB+n7YxHcvEEv4R4g9HSDlu4MBssXgLDk9PN8uRc1+sVARNgjnccUF3U5mgvinZ7t7Ti11oE9zyZYT9RicIV2UwneCYzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027234; c=relaxed/simple;
	bh=u+JI8R2LQAVfqakJyFmBVzSMkc2Y1IF7qqSKLB57m9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQpVYbjYvgNBWspW+zzBVBHDMeM/KqDNI2ZGD6/BLXetrBoYegnXDew5Mg4jk0ntmjMqD1kzAIECeHs0kZnKuzgCBjbGe75x4aIavMJAVTG6bQ7OMcbWqBhTsfheUV1KAkUNI/zBJ4YQArm3mSK+Vz6Hr/TcktM2Ughrw/eoZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiexOe0o; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiexOe0o"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-836ebdeb969so532599b3a.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027232; x=1779632032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seaxzvl1xgZZJAa+rRq0jV+BZBh4vJTt4ZSm28H6Xmk=;
        b=MiexOe0o/pOACz1YfXOHwJdZSr8qFSFIU57wzR5On47PHsE9vYDS7YEYT//524tqKc
         BZGIJiW5Hb3gkAglrgHzm9ij52U/1FZDlN2S9y9ykE0uLlkkWtUjaE+ybIx2NiGUgIoo
         06GEUbyCBM7+HG+CmF3rPr4DAsr1ibHXDuoZNA7lMB+HOAOC/Iyyj78p+FEelUgj2olC
         jquxTZIAJtHzzjo/fn+neS/8Fjw1pnxgGeurcWLPDhR6yq5avG1kW6isXzSSqAERGJgn
         BrKPSJB6qg3mfQrvbC9YP36e97j1TMX53Fu7xCom497w+PLU8zFfVxRT/ZG1XFKvl9vU
         JE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027232; x=1779632032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=seaxzvl1xgZZJAa+rRq0jV+BZBh4vJTt4ZSm28H6Xmk=;
        b=mftvyuxueF8AQ4rzTOZPSjiNE1YAknQ4TrLuQSCbwH1hjT4m8nGLBM1DLfDjOoRfnl
         EsgaQoEtaPoWMiCKfXUTwrKXChJxl8RQjwKGJydOI7lErHzq2/FuTg/senSgZHZxu337
         gAmykPxxTNXyVAl8PTrHlEvoSdhd2nIAj4ghFBHyhiMVEa1noKlmqYs3fjzbgBirO6Np
         rliWU1WXTeE4Al6uAlHeCAEbgpqikquitmqZ4fbty5sFYgJoKNwBV1IZStv9nQi2LN0I
         5VkOsiNXxwz8aQ0nhXCUgDtjMRT+EQMiKnD/wZcYfU+yQGjyrvJh3q0tygeAfyLf5xLH
         cp0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/+Cvdh475tjsA/XTFZzpx0ZNfMBWqcWlQibVTgAGzRAolXn+PjHs8GTx0fxNQhexILlNZNM0vEznIN@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIQy4k24xx124Lmh62kKgRqNiJw9leILK4tT6LJ9azrinSXEh
	sERxDrdcTSbdtnc1Am9V9wksWnSd19SA0BiiUQxBlgX2OtGgbwEOA9nz
X-Gm-Gg: Acq92OHzhiVfrleLpJdSm1StJT7TCZIQtpNX+aiM+x/RnEFZ2pQUj1h/v42ISacuamJ
	E0O4jjEkV1KV37fqttj/J5rUEInUyT4GZsS6Zf5G6xE/ah8FnAtUxqOzA9LvyAdvUcX7hDkwt79
	qyM6w3CJjxtDGK/du6Rvj+JZVUZu3Q7W9hM/SMR+rh8JWa1d01ZFx7F1yiUpZR4PlyQ0jyJ7cTK
	o1cVCjitINnUCqsAeB+8MNlvYHMAiWQwMtnIGio0KrXLu5Q4Dw/ohE6ROfBSmweBNQATMDjm5Mu
	SxjQSGy76ngP9mdr4K+HWVgxPX6GeM469FXV/PlwrsZpP02y0tCKltFoDXHEet0gpj1iiLvb7JD
	9m56Omx2m+xBJb8mPgKEGVf0SJJBvAnR8sdMZIwvaCLdinzR9MVvf/IsW2WPutzZjmPvcFj4cCV
	sN4uuJBYt6auzx2RVFaRIg/PbV8N2/vZd9mwCS/q0=
X-Received: by 2002:a05:6a00:4ac2:b0:82c:66f2:1226 with SMTP id d2e1a72fcca58-83f33d5494bmr11243398b3a.38.1779027232488;
        Sun, 17 May 2026 07:13:52 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:13:52 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:55 +0800
Subject: [PATCH 1/4] riscv: add Siflower RISC-V SoC family Kconfig support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Siflower RISC-V SoCs, including SF21A6826 and SF21H8898, are RISC-V
chips with T-Head C908 cores for home routers and gateways. Add a
Kconfig entry named ARCH_SIFLOWER for them.
Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
for its driver.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c174ac0ec46b..9996591cd9db 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -37,6 +37,13 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA if TTY
+	select ERRATA_THEAD
+	help
+	  This enables support for Siflower RISC-V SoC platform hardware.
+
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
 	help

-- 
2.54.0

