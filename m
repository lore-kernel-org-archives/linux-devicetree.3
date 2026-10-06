Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4460749E14B
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302580; cv=none; b=GhDBWftplPhOXGUDVodfV+OSjK5DOSA3SgFvUIZKynctHfZ5/EkIJMRWFygO4aGlnmgEi0RMMi1cRML5xHgXj7G0bC5lZPv9n+hl/mjExoVrzzaiCDRejVWqkcdhhwok3IaNWetC1mnO+mbD0dFp+OM6yQDYoMOcD/ChV2bj2xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302580; c=relaxed/simple;
	bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Btj/DFaFGWX4TBM1JdZOYnjEsnVDDViZG53SLsA6gdmlU+yl0Tt5PdmdfTyu1GUenc4+dFaO2YJwSlAjWgesDUrtERiAgt0jHPohJFmtYEis0g4cCI1DahqYZ/Z8flemL2SMmCzEVqloNDuLwPGyWxwOXuKjZeLYpiCDR9oQZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=fnzCrYJ0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="fnzCrYJ0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so8208885e9.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302577; x=1791907377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=fnzCrYJ0bWH/cTkJrT3ILae8a4hgqidYJuaNshNoiwsP7tvsMUgs3rC0qAY6oj5oa3
         +Ff8xnl6qI2b53EXBjkFmGwz16Xq5XLciGiY5dQSpuomQ9y4bSXHP0ds52y2KWMDHwLL
         jR0c5yZtG5xg5YS3N3mxhCmwSHiJG/t0RusvBHuA3NZYMC9I4XtYjfLg+X1Nj515lihe
         071VsMZWFb5G14K+Ytkf0wXX3pHub4dItMa7r0IZpSJgObW7td4m+WjulC3sdUNIjV0f
         dJP02fp9qYKHw09RcZFtnP+VZOVQrOPUPuJfvTnm3HD3SL8SpzH5UmQNW9RCWlASPwq2
         Biqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302577; x=1791907377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=tWEP3XZm6fVw805sEX09vKik5EAGLRHn5dso6a3MgHGtwRCe4cg+8KDo9w7fTD4IaC
         EzZKO1t6eSJTLC84sHiHbS89vvBrqBUp+TTz8FxHHxRCqceYap1OUnemSWJ/Xp5CZHs+
         6mlkhvAoitMLU8xngoGbAlby2sQcM2mmqPFQfMTrTi3PylpEKqBsGwVg88rHHro6QGVW
         fPFVExfiCXrXLiXpQyP5UukPfV4Ej4M6IFeXiudJ0s753HI4PM9Dt7Eb/icVlwYTJ9UW
         OzEDwgnhZZ+0CFARFEnH7qhBAq2wU1a+yeSwvFQsTvu9EZjIuMHoQS+DinPqrVK8jrUe
         R1BQ==
X-Forwarded-Encrypted: i=1; AKwUvByzKVUSewneTAiUm+57LlaDBBHkEZfLvA/0NY/GoSvDmAbDfuh9pwvgF5ojOOQ/ZGGxKg4qm1zZIfcQ@vger.kernel.org
X-Gm-Message-State: AFuF++nQfAgF4FVDJrWoBJrK7GM9wK1AXcD5S/ZEpmhI7rVXQaUSAZhm
	XVD8ni3mPQPcPd3SMQXdnfMYcPI9GTJukBOEPz/F5ccQ5tgRi7ejKhBLr4xf2GmUHLWhuRr6+Ve
	CwZZAfC/uBQ==
X-Gm-Gg: AYBFou3fi+KWwNDxVE2y4Ud/WNBaux0MLEl792/zunKuPj4FBYGEEryXQQNTn85UyO0
	hiqAQijRzJEUo/Tnzuw9YtdVnZs2iNUrDZXU2pFqyYFX3gi0VY069y86XfnmtbPdcnyjH+mADnX
	Jh8lAFYqQp1diGsQp/c+ZDwBjdgVEFBEKTch+Tj+SzQbJ0SV7aG1SJstokpO+R6eyFibUWSAhSA
	3u2SCgAnZ1+ppWzpdutCkPStWShOf2XH4Ge89F258wF/RiCJ6Lv0v4VpBAVmN74TBZcl2Zivgob
	auovMAJIf8Fi8fWdRyYcBOzMXlvXLUEWDk+eAK4B8L11hOOOW0PwotOTE8WsmGGoZrezQTnqYGq
	7kV4CETa7dDBSF7IfqvrSzowkUTOoRGzrzzgK5mNrqayvK/uZBDuGdHcTAIVqacq4X/pJO38B8t
	FL4yg0nxslt2Ib0frOs/Zj7i0U/EsaKiDPE3w16n0EroTP8lGG7rsJ1x6JcI5x9yB9lQgocMnra
	VJl5QFQ6zlV40c1SK6JuDt4XWZFSg==
X-Received: by 2002:a05:600c:5617:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a17b55428bmr21165335e9.27.1791302577573;
        Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:39 +0400
Subject: [PATCH v3 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-1-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV79Nion2T8ozWixZ/6da5aiGbrB0uVbZLWDY+xuT
 90xjzmiYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+sYCR4av2HxfXQ6l3JgmdT1Hc82R+Kv/C/vWRT4MbQ7YwVHyyq2X4Z854eqJ
 ndfnFiB6vAtOdWaY3355/PzPo79LmjUveR88/xQcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0

