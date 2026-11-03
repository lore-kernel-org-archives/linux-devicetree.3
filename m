Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.25.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738036;
	b=rYGpjcm/pAQN/O2R3YTLPehfA4/Wptrz4PfM7xS0zLwFyI2f1bK+cWhEQdTyVR2ubu8E
	 Iykq9begrt1KLQt0WEL/nwK7zudwYntoJVR2YZEg8w5WD3FGLhbJuNbH2xlPM9x04k4rh
	 /o6wMz2rxfxKxXbXHK61Qxiybk4EufhHZaZK8zWLIXpZybfeRn/230tyiaBAkWMkBpr6S
	 n0LJxiueU2CWyHKLh3W911HnwKAJIXGBOwQHdusTn5I6QHVMmphcGIPtzb7xs/N8pkcBa
	 JDaVSpReO44eZv2r8QcE47SjuglfF8n3JfnpTjgER9XGAwX5PWHKsl+63h0knA0DJmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738036;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IpTAQdRgdhCJhb1hvxDKWghah7aGv6NZyMkxYCZ92Rs=;
	b=etIpDXDvS9iOjpG82Y7Q5B12vFgVFLZ6vtrdvZwU4fRkBmkkyh7N5mrEFDMcDukEZ+72
	 T36vHJ3duvcMvmpvgHyG8/Sfh3atyiYvFjREhBZ7K+qSYshtN+K8bQ9x2EHhrXdeJn6ym
	 YXRrn94atlNVelWwQnpt2+Zyr8n42sQcBUn7/X+RXL720c5kD1PuiCEyAhTULtkTTMCtQ
	 ZGO3wTk8pz8rFXioEp7YK+3sZu0oAlkYvV+bm8KXQEGDpgQPiYJBUvUA02koXRcWFPcCB
	 1Of8yQ1eIDT4i53um9qP3SRfwa1ETQqy/USPk86gk8m9iTSLEX5BEHGl7PVZVvd4Oxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rnplus.nl;
	spf=pass smtp.mailfrom=rnplus.nl;
	dkim=pass header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Jsn76HXz;
	arc=none smtp.remote-ip=178.251.25.70
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215F606D801
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4215F606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Jsn76HXz
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 761C937977E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCUcTe7DtT-F for <devicetree@vger.kernel.org>;
	Tue,  3 Nov 2026 21:33:47 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id A6BC737977F;
	Tue,  3 Nov 2026 21:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738024; bh=a4vWSx9rLNvabRu3vIDBn7/4YymkwBrYWvlKnKwfxas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jsn76HXzv4eFOOwgUbSQIOLIMAQKaYgXoVJs1tbb10Zi16awRA0nzypxAAuD7oPf5
	 ErykmkbQDhlSf/z/v3DVS7gRqu0J7U3IRopvcx7d9Rmlkm3cXH5s5Of3IlzeiAKXBS
	 LxB5ravxMejTgXwNveef187G1bdaVUpEVvS2l94Y=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: aspeed: x570d4u: Add some GPIO line names
Date: Tue,  3 Nov 2026 21:33:05 +0100
Message-ID: <20261103203308.54789-5-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several GPIO lines used on the board had no gpio-line-names entry.
Name the NMI button and control lines (GPIOA2/A3), the BIOS flash
chip-select and LPC reset outputs (GPIOJ1/J3), and the hard
power-off control line (GPIOAB3).

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index fca14320829e..0089845a6f0b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -79,7 +79,7 @@ iio-hwmon {
 &gpio {
 	status = "okay";
 	gpio-line-names =
-	/*  A */ "input-locatorled-n", "", "", "", "", "", "", "",
+	/*  A */ "input-locatorled-n", "", "button-nmi-n", "control-nmi-n", "", "", "", "",
 	/*  B */ "input-bios-post-cmplt-n", "", "", "", "", "", "", "",
 	/*  C */ "", "", "", "", "", "", "control-locatorbutton-n", "",
 	/*  D */ "button-power-n", "control-power-n", "button-reset-n",
@@ -92,7 +92,7 @@ &gpio {
 	/*  H */ "", "", "", "", "input-mfg-mode-n", "",
 		 "led-heartbeat-n", "input-case-open-n",
 	/*  I */ "", "", "", "", "", "", "", "",
-	/*  J */ "output-bmc-ready-n", "", "", "", "", "", "", "",
+	/*  J */ "output-bmc-ready-n", "output-bios-cs-n", "", "output-lpc-reset", "", "", "", "",
 	/*  K */ "", "", "", "", "", "", "", "",
 	/*  L */ "", "", "", "", "", "", "", "",
 	/*  M */ "", "", "", "", "", "", "", "",
@@ -114,7 +114,7 @@ &gpio {
 		 "", "",
 	/* AA */ "input-cpu1-thermtrip-latch-n", "",
 		 "input-cpu1-prochot-n", "", "", "", "", "",
-	/* AB */ "", "input-power-good", "", "", "", "", "", "",
+	/* AB */ "", "input-power-good", "", "control-hard-power-off", "", "", "", "",
 	/* AC */ "", "", "", "", "", "", "", "";
 };
 
-- 
2.56.0

