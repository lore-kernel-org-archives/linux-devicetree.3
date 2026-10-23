Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790373;
	b=0mXwO+vt9Pk4Sx+0SoQwlY/Kbf4fTzmAAu7vfvpNRHzDqcFpcm4+8+fXvTgVrSOSXkhw
	 7fbpBYHonb+rOfH5fNcE7LiykvH/AxuEuR2qtH2VV2USOKy2ph1/oNTnS5v3QaeimbHa1
	 H1hTiS3Mi7HmmFs0hm+Itu0vULMnpUjuxBLycb4m1p0NWvYD8Ij3ZjCcvcyyKqdFEqrJq
	 Sc7bP5dFq66eyTaJqDgMmszVTZkvL8/ouZve6I6EjeYBC/BDB8V118aAxSkx3Fr0rHLmh
	 UbiNbBet70mCs8U3Pr//r5EqTkTAm5oLonvneDURJbbN+KGgpniXdYBt7m1ylAxe48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
	b=sTD4Dv9xHtunz3z2DDYUJN5UCNY6BQxOoRvc4nCbfmMR23NrM3S9ijskhFaaLj+JYbeO
	 +kw/7ckqzrx2lX0xQT5ehWivNBuz4pNjWasmRWh6j//d51SovIXiH1AGb2jIlN4Ew+xjF
	 2r16XO4HbECbcOAPbft0cygxTfkKaw7riyblffcbA7JiiHqk1iu6s/ESGlOHHe+feRVXK
	 WbfXKdD1hT7r7FvFSjlz9xrkWGw05HKB7it052+WtbRvVJ3WRIoHZESI3e7GKW5HxT617
	 dLwhzDHlswk+L+c1o2e1PPuLW26ZtVIhA4Rml7qCGKkkbOEahQE7A9xHjAT22wCPyeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfKrrTH0;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0A606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F0A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfKrrTH0
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-823b938464fso900809a34.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790372; x=1793395172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=JfKrrTH0n5VQuIi/rhoK5UA64PDmOuJ1t4AR1OqcbZgn82yEjF2i53eXW5O2dbwj3O
         AVDI6Vah41EXndWY4AaJt+oolwlQsxyNoMQ+znMO4xL5Kx9JTldEnlJPzGNlQTAZgdjI
         /lURYPjs6TQ5h7BPNYECPsbZFs8U6uL8opBLchJqnXZ8cEVE/9pA2cD4ppTc8eeY4pJP
         mNKeY4OPIfnWwQgf51PCkhWof+t3WOSoPUC/uJWJPuIvXfevEKTQ3frkxKUPLYLTq1sL
         mMvKQEDFruV/nDBDL+fbkFs6KPZ7s9FJGs3/92vc6GvgjNbzP6CYKdd0J+CM6YGixexP
         yeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790372; x=1793395172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=PArc/ma9EJTir/4IPe9mXXjd97kwhNduX/AxvgdpZqlAheqT+crejGt3Y25lCxDcwr
         /zEEyPsqcd83gidyXZSEZHfCDl18S1hkaQqhVJg65tylan8BrgB72RUH9vNy0jkEm/it
         7FPRCWUbLmtK/X2vXyjOQuVlYZmq6Z/2jcdNGiiXDIg6eQcmUZfgiwPsqifQIYxP1ddG
         Wh1SlCwsxqFumG7e312YA/ZK+uYffbAZMkCXI4W83eKIXX/uCcBurZFgssETmpmC58Oc
         FK6K/3gfAAHTjX5n9imhLttF890leIerMVn5h6C9lAy/X3zbyq+cNpT9r15voMD1aVLD
         o56Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1zEovW6cdSfYyLaaq9ASkFqC1X3yeCZpiXaB5xooBuYpgbSLPhw1IbNTAFBZHt+mTGoeGBVgsz4Al@vger.kernel.org
X-Gm-Message-State: AFq9FYKS++JNVEntD7B8MoO1kVZeT0iZHUNrygcYvuE4V4UFKrqv/WTX
	dqiCwY/W7sxv78SnxTWDH7JV5HCOGd4npfx4CHq0PSj6VopwFTYG/bD0
X-Gm-Gg: AYBFou1pAjAUsUAQ1PIsv5rI+0irCXoP/RlQX2G0eukhrsV3u3U4uPRr3v0ylqM19AX
	Vw98/MZaf2bKtDZJnds1WZAetUxnIyBmZ23/xUgq3DVAW0DEIjzpLGlhd09M6pS0zCMeIDtoyNR
	zDtiR9bivzBfjt0C/xSDPTT1y2MyO6T3dlFDjcNKRKJfajsclHFsnOl0QIe9nkfhKLqaJV5NQ3d
	y/+tTeT0t+F9wa0CatNtjxIUiNNdAKdXpt3wQm9QkTHcq2ayejv0tN3SOi6CyCPXRhu6DyoLF6p
	kpeQSdTNC+MXaObWCuvhearu6bAyyPWSnkZ6C2vLvDi8bOeET0XUPSfYpG2tnHhBHt/fZIJRUjv
	KDNQJVcdUKV1Uu0Y/rmgQ3IU1Y7k0+mOj9JXPCVmTe6kAJ8icddYIk4wNmPA3mQsDMXwlAvFOtd
	TQh0nZEogHDDKHdwB4p5eFBpVxyk0hZh1P7j/xC6DF9YQyDLIQWMcaCdMRJmrnTEk7yvZabd3hR
	0zxTy+XALdrHjVYJGKq8ec7XsUGEt5oFwuaCDfbbTNbVBiF0mjCo7tTGQdli+KmhkcwfQzZ+e8f
	ZgOzNot/xitwUT1cQittbvsGOrVkNFuHPVDmRniCOtz7WZDG7t2PkqGnxwfAJWs+i9NrMR92GyV
	gGwjogjpeIZJIPGNLE6kgvTSpFULNeHiEA/72lMXJXb5JBKhpL4trrz8h9Ikq6nwUx4US1aGRj5
	NEMw==
X-Received: by 2002:a05:6830:640e:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-850fedbbf50mr560464a34.16.1792790372497;
        Fri, 23 Oct 2026 14:19:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:27 -0600
Subject: [PATCH v2 1/3] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-1-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Allwinner H616 UART has 256-byte FIFOs but does not implement the
DesignWare component parameter register used to discover their size.

Add a compatible to identify this integration and its fixed FIFO
configuration. Retain snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

