Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F3C27144B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140055; cv=none; b=m4CfttqoLvvtBe3+R+VY/fZWHR+hlvwLZvYd6wApqK3uV4MoSjCS//OqargQNwj06X4fPKiFT+KG7Eu9tub/NRCxc69xu0cO8zrqqbzVehezFQPOV/raPet4hj3yknwSrZSxz+nyavKROwbKH42b72jXhUN55QdGgdzVglPGhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140055; c=relaxed/simple;
	bh=zCNrwnurgO+KAhjv03oxH9hTcLmUU1xStBcQnjNB2S0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDu8jCYAEj8mQcfr2N4tD7cO9USYNAjGwsgt4K8uZMCKboUJ31KCqZJ4LlclvRWgTevjD+YH4w+Kw8oVXv25DL8PWO0e8+GIdT/Oi5IinOhIcbmUI38vuM3lgUUgUBmAuhGsQvRzB4J7Ec2jJLFjeQouWiVHV6XSGIS+OgvGXB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abvCceWR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abvCceWR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso27657605e9.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140053; x=1792744853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=abvCceWRVbCXjX284RigbGgHiOY5/pYEP0UJQNKYJxcEqlWYueVLaMgce92p33XcXV
         AEnNnL3tn7ffGUFtd41pbk33O34mk1ZnbV55jSX0E0mP4pFxMaoXw8vMElaVXzpOHs6m
         dBTziSTm2lYbF26WQ8NlnZ92adP81J5yRsj3VWGiOLOOn0HrSUzvqziLVWVaRtPFvC/3
         KITnvggwyZEec00rTzUqRRNOGHQkCUlSclsHbMiPqMaNW+w4aAEzxWPKo6hUsoz2ymzH
         LUWSm8A3nuMFZVzH9t1ZIoWAwLV430I0AbLG0wr7hgza80YwPfU2mNMaz4Pjovz/3hN4
         rkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140053; x=1792744853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=ezsL2rKtdHvNbHEA1GxpaP8vLdfvxvyk0JvnhNap45vEYeFiNPzfGlHA3/nQE+aC5V
         tn3taj9w6mmU38JCJigAwO0NoQc4KQiZ14BNNdwNFVSix5BPOv09Y8KYfyHqkByiHX+Q
         ueOgWxKQ0qWhXrWZuAwRIz59Q1XMNkBCnlklXl/fwZFCmm64j84BZiHJtBE2MAfQHTHG
         t5HtXi5Tif87z6L8a3GXS/W/CCMqJlpxfZcREbcbl2uHOGoCs8kadkPkrUx4gW7Z08KK
         3B7N+hq1mE64M5HyIiL5+hytFFFgMXuT9dgpIMMR0qD/jo1jNzwOuezE8G1rGyuhO/XZ
         c28g==
X-Forwarded-Encrypted: i=1; AKwUvByc8i+AIUefNjw/4UizaMPpvzDiI94kZdYFVApyTSqyUoeKLjHft0outZfH5/xjFFq4fKMM4ptX9nzE@vger.kernel.org
X-Gm-Message-State: AFq9FYK93Fyq3hQph/BhDb0WxYzCmY+xkmovYVAnd1Z3APMCmOsYccg3
	GEo9A5cghlbyM7pCbfs+neaCZHFGHnIPLqxPgcc20tDV+u8b141UPpBO
X-Gm-Gg: AYBFou2vqUosjeyyGiOnx55xasCKPprB9hKxh5oKWsS20uA8gDVlYQN5Bz2uulL59EL
	IW8SkE4UQ7owQdFZHaFZE3aby4/Qr7Khc5JiGqNngTnDn3cEYeijMpeO93m08ZqGj3erOrkqGHP
	g+6XuPc0QVJ43IMppfrs07d34b9V8ioN4y+wFF6N+RtNMM5cI5ME/HIDK+8Tu968dsKkOWlpsdQ
	JhF2Ro3evuOvPyNmEGwsHg142HauWAAlEtqwRF3dl2l7Lwh7rnvh+jFGHT8NzigP8En405u+7qj
	X1EUX9/0O40znDsSvo2KRpgqMAJ1O2vctjjSuXVImNgVDguYtlHSRHr08c+6+KZ7816mfYKCvz9
	t4vvYxm+RErt0O6EQYjFMehLDao5WV7Lv9kv/zKuL60rH8Qw3yb8oMbcFSmcgCqb8XWUx89FeUF
	sgVUE+PB50nsxvmKgWGiIO6mZKOyzuomYgZQyWlf0bv2lVWv//FBvh6yOmiSgCaCETkOES4zVSK
	SV+KVzN8Y6MMofAJey9wbfkh6gy38f7s9NsGjdwXRUbrb8bNQjFeNN9JadwdVP5lH4RfgTEsQuk
	Pi84kSK8bC2ePxdKslg6kqQSWc5TCh83
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr441778475e9.16.1792140052601;
        Fri, 16 Oct 2026 01:40:52 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mm: Enable DMIC input on Variscite boards
Date: Fri, 16 Oct 2026 10:40:09 +0200
Message-ID: <cover.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series describes the digital microphone connection to the WM8904
codec on the Variscite DART-MX8M-MINI and VAR-SOM-MX8M-MINI platforms.

Configure IN1L as DMICDAT1 on both platforms to enable the digital
microphone capture path.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
  arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

