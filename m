Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697135;
	b=v44Ic/V8UwGiIVjyvw8WPrVMcwmJnhrp6HwqVn/CYa1teiuoVt8vP3dh9fH22wDihDN1
	 zmo3TQNfCY2HLdfo2UMa71vYX3KHHHX9ceAr4qV+0uYHxHY5p6Th0Boix2MPxMRrAE8/8
	 buBaqYAuluXzy9rF6q90x7mFnNO9fpFcamTvRp4EW4XQgoPO4B83SkAL4ZftuTWW9bNvY
	 3mtwX35FE7/Y9pIh5Ddjy75d+vqObbHFsmzA0q4bmGr49UasKLB53fe0Qy9VAM4rMzbzK
	 8coCMIEHQfRyFnSSVauz4Lq3C+poHwurb+JfqzG4AC/meGkk2/fxvmloPLKa9VBJMLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697135;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=I80FyAdTKCe4hV7PfzLXOUHl5wCeNFTXdBL/1GeJF/Yz3YrwkgI96Qt4mLOHO8Q3PQFv
	 hSzj+AaxaCZSOaIL+eOcN0uWaqyT9nust2/j37v4Uz32kyyvZ5KWzZHAYKHbMl6yH4axV
	 C211rllPX8SxdOg/lALNznRLjJHagzQyqS49r+J44HCRxbrDjRxcSyxIyNC9nrBmOnwkK
	 V3yAqDwPFr/pMfvrNdtn3kRlpbzJqVu5/anDJUiTIGnKZr93fYodDXxcMnvaOGTsOWuyX
	 L1u/teN66ywOhg5HHhQohZzoMvJhIRK9Zk1vdRfNg9cJviNEkKhzhg3EN7xh6vk+VLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nooWDX7o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B7606A31C;
	Thu, 26 Nov 2026 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nooWDX7o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697134;
	b=lMX8PlW7bmd/JSyqlYPyQKCn//y3tldhit81O2DNH198MJH8P1Ui3f1cxilYo6Y6V5La
	 vgxBg5NeZG36xWxO3+o3fmhGjI/GZiSqn5V37cJmXltXE3IZ1tjL9HFJ2vXPFjny70Pwo
	 n9wDzeeN2he8pEesI1RqL4TcSrL5rPTbf1aXesGwvl3KqxLDbZ17yhnIYLJegxX3uH79F
	 DlqgOD4RiMhX5V6kAFXvQ6C3Tg+AbYK1Cso4WjNcQ5isfYVBkrXaYCG1F+ktzwEmbD18e
	 0y3/Q3trY8n6DK80WlJNzqbXoT6AuGBuxYqRu6wFNqdxaLwC2yvVYDSBm21kthTTbKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=vVqxi2whhnOCTfcxfrgemSevZOIyf0WhQKPJjSPzS1D0+FIXWJ2wqicJzK9my+0qpIlL
	 RzmFMd5EczfiTe5guNZJ2pkscpiNLP7X2MyFmMkUgumOlV/1ig0YNKa0w7Gz6nE1VAhID
	 nu7Xg/7vQf45ud+JEuzAxDWu7vsbm3o96SC5Yj0wFdvKHMPBQibJwPg1tRT91H2OH3wAy
	 04y7+sVIkBQYYWKHKzVNyIaUKvqV0q/HFbJR6MKy4FrmD+t33ZyalUbu/dl+rKoE9Ap5h
	 c2WG9tmHA1fJrTvmM1M9s1ExFBBXGZcRvvFqxsmwzrNV0ukbRLODSpJwMbUylZ8HZWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1A951F000CF;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697134;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nooWDX7oD45EOOfnALZ3jrdd/62pueHRvUs2wlf8NRYFCkbE/elyGZfEM4hLsE1R+
	 4RtzJQeANsJybX4/Ky2Lfp907oVHRcO8U/+mVban93G8IFEYEm1pexa6qQwN36kJzh
	 2UcRphA1P5qdUcvLnD679DcEIQCQuj4vv/uEYvxHW5IxOFyXlNccLZWbq43E4D6YM+
	 +/5BdbXQpTPVre3wkbpVFvUCsRmnt4O9ryY4LHaaSDU1FgZUut5of3XGq20BF5dERK
	 BVkKq8ModLcWrhnUDbOyWNJ8shm8zlJBPA5FpgFfjOqImv5DPDAk3L89rZhgYVEcIc
	 dehmbUCzVryNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4288C4D502;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:29 +0300
Subject: [PATCH v4 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller
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
Message-Id: <20261126-b4-cs7542-nand-v4-3-38e488f6f8b1@gmail.com>
References: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
In-Reply-To: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697127; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=DX49uaJOygayTJxAeFhARcL77GaPX1PV67f788z1vIcb9VF9oumQ66FS19jV2Njpo4I8x1yuz
 emaI5aJrAXiAjOc6ZHQLopF5j4KuTgZBPZZl37PPUHDcV0ksFiP+ER3
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


