Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236127EFE9
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543784; cv=none; b=Xpk/wt5N0W2PCzcJ14sSuzLsOENPxcIm7gUrpjtJ7PbOHI3fNhPdfjRBrbtk8YHsNK8nOGf0mN5wLJWcnrqhoYCtQtq8f36o//Ri/0CS3hMhLUE+kjxaDaJDcTChT2LDYbL9bPJw7X39MTRtaR135gBoMjJchnhIoPDuOSHfZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543784; c=relaxed/simple;
	bh=BDV6z///Ag0jrLfv5FPR55ob2qwhAFZ2RbGtzx56J+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=id/e7J2LzJ/iSeR3j2F3f6Jdk+55PTXlF5W5HAQigVT1Nl7OpIYBShqeVS/58Qn4okBl0K8eviOgPCwlK33ofZyO5MnJwwhUa8hYmqCaA1856bb7wCJ30chNZ1EkRr8TkVPChDMFF6+bSmEKJX707J5OGkhvPIPGbZK/k8SS7ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arE6awJw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arE6awJw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso5124375e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543781; x=1778148581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8A7MIAnU12KGVZkkr1Zar0mlpdikKahBDagAl8oeFpQ=;
        b=arE6awJw2yH6l1bUFQPGLft8webnnCwNgDSv4w51yo1w78K9u+8NY1Pq5CIf1SZMVM
         f4e8hS8I9DtsPZfLv1wx3Xsn99qbicVerDtsIXmwjsXIa/bbOPVNRdqleLOH6+/i3qWP
         nTm+BxONKuY6ln6B0jMnVCPPj8rEcq+Tb6psGeffkE3LFtKt1lhkT716erlhOO0MaOC3
         GycN3+6NnkZXopYXJVAvQAO02LSgIkkWImbWuQhrLatJylLM7RfbByZCZ3DlI3KDwoan
         2XTAODwt0nQSj02S01Wx9BXUDZvKx+uCZpV/m8br10vNdEc1r6J8s0cWbDHW2r3Ko74H
         a8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543781; x=1778148581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A7MIAnU12KGVZkkr1Zar0mlpdikKahBDagAl8oeFpQ=;
        b=pdBU+PelaIafA3aGBgtA7L+nyRc1exJuX109vNhuvItx66cST/L+DD4gcfZcpao/ZB
         WVk/Z87pu1pUZSWVgDfBV7h75G5bQK6diLxcpUYSOWDNpXs8S34s1DAbCQDjEVlwnFee
         mGPUSB2QA0Sjm7IPlyzxWO0zIYupdGdhol2OXCXggwBzRCSRzYkFNpIHp6aEpUbLtyQU
         LAEy0+Nx98nUGAIgfVN86VNn6Zma883NsXIOftP0uPtWYR+u+Job5b4HfeOrhllLQD0p
         eKRuOt106ogp3jHpFeexnI4hDOOIjKFgIU+8lChnBEteOOvXAEEroZRyjrxbTOQ7vh6z
         a9KQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uiAhjQFA5wtF5IuwLWWv+MO41Gec6p3hlOhM7Kg77etMlB0cGnC1IHH28SAMXfoZbstArl9U62jvx@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAepgHBh3F/StFcpFG0uRTg1XfrJlqo6DKdOtLY623rPnIY6m
	PAEPjBkiNS3pANhoR+dKEfCB1GlPNqnE96ViZyp65/Ie1GwOPEzT5XC8
X-Gm-Gg: AeBDiesvhacwCRi/TaO1MrXg0GtyeIHopL9LdJ0p50uyKJhVsff0EJF0g5pid/mS93W
	q3T1k9vxRWb/UgdE1KfV82Rh+iolbPcT6GA5zFC0MFZa5dORmOQdextkjmLawbkqvbSr3LNHrnk
	3Nks+MVnREsfXdK9Kw/6uvvNAfBgOC7ykwvXqsk/IOg8ij1m2EG2I/jpf0mihSi8r74Z/TRW1LB
	Z5CHk/WUQh5/LfswdO413InSw8QH+WVHqzhPaibcsO3sd4neGhcuPZIwhZG6CrMHm7HYU1UJ2/d
	DjIoZBRWJMFLj9ixIv6HFyWkLxgwRN75VU61qhh2OrZeh/ZThrNF8mg4zq4UW9YxbW2utPTfj68
	LdRuYopI9dKSZDR/E472fpoKVdIGnLiuJaynf3jqj5Jt6XAR3lllzDBdYeBbItNKQ7tq+jJu9dY
	E/mUjO9vaTuGh4J+zumoCWlnNbL0joBSnP3RZPvW7agAbJkV3FD0ZH07M2iuvMXeP3SU4ruelXi
	lj/Jxlhh2gavaKXQ8c5jcTSvZeavwE03+X4Z8zQd5Xe0uzZUJ3c3qg1GA==
X-Received: by 2002:a05:600c:6285:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48a84486f35mr40572135e9.29.1777543781304;
        Thu, 30 Apr 2026 03:09:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add VSP and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:26 +0100
Message-ID: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the VSP and FCPVD blocks present on the
RZ/T2H and RZ/N2H SoCs. The VSP implementation on these SoCs is identical
to that found on the RZ/G2L SoC, while the FCPVD implementation
matches that found on the RZ/G2L family.

Note patches apply on top of [0].
[0] https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/tree/next-media-renesas-20260430?ref_type=tags

Cheers,
Prabhakar

Lad Prabhakar (3):
  media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H
    SoCs
  media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H
    SoCs
  media: renesas: vsp1: Make reset control optional to support platforms
    without a reset line

 .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
 .../bindings/media/renesas,vsp1.yaml           | 17 ++++++++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.54.0

