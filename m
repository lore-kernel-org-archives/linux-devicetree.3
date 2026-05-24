Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF73911D5
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628442; cv=none; b=M2XF7J+ySkYnxSxxihlrAJpoTnfWc3gEe0nVfWguOi8p2snl2ULZhV9SNM/f75PY5xShiSppGvyBbTZ85TNv10pWfjZcLP9jetCpMYRcGPh2MxBvgYa0cx+WTJDFBxy9AF72S6LdkQ+hH1o0xON+CtP3WHnzhvRT2PttaT4WYt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628442; c=relaxed/simple;
	bh=wGNzlCHvzlwnAIj+zHbs0ITocqVJSpRtaZKTraawJJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKHLCDVpj7OHLTpRwTu/8LToei6Sev/EVV1xUeqPogz1e8zYGyf3BDzBVkGpuAFmHbGGWsjVl5gZ/MZur3fdY31dPeEC5UsjdVAABAhR/D6mfpMDJLtaUoeRV51jiM6ZTul1bvNRhO8EA7hj0EdUGyp2XJJ3p0IXHCtL51gc5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9E8K4gn; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9E8K4gn"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso7387433a12.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628441; x=1780233241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpkOdUQXFGxFQhG6DWzjgHAT1NVWSs4rv/hq+MavDrg=;
        b=c9E8K4gn/LV0viofmYhGSLzuP5aiDTChD3eCA0l9k2ofNWkr0MAMl+XbmJ60216Zcw
         VM1ZtKSW7Ety2AiN4DyOyY91bwO2gVZdEnNQJQm9CeAIwQCOz8vCDBOktkz8or414VWA
         mLuaK8lUhoHfxe3BF0Mi/nv/MVNMgWdwk3+cgkUX/u0QTHTxL+WT17RGzn4nk/bNMWdL
         dV4SX5oxFMugGV7C/p9DYEZodPtfj9aJezlpFIpSdQxvSEsE2Rjn5G9IyCOtnQlqeK5K
         Po+IrB8LQvD8Fb1qKGafj6nQPGHEwi7HOmyH/thA3MAve70I3LUOxLszAtDoX5mEB9yn
         fD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628441; x=1780233241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpkOdUQXFGxFQhG6DWzjgHAT1NVWSs4rv/hq+MavDrg=;
        b=WVHgtH+d05uYv/OStJ8ec3mP7FfaMOW3V4y6Zloy3pmc3ze/zzt80dkuLJ25EmO1Wk
         KpubkVRtgRRB2VM1hVdEudE4OccEbLIUTEdr0nT6rmvbR6ED1ctNqycEWNUG1qvhHUfw
         IBSDfYyxS2Y9ww8LN/MeSDC0V5vTTWSVUijHt949j9sL5bhEFoHxgf443rxT25v70OHd
         5JyDWRKeC484KVaavqyuBV4+f4Kun7tBieens1Rjjugq9tfcbUd/1BtbDpOZP5jKYoyi
         EY3B7iWI/8RTWYLPiW8F1ErDX/6VXO4g3Y6dqbEHS4nydgA624ZS5cWC6YZTNql81bUX
         wyRA==
X-Forwarded-Encrypted: i=1; AFNElJ8fROL9WfE+qBsdkG5lKt0WjfxyaPhKoxznHNpFsg0U0yQqqiz2eKFp4mSssEWk/3klh15LcyxPLS/o@vger.kernel.org
X-Gm-Message-State: AOJu0YxRP+f8nss8RwAPmJXgFo0aDHGHnNGyu9TsyK6rJ3+vB6fVJ/TP
	BlhQ2h7FYM3AREM8jZzxRpc+EIpfrDd+lakcaMqvi1HsTdmYIfGKXyUZ
X-Gm-Gg: Acq92OHuOwSG4aOHmJHVqf308zhA7a+Ej7gIe2WNV9njyyDhIkSz1ZPk0nmeuieFMie
	+lDLP6y8My1HCq3FJgE1Dvk4n40N9dpB3jmrqwrZl9N4gAnYdJJF0Ouw61LTebxlSFdd7ekFpTQ
	XGW8rQj23CrvMhgXJ2K97Z96ks8YEkAjtdeGc/tRSImMaZPJy3VDH5ELJGD8AkRwRWteXnz12sN
	ub7r1vgCRT4hi3Zh26o5hU+iUzO+/rYDdiJbw2g96J8F3ueSO/kXkSKY0nlnD0kfSP/nL1IpSMO
	jsFpO5CfnFQSwBw/OBkjh27JIdG+y+tyjvrEX+fvZiO3aYw8u2OAYlaMomINghl/4X9nN+5WDKj
	eBCAPHI7/fjL6aXZwEoysh6r1dcBXLiR1hQLDqGMP12EjMg7QjB1/rQ9uVleQP3AhCd9SM0jQNv
	iDqID0toyz9FC9Rc5QVgIKRsXCFGQ=
X-Received: by 2002:a05:6a00:298f:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-8415f3fcafdmr9374677b3a.13.1779628440534;
        Sun, 24 May 2026 06:14:00 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:00 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:06 +0800
Subject: [PATCH v2 1/3] riscv: add Siflower RISC-V SoC family Kconfig
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-sf21-topcrm-v2-1-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
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
index c174ac0ec46b..7c412b2bdbe1 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -37,6 +37,13 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA
+	select ERRATA_THEAD
+	help
+	  This enables support for Siflower RISC-V SoC platform hardware.
+
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
 	help

-- 
2.54.0

