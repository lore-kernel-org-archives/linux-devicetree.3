Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340050;
	b=KU5D+p95/2QhApSfAxwQOg1BfMfGq5k4dvGDlUww+LJAMDOqczgYiIM/xOPiI2sH/znE
	 wRgzJvSk29qKytQBiF9LcDXp+Ts8v3KXpAWcK4w3I8gJzmFMUyk7MMKOCLCmZ2usKVOEY
	 kNjsTg+nxMdcHFvwYNUXMovFMFAD4jCyPgnCWGL9H5iJsghvVIdI6MTfzfYuj8UIzHX9R
	 WzbnVyreD+9Nu46PftYiYztK1Zhibrd3rJzIQJ7JfbN2nOldtHjX+qVoBr8HXNWzmo3CA
	 6Ba7OHdyaKFH52FFQHqQDIpwqPNreCl2hO0wlBNq7Ph3Y4ruOZnyNqtqblTYbt1COxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IrMZtfuhPLKrTJMZV1yGooyCnLt3B177b/b9eOACZeQ=;
	b=2qZLcMJB+tsAfszSqbpyPWDD6lZeWjW8jNi4Z+mgCIFW0nvv1qjmQ2rDBFYdmQ4tjLn/
	 Kd2H5MUHV0qC/fKSTTo/O/0Fuh3Sz4xETaS3X4iNcDzawJDZe00S1yAZfrpI8hn/LxIFh
	 y9lUmsBKKmgXDuaFTUq6hwkFx0IU3E64o21Q2SmJvCtlFXVvYd0AKH8WmsJdhQtCrnamf
	 KU90k6s9NDpsgNK4Tp8B1o3VlQ6k1ffNmXc58h4ICE0QNtNRF0kk9IrLn21Mt1t6hJZ1o
	 lEMtYWIAM0cr3OB0OE07bG+PGus2CbfY9uklClkdFL+tO2h3NpUrooYyCNNb03ZMWrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="K4XtxOw/";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB81606A685
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB81606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4XtxOw/
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a32576da88so1321164f8f.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340049; x=1795944849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrMZtfuhPLKrTJMZV1yGooyCnLt3B177b/b9eOACZeQ=;
        b=K4XtxOw/m3oTYM8K+2snn0yKeJl0Cn+vHRsltBx05OWm31DTAXFf21XksJT0/6lRGT
         HBK3zz8D4PbgC4fgNqDKKFuWLoDn7eggmEedL3xFeVeOwYQp+YvPEEmamZMDvSWYD4ws
         rqOKq7IEVVIBul2NGb9aaG4OinozifvIXf39m/+eN98UQYcl8LkJyEP/U1rmkxql08I3
         YhWP5DXAWiIJe8VUVHOsne0WqZ01MkF9eoe+8Jr+VTZvGZaqDLvx8kyqKFpLXrJ5kJhZ
         4fpJz2iWHDv+SFWzDTkxNgT5KcRCJLcvRRUxaEQ3y+oFlCY3og3stHXnwaFnCp/3x2a9
         f1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340049; x=1795944849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrMZtfuhPLKrTJMZV1yGooyCnLt3B177b/b9eOACZeQ=;
        b=GEwFtTX38wPLNnYZxfHA43WdeqVYpylZrdm3q1Hd6PYYrWYZvuNc3jKXXNCEkzytWl
         1OQneD7jtjBcQx0EImBOx25vo+X6NVmt0iMSqCLee11XWlnkFda2R/vdiLBf1v7mtDta
         Z82L6TRrJOgpiiFr/gOLQdT1Gn2Z8ahe338djApMZ2126M7DwdsuGxllw/J+/lU1zkh2
         +DGwyEpkXz3Fcnf2dzOY+Mthmqmyp3rnDnw0qYeFMojTSE4nhwo1atnSq+5hxJbVsAP5
         1AUBA6u1fOqLaVxtoBcSqN6QWV/Mg4J6N93jyqq6AwV3DpOE+9Zfp9QH+x5Dhn+uuQUr
         ow6Q==
X-Forwarded-Encrypted: i=1; AL+hErGZ+Xxr40DN5o6SAm/c0AefbN5EHTnflsSgbAW21KE1xmt/z63WklT4PCTDCPVDcBgdujlwRcpmUJ7Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8OdoETuRfl2A4mavrsdouRl0IaYw9jzMwMvvbXFs6t6yy3x1MX
	A99b3aVlUmYLxjSEcsxzpxKvJ8EWj5OKwH4yt/L/6fBE92fvccclCEXBy/UMRxT8G8s=
X-Gm-Gg: AZFdTZeTzmGalLwLHAld70vOM/zV0rCUf8y6ouKjq49yEklp6f5zvlwgDmV11nE4xfZ
	GluTtpL1BsjvHlPXDi8MGJ89ri1vE2UmvwPwLTbHhX7MlpgrIticsnpXdMpPnfDbYI7eUW1owLe
	7vNoSJNLyo+k/ciZ662mNu1Yd9z4Tc4DdJ04AtRCgigTSxrOK9uaQ4emA1ItTbJ+1Pv76VRc4Nt
	1xdmUsG97ffEJPDzfQvFwDxWV4zktRcPpUeRwln4jJPX8hdvVYNzCNToBI7g2JPSSJjH3QzyMFo
	TZ6g3zrlEw6tx/CwBZG6Qh41X/j2s2ong2hwVl4Jbz04mWrtxXBzXZk2X2RfTfLc8Djj7vwgJfi
	pJYWrUvnxck4p9movAEfMSzxTwty0P+0xoHlk5XuNqitQtpn+u72424UNMpPOif13+XX4b0K2ig
	Oj9gfPijxnqHjeAPYXnnUsi7EggCmM4hsVPTtPM3Af9nFg2rFhgiEDhSf3b7As9fBRrfilGwSZ2
	ucb0OipdsfOYtij0pzM/L7QtoDJa/Wpj0+Q9yB9a7JyiOdkRzAzky0la0cUnPcjaBcwknvfCj2P
	PLFruEvLI9Jd7aGrf9x7Zjyx6fbbMouim6bBDvwLRrUYPVjE/hD5BpSSRkCYNZEmfj+ICZR5PC1
	0IX8d6FpgCk8=
X-Received: by 2002:a05:6000:490b:b0:491:f77d:47e4 with SMTP id ffacd0b85a97d-4abb7f2ee8emr13478828f8f.49.1795340048964;
        Sun, 22 Nov 2026 01:34:08 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm1552848f8f.43.2026.11.22.01.34.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:08 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: input: touchscreen: hynitron,cst816x: Add supply
Date: Sun, 22 Nov 2026 10:34:05 +0100
Message-ID: <20261122093405.70406-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122093405.70406-1-gerard@teslabs.com>
References: <20261122093405.70406-1-gerard@teslabs.com>
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

The controllers run from a single 2.8 V to 3.6 V supply. Boards may
switch it, for example along with the display panel the touchscreen is
laminated to, so document it.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../bindings/input/touchscreen/hynitron,cst816x.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
index df52431b1d49..ae8424693534 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -30,6 +30,9 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  vdd-supply:
+    description: Power supply of the controller.
+
   linux,keycodes:
     minItems: 1
     items:
@@ -60,6 +63,7 @@ examples:
             interrupt-parent = <&gpio0>;
             interrupts = <4 IRQ_TYPE_EDGE_RISING>;
             reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vdd_ts>;
             touchscreen-size-x = <240>;
             touchscreen-size-y = <240>;
             linux,keycodes = <KEY_UP>, <KEY_DOWN>, <KEY_LEFT>, <KEY_RIGHT>,
-- 
2.45.2

