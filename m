Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112827281D
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976082; cv=none; b=lKOgLEE83GS7IjGJvnff8dKHqlZwfdUmn14ZUOmUoqr6g+RhtB/S6TybsmjVoDeWfqIyRB9mIxaeBAd0QQgRPG4MaFmizvrwuYmsvClvQ9bpa/LTWZi0NE9K/PH6Dd8Dun9fYmKbjqjQy371K4f1Ak8Fv1IkI2jY1BQz8K6/gYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976082; c=relaxed/simple;
	bh=pyCtv10ijCOcr7f6tZE2tbiH0NqoXM+39cgvEB2x8x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWZ9Cp3DXsQbhdw6jk+kdnlHBKKN/Rbs4Ky3Fb8uvA3O7JNYNhgFMLcBCmm+w4+HlZkAo7Bez/QWRBb6K/XRxRY+nvpZ0A3Jw7fgimbo6NBVD9FNh/1KDbGKKYPeleSYrrPF9EQg4zqX/2H0pT289q0rcJQURq0q6NxIBkIitqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sP2BicN5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sP2BicN5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso341885f8f.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976078; x=1780580878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kJ10VKSFyd/Jmp3siR/rxDjNdmAJhBNWorD0nlZLNM=;
        b=sP2BicN5Ox9ulim6ViU235WeZdfFZMV/oyoLykPuml/G1iyZzfsjn+AZXFJBt/H+h2
         ZbsMyV77nE6ri9UzwisUjVpTlKtbyC6zymfpsAOSbz3XqmoIYEFOAKXx+7etoP7TZs2B
         jgz65fbQVOtHILGNQ3UnPBvjkHhwElu8c2gpCM6o5Qjx7CuRL0bgwnoaY7aWbmAFjb5l
         QuHpcuMzmfdLk4r1QqzyGZ+A/FQfmbwybfLW9+fPNPwtaiBIujHySuDMzFEE7uzIekLm
         9HEW2u3X3AfQA8gGt6VQ70/F9YyJfefay4RKmj5nrcOLNkX+ASdXmIqmhSiaQixBM8CS
         q3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976078; x=1780580878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kJ10VKSFyd/Jmp3siR/rxDjNdmAJhBNWorD0nlZLNM=;
        b=kSjPxVD6eUqLBOeGGX7vnQcPiXSpE2eOaOFeyLh5FQdypFkl8/KU5jiSQVgpMPu2ZW
         8B4ruHBKvMTW2lSoiy1TgIYZUOY0c3/+zrbSE55w75eEYOLGpA+IOe+Wr6mBCjhWf9sQ
         VO0yqfoulLN3D/o0Xrh1z+dHuVFguR0vIuMX+aOFHCHDua8Mf0+kAG0+ay7Pp6AUs2R3
         oXcTwSIFwyRPBDThY2oWPwZLf86kseoDKpWRbl8KawAoe4WVTDMn5bP++F7fmmkuFf4B
         ihfqMNkSudv6Vt8N2PbVPjDBIFGuwFhDf4vSHyW344TvkMMl2RyJmLCoXILMr3SAn9jT
         QCPg==
X-Forwarded-Encrypted: i=1; AFNElJ+lkl33oPkuqq57IUEv/SAaVQ2gd1IILyr3V1DuGtVU6JY6wcgPeq8c4l/dYNoBYDB2e3IkPhNu+EA/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6ErJUxIJDgKHkdz9+uaE2akkOr51QXx3wzlav4cLjZAlfBOh
	rSn1FeyodVInwj/tsyyvY+sZVgIZX7s7ujXYTTi24Zqrg0AWJy7DuZ/N
X-Gm-Gg: Acq92OF9Y/3yBFWMWAzuznjA5WxxkoGCOC1QN3sulpb+XN2n3O8VkscjAeGHSxfsobP
	bfy2FgbW72oSDgN9R8apW4+BVxv7spjr3YAinC4H0t1vPVMp3nXl0yyYiSs/4aFn75aTFLbQGis
	j5S9Ge60FKOTIhPo7l56utQlQuWQ/SX3OjEzTPg7gg7dT/Zl6qzID68jA0viRbbAPrluwxB7eaO
	ocopKM29HWSwyqSF3h1l4oO6D/yqKeTkVdibZaGK7sxg9btVR/Yx4aljArY6QRsrXSnmwaG34Px
	1A5OOC+CYAeKcuCUo0FCqmnlrIcWXhlDG3GXrg/I4OJoUEgRO/kk3y0SEQCZqPcdJfyajVNNAdd
	VhY2ddMVbDYo3dOGFvR1KetNuiwV2lf2gv95Kb7KFV0SY5/x+4n04/4DQZiJek2Nd+T9xB5o0dT
	vnT6NculiGPgRJKVvSA/UPPr8oziPgsZInsSqfOXSbs3U9euuEqQ/ZHF6gig76Lx9CCuOShaWDf
	GT9CKDn5zxkk909gNIRt+7P79RnTjuRQxa7yIE3oDtUasw=
X-Received: by 2002:a05:6000:2f81:b0:45e:a0ab:8bd1 with SMTP id ffacd0b85a97d-45eb3688839mr47962842f8f.7.1779976077930;
        Thu, 28 May 2026 06:47:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e50f:a16:236e:f9a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54903csm14013775f8f.6.2026.05.28.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:47:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH/SCI pins
Date: Thu, 28 May 2026 14:47:49 +0100
Message-ID: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series configures the Ethernet and SCI pins for the
RZT2H-N2H-EVK board. The changes include:
- Removing unused MII/GMII pins from the pinmux configuration.
- Configuring the necessary pins for Ethernet functionality.
- Configuring the necessary pins for SCI0 functionality.

Note, this patch applies on top of next-20260527 + [0]

[0] https://lore.kernel.org/all/20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
  arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
  arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins

 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 144 ++++++++++++------
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 144 ++++++++++++------
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |   3 +
 3 files changed, 198 insertions(+), 93 deletions(-)

-- 
2.54.0

