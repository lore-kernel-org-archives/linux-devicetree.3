Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13504D8D85
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659482; cv=none; b=j+EvzpidDpHgT+L2ViEYoShmmJ8iAk0eQowXs3xx3WZjwQYQfuaB3be2VKcSG/u0F2ATcUyPNcf6bthPJ7mxRPT+86Brz15n5FwplMMFlS5C7V9FRrxdE/qbtWEwTSz08idQ349/JRJhak9d0m50LcD6jqa0jW1PY5DI/2a74Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659482; c=relaxed/simple;
	bh=vsvztABr3U6ZwEr0klxubYysThxRTUKFsfzctGVfq8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2jNfOJLoboucnfVfha/izXJ5qOYOyHrR2wruw6IQji8bwmvmTjLbxANuzFK9oPr8uqX4ThrT7UY3qzLIBKnVIP6Fgif32q6DEwijNV3Q4A8UwPLO2qBcmvWg4GH5GgMMjpPbfVuXJuG+IKeYskm4cTGtakeIz7pwf2PD8JhKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKXxX9F3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKXxX9F3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedc94d37so957409f8f.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659479; x=1781264279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=YKXxX9F3paYOn9GtFIH6vbUunVhpGlCtE+7rU+udsuYbhEgUhZPQ0bYtRpw8X33TZA
         Kmp/wsSYZ4f/wjWSsmJIGMS3B7OYAU1V/t40ebuLhc39vXmEp5k+vZtvyw6FtK4jeuRG
         kkeTH4adz+vO+LTpe9iRa033Ge8wj2kG/OXlafiZbDqllT2Y/NsJxeOiur8zHaH2FN+4
         Av76tUoWaLB290Jo5mTNTdOyG8AGYMuWc5goAEe0Zn6UbgaO1w1T5Hs86NFWB+wLLPBs
         LgJqFIkb8gG1s8juf+MX8qHSP5q5ruJ0XUEYnkO0zkUNaPifq6w/WtbuoWOrITxlorL2
         dzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659479; x=1781264279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=N7t33AQ7mJcPH0ORfvPAhQUAj64HLZa5xqPgxy6RpaKW+UZAZ5FIpZ33Jywak87YQB
         mLa971rCjbsPH3XHGZpsGbHqhvuz6YRWac1Hs/ShXDCY2gp0aRxwIwjQy0jLK+fr9rPY
         sRvKkgBjmcHUq/Q7wXjv09zZmC5Oa8FdxCNQ3kN4o28nLQHMa6bYMg98Aj79aibG1pZN
         y8CjxXr/5syrQ+ml/d26rOvgPeHep7vTYJoI9oaSM31zymIgPp+fSBFOAhiXzNBSl+Ut
         fFzJG2q6dvmO2alYKv1yrwpGslHvhf5HJSR/ozr28iwb5yroJM8p6r0hwaqYQH9zl2gb
         U4NA==
X-Forwarded-Encrypted: i=1; AFNElJ8a7Cs7G1RjKZUj0IQDknXWL/K/aMnuaEmg8pNM7T3lZyCQLEWAEH/2Y5knQtm2h0TY+lYntFss4/AN@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrSNea1TiOrphkWRiEZRV9Q85N1X4+w+SpQiwOOcd4uG1cTe8
	SlPNzO0xT62e/z4jtdZaCy86b9uz3D5tnhekvnQCdvkJ0yEKRFoEl1oU
X-Gm-Gg: Acq92OHHqDgx8YQbcfUGA8WBSY79espD25Obie7ta3w6G+sTUdPJGN+BwOLaEZbMIW3
	ZrDv1s5ryMIr/If5KFdk9a7/MJwK9gVuAXeuVlll0zW0LEQ9+08vlUEd5o3uPBF9eRGJVjsIpDB
	3Wfz3wECiQ5qfPF6ZTnmM1ByrPYFrs0eGjuf8J2Nkdt5rComzDZ7tx/5JyKZWZdpnCl0Ded6DRr
	0wzU5RVzk21OaX44mgxxmI5dOJcCM8w9cov7LS1cEWrMjV8mTHWizwatuHFzwqf+bcjSLjF/poE
	hKg20aMlfH9H0jZrGAfk/vLZukKRppEZPznQ/eWHJ9Uk9NIEznpf/MRSOZY0c6NJ/aEzY8Z19FK
	BdSsOdkySDPIZ0Gdz9hKjAQJcfhZiRwXji6sLEyoQRpMBe0KneuV5DNJIF+YD7vMFUzi/ljnvS1
	a+XsVKZhHmCr1/WCzCNzl20/KP1YhPuG8bbX1oFqxgqL+aNq4tGPKD1rBkTFZ6cqUatIBWyvg=
X-Received: by 2002:adf:ed0f:0:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-460304eb55emr3605857f8f.2.1780659478953;
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri,  5 Jun 2026 04:36:18 -0700
Message-ID: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The names of the carveout regions are derived using the names of the
reserved memory devicetree nodes, which are referenced using the
"memory-region" property. This adds a restriction on the names of said
devicetree nodes, often bearing specific names such as: "vdevbuffer",
"vdev0vring0", "rsc-table", etc... This goes against the devicetree
specification's recommendation, which states that the devicetree node
names should be generic.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the carveout names can use the values
passed via "memory-region-names", while keeping the devicetree node
names of the reserved memory regions generic.

There are no restrictions imposed on the values of the strings passed via
the new property since the software allows any name to be used, with some
names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
special meaning.

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
2.43.0

