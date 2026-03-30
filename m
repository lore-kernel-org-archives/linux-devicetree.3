Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B4B3C197D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868204; cv=none; b=V7C2XuoQtJv5w4YldZaZRiipDF6AKPRdhFVNUlah7+6vCV3loYItYJkcz58eB6gqPjrfsZkMY6SliBWvQu3RpGfRcSSr36DXktZFMtq3Yd8mmQkAcLWt6POh/8tKM/Zk1KSb+B+dheAC7pdWR2WWUqsA8xZFwtcRhginEFzS6xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868204; c=relaxed/simple;
	bh=m2CkOrXUMCZ8u/WunDlRMPt5n3OFxplRgyHeNoeq1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAZkmK2X954KwPkvDXnBdxB2P0g54i4NMZReANE7Oxbhh5y8ZsoN0zDpM8E78KPXwD7PfW4YgGEdEjAGD5sy9TSRbheAF/ENuAePT9AIebzIQQpR44OgrJ2fPYjBYIwFHHj9nLDAvPnVIEAb9huEQ7GqYIh+FLfiesH7xXD9ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPxR6xvo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPxR6xvo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfa33a983so721009f8f.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868200; x=1775473000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSCuUeGQ5Wwf5AGsJZnlfwfrW2VQbpTSMnU1lclD7ek=;
        b=cPxR6xvo1OosRP+Cbamt+4XlzdSe+j1FOo/0bu/GbAzRfdHJ78YROC4hYJLp/7skhU
         +vH7nX2xax6YWUl+kzqCTiCoKo2frwdRFmiTnNwBYDKe88UJZdla4ZlMpz/RKhMe+6TO
         iM17uvt+VjyHSzDfpfUxkqo4aD0VTxfrW0EhcSBMuLNZg/8bWOqsGWZyCWuYnMHB95GX
         fhTyKBtTWHwXdzwodRZA1y8ezoMP1FLvf0frxe2dJrMftW0koWPB+rhpU350gnmoMH23
         DCKY3Xq+bPRvc715Zt4X4D/L0qirIddGjEfoOf3oh7GTim1REGWeoJ4aKzA2+SLhsgWV
         Ua0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868200; x=1775473000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSCuUeGQ5Wwf5AGsJZnlfwfrW2VQbpTSMnU1lclD7ek=;
        b=XuKSYElWicIoXNXSax02NE52PaC9pw1eN/WPOOBVSO9mrO7BMC+XUAeLXk4GGFEb8P
         suvyuj8Gn97BSXLyk7UtjaBccILulRN8tnrSE/GNjp++ZKRMHwvhBCyNchdrM9uO2g0G
         yRW/1bDN0HfQ+Jh5Mbt5sde2pON7+FuS2fpUFkifEiQLuRFx0KLi14O3toO+rlOOVpHZ
         Y9lAhMaRKHLsreHzfi54ckN3aE+SRYlCV4ncx3EgRfLMTu0ANTWvpCZpRBF8MdWCRDM+
         2W0b2V3oY8IVs+Cs9X6KCxfzsVJojKvF+P80NHCn3XHySxRPvKDQdM6X2LWZgODU6tEr
         WpGA==
X-Forwarded-Encrypted: i=1; AJvYcCVFol33yfo5VDV9EkJcHIdh1aiKA/9vZaIc7GTyMXd7Co7fxB/qdutukYoEfpfanwTj/evqc1OYF6bo@vger.kernel.org
X-Gm-Message-State: AOJu0YykMz7QW6lTt38qZ1ZKEOXH1wuvTTVAE3UjOBp9H0eELZFTcrgB
	a/6G0leoCXtXz2oKhe4vvGZWCHJz8jeWpGaDYmuSCrvzpuNMipt5i7nJ
X-Gm-Gg: ATEYQzxyyeJsLv8H1JU5Xkbbr3VE6E9emKGo4JJlBMzV5F3wjMsDaAZoGJ8QWbs9P3a
	xorVEbu4O+CQgRwaiNawB6KuHVAdoREZY9lVXxRde0sdk3Nu9uAQh2jmnmx/55AP3eVy0N3FMMQ
	QTT58ZKY/CMZTNv1GIOY+JniWZ3oBaFyXYEPAOCA++MnF3+HMEqghoryr4XJZTJX2i1BunX8Sz/
	1VO4mrHXhuenxv6PZ2I44HpBy0fwIf84MAedIJBLryOElbT6MgGDYKMrCUSBmKrmxrLAghJmB53
	vcMnN9zHq2b4+Uu6zFBlz5Nyxe2Szh5uyrBDZiz6iYhIXQK6u2SYbDoDB3aRdx9E06voJR/7kpb
	pKhu9fHa/ME+AQm8yb8lnj5LxwO0SdDi5/yuGr3G1VAMdc/Y7SPd1fHPhGHgHc2/KR+oJUphv2d
	DnghHhRXHgqpH9Q5QvEiN4vLlYn9npfsznYlO/eVBG
X-Received: by 2002:a05:6000:2c10:b0:43b:4960:60f2 with SMTP id ffacd0b85a97d-43b9ea766f6mr20597624f8f.47.1774868199956;
        Mon, 30 Mar 2026 03:56:39 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm16376324f8f.17.2026.03.30.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:56:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] media: dt-bindings: media: renesas,vsp1: Document RZ/G3L VSPD
Date: Mon, 30 Mar 2026 11:56:29 +0100
Message-ID: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The VSPD block on the RZ/G3L SoC is identical to the one found on the
RZ/G2L SoC. Document RZ/G3L VSPD.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..5447b9b78930 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a08g046-vsp2    # RZ/G3L
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0

