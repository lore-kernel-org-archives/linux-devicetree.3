Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742812;
	b=Rwfm1zHx8gzxwO+m7KsumrC3hUAZuOZi0RPtCXzAJmaFPO4qOng58rCS55eYs8sMS00R
	 octEu5LMovySuChZAOt9srOQ/wIvNSgmJff577rQcTb4D6ThbdWgpiEo4pMzX6/KzwZ5B
	 Otk254xy+ITYVzd3Q0MwYYOERxU2YYOxDPnadlxPKkp+fFrNn2df/XwBdc/iyzieK0rZC
	 8RUpTLYZBNjLOk8ZAjnzqOcuf3tq6hC3GdtwGA55tJcJsjlrRcMwrNNFj2f/odTBzdo4N
	 rtgg67lWvTg/+yVNUfevLAiE22fP2w233vDIa0BncWWn2EF2dme9CeWZ/nRnST3m/ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=u/PySGRO9yZzy0KFd1gkJfmP37ydKw5jUOlTrBCs6cI=;
	b=ImZkQZBODVH3kNfTO4SEDlC8o4CB1aCz88r5DOo9BNYLrzGjyFvfurxPrquWMhLb6R+6
	 Tj4gTlLdm8jwWwXgj6OihTJNVFguRefMBEOPjYo/m1BsvlWFFkK66N5Q8VC6XCaLNq5Xz
	 cnRR1xN5FBvfFbOM0vTVD/FlKy8ozltdR9S0BJTvEACQBuJXP+s8S08mTdU0WbTzvIFNy
	 Mh13y6Dkfjvwfy3SwuGKG0yfmCXAOLBsUvAEoAFebJAMXOwkbazsBEgsvv+XDzuy4NVrT
	 nYDoM52QIUxFCRD10T9qvhVyX4pQXjFSePlzJSM6QVKWSBfDfm2YlrYccAWo0IZdx1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=xxySu7IQ;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BB606A328
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A0BB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=xxySu7IQ
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 504FE2C05BD;
	Wed,  4 Nov 2026 10:53:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1793742802;
	bh=u/PySGRO9yZzy0KFd1gkJfmP37ydKw5jUOlTrBCs6cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xxySu7IQ1TKJlOHp3BHF78EuF3JV4eXk1Xrr9q18vHLZzS2jJzBPj3sxXS6/LNwtt
	 nj4VN8c4Wb+52OOX9J+gTa44C0OoSp5ppQeYtwyS7UfYlYVMKzqoGqZf+iEbYTttiU
	 AY7aneVhGA5tANSQOunINOMU6ACQ3SH8CCfElBc8WKONfloGBJ29UB8Y0MNupYDsuQ
	 8MdSxzniW4aziSwa/dishBnQy9/sZSDCF6HOBzZ+PEGVamD57uuqrPXFGCPW8mnFM7
	 j1z08Sw29Wbf+OEQzrw3t7Bcc/pTiw2dnnL/Zb00K3+mY6V9sPQ+3ghfBA812+loNE
	 3j2DzFDivBLgA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6aea57d10002>; Wed, 04 Nov 2026 10:53:21 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.18])
	by pat.atlnz.lc (Postfix) with ESMTP id B77B713EE7A;
	Wed,  4 Nov 2026 10:53:21 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id B75175AEED4; Wed,  4 Nov 2026 10:53:21 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH 2/2] gpio: realtek-otto: Add RTL9311B support
Date: Wed,  4 Nov 2026 10:53:16 +1300
Message-ID: <20261103215316.1544492-3-joshua.scott@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103215316.1544492-1-joshua.scott@alliedtelesis.co.nz>
References: <20261103215316.1544492-1-joshua.scott@alliedtelesis.co.nz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=H8t4wPYi c=1 sm=1 tr=0 ts=6aea57d1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=N-HnuwHAmrw2kDc_sU4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The Arm-based RTL9311B switch SoC has the same GPIO controller as the
RTL9310, with port A in the most significant byte of each register and
the same IMR layout. Add its compatible and allow the driver to be
built for ARCH_REALTEK.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/gpio/Kconfig             | 5 +++--
 drivers/gpio/gpio-realtek-otto.c | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d8..bc584da1abbb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -645,14 +645,15 @@ config GPIO_RDA
=20
 config GPIO_REALTEK_OTTO
 	tristate "Realtek Otto GPIO support"
-	depends on MACH_REALTEK_RTL || COMPILE_TEST
+	depends on MACH_REALTEK_RTL || ARCH_REALTEK || COMPILE_TEST
 	default MACH_REALTEK_RTL
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
 	  The GPIO controller on the Otto MIPS platform supports up to two
 	  banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
-	  are grouped in four 8-bit wide ports.
+	  are grouped in four 8-bit wide ports. The Arm-based RTL9311B has
+	  the same controller.
=20
 	  When built as a module, the module will be called realtek_otto_gpio.
=20
diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-otto.c
index 5d98ad597d9e..a4f010a0d2cf 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -352,6 +352,9 @@ static const struct of_device_id realtek_gpio_of_matc=
h[] =3D {
 	{
 		.compatible =3D "realtek,rtl9310-gpio",
 	},
+	{
+		.compatible =3D "realtek,rtl9311b-gpio",
+	},
 	{
 		.compatible =3D "realtek,rtl9607-gpio",
 		.data =3D (void *)GPIO_PORTS_REVERSED,
--=20
2.53.0

