Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509663;
	b=S4KTZrYl9RH161izvMDhw87DNNR8KWccoD659s80r8F7vvr3tRL7QDfzyh8kd39rufME
	 D/9s/L5OH+cdZBtpRPYJbO8AL+cYB8GSSlKeDtUd+K17hLDGuUVuzboAF8i5HlumlrdSa
	 cbSffc8p74Jmmoz7Cl58GuBJYGCjcjA12odp2CEKAKuySGBxZ9fMNn8k2udZS5edLHxpO
	 34QxMp0KPdwzxxAXuyN6smRp2tdIgHxDJYYL4vOiL2EO2vMVL7B2Poxttw5scm4opX1t9
	 WoGu0UaZjVxCuqSEVlZcmExNpA03m2c5L19vvGrd/10vqMGJmr5jedghDncbY00hKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3ksQPpb5I3Ui8OqbNiTyCubhOS+YyEiX+ICtyoaWFTo=;
	b=SOPkkBWHWv/PEy4noxAzw5bHA4PxarFSV/XK5KLTjIoXhVpadHAF1Jz2bznKDr7QE8/k
	 SZmC6zXlKBAkjLQgkIQq+PUvf0g/fQ/akgmmY5mRAguhD2dQw40Jha4VnZoqdLQzJjb9P
	 C8W9Wr34UqaKItleqWEM5m/qGGDyzpP7ddmZlWHjOY/ONxo5TII6S083XUA6JdMBKFKm1
	 TfhRAsO2omrgEW9Gs45iwrvTEVWs9DLCfxIi7lAhDL+xfIwPExjlBnsyX/TyFR0gfcmSM
	 Mcl0cQSOXwf//LfCWPXzSLs9WQUsdh9utqURAV/bn3U8ZDkzuZKpFCKqZ8d1GvrFqfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0Lu2t8P;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09483606A335
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09483606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0Lu2t8P
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35159e0092aso22138eec.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509662; x=1795114462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ksQPpb5I3Ui8OqbNiTyCubhOS+YyEiX+ICtyoaWFTo=;
        b=o0Lu2t8PRdrGEu43HFCEuBvfdTjYnsfi5chCB0t1N/sUGAWEaIlNA7xz48zRiTnoiN
         0oBQuo5ZdLSDOSxWLKVgl1uMGtQEvr9ZamCwC9zakZaei8DzeOJVaBYFYJAJUcyUGh5m
         9bw2weQ9STf9HJ4PtcPSAvOK7Se8HAqMAWtnR2A9xokrNcH6YCR0SDS882Kn1KBKeIq8
         oAOeMs+WG2NdjHXEREWAwmDOgM7otYhD1UhqrE+w/g09kXpAIDE4SFuWslS1ZQhbQETo
         vdtwHzFzac71dIBYG2UxcsSF9UL0MkANW7P7hqGC5COyZLj+gf6B9lkZHpvaeKhkD1X7
         LDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509662; x=1795114462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ksQPpb5I3Ui8OqbNiTyCubhOS+YyEiX+ICtyoaWFTo=;
        b=SxSVQwMaUn+FX8jsF1pMbN/gmJHlInuzqHFa5cvo3cNEOzrBp4aw2krj5AxrhdMZdg
         RL8clWQgzOyLKPzNetSG2C2lxKqzBEm2rC29LljTPThfykWt3xyuMsBY9/JWl7BlWm6X
         O08e+fJZYJCXjCMEWus9qGt9rfMS6VEPCbrLMVccgdC7LPCJe0Sps/AoHhoLynRo7g0q
         7ev6QHV2K8oFQ82o9ULsP+XzHfKLbvO5KKqu5buX536YaMlhb9dJvKbN3eCRAxGptyU1
         D+xNTAEYMrbqSYsW4cyBOLeEU1/iIz2XOzRIWkbyE33Yi3uKvgXe6NrUdqzNR1TEAaOm
         eIuw==
X-Gm-Message-State: APuU4Z+hqJpYhwcE7Lq2A3jv74mZu8/GoGb/NM3p5x2fIPG10SLqv9V6
	Llq6jNrji/c6TJOcTRrnTmOiBY+2zVZx8ODijRl49l39Li2710aMkX9Y
X-Gm-Gg: AYBFou1ntqnOkCJlGgh1bjTK1wMBDk7tSh5R+KODQZb/mqms7qcl+5pLCjMx28FFyf9
	xTQqUr5oA9CPl+lYH/QFSrmTuXreUYhceWzQ1ev5UY9uiVgQGakZoxqVwuJvMT9uKgdKEWhy3KP
	Ve1Zoncj+Mu4bjXR19uWSW6pj5Z8zDwg3VdpPF4+BujH78q9lkfdc8xwfF190+qeVHtHeuoer/u
	XYnrjbKpUDkf9kzGl5i3eiQhFWh2kljHCeW7dScglV46q/cuEDBzkzdk1B2/t4QOnLseOV5vzbY
	LOcAAlZFY1BrDPCryRc7dhPUJYLRpcevXit7nIbGtRxA/yPhTf0hfCJIfQK/ppUKtQ3X7nMY6Iw
	X9CnQbCxzOwlrUo9DXP27tthk+VWvIPkHGs2T7qVvdzfnMvdf6+QAYr9XmXEmVJMlpnxEllX2RO
	+cxl0tI2dom1jqX/PrnxwFyJ/BliQ4fi++JvC0ZXMogp/QP23eGFl7U3aP5ZsfGSfi8cqh7XcMu
	RlQFtGUZhCBGcHbXX2jZtvRN3y8nVwJfXjk0mrz7SYgY6pYsl+cupG54iYfPQS4usMLY7+A9kR2
	XRGCrTNFTv5FiieJFtbnzTz2kywNZAW1CPh3l0g=
X-Received: by 2002:a05:693c:20cd:10b0:36a:13fd:b5c with SMTP id 5a478bee46e88-379652f16f8mr90294eec.2.1794509661967;
        Thu, 12 Nov 2026 10:54:21 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:21 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/3] dt-bindings: bus: omap-l3: Convert to DT schema
Date: Fri, 13 Nov 2026 00:24:01 +0530
Message-Id: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12PzQ7CIBAGX6Xh7BoWWgVPvofxQCm0mP4YqETT9
 N1ta4zE45fMzGYnEox3JpBTNhFvogtu6JeR7zKiG9XXBly1bMIoOyClDEYHLYd+0MBEZbUSaCt
 dkIW/e2Pdc2tdrp8dHuXN6HENrETjwjj413Ys4sp9uzzpRgQEWVYotNKcG3muO+XavR46snYj+
 5lIZWoyoFBQaUQuCoWW/5s8MTH9JfLFPDKBJSorKKepOc/zG1en+sgoAQAA
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=1819;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Rfz3AU58vxTc0tRAB6XfZV8jzqodhH8HcHaxAQ5sFNw=;
 b=SZUDB7MSIZuV3kYi7Cnk2UvzPGPe5ChAyhkhZW8DnM8CYOcsnIWfQ1ftwQmPZtUWQzz33N/kW
 hL0zfmU5jC+A+y9VQdCnbhTiimYvZ9IwkTC+jofHc3Jip0jJHEfo/pQ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI OMAP L3 binding from text to DT schema.

The text binding grouped OMAP3 (SMX IP) and OMAP4+ (Arteris NoC IP)
together. split into two schemas because OMAP3 (SMX) and OMAP4+ (Arteris
NoC) are different hardware IPs.

- patch 1 adds a missing unit address to the ABB regulator node in the
  OMAP36xx devicetree to fix a validation warning. 
- patch 2 converts OMAP3 L3 SMX interconnect.
- patch 3 converts the OMAP4+ L3 NoC interconnect.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Fix SMX example node.
- Link to v3: https://lore.kernel.org/r/20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com

Changes in v3:
- Split bidning into two SMX and NOC variants.
- Fix reg maxItems to 2 for ti,dra7-l3-noc L3_MAIN_2 is a submodule of
  L3_MAIN_1.
- Link to v2: https://lore.kernel.org/r/20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com

Changes in v2:
- Move binding to bindings/bus/
- Rebase to latest mainline rc
- Add unit address to regulator-abb-mpu node
- Link to v1: https://lore.kernel.org/r/20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com

---
Bhargav Joshi (3):
      ARM: dts: omap36xx: Add unit address to ABB regulator node
      dt-bindings: bus: ti,omap3-l3-smx: Convert to DT schema
      dt-bindings: bus: ti,omap-l3-noc: Convert to DT schema

 .../devicetree/bindings/arm/omap/l3-noc.txt        | 23 -------
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 71 ++++++++++++++++++++++
 .../devicetree/bindings/bus/ti,omap3-l3-smx.yaml   | 68 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |  2 +-
 4 files changed, 140 insertions(+), 24 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
--  
Bhargav

