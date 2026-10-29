Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287789;
	b=GD+ewcE50N88xvMc6FuvMK9slO/yRDY91joQ3c+OiTv08DdiCnsMDHohmloj5u+uuvog
	 YywfrHVdIgO2vuV9IUc+BXD3UDLuXVGpPnHUbuvsc4kzJEUlgnhbpkzKov3h6dTiyzK08
	 6mu3oKUbfD0iAT47jqlrDNXuZCuy40WBnsLyON44O0lGv0jcwazTWioI7J/F+QZd/b6QW
	 rFl6rGZUiV92OLe99a7pxdhGU9D4BjeIueS1gVolvyQsOgjMULWv0y2KLD+w1GJZl1GGv
	 g07eK2uj3OgfaXxWpFPy/keyObCW/ER5No8teKXwuguUtuJSSFc4uf39RIwcNxNHUdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
	b=iQ9yxEUp/EMZJMU5YOna7NeZ88Cu2fD9OienEynFSj4O59OCjomaRZ+DkZbcVDo5t5Yc
	 n6jLKeyoJKEO6c416CRpBfs7/E21/KdRn/KQC4EyV0yT/d9sd//Sib3Tog0fh88pX5RFg
	 EoYBehk+GZGO3iBzuoiZOv6GYtOZ4POneOoD2oX6XuvvDLs+gRE8fSzmRca37RB/rkqfl
	 Em2u6mMoBTt5VOGdosOQd+hKW8NNKtEQODVcQyzYdbCmCLEtgVYnUZjrRh4yp/oE5XhdH
	 BrvRqTU+Ei69zGI9kVXrD13PCMbTU3F8XCQzL/A8Wke5FaxDT21nMYXHOAGATwtGgww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X762ACNe;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A4606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X762ACNe
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c34bff61551so352556466b.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287782; x=1793892582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=X762ACNeqXO2h9IzkxzXoaGb3K8Kfshd40xetGeLUvdcIddcE5GnQSegoqa40UVxWi
         umnYwbH5fJT9GFMwRqEaB2c6dStBzqYLsiJwkQHWz7XpDUm6BCgAfQzcrHWjHq30dusB
         tbnm19P7qJ1Nh81kQyVH5C8BYbD7/XaN2UWkDkDufz6CHtFMdwL0iDB3kFlAAqvUFm4L
         511aBAH/a5j+OYWzO7E5n3+jm+fgoajMr/FvbgHk7kGLpJfhU+qzbZrxT2DXKyjWnWaz
         mnjczFLujENsgwnM65cFHWy8MpP9ghfB7MOqktm5/OGXZOqxUN2OJrFtAfe8uPXoC079
         ng1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287782; x=1793892582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=JGZ6mh3KfnLhU2xU1DDtR8kT+Ox6vRICKtQX+TqEyWVQvaUXAtFxkzxT9EBHSonbJ2
         PwvCYr0a6fNPg6PGpt3tAgzVF5sfKyU8Cxr/75Nvwac6hPS26DDwjCd7pw68hgg+Zgjg
         Y2RwKZdI+jXz4DOVWtZ4OBpXsKkehZmcyIwaRtGdRg43PuZ7T3X0GcA7DGK76PvW0jnh
         txTak4IUqJo98f6HM5MjsX6Fe3H7SXRHsSTxiTE3nJ6fK1IpwA6SKByYM5woM5RYlvWt
         eJD2k2pnQNzqZ+q+5CdbXA8VOIZPEuAxOPCNcePvs9GTXDp3kZ/J/11KT8rRvJxxu8bx
         09HA==
X-Forwarded-Encrypted: i=1; AKwUvBy6GfbsqUdoC3ptpJCW5A72PjTLDszPpqIUBU8xPrg0tTUjpaf3+YgtupJdlmFvzIdMF8LgJ3U3l4Er@vger.kernel.org
X-Gm-Message-State: AFq9FYLKKSD0jHCw8YQDcYnoiTFhG0aL+e3h6Cp8mvNwU0N1FlGK1nDJ
	1Soa6KYucawQnRA5F8kD4BZdxV4wBA+CHvGJBGNxnRrdwlXAwf2XDcl6
X-Gm-Gg: AYBFou2/sUzLdegEFDvEHcKKxToLtf7h96hijNFg4RH75tuBd0ZOBwWJkxJmtkAmHEd
	VFcY4UfnjJDAFQOqdon3Pdc+zHapsnWxmDMpiyYlX8+QTH1A0Il8Y7fqOe6MBaIOG0iE0wCY/d+
	anQNU+1ZPY29fCMbTErKQbMbuWoKQ4PTl3vW/SpohBoHR+TfajyZX0YMfHz0eRUBz92Icc2vcq2
	ibanVUfLX7aibL7Oz2Pjo4LeSf5p5fIeNKGX/n4aENaLTHIBjQdgB36knDOWy6vY9FO0nUMU7Es
	lyZPm3qpw1shZlD1+GvrwX0Z0Q65H0N5XI61jgSTO48+Veb/zbpNg1QpZkGRAVNT9xGKd2TgTKd
	B5r1QqNH4VcmphpqZiL/Ps8AfETzMQJsz7ai15troQ4zn9iNyrgiwBoU8dQaBHCy3/QoRFJp5lg
	e4hVcnU/16Su6C0agbKAlkzZgbLJipKoE3OcHdy4SgFeS6DZV/MzOnHeRUqdi+OU9W7Nr7mxD0h
	msRXO7TbHHkzUqHqg+z+bL7vveI73mF1pBcH48EpgroEidNpPhRhWbCBqieuKvG3gUKr7/ajKxZ
	BNp2zn12YPvFNPpkNMvOq0RTlRq7VP5V3JnHKeZ95Ix2qiT00A==
X-Received: by 2002:a17:907:6e8f:b0:c46:ba33:1f0a with SMTP id a640c23a62f3a-c49bdf380b7mr518463366b.31.1793287781542;
        Thu, 29 Oct 2026 08:29:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 06/11] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Thu, 29 Oct 2026 17:29:04 +0200
Message-ID: <20261029152909.234584-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

