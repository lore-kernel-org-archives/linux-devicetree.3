Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA1951D51F
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983973; cv=none; b=M0vlLOb//yyqLUXG/v9SJi1beGpl5OI3ae36A7GdXF3wYkEQk8/RaNKJVEkGrao0ip8YZNAPvy4mTndfkrC4gsC8Ar8JBWMsE3WjOQjDVlxqoFRUNVSFMvEFyO4IKMaXmslssbzw/MYtzSdMGlh/a522xHlyq8vB7YByZEVFmaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983973; c=relaxed/simple;
	bh=i/s6KUBdap9Z3Ok4iOwoMoNKoc6aOT96NXd4ABGNsy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xdp/BIiad1ieMGggfK5yxCeBWE1tmGxqCvRiMzfb0th8dauq21ycpvfcgenOH/+eif7pb9nZbk2Nuh1IRJKsjqTuA3FBCfCK8tPmwBMaE0uYS63bPifXctj5JNitbeIx91Orr4ESSeDeDdC4A8PFl0lH5LFVA6pVbNujDUnFMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wdka+eXG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wdka+eXG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a17baef589so8798875e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983966; x=1792588766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzahybzV+rPPTOVLReiRhlUbRXkC0hUx0uIZGUpCKiE=;
        b=Wdka+eXGvuwwuF0qIhHa0UWiWf70k5VrYiUkTOW+ewo7fELR/v+iuJiaZ3UKIL4C88
         T7mikbizahWjtEDmnCA2C7jCXz/qUEcZ+yo2znZtwHJ/P/+T5ZHBzfs2n4vp9isOhF/4
         bVoVkQWpvPxyGi+HPLTGG1sVlGQhX7o1KTj3KS191xdm3XFWr3A02zXcjzJoFBQc0C4q
         9ehdLOrfeNmGo+CaM8bU3Bt/X7WOBS/ZZG6gwWyrFmx/ldI8FSFJY4o69oFqGmI5FdWB
         KjdMBFuiuL1e0yzFrTjxu/R13jJkWb1vNEODwcWuq0PUsERCNkOIrwILoj7qo87b2CSy
         Dt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983966; x=1792588766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzahybzV+rPPTOVLReiRhlUbRXkC0hUx0uIZGUpCKiE=;
        b=YBDWMnF8bYBvjoAZsBSWhV9yNswTH3XVP2Y0x6zQ4yNrnwFdiAE0aMz58GugmDpSkv
         OE9sLMqTfq9uClqT4xhYJkphSEOhTEBC34kPG3agIv8H0dJHSD0wdJ8XbF+izugLAdHq
         8i8bnWdg/4PqaBAlK/l+/9NglqFVPxO2JG/NlB5mfaNg76pnqTShUSKClWLL5jA799ot
         s7JzxIKcSwFEW3ahANEP2aaaKFtX4HPTfllNSylUh07Zc1LtyK57NJQ/Wg1RpD+at5FG
         Rc8ZYDqYO/xryAnYv/9fHVloeICKOBQ7b/sUr3BcZGKXDGWQ41kxYiRjDwq3cTsoCwl1
         gK6g==
X-Forwarded-Encrypted: i=1; AKwUvBz2YvuEGGKT0LjAeoEZjgmQxmYAhPJwYlUBrYyVReZ49j300N4dZ5kg6bJ29LrtuO4JARbA+Q5RUt9F@vger.kernel.org
X-Gm-Message-State: AFq9FYJfg8yMhI2YwnSvk1L0vchYkvpNogQy5Bwx0mRLC8RpOVzlCjAD
	dCbQ3YfFgisNAt2oxv1T858SQyDTjDcPwXq7tOniBlsqouNabx/5gmD/
X-Gm-Gg: AYBFou1+0pZXB6p1Ad6ACAv6IYWRtVwgvmMTC0KIfIS2w3zBDS502I/Ng+bS7NMWPIc
	Pxyc6zSsfFwff9Uat5Y8wLfWBRnsTDr4vSVFeEYjVgEKuBD/3HQQwxW05zOyMgLC8s3uEOhGynn
	0/359k2B8ttNXNWUhepOd6apLwYRwIL5ba4QjvOIuF8zXntxwgVm2RvBFMgftM2F+8Ih9I3myGS
	AzCiK5cOXS6gWcH0cOAyO/2Scl08kVA0X/k95aDtMH+RdIeqg8TwhFiSV8pO4nqcCS5wzxGnS6U
	NXuIG4xHU2I2rC+ZKDuVKmiTMWLXJsb14pJMZZ5qy6xso3pOvZudoLugSp7ZFYZDwjm1jS7rKKA
	ldqIvjuJBnCPcwOExSyn8bhKK0oCujrM2IBvtOdVOatF/6++wlto/y0upSH220PvWkn7HtlA8ic
	v3fD1+9g1BNKD/bgF/AzIg5tFWPsaVU6lTdp3gwysbDfoJC9p2u2kbVST1TkPiMhnuqi4pw+gjd
	CKIHkvjqi6bmZC/baysG2aEyunrnDICx6fuU/6G+NIxWkXZf73wAkc7TUjjewb1djtdvkxcQZiP
	h9cvsCQIqsiMb0eqLZwUNDdybbBP
X-Received: by 2002:a05:600d:17:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a196637a39mr222910695e9.34.1791983965675;
        Wed, 14 Oct 2026 06:19:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 13/13] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Wed, 14 Oct 2026 14:19:01 +0100
Message-ID: <20261014131906.990077-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index fe8cd5338fda..f6894495b9ed 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -101,13 +101,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.55.0

