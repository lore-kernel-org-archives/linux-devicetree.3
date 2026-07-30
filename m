Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F39D44AB9C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429325; cv=none; b=BH5bsZeGZlG9HqEzcEBWdjcpoQq15UwDyD7jVd7Ncuf/hRfqbI+3TIRR7KDOGmmkJpf1zviRmFEwyh3bdcmsc+cJ0OSlUL5u2Yez4avCCuJrnDeJ/dZgFd184H47Xhrq7CmFXcE+guj2ED9DX2zBRhE4KD1iVQUda6NhSW08nhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429325; c=relaxed/simple;
	bh=L+CLUo6CbJvVdEY+C3+udC16zWCDIDUTCSNKKOoqq0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdyUS66UlTh+w5yYRHlH4QQsycr5EeuN+U4xfLUgoAOlHeM2IuaaPyr5vA2p2T7tkVvQxUYKJphh8QzDOAe5u0KstzjPNjZuT8pVhscb9npxOJ3ZOQeVpU2s1AulH5NSm4Xaa8TSzZ4cpW43LNZ7lY69GkDb++f+d1bPK7Kk+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTGwzBdu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTGwzBdu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1697506f8f.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429321; x=1786034121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=;
        b=OTGwzBdunOfFyVOGIZc7LSky9BfwkurTuDFNJRL0XbWHYKe2lg4KYLBz/AosmnVm3i
         EJ1k9XrQkdLVAynPaK0yTwiZNXgfr8LqBUJUQBKe2p09DQKUTZ/73I5DHVmvk/qusLmd
         MyGJMBBbZKtBOK13OFJH3zzrURCoIaKtmO7zD5nAxrLHjSVyB5GmX8QQI/bm9hZ9n0yO
         SpiAHsNbHymKcadqglKn4RFsmhDftdcp3qcnZCBvUQqBD7tUhRr2uxSljM2ehwioHWGQ
         xc7wHRDMTq00PRfZk3OKSit+MsfJHpMkUOi34o2VLrA1iLD0Fy3oDgwAJw0wOf/HBOKE
         sF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429321; x=1786034121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=;
        b=bdmB4C576ELaXV4aFLSDcqx8mFLaEDNjO9W9w6Okq2pKOUve06B6ptYMeoyR1se7OY
         IHcspFAKZmGANk7DuVtcwTvtszzJjfnArWSmWq4zAlmrT8zJd4RH3gw9W5JuCwmrSfWy
         3neJbSVKImA9J1b9uB6pkfAqRmgleFrvzp6ePjc6x2dTYR0c2KKxADxz9swABBbhyPXF
         1kqiYX262FcXTlC0UGo9KxfZZuWkOrJ3nvdcZ6c46wAlJ3nqSZ4NpkA+TsuRr0Snvl4y
         TbgDg/7V14JGMfo7VkaOKV2NWscxTXrWIOmzRYm6vcIPz+ywFvDryTnGEj1snDRXqqH3
         UcMg==
X-Forwarded-Encrypted: i=1; AHgh+RotbIY6+BZwnSK89q8hh7kKBy+xIRuynnbiFY/G8tcw1eSb4xKfVQd+QibUzRmc11bV2uqyCKXrGzB8@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfxzPhh9TKeIPV8296AasFU28NomSU8ic5Zj+To9kbN4zJCTY
	mvBuUTT1k0t5ZIOe7TPeFmAE+LdQZWNUHGzjqtqAgVIZGnOnJ6BQ107Q
X-Gm-Gg: AR+sD12S6Il2CrTywkfYK6l7l6Ck01iPM9JludfMZce0TepTJ4kwHYub2iAoy+7Ot9l
	J0un+PSac12yh3CkEW+oSu8qdPNZIzAHvg90N9DRzwEKiitOcM++WKdfSaJdiXNHwXDMbuy54Vf
	g3dF2Zkc1y4ufctzVe0p6cbw4274Yr6X+Rsm8UmDg4bNNOvTghy4qe4as81kxzhHo/Hza+Zhqdx
	3FQAll1k9kE+LybhHALrfksz8ezk6dKG5ptljJhmB5F0a4HndsydoQ9clkqoYLoXL5roGkPReRp
	fTtmwVz3ZRtYI5H7fvd9FYc3XIc45QleUlFXuJTKr8fNovX4rIU62yRgja2gZHMC9hMQH3xX2OF
	9zlyBpS6qm597p8pZSZbo1gQ4jnDMzeeu2erA2OXzJc5uTE4YiMykWo4rut9Qp0sencC7ands8d
	hKZK3TbL9NGFqdJmyqGw8uXdCLWT48nUgOi6WSIGcILW0eYSA6DxXh6vJ7+JKeCW8a6vimxVP9N
	PGQWFuPVEkVVg==
X-Received: by 2002:a05:6000:1acb:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-47fc822eacfmr4812060f8f.4.1785429321557;
        Thu, 30 Jul 2026 09:35:21 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:21 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Thu, 30 Jul 2026 09:34:09 -0700
Message-ID: <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The carveout region names are derived based on the DT node names. Because
of this, the DT node names are ABI, which is not supposed to happen.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the software will have a way to build the
carveout region names without relying on the DT node names.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..8e3e6676a95e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.53.0

