Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442409;
	b=T2rtw3cQJdQOTkXrcO7bChW5ggERRdjq+SG1QSLMHS1aowKEdCMwE87ndD+Ibj3jOseO
	 y5UkhmTGf3JrM5T4hkeCiLQyDZUIsEhghIvjWr8iGXC2h+ThtoWCdon6Y71fFXMMKCHll
	 Gwe18KHAEthoiM0l6V+/tt+5mJtKA10dTkPcUQPwkhaiZKG6gdgYVUVNzsytAsSzFgHJJ
	 joe+PqfeQUaB7lEYkhYDoKmVqBHv8adlcVpCGqMxBnouA5MJLQIsGJPkm1i0Ql3sZqsD4
	 dFSxCz2mJzzsrjpL6w4J8ZOX31024FUU8iDH9C0R4Tl1OtXhNGKv/qs2lxjM7mD5hfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
	b=txW4FoEZ+H16CjfAWsxOUuMwA7aLz8ytZIjADXs4vy7x02NHc9FEN0vQIGVde5lFHs+Z
	 EKvP5FS8PxM5kU4wS4cfMMnsHe3s4oiWdEYd2ZKV/PWwoK6kpUCAxPGV56Nbw/o7dcIyB
	 nRPt992TOtypc6FsKwTUD3tQqE1h4lyRAKF0ZLD3OLQ8M29QDtHvKMVlwQr2aKOg8tdw6
	 MoK3ZXLpEo8Y9ByyKfpIaxDarCZPr0Q76V86kyRUjQk4kDyvRo7Jmq5gW7XAfHJv4Indq
	 svFnqCR0TWzn2Q9mQMgCTyBl7QN0VuaA/7KkPqg2mbUd/dhr/e9nh/SvDrrLgnqbvDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYXG+O8;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E77606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 10:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYXG+O8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11280925e9.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442408; x=1794047208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=ILYXG+O851xz2mNFgBIQEbi39aqInmTH/XfsTld5HmlZ05XEuURakX5jvYQiMskAKQ
         +TXaCaxNEnbPmX/0cN5WGtzAtYn3mvq2mukSMKzyN5C6yQVC7ICLuCODe2hVPSPrgvyy
         3CYwu3ec1pRO5FBnCwI0VSkBwsDADVT8NkSo1l8EBONb8wb2Co3P0ls1q3/lDw+oT7bc
         pFdBEI2n2SE9wVARJ71dBzUS2H0ZClcmC+6Gz2GUU+NM+yZmNlZeHlvQT+PxCt0Jk0+U
         8mUnBm40cqHNn0TW0QlwBcGe0eCni16Q3mjR+x2Mi/jO30O80+Dnzmm0oxXuy6nciQur
         hwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442408; x=1794047208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=JZAvmLebgdmwXLc3SiJALKWvQBYgdmmAvC4SgKGp6dEKmfOZ9gCWIV9c3x9z8tuX+l
         uAAKpeot2uEVbpIgs4rw4XuPDkUG9CQu6PvAcllBR8lZyBuYn3m66A2GhtW9z7IDrveB
         KUtGe1i4XtFb8Z9dwPW/yGybc3RgF5LqjV6GJWharfbIXSXPo+dYgoayHWGklN4HQ+7C
         egH6ukh3uDLkEeKJpx4wneC1OBmAw+1dP1iTpnzqEHm8q7RlF4wBW6Uz5xfWTvTOpMRr
         BJBiBZBSLo7di3euatMD1fGHAXwkDTWup4+dRMKx5roU6WmePGIJlT7jRb0buusCL7+e
         UQ9w==
X-Forwarded-Encrypted: i=1; AKwUvBwUG7gtK/UXgahGjVBL1GTuzmVG51rINQvFV3b1omSLR6FO9V/hM+/y0qgKxm7vuM0l+4sR4ywUgG0V@vger.kernel.org
X-Gm-Message-State: AFq9FYImOZmTCNM1vV5kDG+XySUzT1zqvbghDTLe45GELShQVZFzWCqs
	rBkPap4hry6QAThrW68uffIe7zkkfSC/JWxRsPWcNY3iKWPegz7BPgon
X-Gm-Gg: AYBFou3r7L2LWTxO7+tMWHuS2GG/D4urfKSlENM2d7hfQEl/ArqjalcGu+H8R8KtMfm
	09Huh2SGoVDQwskb5HBVq/BgKAHeyAPVwie/PIu50kFrU83VeEAl5mE8U2rxU3Y+pOSnCWk/U2y
	O7HYgH1YvHZKqJkC06rv11oF8SvTy4hDDeVFY6kny7j7ig6rQ7m3SQ9Vs74W1R9GjgrmtQJ0FgD
	YUuIHahfEbR6Rm7iCNFLdyT1l58lK5t9/TJKi0hTxrSq9iOuzf5cYtt1IiIVcN7hXD0dVs+N1n2
	sDjSVqE3gPKG+E+l8kqxWqZodlihOjwVbc78OhBpIoDQeNyM3Qsxd6AQpGp9mXQ2lhLBUEdw8Tj
	3K0cvrLsmGKhQ1kJKMqkZS+hO74CMi+yMdgv+41V/h6GZnoJ7N9giMxfsWOp7azdNALxGYomXtZ
	GRN6dTh6qdvb3ooNX7BpXv9DUpE/XLahhoVSh2QQkTnQLfVVPz+tCtt/B8ACiuiiGZ0ZQIx18Z0
	J90s5USzKF74HWYg3N6xd8sb5QeaPgPdCrlsMNOh+g/D7u9Jj2u+bnTIli7CEsQgBonTVMTKSF0
	ZhgoBncDlKQAOOl9gGzSgmgPqthN1pyH+fbud7V7GXYDkE6U4P7hSRK+Gz12t60hdBEmfvX870a
	fqHhhYlc6QoUu
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr101856105e9.0.1793442407739;
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Sat, 31 Oct 2026 11:26:39 +0100
Message-ID: <20261031102641.12649-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v2:
- Add ACK tag

 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0

