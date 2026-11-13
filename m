Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567089;
	b=xv8hptOJkW21sNs0zIwMXRovB2j7tw++amK8bSorJ58QRGHRxYu6NA9wnnBBHtnnLjIV
	 fdYDiMRKgmtQdRzvhaYqmaWgJIzOEv0kEI7mkZ/G4sCxBboeLya7SPgYueCxZJLyZcnlr
	 Gz/qg224vpXKFOw3T6x+XHPeE+qcCXptSqi0JxIcVOhSepKtAA+nIBQsk2HC5t7ygkQf3
	 lOSj1Xy9T+G9bug83xZQkTAl+1kF/uaN/E7lUXwSBxnAFJbEgBtpRq4/A/PV1pwsnizQ3
	 GSj/CeVIZqKNLtR3e6VpIlnlxKayB+Gz6p6EJoLeGdit1+DShRna5N1/RhViYIJ7xtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567089;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Type:References:From:Subject:
	 Date:X-Mailer:Content-Transfer-Encoding:Received:To:Mime-Version:
	 Message-Id:X-Lms-Return-Path:In-Reply-To:X-Original-From;
	bh=UtQIaEnaYQpscdnv8kS89CFZoPvgwXTwxpgQLK+sMwE=;
	b=sVUn16R3aDOgV8fBsOC2/z5R29+fCaGEEZYJdMZkQkMtwWjDcWqPex7BySWMzlPL0MAu
	 DZmKIL9HOhWh5UQgKIQLL0nXQa+hMvcNiW9LVR+2qodACtfNTrpfhzL+0ukbWosQXQoeL
	 FuzjvbSa/NVqtpp4OKQbyBlcnd4vYEVYNF4gnG0Q6oS5jekGD73G1waraG9CTTDsk1pEx
	 SrfREw8ThD14pku1szSqVxgCGDw/dD/VUxV3yKLGPBmx/aarqBW9MI9ucxvsi9wrN2WKC
	 9AQbZ5oHdVdB7Fjzl2IUMNmb+r7AyJ4QXZcETEiN3Tf1bElG6Wfu7zCKqr6k6AazTsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=SxmB8GaL;
	arc=none smtp.remote-ip=209.127.231.19
Received: from va-2-19.ptr.blmpb.com (va-2-19.ptr.blmpb.com [209.127.231.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B86F606A8B4
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B86F606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=SxmB8GaL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567085;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UtQIaEnaYQpscdnv8kS89CFZoPvgwXTwxpgQLK+sMwE=;
 b=SxmB8GaLOm/Tkb8sg8s0HyGJMzT+UmItPXgDYn11Z6ZK5LbJhPK9KKMhjDynRUd+cLsha6
 LHpTcX+5LVpNCtb+ZRE5vc1Lsg8Sr1seI4DR4t3626PKKM6dHHaHjQ6E0+cc3kWnV77pSs
 2p9/Sq5MW8J9p4yrpHS2uWAa2esumZ/2/EL1z7Y0TxgIyC2JLJ1xDdb2es69AXvfT2c4BI
 i11q1hbXF3QPjmNt+7jWx4ONWQX+DMStUM4Z4fL+bHy8hx3fNbQOfiKDRPMWSSfUTdodhm
 I5eT3odPu29PBraXiS10b3+nG5BPhN1QEtdw8JSzIgLShCav8FsY5dmCeCx/LA==
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 1/8] dt-bindings: watchdog: loongson,ls1x-wdt: Add compatible for Loongson-7A
Date: Fri, 13 Nov 2026 18:51:08 +0800
X-Mailer: b4 0.17-dev-ce4c1
Content-Transfer-Encoding: 7bit
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:18 +0800
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-Id: <20261113-mips-ls7a-wdt-v2-1-e8abd6b2f77c@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6eba7+92ad88+vger.kernel.org+rongrong@oss.cipunited.com>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add "loongson,ls7a-wdt" compatible.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 .../devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
index 50a9b468c4a3..dbfe9795c835 100644
--- a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
@@ -14,10 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - loongson,ls1b-wdt
-      - loongson,ls1c-wdt
-      - loongson,ls2k0300-wdt
+    oneOf:
+      - enum:
+          - loongson,ls1b-wdt
+          - loongson,ls1c-wdt
+          - loongson,ls2k0300-wdt
+      - items:
+          - enum:
+              - loongson,ls7a-wdt
+          - const: loongson,ls2k0300-wdt
 
   reg:
     maxItems: 1

-- 
2.55.0
