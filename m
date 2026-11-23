Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445276;
	b=3oinxs2NTzedOiIMCf8iRr0mvD0webaW3eskyTf0nfldHgJ0tJ8iJgF2rlAtWQRTraDE
	 oHVgKWsW33m62RA2LfpyFSmQRJYmCDjHAvuXF8B6mUZu5dqRWto+csWcTk4pd7ARx7+0S
	 3qRvK5NKEI0v73aDsmXyujhdPPINtwcsUJQSbt1mCFTXHJuYhfT5fSlkR9AeZ/KQ28ipX
	 MRPJaSCJqMWtGIkJJvNZEJ26FiiCfnWi3p6ezqhLSNjsO+ifoHjEWivtmYvLgDWEZrP9G
	 YXHI2NLBIOZwofBiHq6qthOm4JzQFeamjxCuHSHOYM2PjTKqkTQv1g4VR6IOEYq3qeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445276;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	b=onw1638PqltKk9tXtr1q09a9XpovlvjIAbREJcFifZATY1apm0EQs5cvXK3txgV4YH5X
	 sJa7sqiwhAz0kEbj6OptiCjeXB8D/r3pYlcNSW12iyeWadoLOq730z50z1JGMfVSURAx7
	 bjedi9rWauWUrqY6L8r43GJD30V84fUP/f4dhIQ9oGxfG9peAZ9b7rXED1NAhwt/nhhSM
	 yAs8FioGvbMr5m74ofeMDgjZJnJV0MZ/YbriI8H9qLcDn3vbW+69F0bCc+IjTXgWfFRSp
	 rjLkwuGfpY2pc/gL1k41ALEYfiztO1yjn/gLnC+M6NGbOod6RqOY2ddBtr6Dm3tnrNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyhzciQp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C8606A31A;
	Mon, 23 Nov 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyhzciQp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445275;
	b=JG2AwbYDrjpoSjj/c5/jcQox+JW7zlunxX6TtOeKx+Ri1LhnZe79L31G38OS2fRcpwIE
	 X8sH5aLfPhu11NbIdQZCVoxUFLF7jE//1jrFNH+GTDwWYzBTCEG87xdxLzsxzu3+2lXa6
	 6dzdfjfiMT/hKUMXRV97ui93Lv+rXNlKay40hk8K7NEdNlyBNVpjkyb207XX+WNzQ6UI5
	 hkfA8Pxlzbn1QILTutOlYVlNx0bpvD0PMYmrF+MKl51jV06ahHHAsf23DY5OWuHb3GGy/
	 2zYJvXsw+vQKyFzRNVDB8OABDkT4KZWFVtYKEk7E/ahGWS3Tl+5iiq7qp6ykRmYzZSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445275;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	b=OZ9qdQkqBXxFRw1kQ+d4IUP7EA6YLXWyxFU4L3rUmgEtzsy2/fyJ5KIQs5Mkv9QkCq3d
	 /OfM6LdI7p4SOMQ4aHQpPtbRtSjl30RufZp9huCqBjwssHUrDe3Z2s6/wKAQp9fySb/zz
	 2KsLJN+EOR3G6yErSDphlQ2qW/UrVssXLdHSNeXHMhgcDifUG+iQzNW4iOmmYyKgBum8I
	 YSr/xFOyYl9uAuIGzwqGfBnMcvdN9fheLDWdNZ51dIwJEw67tgnndg3rAP+qiuJi0twDP
	 piA7sz/qlA0hDLUN7Oj8cW5FEH9HCph9zkRTmg8M9lSDLGjsRuFlki+rPP7AFQzi/rg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF5061F000E1;
	Mon, 23 Nov 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445275;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CyhzciQpVB8aUf63BmEf3fwKNbPmF2St6WXmfCv2EMl5zaZKRjJyHUA4wBIy2UAB2
	 QPGx6005FwM/mDVCfchdhMEP1hhK1dHyGuRqx3DtSneqHc786mYW6g+3e6FesYW12V
	 +G+8xe299QBZN3oA9T76NZs5Inlvens1QSQZNmzFwAeMhiMOOu30uQ4dtasSwDyg7N
	 UzMxlpkJ4mebXA8fmZ1mA8xW1F5nxPCoz5cwoKbQwKx7Og0rUcdwoIpjuC6QgSdSRQ
	 YzYTahksS0rJrpeQPecZo2UNnDg3ISlPEQnjXoYeNFxmv5MGk2Zh1ZqbowFVAkpTNd
	 YcrTJvxWNPM8w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DDC8E4C517;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:47:03 +0100
Subject: [PATCH v4 8/8] riscv: defconfig: Enable MIPS SoCs
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
Message-Id: <20261123-p8700-dts-v4-8-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=702;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=466tDeyPbrAH0ZZbXJHUmWZAi2oQm3IXvaEsJZHNtNU=;
 b=QbJYoDvcuW6rTMceYF+5oDzqORpAQ4g2v6P2iVuhB6hDlCo5rUvgeFenzg/A7wBqX4SgHuwJF
 wI87ry8uZsiC0Ks+ptcdfYOeK7zDZnUfEL7uMktB21Y/VoHrOgsHhdd
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Build the MIPS P8700 Boston dtb by default.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..1b0b5346603934058d8348ddb3aa9d7616af999c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_MIPS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y

-- 
2.43.0


