Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562203932D8
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114566; cv=none; b=JDT6ECPHBj5n9X3GEMpWJ/wNCxwJqsNIsBh6WI7fI604dLOEvtazhddlNuM27V+NmpEm4DkCXm+NEm+QY8lMfUQ/dxcDIGjd42DBcoo6h8kJMLM03xpqilWwLD9tgau/qihzalU1ym+X53Uj8ECa7rRelvM2crvutXuL6q0kzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114566; c=relaxed/simple;
	bh=rxaZPWENivHVITTeHkS0y/dXeZqFrXaYDRpVRjDTB9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bILZxbDqf+FYwL3sBz6Ngt9J4eyBXWsCe6e+0Y0+wSgfzD4+qiDPMtpa5hqKQ5gDe8D4HJ2VTt7XfmVnWUlNRtxok//PurKF50SmW//zBp7wBT8I1X9Mr//ovNTjQNhuaIdfqx/CNf6x9wSB3Gtg4xhpABb+KF+nwcJ+/c2nja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJiZ0syB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJiZ0syB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a9296b3926so51125305ad.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114565; x=1777719365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BL7vCpwHFg/qJ/N6VS4Lzp/N+c2rjtsENFKEs8/Vu4=;
        b=KJiZ0syBW5x8zi40qXtoEfiPPd1dp0cRrKt8hYxEnNg6iQKi2x3FfntlwkQp80tS28
         7n1NX99Rflsv3Ht1/4Nc7lmfTx1wIab0bPwTnjeFPxTtGNXT3wCZsjRMDCEyS+eaQZmP
         2kZt8sGr/1PLSocsxv/Jn7xFMvUGeAiV6Mn2Gj2TtPbAVvfvABTlzfAq7AlP9AWlwcMC
         aQskxu7fhFOyiVe/ZAVIAz9cpgbTEYu72To8I94gTelvBtU2aaEF8OJ/BNvIl+dydpVz
         s5RS7f8V5XKBVm2JyxE9QpUDgmQY8dBvhkKok4iIjf2MhLJQypJtU1I9LtNi/Pl3NS/I
         McJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114565; x=1777719365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BL7vCpwHFg/qJ/N6VS4Lzp/N+c2rjtsENFKEs8/Vu4=;
        b=UzRMnBKZKf6VU0Z6BrwJyD4aBBuHnRchFgCeM8hmxTsg7/vLpieu5Vd8cwNI3SxNBo
         icL3zq702/rbZF0Dq0kZPnJbLL07vMyH/h2u1KQxyqoBNZrG/OAEbZ4r26YPVQ716sWf
         sN+LNLdFL3sVNw1oz2LVMib+hCnU+wCE8tv8eYHZp9FiGyR80qKONwpd3xpyup9iBWka
         stmUweq+sVvyWcl3DFdkH7jYYvGxp1BdE1EkykPtGraJoMhURmjAzOWGimfzoLKIkTSq
         fb9gHa/pckPpd13Lz3Fr77Nu2oRF1kukMwawHevFxT3tk9N89+9GKmtUuyxNjkWXjODI
         HM6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+XKOkHDWOlcul8V28oO/IfF+gZNYi40O8KfWC/SZkssNucLwxTXGsCgenQbfCXnmlThOH5UKj78tX9@vger.kernel.org
X-Gm-Message-State: AOJu0YzlmoExU3ZtiEGBo6rQJf3zHAmj4LLz6+RZZEpf4U/5WZPJ//8f
	CPLPSL1TrPuuNehmG2OfKI248f3BVBnSk5Dtu6OyE4q7sQVUZEJDLtXn
X-Gm-Gg: AeBDiesAyDlyOM01FjZfwNoW68NYeiZPMpKTRUFe/T9m0SpRtQj6XTDK44hawn0v939
	deCjtlgHXiQaS5n8G5ptLtn/bqXpncf76cdTLrGsVF+rUuj0gSHHrUTtUoyq0dL/fXq10iHMQNS
	afkk4nHy7v3gWWgwTtst6peiztDIrkxOQ4+3bldfmRK1ytgtyITK9Zj6lGnyqPasAa9cjBeD0b1
	5rBLojbb/JAVo3fMcR5oyXnoWd1+UwBxZ9w9WcM68TqKuB/HWB97eh/u1QUiXeHlhV1zMlH6olE
	gzx76HiLUTkd0IMRlbNdJ0ORP8++oyKVrCAq5Ia+DAuKAVhZ/VffNkLtdPn6M5SgjGix1SnYUV2
	57GrX2RYldZUZntNtIIQdUENkrCZngHyQy/5KJ/wAve1rrc5qbRKYhey8yNpQtA2lX993zjN5lt
	ofQL3atJyet9AUolDBpnVk0EIw+E1I
X-Received: by 2002:a17:903:1ac6:b0:2b2:50bd:83ac with SMTP id d9443c01a7336-2b5f9fbe8b7mr344293685ad.40.1777114564649;
        Sat, 25 Apr 2026 03:56:04 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:03 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/4] support camera found on Gaokun3
Date: Sat, 25 Apr 2026 18:52:56 +0800
Message-ID: <20260425105300.745044-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for front camera on Gaokun3(3.0GHz version).
The front sensor is Hi846, this series also fixes a error blocking
Hi846 driver function, and supports more mode on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Pengyu Luo (4):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Add 6MP and 8MP mode support
  arm64: dts: qcom: sc8280xp: gaokun3: add front camera sensor node
  arm64: dts: qcom: sc8280xp: gaokun3: describe rear camera module
    information as musch as possible

 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 255 +++++++++++++++++-
 drivers/media/i2c/hi846.c                     | 161 ++++++++++-
 2 files changed, 410 insertions(+), 6 deletions(-)

-- 
2.54.0

