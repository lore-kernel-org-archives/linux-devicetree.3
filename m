Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17A3D8902
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395396; cv=none; b=YiDqRQLZihohElvW+T3537T18dmrhKaN934ylBoOYnB5fzKP5jlnAYNa3deun2qL9SuLFotvPnMuVPRaQ4H97aTCtEIaGQwWA7whnc06/k4K2WnnaS6q6KWIaWY5pjNZqju4LCogYxkvHlLzBM01JEBFUeePeTZkmT/s9bCox10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395396; c=relaxed/simple;
	bh=38/Zl5XdWU3WE6drEyc9KjDkqO0LDYBqDFG4G2evA7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzPQq06O/bzN/yzfhh6zZAr4u+oOtzEF1AlydEhlW53SHFYUxVRvwl0RuywNv6CFKG4Y35B4R5WDnHSe3NGo0rh8JpEmSc4+0yz7No3GWKFkr8VWSSjifersFpzkrfeBPCPWvb69fJroJrkAh51INShoNpSdMTziI90pPpkZ0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhni2arO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhni2arO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf22d29dabso30497635ad.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395393; x=1781000193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=;
        b=jhni2arO+NqIV/BXipl433F7rgNA+dpqyOGW41L9jXjB14DeRFMZ3tpJq6NLKJfXQ3
         DzHhIYtNZlWKINZuJ9+/x/xaQuSPkVKOht/JjAAG4q+nV5l/sJChrfgScgiChVho4eAw
         BDe7ikPBudgqNmWJZ6IL8Lg420Ueq5inE6oti2YSa+C88lKGciJDZBCfK0dmegFGYxeY
         X5awYn3K34/GxisN6n+dDmNLxpvxbImDb+R3AgcyWp8jzo/bS/yOAZOtMV0PZrPULivD
         6zl8ZaYkln/c7s6I9lg8BWrTnXGs8i1JU3g+HpVBhb0xjaIYGvrfldhAgceSjxbwVQN7
         G0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395393; x=1781000193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=;
        b=M0CLGdijH0pb7Aj9GEJ+x6fBwiyiVktL0I+LqmALq/voNwwFaiUa202Dkqufmst3SQ
         Zy5BdWiwiyr+HZ6Vw4JwhBCdAo8wwDL1Hl6L9r3V/d/UaZoV9MgLfacg2A0pxMncEb9T
         wTEynlEUpr1BnEwamSF9amsSKEqwXMGWdPRKiWS4aHzLMpzdurQW9PG37/eGvafh8yRu
         k2y+p9bb2KRA7kJYOJwJo8mvb5oZtHg1GEmgGw2z0UTFyeMoMBHR/NN0ZAf7TehJBU0d
         ILAKMjzta4k3f9mRaZN7S8ZDV+CoScGfPu+bXDsscUO+Rr/2AL9mVmcswLLzCsTMJe6v
         4qpg==
X-Forwarded-Encrypted: i=1; AFNElJ+eYIUcOOPy7W7O6tUoAk1Bd8OzdOZqFnWYuotN1JFCi+b9S3zRaKTpmwj9O2xOzG20PhrHPCiLSnmO@vger.kernel.org
X-Gm-Message-State: AOJu0YylhiUSw97Gtk96oqmu/oT8ej3A3W2TCEVADUCtaaRYd360Lscc
	gjk4cJQ1XQYCNVTChEvMgt4LjMLF/QTBCubWJ73298Q/+FPM0OZbnGAx
X-Gm-Gg: Acq92OF2V2MXQ51tpQVgBQvgqPRtWn/5BNFRkWuX4c/qdNPcL0uFCoJq/pJkGENdleR
	BaL8trmW5j0s+SyVFaoOyhrXF0X53RqN1MZO1lCj4I3qJdq+FtpjRNdK2+l3eOj5H5gPO7km83L
	6FqJXIaXKZWkdMVVspGgxwFHCTLEOBwTlI4+hk/sJUlfZj2bUp+tt1ssVan12sVwDypqjxrMCE9
	+IwvhRwY1sCm5OTrwNuQSCGTpCVJbAlFkNs2VMjXExgDY7b8wqXS5Tjp5Qll728H0acgi7rErkf
	fRxpXxhO93m9YIZNDj1tRzDVvmeyAMtMgsZPHROhK/hZo4zHjwtOXw43pgeq/IjLf+6VRdIn3yA
	DlQkTyozspK1Hm70W3MmnhwiFLOQ9WF2vqqUoN+QZ/qFD9Dm3sO4ySJ4PGFg3NfLHdhZv47hmxZ
	w1Z0WB3iysCt3Q1SIflTC8tXoxDo1I/sX6B1JWSUUup3QwoXQyVUNVCdxXan4YoSMh7Emy
X-Received: by 2002:a17:902:ef49:b0:2c0:db23:4c9 with SMTP id d9443c01a7336-2c0db23074dmr97094065ad.20.1780395393395;
        Tue, 02 Jun 2026 03:16:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/5] ASoC: rockchip: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:03 +0700
Message-ID: <20260602101608.45137-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series reorders the runtime resume clock enable sequence in the 
Rockchip SPDIF and PDM drivers to enable the bus clock before the 
functional controller clock.

It also updates the SPDIF DT binding clock descriptions to match the 
actual clock usage in the driver.

Additionally, this v2 adds two new patches addressing issues reported 
by the Sashiko AI Review tool regarding regcache sync failure handling 
and runtime PM resume status validation.

Testing:
  - Patch 1: Verified (dt_binding_check passed).
  - Patches 2 to 5: Compile tested only. Please help test if you have 
    the relevant Rockchip hardware.

Changes in v2:
  - Include two new patches to handle runtime PM resume and regcache sync 
    failures based on Sashiko AI Review.
  - Update commit message based on Krzysztof's review
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.


Best Regards,
Phuc

bui duc phuc (5):
  ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
  ASoC: rockchip: spdif: Reorder clock enable sequence
  ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
  ASoC: rockchip: spdif: Restore regcache cache-only mode on sync
    failure
  ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in
    set_fmt

 .../bindings/sound/rockchip-spdif.yaml           |  2 +-
 sound/soc/rockchip/rockchip_pdm.c                | 16 ++++++++++------
 sound/soc/rockchip/rockchip_spdif.c              | 11 ++++++-----
 3 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.43.0

