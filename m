Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F9435521
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108422; cv=none; b=StKQge/Z6MdkB+0NjnMbRwmf5sf1Ff9hkuBZyayF8Z+ucX5uk3T+tDBec4N7M+GmGgxLXojFoJqZ7FJ9Acomhtvx3Rzn1ngPPDHIqWuFDAIUbOyc8I3XBu0QZojDR+NL5FRY8akkpHOGi7+5LY6/A4f+5g3kyqL6wowpcIrq7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108422; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABSNqUHEFsB/vqWz/CPeAZ7YZQ4JHJFtU/tyS1gN2gWojHnNgh8dOcGXhK0z/xy6iGmFiQI/ttrhSOECUx2PaacgV9N/09AftG862C+KdPn2GYDopGnIfedjP7XcRwMM7Vmomb7UXxA5LjxoqrMomKOJuimMF9T8Cc2PlWJEDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDLFDb9O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDLFDb9O"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso25639385e9.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108409; x=1786713209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=LDLFDb9OUtqTDULAEN+XVPo4xCfAV2NZxfUOEtf82LPZyOh7iojvqXfIh9SiDLo/ep
         z2lk4mrP/ghd9/LxHp6YuhttT9Qvy/BjWhC8r/4Y7rM5ICc6ZBuUNDcHJOzk5cBqJxdC
         Kl6XAVXPOskh3CHHLwl2KywqyoHe9r/CNr0JPFo/msrtnrN3UFMmKspwM0VU7r6VJCVH
         3x8UqMu+x4ehaElgrhxx9sHMn7Kp/PD/wBigtpK7UaLGp7yAyEbCbphalum/2CUc2gFz
         l6XxTJNLF53nUZTbocpKoz8lXz18N+jGS+uLmPz2xSWOOgQbWAHkmuqmDlO7MAkwAr2R
         n91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108409; x=1786713209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=ah7oARgjo2oL0V4MJw0vSoZz/599eFgiuykGGKbrVI1X4IiRh+kaSs4KXjWuTC6qS7
         uKKRAxELyBMZxMJPw7gxvf7otset1MPZnZDaV3Czxi/nLPgqNykdCS4nHVsuo2N7DLth
         dSZoVZvLyaUEaWjpPmXKnmaSnLXixSEsQ+FQvvPDTzS1sImFIrd28zpJ5MMNE8akGwr8
         YpXh2nMA2vEFz8KWUhuWvtVVPRNQjTBIqD8Rs5qVNKumjH51+6WB/ZYMid8GQJVZaZRE
         S+UvAxzUMr1nHXb+z/bhQzt2/ZALeXhtnSS3f+IAdSEkZ4CUe9MIFnrRKbofQh05fmHB
         ZUqw==
X-Forwarded-Encrypted: i=1; AHgh+RrciG90/x0RPtsxI+54Cmrcfu0+ESzEyesdvTwz0BBd3gOY4IjSo6fLzhbw8ZeUkYxhDBv03d0nUoPD@vger.kernel.org
X-Gm-Message-State: AOJu0YxF83iisE03qjVuO1xdPYXCIwUMtbPc7Jj1MpOZpSuf83rfCVFf
	Xpc2TFj/m9LfD6pP9L7tyNcRxulPS6iYqlYTE+1A1GbzXsmD69SPB/gUthBoXgvB
X-Gm-Gg: AR+sD12Y2fexibqvn4ciCy7X7DPzUI47hL/BUIPoZPMUZox5AqVDM/adCJRdCJDsg7w
	m/8OtvTI4CUkDA0Bd/Mc2ldIyoq6dr3f8Oph8mowQWA3sz10ZSHfzF9oRCUXUry6XaTUx03tpxV
	2+aIFfKD9C3mdOTBt0ekKsJdhXjdJerEg9r92AuzpyKsNlCSbkyETQns/D0i773tQo6Re68rQGb
	biLS5T5jqcCHqlfIqI7ZrU94XorDwUkkZpetA1k96Us5oYk9GC37h+B1oVR/+z8OW7QdmAmNaVC
	RuGTzPePo159uOM40maLFmq8+mwUaArDFBQu/VcUbsSOD4Qu/NPAuowtjvMTq9WfnkRn00kVF59
	7eMnP8WnEcB96MxAcW2HcDiZgwmxmevNTaswV0lU4ntLAApcXDSkY0Gx1P9wvsINrUBB9KAImo7
	okJeBDBfZW6a8OaDJeVwXD2mTUwkWsYpMye/dqVg48yGfsZ/8Y4/6L8mWW9fY25OrBr5BJOkqQa
	UTtpI6wHwdckKK/0J/YKYiGNbtX8WfLSF669B2pJyBZ0l79i1mJJQ==
X-Received: by 2002:a05:600c:46cc:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4995e085347mr52863935e9.6.1786108408434;
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
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
Subject: [PATCH net-next v11 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  7 Aug 2026 15:12:50 +0200
Message-ID: <20260807131301.192060-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
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

