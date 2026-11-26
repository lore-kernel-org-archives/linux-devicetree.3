Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686471;
	b=41gOctydZZS8fFxdiwCK6S43jZoulz/NNpf6U2HA7DNSNoKUjvMex4muCqU6a8GbznPA
	 cDJYItjZwd0Hm5TV/n7yjuDLndL3IKmbgCfoqxhelG8S5X4D32xPGxkwvQNdH5RsQ6cEJ
	 Ai9rVJifBOOjAR3SCfkmdG/HIVvZcs58ThTkMSeQC/lcrao8meLvjfZoB8KMIvHlqSEY4
	 QXRxlPdnjt0a00Gx/xLeMaMlmd2XhZEkXU8WlJRFPOp8EGawvYeWbzcW+S2LgL+LwHLbR
	 3645KTJ6wzlzF5lREad0ad71g/ubl4Q7k+gT+06gzOecFweubDLS16CJG52p4vuWMKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686471;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q6Wc+PG6yS/L/j98ERh1tXxofLkDU8ftPN7DVEoW1HQ=;
	b=pF8jyeL8GSd049TYG0Xq8caZKeyK8q2rCf3wCWzOFltVS+4erJNqnswj8L05DAyAnGDM
	 ZrTB1PfelGjQTlfBPa90sAoyAMMFQk823YodAHUUkuOK3eh4aBlO0xC8HAnvPy4xN+MrE
	 QtT3dkCIaGUkC2c9ImdW4PhxS4KIzF8GUc+Vw4b7AiltW6+5Shc2wzqt+ZQ5ic7H/mJKP
	 zja7YEbBg5pbgftaj3ZtmWB/HKqCrxj/VHjzbxoLOxcYNQYUneNWdl4HK7zjv6TuBMoy5
	 PR6BhRWv8L+IA9Q8wtJVIxVWja17ShGSKAILGC5iMfvERglP0SNkxA2WDm2MIKzvTlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx8NPYoy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B3606A335;
	Thu, 26 Nov 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx8NPYoy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686471;
	b=j84FGpCI9jAyONdhttMALyPojjOwRR5oQxpuaIs65rqIQRxqR+QnVhLkCiGPFaS+U2MZ
	 zuwKrGvfUZ5UaVLvzs7u3E7M/wIBQIvBJ7Vn7IfKiZXmMujLduN6dmMc/Bk+KdVL7gA5K
	 GSsVmWH5WPwjHkivhOFMOKjKMvUKDAxG3xTyqqLDjnDw1sg06KUgmItC4I0o7qMxYXc+M
	 HcK8RgDV6GItojU24SDVfFLatmDUwQQnTsjOnmoM2IPMsjmj0GerddoIBzrG4zD/Lf4yi
	 DEw2aNqgNwWnqs4SI7If6gmGrpVFijt7kxIY5URZ/0P3VlEgWPHZ1yHYHdiMN/y2RYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686471;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q6Wc+PG6yS/L/j98ERh1tXxofLkDU8ftPN7DVEoW1HQ=;
	b=biqx3bdzzPLut+PUHH39JlPjo1UITB4m+d0itHx+D+RWBEia82+sGdk6s5QsO+3iQ85L
	 rr+CpxBuIBk/pLrHmCZa8J4J3mdzerZyENomIp4CjDwR4fAQoqlEWHYeOSSSuY1R+jJg6
	 K86LmUXiOdDtXTntfVOjrD6XyfO7h/HkX2/Vf52YzHtCSOi9cxF6gedUEfX3zIOBYyPUv
	 8/D5/CMKwdxjD5WdQm2QaRQjb8KEgcCmVY5oK36BeKelsHDwoAcIugMNITvIHUsKvTzd+
	 Y39ol3+WNJQokSiDHeflxrIDzThVQHRj8q9LE3HCYqWe376MrgYkwglf0EAW+5UQmdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD2081F01568;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686471;
	bh=q6Wc+PG6yS/L/j98ERh1tXxofLkDU8ftPN7DVEoW1HQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Fx8NPYoyA+XyE+E+ydZ23Kg1JZ9PyBLLAS6+De044G1wyQG2rNAimRLw2IOeFX3GU
	 6ZWZPHEcgg+38NX4jDUo7IGEHSN10aLSqHEdI7K8hwQrjGG3TI1zldmgnWxl3Iq7jU
	 xKA/nEwJaGtgEYzewKoRzAwnAP6xa/Was6lPz79Z4HN8NKz6HmY2Aq88OJi1R1MrNl
	 bSQnTfAVjkFHTeFPuGG58HghnWE+qyeX13++KWLs++zYc/2yOttLzVngZNSImGQOjA
	 xnRISnurloO0aaHQbIWmD4Hcj8JvNIJ/oz4zbW+nV6aVboqtsrJB+t9Cz0e7qfJwAP
	 C7uL7Wl/J3z9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5ACBE4D3BA;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:47:36 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: altera: add Terasic DE25-Nano
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
Message-Id: <20261126-de25-nano-v2-2-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=977;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=QglOvD99R7zKu7gZQ5QqRg3vMc8/faE3VeHwT/q8HmY=;
 b=x9Ws0y8pT0iqSSW+aLAajFO9W0v7u5RRJNPif0IPr7pMbjH982xNw1UCsxQJaBgF2eq5Xd12k
 MQ5xARyEdSUBDw4Nu2gAgK+lX2Ix6HiE2/GVvUvIig9gunxws14kr9v
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com
Content-Transfer-Encoding: 8bit

From: Alexandra Østermark <alex.cramt@gmail.com>

The Terasic DE25-Nano is a development board built around the Agilex 5
A5EB013BB23B SoC FPGA, with 1 GiB of HPS DDR4, a microSD slot, a gigabit
Ethernet port and USB.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index ae38ba0dc..75f874e8b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -118,6 +118,7 @@ properties:
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
               - intel,socfpga-agilex5-socdk-tsn-cfg2
+              - terasic,de25-nano
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards

-- 
2.56.0


