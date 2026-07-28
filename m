Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D3F3B961F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271270; cv=none; b=lhan6w8h6EO3AehaFQfWU/cJXxXGRgPLZjM04nFPLXwIcfk7aFCLrxAdZtxsgkgQMXYRodKP/RtOAPpD8xCj7vfxLiANHetJU/rWt+M0yF5QvCUuC3aKzEkvqWWq/gxLfJtzuhDFlbBfoIhOrQU0wsvtPI28Tpy/H2VL4uXaKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271270; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8TFtq0ClBAmSQ2rRNYyAxiqYxDJERSQedJ9Dw+cV3QC9NBpBlyoDlz2EiKllqLgiboyzzPOEo3a1Af6vpGJZWJSxbppoBhpUM+g8MqqatYlrdnnhmVSXaL38Mkf81dxWXp25OKVqhaaUvczmJtUnJqqQu+AYoQ26NI6P/clfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXCKO144; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXCKO144"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-448b69cfc6dso161137fac.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785271268; x=1785876068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=bXCKO1448kbLXkunCOkavyAt/8TJT4ocCXSdeWCWRxW635RTtCyMP6vecHPijgxaXw
         srjxcNz+oJ9fcTWvC6INIdpIbKfH6975K5lXg8qpH7PF+o+pydzaoIJ8Cvgpemctq8hZ
         9VlhnE5P2oyyW+SIdiNvx2JIbO4VqhKIeqGA62pOaQgrLMjZsqg0LNqyRTP5uB7HlaMU
         SZFyXkwmwo8xxVqxW8UlT8MSViUh+ymE8ov2VvWMkd/U97oGOVHRIH7RkHEjYw8yKQCp
         vn88FTAFRkLAtRiQBZ1d5eUbvRFojy43GiC2k41W9IjDKb7WoXqF5domjttxurMMV5/5
         wccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785271268; x=1785876068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=FyRBZkL+N/UEfIlgHFBJsjqy4SEDprGltCSS0FN/uFzNfQairnnCfjWaRqeNUSkRRC
         sthQghHsqCUjM3O9NuoewofkPiJg6OschbLzdIcV8dQ88pLWFSjH7qs5967I/7I5TD4f
         /E0suol5+CaWd7oISyGfLIIo1Xvz1OrMeKgAxXJChFZp0TZHlU++tQicU3GeKGhxIAuT
         6sDwTJk3AgMiLXOUVfnMDzwGp/+2dZ2eQJ/ra6urhDHSYhQuhoK+M+Zfq3aQxoalBriW
         tjW7RjVWWj9syfnoWP5ziHxLCgloM2YZUq8V0Z915BO9GYOG724y9XfmHreANDF6OysS
         Bumg==
X-Gm-Message-State: AOJu0Yw7MjIfnQRJAM5gpVnFiJcovzc++bvBzpohlnmglpmvCb1jkZLO
	SHzV+z71G8TlbdfG0348Vp9Trpk9cnv7iJ6iQ6Xif1hJi9VVw1zGkxwN
X-Gm-Gg: AR+sD12t2XRCT7pfgxvfvh0Pb53xcvlcbmv5zqOGgvkCscZbG9rW5dX4kjDOwN7FNwy
	mM5Aj7OPNVS/yovBSKNdlqPbHlcCwm82grE+JYOCezjQn4n3155dsdgY13lX2+o/lE6ZWmS2Nd9
	MzRAly61sNDVrE5uFaxjBX5S2wQLjTnNRqHsUzfJqBeMYYTe+wQfgAfUM0gIwFxhhM2t/y/gCpK
	qe+mpsRC5THnFDgTu5JshTkzp70c9sH8dFaTLQgqHm4053T316Qv4GLI0a5fYUK+b5zoVFkrsUR
	T6IwNtiPJ4uER4lFoZFCBgidiaEzS2eU8F6uDShqRYTip3uNXNWnlTTkZ8BM8BLfU8BZORtJu1Q
	OzSuNRDqwilAMcWYaa4iQF51RP4VtC6muZKp09L2U5aWXK+77LUcQLFLkxOk/vSKGI+t9aS0XtH
	J/pYNaGhgUInDaPZWZEH60N7zepEaImvJGG0pdJd2QIrm4XothLgURZvbULuEP1X6m/zhqLGmAQ
	pPaeRFQ
X-Received: by 2002:a05:6808:ec6:b0:497:d3d6:6a56 with SMTP id 5614622812f47-4ad5b44735emr2359380b6e.0.1785271267733;
        Tue, 28 Jul 2026 13:41:07 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9162:e42b:cb94:2d55])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6efc5c3fsm129884b6e.13.2026.07.28.13.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:41:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V10 3/4] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Tue, 28 Jul 2026 15:38:31 -0500
Message-ID: <20260728203832.166402-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728203832.166402-1-macroalpha82@gmail.com>
References: <20260728203832.166402-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Anbernic RG Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b8babe9d3a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -66,6 +66,12 @@ properties:
               - anbernic,rg-ds
           - const: rockchip,rk3568
 
+      - description: Anbernic RK3576 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-vita-pro
+          - const: rockchip,rk3576
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0

