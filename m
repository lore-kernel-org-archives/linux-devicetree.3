Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868002;
	b=P/nzUqinPQnng+ESILQ1CnoVjUZTJaiNSMX3ZwhrWMZtMtwujRND/koQ2N2jamx6tPcm
	 PFFH8a2YbQX6yMhmOjWInQ3nxujNh8MzPMcaiugLU++6bbcPdDB5FrAX81fk0cywS0W0M
	 pP4eCIc+WRr6udSN5nIOw24co/5UM6uNsl/xth/knbepEm1MIrbjAqeXS5ALaYmKpm1Zr
	 hpzfHxtbxdtlR31FKKS23ZQa5Ww8HZq7KEkr96SpMondGQPiA0wxw4kJsm+c9GMXGFthm
	 PmWnrV4lHR9LzOa9Y/HSaMEvy0Mmr+lXm0homs5mCIhquAALl5gFuFivsqIj1ydUgeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
	b=Bjd9gJKcmw3uAM72bys66G9frvDTWX/fEXG9qfNXNHpsTn/06n835Ne30w0m/SJs9+c3
	 0/zF6JxXbRp6hwY2JXuyIbfpYA0hYUEBe1Wh306oM0y2vz79PPqsy97+1p4PImFxTfgSE
	 ZFzcBGRJzzze88NCmVTg/FF9MIgIOykJJuDQ4XJbMzWyvQkSTi5Ry8CKJ7wWhuPCmIfiR
	 Tr6f4dWQULqBNm7Z6mH6mN8xQXhXBz7NexDJgtDlB9y3jW0kYWmSdSrQwoM7EVA0z1PVq
	 gMSOZcB38zYe2RQ3IvCAGMXPpVD7itkqeFxan4pEWnlZ0NmCDGAe2E21mWcBfh0D7lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D549B606A8BD
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D549B606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2202602a91.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867996; x=1795472796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=Yitb/Mcg4ZyWcdtqMJY5Fgxd0hWJr5UHaW3s9RbAPWKRza7zCqOqwSXH3XNnYPeNVK
         rvAeqXTV2Cy0lmIxbYY1iRioyMvYlYsWf3pops4dzl4yUtK3BgMogoHT8P8XrJBVMLYA
         S2UHcwCYjrFGpGc5hq42mrtYmu/cpJKm0HkqKwOaxc5ksW7k18t7NAMapmIyMXAHRP4a
         XVvy2/n5w7SYD74M5/ZrFhsaouBGWI9Lme6rNgUH+tmpYdJakhKz+Fq4VjVKdHbmcs1w
         fD/HjABb8OOwHV7bHD7TBkm8M5skFRFucq64hUt8PHdoLcgqMxBmMh/tfvZ6UD++OmwT
         /rng==
X-Forwarded-Encrypted: i=1; AL+hErGsS9oG7jWRm8ZamIw9TAUP8ll5s4a/xjhiyh/zecnwjrTqx3vGLC09Au4Cwu7RBLDQV/pfzjUSgnvt@vger.kernel.org
X-Gm-Message-State: APuU4Z8unPLWBNpT6+AtBOGR9Eao1I6WEm7ViCZv572aNaO6e+8L3pkE
	2OxilsCp7KoAiENqxAcQbnJj100Y2Xzw6ZtIthTGlwCdCG3Cmv6JVYLCsBux6ihEGJXAoB2zssG
	YBGhyyjH0FM4SNbT9NaC6oqcygVjGB40a/143/zSio1nmmamIqTBpTnIaMspHDLFKcSXUdPoJxM
	mtLCYN1Lk4WF6ZxwuSm5jmSJ9nO9WXnzPHefE0jYILw6l/ostQtJLUDkmfCg/DXVkbXLryitw61
	ehNlpZPISnDxxFqwvfrDA==
X-Gm-Gg: AZFdTZfu8GaxVCTc+rJzOTtgbZ7svj0Ec7lkvy+K/tjDtnGNY0o466U3NNjc5BLx6V3
	pWjOJQGCQnjgUqIhEnS6xvq8Mhc9eRordX2hyvHVZXm9RdTJ+I/jwlm/Go0evTidFkBn33cyOOR
	55N2GlOaIgOincuMA7wJKQFVOHL3Jalz2/q7U6mY+3gvPAnkVjFcGJOJFQYa9Sapcd2HBVKxuVY
	CwV5uc8IXBIkEzLNAemi9N0mN/eXl0s7oNrZiygJfAGSxICSGGugk/92GAv13fsHZvGt1PbjSua
	FIWNnSQP4qIkts5q/4R8HVHX1yrWYRUHvgtnjCkznbZiyJnPk8NM5eff94sJEkE/rxK1j37NyNG
	a1Ff31bwERlzmAFZR2VsXmGgeMkIfWqEEXB8dwTksuS5U6IwrjEb+4CTn0Uiy5sPTwNt8WPy8en
	QgDT52dX/W2V3jx/UMYOvq6zLvZO0yZeRu2k4IPQcD
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b1b0b83494mr12336973a91.47.1794867996047;
        Mon, 16 Nov 2026 14:26:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb97be4sm482930a91.1.2026.11.16.14.26.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so2242669eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867993; x=1795472793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=Zc89SeilmA8pkJTOitA3tWQx2H35lHyqkp7mwjmsa+LSMkFk9eXsnruIPJqWvTd5qY
         HHlAIzlV33N9McClLBxdYzPJMqI584oQ5YCAyymIYRrIOPP2ZkPbut0lFgM+wgknNiYn
         ootihCUiItqsD6KhtRguTInxgVRlV6FdR7njs=
X-Forwarded-Encrypted: i=1; AL+hErHHm/GZR2QCYy9r8g+HtJVKadZvJK6Iee6jI1aroC3M91R5GQILaVhD+TclGHd4h78d0ClN3c84NaNU@vger.kernel.org
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195203eec.22.1794867992563;
        Mon, 16 Nov 2026 14:26:32 -0800 (PST)
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195151eec.22.1794867991619;
        Mon, 16 Nov 2026 14:26:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 4/9] dt-bindings: net: describe the Northstar flow accelerator
Date: Mon, 16 Nov 2026 14:25:14 -0800
Message-ID: <20261116222519.1416501-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the BCM4708/BCM53011/BCM53012 accelerator register resource and
the GMAC2 consumer phandle. The accelerator is inline on switch CPU port
8; GMAC0 and GMAC1 bypass it. Document the additional port-5/GMAC0 CPU
connection for exceptions that cannot safely traverse the inline lookup.
Keep existing boards unchanged unless their topology explicitly opts in.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/net/brcm,bcm4708-fa.yaml         | 45 +++++++++++++++++++
 .../bindings/net/brcm,bcm5301x-gmac.yaml      | 27 +++++++++++
 MAINTAINERS                                   |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
new file mode 100644
index 000000000000..f744b23433c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm4708-fa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCM4708 and BCM5301X flow accelerator
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  The flow accelerator is inline between GMAC2 and switch port 8 (IMP0).
+  GMAC0 and GMAC1 bypass it. The GMAC2 BCMA Ethernet node references this
+  register block through a brcm,flow-accelerator phandle. Miss packets carry
+  a prepended accelerator descriptor in place of the embedded switch tag.
+
+  Switch port 5 (IMP5), connected to GMAC0, provides a second CPU path for
+  exceptions that must bypass the accelerator, including TCP control,
+  low-TTL and oversized packets. Describe that CPU port with an ethernet
+  phandle to GMAC0 and an internal, 1 Gbps full-duplex fixed link in the
+  switch's ports node. Port 8 remains the data connection to GMAC2.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm4708-fa
+      - brcm,bcm53011-fa
+      - brcm,bcm53012-fa
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    flow-accelerator@18027c00 {
+        compatible = "brcm,bcm53011-fa";
+        reg = <0x18027c00 0xc0>;
+    };
diff --git a/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
new file mode 100644
index 000000000000..76fbe2abf515
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm5301x-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCMA GMAC flow accelerator connection
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  BCMA enumerates the Northstar GMACs. This binding describes the optional
+  inline flow accelerator connection on GMAC2, connected to switch IMP0.
+
+select:
+  required:
+    - brcm,flow-accelerator
+
+properties:
+  brcm,flow-accelerator:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the BCM4708, BCM53011 or BCM53012 inline flow accelerator.
+      Only GMAC2 (BCMA Ethernet core unit 2) has this connection.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 56212dbc9a0d..dce9a88f4aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5669,6 +5669,8 @@ R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/brcm,amac.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
-- 
2.53.0

