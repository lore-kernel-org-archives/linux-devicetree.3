Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5993AA1B6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912646; cv=none; b=LXJ1CFKBVpHDJJqU01qezVU4D23W6scSNm22LVwjJ4G/w2xClAWWyHRJyLCcDzJg3DqrWqZTpMn5ZMEatOb2QDJvDCfbxFGuq6I2aOgOF/K0Gm5ZiMe9fCFqeuSfBlC2+SaVFF9RQjk3d+lpPHq0FpXPp4BFUV23TVfdIEbYeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912646; c=relaxed/simple;
	bh=uZvT3uSWVgy43FuIUxyuAW3aJAQGYTUOjRY56ONMNac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZzFcoQNC++/gcaHqFm27bG2WX/iRnM8EZIRba6LzgUw3wgHESDI7bqNKU/zldxXTJ53dxWstjJoJMFzDZ2w+DVdZfH8HB6eainD/NygholZxgKrGXHc4l6qdFl3YxINM8N+yABQd3SVdC4PLr82oN4dpBbObbzc13WVfFADsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3/QAkw0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3/QAkw0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2977089f8f.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912643; x=1781517443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=;
        b=D3/QAkw0/APyDw1JYLk80/S/IusALK+zOtKHugd6oP7GuSYnYnIcD/PAlxxWGX1MQy
         YhBCkCp8AY2ojvySKuk+LYuv9VoblC0v0nXS77Wjk+fC+TMkskyfCSMIYFKFktzzqwuP
         HhYUrpH/SbBkjDo9ku+/3g1efaCdkAsBSSHjvHkHUGJq4VADejy789vY59q+n00GQDZ6
         ags9npqhdGa6otipZVF9vgZ/CAXn3ltwpoztvO5FaW93xBZiz9iNJRNVar36AB0RrEjN
         zFcheBS/E3yZz1tLRo4N6DQ7J8b8NxYCbPNM0WjBX3MdAcOx8iM2HmhJInUFKsRJbJgo
         3czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912643; x=1781517443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=;
        b=A7z3rtngS2VNyzIaehNAvGQcy8xoiuGhplXx6g9QcbEXDxankXm0QB/cbf7DbAH2FY
         hSOmCj/YxSFr9Wf9p01HCQhNEn7FAq/9HGJAUt3SliaCsSjp9BbagMqFHu5IIuyzWIK2
         EJjlJhQ+PYKhz1oGG7sh6EIAKbWeRDOX0Dy9CmS4ZdG5S5ZlartzGte2ickGHbtN3H9r
         axOutC7hRZ4s+OfsuOoL4m7yrQLB143P7oa9jO5VHw6bkJ6qZ9VMskEOWd+qwk2bGimX
         mGYPDeCwWUiSVuua6NlKSOyrfzRIbpIy10u0KqG250tVKS364A3rdHqaDC4w/VfF6a1A
         Q96A==
X-Forwarded-Encrypted: i=1; AFNElJ9umOspxSx5AQaCQLFfCqhmMkJG7VYr0zPr8/M5T43FK/0XMY42Wdy7e1v3qU8gzH7IAodWMDvO+SDj@vger.kernel.org
X-Gm-Message-State: AOJu0YyvFb0YkunREwzufS+WGNPcl3d4Fr81cyukc9/vep96yjnrHnN8
	vS6cXDnnQn5eZmxs9hdltddSvcWqdD8WUtUYLkq61Aqx8GcuPfiSZ2FSrxHgZBPk
X-Gm-Gg: Acq92OHr/+bwFnxs8xIfbdndHrewXqJiy019habMIAHGHa1Z5E3iE+ik0ODfFvIL5Kd
	R1jpcM30NjVbCXD7EY/C/n3pKMOGVt9q3tQIB4zeAhWWjUO1gvhZGsOmRS1juGFPc2mEcH99HRP
	GmCWORCONRnw3OnKCNntUFihj/O3wwq3UETmcM+9Dm9DqLs+DjHglCXoCd+N/Yb4XdEyGXwUdcc
	PmL96gETWkE8gSqrC5JrfIDkzukEPhpbpUXEipdefK/qahBP5lDztK5nANeM9lMFjC66+KU+BP9
	w2h4HfnBrRb87wrl6ragQGe+QHVhU7UcuwRKpbtNh7cCgXKWNuX75SdSxQ1QnRGfEsmCOE1vC0t
	U9mnl7eFay0XQ/8iJt25sLEc0FkHPyZHLam71jSQUvlyDihaos06oglkNDIHtlpK3+4NmMNFjsS
	mlKy0alLJ+nG8EoHryWxAY8N+i+ZysRzsRvhl1buYDqFk3rMekjwoBePI+9RlTc2D7mmF37Ba8G
	hCy6LxwiP6gosErEjw3mH8z0ZDpQAbTbMglMqAmsW7JeEUw
X-Received: by 2002:a5d:5f44:0:b0:45e:651c:47bb with SMTP id ffacd0b85a97d-46030512855mr23767118f8f.28.1780912642817;
        Mon, 08 Jun 2026 02:57:22 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm52385020f8f.11.2026.06.08.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:57:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Mon,  8 Jun 2026 11:57:11 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912513.git.stefano.r@variscite.com>
References: <cover.1780912513.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

