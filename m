Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818777;
	b=TlgsIFVYuc9CI841DkqZ3RhFf5WleCCugZDGLykQtbpZpWTJ+eSo+wDEzIx5Q/pEpsfS
	 hCBGZJ/Z3pCdEmyByvLLwNMZwDGvsQ+2RmqoWBe1OoenqOucmEVWyu8PTvzAShJQ9OOgH
	 rd8DReg84ANOC3qD7jdQcUQQYw/wjqaOiOzwEfSi+kGe0g6wfoaV/a1hB1B8nwTgWRjGK
	 bvttVko9wgCm3ufOjshl0sKXcARqlLI6bJLq3bsZcbY23g9UhhOsjhLCRsStQvW+na5Vv
	 WIqUSzbGBa58KfA8q78zn0bOzVVflhVxwvHz9/puONZTS/iStwBPxrc/uKBhb0/HBJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=e18q7m+XRgO8UtTQ6TkOW3EX1GONk1zjdab/Y9iIkTw=;
	b=zF6OhH05J6+FWUhj7R5ahUwbKi0EgFrgoldiiqTBULtT1gDGtR6wB6VaCTkKVnFnVRTC
	 EGe3iqcRI1qti+DuOsyBC4scz+3fKk8q1kTkycnng9n7LKsEUtxeS3XQlC6Ie2u3edJba
	 eoxole42y5IOA+roAUk9e4IecLnwCrD0SHa6tBwbziAYvXVVIXa0OtHd2Pwg2+rBWS2SA
	 RA4HWNp+pWaWTdNt84ta3eiB8H/dVsWAxKhds58gOHoCffOIQ71chj7fpj7JwIvbNNhJb
	 0nLq94xUp9V+DoBNNSu/hDsSamSImxqOfWQMRZ++qgKWzUPklnPeObhBUA5Blw3QNIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KXbz5l/u";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A806F606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A806F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXbz5l/u
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3873695f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818775; x=1796423575; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e18q7m+XRgO8UtTQ6TkOW3EX1GONk1zjdab/Y9iIkTw=;
        b=KXbz5l/uODdnOEfSJoNmxfbMA6pMr0YlR66YwD+IB+sEF0i+m+7C+RAxhLyF+SfJbd
         uGJvqUYQRf6EEBoj3BV1n1MD1T2kbbzaipdHnEbFpd97X0el041kD+NYxV8xV2M6Aodz
         KXmHk1p4QZnCdxKPEE0/uDlmFu8NUC6vQDp+XVKM3/TyEnLfD5arLsXTinq019BnJXZ2
         +UoG7nctxn6EsFi2a+RR7zLyC2gVyDadDvkDyC/p3/DjPlgugXiqmKZHV1X1MKvcAZPN
         bcxfO0vexWyZ0j0FpOmMvIm/aNQhTMELCrTP7SxKDl8ixrBZc024O09xabaaEqdrXtyF
         AsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818775; x=1796423575;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e18q7m+XRgO8UtTQ6TkOW3EX1GONk1zjdab/Y9iIkTw=;
        b=E5EccckCdybEYy6paUe0iNeNwg582exU3i5obbPcp8PDLaXLwHy7VuUQb9A+QxHzkP
         q0HLSxeuWM9Xvq4pofG1J0tROxRs/vD5x1FPFXsDpLwvUdTVzdFWPl1QiGy5ToJebj3v
         /+HOyHYgdLs6mrdv72cjG1p8hJmmw2OeKae9lTUfx2DPNeWcVxaFyc8sGme4M9oX+1SS
         FJFjNYrrlkTOVDm3gMt6oTOPwFUpgSBLBBje70ih6iIg9AQMEXTREoCOCnRifmAZk7ws
         tbS7jKnScIMKOA8XGDEEZUX1wUE6kPZ1lae3k7YPxv+6jR0VNGb5l65fd3t11ZcQbR44
         M+pQ==
X-Forwarded-Encrypted: i=1; AL+hErHlFBKm+fOMl50rZSY90cAhcyiLNWEYO/hAxhxgJd/RsFg/PiOFoQz4w/LKUPtyD6ixb7JWxpM5MQxm@vger.kernel.org
X-Gm-Message-State: APuU4Z8RaHoF/Xx1r1Yheb1ZDFk3zNIDEbgLtTkVjDUXR32aTYYGn/P6
	0em4I2KZZjvAAYSOxT0rQTtkVPHvS9ddHi5J87RKk/EF5rkwWrIZPPT7DTIw3rGbUiucKg==
X-Gm-Gg: AZFdTZc/T9UJ82hCiE2i95WLukEUIVm7ppSqTlbTu9lADM01ta9LGvJi1y8ytViB5Ms
	N2dDo3FJzHqCqNudQGRKyuZSf8SAAok0WikiSi3m+sNJ0h/MUennQ9TajLFDU+qG6cp6+9OV2DI
	YSm41V81NANSLPvJKJ01zkSGvzrtPw1ex8EnJAMg6KhGnPE0mGNgPOI+ySe3fGPlBD9VuqFi8s5
	HbU06Eb1hEmlsAWh5yNlu86N37EbTl3gc40dyS0Q49sfDzSP0OpwVN7Cz9b8bgybrNOxbQtQtum
	RlVTVlBYm/C7Raoj6/eA8mRcf0DYFg95AvjucSitguusR/T3C0EVXCnE5TewYDuACxCmcGDC1lJ
	9X/zF9/oqg1suegNEQzHKDQMWDPbnAHOwMAoRMJumAujvr4FdYpe0PkNpjkOx3ANkbIQ4Y/XCdv
	pcLXtQBJrTeFafkqzhsMXzZf2SikvhW4+WHW7Bn2A9fgeFb57eVJWrO0qz5mji9Cpv2ouuDdAUV
	9NAGo5zdlqRhV0FhrWb3VFZo7u8xQbtDJWpcOPtLJYc/CtRu8fJ6JdGoJtQvebFQbyWdgT2dIEH
	v3ktE9fsxAiqIxB6YIUaxk7BXvGqleLTKaW1g3DK/tfzG9ArsFu/dZY=
X-Received: by 2002:a05:6000:2883:b0:4a4:39bb:970d with SMTP id ffacd0b85a97d-4abab02c469mr49831115f8f.2.1795818774858;
        Fri, 27 Nov 2026 14:32:54 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:54 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 0/3] power: supply: s2mu005-battery: add S2MU106
Date: Sat, 28 Nov 2026 01:32:52 +0300
Message-Id: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OQQ6CMBBFr0Jmbcm00hJdeQ/jopQpjKFAWjAmh
 LtbdOPyJe+//A0SRaYE12KDSC9OPI0Z1KkA19uxI8FtZlCojJRKi6TCKtEI3wlNyruquqBrCPJ
 gjuT5/Y3dHz9Oa/MktxyFw/BxCmLpI9m/qDRYV4hYnrWWtRFSLLbloV9TPnTrguWhdFOAff8A/
 VES0q4AAAA=
X-Change-ID: 20261125-s2mu106-fg-5e2fc4490cbe
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

Add the Samsung S2MU106 fuel gauge (found on the Samsung Galaxy XCover5,
Exynos850) to the s2mu005-battery driver. It has the same direct
voltage, current and state-of-charge registers as the S2MU005 but no
MONOUT averaging, so it gets its own compatible and match data. The
XCover5 does not wire the gauge's alert line, hence patch 2.

This supersedes the standalone s2mu106-fuelgauge series [1], as asked
by Kaustabh and Krzysztof.

[1] https://lore.kernel.org/all/20261117104328.1176951-1-tadilhusrev@gmail.com/

An AI coding assistant (Claude Code) helped compare the register maps
and draft these patches. I reviewed and tested them on the device.

Changes in v2:
- binding: add the compatible to the enum, no s2mu005 fallback
- shorter commit messages
- Link to v1: https://lore.kernel.org/all/20261116074000.355176-1-tadilhusrev@gmail.com/

---
Adil Hüsrev Tepe (3):
      dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106
      power: supply: s2mu005-battery: make the alert interrupt optional
      power: supply: s2mu005-battery: add S2MU106 support

 .../power/supply/samsung,s2mu005-fuel-gauge.yaml   |  1 +
 drivers/power/supply/s2mu005-battery.c             | 71 ++++++++++++++++++----
 2 files changed, 59 insertions(+), 13 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261125-s2mu106-fg-5e2fc4490cbe

Best regards,
--  
Adil Hüsrev Tepe <tadilhusrev@gmail.com>

