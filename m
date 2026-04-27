Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033EF3E0C59
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309910; cv=none; b=qzdubAHt7FS2OuLBEBLVz7FhBw6N+4nm1C4hzbadDP2u56RrBOfNMiGF/LWsb31QKvT7+XZAmJU0FDR1PNug9+bVha01En5qbkXruXcaYrXuP9+4kSOwP2+npaJCmg1Cj7Cx+DXXIHvdTg6WFN+B5U6UNTKxQFTFTW0wN5aZWr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309910; c=relaxed/simple;
	bh=8XX6N1itE1yUmT3wOPte20qndhJThWgZfj+VXQ3AB4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AI/DCNKiwLsis4bzdSqQbDix/UfG3D/g1SExvcVZWTdVX2gTnngO9iQRnLIelZg+c0OtA+MqFqdCrTrdRkHPckvdB6dh3zkCnWEu+2uVZggyKL9TLzOxhDoEz4qKStYLNBaEalKvEcGERAuy9RzwoxQx+4bbGEPyXL2mMXEP2R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGN8pTcS; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGN8pTcS"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-409de4132b5so6670919fac.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309908; x=1777914708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRXPhKIxUEkhfArxTsVmrthzYNjEzyOQR0qGn2CDhHk=;
        b=LGN8pTcSdPJ/h00o0yaSF8yl5iiCnrzfDMvRxJPK12HYAkjXSrHX/0lcDRSr/daiB4
         1vEPElF9k/feJFJOSYB0fP4RUYF17RzkckBX7wrjIko69XkVNUFP6/H0vGwDjk08PulN
         YQWp9V4Sps8KXujc/0sJYdAMZ++W8PAC2MBETd5WMdIZx+t0psNcSSWHfaegQ1pw9HSK
         UL4+O2N/lM05lBq0kYHtaBvGimSRhQh9jA9G6ZXnvoImEqrXTwLakjJ8bI81sbTax50/
         7Rgabcw7WWXI+9L1mZHiXIZPdzaMgx6qS+O5hZ7ZCAnp2UdlFQlZz6iRpQjSJOz0iLpU
         JLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309908; x=1777914708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRXPhKIxUEkhfArxTsVmrthzYNjEzyOQR0qGn2CDhHk=;
        b=oyoRWricd+CufohNlbMhknb6EMh8sH0lYM9eAfHQMW2PtBIM6V+lNwKTh13xGcoNlZ
         TTGZcznxSJJn+dM5s6RmKhESFj/mq4jRyQ4vXwX01sI1BKhrcpRQOJlvDzyPEaGF6LGq
         Xhqq3B4FY79gWgEgMIXBdc/fPAQg+bBQG28jYIMEEIDgQIwTwRMx/7I3CV4tkizssUIj
         LARCxnauAW5LZmZOg21sd1agpx4YmtXwbwNCKSxJ5TXWJLoVGXr0OOfuXwxOmHVQdNI4
         9nAG8PN4uelBX0Psg4ZE5d3n8HHhgpbE1748rnw+TJ+/fnnCV7CDlmOuA4dg1ayYQIJv
         brkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yr8K844w9XVEcyiHKhJ4Ght5n48YI6et83VkjzjuHWevJcYltjZ8Ymgp9BpDxD5INoTB4A2zlfCBd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BnM0QQfHThxT19qlNMbuhFqSQICUyIXA0y1qmZkpNWx6ChY1
	Plg4+o5/k7WRNLj9QfoU1Uemn0JF0lzU0ffJUhhXVHyMZJ4GtUccyCHS
X-Gm-Gg: AeBDieteMVcMU+7z3G/kaEk1AO/VWTmRTcOckqvTmo2hi8n16JkKikVNnqStLhoY97F
	2mpzvaM6TUtJ+E8kS86ReWFp3CLb2eTL29yR/3c84m1tSo53IaCUO1G7ZHcmuo1UArM3qfA9YzT
	H8rE9zVE0HsNLamP50Bg6j8QEzN55XgXbcggZKrMxDbvMvBLQKxWaBKuoV/qZyTrZeS5BZF1bVY
	USTziuzwxPGqXp3oNOJ35zSoKL2peOtXUj8ziugXkWBnL5kHQT6Boobqp19vSfFiIeoqMdwG+Js
	hy2oGSsmtNToPsZbuscrDNFrsCMTueLpgaokngsb3jn8POw6Yu466CxCiz6hfOo97EMcKfP3nmJ
	QfrQA34ZOE+nJvFKyP3YBixc/sgu21QkC+gLDsyTGeBQgHAmSNH8kXDA+xXe8xxy1jMqHBYMnRv
	eyVI6MygACLKsTWjmddXTDbPN2YHZjchI=
X-Received: by 2002:a05:6820:f00a:b0:696:1a85:587b with SMTP id 006d021491bc7-6961a856499mr11658167eaf.39.1777309907872;
        Mon, 27 Apr 2026 10:11:47 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6955036558esm10261236eaf.14.2026.04.27.10.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:11:47 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 5/6] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Mon, 27 Apr 2026 12:09:13 -0500
Message-ID: <20260427170914.5062-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427170914.5062-1-macroalpha82@gmail.com>
References: <20260427170914.5062-1-macroalpha82@gmail.com>
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

