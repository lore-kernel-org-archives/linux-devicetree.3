Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F384423E9C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133650; cv=none; b=dlSkTjI5WtakQs0BPY+1PEYqQhtqezypjEvpwdpk2wcvsjGZwkL0CezeoL5gmeVhAQtGQnI25BSDdkrDQIBpfNKSaoe8jhUgkbF227g5pcExmIjZSk/nh1s6yYuwpfncctiqJXJl3EV+AeDRuK1I0X0o7LiFAmbCi7Fi2w9FwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133650; c=relaxed/simple;
	bh=OPJAoc4WyN475VflFl2jsg6qSTLZxhDv6kZ/OJaUgj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbIDjf6u86yXsIF0dmTH+aPIG4J+Rs4Dunln3jOmh/PG9kDh8Mieeih+bLoHJl/WTtEMh7cWRqpUOfrUWAwALGNS1T/CIsX/Hdpo8K2zpFg+BTk8aPwGsEiznjGwbU6J1eQhzGWc4F2tbx8K3O2QcKP09mLukx3u+a26NJEiZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqO+FsfN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqO+FsfN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476d8e647e9so5369758f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133643; x=1784738443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=;
        b=BqO+FsfN8Y4TZ5gZZTO9SvW6d25maDliME0DjflumG6udZkQnNdbq7zRUqmABmV5xK
         N1LH0Q2SISc2ww2NsbFZI0Yu/GDA8pYb2f/NrE0J1I9p/9V9GazYONCohuQWZvjA79Ru
         8fDWa0SfXM2Xb4tnnWUjOQhRzmSUCVr/WDHBE+/ko2iJX+3Q+Q7qMHxREhxhH0D2RljP
         QnZET9Qh7jHhEC1t8oJeu7v6exVwdR9LJEgtXGVpKQ8BMvccYkfET5gNPqXf+8ppqiwM
         xG9uQm8728WNpG42oQ3UnsbgrrF0fz+1PgqyZKrMRZ/qAubvUQwfLp2f3+4uVa/oprga
         NEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133643; x=1784738443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=;
        b=E17+tOuQVA9M9/Pth0pCC/bKGqPQeo11iYDmvjOjH3j77TH6wNYbSYIiQF1fya9kgS
         2PgrfsQOYdsK8ReQ+olQLCq7osH4KHPuxYl4MF63G6wVg9Q3CJgcYkQhHZdvIQrcuII6
         GeJYr+RvqaozoSWB+/PtMRxy+kAJNLTHbrQ4NAy75VGIN0lZUWnw1bTOnDP5cns8rO+6
         AvWBZkGRkmMEy42WiKEo1fiJf+po6LpQPKm/KpHhbUVlnzeEfsMHVEaTcvMxb/ZYo77E
         b1mtIeVVI5rau2Q1w/qz6JIvsjHla9PmauxcDlzQp7UBvpSKO7XKRMwVkP1lvV7Vqiod
         NVpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNbGGp0C9GWrQpmZlhRsqI7NCN/UgoLyK2KwCx7Syjv0CMOZA+lK1mtsV1BUu/SxCGnfwRaQ8wXmym@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+EIcJRgWZNXF4OMjtX4ZomKR9Jci+KuIub9zQum0k1HOtplJE
	4WZthNifL3Co5fx7Y+9GagqKuhswFB/Vkfx3hJNQrHZDe3WCEBXy1pjQSXr2ww==
X-Gm-Gg: AfdE7cn8/M4TWsYhsncEmiRMUN4ZHyT3lDyxrGcfO0EbNgHlLI+WpaSa1/oHkZUOhbQ
	8Pb6oEJ3X6BkyVf+DYYdUv0ujEMPjThMgs13Kugh4v3zNUsUjUG+KEqePX+rm1k5Tm2K6UadFcr
	K0xSonTSYtQxngWJIWL9l1O/ZsaCnvQVNJ9Lwz0EdQ89Gj+8iMPu2yu/jPXawiPeaJsY7ML3Bl4
	hoN7J3oh8kCVtZEMI9x/IrR3IrbRr0R49Y/T7Qes/fgQsqz3XzSELdfRoXwahATBAHDps0MWSp/
	bditnCnT0Xt/8QPQgZkSySOqB8jA5cZXZLqbJf0OYhyDQMB2lOXSk+Su+C5ilQYE6t/57cxdGsP
	YeCk73jJJuxpnmhqzLPfZXwHlOPCkGWCPAuoUTrPpBxVhcQytb8GEnDwwjeDCaIC89rYeaKWlXv
	MWRApVk6/4S0/mrU1NuX8iEWHvKXTgr4cHsUjYsSzApF2z4DtSyP1+NX/7ew==
X-Received: by 2002:a05:6000:41e3:b0:47d:fc33:df0d with SMTP id ffacd0b85a97d-47f488c1dc9mr9593088f8f.58.1784133643146;
        Wed, 15 Jul 2026 09:40:43 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464bbb0esm17836432f8f.28.2026.07.15.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:40:42 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 18:40:35 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784133402.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784133402.git.stefano.r@variscite.com>
References: <cover.1784133402.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

