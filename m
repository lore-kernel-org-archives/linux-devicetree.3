Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C22857F0
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150189; cv=none; b=LRfYSZadZZGiFP8xalKbHmIQMhLc8G4jcyIHRNy2IoGBD9voImvRXpTBPn8fiowD7WfSsas6AIXFnp3OqZeIYW5WhBj2D06K8iCb50aMtz3KBCom/BB0x8LdY1NpvUOkCFuGKqLHpzbUVVAu0XpY6tykxyN0bqujIwUxmfw3BH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150189; c=relaxed/simple;
	bh=z3m6fox0VDL5+p4WGInn9Me43qPCmqPICFvZd8M5Azk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLVC0O3AGO6vw/kAaYI6c4NN0IbxbjDkLjCWV3GzLXzPxdQ4F2OXrraIgUhk4zU6kT3CmluUf/PF2fugJxLUWpZYy+bfJO2sKvf4vDHcikbLJVkdxr4/emxHTZhzmkgcvdF+h85tChklh7ZjJAItr5Y8h1EBfNpXHZnK25cyUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gsrE5JKX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gsrE5JKX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so11388205e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150185; x=1787754985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5yTeyQ1vVAKMn0PJztOwFpeHkqkgo3sW/fF3NuHvjQ=;
        b=gsrE5JKXPw2lxpRjyJEiaxyPUd1pU8t/0ubzf9j7L/CUXujQi2zmOalOUYsPisha21
         xFBDX6pAskz6fnYtntzd292CL9DQ3B2cQELsoSgfapRrO1jQxgl5JRpb41ZNu1ZX91cX
         hsCT31B7STR8s9pHP+Yag3IkC63FWzB56NC2syPIJ6KOi91BKZHKbncBq8fk2zJrSN98
         ApzAv+ePK07FFh1dgw+fv0zq374G46QmTTRUKi14ljzdSkNU4AcEoPT4kTm6t8jdBoLL
         44cG5K7TytVkTr5tzekrxNo9DLY1Ii+TjvJfzr67K8Db1DT7ZkUdzIxxR9SU+JwuFpd0
         DF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150185; x=1787754985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5yTeyQ1vVAKMn0PJztOwFpeHkqkgo3sW/fF3NuHvjQ=;
        b=N+GbNq0hzbs+fO/cgXHTqxWWwXYTyzdQEjAH0HV4KgWFQCbB2QGNuU0hF5jxegNWq5
         Cn2JPn4QSlrt6tpaE7P9bR4QulZkGFbu77uV+xaH0+5ZpjElBgTlkOMWYdDN8JbfEidF
         nvB3SnEcgsUbaxoKpo49DwL5rmQPWaGwarlaQov3+1/aRslL1hLCFPpDsRDlVSIsOZyL
         Did0x4MHMCt3uU0tWKdcNTwr0gEqXei3l00gDFNgNQuftqbh7YoiE+5TsCJ3klzLDYtO
         lVGV+CThCL2AS01kZEqBwZx/F4iIBYflnqfITn3Fk5eZaw/WrYUnZvu6++zbgSYHwDDJ
         EJ7w==
X-Forwarded-Encrypted: i=1; AHgh+RrUDv0Rm5w7iR16e9c554hbftVP3067OT5LFYUF0zY764oNDXibnSlVRn/BkWLfsQfHki22T3Skwikl@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxtgSt9Xvm/HTKOCnT4PbumaPI2y9iyxChjv2TyMC7PUuq1vY
	RbpiXgFicuIV4kaN7uTXT06LiNr40FMaWNELePsjH+0b8tDgRhfvc/03B3si+tWXeAY=
X-Gm-Gg: AR+sD12k4meOxtAjOZVRerDG6+dW7s/LEhfOyr+0rtv61dnMj8yIfPjvJ+4rMPhXoLF
	+YoyYi4ls1gu6kq8LRjkAnXAtlZaXO1xg2Y/3FHyKEKhOJNQWz1rnp74RKaYqiSuhgIldfCIh2r
	peCDAaMutPBIERTcEV7Mk7gT14Z/OYFYxSKEjI4HOUC4bB9ouZKUXebiQa0XrIRfH6rvL76Dych
	h+7fLhu9ya2EJ2N05uhog6rADloIpEfxRu5yGSSyCUoUKm0fsklC9o/zAZ47X4aosfP/wQqbN0c
	9XQyrntgNEk4AgPSU61VFJprUePFJHce5JtX6EH0unUoFdEiFqejOOnKSl2gojk16Qho5342XOS
	Z1q/cwv8AAYDmzZUb1ZdtOMQFp9MH3LnxEfITrSeXM/lA9EPOj8thU0y4N+PDlNCgmLA7Uxom0E
	Mt2tFtuNg0U0qaSbdo7o6iLityhhTo373TwRjSYzBq4ClCNWDptwcv9Y7nNpsaHKLJrVibDpgq/
	038hbcsZus3alUNy0xc1JAeU6Ng8nMhGN5u9YENJkWJMUPMSTTaO7ZAjeym
X-Received: by 2002:a05:600c:4eca:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499aa1a7a53mr81886955e9.7.1787150185026;
        Wed, 19 Aug 2026 07:36:25 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:24 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/5]  pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Wed, 19 Aug 2026 17:35:48 +0300
Message-ID: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Thank you,
Claudiu

Changes in v5:
- collected tags
- addressed the improvements review comments
- added patch "pinctrl: renesas: rzg2l: Unify the power source handling";
  as a result, patch "  pinctrl: renesas: rzg2l: Add RZ/G3S support for
  selecting the I3C power source" was changed
- dropped device tree patch since it was already applied

Changes in v4:
- dropped patch 1 from v3 as it was already applied

Changes in v3:
- collected tags
- added a fixes patch (patch 1/6)
- dropped already applied patches

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (5):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  pinctrl: renesas: rzg2l: Unify the power source handling
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 313 ++++++++++++------
 2 files changed, 216 insertions(+), 99 deletions(-)

-- 
2.43.0

