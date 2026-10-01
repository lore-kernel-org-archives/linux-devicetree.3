Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA849B5A8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859738; cv=none; b=n4Nvf6lPhQMSwhRMUFWfNnF0Z0+URyiIW03y5OlbRdVvKUn47Lx4vA0m25qRFDBT368gETxsjBo4pRpwyUPJlecImqTto56zkBns3U99mzWONUzm1YoS8AIGINRuw7FSJdTIobmuhsFUAJkqxMP1sWG8+D87DsqccKxgsNqGld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859738; c=relaxed/simple;
	bh=9rF3ZrItDykjttkz4FfPTCQcsbhicM46S3uAmSs4Vfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItDmfCtqj8Pdb5i3wKM2S0Vx33Ouea00oTmLymF4RkWibx48KCV2/38+fCHGuVEWoVjn/g83zF4vfiKuW6EKZmb1Kbe7NuyUfQDoOz0UdjJaOPQ+OYO3o71qbsyTuLQmDadXgy8wlA1jCoOGr2+YJUcX7mZ7srCBYwOsqxp965Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=kzjS0Lu/; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="kzjS0Lu/"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so209379f8f.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859734; x=1791464534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=kzjS0Lu/3/cMsQSYwWiqfMyodIAvIiCQbyrDx2otILPloKQGoB7/6g+MVKu0DyS9Sy
         W+yaM+oAFtduha4Vz2qc0QKzQQGR1veQqlynoubYqKneJMLMtRSTh20Wy1sFG5CDMm18
         XyufSvHYYRrXIqkrrpNf8vj124mY0Zi6q6C39npQJZEzNJQPkZDPnyjB+cbnIcT6ml9p
         yeHv5B5dUDxFJoUfXKxR9KLk607SomWpYWjNBXl3OQFXFzQSjTMkQlrS7n1NG35fTXxw
         UO3eRxpBgHRTbdkNUojTiRceS+yZ3YgXz7Ux07FTEi4gy9yoD3UjS3Be7Azg6WhwHzL+
         a9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859734; x=1791464534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=ixV+WlTSRIm5r5ZkImvDbq1IZOl9UhBAuw0wR7+VCIuCto3UaE9s8hPEA9IVWsLjCi
         DcqwJXkLFgwu04p7073OrCEPVu1jT7KVANMmqG7isWbwj6Ub8ZYOR9KLebYL1e3v4b8N
         mYHeCA3l3C5B3GN9c4CKsBE1EQFBi1wCX3P+R7kp6tRD/6zuPgF3686hY90yMxRwY8XA
         NMOrp0UNd4Gw3K5i40emjcUUbBX5bUtkazU2HJN/6sfHA147i8Pflj9Oq8bSAgrzDWpY
         5cLnvzLQwTcbBTzbRpVoOiQOp7C/OeBJ3GPHgvcL/tkRLVqmFtSqqZ6uy3ddrx3Ogsqg
         byeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxAgC/x4RKXbkjEJByEqhflp4AgmiJoTWruMtK3qmAi+4DLVQfURUrqU/gYfFoHlU+TPCvDU5XreHU@vger.kernel.org
X-Gm-Message-State: AFq9FYItMvi8RNJBpTX6sFKVdtr93zV1K3JbZmjyuNyfHukfgWboDIbB
	QIig3ajT8ra4ck/ctod/bnbPxK9dZeE3rkXbZaIgTfoCDW74G8QLtWTlWpDUoiSnUek=
X-Gm-Gg: AYBFou1crdK3nvhNfXDEQ5S74PeirTl0NmPCFAd6aO7yilEZ9ulsqqU0e2D3qU8kK1M
	WW5MpkC2B/kXYU7wBCJvJKksc5sb65cuCwQX4fW/eFRTtlbP2el+sdZhm8aIAg9yJM1ovRrNavV
	soHF4xfQc3xKzLoEHd3OtmD/TblagT3FdDWMmQRTWDXvP03b9LGpU9m2WmgoiiVxYJmOq26s9ze
	tHsHVhRVnoSgDx3I43zC/qcBSod1oDYdFJqQltQ3+nRHQzx3u5ZdvO3B4jmrCnwDVp6esu8Vnt3
	0Rbt2p8+6sQsM10XZGx7Rc7sTbCNEeGbsASquYbXCYbWhIK+Pw/bvCpUcapV+3gh7wfrKxL5e7L
	xviDErUzP0O348IpluNJ9l+ALnQEvbugNl87nOV/R0OfIMqSczec3NtjIEVwLgqF026hmvBYF4l
	3qYs1qxH339BL2CH/Gw6YFD9+GWYPZC+c0uHa1Cl0q8GoKOMxqOQ==
X-Received: by 2002:a05:6000:3c7:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48b0254d145mr7938379f8f.47.1790859734093;
        Thu, 01 Oct 2026 06:02:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 1/3] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Thu,  1 Oct 2026 16:02:06 +0300
Message-ID: <20261001130208.105558-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup,
before its driver has loaded, gets the generic driver or no PHY at all,
and one that connects only once gets no working PHY on that port for the
rest of the uptime, even though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

firmware-name is not used for this: it names the file to load, and the
EN8811H driver keeps its two blob names in code, so it would only be
read as a presence flag.

The need is not derived from the compatible because the knowledge that
an ID needs host firmware lives in the PHY driver, and that driver is a
module not yet loaded when the MAC connects, so it has to come from the
device tree.

Found on a Keenetic KN-1012, where the EN8811H behind lan4 has its
driver on the root filesystem and the switch sets its ports up before
that is mounted, so lan4 stayed dead for the uptime.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v5: none, Acked-by added.

 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index df50c4c33d76..ab95b9a5d95a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,12 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable until then.
+
   resets:
     maxItems: 1
 
-- 
2.53.0

