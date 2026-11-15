Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733895;
	b=PK1Cg+m2+9laaYvRolWZKa0m0T8RWeNQg3Qux2V7S4KVSmGPVHpRDXFGBGqahqiHuWCs
	 U0xiZWjl5td5YOVlIHECUeDAO7qC1eXkkA9BizwRW8bszF/Vo9YfiHDOyoxLzWbj2ULLq
	 R+oTxVEfohuXpWHCsJ98mH2D3fKvcNJEOThgcIV1MuowWsRAV3dSUVfdsYpFlq1AVXkLv
	 sr3YiwddSwC31RNkUyY50e+tJb9ClO1Ym5F80ljtVH9NojMoWu+Dks+j5l7LW+VPO8C6y
	 bJxo4bj3PG0Y2VlndSErZcC8SgK8zrgYfi3gAYqXh9CWQJDHUrT2VTGmsgtP6311W3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
	b=gGhSgPqUf2G1aAkds0DfSBUkG/M97PCxEsHKgu1L4qF2uukYfQXHiqmRsfH82JUfx3bI
	 vjrISCcg4DWlaXXKNx/c1hZ1m8NH9PZt4y9NJCgTBN/l0aE9iCHMdf04iORkiwSARdSAF
	 siyzUeOEBgZS/SAioSVW8sILAbJlaVJNtkVN1fAEyCxhkkVlhbJA4gKQQa2tyNwP7tqwp
	 YuDH/sBbDfSPtAlFmZ/JHS0tJBlR6OiCcWwHbCH3fTjhlrn+94XgunM/b2c9tt90g9C7W
	 X64utrXRa9R8nWzIC+KiZ3ibehrMu9vagsGimZoHbmZUHuwVKS2vcbitgI/DKzcyrgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhcnB8H2;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA35F606A339
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA35F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhcnB8H2
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4682977f9aso386705766b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733892; x=1795338692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
        b=VhcnB8H2O2+aHJtEWWYXkj17gc4oRvabqTbRsHIW9PCroWlszw8zzmnKUuHwftGIUT
         jqxuYsWhxegfsoPv3F4fqngCnsVD6tEp1LAOs3y7z355+oPtPzqAfmLC0MISVhdaEVqY
         Vp3/elUXaFa84KCT/vxVK4oeGxtSkPvrVxWO9Prz5CPE/sceYXN0zw2nQTxu5TAS9+Gm
         IQzeMyq6YhKnezCrPXGRkSwyG+RO99kjGg1lL5iEvI2x24Xk8jtWQqmfVpqZdYG8+mNN
         plunPJ8sk7+Df3B7m5besr0VQZZabn2Un4TMuxw3IAORbduQf/+AK4N5EFOuSlJcIhmZ
         qWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733892; x=1795338692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
        b=saQZkZIQsq0+BeqHQZWvS+fgmQpZqvvPZEKo+3j9tFp3uYgmJl30FkXbpOb/fH+cxH
         GRM26nDh8XU5wiAWXV/MSuC8mI5r8fpVtUaC0yXbxCX84uYNz+zM9oSin3lL6etwzfK9
         7LfiRd6HAfkwvoOIpjitpXyGJR0hqY6fzUzywgIqKUnRK5eKtP2ctDbaI9nrzVNAxqE4
         XiSyLQWPctlAYp0wT/BQjSQD84dFT0Ru8shJZW6Ri/yvHhrL8IvcJXscI9MvQLM7jD4P
         ydbzibhKVHm3/xOcDqPxPJ9gFzkrB49/I9cd99yZEXIE2IGnOpxoOkdIq6bEA5c1r/U4
         UvjQ==
X-Forwarded-Encrypted: i=1; AL+hErGGqHpmRN3Rj5DgPxhEElAAQQD4U0j7rZy2CND8ekEaLZ3Aq/FY0DuDHmAK2cW1dJF1Qpz1IeWyjeiG@vger.kernel.org
X-Gm-Message-State: APuU4Z9j3PGO6+idgVw6o0hMuHxdpQBXb234zLT/6L0Oecw/WSOgCCtv
	yJYY57jwcZYvi0pHAGpmAXhJgxiuCLs7RxIBorLnH8EsFBwhQnbfGvBu
X-Gm-Gg: AYBFou2x9st1AdJ46PoXnQxdjbB5N43XLLuT8NL3GgWWC8ROzctcdaJ1S8r9hrSzhKM
	Yo0kPYWr+Tj6KJoEqThEuq4tQqlefLnsmntCNTTFw5nxVuGyM1N4PaLQPJ9339mLp/lOowkst0t
	RXNdXbsOtMLyohBO10YlLV4+qPcTBhKpR3xRYprRxyRp685hKFFt0sLSQ3jw7e8gNtUVeDuyJDX
	mOJPFRWDJxeBS5YAfZK3lgmbj7y2cmesLNJ8QU/yarNyuIJCtHnwOIWtlYYkVpmktgHUdYIeJqH
	OlMu3+L0sz8bA13nWgCA22DbLMpnBUtWSiTVr4BmOe4hZ9gxaK85LpQ/4oE4OmSVTsH++lBAj+L
	Vyb/LE9hCtFm1H6Q2iuJvzpqRhsXmD8Oft5jy10ZFEx8Gl4zMYC7aqxhaaisijtJQVDt6a5ZnV7
	d7b4+8RNG9sN7D7Xz8CD4gaVSpc+rhtnlrh7YWqzNoHVgmAa+jHL8tLz3GHuFKFfFpSHxOF5IRx
	6LqrDUfcf+YW9yfaLDuM+s8oQc9HGrc8rDIh2Fd0Lk4QEY9PljJylCABhyGJH1vcuWA1ufSu0vj
	gQyNdAL4zzZvQ7kZADDNQWvxvn2srvxPvNsYewemI+n2WKmVPc+ztmIlHs7V8yGCQ6B06SHQhVG
	a/r86OlBHkQ==
X-Received: by 2002:a17:907:8e08:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c5095db2440mr698968966b.0.1794733892245;
        Sun, 15 Nov 2026 01:11:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Sun, 15 Nov 2026 11:11:17 +0200
Message-ID: <20261115091120.108684-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

