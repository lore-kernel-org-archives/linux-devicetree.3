Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440430;
	b=CAPHBOIJ+KueA8la7CibU7LT39nXgxnBH8E8eJBqKNUreRmZLIyQwhAQZ+PbQHCpZldz
	 eCknjUHVgX5MGqQJp1Hl/2WDtB5O/3UphgzIzOPFlFzw6YblUP+BQE1yYYQoA1mAMiKlH
	 o4Sp6wFL5YW+E0PWPdJeKsUGx+Fk+uaWJk1c88HgYDeIpEVNQk9+lAa07mO/4oJR/XQit
	 NU65wUMibkQPcKgX4A4nP3LblP1peYoG1S5f2tUurXBB0GGKxvOdKojTk7IEk/olbt1QR
	 DK8bdCL6pMABVsEN5uM4H19XCdcuIyjXwthNu0LWQEPyf0Nbmo4XoOQKE7dTbkQjteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
	b=wDfQ8pIIQ9pwRQ+l9QUObI6OOCCGyH0zaTh9C9AqfrqUtikF+r583akAlD06xJ5Ch4zy
	 ndDDEymPP0nuI/WKxank80BCbi5zfB877NdysM0I4MWeMqt/Q/XC2lMLXnSz9rjPQYP1K
	 xpMgOmDLWj9Eg5z/WUXl5DsjF6x4NyIyC35QRfiq4KB3UzBqaMeBCcpQL9nk5JZv5Cq9h
	 8r3obu2gxSt671ouPPm+HNUbEtVPvIwhBfZJu1p8N9zEkfYJg18qhdRIABsuZ/zU9ympA
	 5gGKkTDxB8CWWlOy1YBO86OwwIs3LexSK/Y1zFcBdGoCO37YbsJhDwruUFfZWlGV+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFjW6Ke7;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C000606A31A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C000606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFjW6Ke7
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5d4d307fab6so1132109e0c.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440429; x=1793045229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
        b=lFjW6Ke7fqt2qCOeXGHITKP2EScCXZd0ELJY6MwJisMJLOS1qIFTPrCr2eT4uKGhi0
         T5rEMvzdIhWysJgwDefpXyrveKX86LjLk54uzPkVPcXWmnq5GEU7kK1sVjVfixysUKev
         DW0Wx7GlV0E9+QE/Px90najt976ve8wiR+8LBZbn5krM0VxARSo2DpoNA8XI59F4GEGw
         sifqaooDNtbypP+kdTAeQ7BQHM5U8i1KoZ/+8iA4csVYkrzTj2liwDSKipLoNeRmaF0B
         ylXiAzMMZk2q4DeYUYeSZIkyBtQExkQ6YGXjL5fWK0fcZAl1h4/pTfL6d0XjFoRD1Z7r
         xVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440429; x=1793045229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
        b=tpuOHOwcdTfrDu8GtRWllxsCoYpHOgxmAS8FxMfE83Rb48WiAmu0qP656hI6Ytl79A
         DfJma1ocYjqNtdT/XBOXnurbSYo63sVNmRqkqu2Z73nO9q4893EAISe1yUI50s0boOUd
         TKV6XlTnnLjO7TzgJ3ezaYvhaYXcFTss8rlEOoBHKT8G24QblLdI64jZzNLG3i1z3ahP
         LccpwcwNaYb1Nl+iP+S5PDOoy7GmX46p11mEJxEhlrI3hs9EQ4RkBlNiRZWelI9UGBB4
         TzAD0WVlfvJIwa2cGzzgSOqiq+A8Ob6ZxgCEjd11KW6RwcWtNM6oUPLuKsEZ1svfpCZo
         /2Ng==
X-Forwarded-Encrypted: i=1; AKwUvByoGHhsa1Tho9e8O3pWvEYh9d9a4KRkQeUaRl7wpFDIIU5jzvuAntkK96t/j3UR7MlYL6PCazHoDefe@vger.kernel.org
X-Gm-Message-State: AFq9FYK8WphfZY5yMSa35TjagY7ePh+PrWMLPXaX+DPdQuEHQVXZnhYn
	x3bWd1a2YJVUE74SMOj4xKkWVcPwgmvG1OD1xGeV0e+tw9plRDn3pioX
X-Gm-Gg: AYBFou0UrdSMxIezUgmZ5RDEoRxAH4e4yDDolSxJfvpKEeanP6mmGInqut2s+SBKBi1
	bo6vMaZKyalBmK9nl4jYumsvMp43ds4CAVQgd6pMlB6lXgxhbvlzvYEcp0MGYNpYp4DgeS+9kM+
	1Lpiw+krLc87KA54Oq5x7gu0EfNOOB0cpv6i6omxkWTdY3xO1m/yls9VqHm9z/4edSOEh6HI84F
	RjHVt0auW9PCrETdpVHb1xBHvDUFCu+PwhjI6o+XjjKv50mRx5PCdXMmIoGIF3ujQqe2F9L60G1
	1IkLz8rFRcTG1ERDOpPqgN3+Or8o/HpCX4TIUwkGg4Ol4hRDD0+/Ft+WD7fLh9TVThtUo5NMKxp
	wIIsvLC+21XT5hRI0GQIClFu4qK+S6mTvZuJbMotQIzx76NaXWsMlwCdYMqKug5SXvUaI+R3eVg
	kCWQurYtJDdiKdXmslFLoyvE9j5+MTzyd0odWUA56OAUWh9dbbQbN5Ua5vSTtaddn6bqYN1WoyE
	oRdqRerpxArrCDxya9ckH/RWPh5S/nkATnbhoeOlN1mSsv6C+duWWoDifHdMEZA3jcCGzRhXlWn
	LfzFYuc=
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr3039279e0c.14.1792440429039;
        Mon, 19 Oct 2026 13:07:09 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/4] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Mon, 19 Oct 2026 17:06:12 -0300
Message-ID: <09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

The Allwinner A733 UART is a DesignWare APB UART, but it needs
SoC-specific handling so the driver can avoid stopping its clock during
termios changes.

Add an A733-specific compatible, with "snps,dw-apb-uart" as the
fallback.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..532392dd54cf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun60i-a733-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
