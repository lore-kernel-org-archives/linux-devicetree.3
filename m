Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227046;
	b=EEmicF83h0UDEY45lmoFfGdRzQ1FutrI3SCAEDfjwoFyfIRuy+ahoku91EHiTLTIy28Q
	 6oe/Kpex7tGxLD/D1RlAQdRjx++4l2b7qcvlN8vG2SJecMiwmoBqycDhgfMQoYJLm1oDr
	 +mMDS2+0DwkmFhNHLo0U6AY76CWP2BobDbxBEREFWWUEQh+SNjAHdG/5HNqbRT5Ri23lT
	 j/XQCMORKqMYuA3D8SjqMEGtuPG6Ox74hjUK0rjfvXzoGNTVGYls1UQnYMWM6/oVPuYes
	 TQbxIxkyYzE09QMPczFZ0St/DtJceAH1NiAr4RZadc0JkRV6hjVoOwGERSKpC0rY8Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
	b=uJlMkI0xN60efood/Xhty6IaT165mzLbl070fqmZY5unBynV2F1qlxPhHq3CDmLmh65u
	 oOr8+jggPtaUZNz+nZSXdZkF11vdRgXApg8O+Y9gHcfwQO0MRSCNKCDvUJ8b/ZD0RvYRV
	 ynqsnb9IjYw5/iA5DP0t78MjgsxBL3J4IonIpSWjt6jqBvjHgw6NIAWCoLSNLY+wnTLIn
	 lzUYw8v1Hd7OY9Mt/eqTamLlC0TaurRmxXNLJgVxpfXJ/SoWKdHyg9Niy0A1H2SiJqCtO
	 1Hn3GAyLhspZPF/PsPujlM4xhOk9HyMhicR8X22hmxh+zh+kIWUCMH5GFk2PW/7QLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CWXifbq3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B16083611
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E8B16083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CWXifbq3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e4831c028so875462f8f.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227045; x=1794831845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=CWXifbq31+Kzv0+HgMY/heyFpekSNagPUM5+ZpJQZMraafm+EM8duq6aRFThpQeGIg
         GrBAb4jOuPRRjJfR34RL4eezQcYoUGUCxAc/fs127An85nnZXLiZlnflJW0XPXCL6J8R
         miGY0B3iYEqcUXZeo/PeFhwY7tGVJEa5454j0elS4T7Q6g5oPbMf3VFhPkzLyb/czkul
         AAdkR5ol7ZaiEF9EJ8GKfQuaB35mFqUqOeiQsMSWAqJ+inYNW8usA4ZPd6kUULCyboJ3
         wQCa9rvGgjM2h4dxxL3Gi/hnzX0dIclsyKX75vpXvmaETYOw2chfsWcTD8GxJstw3dnm
         vf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227045; x=1794831845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=A76V7dUfTA6IEMSfMjcDHcGzfQgFYuvkit5metSjUOt6wr7raDfV/WLa+Lm1tZUA2D
         zHmd/vsm9Cia7SSw01JoLj+dRtTcs1qtP/9wQ/FcLAO8v/S04hZ7lyzCRFTLTQ5Yhw9E
         SF6NkY+Wb/q1rFsP8oJj9XT/dZ/uOBgY1Dx8MakPDPb0NQjW0w0zEcbPkNmFYsQt/0oS
         7We6qZL+8nef38nyaPA+YJI3HnIjuPbsHQB+LpeVnaE95JqYeNBPGw4VwLjxPsJb+M1p
         dBp1mF+RVMYFjysdhlv5pQlFo//H0VM4tNlh7+hm+FDGrxfjNSjH3fwGAW+IaRE7xH+U
         lkHQ==
X-Forwarded-Encrypted: i=1; AL+hErEhwUkLGXZdCek1nq42QAkAgi05lpwHQyBupnuCrGBn/7Gw+aLoY5OPsRKwXNKxoEiP6RVdxGiHLy/U@vger.kernel.org
X-Gm-Message-State: APuU4Z/ruFzKdgkJOmMCBdcz2c5mO8NGXA3FWyaDyjQiAxDOZVlFp8c8
	n6EblneSBZIdlGd1WGmDUYit6BQNNWxuX97/fn7fAG2/BHjwBmI2BCh1jBZyKvVZW9o=
X-Gm-Gg: AYBFou2SReyl0GEOnsnIASw/zXSr4hW1p5MD/xrl3H+U9Tv0lSEISBZ3qO0Y3MSpvZ2
	YyflpQEJlJ0jVT0vk/+6zNAg5hRJtOoe7nXFKYru+GNlML75yBP+Nxs5HFK2zKj7VPRlJGqvZwv
	9+CMik2gcrnXRV3egTtrCVtJGRT0jziu3rHJKeLU2+nFOuDeiZqA3ySx/Voteo419Vz5oYAOfCc
	Vy+3VG49jKYUHJuE+3ls5y72fSiTS4RJmsB5q9an+i9WgNa5CJoHZ/Y9MfFI8Flpj8VIPsyn5p7
	ciThloQTq0lkfmxa+h8qlEWDOawrdNUKZQvdEyZOiPS84JmY8Qw/UwgNu2/e0LbTckCj4uhJZqh
	qgqyFziIP9vwH5+ZP9iNCuEIUJG5rQfx4sPJ1avNqEv4FkJ5itawlRaQ2X2KMwr8zLHq5Imn9rV
	e468EV1bJk1NaY2EIN7xn74tzAEx3iPiHFBw9O7SaKeXXyxVOST+rA+dsldman7jJslBWTBATdj
	zVprtxB2eEWcYqzd4nzpGqxnDrzKSzgFJNiEoClS/sEQrd1klj+xVau3o2/kBxqWmvfBRp0T/ME
	m/VYj0JBR4SU3GwA5pBRdnuWh62DmmaLlMc4Yk/pr5PcbrBHIbHpmplGew0aObFktWAaaCFDJNc
	5VUK0C2Coz6U=
X-Received: by 2002:a05:6000:2488:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-495852178b9mr6692780f8f.38.1794227044813;
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Mon,  9 Nov 2026 13:22:49 +0100
Message-ID: <20261109122250.720757-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Document the compatible strings for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the byteENGINE carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml       | 12 ++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml         |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..d342930981d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,18 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and bytedevkit
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
+      - description: i.MX93 boards with bytesatwork byteENGINE OSM Modules
+        items:
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

