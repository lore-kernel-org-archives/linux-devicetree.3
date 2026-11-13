Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529978;
	b=sisCEmDUa5+ue/a0/HwHK9S0QcXarx1wT8438YhBxOhcLvUAmAVNkaWpfuTtvLWozpDW
	 nqC4zfMEfQImtmSbUKgpx6zXZPDY/5m+VOhd9Imhoh+p0UbRglTFRoqu9ylULsyT+8vCX
	 CLlmUv6KPa08AFO9FcxqCbyMSuVQzbqARsz+TWD4OWLWv6WMiRbVZBfXCRxBmmWcP4K9W
	 8mWBuwbAcxD4DOn/kMbiQb6D5By4OX2t6hgZMcyzrjJVCrGoiSSzLc7OS40defVMcAkl7
	 pZ5jKyJJVflqIaRR32IKQ+HNR4ch2pEaM1GjvJkmEdj/YYjSAPWrOWqNxMaliuXqCDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=q5Rc6+EF5GpmCfCRZOcvjAMZmHkyp/y11tFQ8ZX1v1FcVHvTBsHqquBbd/T0wxAfsEsC
	 HGQ/SAD7JIwti5/fV0s4Y2fepXvZsZAL2vADPsbHLR2/m3XwU7JCHZoFtV9cbr++zYg/v
	 /28aKg325J4oP7bFxkLdpF7w8r+Ra0V71NXfvUit1uy9Hi9IP80sd6AJnLQYOCiGxSjBO
	 n5eSFxJ1lt+wymkFZxHv6sz69HGVA4K5cYzlCSr6JzAH66u7Be1P/rpY5xpldeTaHjH68
	 hgRv0aK4eOK1KmhS65SW+dxAApZAtFSAJ4ATOxJaO21bgFlEEMJWiqesLCC0d2R5Ywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrTJnggR;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660F3606C258
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 660F3606C258
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrTJnggR
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49a92144733so120789f8f.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529977; x=1795134777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=GrTJnggR5/Vra+g9toBGqmFb+8V9HqTPftyxf4x9DTK+FuD6Qtd6EUde4hy4Axt6wq
         oSAQkU7S9Mk333uC3P/wUgGlh+CTntjRG6HBeKq29sCE9p3cL7T0PvHTv1ZS9LXdTdbP
         t3YiBXe8uNPTyaq56cXLNGx6leql0y367hx22hpGcW+Ndh9oAlWOMFXWE+y8tFXAiIp0
         9V5Q0vryh4eqgzk/KkNYMpyeYgnjl+XQ8v+KouXkc6VLI5DIVA7iuWJQlbegO2kSAcVM
         rfMGlolkLOVr0m7vIlQuOOcakfrER+PsoKPowEkf2VbxRjNuCui2JnwPOhXqHkvdaYk+
         vlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529977; x=1795134777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=DmGMysq3AEs3rrqNtaa3BpXF4Tnsnt4lbDSag84712O8HDTuBEjueoe2DLEWvbgxIt
         RmoASO/H58d7VTwtWJpgv9SDe7jTXF/GcczAwxQb4qtGgIE3I1TikUpxkRKrmwi0F3Wa
         fyGSSZa8M22kfALds0uH0tDleic1AaBJE3KbE2x6ms+AeMO8yQjoYC82JjwYwpsm1ytc
         rdsH36e9XAvKKtCN9DzAZeIUd+y7ydkES4svT1uz431XOqsLgUkrpaB6ztEo1G64fwnI
         q5tB9lEeX9tiGTk5n6k3P5ioPPs/9uxSs5RXE+WHCOvrHiwNriO9qyoE5tWUNp/HD8v2
         KInQ==
X-Forwarded-Encrypted: i=1; AL+hErGg3CxhoYjXTagUjKexd6fKkldb+Lslv7rA7drFXwib1f4ifQHK6y+gVjrLivtgyC3oaBOlFEusvsgx@vger.kernel.org
X-Gm-Message-State: APuU4Z+N8ssuhOCQTsE9Zwd0zGMq2Op7gGXEu5dFnYg+ywUGGJsqAlPI
	mb3MpeaXK3Nzfsh29C2FOvMVIqr+KU3LQscI/n46Izxf5gc6zIEzKtT1
X-Gm-Gg: AYBFou2Tv8QONftFi72NdSdXm+ojwrfOh9iZ+QyfGbJSgrwQKsvovtfzLChahvDnnY5
	PK7lsnOjVXwm/gYlHu2fngGUzZE9p6s/n8OmmIxCLLZgBIuBLaGxwXviot81nJ1jmAQKl8HFaS+
	97zujW+55ZoED2rq1W+2zbCwH/7MNMyhgcZT6yytm8rqqKVjrnnpkvkpopRQcLuK2fBhDw5KCSW
	/lqkdpw2joE1pf0yDx0fG54tPXrVlW4AevlNDeDRUUzzlMCjmbK3Wd01/trWn+yHR8phFUPNlke
	mfuypcVqKj1FAC81txw/51HV4qwPD5Ly0FCJROwIUuCGZ9lGXOtlm/HAZN6J71t2j+kIJeemBDN
	2yb0wNl9CNyRezZNScm0LTJIQYOYTSfNkxJ5sx2HEKi1zyPxX2dbpDUKTTyjvS3O9SrX4hkx5d5
	nd/W2E8dnVUynvHwT5380OPafgYa5+v96BjuWR8bgp+XQP2buvKWg0q3SkH1ZkLodY0/uxU+4oL
	4luxli/XtPm8Vktgw9INnRWSE2EjVn9w8uSWzICGNSfkwMnNQTqiKU0O0y6MTh+oFmbvL8nNMOm
	VPE550BZpX0DrKD051DrxWybo+1piTFV0a44oHd1Fc+BBQpGBvmfpFDBjo2Di0J04kSYNcGzzIR
	nF8riApmsJ2YQ7cNqEcwC1jNGx7XE6aaWYNXBWQas6apxBNLtFHhbEA==
X-Received: by 2002:a05:6000:490a:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-49c6dc01394mr2183917f8f.7.1794529976835;
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 13 Nov 2026 01:32:01 +0100
Message-ID: <20261113003217.197757-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

