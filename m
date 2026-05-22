Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FFC3A9D88
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444217; cv=none; b=Tz9qAY18fy4VbXJhrcqN2WZJmDQp8MNDWcVU0hKM07rdDF6oOEIshaGZzml2f2Y/QvecOJ0PaRqMuKuQCX12AgCxfKeseqO20Src9buliCwdYtwQOu1+wQUGl2n1GN02X01lBlho/qa5VkrujiC8EinjfETTtTXiKHaRvOiRLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444217; c=relaxed/simple;
	bh=XcEC9ecrdej77lQLA5Zn9CN66MJ4E6gOFshYSEz1t2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jW+nhqyXim/JD6PvnoJd/peixY6HvvFHRRQnF/KRvqikAueBaM0L+y7EIE+6w7s3SxQb7HeNeLIRxuRljgMTew3twwDSlqhgRSWzRcqBt8rp9otDykVeg7VzRT+1Dp+QAWHv/utsHE5niHvuURl275i7rjfLf7bk8lrLTbZqSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdVZf8/m; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdVZf8/m"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bc85eda6b6so35556345ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444215; x=1780049015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=;
        b=EdVZf8/mSqovV0tpDvJF6D2d2iMpTJvbv6tEl6BwwqNPM77hmR9QoZMMJXiWcYziWQ
         4fFHKoprt+3OMclShS2lWPxGAy+KZSfos/vs+H9Xuf7J1HSDzTnbGRDjszm+85msf3A9
         Yx1VjhmWwLQKWxWVoZ1ARkdBqrHzAGjyX6lutvt+BZUJvCSBMRQ7K3vXexjEiYedj39O
         TI9XrMMf/ii/lJPQ3iGSXsGj3Tl7i+XsrMo1owkxFjDX//yoX/u5qo0itGPcp1mT2v45
         6WdmxSMPpiY4zyDVwQ2PH50QD9OxAXXxVruD+ALbVtPQOA/oYLMYOQQ6juGn3sUb2lxG
         d9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444215; x=1780049015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=;
        b=o10KctXc8ZocA5IjQEXBEMJ52BPEwEXUtZMj1Q1Rr9SREGEoYZUKPSFJ8UeicrzjwB
         tc7XnMGk2nm/dO5RJpMybDbqMTMfE2Za9g90eePTmBoP+lrV9gSqh8tzG+LtgXzAK6ZL
         J89c+UO8vYoJ4Fnx9ddFLf5+aIpYNu8/qRha4HxWypMZCicTpfqnVJ3ljGwG4jHZm8jF
         DeJRQKBH1uED52G+7PTdVSDRl9i4okWjGUUGb77IFxCiRHycOzbuFWIgawMxn4/PnWhM
         Brn/nK4sY3hGyDcYVTfQG4ALx4pIwO0reIb2qNwHgjL5bckX0Nx/OSSdn3/uYtJA68qF
         70Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9KtbpzysiMHN9yk2S8wzeVJIt6ZBXGOiSzjZQeN3JCR4muZRpEdawJU0eSN9/8UpZpDH9UItEzmTSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SKuMSCm7BIf7D25Eo4FeHBGAtQpRrBM4g4jE3VZ+q6sn2KY8
	BbFaBLEQ3zguMswe418uNVE5KX9ay+NnaRWM9W9arot5Uxph/e2uqW+6
X-Gm-Gg: Acq92OFkvMpYJeOrG14wNbNaimG5remppYAu48u8lgHo7ysPMnhPjeCq7FGLDEErkWE
	DAxAkTKEgtLUcasy0x6lvKn0CyPypzSTDNA76yZznJuUBBcFuuGCcm5lqT6O1KnGdcikpimsiZX
	nbR7JC3V0lFXaR5y4i9yyU+dAngGBCX+b65EYkqArIi2l7XM1TxqrEgbjfe95+/yt/IbCBa0f0f
	XPaC3rvxo9KX+biPiOBjVHVetl41vOBwwf/O5Oy+usFhWAWqS0K7jId+00K2eHR2J2VTwRBBI0E
	DCFFMtjM5/S+JqDZriMq2lYuKA4LuquKmMlsdSQXNVXcs3dWPmdf3B32sJb0o6DhGkQeKVK3FvR
	Yo+5Mdkv96vCSTRnQxLjz/yyTL2pXtEkCaJ/FsYnEGQvu9oNaA2AJfF0Nl9TFjWo4sj3ejiUP78
	iQvTqf/KqOnetO9D/NB6PZiL5qkpUZSEXWrdzhufh+uoqsbuK5Mfq0P7s1Jw==
X-Received: by 2002:a17:902:fc48:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2beb059cebcmr32443895ad.16.1779444214757;
        Fri, 22 May 2026 03:03:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: rockchip: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:15 +0700
Message-ID: <20260522100318.73474-1-phucduc.bui@gmail.com>
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

This series reorders the runtime resume clock enable
sequence in the Rockchip SPDIF and PDM drivers to enable
the bus clock before the functional controller clock.

It also updates the SPDIF DT binding clock descriptions to
match the actual clock usage in the driver.

Best Regards,
Phuc

bui duc phuc (3):
  ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
  ASoC: rockchip: spdif: Reorder clock enable sequence
  ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence

 .../devicetree/bindings/sound/rockchip-spdif.yaml      |  2 +-
 sound/soc/rockchip/rockchip_pdm.c                      | 10 +++++-----
 sound/soc/rockchip/rockchip_spdif.c                    | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

