Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811C4772AD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863146; cv=none; b=DxPYYfgaU7tv1VggDIKVZi+HvO09sdqOX0/ytfXfaOABXHAldV5qfMpwMqDMLZWJjhP72wwocuIYcPKRMwHcKdfHtgwxRVc+SqAdECg1ZLcmNLG+92W03rkDW0MInCdKtThcnCXPFH6ldaIhtHdWvJG0gFwJA/ki0iRhrSheDt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863146; c=relaxed/simple;
	bh=8kH0v4EY1+V0uC/XCxc3/uULykLVjwJ4NhwH7d2a3zU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dR+t6zgG96gblp922f/QZfPQuIVO80kQfY7WqiXPXsQEolhmWBticsqwuDItUILuNZ0TCrwTm2D5L4kpRFRrdOQeMCf1nG5V1HgZxNFr0j+FS4CXO//j2/cAesKJEIZgh687zvp0aSTyQli+YlCucAxCG4DXFRQmTOEPP6DKRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njWKvoUM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njWKvoUM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso10763a91.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863134; x=1786467934; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wdaZH6sZSl7x8gFpYZG7pA3PhVsKMCe0NLG1hoYhSFE=;
        b=njWKvoUMQp4phCtVxltvSjSpxjGh1JhliEZjLUMbeRiodXIvozUwxYQ39O43G83Y93
         B64XhQrNGwsOeSBzEKE1PQzDA0B0nj0V5DTFoPZMvmey8TJvRYRDTPR3B8Ja0Xv9kBOD
         R7GCnp8v4gOm0ktRhgOHssz3PVwiAa5Q8tIG4As+p8PYmdLHVb8DFyq416VxADNl4PCR
         dCsT24SHxIJhY7Pd10o1z47Ahpj/efRIYI74NX61NHpUparYWdsjjcNSNoVHkufWUXqm
         an+B0KHMBrchTdmhh5aoOWzk/ZW+z+qJWyzrNvjMXwk0Ge+CV2TNUoI48NuhSH8sVlRx
         pKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863134; x=1786467934;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wdaZH6sZSl7x8gFpYZG7pA3PhVsKMCe0NLG1hoYhSFE=;
        b=fJX7oSOExzvh30USHod7DROyshHatOambeitStglTEFB+AXrMHzS8r0/kjfLh9okCy
         Wkth57/9XhXDEy1qj1yWLsax9HLT9sp52G8z2une+Vq6SmDKFzva4LTn3zQ7hZ9bLn8c
         yB3h0Dlf5QTgUdQpBkNZ1kB2r4MydrI1x/bvizz6tSr1RDxJgSO/gAsxFZsKUJh8OcCP
         c7ZibpCD1kIx3CnibhktqP8QcO0hz5vH4JF48jpQM90xShXdLrRo4HajHv0KdWLCwh1t
         k5U0OBOc94JtuMiwdDz/awuSPl5CxWDC2xduNE61NvedYw2Vxx0VA4F0hSAmFrrSb5Xq
         Boxg==
X-Forwarded-Encrypted: i=1; AHgh+RqLL3RshAKL5P3EIMPNxy4/9svCQYAyt1L5eSRh+aLoeCcIs3gLV4dRPV9jDHZuNC84wCPaD0VlZ4mb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kKI/b86WbsUngOaGdJRABnM9mUzicU/YJgKK9ZsnazZFydvD
	wclvehn/aFtZyEvH6XxrXV6CYIyBUO3oIc42abK9dOP81uOGj4UjZ/9M
X-Gm-Gg: AR+sD12DcSjpD/2KiqpXWtTMEDbjPl/2WH3SPTq/MP9lW8I3OcfGU2w6Pcq4ZdYQZWe
	QahMYqDyMxp8vpxdu0WZEcOINWIahmFjYSlONVE3Ntu7PEV7g1DOyFe39SpJRrG1MpkhESeW7/T
	IupGAFMKhmHHR68NdtJcBlTheom4IsILxnrnfLzUWi6hZ4AZsvjhh5aHxRt7R/tzw4EnR6DF8jE
	Jy6j+23exhzRCjsM5+ikwQbNgSSDLONr+IW997zAAekFsl1lbFXrOTAFIlhQd6Tf2DMb/QF99Ut
	+GTKlihDmS31lFw/snbo7XL2hUtLJUJCgpUfnVdQAyYNTdl6Sxwfbscj4hlTulFL+GMXzoNr5AB
	dnE1pxmaG3Zj/g73PDQEs5BjjMnW3ww0e1EQnyWxmh3UaiFDOWb654abuX6oBSCwOAW0hjOG6zA
	f3et8XRzhIUkg0Bc+CbZjV10NCHu1ppTnQSuNzYtx4JzYzR2yvWk43YzwwWE3dvFUvatp90CtI2
	3NTET9v/g==
X-Received: by 2002:a17:90b:3a81:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-3903c541ec7mr513338a91.1.1785863133977;
        Tue, 04 Aug 2026 10:05:33 -0700 (PDT)
Received: from [10.15.72.252] ([2409:40c2:5423:e712:2aaf:ae79:67c5:476d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5147124c88.4.2026.08.04.10.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:05:33 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/4] dt-bindings: rtc: ti,omap-rtc: Convert to DT schema
 and cleanups
Date: Tue, 04 Aug 2026 22:35:04 +0530
Message-Id: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NTQ7CIBgFr2JYi2lBfnTlPYwLSj9ajC0NINE0v
 btQNzVxOcmbeTMK4C0EdN7NyEOywboxA93vkO7V2AG2bWZEKsIrQY44WuwGNWEfNeaKaSalBAE
 UZWPyYOxrrV1vXw7P5g46lkRZ9DZE59/rXarL7n851bjCxoARUjKqW37pBmUfB+0GVMqJbF326
 5Ls1tQIzrQ68YZu3WVZPsnw49z0AAAA
X-Change-ID: 20260724-ti-omap-rtc-6a5c5888e7e3
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785863118; l=2104;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=8kH0v4EY1+V0uC/XCxc3/uULykLVjwJ4NhwH7d2a3zU=;
 b=HnJL/XnW/6NkuaO/EgCNDx/IFNqlO8YdytBEhUwR8bjalB7rN69aVFvFUhyHmM3UGVffrdUQw
 uj43oP1lDtqDYvIB26RgCeUje0anZ5O2DQD2BDVOOgo8b7JMZx2WQyY
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the Texas Instruments OMAP Real Time Clock (RTC) 
binding from the legacy format to dt-schema.

The am3352-rtc is compatible with the da830-trc. Update the compatible
string to include the ti,da830-rtc fallback 

Two legacy, undocumented properties were discovered in the upstream
device trees:
 - 'ext-clk-src' in am57xx-idk-common.dtsi
 - 'ti,no-init' in am335x-shc.dts
Both properties are completely unhandled by the rtc-omap driver. Patches
1 and 2 remove them from the device trees. Patch 3 then introduces the
new YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- fixed dts where only am3352-rtc was used without da830-rtc
- fixed compatible where am3352 is only compatible with da830
- simplified clock-output-names property and pins property
- Link to v2: https://lore.kernel.org/r/20260725-ti-omap-rtc-v2-0-13f765ca96b3@gmail.com

Changes in v2:
- Patch 1: unchanged
- Patch 2: unchanged
- Patch 3: Removed left out legacy text binding and Added constraint
  block restricting 'system-power-controller' and 'ext-wakeup' subnodes
  strictly to hardware variants that support PMIC mode
- Link to v1: https://lore.kernel.org/r/20260724-ti-omap-rtc-v1-0-ffef78853cd6@gmail.com

---
Bhargav Joshi (4):
      ARM: dts: ti: am57xx-idk-common: Remove unused ext-clk-src property
      ARM: dts: ti: am335x-shc: Remove unused ti,no-init property
      ARM: dts: omap: dra7: add da830 fallback to am3352 rtc compatible string
      dt-bindings: rtc: ti,omap-rtc: Convert to DT schema

 Documentation/devicetree/bindings/rtc/rtc-omap.txt |  53 --------
 .../devicetree/bindings/rtc/ti,omap-rtc.yaml       | 140 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   4 -
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi   |   1 -
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |   2 +-
 5 files changed, 141 insertions(+), 59 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-ti-omap-rtc-6a5c5888e7e3

Best regards,
-- 
Bhargav

