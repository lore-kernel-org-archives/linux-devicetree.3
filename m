Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813D3BB677
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596903; cv=none; b=osY6uXB6V1xuczZpcHTBVBydDiItz4BaoYhjmriPf9g92NJl36g/cqoN/KCML0JmOPFHD0CKY+hwo2ZopLtSP2tJLo2E24CmaRCJ90s8JXQdJLalZx2h4Xdez8VPKw0b/tzHJmwr1uE3iWylJqDBfFRy8JAC8h1gY5OpCj57XIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596903; c=relaxed/simple;
	bh=6e5su12ZJ7vhdSu5qAUM56C1srarpr16wNr2uJph7Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y13SQtb4gAItw8ekvvwdkmBIeHF6Kyxo3EvVVZdeQrG7rpq17Ixh5AwmQFMEz2zMskrQvhC4iPEraO0PBoBh7USQoGIaf7fcQcMRi2tyvpws/FlkQI9S2fLzcUuWWFpM4TUC6WL25P8ZL8l8eYo7HBX9CkyXe42stJQHg7pvxpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTJGZUrX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTJGZUrX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ad135063so45701605e9.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596900; x=1779201700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZMjl5wlw03SWoU3yFGiKDurKpP+omQjQUlHWLj/NzM=;
        b=NTJGZUrXaBe8gT+ZdNzuq9M9HcE9EpdIywg2mfO79qi28wfUbpSH/j7BGmriWpSIhT
         BuXq1yFaIxiGF8Y+AGI8p/soV3g6tAV/W58R9vJFBa7vIXI18f3q5vF8w3wnoVQj94IE
         0KyLUeKPtf3cuhyafDJhToctAFflA7w8Xksb2nCCrnPbamAf5xduYvwvEGZ4/ZoSnoDg
         JS1Z5gWd88gzXUDcd/TpAxfjnxwtYLu4wBnSLdSVDjKSgXhiDY707BqvT9jKxMQ1/b0K
         g3pKlK4QFqeqUaEa/JKAI91kDwFhQ88Pt+/LIYgvI3sIwtVA/PDi9OUMhdPBdsTgy740
         u6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596900; x=1779201700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZMjl5wlw03SWoU3yFGiKDurKpP+omQjQUlHWLj/NzM=;
        b=Ch9niCfzCs4PVHPrpkS/qMmefpw+iJRstLQaO8PGIKFDUVejIRqDSyQnyxXLpcnZk7
         eaWyubZnVUdPSuoBlBFzRBPkAjQ4H8Grv6DunokTRSIS+ucbtaIaABb2ggsaL/ji7bNV
         K394XK/yQ8pSUzXkP04ppKAOGjiYTc02OIW8ANOTwVUbqwGA2RXba3I37kQMHzpIYmI8
         lpoPHOp/mvATueHKplzalXCe8K6j11Lww7hZDpI8u+G4k2Ar8tZVNj3PEX7TNT6fcmxH
         g8TcBkdgiSZAhv0dAV3Ojncj9iXytdG2+QUKqMkVYyLw5CPBVnMZIzjgjNSnxiW2gfcB
         Y3Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8QOG4w3tABufhpNL/n3Jd9skeIWVmWF/8xYaDIeBsFQrR0feRV8Ciuu3v51wF+149h2fuDwdoRP26S@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOmf5Os5jL87X8NStgeQ6+/QRQJVKJJjMwM+9x4GjaeGup1e+
	cmHuyntV+K0V/NIQF7LzUrKqHXKgbfrhtRYrWibVjbO4mKKvtowcqdrEiz4aW0wq
X-Gm-Gg: Acq92OHlgIqss9DDap4vjUYMohcH76WCqRyBdWMxE0cAjS35PJxfQbZPWY/nT28mvXE
	J3exRb+JI+JFpk4LxQD5J7DEULWW8d/jwA5BDnehWL+4/RQw0Juu6dtFfk1UDdaDqcxQj1SuM21
	a+eyxjU+u9igxXOL7SESCbaQNaeGifB1KVifeCVTJmXNamZlrj+44xkRk14gLMA4ENGAxa/re7B
	jMoX5o/A4a3eWxhbhL4ufYaQwMT2CLc1GpbhTUqLSUATlcX2rEcAq8H5JEzhZLubjvzQd8kEaKk
	vbRpa3ITbAqQmD8XKNY6Z5QncQ8Gh1S7aZjzRJ6dvLBp8AX3BpH7vgb5P6BP6/KHoZdUDHaNwiG
	anJ0jq5ZrqGgYvwiI3FxvKF1LCifO6RHTtF4iOSzRhi5n/PgXu5rFBTvPVq5lqySBHM6Bp+1NTs
	ecBIkDvvMGFEh8mxr3iqflZJWY64dXhLjYLF0Ma7FLcVTq66XjwdStBx3+gxF3mFFkYAZpSa9LZ
	zNhu3GazN+FEmpUpiIg
X-Received: by 2002:a05:600c:33a9:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-48e51e0bb9amr295666785e9.1.1778596899908;
        Tue, 12 May 2026 07:41:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/5] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
Date: Tue, 12 May 2026 15:41:00 +0100
Message-ID: <20260512144104.761531-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
port@1 in the ports node.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3:
- Was orignally part of separate series [0]
[0] https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
---
 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..5add3b832eab 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -102,6 +102,7 @@ allOf:
           properties:
             port@0:
               description: DPI
+            port@1: false
 
           required:
             - port@0
-- 
2.54.0

