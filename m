Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742015;
	b=IVaso9U7wRUXt/Ov/EHL0MTYNXcdqjiu1bfokXcA+Rd9mWb3efNv8T4DJODrv0DoI2fk
	 eDIIWuE4gOGV3RgWrfYA6+H9QGczcWv5YZJGPWXHhdWHA0Ew6OQPd9JOXO0DT18OVX/NE
	 723RF72RYrhwTRu6WY4rIAbLJFXDMRXCq58oryjr2Q0rIcx4UdXzVLt++2kAD7ygLkdv7
	 ZRu57Bym9bNv7rXewxBqa4+wN9jhP2OzzNU5UVVEO2QGzFhegtobsprS+XWlmGiejp1N7
	 +O3eRpl7sE6rJbwbmz8GzhwrJMQlU1L1rrUmWKTbqOMoiH5HOSW42/Nxo5oyFNoq18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=j30ExqjYaTTaiOoXqQ0X7AAwzcm9IdpSB23zwQlveuv+GSWsx3CM61Nx32AGIys8wdTz
	 JIIjI0M7v4uk+OaYxvAUNJ3qqIcF5qrCe1yQm8wkw4YwBQpDmbzrr9M7pzu2MK9ZaNOso
	 HrbIs4vXW2hedWOTUb+Qql7NFARMCxUrlNZkwHvLCm4qtYSCHNvBO9qEukrRsXY5aB7rG
	 sbYlgXoHLrfmT9dCEXgpRmMse/iXA6+AJSiE24hScQ/ytproRjbTgZWPT3qw6zjuzHQxp
	 JZxtHHXtyyzav7eElNzNb87k6KyFrAQ6pPRkJl+ESb7HKQoeVZ+iXnvsjxJA9y50NMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFzqB2p;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9533A606D822
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9533A606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFzqB2p
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-504ae5941faso35742b6e.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742014; x=1794346814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=ezFzqB2pNszwv2nsMajwEwrlsXnChTPseu0ngTqhGbRKsfjqRzQDp+73bjr+lA1ARJ
         NNwz1/qfrk5c59LHztMRDIA1vsRyM/VOCaOcGEOJb1GYnWqHoQ/4H1VK6BB90Nd+rUrv
         1YXht9wxF8gl0I232NhMFI94NrdVB4kLpQQklWN0eXedK8Ey50KG20MgcOT9A8Sd484c
         vPeXbqDSLSIvPz8mX6pLkGxV6RATZ/kDccHR8alRRSZ1vyAhCwtoOnZP8FBkX0vMCMAY
         nJuZjNarJnEyQCW8yTnVfo0Q9XkFRZ4Zx2Eo32tcvDwo53WnuMmbEExqyOv/Afdp16VH
         Fa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742014; x=1794346814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=BzVgurs7ZNEoMKodm2xJEy9Zi1ol3deCNHLwMRymbEnAVkU+RS3i+w3t2ewLsxV80Y
         6Vw5ErZg3SWnKzMVavbv4zTWGGKb2z1Yiffj4S4x/xI8gXqpUx5+/VIKXNj44lco0yEB
         ogTDKtNPG6jN6z397oG2d7rlLvbElGo7pkjQtgTxSxGSJdlWFE7sHRimfpWO+6izoPsc
         6t3Q9PCczFAXjk3HO5/+XtAy4pD/uZeEKqOoGXCgvZEF9VHYhEn++2/p8ykEFEzH3ddS
         cUuB5VYJX5+Kv3JAPi2MSOKchrNdj4RQNbtW26ujNgVAkysat2whu7n3qI4TM/y++RZh
         iVvw==
X-Forwarded-Encrypted: i=1; AKwUvBypj3jph4HH/cHsHKOqiSDmt8uELcd8ntKi0pzF6os47xwrg3GDfuDRXeOlaDnO+GM6NsTIAfJlFDWV@vger.kernel.org
X-Gm-Message-State: APuU4Z8VPRjUcrI/J+GHxBTge8kqcdp3NF5jBPwnXDPgf3G4ByQaWv7n
	GmE3PbpsoA8GGtqAN4xKiQG9t+IJ9Jqk7gsN1SK3OWl4sI7UHUCMr3ST
X-Gm-Gg: AYBFou38M5o/MGTQcM439Ls8TGaJRjY1vHHdVcSYWJYFhF8Qf3bYDCtqPI0A1lW/EpG
	SLmsq17vVXmuUno5BBMvBMbBJ5PoCVWUdC9jKQb38L/0ptIexDFMHcYAR5AAncTxL/faj457UjY
	OtzNx1a0y06ZV+tbnWt5tn86s44MyND+KxBWbwENUohk0tWfPZzQTQkm56ooT/ViYdFX96sQaFy
	FfH1F8UwcZDEDNfPlVZuQHsSH/ECvOPAOrdXpTiE7Hi51eErOVn/hQA86auHCHHGXCZad4dyWK2
	98sM2SyEB4TIVmU2qqokXCRieTVI+L8m2AS66r21PHgrqKug3aLWUJKU3gyqG3NsqW7JXrF66p7
	QgN1iD1gzWoHK82QfsfPdJ20RYDjPzbSLDOuUDxaLObracgiXxWQ8okkKTKDS8swI5fxIjWreej
	XtHlDjQNUSnmEqSbkZZES5B2ef3DlTYvrtg+x6XXh4nQrrtRksHP4vvdbUjTfdBbJ8scob7lxLD
	Qherim8miGo7WeXBwTu77TlgMSjsZqXSZ6HIfPhXIXdvEHWrMrBv4eO/tO83gXq06YrSy5ki4yD
	MDz1bMUnbqE5nWdzd1UvLlKBJafVEsaC4PH3puOYzg/F7ZfgmmSHnnEGGxvszRgL5LBrYyEzI+h
	O1NnnNARVIFFAm1AxG/2tDBnYtK/zZKPDT5WMo1mvBNIfVyBSrvnQ00H7b8OnzXoqc5VMHuG0Md
	X27eLPOWanmcd92ZzZNmY/Oh8fXFSU+YjTluzvhwNKcNbONgYrhsMA
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr9603574b6e.36.1793742014606;
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:02 -0700
Subject: [PATCH v7 09/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-9-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

