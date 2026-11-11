Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423867;
	b=GgN9Q1F5Zl7ceq/rS15+Q01jp7TZszX8QOz/6sA9zuamaaKjbMQinOAHW8+f8gbszaDH
	 Ff0TB86K4mnRAnfz3g4rrAOqtbHY39JoBaJ7xddS8/IQO7PGSdjtWuKY8N5+ymOiZ6BA3
	 u62LliCJCAb2X6OdGspGNRNmBYehk6FLOQpPOPF8Udwnll39Tr1IKTQnOUgiRYnrxCrsU
	 fKZ/T9Iv6LvkSVGfQ/YgE8X4XXMl+ircWnT35i53p4/nDscxx4NUpuqTQ97kJi97YVZ4b
	 VH8rHQc24RIPfxCKw+oG/IWLT0VsbmZLU7g6PGRwt8sSaRwSG6ZFEBDgnz6Btjng9wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
	b=5ov+Ln6pLniNsBLWqOt/nuxp8qQYRfce6I/0yXbWPdPdwsbHpNhH9f2U3xYFikF1XWqi
	 gLT8hgWTdtK/O9TINg8Xs6BhdnvCbKDN6BMzJnpmklKfFKK3VTskPVf4zaIfq/W7PQT0d
	 GNQvZl1tDpzTP4e7W++SvVlGXQIPhyn9hJhhnNkPtnCfRH9nFYiBlW3fcklk6sCMI851g
	 dIwEAFREHLqqmC0FqOhoCJaMQZM2fhuPyAd3HZjjrzOCErelFH9awU+QEofjBOgFjNBij
	 6BAv7getq8LJdC8UA4IqWTVHzDHC6sTe8mSDwOkjT9v3ZRJJfPsbdVxInnyIs6qlTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7gb2SBr;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD239606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD239606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7gb2SBr
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e946155442so28282305ad.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423866; x=1795028666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=t7gb2SBrbFzQwOaloQj/RTCPL2QORc70Ixm2Cb70KEQk7RBnBtAe3oV3D4oEs3wU1H
         4AJCO2lV7QONMcqqI0b7QwZPzpdlJe3+Cez27enMF5NnVYPi08nMBgbZ/KIqdQIIGaDm
         BYl7uq5DYec0Ac5gUtWTR6hUeE1ik800kONgKwU99pjHUXRFD5OsdYFZZGnpSd352dmg
         EH2b7yhmvMXjymicgemasij4aEi98ko3q79hng3zVKqzj1UcS2Ziy1bjqw52iEhXMhEZ
         gEp8fhXUeNk2+CbUIRWVOEDVHbgyUMvDrexnXO+PtPNae+lnLyx1lqgPBJNrdIayvaCi
         GUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423866; x=1795028666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=e5jqyCIkZbs33kTzqIRB0NESwLETn1VTOv2VYkb0lJhew8Vxl8zymO9Vu9+qpCLoIa
         LMEEuK+X5sdq71O+8izQiQ1p+vK/QG7zCq3EoO84wCYGDE5/8wPf7C90jhAsoAQ2zQ5S
         u/076ZLPKQJKhakGkgFmA+cB1XtZTSRZw36/QZZ7uucNRDq8Fx9hQf+J9/NcMg2mItCK
         m5iUh9t1YbTgR7nRZvfF1QP+q19MJfFu0hOPocDgrl0846scYyChmwJbqD6cyMHxs0OM
         AOsKJ4Ag5q3oPvPxw0L2LRZy3Qlxst7XDq1PSGSA8+9d/qVqQrKp/M154Pet9cb7K7Sw
         3toQ==
X-Gm-Message-State: APuU4Z9ym4RPnCg2FpX/UMq5fkxx834+eVhh8/bKN7/4tGmlBR6SFxck
	XU4AAZxMuj/gZ4NRy9Sz9M2dUEkx7qcQP04rZRtNLlqy5gM6Vg+Yu/m4
X-Gm-Gg: AYBFou3u5yeekf8wdhK3Mxee3qooFy1Pr47VhAAgfGa2z9VHZioTpibPXFs8y9mfyUJ
	SbLdZPj0HR5nwbZvN+RmnsW4bhvrVZGGYlvXT50twWfmh2jUzXm9ImGDYCH+j+AKg7eyHAFGUZQ
	liaaUbuD98gRpNeznsTfaFgpeojcyQ1WUoOfq42OdOGycrP+82FnQohKIA8Hni4gT+Kt+3qgulI
	Gpu+eD1CMkFSWt9LjlzUcDkzUdE7l4SC1ktPVURdDpvIbRjugxBiOtbjwSWfBlNE8+nNlQbVAjY
	GFmuwfUvsjNJ39Os5GcZC28NcffVlZ8hCgYW38donU2NPrF4odNmrDr2Y3sG9LaJJdwvsr4EaT9
	24yRK8AECIBO/QIAGjvPbKUpZAM2UBLyTt9YkY7A0d3r43qRVUuehme7aMzeEPlmvlEmEsrgOeV
	qKzGIutO+0vfeioSx3cyeuc04aUT6JoWGqnzBji0IW+HDxQqtkzZigROq21R33JDXPnzyH8ZEAJ
	qRQ3cjhR3eZ3z9af2dI1tvUFtgXNJ28lIWu9ofH2v02trBoS4fZGQ5P6aLKUAhnKNaCxjdnquWC
	ehOYuTGPY8szQEDFp280eDpS0uK2jJg5Rf0=
X-Received: by 2002:a17:90b:55c3:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b182f0ab74mr2979207a91.47.1794423865920;
        Wed, 11 Nov 2026 11:04:25 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:24 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:57 -0300
Subject: [PATCH v2 1/7] ARM: dts: imx6q-apalis: Add ready-to-use DTBs with
 HDMI enabled
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-1-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2682;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=IhvOHZocG3sOxkIY0mTZ8xkrqmTA96SIs4gUIqO21v0=;
 b=0RH9hyedCGLDxqRsacjj700/y3wjOOQwWdmkydZUbod6PkJsolk3iCEIm4MOXpWF1orItNp5+
 rfBds01kbYkB1eHbWn02cxpgaaF7avxlyA6n5rxwvIqVrSMcS/HJ2Vd
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Combine the imx-hdmi overlay with the various versions of the Ixora
Carrier Board and Evaluation Board device trees to provide ready-to-use
DTBs with HDMI enabled on the Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd4c8062e6783..cc0f5f100892f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -124,6 +124,46 @@ imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-vga.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -271,15 +311,25 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \

-- 
2.43.0

