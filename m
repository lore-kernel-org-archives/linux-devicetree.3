Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3CF3CFF58
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964533; cv=none; b=WLFdeqJEOuR2kcBgXVQQGBGbrz8rRRa6BSgg9HEh36BsHiIXV+qxFh9VTUkU+zPtZubm47YeiA7CWEz1l9VJaOGACEcgzccsya6hsWzTX/fe54Crt/GJNedt4ZmbZi0H2RohxtgpY7bwx3SlFzwEUGr8//LPAMCFYFro9r4udZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964533; c=relaxed/simple;
	bh=dIt0bhTHIvJkz5CfISQGAZDSlAsq8WtJVE5Zf446eNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrBJP5xOpYnGCFrFwkSKjcF3yRGFHV1sNgV3mxvPqAlavAzUfZuxj/3CeFuWdg+I65vJ/ERffPkmE8Xffg0AxcxJSIzN1iv6DXmPE7hGZf6hFRySZePxOquwRP5D6hmDz2RfE1Th1dOh2RrupwpE9BSjzPodqqGOEZrJ3iVcUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwXns3eJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwXns3eJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d73352cf2so4345575f8f.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964530; x=1778569330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8byV5wezlp6VH+DbK4xuz6Jvob5WzLxHoByLo0ebWU=;
        b=QwXns3eJVdYzv3dopEan1C7bd6e5H2mMsMjQWPp3a5sf3M5eHFFFcHCg1TZwZFeIwV
         bDb4jZ6baMukGg/OeN8n2wo3afnNe6IzKJuSgn3dQOIur4RKhTDAO7ZLhHOXhITU1iIj
         tVxoskG66xj6Uxity9fYgml2W+heggMojd4Nk0upWySp7esT0F89WTqh93Q6OCnFVYj8
         hhL7mjtae8v37VZI9Ah2WCl6krE5pBdFFvr4tWRvJS8hLiIn8bpvS6seeQ/izBi8W0DX
         7l+y/IB3u9vZXeADj+7YT5N/aT9bS8yWQd67PdBf9kPb7jImAdHDxZwLgrmcc0TqUsyG
         U3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964530; x=1778569330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8byV5wezlp6VH+DbK4xuz6Jvob5WzLxHoByLo0ebWU=;
        b=XFkw1Wtz0F57bDlPQOl5wZQZLc3cSPCzF35Du8uzmShytiqFwjXkaBMDacCVvkqKNa
         vzemLfX9SIHqUq8L8WLpERBWXnWchmoZ8qY8Yc+xmmO8PemhkmcgCMCJ1FDd9gBb3VCK
         6dX28N+U3btmgbP+alPv4eT1inpQhpYEpE/cnKOpc7rhhERv7833QGR5rOf2XegWszq3
         nV7cTc4LodM7a2NRMCIgHrGJs+awd54jvpP0eou+bzre3/afpjSbTuHFFkcYbZ6CS52f
         +wUIUYnoiNX2dCx/Yv1vO7JgB2p+HyQpz+7fkl4yJ8RawmYbYoKAyQeibdxLjjcP2u7W
         jTYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RercahlhnuA9fweFpOfDHzL2m+CwyXAmmuUQZRBG859JcyDWmeGrscp31LFXX1yk+j8xxqBebM5ml@vger.kernel.org
X-Gm-Message-State: AOJu0YxdI261kQZFKoPPrxu+kI5FwsGIRul+jpNikBENhVuwDGarPBkA
	NAE2L6v7AOIsInu4SXGQ1k8fX1s4prmbJwNutitTFzE1rrJCopK+s8rGk4CdGg==
X-Gm-Gg: AeBDieu1/cUoM7pQaiVqs0DMVfRKHAf8brDtu6T8fbu6fLnjSpHGw5+mC5A7wOnHYpq
	sLa09GRzxur51p/ExG0azOtd3g6oNgfTC2pkzZxeZrYje5VsdVOT9j9IrgsAO6Wki8vSrD15+//
	0tWwQENiN1FV4f5xC0lBdOhdWYnXca9HSPapjiNnIVv2ZJDVKLrARset+Ia9ERGu1B8gopOol5b
	F+Nm93WkrcZXjPtrPFMDVtR/XHT3Bd6e7Gn9VRAC422PQrUpXI8FMyV77HGXAtmv/8zXQQ4nlj4
	XViyO9BgjnKe7JL0sCUTmPlrkvvWrP1PCsQ8dAkKMRjhend77IzkPSkz1iz7RR9Z+BVqRUtaKuw
	b+crIYi+75CEqyVQFO9zgI9lwgnYtyjzTdVb9v4ulPxei9CiypMUOzI7v3zcAGgY0c+uG9vSknT
	dKQq87lo26T0ufeYfH3VdQoz/QfqJv2ZAK6jFkbfb/H3CWE8VJHEQT/WEvXkI=
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr149462385e9.27.1777964529712;
        Tue, 05 May 2026 00:02:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G3L SMARC EVK support for SCIF, I2C and GPIO keys
Date: Tue,  5 May 2026 08:01:53 +0100
Message-ID: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims to add support for SCIF{1..5} device nodes to
SoC dtsi. Enable I2C{2..3} and GPIO keys on RZ/G3L SMARC EVK platform.

This patch series depend up on [1] and has functional dependency
on [2].

[1] https://lore.kernel.org/all/20260430125342.439755-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260430093422.74812-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
  arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
  arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 173 +++++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  55 +++++-
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  32 ++++
 3 files changed, 253 insertions(+), 7 deletions(-)

-- 
2.43.0

