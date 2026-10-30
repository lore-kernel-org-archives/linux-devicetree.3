Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378157;
	b=5LfXTGGCGE+MIrcwCnN/HloIbC//3l+LHadLpDMOXaKAAnzyhm6SVV9yQhowJQWUtJDb
	 cZGCRqwCTQ/o6symMSYU6Mtk6QYFjl5e5de4X6p8A1PfWE1vGhGlxgx9K23TwXMs2Fl5j
	 FOO5t8gtS6Qeb6PBmcehLSgJQXnq5rwPRScsnzbhm4kugDDesTBsFj+fv3sl/iKZWW1fk
	 YsGT8EiItkz+f3aeGUDPb04XX6C5owXX7/in0rRk4UtMJLfSx4aXZdJ+yFvnwA7ewnJ52
	 9HPPfDwEGzpITasYpl/0KQ607OybuZlXUUz78J6p3wZo259mAdyBNaUl39vlHEw1LvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=23od8DmpvWDfo/E8vWkMFm8Mgr0j+i5aqW1qwqV93mE=;
	b=pNcY4PlMf1b64i8jbtIQr+ddog3wEl5Ru7zVGvrt3beFt9akFS4+pzhfcPMLWTGVRD8J
	 L+ymlVe1CT6r5g/M/DYwxrcI9d7xjKGKKvA4g76Zhx+NV5MR/DVH40chn0jezve/f9DWI
	 N8Xjn+RBJeU/iDv8XWIfWg0BebtZIEJM8n/J+ERyzT4PV0HKwW3IIw+nud4isF/fFuvtf
	 dycj6us9h8nJbRWIGeS6GiqXjt4PUMhidoZW7Rp5qvxzcH+y/vJ5ViOH7kAaae3x31wij
	 g1N2gsK/PQ4eQrlZZBnoKHfnhN1b/fXgcdrV49YgalL15F0EO2Dv1LBn2kgx89CpLEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CDaUhb0a;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D088606A337
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D088606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CDaUhb0a
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9754855e9.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378156; x=1793982956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23od8DmpvWDfo/E8vWkMFm8Mgr0j+i5aqW1qwqV93mE=;
        b=CDaUhb0aVpcuWHeEzW1qpAUwJdY8fd9D4yceRkrhGNb8EXPzZ+0zPB9Cx0EpM0JVsB
         vGxaN/k2ERRLlEoy9eGoF2/rjz+5uEBNFhMOuB8/q6ft66eyVpZhErpX23k2emAgxXfD
         xgccTfaudwjEcLTq/tbVBJRtxgUuONqvjOnTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378156; x=1793982956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23od8DmpvWDfo/E8vWkMFm8Mgr0j+i5aqW1qwqV93mE=;
        b=U7MjAeHwz1yWU0fr6Wbt38yrME1UZHoPQA2XrATz6X+iBWKElJ4WmC6kbN/qD17kEf
         h7TxprtxLZ9OgEHRClu8OUsTsawJXErjXqMSZu6mr7Wr/PiiKR7RibP20utmb7NC0zdC
         JWkIpFrc9/kqfgDqDxjIi1BJ6lMCbIBhs+Uu/4Nuq9VHgI/Ojm/Q8wphsU6Ok3LolB4R
         MkMYBEzf/lkOku7eoUhlrqp7EcjaJpDJU5s4zY1ALTVt32Nt5aqCNqRIsXFu19gN4Czg
         qjGByV9fgb2bI7aznjnH/0SsOu7dFHq5/YDdInTCG+mYEMMFsHuYldreSv78aENi7J6X
         debw==
X-Forwarded-Encrypted: i=1; AKwUvBzd0EB4vzl529rV+ccrBln/+UU29l5qpaGoKCRRdnHJFTxv2cineOkKK695I6LKhD4dQ+1Tl7FLRGJk@vger.kernel.org
X-Gm-Message-State: AFq9FYKw087+WJE2rzvyCvT+ne26F3BqYBUBk+es4wq6BOL74h7oA76P
	qz+wh8X0AnDIMRMZqQpr3cU20WfRAI8yb7XOboLaHLc77iLmsCs9bz/cgBqlBTuJKBg=
X-Gm-Gg: AYBFou3Y643ys/qarAhnmkUunn4aKzokG6/KUf5u8L/QegnHGovifAMYo8mYEdcZUh/
	EBZZ9tQVpR/5TtzhX7T3uITywJKxpQ1J0bio4P6KHkPnr/sPkOs3I+zcZs7Cv4QYkpPfbUjfrh6
	xWPQnj1H4gJRwG/SixhFheR3T1fQao4lCoKfXrjWnsF+HgESF7cPzBWiiHEGtz79Reg0w99MUo5
	CvXmHR0ZZIgluC6xJX/9DLXnLhyfKbcFzFTga1mc8f0oIgnfpBvjKxaCd9TpuLBTwRR/sgOPoQH
	XJmqmBUI59cZlO1GvMPXym28kMpZoewGL0y1tXfKi43MIF7WS6E811yVdo3UPjQ0DKddZHGc6m3
	rtUCu8bu3N7dvFOdI8n6ZPaudwbCgKaS3wTOPNq7LezhFEj9dOWN+bdn6yIac9ruNqvI+EpZv0M
	4CLTmTG2CT0Y84J6Ph+6pc8Sv7nMlyfwrGrYFNw2pfILInlz3VFhCFNQpk6guZJTyZfUW+jiE3O
	E2Qj0zvQml070lxzoLPPeQhg+Q2Ycc5dfzsd0M6rwhsGaEBpg6X1hehnXauR+YXg54lzq9Uj/td
	V23h9puV7HcHamN+peD74Il4AKX2VkvtCfZdFpgs/hjpIP4lZ78T1Wx8U54UY/JQC76Sy29yJ2b
	Szz15nGaq1OxMHre8iGY3uBD1RMYasnq65w3B7G5WwoJsolxBbz+GHrUfJtueC5bntwpdW8uvPG
	DssVO057xhfdx45X5TcEVHhMx/jQ==
X-Received: by 2002:a05:600c:870f:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ac1899348bmr57052675e9.30.1793378155859;
        Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:41 +0100
Message-ID: <20261030163547.2682583-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam i.Core MX8M Plus Fast Ethernet
C.TOUCH 2.0 board based on the Engicam i.Core MX8M Plus Fast Ethernet
SoM (System-on-Module).

Unlike the i.Core MX8M Plus SoM, the Fast Ethernet variant embeds an
RMII 10/100 Ethernet PHY, so a dedicated SoM compatible is added.

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..5835c25bca90 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1222,6 +1222,13 @@ properties:
           - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
           - const: fsl,imx8mp
 
+      - description: Engicam i.Core MX8M Plus Fast Ethernet SoM based boards
+        items:
+          - enum:
+              - engicam,icore-mx8mp-fe-ctouch2     # i.MX8MP Engicam i.Core MX8M Plus FE C.TOUCH 2.0 Board
+          - const: engicam,icore-mx8mp-fe          # i.MX8MP Engicam i.Core MX8M Plus FE SoM
+          - const: fsl,imx8mp
+
       - description: Ka-Ro TX8P-ML81 SoM based boards
         items:
           - enum:
-- 
2.43.0

