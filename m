Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04C4908B7
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637470; cv=none; b=KSHGvuSkXiApWTMesMkvgL+nCYc/0YXP9rfJ4CXHZX5Q8q3ntG+LDcr/hF5KiZ5kq3k4n5wiMrYMgTOb71tiD6Rxt1qyJVyAm9OKPOCLmKurOzmvVAzrI+VKCAIeALLQiknH4NKvC+nLgXJ5KCiNHYEx4GhL95hUGwn1rZa0JgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637470; c=relaxed/simple;
	bh=ZQgiNiqYgsBrWLZgSSsY8QzFfXicVpacPgeKKriczcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYqYBd4ISQKVp4Y27n5cPC4Esut/WXJu95ty/GlzVH+fLPJUjlAH2TF9YYcnWt+SV8LQNA84Qptco91pesiGh0uBdGmg0QlyAzs5bWA1XFRZ+DtLIoOZkD9+0iVdy9R4tSZWtHDzp8GegHheJXQUAHw3FwEEmP9vyx0OifU/IYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4SIVp4W; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4SIVp4W"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-481412f1828so366958f8f.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637466; x=1787242266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=I4SIVp4WYsqFo6684qjdQAGYsMznzM5kM/1r/bn1bQwMeZhp3nW78nvNDP0znca+qL
         pcSjogk3s53bNBNQCmN2/tpWuFbm8iXmkze981uoHCJ9cy2rW//QeGLZa3Bdm6u5sY3H
         P8ytx42n37toSFSgWTIGrNWiVZc0goxVn8otoq9pApDirBV/dgk0VsO4mFPWpP19Kar0
         4h0k5zfPWhGuRa8NkYYppplI7J/lkU9VZps2/RYElznbyonW6800RScsdm6q/+IwYvMl
         3ysg7f1JMna/aMox8YkA1AT/7aGnWSSfFpGkK9AO2i3LCrucENSPN5b3rwAE7QWrITOk
         KHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637466; x=1787242266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=LQk1AZ45nmkU6nPuIYyVDN9pMPv2U9yS4GTQsvJtVZfK5TlQ/4B5N79S7HkvJx8P0T
         +APC8VhsAcpGQFy4D+S955l1r/FTtwgcnbh/Jm/C4ItuhMgtn+xiWnVWU2M7I5oTCbfj
         3wpJdMkWROwAIZ0PcVEiX7DSLmBtYnDZj5UPaYUzkcMY7hLPajEfzITq+AVd3lSDUOoP
         LgLozz37PjfFegwpRWxrZ0waMevWlEVux0q+X2VPBYpsnIAYOUNE9ztbISZzHUFmQSwb
         1rDsHZcQf8lonP4QzVDnwZXaDqVU2D+21Zjrj1W3VkKtjIA8uQhlPevMuxLrHkAoDUcN
         Hg9g==
X-Forwarded-Encrypted: i=1; AHgh+RoKN1/JAWckVUjp3v5YDP/Yim6LG1/565QJTfdepK6h3M1pLrmPhSeNNAPyE3X7Mz4wv+eTUBh/q78R@vger.kernel.org
X-Gm-Message-State: AOJu0YzpXHhpQsF8dUCEAKXCPbC/EV9WIg8501cxi/lWGttsAyi7se4F
	Ae7vFmO1LQIUzaIxHniI9g92nWK/hFJpFh9NNKSjOgxSWd3zUvh0mkpd
X-Gm-Gg: AR+sD10joCO9EsV2PYAe4RM/OcIDtyoF+5ivPRYo2p+j5DiX7zHqd+TZEUpdOlUnecH
	30MhV/qX9XR4rJikDlnFC6S12MaRGwLsya5Xw4/EUkq1Yeli6h9d1ZGjY8jVCPCLwnCa998YTQl
	9DG7tvRKYSuU8KRlvPeSMMkki4l4Yka00tYqcJwGfYza5SWxpfOcn0e7OAVkTqZL8gstX99qviD
	LHU0R1PdVMOgV4P+tek4mM8J9J1D8i6NZgiiDTMN4TxpNzDlOo+4zUnOk2Nfo1hSlkHih6P2nJG
	ORSNQTSt4a/pUOSMHWIvoBtHArCwO/rbb8YpjngDxIYAZrqqvFesAyibn0EnkIW7RsFJOXPdOZA
	5PnvSILeWbmChKQW0XPvzeSPgtE/pNP3k/gqI/5oVgRWsxn4nrjbP4v06gZUBaQaqvwn5JIqUP1
	M0Lww9TkN5204LVzed6K8/HuzgXBmtl44o5c7QCJKI4d7rTWSHi43VV8WupsAy+ZsbjQ==
X-Received: by 2002:a05:6000:46db:b0:47f:b452:49f1 with SMTP id ffacd0b85a97d-48159ca5c11mr7774631f8f.2.1786637466184;
        Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Thu, 13 Aug 2026 18:11:00 +0200
Message-ID: <20260813161101.2274327-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0

