Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CDB38B127
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 21:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786830608; cv=none; b=uyXKVrJ+hK1qgMMRYpNxybL9noNjCwga7Ib0nLGHXJmMH5MRTxatfYUdUG+n5DaCHf0V0DfmSZTHWVWQZsr3+bk4j2SE4rS6YM5TuGQIIkZM4W+Ie1dOLCcmL+DF//VDeo5go89Wo3zcWPo17bUKoK9qPRJ4VBev4bycXZwenQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786830608; c=relaxed/simple;
	bh=4VCb5hbd5FtPxnayyr+BaRBuN+DJl3M/be9Ng6hw8io=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sONqJvOR514IDroIvHPEsv1sezo8Z4Efi7ZA6ujtfAJl2GHc5L4hXu/yAKxwVjJdPYU66TS+yzCGWJ2FRmAH1vX7oJkCsHqwIYjqIZb2RyPdRoOiijXGq02P0rnoLJZVZIv7kFsgw23fuoJQY2o/Abv2CiFnheTba29CoqIlh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8UibSWX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8UibSWX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so339024a91.2
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786830604; x=1787435404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=flOU+GsPnkJk4hfwQBm4GqfM22X6Dcnmn1YJIc77Kh8=;
        b=j8UibSWXI9rl74spp4oJ6JLvNzfoOoC+VP7EFlN3H7PyDA7n3ndGaf88VVMuGnH2kV
         Y3tNS9EsxFYnlWafr+b5EEfKJE6srQu5FLDpfUpi/0pkVmpbwt/ecNKEV+HoCD3aQwcZ
         s/wnWkggbS8Vjiaq7WwG0kcVe3pdc85aGsJivDQ4ojugCRLI35J+LQnjjEDnau5bvPNT
         ZVuPC7qLrWsTsf/FSW2LPr1SE1fWs8yDqRY5YyTmqI0WXZ5PAiGtXZj5FxZXzujSK87i
         QGozrcZbm2EnPsMjCeGolRGpwWpl+ECJVSeRed+v3kXtOr/sLw4aHMIGacZvRmRUhZp5
         cYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830604; x=1787435404;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=flOU+GsPnkJk4hfwQBm4GqfM22X6Dcnmn1YJIc77Kh8=;
        b=aukKJRca/Yp/vkcL+6tyjq1W8h2Uer3HiYAO/nSZYpJJv35zPZvCGFJAHB7/uDR1wm
         qlKsXToQB2Xoo7gOjudh1hoEp3UGKPAewVMwnduxjPSmydPIi8cD80Halozj86zIjnc9
         AY2FH9xQZiG634gG8OVlNrb8Ah8DPk/YW7VbhaA5rXSi40dSECDqHqdcua1xYb/o8KpE
         vfU1Pfp2T7IIrNDwp/pMtJpZro1nWmLd6qLUAJgUalbJu4YNsg758Nculeu4ueLv9ObU
         0QiDEvntIC1CHrReRr2jdjOq4/B5xCmHOeROfN3GX4Lu/NmU19Z8FyycNNujJc12ip3v
         dJFA==
X-Forwarded-Encrypted: i=1; AHgh+Rrdg2dbb7YOcHBOC0Z/k+z3FeM/nS8LAJqee/LzQDUPFJdVKjDF8qqy1I9A9/GBSO8Uiqf3hBJ+aPWj@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWlvCMPj72cyI+ONHYEphpGNhEZY+0yKYfTnSQjG+qKGlfMnu
	I4xz9vE2N4N/Aatv1CBWXNpZHfMqE+BKfz1Bkvy68bC656JgbnTf9CWG
X-Gm-Gg: AR+sD12FEIbpifjwWLysd4TfSI2s5sqw5qDMqd+muigw78V/4hMHhtMuFiRwpMJH6/z
	5pE4Rv4GMKlguuCie5Qf8v42OA8AGfwxqcmtFPDD0OK6a2ApVbb0w2fb5OOEai381q/HYRRqvXq
	qOwQFhAhs5Z765UpVnEqYsOru4N5JEnpwoyiqIu7fac/i7kacEi9UYL0b75msP22MzCh5580iMN
	Pne220fXtHo5WAeEvG6BJQNLgxAY4pTG7pYrr4Jz5P6PuxlFlUZAHMGAcWmElLeFpM5g/1JbmsX
	+JO+paVONULE7e5LyiCgOJ+2XZ64egNvs1PlqN/qfTk6gPICYmlXRbbhWjQxY84fkWYFyXkenlP
	6j5aOT4sx+fSVpUcbkOWWWGpKi23vCfIFr30SV5tXurtCDII7y8HWr0mo8+j7iFgRcsLafo7LFd
	kmKRes10Tqo7pSsFjroEoB1bSanguvF7ldC84k22K+BP0q+HKsH+CQEdxSk/sCCFi/eYzvcDacs
	szsy9+8vzhgSOZo
X-Received: by 2002:a17:90b:2e4f:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3933b871cecmr11796551a91.2.1786830604335;
        Sat, 15 Aug 2026 14:50:04 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388b2554sm33541829c88.14.2026.08.15.14.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:50:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] spi: davinci: Convert bindings to dt-schema and clean
 up DTS
Date: Sun, 16 Aug 2026 03:19:30 +0530
Message-Id: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqAIBAFfyX23IJJLNKvRIfMrd7FQiMC6d+Tm
 NMcZgplTdBMQ1Mo6Y2MI1bp2oaWfY6bMkJ1ssaKcZ3wBQ7zjbiA8wlW6bXivHihGp1JVzz/cJz
 e9wOTgHJiYAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786830590; l=1098;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=4VCb5hbd5FtPxnayyr+BaRBuN+DJl3M/be9Ng6hw8io=;
 b=L5/ERK4hd8yvnG2dq35TqIPDWaNtOiDPSanlrZvZNIE1G6J7s74R8qtuhTEQORm+zHOyL+lpA
 IdfmRSWsfg1BzuE0e8IZSLENqEcuIzeUUlI2+Gz8efUOUOgvZJUYOXk
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 removes the obsolete property `ti,davinci-spi-num-cs` from
  keystone-k2l.dtsi, as the driver uses the standard `num-cs` property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Remove obsolete ti,davinci-spi-num-cs property
      dt-bindings: spi: ti,davinci-spi: convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   9 --
 5 files changed, 144 insertions(+), 109 deletions(-)
---
base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav

