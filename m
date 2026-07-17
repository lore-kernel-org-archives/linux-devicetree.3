Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05942B300
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299598; cv=none; b=HfOw+lmJTWRhfGfK7PefwF9uuOIrWkV++bsXxINuUop4vUj2YQj8ZZQ3gl+RprsUN0lP/STqfYcwEMlHf2PUVr6J3XHnBlnKAl1fjQPNtsman3H+AC1R1+6EyJP68HvTDfxEQT8i45zJ3/k6ONqKFVCCD+cT47a95ed5kYctAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299598; c=relaxed/simple;
	bh=ixkgzvll58EwnzL/lGdtgvLL6jYBX9D84ZvdIlb6Ou4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWatp/9qYFQP/UAG0zc8owX7KlYWLsTeTHicQMmqWmm+wwdJd9+zUHHxc2vR6oN8njqyd929yQWFSVb1xIs756RRzA8zLklmajQI5nNScY14d99ylioO7c3EVF0aeYhxRhn6bn7pkLM/+8XxUFeHVfqsValmSR53CtaDMmLl+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Okebqm7J; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Okebqm7J"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1831741b3a.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299597; x=1784904397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o3dZh9zqq9+zZ7JPhqXE+Eca2HPClPUfYtgFmQz6W4=;
        b=Okebqm7JQt32k8j0rMAGlFtTWiTmWZ0mWLTDea3i8ZQUy1GFANvG9Z6kQ1plfmShkg
         G4elK+Fd8tsnsPqHd0GTTAQWGnNnCxSED4yae82axwtlilgPSgP2Fkry+Iiv4gzvwT9b
         l+W/OTQx73SvevJ17jqpNVQKW90yWEYXTFFLWvbxVKlWUo/5F0x6lVh/ra7B4ICKTvj9
         3bEkDliigbrKIacfycPnQR8C7o/3bBuKGNPe+8mMU387XuzozWNWHab2mrsXE4FgaqC2
         0G1WX6f9lMSBQZ+ChVam1ItgJweC0j/vkxFlvzcNj9jl8uwaAvXgGZBt/T6bctpPqbjc
         PHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299597; x=1784904397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o3dZh9zqq9+zZ7JPhqXE+Eca2HPClPUfYtgFmQz6W4=;
        b=eKsD5QcAZPwFhmvlb9LwF/pPbW7NvO00HX0l3b7snycwqklU0saTq/uKCAUzYSlW5n
         cYxfbaTfe/DqdPGM4x28aoWtkRQRfMJmwKIlKXkYsgGsDXCNiXLN06r4YCfQV/yufrI8
         YoJpFaXgB+2DYIdpEKv5lX5ZFwyVYtcaYbWCCg+VFYZvMJh8bU1TZGxBOph3iOHRFYgm
         lj7uezK5m/MpjVXkCU8P4I6ZAGnxtGlo6+YJR58Pf35eTXJQYwpQUg2wLUb6A1yLnDwL
         8RHU1huSE4tyROKBls0lXQW3RQYDMYcfik/ZKdnDzG0Ca2tK9JHle7IkMU+Wb3XwNi/5
         1euQ==
X-Gm-Message-State: AOJu0Yz92QsyrD3W4SyAjIlBiFCzBmHRXYc82UHTYFfbtaJ2Zfpreegd
	b2wZZJysRJAaHubrgyU/Zx72KXJsy/cNakkmfROlyb/rTSRoA5onB8Ik
X-Gm-Gg: AfdE7ck6FNrTHAyDWc7PiEIKqh46J9zcwbMIKbWcCGDtbl5f/hCbp3ZHOMjyCBoch32
	9/rpXJawpGzWaAPrTZtgvYiy5PVpdn1Fkt6dL3hV/HspHx62liBagiqQRZ/QgxbyMe4AIr/fJxu
	K9UGLW0YEBpIqKJ5NDko0FtDq0kW+Fx/LAeACD2vp0T7XnwEdT1RymNagVCutEipvSPSq14Tw0r
	AlNkgu42l+LmW4HScFAAIMHrEkobChqShNaByYCFhHIaf+bCnMcYM2FCtpEujwHmTUMXs14yycR
	Qmr9MU3nB+NTwG/llHUllMEy+7/Q+SXpdziwAQhthSJSIEJPMjqn1j1ejyuxqkvDIlZhxgYJdFX
	CJw6igjQO8Lv/g3DwkteV3RVjUkM0da3fH5BxfDHajiK40kvEoY0nOxdHGODfK44ziCC8GmKFO/
	886cuQ0HLa0sdF
X-Received: by 2002:a05:6a00:230a:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-84c28c8a48amr2886697b3a.36.1784299596675;
        Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:26 -0700
Subject: [PATCH 2/4] spi: dt-bindings: spacemit: add K3 SPI compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-2-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=ixkgzvll58EwnzL/lGdtgvLL6jYBX9D84ZvdIlb6Ou4=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAxtUuTQbQ04els6xg0viY3Kav7HvVOquYiR
 Q4CNG1TcMqJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpAMQAKCRDN9pw2gLgN
 2P83EAC+k0C4tFtTKpZdl/bbU4UHfehDpILZLb3mqYViEshXC6KFuG2Ie/4fxrbpY9AK1cpBJgx
 82iMabr/2xwl978GQDFxGQ+wtVvW1AViOr1zZ2JjHvgFEiTlpW3BaRXBHbwsjHWjwlUKa0zc0Ph
 fb5uUzVIfC2vcTi23OWeK9YlXMDA2xFc8OSgIBmFqku/pE24D66o/lPV9OJPbezYWG2zes7Llid
 mS3vtQDDBK+6p/jd+KOoNgtBTOv6VcfwEsh3Aa5JOkCIB+mEkz1W6Y9ZhHLd0E6kU1tjsMmGTxa
 G5nj60HIh6MV63lB6G+F8NFaudyrm52XUXLT/UE/R7w6SZqj6h179FPzeKadiqfP3avoTdjEveY
 DBc8FoUB5/fj574DC9RCZ41p96/y+Jb5EbNF4KfmFXDfxKdGSmlrISuKxO+Cgh/1TvU4U/pEY6E
 CqawX6XhGntvZokXmFsyeeS0lWvbEY2Ag6yDHGxKDojiJEUfOr+FhKxrhH+GJZ8crYdrdlibYOt
 ++WNPhsVQv7Bv7yHMcP9auStsqabwwQqHst3s7pqNSEmzW/r/HZQGxbl0nYVSkGhWBKy0uNhOvI
 SR4LQK3C01mWXERHYdeXJPCO8hjZQOqbjW3y2TyBFpBf2CcU7Ql6HSDBnopyp17qJbPaIFHL5r4
 g9lnxYOY/9d9k5g==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

The K3 SPI controller is compatible with K1, so allow K3 device trees to
use "spacemit,k1-spi" as fallback.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
index e82c7f8d0b98..5d86cc87e4fb 100644
--- a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -24,7 +24,11 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-spi
+    oneOf:
+      - const: spacemit,k1-spi
+      - items:
+          - const: spacemit,k3-spi
+          - const: spacemit,k1-spi
 
   reg:
     maxItems: 1

-- 
2.53.0

