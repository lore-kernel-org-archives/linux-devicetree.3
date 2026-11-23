Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465644;
	b=Sv6wegKdyBT+UgD9skZYQh4sIs11aLEorUmjD/t1zT73N+UsMY3NeseFJhdesMLuv/Lz
	 weOpFfITnfI7/StCO5DJ0EcEAuz34ww5vexRP7Wo7RjPKdVULgoBiplCRBo4ZNC7jPyWw
	 J85YLUoBCZAjGMar1uW8utiD+pNwnpJcKdlYNINTEtwuxp7iT3bulwQazEzhV1nvpN8IW
	 Sd09TOfjhdc1qXzNc/sKFq/CWjLj7wvMnxHmDtKVGqzYuPtUse39hYIUtWfhF4t3g/pnW
	 Dz87K5c3FNA/m0QuTx2TYm7M/TpFgUG75qfia6ip4LMWW+oa8f2he45G2ncRomdTpiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465644;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=MuY/eNZ2Mz0q975msmwqHsfnC7IKIt4coUt3pEy7Bc3Py3o3i5AJumyhkG3JYQYPs8Xu
	 NqkgEodQNWurAsaeUZO9pUIaugYfp6ldyT+kp3AQK9Jpg2HFuVNI62+hMaThpu9bxvkJF
	 pxlqgEoliFR0/5gsaGaiKY29KrHAHZRruj3RI9N942DnzKk/NJ2Ood06QQxY6eq7YOdHZ
	 +sqbWtE31ruvn+OVfeXxRinS08LG5zJyuAuRuPf5YHQD1uBazc/w8wEo3E/6o2Us0GE2N
	 nynNPwG1o4cWZQ1sChpWkpf5rYlEBnBEqL/2cG4FUJ6J4/V2reObG7ppJUcy9o4UPow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dupqdxx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3798606A687;
	Mon, 23 Nov 2026 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dupqdxx0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465643;
	b=TSZJX0t7l0b8Ta1VPizjEV3RtAUDcNIJh90h+px0nYZZffsvyKwi+H8SH5fIUuCGNicp
	 hCnfC3z0BoppY1Tw+d+fPkKSbRRsZdFp+Q11pTxaC/S9+hjAMgnfvGpmGSDIaud45D5B5
	 owsTgmtWo4YIl6W4KgtChIXw9jwCqBZHLIQN+mwHdaAbKhTR8VtpAc0PWNLm5QyM/cSgx
	 PbCKeikeKgyQIr/dH0RFyhUz/bttvctoD7A3m69g3H5S2VtJZptaxIQnzLcC5EnETXpws
	 xp09fWUj36cQVy6pp+KCtR3KlRa6FeAiGL8MNYRht6bKDnl4FrfswRLrf8vWalFroNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465643;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=fsdjMnYnU9UIHtFTXiXXZfcDOEH1I4mqccifRiZYdACcqZFFwsZq0akyamW8dMcEl1tS
	 WByg745FgVR94WTABXBRXhfOZkDxDvBqdX4HII5QziaY6ybaHhcDmMCCuHolCARaVjhst
	 gUinG5swWZDqTJWyuunJlXh/RIcyKf/hh/t5Vp2nTgChoVCUrmZO493BoIFKrV/D3pk0u
	 jsNOJElY4GnHefdtbD/bwanVOpv8pn0KHIG6CjqSxoa53Dnes6cV1cJpXOtGw7lIRZjWa
	 xDspxERa5c2rmOuk9/VFgGg8Sc086cnLomnSnvJLOn5AbhFKtNHpZ0Q7jkMBpaW3mqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23F661F01564;
	Mon, 23 Nov 2026 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465643;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dupqdxx0QD4n8Q3CFVm4Sp0IEe82cqn1HdCINhyZjMMZoQe0ZWxtP/1oANMtK2kCT
	 YEX3Zrqvq9C6IhNRT/ZRPy3t14Q62ZLMZFNltOoB+BSMFZCUBUAl88yS6Csirr8xEs
	 0wSl0GdbVlx5ulVSYPYCXEJf4Mo+VL5nU+6OV9RhzpW54PWIo0KEAHvKCqtihekSR4
	 +WppMAkdeW6P4Ps+psyMKcB+30ogPWfbshoz0opIKY3tEgafPFyzEOBqisiXRPzx0x
	 p1/w3KZdmNoTOSBN0SQAzTC+VewP953YnzlGqQQdHnkhqfS+B+6ql1IIBCWBl1yYzz
	 pTrqREzbH2KaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 294594C6FB;
	Mon, 23 Nov 2026 20:27:08 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:27:08 +0300
Subject: [PATCH v2 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller
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
Message-Id: <20261123-b4-cs7542-nand-v2-3-9d9f08608534@gmail.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465626; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=Ncy9qGSLsQ0s7V0IAbPKKs3H7/wU8dnQrbCzR7TE1bBqeknuV9aItWML4WGGp6z+D2LnBv4v4
 GEIuMEloGDFB+mRKAVbeOdUU9K2++0wZtxws99lv7jZ+RhSFd2TfL4M
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


