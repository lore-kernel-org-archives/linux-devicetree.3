Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A73B774B
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917354; cv=none; b=jq9MODXolSIH5Tb7mtUziL4e0xlmbNwYkEqntVSBl4n1DxJl/bo/xnvaR2TkfjyFEO8ZmjlyJkhpOTAJN07PzacT+Ey4w8Hw2Rr0TNWrHo0ubH/hmi0RRlGj0CpxH9vMjkowDnqfXn90WWqL6KyN6YL15Tzha0mvr3tflRWcjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917354; c=relaxed/simple;
	bh=wnvFaFSfPUHo5q23p4OvlwaDUECNLrAx79wkpH1U0R4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WsHDIBsmaSS7UWkkDetACukj0kTWsVLrvDJJbI9yMLUl7h7t9xgUTSsPuE/LtmxqdOiIpg/PvDk34NCDz2eXCpx+mUKai1Nh9JWbIf63g2c52lsXmkDI9RYT20hsAjOsH287dKbZanhAmdxz1GbVAEcWdUD90DGHUNNMaY9JcwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zm3qTb1d; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zm3qTb1d"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38fe113c792so237934a91.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786917353; x=1787522153; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B1WpV1mK/ZfAGKlbOl9xD+Zq1+n16HpY+NcEojw2DPk=;
        b=Zm3qTb1dkGSfrrhTqbzTirQhAuZLPO2Sq0O/Netq6Ip1fWNQgufH6RzMaC3o/Nwual
         Nm6o1KSlj1HCXaAYcObROsSk20toOGYVyh2iCKiweYhD84ZkkGdlIfA0fRufJhTG9d1i
         NETyi6Tkf3az8ryo1jxKVyGd0YLgXVpPmoJnxJFZKqSwT60Gq5OpRGCsq6kfhdhtsXeK
         ILO22AczmQ9txXQgZv+fevlneVfjQ7CCv5coVj3mn5M1KBkE6dAa1wSkgYBUeeS3SeQd
         TU1RLvQL8vh7sCVo8/ARsQOcKntAh+SjBo4WfJIgHJgQSAmIVcCWa3efdmHqeWhIG75s
         jmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786917353; x=1787522153;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B1WpV1mK/ZfAGKlbOl9xD+Zq1+n16HpY+NcEojw2DPk=;
        b=q2yRhxMaFh3JVckCglCk09k+34HPS+XPj0tfxXFJUagbtKG/m3GJuu86YZD961HKen
         vVnx4Iq8t8YDFbyAc4zfXkgPHtK8lQu5V41aDE7iYeZ0DN/2PKBFVOPe0b4boGerqhnk
         8m3u4fK8EJpzY00ZBnKmQ0s1H4cD4WZ/EuadSQ2+TC9c9TlpxBEnBo82FgXX94Fl5GwN
         ITwQFgXVAxiwGyusoSglnwDW/EHUbrvg1/faEPiu18kHk85X8KrDC8zX6d1wptZA1Kk3
         BdbMvpZ36s1fvGZuE+6dvc9Ps96dvipSll7TEopKXm3cwdAPz7ixKEXIbIdMssF/aPDp
         cFeg==
X-Forwarded-Encrypted: i=1; AHgh+RoG4MEqa94JXUR7xs3fp8KKkknI1thprZHSw76WJip6Xfohe2Y6uuDJMAXIL6oc9UwB1iDl/il8sBXX@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5ykz7Rzv+djOewqGS4LaZoGlV7wT6qPETgdlKXXYZDKNhhnO
	xBQeG+IgC0HRMESsBi4nc94g6qEPJ6Oak77zVUjwasFP4gsFCgsdi4+C
X-Gm-Gg: AR+sD13D+UsF0u6OxElh6SNhDMIkGPrRoj+avbQHXtCrwtYoKizDDHQrRttKnED08JL
	DptlJu089F8xL2dHoVzNPYT09MEm4pppRlCdqtnuDxR6kvg9sWB/i8Bs4IFT19eZmFegBFh44jD
	JclbBvKCEKQ3LLraEJAvyCZ+a3gZ0E0ZDn0wDOsdoBCHaLt7syn/By80OdAYhbVsVRe4LwH4iAH
	x6gDKTJJAEQcla+wVAYP3v1/l2xcFHeDSi0p+7abnj/5/K4LYbzKbaPvw6rEtp0p1YIfNPqyfky
	OFqENjzqUs9UM1/yKWEfX3c8qhSMz8Szzdy00Ouic2eQX0FzCL8InQCs9kJ6wKfPwpEDxI3qFmY
	3bGLzWPEJefUP0J2E2gbRkwGo/f78xJrbB1F83YfWjKY0KDTfq82cyY5hwYgBMCbYqtNPX9FU7e
	n/POgcMh9dszsMOERTVjiytuRgmG1SWi9mWSHTlWua2MZtVMD8wTnGDx06iiwdj2EGKtiJPHxeR
	w==
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2d3b04fdcb2mr164306085ad.0.1786917352596;
        Sun, 16 Aug 2026 14:55:52 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504e:1c5e:cbdf:b953:2369:869e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm30168318eec.10.2026.08.16.14.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 14:55:52 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] spi: davinci: Convert bindings to DT schema and
 clean up DTS
Date: Mon, 17 Aug 2026 03:25:24 +0530
Message-Id: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Myw6CMBBFf4V0bQ0dYSCu/A/joo8pTCKPtKTRE
 P7dwsqN5q7OTc5ZRaTAFMW1WEWgxJGnMcPlVAjb67EjyS6zgBKwbBXKhaXTiUfLMs4sCSvKaw0
 aFFmaA3l+HcH7I3PPcZnC++gntb8/U0nJUurG143zrgaEWzdofp7tNIg9leC/DllHi75WjaoAz
 Le+bdsHebSGPusAAAA=
X-Change-ID: 20260816-ti-davinci-spi-e64e4e48b6b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786917340; l=1857;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=wnvFaFSfPUHo5q23p4OvlwaDUECNLrAx79wkpH1U0R4=;
 b=oDGmhQUVyB+xUum7xYfs20IrjfgZaGulpadBS1m4rxfHPkdNrIypL0etLP+GhRaE/1kbq52+W
 kskeKebO4qwAsGUdkeYMD0LT0v+7X4qpKYHUOo9CuNVWeu+IeVp3qUV
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 renames property ti,davinci-spi-num-cs from keystone-k2l.dtsi,
  as the driver uses the standard num-cs property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- patch 2: since old text binding required num-cs, #address-cells, and
  #size-cells mark them as required
- patch 2: davinci-spi don't work as spi-slave i.e address-cells 0 is
  not applicable and spi-controller permits both 0 and 1 so explicitely
  define #address-cells as 1
- Link to v2: https://lore.kernel.org/r/20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com

Changes in v2:

- patch 1: Instead of deleting ti,davinci-spi-num-cs, renamed it to
  num-cs to properly preserve the hardware's intended chip select
  limits 
- patch 2: Removed  maximum: 6 constraint from num-cs.
- patch 2: Add standalone support for ti,dm6441-spi in compatibles.
- Link to v1: https://lore.kernel.org/r/20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Rename ti,davinci-spi-num-cs to num-cs
      dt-bindings: spi: ti,davinci-spi: convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 124 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   6 +-
 5 files changed, 153 insertions(+), 103 deletions(-)
---
base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav

