Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2243C062A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828055; cv=none; b=LKcwXRNK6+I9sgszoUAhYV58bRH5WNZULiBHyLFzf+I8Au3UVbwerHcpSsiPkgLtLIDJh1oMW7hawVjH0B05igKMhpOLmUtzLP12OmVTEBuV7goJRm+vYVJo6DIrlQoXjphuHaxca8Ojait/i621tNkPL5PLet71wrO/kDmPBNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828055; c=relaxed/simple;
	bh=iJY2O1CoCbTDvaBXdAn0Owq3QlMoeXW8nHMcKsXdUKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6PS44wh6xRbytiKQA6dMGnGZPvHZCMs2QCto5IwlzaHedsnNxHqnRIMmzqMr1jxuK8qFpVJIlzcx6W1IqPkGBKA6InGbVN2egSZfIOCEq4uW9IKS5tfPkEiD8x3qa7bZaVqVqUdUg0fKd9og0Ky/o7+ptf2uXtv5kPiMa2yP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/3VzBoT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/3VzBoT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49039a8851fso54965705e9.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828052; x=1780432852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZcOBu36HEggoBtgRODABfJuXBioxKKdmGZjAU4vWsk=;
        b=C/3VzBoT1KCC4A4jFzc+b6qz8ICRWqpgvJBWHw35V1/PJ2VyvrucmqM6ip8xJ0wvNI
         F5zfOARJOE1Bg7bteDRt7/WbtTnSHX/5cHC+bbltMlDPfW4x//COrIGQBXfi2n1ESBEg
         Efy83K/QXFBc7N0oe7zZtPZKIb1R5fSypXXsocrHC9XodyLrp/B2C3un75q5BptV3kHt
         5Ahf0M4TiLBZHKQnYuh/7C/C5uCIIqeWzXCDk1U2MOPnrV1WyqvdjsXpbEkLabZcBoup
         jq/J4KAEDEwBQgSxqZDBZVpuO46iT6lNUndJazKi5ZwHCq5Hpi+myhWIaRPWH+gXqq3z
         Sj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828052; x=1780432852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZcOBu36HEggoBtgRODABfJuXBioxKKdmGZjAU4vWsk=;
        b=o2Qzbs43I02z66Z0XjWNUjAs54WIup9gd4OUnjyOwZtMkfzLM3IhMdgoTG7T1pXllR
         iU0yTdW0En1DrCfvucM0aevMqUsGNAZ9TjHDmdGGz0LbdcsXNDdY1bq7+Imy+dIchhEA
         0f0C9Xr0ATPyjzTBGkUCnHayW8kbCpQhU+ltmgGiRKJbRvwJC6kj6lh1waPwXvDryfnD
         /aB03lEm19wsL4BnGB52/JUWeupTEHDhLzOtuRaBWPdDxOJxE45jn1MCnXK66ddM4Dt2
         AYlkYrU2zWPiteyndAfU4JDn9yxDbfQFx5dq3n4ApTbTYqdwm0UVBo47rWy5weuHA4BE
         TyZw==
X-Forwarded-Encrypted: i=1; AFNElJ8VJ4sxR4i7hNvWqD+n6SLGGxlC0qPww+My5Fg+4q6+hYPceikG/Q2a3wpi3E7cf8pH0Yxp3sLy3Dno@vger.kernel.org
X-Gm-Message-State: AOJu0YwTV+QsRfYCAomxPIszRoiX11Fgdc/ui5kiCD9mGz8VCCatLEzC
	SjWpMXQGW4Y+XxBBmpPkgWMOZ0ze72jrzUPevoqtAAVeEmfn6aKkB9VT
X-Gm-Gg: Acq92OGeTCMZBAY4/wKcCFkSWBaN1k27y7/1w2AdTDHpmgvuy5DHNIN09/teozyP0Y3
	9rc/2keGWqeaQYOJfUHDeDqR1VDqbJZRXN6MVq5ffWtVBhPNWPJwxnMTzVJUTq2oqHVcxKNtVZ6
	Lf1kFIoiO257KA9n4hKO5igMoXTaL4seveFrZDYDCe49RLdjjLDHKDiYM0ijHHD0J0YqAV6ezUX
	WV9lykOV7IXY/ses612hIUqbwsi4PROAT/axIz6XMtv68Tye6U+3r+/xJcf2u37QActTsdF6HOu
	U7Mshw8/H3CjHh4Xg7kkCymxGutJoYGH0Mm2MlFgzwm6ezajjtggZSKuq4SDZi8RO9RKsEdpCdT
	IOLVnjFHI2sMLrrxk0WD3T05fbn/AEQL9GoU9DBAdf2CblcvuVV3qCPCBcCVH4PMjkQpd+YbWIw
	JO9Ib3wB1FqRuR0/91irDgPXt582q4cTSUvWhtdjTEDXKnCMSr51LEYq/zrqfPOT6J/hjC+f3ni
	sbZ+UzWK4bkwv2mI4YvX4f0Os2xLlRGHs2cKA==
X-Received: by 2002:a05:600c:a012:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-490519170bamr285343105e9.18.1779828051774;
        Tue, 26 May 2026 13:40:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:51 -0700 (PDT)
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
Subject: [PATCH 0/3] Add xSPI support for RZT2H, RZN2H SoCs
Date: Tue, 26 May 2026 21:40:42 +0100
Message-ID: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the xSPI controller on the RZT2H
and RZN2H SoCs and enables it on the RZT2H-N2H-EVK board.

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Add xSPI nodes
  arm64: dts: renesas: r9a09g087: Add xSPI nodes
  arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  38 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  38 +++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 139 ++++++++++++++++++
 3 files changed, 215 insertions(+)

-- 
2.54.0

