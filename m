Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5C3DA7ED
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327656; cv=none; b=lcm00wtXr/0kjOkOQ56mI0bEYrRmtS+FADrJajpCvNqIXky/EVpPGooGfuvy3bNu4WUi2caLKELFdvlisSVUcPFlps/NwG43b8i6gWgKhNC/g2gBH6HEigD24j5LipFPXrBGA50qkrJsFA6lawi+UNjVVn3Nyc6JfJIZn39Xx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327656; c=relaxed/simple;
	bh=RO9rUwD+0ipkd0JqnII+Jf2Yj+dHGhtTa3lOoj8yHvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5qKjswW209zfBbOMoalCBIUZ3MMiTa7eE4Py6aKa9mTZwmPYm6IR71XeUjbBCprOA510R0TaVpk31WUWPxC2VGQG4SyIFzO9GCn3OvItOGPXFVUOKldsJKtRE1lZ4VIiTYJDBpNfOGURPZwCB0pFwoyDJ1/7LtAR5AjEMUW11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZe1LB15; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZe1LB15"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490a765e68eso12909455e9.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327646; x=1780932446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=lZe1LB15zDOyCrIl9zZ8OJzr2ou9/4ics2Fh96N14JEMWYJGea+tBNlKtLBR/CeiiV
         cBS3WHb5pMAzOz3ilFAzD0wFb1fSJnftNeUETRzKGmx805azvedYGmLCc/TZnDIdIizs
         SArOIzl0HBVqdPunrOJkF96PkZhZZ7rjfaL3TCLlz2cTfRu8Zzq4OCF2CMddqw8q79Jb
         ZcwOvI4r4Qw2pRt8C203Hza/dhl5OljOTcdQLenKpPacoMbI75Na8elrDb6eJCTd5G94
         VqVWpHZWxRPqIW/NbmL/kUYg2FeH5ZU8jB7Qho0gogKYATazwAaX4j/6+KzH8/3kcwbD
         GoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327646; x=1780932446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=m9ez1qhVQSWdRDLegungjpBl3PSqyRUR9gra95IctSQthDn8xpXVsYfZxgiPH7rm63
         bfRf1bPl3/DwYM7MnQcjRLDvVJ3omMYE9lk2ClUHvJ/LXbc1yuOIsoBBKXmmeezKcvtx
         nstf0U/LNYTotgsqLwPxTSWNaI9VKzlkK7k5aoND1vUHSUz5ezY6SHpc+GbReLrc0z+1
         wLGg4pWwI6u/eqYRi73RaKKxu7QxPIgLDzB6tMqcf+xMuWT+YS9+MYNBvMJqCabnd7cm
         yr0CG+iDkCsMiTJxPTj30bfAy5LkOrz1QghM4FMKwMROmcQE3dbISbJ6nbF2BnO6/LlF
         UF/g==
X-Forwarded-Encrypted: i=1; AFNElJ/2k30OJq7NYcIAggTsWjqM1o8qcZsNPSiXN0o03GGD5JemWLan3Iu3NwPknSGTf4ni60IP5hOG136I@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbY6nhx4CwW2XnJ3GVrTVGRWKKX/DdhcrDTnjA0UwMHGcxHuT
	0ACxmoL45og2FNWLPOtkI62gTdxs4y4OTYLidnO+ekvE3U3d3NbGLTxY
X-Gm-Gg: Acq92OGhFi7TNg5d7+GX/x5hfO64dQpniibUteWEWORwE56fJIwZOPsrFGZmp5ivbly
	l+pmBKAIwRXwETm/P+/pmIU1SJFsDqJ9OJHtWmsKs9qxJrYkUG2zqclkWzdAGqThqQHGdGl+QBi
	OJ2ut/sK3krgGsaySLIHWFY+09yY9yfpo+4AnTDFJXnJzUZ2Cf+kbpQBnO3zxtNoQrLZWA4Woia
	6c0VjkGRr+iRIROPf8Q0zwoqUuQX2QY6sCCzMh65t9qeuNzCnQ/+5UbkpEyh+BcGj1IAa9AgsAs
	VhFSVRFYdyUXpZPeE6qWIj6qcR8/EKL3eKDOFAiEIGim1uc+XiaX/j8hx+yXz1qn/uaKcDLim7J
	37qwgmgNLEKuGI02pZyh0+Nf0h976BoIoYsGWdIVlPNuFNJlUE8jo8QvCW4KXFYoCqykd+UwvA5
	crMzArfgultWvmbeyE17tf+yIbv6E=
X-Received: by 2002:a05:600c:c285:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490a2966ce7mr127746435e9.24.1780327646037;
        Mon, 01 Jun 2026 08:27:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ad63b34dsm14041635e9.27.2026.06.01.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:27:25 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the slew-rate property
Date: Mon,  1 Jun 2026 17:26:42 +0200
Message-ID: <20260601152707.29039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver for MT6795 pinctrl already supports the slew-rate property.
Add its description to the documentation.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 68e91c05f122..9a937f414cc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -152,6 +152,14 @@ patternProperties:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
 
+          slew-rate:
+            description: |
+              Set the slew rate. Valid arguments are described as below:
+              0: Normal slew rate
+              1: Slower slew
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+
         required:
           - pinmux
 
-- 
2.43.0

