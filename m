Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBB40F8CC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009686; cv=none; b=lqWe/ktHVV/oTtmu9sbMPFr7tlntZxngZWvYOf3bKIeHu9w93ThObXdxgji2bc3Y8ub8cxreXZow9EgkAKjvctm7n6SZC4xhcvE7+n7EJ4Z/wOQedLSNXTdqHlEeWa94alf7avIufVnTRxVX7N/Ru/x54XKDqQfzIzdxjDfLrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009686; c=relaxed/simple;
	bh=hRkDQYl+eauJF1w2RfLFP4dLK0SzDJox/bVwzgoIMDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGVxoR/GgVlFd27SkC1QlIhfilirPD+pmom6otMsz/y3Vhe9gbNZz+mXOjEktA/Gr0VMnuUpOGvVrdIaL7gaH3zhKRP2p9ainVzqtB2qyJqqQDjovTyjyWqVx8M2TlMvT087rdCFbsjpX3jehGCqcqWUO5JzQfDO19pK0p60uNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/u6yAUZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/u6yAUZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso46723455e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009683; x=1781614483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8VflC/yp1i4Fl+RYhCGMVg5NMZXonOa9s4DvisN8aw=;
        b=r/u6yAUZeRVzlLcWS2D1vc7zkk/zEcteW0H+E3VfIidogXnA1s0PTxE5ZPBrkUDAVd
         M11O9PobhOpLAdFTil5YQjbdAV8xdQf6buWuoEs9apI0jdImagPKB15q7aCsLwFucGrn
         88rxqut7lGFuYnV/+r3AQcSrsShnxsS28Ou1/9roAQQwFoA7ReX1v3AFbvZ9Bh5u3xw4
         AG5zlO/bZjFXGbTBsXy+ix4ibG3KB5FKEeVFpwNUIrBmxP9HiQZOEh8W41yBcZYLGwGN
         pYNYA6VWNJQA/CBE8Ig2R2EeDPm4PFOgq+t6/R6lLol93s59GZQuRnDXpS75+nnTrx3H
         Qgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009683; x=1781614483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8VflC/yp1i4Fl+RYhCGMVg5NMZXonOa9s4DvisN8aw=;
        b=OLd3f9ozAmmuE8Avisk6fj2Y+JVlJHaMKPMn1g6XE3lKSUkEY6VjRdKNokU6zC9XRs
         My1dOKLVQlmIK7dTLhSCJPAWpJBpLWMGc6CnxaB+ibid8prMEfIIaAl6UB4amUZ73C+U
         kFEDtt/aWddVPzdRmggjngl7wvY3RyBAr8Q56kgKMwCT+kxAX51vniDKe1t5pRnNSrJs
         oSLG64pikH7NSQmCN57cpQoAcnf9u/ptdHCjrhrWVygT+zh1pJx2xl9a0naB0Dv43NXV
         l7p+KtnMINrZNiEWaWIC24mCCYuc1MWPttnSCRtiCdu3nOIzR7Z0eVPLgBuUjy92a9P0
         8ipg==
X-Forwarded-Encrypted: i=1; AFNElJ/0L9CLBPhEwm5XDzljeSpwhLA/Y0YbjlgJvO7xou9NhwRzWH2sQJBtUDyM9L59fZ82D53TGNRc31Ye@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3fzgCe04IOY5tVFhQiKhNHEklgDxU5ZTUCcvsQWxFY5JKRNU
	bFX4A+6agNiksxOyUcDm9fffdHRc6O2+Nkpqtkx0czo0g/dc3YVllT8H
X-Gm-Gg: Acq92OGxeb58SOZHY4ZhQraYOKl0d7IemfXGZzNQT5h2iMzW78sZtdT0Z5izaJoYLrq
	6wy8vRyxGs6NJfsvdRA46B4J8qt0O7+5QsaeZNxWrpDcSbI365XdvaEzAmWkYYla3lhT04DXetn
	r50/gMHeTCC+NW2FJJ+UnqPHWXHRNxNfQkKomuTYRnhj0/ZJDITbO/JPQyvaoeQ4tc7lxdXPRGv
	CB/tRv3qwFS9Jfm9IsKGYXEMb7LHOPUytOFZn6ZI7ez6Pb+d5RECtNyksDd3ILb64nyWuBOLOdS
	WjeeLphFVYbKQjQv1ZGqgaYp2S0Sdd88S0+UdLQyQOgDLdfLihHjIeHtKD0aw4H0INaBJ0u6pKZ
	e6qGTuTmwQiGrmnZZFbrA02G8WaFv+jAjdagnpeNlXd+OhSZqzq9BXBYWgiOyTZGWp7S9kqvNaq
	B8oXwPututo6V8XaTMk+laSOGjMpbPpjBB194zVbEwDmLjI/kB7DGlb45akePU27oazZ9sET6ae
	UVKCO4AAaPngFsDc9KFwOwYvdGh5KH01qLq3X1+SNvbxU/ohWatWlFRWA==
X-Received: by 2002:a05:600c:34c5:b0:490:be9e:fd07 with SMTP id 5b1f17b1804b1-490c25ae3e8mr328691045e9.10.1781009682728;
        Tue, 09 Jun 2026 05:54:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:42 -0700 (PDT)
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
Subject: [PATCH 0/5] Add DU, VSPD and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Tue,  9 Jun 2026 13:53:48 +0100
Message-ID: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the Display Unit (DU) on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) SoCs. The DU is a key component of
the display pipeline, responsible for driving the display output.
The patches include:
- Adding VSPD and FCPVD nodes to the SoC DTSI files for both RZ/T2H
  and RZ/N2H.
- Adding the DU node to the SoC DTSI files, including clock and
  interrupt configurations.
- Adding DT overlay support for enabling the DU/LCDC pipeline on the
  RZ/T2H and RZ/N2H evaluation kits when fitted with a CN15/CN20
  ADV7513 HDMI transmitter.

Note,
- DU driver patches have been merged into-next.
- FCP/VSP patches have been posted separately and are pending review.
  https://lore.kernel.org/all/20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Clock changes have been posted separately and are pending review.
  https://lore.kernel.org/all/20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Patches apply on top of renesas-devel/renesas-dts-for-v7.3 (039608fad808) branch.

Cheers,
Prabhakar

Lad Prabhakar (5):
  arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g077: Add DU node
  arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g087: Add DU node
  arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with
    ADV7513

 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 35 +++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 6 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

-- 
2.54.0

