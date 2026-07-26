Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55E30D402
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043511; cv=none; b=pp2OWCe5NPy/pKTiqNvH80IftBchb8VBqPndenijM0xNIvrLeroGUlN+HZn5anc8JR9vvi5ljlBalzwxLDVhNV5z1jqWIdW/rmi5TFB0cqHaaVPr0za1mR68vi4bqeWlIjjk4kqjj5I4S6bx0COnYhcqIaq+Wq9EBuSX/7NiFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043511; c=relaxed/simple;
	bh=I6Fu0+DNr7LT4DtiL5EfzHWIUsnAEk+xip2XdPhClZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t0z5fXSxp7vejmlMGggyZ6FrtViFKddDREUphBa4poOPpIg2bPouWTtcHBwFaF/XibRUYEzjwfsA/quitgbPpox3uXSbOT/Ikik+BBP5gq+1gPvDZeO4BYFjCz00jfRE430l3XdrzREh68XtywROCmG9vT/mFNP0LmUW1GKHnds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdUCnmG/; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdUCnmG/"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84867f07d63so2076453b3a.2
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785043510; x=1785648310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=;
        b=hdUCnmG/xxKp9iqiKNUDs5dNrUKYeS5u9pkLdLL0wq4Z799UrZFxpLhUsIeCuknIDa
         m5nlPTxtRmsy9A0tEawg4cKScUqgm4LcZtwv1Xcd8AhZ6E+iIFyv7G5wAel7svfdzgas
         MEcBVbx+rjPYGQMOxJhCXjNmQZ+6rSDPVvladYPZsCymNffZgnQ02gZV9HDrMPJnWYqY
         +6gm5tUqdXeGhC2FU8nF3uMwFgQzC/xy10NUen5oSQwR06SFtttswWJ0gRkyOfcEUU9t
         urKZKf174Pshz6WDvWjPXBJbxiu2Crfk0Mej8g0bsALGovRW83nQygEwAV9scf36J59a
         g1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785043510; x=1785648310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=;
        b=L4BEi9w17OTCOS0k9xKh9Q87xI3dZ7kdneYUzp8uC0IiqpKcQbirVGQPX/i5caEtuz
         a+T9OBFpZ7lgn+ct9x1ZVIKWKuNQjooVAU0akUCtbuWLG6g9h6FDZWAoeTS6BxjV8kb3
         mpQDyiPTND6JNOSIo55LSwgLURXez1hMqbH6WeKj4hzjm04a2OO+yu2IyXmZS6wo7EbH
         UP6X3NTIkqbPLbJdPBlM8Q/l/dSUpwkJrhNtaj/GtRJ0AsSU4eGyZk/PKwm6Gm6WW5fU
         z2c2HipSKhDcT95rt4Jp6XayiDl7Vkf6XfpaQsAVUUlT1MozKzqYPMot2r4I/EIdwU89
         YQtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqgaffL+8WpIQiYEqNiThWXMXSi6xnYDtZS1iicy5ACfTEJP34KxE+34/Yn689fc8BhTUhp7D5hCHp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SWM2A97Sn4Iorf1KXAmnnoy7NyHt042XqoJpqKzAUTn65r4W
	Az/kaFlKHfiFTSI/1dId3y/Z8+DYmqU2/RhnxZ9Ox4ZdJcScOppby31n
X-Gm-Gg: AR+sD10EG37ICZi0UN7TE95VXlco6zJkn9YhuhAecHNcbhZCmGqCfiFKOLpgtTA4C/v
	/TMsPpC6ogYELMIbFk0clkx1yqN/Kr/3813wH23Xx96NFlCD8hrpSCmOv8iuFwLmH5vqbidnv7o
	vmepreVhYOvv/G5MLT0vodRYSfpw5eSM07XfRWDvXw35tjmuxKg2MaNvQLs9Ip6YTlQcm0IqT+2
	0ywYP9BsdnrLK94IJHrcA+Fn1PlFDJN0yPREPdYIIfjAJiIHJg2LVN5Q00hKZn3lAkkUdB0wsuw
	dc9v3gKAUCVIm7g2kth/KqCKm+udtNlprvaTyBT5Kj3OS6OO+EB6ozIEkn/KTkYEqnb7A9eMHF6
	6XRJBPv1sMwr5Yypc0N1VyqhBoi9MRgWA5I3Nc3OF52YjfNym8qcIt7o9Qiim8RWM+6Yud9VpiV
	ULNF9uJZG4lMJwHOrJw0KQKk95O8NmBCo=
X-Received: by 2002:a05:6a00:988:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84e5925e2a3mr3164991b3a.0.1785043509591;
        Sat, 25 Jul 2026 22:25:09 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e530079f1sm1574772b3a.0.2026.07.25.22.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:25:08 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Team <linux-imx@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Frank Sae <frank.sae@motor-comm.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next] dt-bindings: net: fix spelling errors
Date: Sun, 26 Jul 2026 10:54:29 +0530
Message-ID: <20260726052429.16807-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors reported by codespell:

  encompases -> encompasses (stm32-dwmac, sti-dwmac, nxp,dwmac-imx)
  curren     -> current     (motorcomm,yt8xxx)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml | 4 ++--
 Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml    | 2 +-
 Documentation/devicetree/bindings/net/sti-dwmac.txt         | 2 +-
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
index 26688e2302ea..e8108cde0f59 100644
--- a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
+++ b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
@@ -59,7 +59,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
@@ -76,7 +76,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9..75c9820ee60b 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -72,7 +72,7 @@ properties:
           - description: the offset of the GPR register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the GPR register, and the offset of the GPR register.
+      encompasses the GPR register, and the offset of the GPR register.
 
   nvmem-cells: true
 
diff --git a/Documentation/devicetree/bindings/net/sti-dwmac.txt b/Documentation/devicetree/bindings/net/sti-dwmac.txt
index e16287c06e5e..6e7e77da49bc 100644
--- a/Documentation/devicetree/bindings/net/sti-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/sti-dwmac.txt
@@ -9,7 +9,7 @@ The device node has following properties.
 Required properties:
  - compatible	: "st,stih407-dwmac"
  - st,syscon : Should be phandle/offset pair. The phandle to the syscon node which
-   encompases the glue register, and the offset of the control register.
+   encompasses the glue register, and the offset of the control register.
  - st,gmac_en: this is to enable the gmac into a dedicated sysctl control
    register available on STiH407 SoC.
  - pinctrl-0: pin-control for all the MII mode supported.
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0d..fac882198a46 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -91,12 +91,12 @@ properties:
     items:
       - minItems: 2
         items:
-          - description: phandle to the syscon node which encompases the glue register
+          - description: phandle to the syscon node which encompasses the glue register
           - description: offset of the control register
           - description: field to set mask in register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the glue register, the offset of the control register and
+      encompasses the glue register, the offset of the control register and
       the mask to set bitfield in control register
 
   st,ext-phyclk:

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.43.0

