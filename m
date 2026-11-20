Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134367;
	b=E2uj5h3FHJ1UR1M3y3ltEC0FcMDYZHIiIRVNu4wffb8uAHjg/eX+Pl7FcErCEA41im9M
	 ggIR5FzgCWPnMGrf4fD4cQY/PrlbuJvXjSgnQi825ua2ZwRVjRJAcCXow+VByeBDnIOSD
	 gYsz653RHBtHkFbjUyCPI6YCkRWrzeAaf8D+as2SsK8HUdfuw8PtsTZo9iR+DfqEtpDo4
	 MSY+E3CLxBvhA8AKQ79Mm7W6B4lvndpt2/Zq+x5Z+PIZyAZD67rMdOWaCKstP2tGcWre8
	 WMoQ433Q0wbOE2Oo0DzYaXCS51cHtxam8r2fR7foxoLVJICH9It1BJ2AUKevkqJSq9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
	b=VmBYzn6tmH0V/ux8pF1JqfsRJnWYKROa8L86zER9yQ4txO6hUEMiksRKpyJho80r+T5x
	 7VUJsu9Qt55ahcKzIQ3dKURVQ9XD5Ojgs3X4i18Km3zgUTEc/9p2pT0mhJ/JcbYmFUuUC
	 vqEJ9Zv0hPYuZCPewBa2i5Pr2aBwJypl+Lz+B0vJ6QJ3PGPln7CVcCZFlqADzd94O+eEC
	 t8flRcQ7H9X9LvvvSHtCC7weYGJW7jSq5ZW1roMXIKvg32XaucY7T8nvy19f50CmJhipW
	 zWm5yTRwXugLCSU+pDMsx6v90iNpUSAqNpDx8uXhii4RJhyrF3KtfKILzU3zp+TcaQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WEJr/Xcc";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4FE60A383C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E4FE60A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEJr/Xcc
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so156872f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134365; x=1795739165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
        b=WEJr/XccmnAH4kdeHeZMrPWCd8ssbOQXMdvRUebc2cy558660ef1r2TSVgqeZ9HFVG
         zmfah62UoIvIb0aoGHg3YuxpGi3toodjBdwRazY2yCQfPJFcP0dpGMVurL4RXHBxzdBT
         FPWTO7Db6N2Q9fjFIRuumapN6TYi+OTlcR12gTbRKQ4KvgpvjtEtsNrnFqLF79jeaXrc
         XnHtwfu+eQe3PzUvgArXx78AM9KNkOucnwFyh5I58YMZnmNvmol7HOxQ9jgR+1XIY621
         460IFhRDH/SkdmoEQ0y015RGcWjLyfXukK5GieW4U0VDNGH/s9snuaBJz5CLqDo381PY
         TqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134365; x=1795739165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
        b=GpQzbj4VRjsdaRFrv8UMKyyHppCJOTMBy9ficQ/tGBRPILHLpcPE40DbVY9SiF0EaT
         nz0SFJJw9MH0YoXw4UQRNebKDT+mFheFmLW/MeZSl8Td6v6VUMiGzkLHE8cKaN7YEKwc
         TO0hPNg51c1UF8S8OASdMSldGzrCi1kEy6TdSrQ4YwISkneCi1WBXwWV3tO9/zoKXahT
         o7sXiI633I7pZtxT6QM1Yl8TACkCjIn6Wd6wTssn3WHDe5THCyci62+smSSOu4GVXUMY
         ETjvYjCKYd6QU4AcicQ1ngQ+JkM6DsMZBS3wbRXzvt0PFaRq6WOrLyrK6+Zh1u+MGB4s
         ci+w==
X-Forwarded-Encrypted: i=1; AL+hErHiBHX3APmlz1G1CJyRsvJF5gIlSI6uefDTK2cC3o6JjPiR4feLpOn02mAfdnpjGVGLJT4bCzRUo1Qc@vger.kernel.org
X-Gm-Message-State: APuU4Z95MNTe+alETlR+7lQTUtwNfJiCS11Gm57TYM44cnIf0USl5eed
	w1UgaXjFQeZN5NE5UAeIp49DKEeZARw19SURkx2BICDIvyT18Z+s5pdZ
X-Gm-Gg: AZFdTZdgukLsayBKWhyPmW1Tttbt1s8tUE6+A4l+z4FQBYsJGfKTKW+07e0yri5Siny
	z4wZlJHK1b8x/bG12VXiq2opB1Rwxn+ZHSdDvPomkgH4TooLLAYTURm1swGtgT6VlX+GCRlZnuM
	gMIjiS/MCI7sBRT1qXgf4OQmnWfDGSnUiS7iHdkrUPHN6trhQgiFLjP9U1IxyfRLEzWXPofL/6+
	MUjVoT9iQeyk/ALmWvqWV7KD11OKFJZDe6QZrCovy1anH7n47GKRLpXoZFLZFZgxthSN66pT63b
	4NVUDaEs90tZl/N48WEL0WT+eS9Esd7OOJjNBV45VXHWvFdBjGDBpQzjomvM/kyeyVwztLJW9Tr
	Dl6vDwHuKZAOw+aAuG6GELDZHKedFVlB4Q2je3+vt5AB+tHf+yHol7xepEq3RJslFKszePPMEaC
	Q327PMLiCZH+OhahM2Zs0q1qlwDv0hzYLjaShw0kuIWXauW9UFwiIZ5r5dlgCilqO5ee4uWwIg/
	HKnrmVbvekBaqeNg4VBSeXuwSpvaOOETLA6P+PMji2zRso/3TTmNICVcu2uvbtE5lxEU2Tv5E0E
	ZJjzFVPZ7tmhH6Ex0n8FTVAn2yDUCnVPUxIRCHxcmhjOol9JgFr2rVAm39/4mYBCaOARqQHhsjB
	IANvu6RvfruC/f+gcC7WGWVEIed6l3Ly6YfgjY8T48VzQlcdC5fxUmD+MTLNeAGRvdRpelQFQGw
	==
X-Received: by 2002:a05:6000:29ce:b0:4a7:1fca:e52d with SMTP id ffacd0b85a97d-4abb0e46a88mr1474050f8f.9.1795134364578;
        Thu, 19 Nov 2026 16:26:04 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:04 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 11/24] net: dsa: rzn1-a5psw: Set driver data in probe
Date: Fri, 20 Nov 2026 00:25:21 +0000
Message-ID: <20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

a5psw_remove() and a5psw_shutdown() retrieve the driver private data
using platform_get_drvdata(), but a5psw_probe() never sets it.
Consequently, both callbacks return early without unregistering or
shutting down the DSA switch.

Set the driver data in probe to ensure the remove and shutdown
callbacks can access the private data and perform the required DSA
cleanup.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index df3b3f75b489..0e4bbf34ec27 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1221,6 +1221,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (!a5psw)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, a5psw);
 	a5psw->dev = dev;
 	mutex_init(&a5psw->lk_lock);
 	spin_lock_init(&a5psw->reg_lock);
-- 
2.56.1

