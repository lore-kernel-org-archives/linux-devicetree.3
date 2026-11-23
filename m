Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446460;
	b=WDEqL6JMH5cJvBUkxlX9OQIjm830G1YfjkGIdmgELsDLQ/MfNxsSXUrusB5K4Oeut2Nt
	 0DJIy8j+3P9zjzaK3h6fZhYRpVo0rQ2PD4aH8hrv3pgCUq93cP6+2sasjLcaJLjnlKGHh
	 XuzNdsk1+/3mvehYwiu9gyIgc/CoBxhcs0/69iYVsw6mDAfwZ5bo2ZcW1bpFSxOCupLaL
	 9Ag0nJx67Qg77JAqdDsixWeFzmn9pdFfZZiKl5y24wYVZGPb8UGf1Rq1eyCJajD7n+J4E
	 jtK7ZL/l1fCUQBvC92E5SxWYOkEIayET/W1ZPFNiPA7XzG9mbptE1LBbLJGrw4orMuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
	b=sPywNizV63o94ttOsJJlnHwWSR5z2492d8ICRmTCz33YaOSkiFfZn+WSGVpaf5Vropuh
	 vTcvE2MTJoTWW8OzXuUSwP4H9AkG4N+Fg/wL3BdmbJY1k6SSzz5ivzli2JAwAhCxtZn57
	 5r7Qzku2T7iAg4+HFioLKoNUT16PW5FC/LaqeAxpF05i5ZBunXhFCp5DhNc5VYfOZaiWi
	 93kjhJqtWnj9u0HmDSGMlXLEhBkSz9QB8zcR/fdKnN/jDV3rUZQYZkIXDZlxB77KpTD5D
	 1+ididMi4qR3xUYmmw7d4WV9XobRvgZaA5C94jnx11WVA+nFmJdWK/pUgZkwXsTGjFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KggIy63c;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310AF606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 310AF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KggIy63c
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso4026618a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446459; x=1796051259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=KggIy63cUOF/wLb9vIJA/xy4P8AXOgUW7Dxtxd1/05kwp23tSarT4fzRj3eDS75YCt
         3wirC89MyzFi41LnZmF8VdIwBR9H4u5GgAEsYjjS/d+dMe7ltrDQgBL4LUaDsRk3ie2J
         IiMU9XoFdFS4juoAM+5IiiJwOlMlN4zaAOnohB1Be0ALq5za7JAOwdfKtJA3Qzytqg68
         s2E6bMZ0JMIm3dMW8usaY4UWoAUj/irnLvcsza0O1byS2ElUNmmqH4cSVbXUY3R4Zu6y
         lrdPfX8fupZa5Jv1gXICHIbCptn5clWWhWBJTVqkPDlcVQgmFkQhI5vIx4Prxm1blgLL
         LxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446459; x=1796051259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=QVcFx9215kDmgXB4bUkynU8ZnxKaAfFcKMCONw9GMFdmaPezv7XJ/TuHCLNI+FVg2f
         3vRuCE+SHe3USFIlXIaZN5/zOuwfA4b/E/sqgBq2RyRFND8EewSfNhL5elfyiwahUE9y
         /s/Gwt3Apfcz6L7pWoZdM5osn4eJk+ua4M75wWlEnmGue1/ix2M8E+7YBe1dGzyZ38lE
         bNgBBdup7wAOqLE6KfomHt8AHW8D50hpCEYKaxBWEUNQtqVjam87sNEiRMwhFw3VHMWT
         Qvg7u3REiZGpA5IwncTmFnxavgiyWpmbl7gAi7kvj95CW+GbhuwFAXOSFA8CP9xMiPY+
         NnHA==
X-Forwarded-Encrypted: i=1; AL+hErGHS0nV4o48GksSD+m3D+2si1pT699Ugkb9xHCMaGUprTMK8SLh/zCmrfv8LHNIbGPSFzoPc5JH5juE@vger.kernel.org
X-Gm-Message-State: APuU4Z/LoFMI+HbpdFZlLbjK0AIccwrYeaXp0+jbCpMAQl4LWvNn7lYx
	WldqX7V/jMSpZ7Wqrnl9iCVR2bPgB0YtBZdqBXpvDOcVzJdC1dNMVGQ4
X-Gm-Gg: AZFdTZeJ4RKncs7Fs9zFQKqW8wmwGgRLc7ArYtXN8bC+j3i4HuYIEmioI0yC8L4Tazi
	XnZpT2FtDLZwqFJbbXecIYyszubR+00pcUErxwsrZZwWWp2ZInEyQLt/Fm4KCjW/yGoyKnxZn3s
	1itMBqv4vbHp/uZ0N3yepFEwb2jyjhgKKcHad/iDgDgMhaic82gEhLNs9onaDXJCjD7h9FxmBR7
	70AvkKJsBvluow1vUdDnPKjVom3pXHB1WvqMnd5B0uoBSLeUG5Y+hLOsxvZn7f+m7p05w+qOR8Y
	zQvsJZdbgcx/DMU7bFV3S3U4mUjh/K+5LNV7/BfE5A4Ea6oSPz9svtPOGvU73se/X8WSRWnTDkt
	tO6WXvudvHVKyYnP7eIqFsw//mj92MLN+LLUQdu1kxs7SmI2ar3xZbWkko0Q6qAIRGfl0cGe8RT
	ODTKoKkeFjZTTHLuKNJhYorRrj4toK6+QHtIugpMxtRqJ4ov53a9W56nF21ZdDoGWnr4VS1e6yo
	IIsFNJz8MgRK6+ZG8ZDh7UePKrKN9lPkI6sd++KkliW8be4KMN2WP8bxC1oi75FVD18m04sMHpJ
	cPU+XLEZtyJwfsH7io/EW4reKyT1Z1i0GbYSs1W4DkXw6zJV40hQfQBSsuI/nUj+3npOQFrMCmD
	5K9Q3mOmb8g==
X-Received: by 2002:a05:6402:5686:b0:6b8:823:9b4f with SMTP id 4fb4d7f45d1cf-6ba37eb1d98mr6528446a12.38.1795446458383;
        Mon, 23 Nov 2026 07:07:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:37 -0800 (PST)
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
Subject: [PATCH v3 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Mon, 23 Nov 2026 17:07:22 +0200
Message-ID: <20261123150725.212836-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150725.212836-1-clamor95@gmail.com>
References: <20261123150725.212836-1-clamor95@gmail.com>
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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

