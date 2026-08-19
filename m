Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC24437E5D0
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136015; cv=none; b=L7HbXg7vyTAARYgjT//GlhAkl1WjisqXQ1opYnPIH3y7wFzi8mH9/qf9Y87e2lJerAPGvOH1Rl0il68PPi8G9KbZQyS3hIxilaSbf0csEAQLyH91zJsoNrYhZrsmTmzDa/M3jZla4DYBJYvov24IgeaZ9DxFApsTvkpacVA2cFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136015; c=relaxed/simple;
	bh=pIh3ZGCspa7wJibCNWZv+tmS81lRNPmMa6+/3QMQUqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4uw8QLvOp8tfOLvql+xIb239vdrxHZt6I5uEVgFf9Mpk9O8R4a/2ULRr65pvfgWGC//a4+DE8/MsOAhjIFUd376mQtvbhBQd6qmUywx75X3J0/X/fESNH1wlb48msJnLnMdSndvsmL952uMsdvwL7+stwru8pJlRwV3VNxbBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ/3OnoB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ/3OnoB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso8934595ad.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136012; x=1787740812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p35PMWuNq9g80SJw4x1gXCwK/9VH0twhB+7CIMwKn8A=;
        b=NZ/3OnoBR4f2aquP0yHpeu8ZCbBor9DH9V1nFTi7nRLrB58XQtmjqXdIE6niPDy0BY
         ofuJL3uVKRLjRFZxBkvjS+FSPzqYl1A+BHXSfgBmDGPGehIgLC9C5mPWMzmIxQwPGR0n
         7SVQ4xy6cbxOtK2Wpi2lv1u3ZyV4tEKjAX2FuodAPRJiBmiIlj4B398lWo/d+bDgKFZm
         8xIcxpvyMIzXfJwu2JIFbcXxYkrU9uL64dwWrGz49ynf24EbCy4LPLOJ4IE5A+RvQk/h
         CgkvtGeAfzHWop+xE68aIIutX1Bb1Pas6x9glu2BSwTgOdyn76G/NFxhszPlbBjI7u7g
         EnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136012; x=1787740812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p35PMWuNq9g80SJw4x1gXCwK/9VH0twhB+7CIMwKn8A=;
        b=JxKONlyQc4mVU7DbTUI+KkZ81bT4DOdu3ts3rnxJ4eEMFqggtuTEO5rv8yyA8MaYZB
         mRR1a7u0XEDCAx3xACcSV8nYqCvkdeHdndMIGv3VVxPKHbj7Mfv7b8yxxw8MLcovKrTg
         JKkDV0BmhEBIibBS/9hq/10MF0AEMlaiB6LkkBe2B/Cicf40UfYozYAEj1+h/bpLzb/s
         1SGx/NSnXkZA8dfZi3WSdeyNyWHQEYExx3ryJXTMR5ZpJ6UWZ1JMY8cHzCjRejc3QppH
         x582600z06wvtvcoKZh6RR6Vyz0TtNiV61k01F3UQZ7l4sOOe2aYeXQme1JB9/hexlis
         O71Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr/UOyUB6m56+05DWHDi0ZZ8jaJYxIX2GoynmJLbw/xMu15xOBg5LOIooBSLX5oALia+WE4aSli8YAo@vger.kernel.org
X-Gm-Message-State: AFuF++mS0mjGjmLrmfT3g224XrTVrC/ASs8WtZQbA3qrkW24i997teKA
	1g3cBX/u8X+sqETcuUL8DA3zxWx3AyM0f1Xbly7G5IXZuLROzkmbVj5t
X-Gm-Gg: AR+sD10VVKKj6+9qsAL8pojDjFDT2PDCv7L1hRy600ODAPqRAopDuU+Oaz/FI7oZWLf
	I+8dvZZYTL2Sf18832wAYBic+xu8tD0lKvDGryurosWRdG4b+pkxYJ+I9b6dvVuf+Ao+z/Qi8Ks
	CiSl2DF4RVEJeVqGba9YLwTkUg5JUiypv/y/Wzl5/K/neJ9qsuGxBreo25T5RITnNwoOF049dee
	GttgqHi+RVkB3MFTwdgIHu2m7p1nWOcO9AsHGRD6JUEY+/NjYdbz7SJQl3S5TbODFR4zqFe1X5y
	xccGOhVsHVVnia7ipzH4TZpt8fgjDdszniddDON7Vryd0GXtnfH/4dv9htp0Cy3w3FkPSf4F36e
	OUx+ABbEzTE51hw6SVWmYY6oR1B0Q4VPhnJ1bWBW64p/SQhTt3+M3WdvVmW3nn4A7dBo6QYllEv
	FM46VZnO4j8+fi5TxpvL3Gp+DMBbMf69dsdvl7nic5O90Bsw58N3FR+7fDpR08KOzJr7JDI7uMn
	8STwkbLjW+VeHkms8aIkhfDsqnVrbOucKQ1EJF/qiJLMDkBcJCNsu85IaaekT4GrAwb5DDqtmyt
	YDwLie9SgA==
X-Received: by 2002:a17:903:1aa3:b0:2d0:8b28:51ab with SMTP id d9443c01a7336-2d5fd710544mr71371885ad.7.1787136012388;
        Wed, 19 Aug 2026 03:40:12 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 04/15] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Wed, 19 Aug 2026 11:39:15 +0100
Message-ID: <20260819103926.2136712-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8c70dbf8c7ec..d03d252fdfe1 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -511,6 +511,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

