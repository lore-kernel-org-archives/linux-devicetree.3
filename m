Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653448;
	b=ymcDg0whazQjmEu8iAxQUXRSL6K1GZdXg8Lerf4ezESxzYFN1X6KNKTQeM3binZbPWQC
	 AsPM1xMPfIexQFwVVMin6vFgYhCsCPOk73IBGrkL3pUj8/2rCZeY5hr0sKPpLDdYp+nTx
	 RKeKODp/x5dJW6EeR7pEB4e6Xs91cE6GtJY+uElZUmVyv0qOOrZ/aJ45gmc/xGT6LcJl8
	 nuG5d4JP2mUxJyvtn7yAEm4xSKSY2qhtHAeUlAINyuNKAlDj7nRNgZquYJSNJAhWUfGkC
	 7yXqvlY7dhfZxvuTyNtCRBEl7L7C0Axmx8aSUV4/wNLt+czhtkGWow60no4BxuUSkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653448;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=RJJEKth71su8ijwD4sLTXvMtrVDCPMMgyByFqaz/oQo=;
	b=1BhJBtos33ENeVP7AOWKK52AmwLR+0Hb7YnXndVkBh5IIJz2DlIhp2x5IhKzmwpZ6UOV
	 fgsyUIAKAmiLOa0YcmexBmC0zg/96RD7cbe3rQWQhuCfrCelWEBn+pLEhbdLZ2xnKen9a
	 BeQ9iLDBK+m8aJDYoWhm+teJP8o3MPq/H+EcGSzsKt4X6qKmNFqeUjk4G1lQycrdrvcs9
	 VwCDRYCNKHBvvpGrCxnjlvd2dVPUnnIgi/GtBWjJEmVi7DODGOE0bl2xbYDMKIASJmnpT
	 fS0DaSlL++vQUHsF7zuAPfCFJsi4v4Q/xdyung12odKXH1pjKix1DIFnboA0902b7zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceOlNlAI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A3606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceOlNlAI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61411F000CA;
	Thu, 26 Nov 2026 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653448;
	bh=RJJEKth71su8ijwD4sLTXvMtrVDCPMMgyByFqaz/oQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ceOlNlAI8jWcjtj0pVBLJ8Bzek+JpTtDXZt63v+2R1xAN8ZOEssdxGrCJi05A9EO2
	 YO8kh43KPPrFMfnncFAAFXjnbEAC8Rmslasm1rGevYhlLxORzZKkASP+CbQG1nZ0uu
	 V7igDm3urcAVWLi6HPLqE+vgUi4tm8BxkjW6blwH5jK3qNMLF0oGvb5gcsdmlVvhSX
	 PaoeXMJDLQM3DaVGZx+pMRFbeYvg+mkuInWxamLVZlDz3kb5WF5NmCVKuIw5Mbzhfx
	 X97cUOSMcrcv1IfLIb2AHT5loluhb+83suglhqUpN6A6yj6gZxekJW8RsVmrnxh9vf
	 shpzaARuU69kg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:13 +0100
Subject: [PATCH 09/20] ARM: dts: ux500: Remove unused IIO channel
 inheritance on Janice
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-9-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The current-sense-shunt provider has no child consumers that inherit
its channels. Drop io-channel-ranges, which is not part of its binding.
The proximity sensor references this provider directly. Found with
CHECK_DTBS=1.

Fixes: 78894adedd87 ("ARM: dts: ux500: Add a device tree for Janice")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 1ab09e8d8d2d..f0ccf370710f 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -321,7 +321,6 @@ gp2a_shunt: current-sense-shunt {
 		io-channels = <&gpadc 0x07>;
 		shunt-resistor-micro-ohms = <15000000>; /* 15 ohms c:a */
 		#io-channel-cells = <0>;
-		io-channel-ranges;
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "TOUCHKEY_I2C" */

-- 
2.56.1

