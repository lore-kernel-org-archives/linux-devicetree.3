Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779CE4DEC37
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979341; cv=none; b=qsp2w8vcmCSYMhOUVCZPn/++5Uv5wj1KNJzO21hLEl34LvMu3ao8PD24ngb7pBmAKZUyGOkya33fy7dNMOoGegbAqKFzrn59/Wx/wA6IN72YEeiu/WNtPvo8MF7TPxkD4Lh4W81MeUJ0VUZtvuNRgmj5aOpuqGch12TRyhrPDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979341; c=relaxed/simple;
	bh=ew6C9tF0Hto4FCznXsHAlkcnPGFhEf22Z2CTdUK92UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KI8rP8XWErqIFAz1UszWnVHHLYf9pD2qkZ6QTxwUhRNumwRjJ9LfCpdbM9XLW33woG3OKOwC8TQRL7BEXtGn2Y6Vo9+2/j0Z5Ya/kF2tDeaMignrVE+hmRVBNLMD2GsKC3lshaJgRPtpqo4MpuzYzwe1RIOuehNW7wa8fPOsmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aixumOY7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aixumOY7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso1325494a12.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979338; x=1792584138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=aixumOY7nnXWzJbjk4sjmVUDbx7viJW1FlqyrKZVXqJ/UC/+cbbMXPk00KtgKpv21p
         D7KGY/amn1M0XetyKWmo4OQrhdbYJcgn8DRIDb8nllS5xMQyk7Qi+36t9ef+R0UP9fov
         0yDOLY5NdtOdkwTmtsMqBlsz+ZXZtqz+iYGgoJny2vaOyNYV/znibMwde4taW9l1YThq
         B0yTvdTp4c9Mu8/nAym/mWkzDJz4RD4FX477xFeoKq9Lvfvggkxx6RFSmzI4aFvuPpGT
         R+Fr5wRtXAtygc2aVNXRa4HcmN60dlVL+3lBVBfEa7sacVJuQi6kDL2tvM2uyQDKXWHl
         YKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979338; x=1792584138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=2nT3AqBAjk9rAchVlj0XRs2blmSLuCwcScRy6r+fcMUoNRsdnTgmtyJWeiJzzB4BaB
         17WFFVEqRWQ1vVannSjaZaTdsyMK8LWAgZ/v0ZXsKvYLltzFgf2I+YhwEPoATjsCQnvI
         KwveSCC4NKHT4spx+COW6RN9m+yqU/b50tpEWK2N42FJ4+/2yqpGYY03R041QKTV0f2e
         b9rtseBpkO3lpug+bbuxB3u/2aoZQUraBJEdjJArUnXGBh4adEfPrLKfBKx5IqfcmMgC
         tXVw//aCMIAgpRRARmnnz/WiZ1xYNebxjN/lE8ZcPNCisogr2x43rZR3M9CC13FlMqTy
         Sd5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpW7iLdOcadrvI04QFrqKLbNRV+wuozl8+LacFYrtSRy9LwO6NbmGyhzoEG/jI50mvgHp+fPybufNp@vger.kernel.org
X-Gm-Message-State: AFq9FYJvbryxCUw8bLfKdqtF0ayBE08mHt1NzPADv6FgAP/maMiJVrhm
	ksBJgHoXCPHZhUbhBIjjYGtWN/TNRFQtT0Esv1MC4SbPxQbHU55vz77Z
X-Gm-Gg: AYBFou2ku+etYECKegiWF1Fk8taTjOLDEnnnFGw/yjjTthUDLfR6FatFKS9OTkudLhN
	+XaJavOWADmeiLavzxeDEqBtZJKyDJiYW2YPh75ZD4ZUdsDnnhP4xKaJ+FJiHsoCLOD98OF+7JI
	kxBQVrD2sVVvH47kSJNfyYboG46Gb6qEGhShBkxJ4gzqW5eAmn11KNfzZfZW1wGQFOuU7n75zRR
	r4JwKXEv4zbivHHodrrUqL3ia6ibC2NY/PGKyOejo86nVJb9vPzUXu9XKXjZ4MVH+9O/8RpYQ7+
	8auc2zgfZL2kzlDinNSGFrnf+ZftmB1T5OxegMYxkSWzkzWS+zku4FXUtAZGyas6R52IM4OgkMD
	d5AMwpUwjutS9Hz3nBtPr4D/eH23IPLTAQJHp2m3hKY7tQtqU6fnAGB4vx0t9j1ZroZ1tDyl7OX
	U3mkmFZh7eazko34ttz8xrvQQsnGAatgsG6dfWjE6LQMhOS4Xal2o2a0pbnj+Ns7XvFLolXawYv
	q1cKL7PuR2NontTfw7unO4MQMM0tQ==
X-Received: by 2002:a05:6402:c1d9:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b1b9da412bmr5434409a12.16.1791979337314;
        Wed, 14 Oct 2026 05:02:17 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm10937057f8f.36.2026.10.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:02:16 -0700 (PDT)
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
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Wed, 14 Oct 2026 15:01:46 +0300
Message-ID: <20261014120148.126160-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

---
Changes in v2:
- added missing dapm widgets
- added owner into snd_soc_tegra_wm8994
- fix jack detection disable and place it behind check
- change copyright comment style to C++
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 +
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 175 ++++++++++++++++++
 5 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

