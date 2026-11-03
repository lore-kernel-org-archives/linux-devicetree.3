Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732134;
	b=mn3apBb8t8UoXDmBQlep3gFTboOPNiNzGMAZMpnA6fzEWkyUYweB50SGE5EDI8Hy8+WT
	 Np5mMnaDdcimBDgYiQY8FnhQgHWhrffJMYReAVXu1Rz4JvFEAXsl7sqwHu2YIm17BC/2O
	 OTiovd69s1bC48Dnd1k+Ag82kY2hdboWzdNKBLA6PG3YkVesHDGKU1lIC3tSOMn0/PgC0
	 4S+E7jYRasCDdpVrz4aw3fGX3Bdnqv9vYgOdCDm3DzGu+W1tffJ5YF0apE+HgQT2gi9x1
	 nrv5VdRXNRT+nensgW/uyJ/i6yW15HgL9Y/YNKFYYkos98mfKSWIHr/GbeTGg4fMe3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
	b=Jxn0v9Rc9G2crwrizdeE4LeU5DFDPez8YAQCTWZCJs+rTPwfEvX1Sj/5at2nG/M1YROu
	 2hqXjYKIQ2HzOqZLuF7N/Rqau8I9KbML3cIsj3P0ZqfWtodeOcn0KdhrmIImyTFMThmiE
	 iEWGW9RrX0w+8VWJiT6zF1z3nXbxtibIp4T82C8I1lYAI21ud8UnA1k/5Nw1PRy9xwp44
	 W0G+1/hLiIyuNbN69+A0OAfJCo+oQEtsqPmI+TxA8PQBRofJWPLac2GoQbrXIdJn/HXC8
	 0sOExPDvEI5+2zzf2iklBZ8INZiIkH3e4N0XoimwYKvRKG37LDYB/dTqGskna7MDI+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syg6yrif;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6BA606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC6BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syg6yrif
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0f59a5fdaso42375667b3.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732133; x=1794336933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=syg6yrifhO5FTvdzlCEBvgnMjoFlztt1yUAw6S7eTwC9mV5HKfSS4MR8FKC4czBFHG
         6xs1rkdd7ydVYl+mog73EOkUDiSCMZK0ULtxNLHv+IyYqzDOfqq8v2C3fVtch9yQYiec
         VN9WXayjq5nFdA1VK5ngCZ0JjXCCusjw3SRrYmj+Z9ZZ4g1iYEhesbZ6QP29LpZlcpoO
         spx32SIImKCS9MgneH5mH3qGEBhlHKRHdh7RY+ujLpIzWYW8mLaPMEDcluMik4vY5lhi
         jJTy9H7PB2Dr6SsB/PwUyzigFVjRzhchE5jRD/STHi8T1Bahm69tZAJqtIq0vr/5+gVV
         FeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732133; x=1794336933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=H7LSxvLHKLGMHjaadg+7RusLRxJR5Lz9UhCdeIlaVHYFgxyA4SRGAr/R5d9VViPQ2A
         6d4C63a/7XrhLah5OU7OhGZVh6exuk8iNYTO5ufATCNEXQnElJ1hIcRUTkX2dhSVr5DC
         A5GedtM4uU5mzKE8M3ZzQI/qzNiSlSSPQGRw/keNE+hD8wKhBhIxsbaAxuQu4ke85lQ7
         kjltIrZjwTKd6HCW4JJv/KsBXqSBBpGZ/YoOQHeYWpmu3JiHhFf6c9CWcfV1xRnpariM
         DI9HKmp3dCN7xn3rUuy9njoeTXgUHRr/2EPTC3tCJmrBAoP0SaCgyZtDrM8PZR03CfUo
         MLjA==
X-Forwarded-Encrypted: i=1; AKwUvBwAaK8hED2eJr+xiDFbUBZBytAa7mj85HEKnqhdBzEhFAIel7TlPfZUbUdXNYK03lsv3riZxxAHlSSl@vger.kernel.org
X-Gm-Message-State: APuU4Z/Od7fLT8ci5kyWa5lhZ39iSOkK7eRObhjyk7KqAH6ZqnA4+OSk
	ynZV3SoxoPdq2K7UKetnu2f+bPtj37ep8/pXzg4VryJPt1BF/ybip598
X-Gm-Gg: AYBFou2p3j0Hiu/yRLhosUvFEos5vZliYIqwdBT06E9MEGDVwWZXjK4/SpzYEpW+LhK
	gbrfQrl9UtQY6M/w4y+rs3z/M75Jx53SgTOOLWZUCUVlge8LNMip5vpAenShCvpsLvSqu2UECrw
	a7fxF8VjjHbQ5/Wijgi4CmEQdqAyw4wpRoqNyI5+0YS6i/dpw79S2pawMh9Cmbp+65mOx5bHXPB
	8gwgFRcvoNQtF/p5Ea8779HuP4Z9hNnYFyC+2txQepIY/B8MmAnevLNWt6cfoyRky7h0eSUmgnn
	3iRz/LwrwJf3aKBXVVl/wP9Y/UTd7OBVjMBaa73LgH1QTKY8LbXZB3ax46XZ5vqtIzyAbX4bYdQ
	F/UsKF46a9gNhXvuBpMVCiF5UbESe4Z9jzAgnd1AFTMB/8bZWRE17wORIJUc/qwaHg5so46fT9y
	kSBhd0GruaFa2Y/toVs+39wRdlFkih/zn726MuN5CMlEdjJR1nYNrPWkLIO8hjrdPej6qR8JDzO
	rgopuZ6wEAudyGcuinHJmCstK9qa5c4qWqMDU6XoiDNuaonuvOABSCIn9HTGAKi/z20okctgA6X
	cFckXyHc0XSbdyi2QZ90d41k880fwyBV9dZeJd3Kswe3fCnKQsA=
X-Received: by 2002:a05:690c:68a:b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b2b671ae36mr104605737b3.37.1793732132595;
        Tue, 03 Nov 2026 10:55:32 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:32 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 1/2] dt-bindings: usb: microchip,usb251xb: add battery-charging-enable property
Date: Tue,  3 Nov 2026 15:55:13 -0300
Message-ID: <20261103185514.72144-2-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Describe the battery-charging-enable property as a list of downstream ports in the USB251x device tree binding.

Add an example that enables charging on ports 1 and 2.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index 0329a6aaaa928..0eb3035553c37 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -230,6 +230,12 @@ properties:
       Specifies the time it takes from the time the host initiates the
       power-on sequence to a port until the port has adequate power.
 
+  battery-charging-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies the downstream ports which will have battery charging enabled.
+      Battery charging is disabled on all ports by default.
+
   swap-dx-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -264,6 +270,7 @@ examples:
         manufacturer = "Foo";
         product = "Foo-Bar";
         serial = "1234567890A";
+        battery-charging-enable = <1 2>;
         /* correct misplaced usb connectors on port 1,2 */
         swap-dx-lanes = <1 2>;
       };
-- 
2.43.0

