Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E34457D9
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610172; cv=none; b=SXTT91i4CMv6B/clIDG7Bv1PycaZqSyFOG0javrYhSDnpf9AAt9Xd1ZGXgPLQHErHRJUIxRpd3o4R5vxE9cP8UlFhpZ7oG6GvWeI/WhRNBsdjQCnX50IjxPKhsTkjcxylzUuNShZvGHA2YlCTzyW/AITavNF1EVvUXb/oK3rhVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610172; c=relaxed/simple;
	bh=ToC+qrojIElPVEor8Dd5gyGiOeRrIzNZay5S5+a5o+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Alrf87kO6wFTTBrOdgYcHTubhsvjnQm8TNGYP8aFmtHTS+rLliZ+s/isMvDHab45b7aDXNbwWt8OUylHmRVF1gXto0w4LWFmASk9qTykNT+7Krg9EvwCuxZkktClF+bMWnrZceQmZThAkYDGtHejFNT5UFdp7iobJCJcXllbFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0JAxiTN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0JAxiTN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso4879605e9.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610166; x=1787214966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=T0JAxiTN/Jag3xnjzYMyTbdVvZbBTNpKfyatM8D3v4L79NOtPRzqN3+P/mzeR7BqyL
         2oDAhFs1pcMxefNE2o/NjvJPU0U9NWgNFdQxV8HWQ9IiAoQwIJEMptkkcGF2TCWC+b9q
         1QqHZZXcAYnacnw2qJkx3SzJJi8QrUaXHmbFwBPpe2LEKYIi9lXHwKQHzbk4XUUneyvI
         uqo/QPSttgmDJKgfskuLeU5rH8/F42FD0OTCbUnIw2xQ352j3VtIQGndaWoHLRwAd6n3
         OxxIyMnG5ZPjhLlYIIl0dk5r4lyej6ztzspYgyYUvnnq3CouYO89YoVR6X55F+9Iba9r
         Um4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610166; x=1787214966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=MNWhRajmafmipAAM3RibaDw6TDjladOSEQAcQSUed53pyQwA93bw7HaJ3C0RBqgXyt
         gb2r6EEDbi9vuw3prTciNzDSgvLxXEAFOTmPbyWhZ2H9Dnzf1rhou2vkG0SkgromX19k
         z4hUIOuo2IAsoDUvY5I2OObj2odq9WWgd0ljY7mCwult+OTAaSzuX5fSV5SbaghRC9JY
         hOvVVYsnc92mUivzers36Zs3tBwM8Y58jz1Gdg2FkieXw3LZv/ZsnRx3uD3ttuvcl8Wj
         o3K6qstU8URR4cmSIBX7B7RdahIwSWdncqkFujYr9Pjt5WH/lmVDao3MsrMPLAVyST4b
         BP8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro9blyvnkxSwNOdscopgoxgLV7LgP1iF55lxkrckndW0S3uGLceLPxtHi68fmyisHCDGqndwkoOzUO1@vger.kernel.org
X-Gm-Message-State: AOJu0YyEU/o4Jm9kF2s9EgO6lwImEHgazPyJchw9PhsjPn8JTrh86WVM
	pJbi0HXUcw6qyB0jwkHxE3s+nZrThatk13aCXB2ehrGSBXH031JymllA
X-Gm-Gg: AR+sD10e7znt+ktzHKPC2dzKM4AuQ232gB9ZVln0N6BPJscugxUjkWygJkbjGk11kzF
	CW504wy1KloJE6G1DBJ50thTidsGtMUMSTxz/a2jnbD2TwSVrqOxNtvYbTReNkAgECCm2RtVhNK
	tNtCrnGF5H7cJfeG3T4SvhbLCmmXT7OlyvpSLQTNxgr/YWab7L64W6SJBN25Dnw6avaDfFr9sup
	MQ2l0jtGjqbEv1AupuNYM4r7aXCxVbLDN3yXi7QtUmyfD8yc6nQUIWDJMQEXLX+54pFbpQPFa+v
	Pcs1si8tKqbBrc8MHop/v1XRRylMMbC8i4weYO0TimWjjua+UOppS81lIW29lqkBkuP0eedK1MH
	LuCcV/rnaFL0MJLESIzOYhw+WgbRsDhOljpcLXHVMm33lb8CZjAzhCqrJa+w96Zsw1Vn97ejq3C
	RBa30khIlYMUVObFgdiY5k2oK8JWyPLP83jb0yza5OdfKCbFrAUq70FXFOb+VsB3bzZXtvcs+q0
	60HeguvSg7ArGXvi9uW1z2gvSjCnB8Cn3QDnvVF0HCVlkGy
X-Received: by 2002:a05:600c:474a:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-499821bcff7mr43640125e9.4.1786610165898;
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
Subject: [PATCH v14 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 13 Aug 2026 10:35:13 +0200
Message-ID: <20260813083536.970196-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0e7fae5b92f..04db742696ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,6 +9690,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0

