Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F6489878
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263755; cv=none; b=Jz29plsulyqWcGX2Ttqa22TTi54OSnjHfG9526uLp7QR2vS/BRV+Q9Ln/imdkq43th5lOAh6IllxZomnkuRuqhiP6d4Zt07najh8B8GNmsF4Riln/z/tlrSIT08nqAsjqot+Ih7vMebz3i5mmicBdHV1DO7NG2gWPBVq6Vahqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263755; c=relaxed/simple;
	bh=Hrw9uVCkuJ+RImHrQgLm4rRhEErnOvCmxCULmx+qlwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2D9Ue6WKu8nz+ylRMs7mJh9Y+GooviGSG7ZcZm878y4Vhn2EJGMSUE2GxdTHdcsDMwvKjBOfUUqBQOIF9ZbUifJ+0TNINs3/9hZ0R7dpijuCFenBuQLlza6A6LpuBuC+3iuB61Gz2pwwFXlHCxb+Kg+BcZOdmViA5iRY9Q6N1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=skqf8y5S; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="skqf8y5S"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so20140165e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263751; x=1790868551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=skqf8y5SQRQcq+nyKKN02B+dZw0y6lWZ3AT/CGnQM3CUVd3S7HUmneifdBwABMJEt9
         0zHN/vpSJVhMKuUZr/HeMInZJkkyDp+86692s3CKS5s7ZUhnD+qEp05FLjS4NvtxDVwa
         rGilOqOkgs5wLqXqmt1ul3Acjm0ANdYIopgpb0tPEWpdNW5mOQVdfEETN0sUZNr6mJay
         Z0BENi311vYUNQJPkFor7WdnT+wlCnjgmzQixHADNB3Cbuyc3xxATN8li7lFH6Fognx6
         x+7UQnYHUYqOgJiqExU72DRM1WvbjDKovqGI+Mwi0SUJI2POzhY21fQtC9apvzQN2zNd
         pYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263751; x=1790868551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=ZaDxdrlg9kPw9htejog3vCb5vZWUsVDfN6DZwi4jK0+Nx0yg5ko8KCEpoNl1HrR3lH
         8e70QyJHLt+dxSPEDa/jMO9CZ2l3GtkW6ynmOw7ynMLZUkUSu5Yu3hEEINs+nA0v4Jhi
         xwArvVfHkx9/vaGSdwSsbxGZ0KK6WUyp8cWNRnqcm+4WVIUerMYYDYe9GI/kcn4Xud86
         JZXY0G5C1yEE239OFxDR0xHZZrcS5pNxqM0OenUMtyUOheJoEs4qS/PRiYLz78acDRuj
         c3akDI6HNNsCTlsT0kycVIDUs8004BQutqWVsPCeWK6V+sFE9BBnp7LG14Gr/zA+ipO4
         UdrA==
X-Gm-Message-State: AFuF++kJE9SZNtYeoa5ZJmZexbLAE6taHor4dZdUaGkx5XhPBoWOIJxX
	ZZmYOHZuiFXLfVzoop0aQ2WJeIPJOqGWV4nHebyKVuio2RDxTiI+vUcBV4+pduZ2wcjonSqWSGN
	IL3piwFU=
X-Gm-Gg: AYBFou31uZ7cRXxRdp021/9tghy9u2FE59b/A+mvkKyrwK8zjolxv25J7LerfTgYSep
	4qnR4+ftKK8yAdu5o1w/KAHMRur1BrIEgbsD4oyU2ALDS4OnFnb4+29sMfAuh/EboAxB3v00Qwt
	QlA/ka1Ps6WK1Pl87og3LLO0egm/z9iH5jjMfp70hYxf4IPsUl+JpJ94QKe0S86ZA0I+dBNwIM8
	CK22gwBMU5i7y2qGBEm0db75LOw7qBVSf6WAIAr+7VswpLQfP4w76bFHt0yDRDcl+oSVahYc7nD
	sb0hiUAHYkeSAIPrwA0GpbFGB3uYIPpgiSw9EiM+cb/ay0xr0zX5pczafDVem/PdW+gGYoIFIjX
	69dI51GeLuV3vBZRXmvfX21UsSf+HdhQHG87eeFs2w4AqEJP1P2QQXWTKPplbu1q5GDXzSx0Hop
	s4NFJqz2oCcyW1FW4dRGcnvQPlM/pdX+WZzaRxXXmJfukX4GxWIx+RkYN+wVp03DDrey6h7wV1/
	nk3wfr8MIteabiJAXuHY603iPUxMBXlVcfp
X-Received: by 2002:a05:600c:628b:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fe66d1134mr46747255e9.9.1790263751266;
        Thu, 24 Sep 2026 08:29:11 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:10 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
Date: Thu, 24 Sep 2026 17:28:40 +0200
Message-ID: <20260924152844.81705-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tibbo,ltpp3g2 to the list of compatible boards for the Sunplus
SP7021 SoC binding.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
index def7d0cfeb31..8ec006576f74 100644
--- a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -9,6 +9,7 @@ title: Sunplus SP7021 Boards
 
 maintainers:
   - qinjian <qinjian@cqplus1.com>
+  - Andrew Gaylard <ag@ffroot.co.za>
 
 description: |
   ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
@@ -22,6 +23,7 @@ properties:
       - enum:
           - sunplus,sp7021-achip
           - sunplus,sp7021-demo-v3
+          - tibbo,ltpp3g2
       - const: sunplus,sp7021
 
 additionalProperties: true
-- 
2.53.0

