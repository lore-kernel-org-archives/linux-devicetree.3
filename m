Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024346;
	b=CTIJYFr1tLuuTaK+gGnH/uuc8odu2Shv8/rwfvVVHvxUnPC5F2rPbYrj717lXiox/U3L
	 /kU45TBx4dHdBqY9Cpbfphcuf4qfX/HscB445NUb47l3zycZe4TievQBJ6L6YhaCAd/oa
	 bDhYPoOYU4yEwzSJP9j0kuqLDHtYFsRNUFXxB6ax2pIBlqLJUInCHIeDfLWx0fokq/aAP
	 JwXCvX8wkeCdekF7KLGJTg6KqMqaMjFvIKCZgk/nB46zBldaLMztDbX5ArtkFsnj9DQmp
	 Bd5uHK45+QwZrnReI0vpdeSDQhL6KjlbTv2Aqj4qW/zZ2HRPeRyU1hAcYNwulh0w6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=X0if/5nxidDNKKWNHe2Z86K6FYIe8m/iIqUwPTqkLfk=;
	b=b4IInB3NBgvlUAX7PiZKogY2lBZv2CWsP955NFEXVvxm6DsM6QG+hCHPvC22XCSvGZhg
	 OgSzmRAZ8qsqX5Kdkd34EimnZDEOTxFubjZGk/SviQqJS4PXwVeC4L0rwVa+kPWzxG0Dk
	 nerzP8mW54XD8A+j/iH5qP6/HKaWGWScVTBII+5k6+LvlSGAzrpCiCu7q3EzOlyHXpcLv
	 242g8ACBqSkOhZFciNIok5CyI71uvUpraa7a6tLyDsqtKPmZlMFlFMmr9n+5hH3q1J87p
	 Pst7LHWpH+hu5MAiKdHVt8Y8OiQrF221C96Uk5XBSf8kHz30N1M9/mZOrIO1zpvSWFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVv2Q0Wz;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9176606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9176606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVv2Q0Wz
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so1503061a12.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024344; x=1795629144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0if/5nxidDNKKWNHe2Z86K6FYIe8m/iIqUwPTqkLfk=;
        b=VVv2Q0WzHSXNrPNLeRZRZEcxrLziXD2PF6eAJSXsf4n/h1oXYo728ZNJjmTcqYxP/q
         a1ioOho7NWHfRh3rQeQunSRkznDt5U2QJ1fPCwjjWuM4eQX1E+39//B+bXOrSeyBeep4
         bXtJSLe6nLtaND9XVCGfTvyFH7L0MxM6cYK7VOXozgfJt1Iba/Ogsp38ah79wQ/ylWiH
         M85KbW3StC3I+NwmSFkC1RjdOEQagJgL2AzadPBoH2dzP1AcFypUE+E0QZd9cs4f97HW
         UpMgvKFPGkKDZcblqLEmEry9xNUu3ILkgLpgHch+WHLQ400VaoZ1fLjz9IcCeVnwVt2K
         rVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024344; x=1795629144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0if/5nxidDNKKWNHe2Z86K6FYIe8m/iIqUwPTqkLfk=;
        b=l7W3EHriRP4XipqByv5tlbhvzOJDI9PhH0kLytlZd8WU8u3jb6I4EHpEeo8rsWL6iu
         JOLDi3uLw2duot3KoPUqe5/et7X+VsB8QhyZBLkYi8JdAFfYDt8DMNogbj0WkWmQBCMa
         6bYVw6czypOk7yn5um4+7pAIsrb7HLitVo0QkRK48lBsF8FXw835fINmZHEVfqrleee5
         Qh9fpUcaHYrYg26i1cw4V9MkqI1omkZqAUDTgDV2JazbHitVdBCTrCar6jguRdUQy7kT
         FQQ1vlh2rc7txdc23jBx+VUOO4qhHn/H0+lIUcCE396bLMkfgq97b1a5RtjRs57zTyKf
         a8QA==
X-Gm-Message-State: APuU4Z9cramlcWrYnvfhYK8DtryAZd99gpof47FiUDoNJvUK/VdDWmpX
	ATY4EXuFsNuzb9xse1c/NGERYWnKXl+i9IpxgG1/sMwgnTGV2t8ZpZmLYrlamPK5
X-Gm-Gg: AYBFou1rN0eMgD9oy/FTBhIzdB5VGk4V9n/JdBtWPzpopLZiFE6A8zM6kxWbJq/9ntv
	zkQaIsTvMdE2aWi4EwgrUAeZIErU/3CiT4gOvgmIuCQX064xb5PcpZRb/i+n8z+P9n7+imOH3Xn
	zI4bQi0jzXllly1llWfIYQoWCtwgVj46yJs2QFk/TzkJVaWpcBAbmGujIRD566hoJAKx5gOSe/8
	rIDuq47ZJ9X2nipe1LftNVxyydWarJ9MjpSNaqfHpMFOCo5kmPvOmKX912wsYXoGaxxRKYt2voW
	hTZd+zpkJfnOLJFN1BgAgwq/VZtmKSvr9QK2vU984szNkvE7pgEzOucgQNhuEg5kFm3iV4H7RFv
	tmFqZOQci8AEHC9EmjVSsfq3+qhzxoxHc3VrdoviAW4lM4ERNPfcIM5Lo7HdskuZmdsCn4APb1Z
	Y5YV44gtaPm3ltzeFQEBUrhuoNqW7wWNjSKE3AP6yJooJopgBgGM2QtPYgmupyCFC4QsCVaZsV3
	Cco/xNLd/6HdmNRVKise86nIS7jZH5p+Z5C5nU2MQrOiR7tWyBGZ64csvc8xeBYjjnBkBp8bcRQ
	9vUBBXclPJsYVEhYe0kUrEmOasqjBLU24il8n2WioTHi/NhyCtPJjHqx4cdPJQLNentl0Um/kof
	NpU8+04m06Ug=
X-Received: by 2002:a05:6402:51c8:b0:6b8:7657:24ce with SMTP id 4fb4d7f45d1cf-6b887e5559dmr2525641a12.12.1795024344129;
        Wed, 18 Nov 2026 09:52:24 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b889c22d85sm1379135a12.15.2026.11.18.09.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:52:22 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Lars Alex Pedersen <lapeddk@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Bruno Thomsen <bruno.thomsen@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: omap: add kamstrup am335x emperor platforms
Date: Wed, 18 Nov 2026 18:52:07 +0100
Message-ID: <20261118175209.20829-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Document the kam,am335x-emperor and kam,am335x-emperor-mini compatible
strings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
Changes in v2:
- Reorder the series so the binding comes before its user. (Conor)
- Add the kam,am335x-emperor-mini compatible and name the product
  behind each compatible in a trailing comment. Conor's Acked-by was
  given for kam,am335x-emperor alone, kept here since the change is
  additive.
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index f694dcbf2348..041776496a67 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -105,6 +105,8 @@ properties:
         items:
           - enum:
               - compulab,cm-t335
+              - kam,am335x-emperor      # Kamstrup READy Concentrator 1M/2M/2C
+              - kam,am335x-emperor-mini # Kamstrup connectIQ IoT Gateway 500
               - moxa,uc-8100-me-t
               - novatech,am335x-lxm
               - seeed,am335x-bone-green-eco

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.53.0

