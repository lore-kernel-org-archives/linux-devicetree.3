Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649527;
	b=wZ2fAObgJOU9XyGr2yggVpCQxOGCWxLSlL/+mxlJfLJOkdXXhIRs4eHBf5gyA8Vx/h33
	 zszx+D7FXadmyDKbIrjit+fczePhF4OGX8dzyR6xuObhwvCNqJKKOWUklh6RYr95xrycO
	 FN+pXXE1Dxokk6Y/RGXAu1o/uFaUp/MZHBPU9eb7dPlxLC05ziekZHmGrlR0sLBgXlTd1
	 oDO8vZ8xMKY+5KgyfRRNl3OIkwa/5fKZrW3r5cNfVA79Hi4qJbJzRmMgfqDQw3y7aDDno
	 SJ8gxD0rfHNfHmihnE7qmx8Y7SuE7MWbgYIon1S35y0q8gEjHIw2P7218QZnoW0joYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mw86VSI5sCZ9uIOLp5gRfRDyzqoaa4r2NV57xZBkoKM=;
	b=eSZyvEWqpN0nDe8/Wurtt7LBdTik47vXDWaly/c2QL5QQR4u70+q1Qs511VeUwn54UNf
	 MlHRFdWtmqpy4DtQ1ihL5GLIB3YyB9m4hPDng/U0BGSnuSvssG/74COz1pT8+gHqGLZEC
	 JULDp8HQ/1XGnC8GucWmsL5p7AgaC7tOW2oELbQQwKWieGQ7tMN+olzQspOQVXlorDus1
	 /tQUjbFBW+V9DkVD6vEPy56IKdsubFzK8GEUHSFmVs9NEFaXCcC3hfrT6tT+M2yH76Qlp
	 MC9p87pkMd8B9g17OWHo7IejPGOeNHO9sVNajXzu4NZz30NGqapD7ayB3UZzFNDGF6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBU4pDkK;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC01606A6B2
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC01606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBU4pDkK
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso45611605e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649525; x=1796254325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mw86VSI5sCZ9uIOLp5gRfRDyzqoaa4r2NV57xZBkoKM=;
        b=lBU4pDkKvBlERshZ8WMzaa7VsMOZ03YxmFgDP/stLfCv26zztpdyWvrwfGeRZ9KQpj
         amfoKjqXQUjgpgLaK1HIRKanT0ImeLcK894wh4/rfoy9LEzEu9H5On/gZLZ6oJ815TTS
         XzcbCTu66Sg6LGDV9FFla35z1Uk9k714VtgrURDAo/MncQaLGNm/fBNmoZwb6lm+2b7G
         1FvXXyzgfch5xT2ECGtTHTAY1K0TX5EFb/GqczwO9yWGIgbLF5QdQcnDWeqtMdYjkSjj
         ehgjnm9Y2C/2iL23de2Z58j9+OAEQ53jVWutNY+2wvEGOj8mUqw25vMYPnwlsIDBSbSJ
         e9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649525; x=1796254325;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mw86VSI5sCZ9uIOLp5gRfRDyzqoaa4r2NV57xZBkoKM=;
        b=sIdDQRI4BEER4+cCFbLW1B1cs6BtUUcayvYQAtVnflh/OKJyLgbxlRR4pmeeTR66nR
         HjGRjLxJnlxz1NdSVCF7ldakac4/Ob16BJGbfwijZDYUtAmn5hZUSXfxVsdUKGzJm49o
         WkPbo35UxCKRytprs7TdiytQmZ503pS8yC3zMQUNmJepO5vw1xQx1EQLNndl4PEm3LS5
         JLZqRRmwId1wYVz5nj5yQseV1yav/xhAKk/R1ECpNN0mq9JMBQT/Ep27/dBcmgAyip43
         k4We81s3z/I/Ycg1vrhAV7dovp+CUhWErPOt+4z9+JPuborssjxTieuUlgrZK9Jr0FtX
         lksA==
X-Gm-Message-State: APuU4Z+pC7iU4hWq/nbd1i4NhSmdwYTLCL1qPNPJdQ44bKfo6kUGziGO
	iL0R9phPEFB9HR7xPnW6+zeaG6s6tVjQlX0zckgXkX/PUuB7dPtSVtJu
X-Gm-Gg: AZFdTZct8AzxFObTDqFqJsCFUmYp+0+sz7Z+390mQmz01GJEfl9z4Sdpw4ClNE0ihN4
	MW6GBsFP1R5ZzO5m9qGhTENG8mR/V+5JlJNX/V/CJZb/LQ7Diu93PtoZTo0jY6HstA+Dyu++7S+
	w/PllfqozoT2kE4QeMLGPVTyid6Zh9wHOx6f95nzNAhzZzO00FBx9hXk5dnufQP53oTeLJoZZna
	ldXVNpRe11u5TnkGzgG2EJwJ2hQsg8ZhjVkhHuUXLsgqCLIB8RrYRBQFur/0rpTgvhIOXp8lNb3
	IlLAM+/UHq23YnRBoixFF1wBrh3zEZMG46QC2a2rmAi9HXMNxbGd1gohLheu1Rpa3J6QoGQyRLI
	Awt9dOr+vpNnGMVjJK7L6HDDN4+ng1qCEYLWr/GDL58I/q91izR2fMcxRLtsT6c0jHOT511j24/
	GMYy6XJXMh35BEn9VZoSCZWziy9rmCVwdfuBqqFJog9ayGdgLtEEAj1a+mjnVGnQCVtSivN9Q3V
	xNZ2IoRFh6PQDGPCmwRkj6KKSSOpUANY84YqbOIdZldZI245rbAJr5uBkd2W6Us8pt98uWaotfz
	4dyLrK4eJ1SB2s4JVVOu63gLW7yQtQhLTocHfnsx9h2wsdIbsd0EaX2ZivjmbLuns5BSahUe4Q3
	xQVNXyQ2ZNQ==
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr398097975e9.2.1795649525443;
        Wed, 25 Nov 2026 15:32:05 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm572054705e9.3.2026.11.25.15.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:05 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 19/19] MAINTAINERS: Add the Espressif ESP32-P4 platform
Date: Wed, 25 Nov 2026 23:30:20 +0000
Message-ID: <20261125233020.1380594-20-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an entry for the ESP32-P4 Device Tree files and interrupt
controller drivers. Match ESP32-P4-specific changes in shared
files by keyword.

AI assisted with validating patch routing.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..538f1a353526 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24162,6 +24162,20 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V ESPRESSIF ESP32-P4 SUPPORT
+M:	Vítor Hugo Silva <vitorhg20080@gmail.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml
+F:	Documentation/devicetree/bindings/riscv/espressif.yaml
+F:	arch/riscv/boot/dts/espressif/Makefile
+F:	arch/riscv/boot/dts/espressif/esp32p4*
+F:	drivers/irqchip/irq-esp32p4-clic.c
+F:	drivers/irqchip/irq-esp32p4-intmtx.c
+K:	\b(CONFIG_)?RISCV_ESP32P4_CLIC\b
+K:	\b(esp32p4|ESP32P4)(\b|_)
+
 RISC-V IOMMU
 M:	Tomasz Jeznach <tomasz.jeznach@linux.dev>
 L:	iommu@lists.linux.dev
-- 
2.56.1

