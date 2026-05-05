Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C279413241
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982536; cv=none; b=DZ9ayXl1DHXcfdJb8+gUQGSia+pNUMH83Iazw8wCNOwdsYAH7pYu8IO69r7kR1enC8VBxP0R1kT26KCSIVXq5wUrMEt6TKp8r95rng2x5fAqhoYkbxEZsZy3DL5r1BARffdy3oqkMLiLI9LeqWlGiGzhpHoOWu1a/rFKCiwsAqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982536; c=relaxed/simple;
	bh=KFxFjw3A1zjl+OiAvISprXxuU5JoaXyUqY75lcVgo4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGUzmy2nMEaZYU0EOqzOrC0zUxoNIS/CBd47A5IXMRKWF+u1Yb28QupGnUEZt0Iit8wGUXkK/ImgAMoJzTHTKSRK37OVPHIdyPR7i6ytlGSGuMVd6ra/L2U5pg+Pe35+GS7m4Tkvhbk6p6xJSGSTRynJRo5XJ9u/lzENMWZ85jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1vkoGG5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1vkoGG5"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so6830099e87.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982533; x=1778587333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fZre7px4kA8v1WH8AczqF1O/6+UD6VmHE+nG5BQh30=;
        b=i1vkoGG5hYP3wGyxgtJJZhoSTXoub3PBP/qumJNaOXtX9nryT3Yb0g0FyeYy4Y9gbw
         hvw4V0REZlkPmWG1mxL1NecQPeA++FKi4yZTX1tFdPRkydF47puOcfPPXLzjVfTLcoI6
         k4GEdlgT91FGvMyfUbZvxy54M5Jf/7RDoLBX7lTM0NxCJG8Sqpeu/ka50Zws30uzPz4G
         nqyJ8qsBABYJXJvCBjPisKtXMlSqh6mwOzcBRNTWuT49G+lIHQjfilKI/ApbarxcNuou
         ShgLqrcpWPNbN5nXtTVB2hWp6IYAysULoiRzwU+uox6D2LY4GVXOD9l6WnGAEqru2uyO
         LeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982533; x=1778587333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fZre7px4kA8v1WH8AczqF1O/6+UD6VmHE+nG5BQh30=;
        b=f4/2ujNafUdvAWe9ky79zbL/lCz2vu4hxDcjUiMcsRqd3hlNhkQTBW0+hmwrZSK+au
         jWg/jyDUvYoj03gzPUcQjD04U1aYbjm5EIvfXlJpfFzgmAAOW/a/gE61XfGmPEP0msy5
         AJynBMaJTozeuPr3SdKznjHThThbXpv2m3W6xeyiqgXPv9tUafGQCx+xRYxkEOXIQSTi
         s1z58gmarWz1/6W1iNcE3YVsD6vq/Q1whlv0MLw3WCQDQfG5mgkSKsNbD9HyKLchlE1I
         A31plWyGhnJBLvFohz5FYtDyC+fb6MNnTARDz1qVMLxLnNNuttw+RdfZR1Oaz+f2LtXG
         RD9g==
X-Forwarded-Encrypted: i=1; AFNElJ8WoQpDwPvfY4cuXYTA4f3NGU1YpZza06HVOqYOc0li1I9G/pDs1xeAKPZdPw/q1sMut0kypH83WjpR@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjShlRjhhLrf+/0kWBjGgFIjgUQmBoznnQK73FduLpPKAy7Pl
	f/Q6S1JI58ckoWfn2laBxpmvMZyaxJO2lktunfPwCiZnG66WmcSPTe3/
X-Gm-Gg: AeBDievz6T9IhFpG9a4IrGRlUw7ONO312Rcn/6AQub9pOx+Nw8zMJDmGmnayntqU/qS
	9WyqIP9BKBPOywzG/z0J87MPPqHYcvTpvK13Hod0NTEqPlKPnBxv2QSzndHDaWyAuJXryEiNgi8
	HqlML/wZRhaTP3Y20OecH2meYMFQPbpw3H59kBy5qXMVCpZcEWdIBA1MO3iJbl6QCmwcWSiS341
	UGi9gaoP8MG64QjbQuVjWBgbmnzn4rtZxs9fWYa8xAdfLAW2MO1M0tDvV023ojXukxWZDBsrQrv
	o96d5By63uFTdr8sTkHkAZoTu2hsGXVbqJVtJrevmI51ajxmL58WzMSmaPEOyUCOEICFRu+Htwb
	qFBGVJUxi0G77WbzzwFUtKlofSm1hCy+YGlZCqIizLaM7WBBamg23s4QB4lPG0s2e+oopAUP0ZR
	1C9OOOv6ivmEBpDAVGQogH7Y+gtWGly7qVFHHc+zLM/srB90FRBI6TkVWY+hVoTthmrp9va7poG
	bxjFaCb7iBpyvYVhkoF3JEfK867bL9k5slgo447qhUj47ykhtrMuzM67A==
X-Received: by 2002:a05:6512:3f0b:b0:5a8:6d09:483c with SMTP id 2adb3069b0e04-5a86d0948c6mr3632119e87.22.1777982532251;
        Tue, 05 May 2026 05:02:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add xSPI nodes to RZ/N2H and RZ/T2H DTSI files, and enable on RZ/T2H-N2H EVKs
Date: Tue,  5 May 2026 13:01:50 +0100
Message-ID: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds device tree nodes for the xSPI (Expanded SPI)
interfaces on the RZ/N2H (R9A09G087) and RZ/T2H (R9A09G077) SoCs, and
enables the xSPI controllers on the RZ/T2H,N2H EVK boards.

Note, the DT bindings patch has been posted separately [0].
[0] https://lore.kernel.org/all/20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Add xSPI nodes
  arm64: dts: renesas: r9a09g087: Add xSPI nodes
  arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  38 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  38 +++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 135 ++++++++++++++++++
 3 files changed, 211 insertions(+)


base-commit: 4e98e8ccf664c41c70abb12f2316b2b49ffc3567
-- 
2.54.0

