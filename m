Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653431;
	b=ehVPhyyhaaGQH5VRp7KolXdgGt0LFFZKR5t9a33/s8XlQqvRH2q2GmPEVDeet60IwC9s
	 TSmVnPvRqFBUdoFuFKhahvfMm4Q+h1vV6X0DLWL58a59LgWgZPQVpRAGarp1yv8Lnfpld
	 YVJFZRNFAqRV/hKeK4bZQDyVAWgCRqQY6H6WHsZ/SVz901iptN2B0GSqdtvvPLUqbJ1s0
	 po7rt4Z7v/lEfdrxoQroVFmdJ/FQKnKmlWptbC3FI0sG2KEXpfiY+4gAkTinljrv38RN2
	 FLsc++VmEXPhT47hkAlWc1ys752wjnL84RT7RiQlmcdwLcXGmfuSPN5L80YPLpZa16Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653431;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=xn0gH4NRspWRvkgQ/bHfnxIngpsuU+qZwOuCuvt5IeU=;
	b=xndMF+Q15QPoMSrLiaq5WXGpAJA7YY+tlUN2smJD9JtjkdY9Zce9pbHFAIXFf6pp1IKa
	 U85E9jW0Xpx8Eakmap1bksYwhcKzoBip81DYUcs1vW91K2mFv+Xx37fKWAxl2v6qlQyi4
	 BdwlbG5iIu7dOP7qB63UxM3QJ3sVAwLVC895ICbmm4mPoNhJJeW7A9IiNIDcvumneEkiR
	 J87C4LNqyOWwFLgZKvUgZ0FF6e3q+Oj9ZqUvVGIDI0BVmj5stsBsGl60B+8zuiawFAlgW
	 JJ9yFOV+hvaxXtI3k6qBR55T/Rg0ORba5MeelipTKaWJd3Ijpq9GO+JQFULIXNzHRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X/i17b9g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5D606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/i17b9g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABE41F000C0;
	Thu, 26 Nov 2026 00:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653430;
	bh=xn0gH4NRspWRvkgQ/bHfnxIngpsuU+qZwOuCuvt5IeU=;
	h=From:Subject:Date:To:Cc;
	b=X/i17b9gquXUw3JeOO/3nMYp9ylW4qd4ndaHcTrWT6JDGhWz0ZD8VmH0Y1gPdYVye
	 DmmrkRKjMAuQ0m9Z7sagHDSOd2ulfzZFG7v7bM6H7Zf5QcjX7vVPg2CVKLIPXcAHT4
	 FukXLnVeXrfYXBVzTZEH9Eg/kZ8FGRKY4qbbRAd4wKllkd2MzkbRTjMEEphUJ7Zq7t
	 nwtgzLHLxmchQP+q5H0a0T+IpH2fuR+ieKiq3NrH07+j5+20C/tYugl1sj13Vbrxt6
	 8HxUfzVaevMETSG7142MG/FBK4OIm9T7P5rp6p3WHbMeS70NyS0jBbjYoWIHn7CSyl
	 eCGfepcSgoN/A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 00/20] Clean up Ux500 and Nomadik device trees
Date: Thu, 26 Nov 2026 01:37:04 +0100
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqDMAwA0KuEfBtoO+qkVxn7KG10+VgridsE8
 e4D3wHegcYqbJjgQOWvmPSGCfwAWF65LUxSMQEGF0bvw0ifPTpHdTPK88ZKa/+x1v7O0ozu5RZ
 9LmWKE+MAuCrPsl/943mef7LrpSxuAAAA
X-Change-ID: 20261126-ux500-dts-after-powerdomains-7c351acc858e
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Apply a series DTS cleanups.

Helped with an LLM.
In the age of LLMs there is really no excuse to not fix up this stuff.

There are mot patches but they require updated bindings to go in first.

---
Linus Walleij (20):
      ARM: dts: ux500: Give memory nodes their unit address
      ARM: dts: ux500: Put CPU cooling properties in a map node
      ARM: dts: ux500: Correct HREF thermistor and pin group names
      ARM: dts: ux500: Remove bus clock rates from I2C peripheral nodes
      ARM: dts: ux500: Use the standard battery chemistry property
      ARM: dts: ux500: Correct STUIB magnetometer supply names
      ARM: dts: ux500: Encode Sharp proximity hysteresis as bytes
      ARM: dts: ux500: Give DSI panels their unit addresses
      ARM: dts: ux500: Remove unused IIO channel inheritance on Janice
      ARM: dts: ux500: Fix SD regulator node validation
      ARM: dts: ux500: Correct GPIO key descriptions
      ARM: dts: ux500: Correct the PL011 functional clock names
      ARM: dts: ux500: Correct the STMPE interrupt pin property
      ARM: dts: ux500: Use valid I2C bus node names
      ARM: dts: ux500: Correct memory-mapped controller unit addresses
      ARM: dts: nomadik: Correct the camera I2C unit address
      ARM: dts: nomadik: Correct controller and clock unit addresses
      ARM: dts: ux500: Move the pin controller out of the simple bus
      ARM: dts: ux500: Move addressless devices out of the simple bus
      ARM: dts: ux500: Connect the AB8500 ULP PLL supply

 arch/arm/boot/dts/st/ste-ab8500.dtsi               |   1 +
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               | 146 ++++----
 arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi  | 369 ++++++++++-----------
 arch/arm/boot/dts/st/ste-href-stuib.dtsi           | 151 +++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi   | 136 ++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi   | 110 +++---
 arch/arm/boot/dts/st/ste-href.dtsi                 |  19 +-
 arch/arm/boot/dts/st/ste-href520-tvk.dts           |   2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts      |   2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts        |   2 +-
 arch/arm/boot/dts/st/ste-hrefprev60.dtsi           | 109 +++---
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts     |   2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts       |   2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi          | 363 ++++++++++----------
 arch/arm/boot/dts/st/ste-nomadik-nhk15.dts         |   4 +-
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts         |   6 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi      | 152 ++++-----
 arch/arm/boot/dts/st/ste-snowball.dts              | 363 ++++++++++----------
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |  13 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  14 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  16 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |  18 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |  19 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |  15 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |  15 +-
 25 files changed, 1015 insertions(+), 1034 deletions(-)
---
base-commit: ce2efbd2e360243deaf4b2a7502714da1a50d06d
change-id: 20261126-ux500-dts-after-powerdomains-7c351acc858e

Best regards,
--  
Linus Walleij <linusw@kernel.org>

