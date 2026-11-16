Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846887;
	b=uRpE7A+fnLPghAGGwX26tSnxJOR3qyQ09pfLAy+PcwqaavUBScvnnUwKS5jvrq/3UhuZ
	 afp19dlozAO931qyaLvOr8hyFtJGzvQuWMmehGW5+buM3PCLiLVMMzXo+n0djofXsas0i
	 Dh8IxjG+cbS8rjLxDOimDLZBjLfBVbLkDXNIHAGv0Ms34e3deE2IWVNU8gSxjLVasPyNp
	 tvHtzqZdVj9fh1QdftGc9h7kh3gzU7NkilkYrfbXh2hVz5Xdjkmr9oDuGEVX/H7fFY9Ln
	 0bpA5KcZqMvD5nkyXnG/Tu+ORZoXw235iU8Ww2yR95JnuKCxY+BTdXKkqU5+20IdVsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=0Zq9G84CvIj864ifBTiXKszvq29NcKs50OO+hI+TzTyWyNY4lBHETkC02b9+vuWNprbf
	 wUf+6OyOUJBlhKPLJdFSi3hTQZw7Guhp/2qtXr5UTNwvZHYTmqe9RPBevCVaq630gTbhP
	 jYhRgt1xP5Kf3tf3jIVaVxyExlpTkZ2/P1HlneQ4n+Zx+VX1bt/Xfcp9hd6o4YX073C/v
	 c7IHg1lqgnaXSgLWCEhtmiOhIuvSUrl0FfYUYIajbgmj0DGxWGcdJ5RjDi9/bweSwJOtR
	 mdHHlwPjqJCcMIl+QY/79+ceBisgtYKPbQt9xcr/TpYXAF6lGTwKIlu6nUFQpHgyenQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B603060A380F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B603060A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2022531f8f.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=SBGFb2rsyAC9jD3tKgIN4fbPBUpUflk3N+UsFIOl6hllQuxDBI974ZDeG4zfiA4m3D
         i+1u24Eixxy0zg4L3Ip6vxy3euaXCMj4p/hu0ibsgE7wNq4A9B2t38HnaCjuWBjublSo
         AgZZm7Ko3xEkofFiMYmKJ7W1wTaFPx3cJ3Hde6N8Q1lHwf0QF4YmjoTJx2qh7PcV3sFj
         j1iGRovqL9Q893jbcc2XadWmXvnWiaQbQfFljwjSBqieZ/Pm80eWAcoQIySi5pv+/g0Z
         PVJ6Kyq6k2aV5LLCGvYmP/czJeatXy13/S/cIQKYftUaX4GpEStdHCfNLIGYjObx6tOj
         +t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=GUhzb2AvWjw9UtcLg9kfOUu9gB/QStHhlcuaxAaN8bGKFEUpji5fpltJhdCdxaRxAW
         l/+CXEx8OWUTkgwmWrWiEr9DHA+RZ07YYzbu86P1Ju8ORljkMkmZXf9oVuGg26gse3iT
         Lpw0JTtAjRbF9ZB1WSsuM0a3o3j6l/bKVnYExisChioUCkeX2TzMWsMlZuP1pYC6tMLF
         Kz/ce3ZDwbfqCY2vmTF2PWzYaiVkgUCuw5XJUCZ7/4fyuo1rvIdpX4uV409C31NDeaw1
         M0T6yOWJMVN1JIndBjatkG4c7pH6MjO71XC8n3g5v7Gi+L4BTpG0WwpDUvb0hA73Ly5Q
         aEWQ==
X-Forwarded-Encrypted: i=1; AL+hErG7dI1nrUiFUMyCk15mxbf8w/uIAI8uwg7ARILxQAmNWUiVVVymdyn2x2SVDyhh1ro43zug6o+urqHr@vger.kernel.org
X-Gm-Message-State: APuU4Z+nhSVBnxo/VIt3r94N6h35nBQyN6P6iSIVREvtxDLMUwBisEaH
	pc1FlYq75TdGPpwLy5Q8ZdGuA55IboBykvzSV3kKtZhZfKpWMQ4qMl96
X-Gm-Gg: AZFdTZfyYCc+JiIM5s2QAtnCWXxWNCPCP2OjDpG7LPSUP+7yrd4831u2CdJiyqGx7jz
	j8FwAVHcQnt5dDq5rlYmnAQCtzE99tCK5gUYzZtzRnj0z3RUyNd0JhGzPEW8/+8I/TvKaX1gOph
	M4Q97Ih3C1sn2Y6cp+Fr+CGIdriodzqSZkMu+RLU6E8Y9uCMwATugUjYLgwa14exwEv1sp0MChL
	VH42FqiXp1scY/3JfGOhdyi62hgL4d0Lk2lbJXeyKHz/MdaeV+OiLxaRWfg43pjMjFHJDKBLniD
	W0TEX4dI89swLRTCh+RYbkKD9MTeVTeGvDk8PSdO0Emm4PL6fvA1kQuhgr591hIvrNq5KGFZ8jG
	5S55pSGY27w1/18vCphaG5n9H31qJuG9Dc2trfX1lpiAe8Z6HGJzb0ye5xQBXHIIHKCfDr6hrzp
	b64V4UXmBSMZeH+CSXNMsspKRRx9JqkFhZ3TIlUbm+Uoke14tpKhleSH+WoUvuH4Rl2rcVHkiVQ
	27glZYaSEIJChtrXYsyJ+bMS1CKw8X1ntKEDSpMVCwC0xg/0NXmbHB4ML0QnrJRvqAPldkC6TxV
	ijsJf2hDcTlevrz2HBiulnw9DXSuWPGvua2jslrIe2jrmuAniTIMfslrpAZZPxCioK55R0l5dis
	Yu5vhto+lu1YulHXWWmgjZO8jrfV7QcTwPQ==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

