Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84650351C06
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916218; cv=none; b=AB+6dOs8d7Jy7bW+SPnqU38KXmN5INLFiwgoK2rOp4n5vrJAaKHLYbsdf0jxydS7WHBtFygnwIcA6Axkhq5kav9wWqe/3ERcNsmNvSbuNzMxcGt9FnnxZA7bcz0PwDhDIVvC9odtG5j/VIpR/l346DDhZITPrwxKtBzc9sAfemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916218; c=relaxed/simple;
	bh=TPEjDOtOvs78CIkohl1xvcmHiYoAAprmMIWg3FBDWms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoIFawxKzDYZkA0yk5cwhCu8H/bIbTgm1nXcfHw3OFhcjTFs1dHnjiA1Rbr54uqm0OG7WjCI/DVsJOc/MJ9VnUUITBwGcVtyHFP0UIISTuJD9XbZxBkMJQk02P7g2yJTiSSZfkd3BQhgTCQj1D2vdPXs2PN/URrNKTRzTL5RalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFzYmXzl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFzYmXzl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b7612475so6080235e9.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916215; x=1783521015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VcSlzYOxPLTW5jLVJLClqvrOJsBnz819IiqK2l4msU=;
        b=VFzYmXzl9kge2OuATamtFgxAQmrZmWXxNGdnwQsRaxqf6Mp+E0+cs4OIIv3tszDrVZ
         mfiMSRLGDhiKyliaGS+M5G8ItDX2bNALH9Wno3bJw+6bVIFZUlIs5NL3lXBQ/A2zSmJW
         ATDjD88ISmHDo//KfFYHa+OkQQdoTCMp3fczptBkUFu0YAvkXVYtcf1NTzQh5S4UwD89
         yfUlV5jy7FoLuFE7tJBQFFm3vx0Rvp9nAo5RYMr2DS5IPXWtd8Rf9cEOChgpcmDSNpc2
         XhKirRYyHb91ngRU32P/3inDSMRk5h40nStI/2JUKYZ+prhz6gHMud1UMvlk/KyUmfEi
         bTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916215; x=1783521015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VcSlzYOxPLTW5jLVJLClqvrOJsBnz819IiqK2l4msU=;
        b=cl2XvD3U9vJUYva28FHHQuzBkH6de2I0hMWodrEN1yIpM/sFTIHKR63H1Vhd0Z9rdy
         DVG8EsjC+zah0z0qsqaAY/9ElyFS3n7Gaoq/OSis6QN3YZV209Pb557Xf8vc/Wb6tkiy
         YJuzflbD0y9bS8RfpZ+PkrYLbXMMIyB4XbgMrmuSUOi0GaSXRy1x6qE0uA7ki2KXyyls
         AaDey2vmR7zwkV5HT0dQaOUiQaI9BUDALM3uwzXE9vVbCuoMMPU8Cs6DyF1xicpTAI1o
         +aBnpLo3wndlNPJaf518NLmn4xP+aLSroVVUyAdgBSKTF8nRJlD6PfF6RUPZeFxWBlT9
         R+gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xdmrEJ46rf2Up0O29mr6Aw/GpoI+55fswmMTT/hfjxm6Py/eiLFHHUBBOmLFJsD3Q1K1IyfI12vjM@vger.kernel.org
X-Gm-Message-State: AOJu0YxkgNfU7bNBTC0E+sOwOMdGrcS88qYD0Jw3spJc8g5b8MHX859G
	pq88Vrq+IrF/7PfhPoEoXlhHqO7uXhN1XcN4gn5hZNIpyGKUfNiVrPvU
X-Gm-Gg: AfdE7ckseCzMFrsI1AFTHIM7Zdy1f4b8vk5Jpou+cR4ZRTxB14Uj+Ub9ntGMiJ6dpb4
	ZuyfT2XTYgwO8gU9ip7wYVGBPMwsKJvlugq5EYMrb+VWZzvAGTc4aWOH2wttLnXJcAUenJxL7LF
	/S4tvYF8fydI/6uozoAeX0ermhApxlvhNT/9/QpCRIrqVqAk8ESpW183GTDp5/tbPtXJqLuO3J3
	c3FsqArUoMfVPGudqWD0C1c4WG2vqXp59pwgqU7taeQvHO10sGwQu3saRfOMcss2xyJlRDt+xpT
	WzFBCpGkvquQw6m39NbkgKKXl+ZzEsvmijw/fvit8WIE7IWtP9ZuIttH48yyM4VcCexsieOMaMr
	cvx6/g3GPhUsr5UvcfcFw9PTJi5aGMfSZsl5mzfEnQbbhaKY0mXpfzqW3ss8FckIMw2zzNs7zHF
	cwE4bJEv83FPYFpA+GVShjfgW0ZSOo7FVBYFw0WtlduIvWDA5suJtZuU7WiHfEDtlM/lWLnppb+
	2oXUG4ylh/cHdPu/cLRnfJK07E=
X-Received: by 2002:a05:600c:8590:b0:493:b646:e90d with SMTP id 5b1f17b1804b1-493c2ba5537mr24039865e9.36.1782916214873;
        Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 10/10] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed,  1 Jul 2026 15:29:53 +0100
Message-ID: <20260701142953.2014895-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs by matching the new
"renesas,r9a09g077-rtc" compatible string.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike the RZ/N1 implementation, the RZ/T2H and RZ/N2H variants lack
the RTCA0SUBU register. However, this register is not accessed when
operating in SCMP mode using the existing rzn1_rtc_ops_scmp
configuration, allowing the current driver infrastructure to be reused
without modification.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 2afd8251c868..9469160129df 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,7 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0

