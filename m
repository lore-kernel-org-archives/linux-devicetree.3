Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19853499F2F
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327506; cv=none; b=iz5vtgcUM2W6O/gB55PCs57rBkNq3zLcKefTcu3DMYyrBQJ+AphPdYywIgnQm4uxZUYuziKYp/grEAChmupsAzQdDa43QF9xDO45wCNtWX1YOmj1T6z0Q+JBpBgvWf2Wk37Us8u7Ua1TGb4ANZwpRpHR5XfCvySrsiJZIblD5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327506; c=relaxed/simple;
	bh=GJXPUmb1nhYAeZO1jC61HU5DtD36Hl8QiqEPkhTkC2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R817W6R61SbbXx65400JhslId4an9EjALJ6qb+03QoU+VSof1Hv2kZUhqpTGFeL9zZn0OLu2lpQgTPTubxPpVSDrOp7nPKi8ODIuyVBOThoISZWyGEEzGIglo/22iDLSIaYssrhTOu/GS7UYqXvXyfNb/NAHa8xEM/7mJB8eGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCpjSDEn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCpjSDEn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so12731285e9.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327502; x=1792932302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=cCpjSDEnY2FLf1brAYERoTqbIwAW0/Dlef4t08UL0FgjquvEf9ZdWx9prn0Pjwz6UR
         SJsVmQYN9aM7SPslYbJE5dfuHbOjARXdmDb4Pnq7QXc7ijTRlHo3QuQrR7NYLsJAo51v
         hGq903aETabcDmsnxr97btcyzrHSV91patwLIkeGG2sjq7cM9fii6yEaKFsqutKXsS3I
         QSeCfg7qzBb8T9BAl2ZAv7r50Ufsfrve6CO5AXeyJyf8NmZq8qlL56DHs1cjGG0zaw/o
         H94aFzhYn6uySGZG4F+xWtwxMLfYKNYD3RpXXMiPqEGX/uzIhLpdIsZu7EcrVKfl0+Sb
         d6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327502; x=1792932302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=lbpABogYqFGeWCeC/CyR8rmYEBbYsU4nAo5I8UOoSakxDhaEDSqCuVW1NPtbByRArH
         U07rki/L6u+3n2Q690L92Hz91LgolHYeFjtpx0hTej23Orr0L6vYHFSwZ4pvmSzW5MiY
         Av1RMYt+HgafjrzSislcd1KOoyK8whFqK663NgdrQrr6P7jj74h4hnTLm8XyeXvmSHCe
         u1vbOmrMPFezPXqH+1tzbhxpTmWdwl8FXx9SKYrf7dd8TBQ4Mf1V7c5+5uR9j9Ttu7uD
         oaZD8E3GGz0bccqDrnJ4NUIlORVuITtTMxi94FloRw8w4u1TErDkR8qNFFK6DgkpaSU1
         QyWg==
X-Forwarded-Encrypted: i=1; AKwUvBzPh8wdijvl49Hx8Tjct+vEJyo6Z7gzZ3v0CU8QR/2Mh3vcYeBBEqxrGk5C2vfvg+QP+hSKkh8EZ8jz@vger.kernel.org
X-Gm-Message-State: AFq9FYKCWqgMXgSUw8WMVTC8+4BtT5KWUI4i6jiRqL1Im5Whxe0S4/W3
	c1U/qEz4cygZVelFQZZV89Smrcw5usPZauEDzFSd+YmgdRgbbSqZU+bD
X-Gm-Gg: AYBFou3n/I3Q5i8r//xfdyfvb4M8iZisgRz6xLxz+YKKyXila6SRd4vcqlsepLW208f
	zH3QkgZE8LgtNa74vbA+Sj45edU2G/0H7rLM2VuV6VmVVH1sCdz6bbeaCuXbSbdcZoELU63J1eq
	VJnp9IPavpb3E5djPAzfo/pINGVCZB5MX31eY5CO7H+4g3tS6zeoYXrA6/+az6YcfBy/red7bpP
	JcP3gUN+/YU2Dnp6w4cagC5OsgkvlzsyCPeGx2o+s7lgFeBkcOnyVmfoGFt/mbYW9YveBZuzbIf
	gUduDsn9HN0eTSJ335KWiPvG2uOkA2ebxexkZNdCbQlFZscfxnJp/TSKhD2BjZ6qhori+MXq6Y9
	Kc5Ev1GsV7DoI+XsQQgBKMRwR2OwHklkFPrHdnLmScsdy/6BhaV2pMI26YRHKfWHnZ/4jocNNVB
	8kVOQ7ivSp7HqCxoJGe7fn2omRcF0M51Del2xTkJNM51YbdMldyPmkqjvDpy/m3FTUZ6GckfvgF
	fr6nyhe7Yd5Qr8nvz6MIuI9NEMz9eBSzeHAI15HCW7VrmHvNkwOaIAfUqlWeYsTrg4hUGb+U0uG
	qy+MBbQSXxXHy/wBRw7kSZPywuacJh4PUSPlQ6xF0/Fme6RA3LEU2BnkWj9LoQC22usNeT3rApH
	yQ5bNXGietMfkUClEUd3aepI=
X-Received: by 2002:a05:600c:848d:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1e722a360mr3167745e9.30.1792327502114;
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:58 +0200
Message-ID: <20261018124459.3026-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

