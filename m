Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F549250F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018014; cv=none; b=tKnyNnOTptXzDM1yCFsEqqGQTTzNh6kVBQf4Q0f+vCx25V8Jb2KDjEoH8bG3mjHU6IgHnYn5dSrPjaFp7qo/bZG8FPvjyUCDHYnDK9YSq9n8wjCKJHRhozfceuLkKOoAXLvIFSldIDf2PzA1aRTBWPyXihnRbf8Mq5MeWMislIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018014; c=relaxed/simple;
	bh=22JVSQJjGwljeiZ18Gw1sbCII4IMcchJHTBgkArVf6c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BznjuLJEDvjz4p/LH3FfASRsU/0iv64PwveJLCwBwLcljY4FDFtUnBvV5xnrAMaVEU5HC3aQIW72QIVjYYOcEFVxtkgleRwreva9tAtJfh3gcNK1HPmh4OljxlmK2iilEL8MGsBFRHgEV/fgIV8OUJfbQpScX6Jmumwu3eXuqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf1v30Ir; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf1v30Ir"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so8160545a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018004; x=1781622804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=Bf1v30IrIPwEm9oHlDx7zzOMS5P4qy7yDNb4Ou2Vfu8MnQ8cK8kqAVhIEilPRAZs0D
         O4j0/WyErhIlbsE/vubEGh5U9YC7dREUm3Ix8JNDfS+p0IxqI4RcOJBIXE1AY57fxsET
         8AZ5GUmJDxZs6n7yr9TQ+nTwtohKpo6s1EeYcuMePRQLL7gN5zA4XpqyH4qCw1qCljUk
         Z9zzK1xZZktx5H+z52nYDrFnL0sRPPhyFIfV5jpfPNU0qSwLQ2RN3HaSv0ZNJeKhLqHS
         tnOP4EBDaaYS3P+iJJ3Y0tdvGCHbt0vlJr3gRIWhFw4BROdjy0no1SCOAsgXfZUk0wvq
         +cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018004; x=1781622804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=buQzehnUJNoX7/hZu3xWDFVs4RXYftzEF5jCpeOOYrVdtCyZWO1zKwLMD269fn7exA
         8tYO4yMrUgGvbShgHwrh942QhCwJp5S/SltsgO1gG+Iisyr3ikET8HcOLa5gpGgOQ3gi
         s9jG/yclZfAHjr51H8Ua+g3X6xbmbZU+/VZIsDnyFNCuk5U8wUqtbDZH0JBBIaeyF0ml
         vBtSddsh6lJy/rdngEoTpBrzPrikxMwjwxFUgqAnd1n5DDVcAWlVR9fl5vcBqBJd59j+
         8+epvDppUb/Q1ucRPh5Dk3U+SvUvCSNLAHEGMb3VscPwtf3/81eoEmpZhtoQsi02NMLu
         yP1A==
X-Forwarded-Encrypted: i=1; AFNElJ8oYl2iXMnCQShqr358A4cXMWZ3yx6pn62CL+yXRFllOmlfZfGmM3x9m04ixuI1IG4o/R81xmJhDWyA@vger.kernel.org
X-Gm-Message-State: AOJu0YygUFDmK118N5A+LG+MaTQwu0ZgOpU985iNK+WmlMHkKpdVGwq4
	Oh7lXbzE2orB72kO1dxRZyKvE2rlKkTJ+TYmQ6jGwztBYCgzbzcwoiFk
X-Gm-Gg: Acq92OEm3XgvaM4Xkd1BzcmVAIxCvXGiy1MsRxa503bkxeA5dELniY1KpvFy1g3mpwn
	tJzRawnVesGoeNWoNLv9+vG7+JL812XE55fZxKo7eZyw0hZGa8adO+I+ThYleXjHzt8/ApXV3nL
	LyrtYT3DpobNDRcR+cgTLJfnv+aKGo7FkXxZ58qFJjh6AGEhzgin+K9teKFMh7wBl2Zcs4stKz1
	lKj8U6fXOO9xTq3/3EIuhF2tNVsx9oQMfI+bjEo+9VTZRlMo0VcB9V8VxIWZy4T+46+4gOzHnAK
	zreKJRoqug06p6XmC5lOy7YM2BUb5Y4o41AZGqZK1FuEgH4xmdjPwMfnvgvQADtEt3+x57hwpb3
	2RbAC7exUsqBET7wk4a4hLHv08s8N06WFdFcEtByrj8uVf9dTEjZ1ax2Knlmm+rkUQ7p5ORxNZV
	5ShbveUYBI4yRohGMET8SFWiF17q5Bpusf
X-Received: by 2002:a17:907:724a:b0:bef:1df6:12de with SMTP id a640c23a62f3a-bf36cdcebf5mr953590666b.0.1781018003482;
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  9 Jun 2026 17:12:03 +0200
Message-ID: <20260609151212.29469-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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
index eb8cdcc76324..8174f005ab43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
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

