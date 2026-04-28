Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9538F638
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390597; cv=none; b=qaWX3oNE3f656w0LgQ4GGQT4V3c29RK3Bf7yDTtIlV0g2nUIoN+QSPPUjmfdfdF7QCiEVhp5u+jox7mKpydP+g+Ese2V5pAPqOP82mabMZ6L5XWyO+TcMqJgjaEdS4dKFT1WOht9+lruEr5Qus7XPY1huqWEOpPn/af8EmzeivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390597; c=relaxed/simple;
	bh=DS7IGgGnbIXdTV3Ckzjjp/VaA8K3sQmCMzuIXSeyGfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLei3ysh99X+s7f1YITWhe+jkKttFJSkDFMEXgzrGLedLCCR9VFTh+/6SUhb2cEb8ACWVKRQzA3C8ONBGLD5jnQRHYMBZGWEkmQuqZwe1ljfE8No9NMwwYT6MTBTCD2GWOwBXAY1IDFUBACoAUa0vRiNxsw4FqXgq5SO2BkHNo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtfWfNKP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtfWfNKP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so112643395e9.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390594; x=1777995394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ptl6Lh7lPIlpY98SxXugxOD9pHianxtP6o9VGnO134=;
        b=HtfWfNKP+FzEIYqUx0AKZvRh3pQbWZzYID3Fk6aRmF1ChVYFf650ZQF/myLrhUf3x4
         k2RiOmnG3G+1NiEn6gXaL+ILGh6IXxZJHhTth7NRHJMR68lH34tXhbG2KPT7UDZTGlw+
         PwpGBYPfr3/q2DLEe2f8D/kPuqbqZnuNa9gN+XdVtrZ87qMs8CVPvlMOdfesODx7Kgwq
         Nx0L+iMFbqOk4PUGo6JS0mXENafaMzVU8ngmN15368JbOHGPBuc6zkSS3scjOuMiwwpZ
         Xs514eCjJq3GLK+7SUwDFVBBrBEJaDb4sjeZAuM8IkiijZUuzktoitgVNnj+BQoIGgax
         d0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390594; x=1777995394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ptl6Lh7lPIlpY98SxXugxOD9pHianxtP6o9VGnO134=;
        b=D87XMSOb20BTNUof0wBTk1FSMyJpCFXToI0Ktb0Pf8x/w071+IMLn0BjQDnh5yD2JL
         fc0dmDtXccc6kkz3KKq2sdVNwktCDZxHUATLcpFIlWb/NmSDcR6hJDAqeUGmYRLSwBXk
         iA/EUCN1meAzjNS5WQqgFh2/RCAjcHzF/b5VeCWKy3qHx6MrW/1eIkOjTpzyV4UXFQdl
         H/cWFjOT/5QM9X27Dn3BGd5hKdd/DxWa1yAlskOJKVjmb75eHpowC7KMJtaBBz3rAh8V
         55XNCDEBEX9nVDBww3FHaCSHzWYUItiGYs/uj5T0IcyynDLmSStBPjrmKKDk3/+xTyap
         2v1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9s49E7l9UnZqpyfr/Z2IytjjLtSBuSlkynWGH0f25ujyljgHw9LhL5lCRuEmDUgWE7m160kWmiWcLr@vger.kernel.org
X-Gm-Message-State: AOJu0YxpODt4DiG/CQuXtjrX3AN2JIl4UM9Be2rDjhP6E7s/L9cCScws
	0PPe9l+Wu9+uNsNF3QGVn55guoe8oiFcE/Q8+MdbmB93Gn37ZZfF4p5A
X-Gm-Gg: AeBDiesX0O+F57Ji0vMJtmYK78LU/1EmvMxsZUbMz3C9OpOkFGaiRY2e+VohOskmWC4
	H13rG/x6VMaIU4sDwiEMPsyCEnE/S/493KaDfITpTnQf7nzdd7+w0MS0/PjApU7J1dlWsNrb6Il
	YsN7hNWs3IgNtD6HiqRS4WesSDz/6rPrz/Pzj9LFwSV0fmPomC822ZPRAWyHxvflNhMaio4r4ou
	fr4uzchnktbjURRLpL6v88BtQQWaBEA4UmV2bTrBaXoiygF36HY8xxg2653rmaiTBXHd8VSFMnz
	leEEpkdSGHC9FHIoXZKBvgI3g+Aw+oSTYLoEW8yMGfgP0JMYY2stD/Mms3NPephM7/UckhAPijb
	N2Zef1OE04p+/Eq1IyGajFgWq3FeFTsF5Yk6mQ8cJLa2wUjuXswYcbme/2e3oM8gqHAXgqfO7f5
	ARrC82CxURmsDHmiOaApPSwFo=
X-Received: by 2002:a05:600c:c109:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a77b179ebmr44911195e9.19.1777390593844;
        Tue, 28 Apr 2026 08:36:33 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 0/6 RESEND] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Tue, 28 Apr 2026 18:36:05 +0300
Message-ID: <20260428153611.142816-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial goal was only to add support for the CPCAP used in the Mot
Tegra20 board; however, since the documentation was already partially
converted, I decided to complete the conversion to schema too.

The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
from TXT to YAML while preserving the original structure. Mot board
compatibility was added to the regulator and core schema. Since these
were one-line patches, they were not separated into dedicated commits;
however, the commit message notes this for both cases.

Finally, the CPCAP MFD was slightly refactored to improve support for
multiple subcell compositions.

---
Changes in v2:
- fixed code style
- rtc conversion was picked, so patch dropped
- added audio ports description into mfd schema
- splitted schema conversion and compatible addition
- minor style improvements and typo fixes

Changes in v3:
- added regulator node names list into pattern
- filled spi_device_id with driver data
- ADC patches were picked, so changes dropped

Changes in v4:
- dropped regulator patches (applied)
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: leds-cpcap: convert to DT schema
  dt-bindings: input: cpcap-pwrbutton: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
  mfd: motorola-cpcap: diverge configuration per-board
  mfd: motorola-cpcap: add support for Mot CPCAP composition

 .../bindings/input/cpcap-pwrbutton.txt        |  20 -
 .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
 .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
 .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
 .../bindings/mfd/motorola,cpcap.yaml          | 419 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 151 ++++++-
 7 files changed, 626 insertions(+), 145 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0

