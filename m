Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F353160C
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914587; cv=none; b=f5MCaqAWiMJcPg+iF4OIIEzvgagCyLJTo6DF53Q793dxDmY0lOZJ8GxYaodtv/89TqCZjuehDWN8TIhCnaIfzoYKA+OTWIhl2l4sDVIz1a7IO9BUFl6voystAmjMA40XBUy7kSdAirSngzpLM+Ki21VecUmNckFYghsCmSuTZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914587; c=relaxed/simple;
	bh=/W79BkBsSp1bHuxt6cr8Eqgogf071EIwealgkx2ntKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAPcAqI4dveH+wBCCLLUO8I3VtUa98fWKAl5qG2Rh85r9RDeaiZcSZ3oPzAoK07YN9zFMBHeUnEcrHpPuNlmK0/d9TBN6DmNj2FsyzYnus5Li2LHzJCSOHj6YOG2ZBCdeRGDkrv4TdXNj2Fyxk6Ov0QSxvr9TDuuBKU+fZCnqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw6aUcur; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw6aUcur"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1702095e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914584; x=1792519384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qs99al4wHMjRVHpTlhI51DzzZ6O6j5pMt+HdMbt/54=;
        b=Bw6aUcur1TjeqK/AIqMjnNmZctuk0tObRajCoobP2Q0w1hdS9t6w3LQyXbC4+RqXsp
         ult8k/kSRHF2qBcrhCpswbIa3vXWe3irQlDWdicD61wcjDfjWznQdkodt84WJE4zCg4z
         dOgh50Rt8YW3DxYWjimsKTl+0pC7T4cueXnq1TT2b8Z6i4L6QBAtj5oodCakdbvVkre5
         UDz9y6qVfHfluHzaLQpk+hlFHIJsjoPqRjVIk4KHRnTm9HPZF1wwtbMfkDt46sDfXNcV
         L/b+N0gPZVO8fKY41Q7vM03UjLpXNzBx5po3/ZHh1pRNl1kbMjx5BKXM9gcDOMiPEugl
         +r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914584; x=1792519384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qs99al4wHMjRVHpTlhI51DzzZ6O6j5pMt+HdMbt/54=;
        b=l4jsXlUb2HAXrRCeBuQ27j54FtXYNpvtIhv4wTB4LIzt0JNGfYKu4keZWu17m1j8i6
         G73BX1sMiLlmnSYEbtVYvjYkfHSi8c68KZS1wxto9cKMwZKGd9eGLiCM+885dAHMx+Fs
         yNORLp3Yig1OzQ14uv5maMGYlgICrz326ix5xCdR5SkQun3yCOi3CwrZxeedBSMpRj0c
         HW9P9UNKosYDlZT89yFtZaI7HyD9MpoNKijADhSYuWG4WmUIEV7wfJPrzUmJXk8m8YN5
         2W5GOofeHYITxiG3AM1KyH9ZQe9fui/SyJdtUHHOyCisIjbASS0rHzVh2MRy40aCB5Wu
         Ns7A==
X-Forwarded-Encrypted: i=1; AKwUvBx+IW95AWsKFCHigd695/00g7f1/qh+ujdTCyjEF7knSl2NRkPRvCfoIHq22ZppotZBHhffkavW/xPl@vger.kernel.org
X-Gm-Message-State: AFq9FYKV9RqcUycuh83Jj9imxoqIhL8f77zIyQ2cbXSNCftigT0THSLn
	VWsH+O1PLtlfwHNmL7os5vmqeeJeWrorGfjhIAPbQRUpWr7Nfh/jtIsi
X-Gm-Gg: AYBFou2h5a5IEmrSu2hT3+Fpix6Gfk+r++In/EjWaSa/AolgVoyW0oDr1UUCDAxw9A8
	gwo805rzN9HogvbgmGl62UD08scQ1+uZRvajCSwyYM3567BTyTIXHWmtp4TZTXu6Y+f0z16Q1qx
	909jm2JqQGBXbMNRcS+7fYWHGz1Kq2Lrz0hHjWUgM2hhuasgAgRF5e5jpuOt4Y3exsxgswKqyDZ
	4T/RH9PNvinsxpHF/ayNtPK8bDk+QU3hmY/9Ub4ydG8u9b5GnB6cMO1gAPC0cGYkMcRSTm+b8ul
	zjDiupQSd2K9otHYR7QTsDEnEOg+3WgEopnNLhMSW5btZ4l1L23YhO3OKps8GSSGkgCWZhMKNcf
	LsQ0aBuk87rRLAQQ+L4qyE4FaCCVpe8mbXRtKu91D+sTeCtE+gaY6KtAb1GDXfxVOLwK6Uih6fO
	CxeIm7wEy+gKAUGN/qLsm3NKuwD9oef3rjKJ0z3sRlhX2WLMsLQ3LuBlxXDbGZ0kgCvI0PdxIft
	EZSKotd5maR3ny2Uyz6svkYBePqHQ==
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr275200515e9.21.1791914583568;
        Tue, 13 Oct 2026 11:03:03 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: tegra: Support auxiliary devices
Date: Tue, 13 Oct 2026 21:02:51 +0300
Message-ID: <20261013180253.477605-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
to be added to the sound card.

Svyatoslav Ryhel (2):
  ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
  ASoC: tegra: Support auxiliary devices

 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml | 5 +++++
 sound/soc/tegra/tegra_asoc_machine.c                         | 4 ++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

