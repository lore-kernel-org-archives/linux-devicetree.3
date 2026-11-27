Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795794855;
	b=uEcFNBbiId9rVE9dRxezHS3X3Qr4a7IZ5G9n3UEZKnoVfYHQl322JFWXEYx6NrWO1uFg
	 ajS3IpDUbi25Ric9/bIVFq2r/ujkRIv4UqQJc8ix4BnEsl9Mi12ziqEt4PePOhu+GmvoL
	 EdwF+5B0zs6ZkNTNWdMnsl00VW3FO0c7c0qNyp5/ntqf/hqskfQs0mtH4q/gPchrL2iwx
	 kxscvU/KxyJry5vzpHFsWcw2GZPyhzyAZEmIm12P+h2t2DviaLPx6RD6t8YFje1wmN8LY
	 wyWdk6E3Z/tGfO0bl2oMIT+uWc28K66aH0LcLLNTCRNDBJz6yso8Mfj4Uu951tiAi5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794855;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=SULH/G9VPr2A2Frd00S91rgsfuHOfpRac0en+D/Kge7vf4oth6X/IP/2ucl2KWm33AfD
	 2SVfbtcUCmwxHLcx5y/uyu8zsrv0xwdpcHYyrSOyIUjxgYL8HR01ZmEcP+Q5mKxUmviex
	 sJAzPGX29ZAa6H7lFUDyjIOWz2I9WrbcUN6sFOBbLr065+oNMlPXyMQmSPkcno+FbvD07
	 EKyxLVMYYOZpVstWo24bGrggyjbL4rYVkji3N83s7w0+xDwuPL1xgLccrjzsocwnHJybX
	 DTsaHiiApsPVzpN20vgb+PpxZ0K22xfuLx1yR/TbdeXIHk6wA1Gpc+/hJUQO7b61xBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmnFauEv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE95606A32A;
	Fri, 27 Nov 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmnFauEv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795794854;
	b=pbiL1I0USTlZdT5P9OAR5azAVd270P7RPJ1jRV8FuzgexczGwBDrqLFcLqbED708UhJj
	 SLYJAgzMNttXUPD5FnaTqDaPfJ5/C6mNofJfExQsGiP9exAq90lqki2Gd1IgV99FREnDD
	 ZbMxZXNfK2BcNUfxMC/caH27ygX6hqFu3OYnD4av5II6BiM4AUksnWq10K90iWH9ZDbUE
	 OWAu/W/a8EegGFSnFvrl7KU4swzgJy5WEbM+7CDNOr3W83b1lN/Fs+3NAUbELzHNAb3lw
	 Tf6hsUOgq7syuVvy2cKpxqO1c67Dtk4ZB7h3X9QuvocZT9x5ObKiD6WuF5bVfhwmQtQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795794854;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=qxS8DX+pHtsQN3ZGyFBGmikcw6WDB84DY+Cajho483855rJBd/1FEf8MUX9BiUlOmxM3
	 IqZ7pcuQjYbf2t2QkpkyZoD8jeqYDvYDj1tiUODfgzSEaQojHNvrjvaToaA5OxM8UBLGG
	 kYlOJDTyo7xFw8dM79FowGo9uGYPkQZTYXNoBPagtRuO1DTPyn9H3GRRinx1iaxPG0FsE
	 hQlKp+FqUrCCnUFb4O1+LaQkfToTl/6N3Fu3LGpuQ1KS0+K5OmiW/OMNP1Jk7tlN7l67I
	 pN+7O/5cNcfFB7OZig8xXtXrmW6jyOYXx76b+Zgb6Umh9YhlHJ23j5MdNyGhZ2cAJGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81DAC1F00898;
	Fri, 27 Nov 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794854;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WmnFauEvdsJ+afO743B+4UhBhaUdq/TSnidhu1TDiQes6l4BMLPmkj7dNdR/X0Xlx
	 X+VaFzERXwFA4ykLgW1TU53d4M01ZKHdJBv6AjEznZ3gx1uTJTm2zwTF7EnLqPqUj2
	 QiOhl5c8EdkgGu3BPaqC3vfhOb7CCrpwt4VvigYgQqpqC5ub2THS6JoLIo13bBhbvt
	 gsChOb2+U8Sve+61gtEl63vhfQE/FOJLkKUQPflfqHVFVHqRplSiKqc5KB6pFd2Qb1
	 KQfhfM1nBt3Xtq0tEfGQeTMcYbtL5e06ne4H7eCxpCKGFGRwkJuYX+Al9S40RyOiHt
	 1C3dFjXPXqpqA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0DF7D4DCA8;
	Fri, 27 Nov 2026 15:54:05 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 18:54:06 +0300
Subject: [PATCH v5 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller
 entry
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-cs7542-nand-v5-3-45b1a92bd13d@gmail.com>
References: <20261127-b4-cs7542-nand-v5-0-45b1a92bd13d@gmail.com>
In-Reply-To: <20261127-b4-cs7542-nand-v5-0-45b1a92bd13d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795794843; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=NxefvzdUjztSV3LUIBl+Gbho7SrUCRDJtnZE5bMJ7eoofNakfdo+1RhePulM2VX0HfnCs38P+
 kOLJ1ZVIHxKDt+Cvm/mDuAyL993JnmpToTgwKNEQBQ2TYKywgFzwlrh
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

List the binding and driver under the author maintaining the Almond+
platform support, together with the appropriate subsystem mailing list.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..2524c5d59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,13 @@ S:	Maintained
 F:	Documentation/hwmon/corsair-psu.rst
 F:	drivers/hwmon/corsair-psu.c
 
+CORTINA SYSTEMS CS7542 NAND CONTROLLER
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
+F:	drivers/mtd/nand/raw/cs752x_nand.c
+
 COUNTER SUBSYSTEM
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.53.0


