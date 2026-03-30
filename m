Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5203C1408
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868421; cv=none; b=JRCE4oDWRIowka53EAr7YYa2msKXWRw4fKSEudkfYqQw83+O0r1wWj8Ok/BSp9lP+ZzoVjy2JP58aCx17R9Z7qWICIEu7GxAQJmxcMyNEUoga6Isz8guSyMpjACYCaBtIrinGp2veIeK+kKGQrwcuibkEPbW+7AltXNLrMOLJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868421; c=relaxed/simple;
	bh=lpLb4HjSJFrUnTI8yCQ3LK4PAXTyG5T4IYB5jRLZJ+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RG3XpLlALY07MhFKJjmEq4EeSIgAoxpy00mIawf4SOiFk+6wWnvVJO0gA7FnjqRNYkJfx2sCHujESu3ysGMozOvcIb74sTPjTclpQIe8itSwc3K5gcxV5pXG5IdezJTTG3UHCSrnXhpZLDtUNTGI02RoqEXaeI6JNMM3IWBO/ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0kmO/qh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0kmO/qh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so41520165e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868416; x=1775473216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMDzjZ30wHK3T8UVTh8udjeVLznnRZwGJY21C+J7AXs=;
        b=F0kmO/qhD+Pw6mZ9xe4yy/RSuXeK6tHNn5JXaCZdcJdosZe85IW0IrDXnnrT8tJDeI
         yzlG83317avEQg3e8K1q0E9M/AfSKy2X94Hznyh8C6tQ3m25lIrsoU3EIlIwmMWqSHO9
         9EcX1mwDJhzFXvFV7VePSw/WP4rl0ZxTV+Muy1qR72M5m0sgPaSKkgpBwpXR1ypMzhav
         Of7ISzCFsrxuel/FCGhYcmiZH7+CMMfu2/kU8+CxawP0cjenN3GurArrZnn9auha+Dgm
         cGmcKa6RKgGJD46DHC/9Lfbrt4ZSOEHn0Nu9nMr2bObKNdg3A9AaYdSTigfxlbzWcutl
         XiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868416; x=1775473216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMDzjZ30wHK3T8UVTh8udjeVLznnRZwGJY21C+J7AXs=;
        b=ac3WN8KkZb718/lJIb5lHITIVTf3YR8P/Wy8vej7kMzCfBa9KR+/iBaaSwq9mZKK3l
         xfPX34S/ThfvMSDGUG+IqD8G9dBdMQMRbNLXeGzplAJu+c9Q/Ewazu+xKDdbODiXgS2J
         bAPAPa177+FKz/nnvqwfdbYYFjJqgY6VeZ7BEKhFRi8LsVo9n4w4jXe8cgVR/0L8Zlry
         i/roLYJgqPzJLS7bfIg2gtIT1MGkiTtNGZU7IuqqESXSKdav3MEKum585dpx77M68j8q
         ILvDFBpZysCH3iEngn9x8TjLSEsUMkIdZ10g3FvQulCvu9rdpkwGRqo66TRzFCKO9Ujf
         qGCw==
X-Forwarded-Encrypted: i=1; AJvYcCVysA1bSidjvwbi7qmS4FAfnV0yQ3rMzhl1RScCdRl5RyEJqeM4UHuNgI4miW6orrPy/G+d5R124Tl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxAleVnSxO75iexY4C2VCwsRGxbSyUJmTUX6+WD9MD4HpqLdzWz
	O1Vsd4AEc3TOiUCCLP0BVt0suslN65sUM1Dh0RujEm7Haq0uNsCBACYf
X-Gm-Gg: ATEYQzxCtKeb1cVcI0FeDn0JsYQ+uhCZ/UGbomze5H9WskGx68avEpacI/Tq1PlnJSG
	HfE+EAq92BnGycBMuirbwYBkDW/tOCNEvi55iv16KSg5dPc6XxlKzzeFn7tYnf7uR1VLS+L4iax
	0AB44pgalQ26u4MoDZe09Vnh0hLJE0diSjdKi0WoHDUI+kyeO0EBPkPNlE6guoT1o6BjLTJMJWv
	d16SjJNC9TQccF8ySHjcSrDAHKyufXw8Klfc5gcFYFDGH1/6tDsAo52gl/F0hfIHtF39SXvmAGa
	2sd4JOE9a87ofdCRJbWogW58cnogcRpmbDv1ksAVw+1Lr9AzJJvGh6+dj2NSzbdaSh/wfZQFQtq
	0gALJtHcA6obFdzwdnp3HwIBgzwtfVpzWId8RRxpBBI1RvoNRil705KnCvsxHasKiIwaQZlgwRO
	pfTAixNCsqPYun3kYbQfHbrmNRQVmTFQ==
X-Received: by 2002:a05:600c:8b70:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48727d317f6mr206040635e9.0.1774868415295;
        Mon, 30 Mar 2026 04:00:15 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm477557175e9.11.2026.03.30.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:00:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] media: dt-bindings: media: renesas,fcp: Document RZ/G3L FCPVD IP
Date: Mon, 30 Mar 2026 12:00:10 +0100
Message-ID: <20260330110012.131273-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The FCPVD block on the RZ/G3L SoC is identical to the one found on the
RZ/G2L SoC. Document RZ/G3L FCPVD IP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..86b176a634e1 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a08g046-fcpvd # RZ/G3L
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a08g046-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0

