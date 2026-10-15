Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCFC521897
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069612; cv=none; b=ZT8rYieSWrHLM5wMXwnOY0CKtCjVcH4yvkMMveQR9Dw6XYIlI8CanLlr8bRIkRgbI7VW3YkGNS8MUxxD3C5lIJk75wXsull87OjZ1tBkO9KIqIhMM10OM2VObVrvzGhxIqsYu+nAq+PvJcNLLdFD/+uFZd3JpHu+BKIse9QbfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069612; c=relaxed/simple;
	bh=p7n1Ecnt0Ig+o5MTz0wrxEjhHgnBndQY1zB+5PXKm0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAnPAgr0u9mWe+CFChkrSb5on2PXygVKhG0tRpKGehd9N7Zj4vWSGFPnOB0HT2WZBa/7Ib4uIXUhkNJaODJ15wA7chV9jh0Thzcb862x3kAkuQzgcO57gnOFtNCTs1CmcPqSt0E7zxDbPxcf8XuCONBkozq6bVLKuYRqzjj4Rlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSTbGdrw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSTbGdrw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so32432215e9.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069609; x=1792674409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVKjnhR2wtejD6NNK20XI1upYrpeZTFwNjFuTIUiDEs=;
        b=jSTbGdrwnV/nEf3vlDHnERFngHyo4ZcfFxiTjjQAijnrmjXtjt+CxUTKT12zwTbuFP
         JOkfKqRz9jPk1I9nmZjfMYSN3zj3NNitNU7VVkZzI2lAvVHf/rz6US6rGfIrSQ4/ISqn
         iqEyqrfkqot91lYJQCcJUY9StHxB/7myvhosgu2Ai9SYrd8YjB9XtoijxEb5qGRP+NNh
         fwECS6FeOjafxArgc6nU96FxsgWau0PDWt7Vbf+1vjYhqxi94/zYxm42lO1OHOUKSoH9
         sMxDRw52ZbNddZpYbR1B3TiZDLJXLPlfd5Q6kDI4VUHEx519zJssunR4RMQ004B0o12N
         l40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069609; x=1792674409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVKjnhR2wtejD6NNK20XI1upYrpeZTFwNjFuTIUiDEs=;
        b=VgrH8zP+BBZm0b52JPsPIMP3blpCqutDTIqfJR1hJN2qb23QgdS2pncbmMAMLb4bNp
         J8iFtoaKt/QWMWPOpB4P0Zbt2QkvTJBdFvJDHsntCyGrYiocvTUCN0jppwCMynfu5C8v
         W3oP2aUlV5mAkgGaabXOmtrMAEzh4/aXAmvRnaP6Yq5IjvGp4eIGXbktePJ4EWj31zKP
         U7ECQvhDkO9pAXJr7O2zejb93wfCgbeF/523nu9r7UvikGti0SKwzmUP+ZrcQcrD1wzE
         ONqWcIGLAJHLQiTonpv2L8RhIq0sjWW7Rf6SABoK7MjkLTU1p21066gYqYFsQyqrOOMX
         J+NQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/qOUE4aQBJm7Z6dldrZFcFldrSwq7mxnRZ4diI97xFOtwVgAqJ9F/bOiWxAZciofmjxA+jzJjpx/h@vger.kernel.org
X-Gm-Message-State: AFq9FYKzuprnWigzqxs26mXXkLj534Fcxgb2F8IdTU1bHFH7t2KVWzhx
	atBOPTPjb7aAwPbIdLYva6f2JuUKINkakuiLNiWa2j651NGckVDf/5AB
X-Gm-Gg: AYBFou3tXMSqEnFCBvedbXbw+yZxxY/ZgRpIV6f0WPNTq8xZccuoUs4UOeQMSppjwwd
	1dbA8zfuvC1/B68eZGDK8ipqYYohZ8r3QD8hr3cbyyGzMXqjPCKplVjM9S9NgDb4f+b2q85fCh9
	s/B4DT6MXoKZCppMmbVmP3LD7jv8ImGuCsaUFJxU0ErMLWkU7cXtnhTSWSZmNHwwEGtaqwWt/VB
	OJ7sc2/QSMFycpjXVdSW/zxZyTs/FtwClnbbm2X0Lnx8jDsWLwAWSdNt+I+Uh15n/iH1vX4y9VK
	HxWwQy/u4MR23X+Q8vbJYSCzZ1vhDUlq2e4HjJOc+EGXrJOl8ZywPt0lC/RAFkdYsjiRnTB0mdf
	qtwgebtHZM6tKoKT2bAxKUyJVpjOKGvVOt322P/+o/GVFuVjA0FYzMOeeERMNeD9r2B++Zemh5T
	H3A7PB01UVH8OA7Vp1oBSRx3AK52vUGcD7dFg2FNDa33i5Dl8kcBHVRPHfb57i4s1prwTZ4+u1x
	Q+9AaBuATvuUk0fXTg=
X-Received: by 2002:a05:600c:a088:b0:4a0:333:253a with SMTP id 5b1f17b1804b1-4a18e49c331mr385515195e9.14.1792069608553;
        Thu, 15 Oct 2026 06:06:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm67013005e9.12.2026.10.15.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:06:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support into a single schema
Date: Thu, 15 Oct 2026 16:06:27 +0300
Message-ID: <20261015130628.184279-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of codecs supported by the NVIDIA Tegra audio complex is
increasing, which leads to an increasing number of bindings with minimal
changes. The main differences between codecs are the compatible strings
and possible pin configurations. With the introduction of auxiliary
devices, a definitive description of possible pin configurations becomes
nearly impossible.

Remove all existing per-codec schemas and consolidate everything into a
single schema. Compatibles are grouped into common codecs followed by
unique codecs, all sorted alphabetically. Added examples for each of the
common codecs and for each Tegra generation except Tegra114.

Schema check passes for all in-kernel Tegra device trees.

Svyatoslav Ryhel (1):
  ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support
    into a single schema

 .../sound/nvidia,tegra-audio-alc5632.yaml     |  74 ------
 .../sound/nvidia,tegra-audio-common.yaml      |  92 -------
 .../sound/nvidia,tegra-audio-complex.yaml     | 235 ++++++++++++++++++
 .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 -------
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  95 -------
 .../sound/nvidia,tegra-audio-max98090.yaml    |  97 --------
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  85 -------
 .../sound/nvidia,tegra-audio-rt5640.yaml      |  84 -------
 .../sound/nvidia,tegra-audio-rt5677.yaml      | 100 --------
 .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  67 -----
 .../sound/nvidia,tegra-audio-trimslice.yaml   |  33 ---
 .../sound/nvidia,tegra-audio-wm8753.yaml      |  79 ------
 .../sound/nvidia,tegra-audio-wm8903.yaml      |  93 -------
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 -------
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 --------
 .../sound/nvidia,tegra-audio-wm9712.yaml      |  76 ------
 16 files changed, 235 insertions(+), 1263 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml

-- 
2.53.0

