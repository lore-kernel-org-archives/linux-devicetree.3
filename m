Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721623;
	b=oXlp+al9rd/ZvqSc+V1Yp67sGNUA1fKJ4pEl4nG9BuprrR7cXPGgKQ1dp+agDSn4PgYz
	 IW67O+R6W7vtqhfGHNbeFJzbwEGdF17XcT8ViXiPtNwgpwlFaPQ7db1SbW3iJbYwiB/L8
	 EpJ4WixQc3cADWoOV/GWPK9nh4vVEoyQtX6i1lcvEIDuxDwnvQSa/EgOm2jcmQgQZJ48/
	 fNEW21UTWDEbP5ZKCF6vsJPV2OdJOv9KMIEhfgGReXfxcTvnfI+O14AcrUHPAV/sfVLCF
	 BsFBrjXVJEYfWMRDnj+P4kyENFPO3Fk0Z4bVGaweYEWXZWs1N/erxocqC/8o3MWufVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
	b=OjyIwYBzJUMMbtBwkhTMQcIVNO7jTHsWeu/T+IUh8cz/kQIrFojOQCBaMN+9mNVQ5xFv
	 Yh9HMCWhrVzy9QN/cVMaYKDdN4frhrzSKbLUZPGB/hG5OAAz7qR6pQYugvQjEWiQubpxU
	 B6Zmn+BKgthZwYBtTza+VN/D+TdDa/oof9zbY6wqlqSzT/pyVBpj6mwJfunno3rUlkbwj
	 GaTWSjRgLB2/kUK3a4DcuBkpe7EfclL5IanRJSsD2D4TkF1NHJWujmjYTOxBJlfmU+PeZ
	 FlyrjcHcz1j486vFUSkz6qxmlUvDyqrPLdptV5ovo3ratL6BsXQBbgT/cecZIksYV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acvmjd2p;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E6606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acvmjd2p
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so46073165e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721621; x=1796326421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=acvmjd2peWYeLhtuO2XQIlBR76TzBn9iONnK/GG4N50fLUHZZc409BWcVvz1asIvOb
         eNMWBmBfLw2llSoh9xeXSIzcDWuh2hKI8TY03kOmumbj+qufnooNeLkYximBimxw6+wT
         66SAPDQwiooia/dI/YYv90u7e+Xa+F2GHeWdcp9Y2kW9zCFGXuqOosLkVmKLDKh4X/ev
         61nk12qBQ2Bn6z5/JQef2JNWDfiQfghzajwoiyj3Hw4Ha1VtPVqOF/rxOUkZKYVXT1l+
         2kfyxT5vNpAoHSFNBu1smOwxgemLl0p845nfTd9SYGW27yYoyMhPMQgr0iTpT5fTib9x
         IdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721621; x=1796326421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=qFgqsZonsDcWUKQcKxcA5gnyNj6VWrG8yjsOalLxnXzyEUOA17I5soHRgYZK+U0ntp
         SrRe9vSHcrv4ib1ZkiApfRg1SeVBeLfUgcUpdS7wgiRPsMUG88PLf5QiaB1+yvQsa/jJ
         IFBVfzgggQBOzwQzqomzitv5rilqR3d3sxQ40Seyh1nArjsJJsf1OX3BgB5/C3/blaM7
         NpJLkPQE3zFxcMMn83k4kECFf1cKqAkwtt51GtSEb6SvO6tJ67pE1aITT24Xf2o4ECOr
         t2NMDIwQdurG8kjRKRQ9m43rBPyCDYrr0KVYk+9eO4KRl272dfFrQbgz5F3YK8XIUJPf
         0yYQ==
X-Forwarded-Encrypted: i=1; AL+hErEecavexsZFoai8Dq1E0e+9cyg7YAhMXYRff0kW+1TaoLFS7LNVbdGONLaa5h+1nMqlL1xF5rR/C9xA@vger.kernel.org
X-Gm-Message-State: APuU4Z/aIGrajhEPM02X8/pZ7OaOiCqx8V4AeMl8c8zYoVRXPris1Oyx
	lKgZB0x5rfEQMdo5mhe2BCwdaj3pzOb90wVDLXedikT0yqlBo/ZsxisF
X-Gm-Gg: AZFdTZcjfy8bT+372du6YPgFY4A0mkLqtuOpp1VbdSVlBacpSe7hHuqOwAYoz2aicpi
	g9kk1RIkR6Qbvm3n4AgOcJ/l42QcURsANCiXG+JgkKt1QgBiMMfNjdYsQaz4DHbPkSGcUEuHyuk
	Ecc3H+AlanARhLYHGlczzqMUHWKhJUO9fyEqn0NNRhZvqnSlvuvlt0NtvIN3Vd2gcWX2LdBpVq2
	kJzt9/qBNN+LHSsEnhYOBlVPRQd+LjaftvRnGDI25uU6Ji1y1DahgNf0DUH0t9MaCnK+29ivMtZ
	W1TdTBHh2JYVCqODw7rqCyfKNI1r3gZxYha3QbqzxVXH+znFnw06uI0WytFHAwrVcNXdhvZDqFq
	QzrFWobYTv45+H/d9w1C7bwoqjRfKMcajAXiEUYm0FvEqWO9bWkyrI1KGTcOhZBA/tqEA2QwC/w
	XBRZd+EPYaCFn7xLEMk13HGs/5QkBhO3FwxGR38+8P8sCwO+qzd3/U966H1WzGxf6nYamEf+i9z
	70eJn0R7TC+Tn3O4oSz/JxD0lMUhPP6jGxIqypHbCSVzQA6hs3wgAjkkizACO/l4naI878pbANf
	LKow+LcQsnEriE4Jm/leF0CZRLql/qSEByj83un20/w5LA==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr425835985e9.7.1795721621193;
        Thu, 26 Nov 2026 11:33:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:40 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 25/25] arm64: dts: amlogic: axg: add crypto node
Date: Thu, 26 Nov 2026 20:32:41 +0100
Message-ID: <20261126193241.1471372-26-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..e755a019b384 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -321,6 +321,13 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.47.3

