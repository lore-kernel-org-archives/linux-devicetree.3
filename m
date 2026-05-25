Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AD3E5A2A
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700865; cv=none; b=lPo4cyLuiaIQk0kPRHR/yznd0yX/axpqsuOhkoCzlJPWLHaB+e6g06iXR2Oc9OBryt8yDba8hKUB9Cl55b3PAE4FovjxSuDKTgp7Ux1A/xkpgRZ5xN2aqMxGMogU9FsU+G+e6Xi1N3S25IoYIKlqguKFJxqRNTZ8zDxVHjtfWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700865; c=relaxed/simple;
	bh=oXqKGb+1PtWRWpEgixBmUR2HmjglMMAslNteJX0DZVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tu1DcaYUMuhOOiLb6wKbpoDmlId00f4N7j9Wz6OrPwe9acmKQ+lIZNYr6lXCc2fab34Z92g17ZnjMV8QUvjUOCd5IerWhF88UTxmYh0npW+NCiEPpQQq8OJRrnEn/30fewC6dk7yZ1lI/j12XIyp6RpRGVmBzOOh+od1rKBsDIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=g9nGcRpm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="g9nGcRpm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a74032ff8so6918444f8f.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779700860; x=1780305660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRUsp5/fssPeTOpCVfkJlRfBAwaroq/U91hxb4HJCnE=;
        b=g9nGcRpmRn2x5PyqeafUtaNQjMTytcXJA7FvgftkKhfqITbETnMPIkFP/Y2aEi8emv
         C2hVCStY9wsOo+FRV3rtIZ97/03i3zrVVwS0l5d+ngxJF7OjG6lTuSrfnKZCImrpMJOO
         H4Et5e8eut2PPk7BT+6C013wZGCUomqqd+A1b6KqZ+Q+incLuO5D3smpB41PxODnfc6d
         uOwEn+aLlQ27L2adqQg/rMGkGzR7pnzi47QGqeI8hBXfoHpyvtzcBXQvPITPcVVBreW8
         /yooflQnyVa8HEpJ9FR7+btTMcQHq+20wPiSbnLA8cPrjcsMSR93DyFzKgJpnTfDkmTx
         +H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700860; x=1780305660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRUsp5/fssPeTOpCVfkJlRfBAwaroq/U91hxb4HJCnE=;
        b=W6AbQduP6FuSbFGowGrBPFmdRKrDo0DvO8x5mldKrT/5VNbj7H90hvw/WGxwWx2nzi
         ZndVXTotpoyPKomolNsA7E6ydeRQttvF7q3fS6isPDG1oaD/AbbJHcUow4nuul6Ydfvc
         vmGnwCUXAGIBMYkybmlzlKWFRUVd97KF+ddYpQfniFoaYtn03afCdusQAUxQJOpJjhTf
         LsdtNGFR+K1dfdGN4kV+c3zLrm2AygnpWyyl+ihn8Ys49ZNuVmw2MEWIZF7dq5oHQk1Q
         bgDSkt27asHdDkdzmMjPZrjmZqTK1roBe3j2C4K9yYokZfkPOs4a+ddhHMXnUZ0Y7IJ9
         XDqg==
X-Forwarded-Encrypted: i=1; AFNElJ98tZfrabIDC1eAmm3GIWEviR3bkRqnyHkPtO/9KxopQdQL2MkKD1Qj6b6VwVSv8OOfU68OhigtEwRY@vger.kernel.org
X-Gm-Message-State: AOJu0YzPBuw68YJ9wqQFS2dbB+OmqcTWtmxppeQomvrEE06GgycFAuqx
	VIrT8k8BaHh/HAqN3mWv4K0x6JsxWiPmWUazGLYQ+ot1Q9gG+TDWvEiaLo9JPIleAHI=
X-Gm-Gg: Acq92OFRiY9ojPwQcSVFC93ECeSSmMLiJWrSW/w+nP7n+O20oWGWaDr3b6qQMZActPp
	en95CPTiu/eNqekSusu4UcEGc6wxJC+lly/Z7qL4CL8ea23Rcxf+EyPX7XP4/jb7ZuGhJXUsSN5
	NV9U3LK6y9B5W/JGlV7UZEU1h+pR6Chg1LiyICafbpNKPwAY/YyBDb0C/WIRqu1ZvKKAWGAfuy6
	22L88XpRICr55bosRNn/Xw7vmIppqvB/9EaMOuP/qTCgPkDOx/R/uF7skMNKpJlkOXBETsunB7k
	zEZ0ymUUdB0iBiUfrZiHMPFkzhM/T4z26TPo239KeMOzHquXN/Ubc9REPh1kHZdLh0BkBfovrmn
	+TzT86z32ghRYY3YTAhQJHJ0v2NZ1GaBAtF0jVm99k7/uqx3LyOAvqIHyG8pyiP/Tc5vJV+gVpp
	zrzDXIKzJz50ac4yAPfNp0FDYI8yXTUbKnuEZmo1f6
X-Received: by 2002:a05:6000:1ac7:b0:441:202e:3d2d with SMTP id ffacd0b85a97d-45eb3688844mr23666418f8f.19.1779700859989;
        Mon, 25 May 2026 02:20:59 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm25399989f8f.18.2026.05.25.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:20:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/2] ASoC: nau8822: add support for supply regulators
Date: Mon, 25 May 2026 13:20:44 +0400
Message-Id: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwUFGoC/23MQQ7CIBCF4as0sxYD04DoynuYLigM7SSGNlAbT
 dO7i127/F/yvg0KZaYCt2aDTCsXnlINPDXgR5cGEhxqA0o0UqtWJPeyFlFkGkRPPur+YkywEup
 jzhT5fWiPrvbIZZny58BX9Vv/O6sSUnjdIilLV3ThHp88z5TPiRbo9n3/AkhJ+JqoAAAA
X-Change-ID: 20260513-nau8822-reg-becf5b766d80
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=alchark@flipper.net;
 h=from:subject:message-id; bh=oXqKGb+1PtWRWpEgixBmUR2HmjglMMAslNteJX0DZVU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSJiJRZvw9cs/f41NVHmgrMQxUzl9wMlLuleeZes2s4w
 6HHVqn3OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq4vcM/zNC/zJu+ahw4r/t9fDkG123Vdt3ldsdYROM63z4+9+6/1GMDGs+XdL
 zesZVeyG6yyk7oOJN7srSr2+X39ixoLZn+dsnLhwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The Nuvoton NAU8822 codec has four power supply pins: VDDA, VDDB, VDDC
and VDDSPK, which must be online and stable before the device can be
accessed over I2C. On boards where these rails are software-controlled,
probing the codec before the regulators are up results in -ENXIO errors
during register access.

This short series adds optional regulator support to both the device
tree binding and the driver, so platforms that need explicit power
sequencing can describe and enforce it:

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Added the regulators to the DT binding example (thanks Krzysztof)
- Switch to regulator_bulk_* APIs instead of "optional" (thanks Mark)
- Enable and disable the regulators at probe/remove and suspend/resume (thanks Sashiko)
- Include the required regulator header (thanks Sashiko)
- Add a power on reset stabilization delay before register access (thanks Sashiko)
- Link to v1: https://lore.kernel.org/r/20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net

---
Alexey Charkov (2):
      ASoC: dt-bindings: nau8822: Add supply regulators
      ASoC: codecs: nau8822: add support for supply regulators

 .../devicetree/bindings/sound/nuvoton,nau8822.yaml | 18 +++++++++
 sound/soc/codecs/nau8822.c                         | 46 ++++++++++++++++++++--
 sound/soc/codecs/nau8822.h                         |  3 ++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260513-nau8822-reg-becf5b766d80

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

