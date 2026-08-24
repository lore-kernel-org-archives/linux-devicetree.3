Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847153A1E81
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558396; cv=none; b=uii/h+qccJk2DYXhIK7vIbKBxC8+vv/wqiQhMek4S/pOm9RRbycFxEFX7kACZ30W3PhyyjVNNGvFKHQlbrEhEdWP9Lq2MkmkIr5qE6LQm+qVHFK01MSVWmicQWZtDxPjFovFF1SI9vt3136hObzewOsa4wEh3XTqQ942HqDoJJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558396; c=relaxed/simple;
	bh=rp+33HlvXdrR4jBpnqFXAKUnjS3azU+CWF15NRzI6tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miPk0uuZK5isDPHth1OcdUZFs+z/cZpith4X5sGhnzkeJGRcjtUzlg4yup/EC+ZdE6Ff1YRXr4U1s5XDUlg+DlizwcYTfes4w0UJmLXDYno1ZTP2bsWLQ7bCyN+ZYGPLKRmLZ2ltOopI9B+ZA++Cu2O0ZUdCMP1X6d7xNFXbbl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miK2ZSys; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miK2ZSys"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cee9b74ee1so24971565ad.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558390; x=1788163190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhpulUp5XMYUwS8wo27AeeCJj0S9L2O5+74wjdVfnOk=;
        b=miK2ZSysGOuua+vwY/NDxgY2RH5ya/I4PhQAcUHQ6jTYpyh4yBfXIOGtpVKpkut6yw
         Fk1b49dDO8xl2iTQc/dIrKjrExvI90497OEfPlzSMD+yVLnOt11rjjEcwiz/IIYchkXk
         Q2qZSCMaUWp8HrFIrKLJmJ2WwPVNO9SyxvPP8dfn9t/e7ScCqzdGwH5uqidAihLt39wK
         rvPm+NTHkw2IwXvzo1ZYqfj0vnyrSxl93j+AotbE1EB5tDH0gFSi6N71Bb/JB51ZzFyc
         VoFBphPDcs67smOPjLTxWW+OuuFmX4pGlZZIEFPLFyyFJcyAuI2i+SntOXmSypkMh430
         hRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558390; x=1788163190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhpulUp5XMYUwS8wo27AeeCJj0S9L2O5+74wjdVfnOk=;
        b=Av1p4IYD/ZfpM1xFi709snW3dQ8J4gp4p9Byn/W/OqMu4PGTjFqbkX3/qn8Ijy+mSY
         d5ABD55HFRI4gcaYt/8AlljJxXecUZ8ls309Ou+i5AN5MZhS/R7W0LitWij7wsNXzpaG
         A1nVlN76vzCUhFnU3o97ogNU3yuJbqyXoi5bmgruMkq3CwbSS+pHkE5uRJvk9Nq1HB8I
         ge+swfJb3LDTYzltwa8no+zXkcTPqJ5j5+WcXS7MNccLNLwURlsk93AjktG/XSnD/JMF
         sVkj3kSuGmdZFrMaRbulKVn4qMFpccTg2tqzyBS4l3mJxAISbFOXdYEqoUUShe8nqnzI
         y3rQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgOtFF3zJBYni1+4ptL6mQbYLifrSVNudA1NGrZePUptInTIy+s/CeSPu8Fn/nYUt0pEFM3ZWUPpjL@vger.kernel.org
X-Gm-Message-State: AFuF++nIbcKekkK/5Te2E69MdfY5SNXeMzhXIrFP/n22/mR4vImxwAII
	HOjHtGPnTATnVMSF60us0AMKe0to21lh6q7pDAnXgYEvUGXQ4tgGnUH7
X-Gm-Gg: AR+sD13zAaf1HEEz5G8xtj03ehzKkRH6r9N10WNzX2F5KA+kJmra2IUdrgrvsz6BM5U
	AivBwhYszMwLxagPbrr/fSwWQLBlf6+JXYsngn8U1N0uZaXvocx7s5LtoRjj0SD3z/Rsmq/NdS8
	qS79ETuKLJbiuws/GMOxQaUjOsCMXSK4RPFhy1fp1hE++NuGxEiDKIbG7uG9wP2XbrJk46TE5iF
	dKzGQzIw1UXwd/6p6dtf6DW/TArKSaLfqhXp6B1DRfkWQG8gBI1a7VyETAP0gtKCtCJTXCCZ4wo
	UuXQLfaGLFya8oVQQ67qeRJvY3d//yN12gSgMjTnaWatFbl1eJvPhmPM81/ux1227jjViM2jF2+
	YR1DmziEFYnF6BNRZqjgUJzcyBYrKq4AYbEe0NBk6y8ad/5vBASYwKt2+QsHUuIwDrCwADzbgXq
	83XEiczkNWhVjT6eyB6hAsmPFIBlCDJe529wfh4rrRKGRkSU1EC7/lfXeEM2EbEHCQ70Puoq668
	nw9eGBYx8Kw/cBSP4dXGmrYHFjHm9cTTv/Jp4LgvIB/8YHp8qnIDyBvBgA2PnA+oggaxpSkBaLQ
	k58QeDBj
X-Received: by 2002:a17:903:1585:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d670bf23e4mr287219305ad.7.1787558389563;
        Mon, 24 Aug 2026 00:59:49 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:48 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Enable RTC support on RZ/T2H and RZ/N2H SoCs
Date: Mon, 24 Aug 2026 08:59:33 +0100
Message-ID: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds RTC support for Renesas RZ/T2H and RZ/N2H SoCs and
enables support for it on the EVKs.

Note:
1. The patches apply on top of renesas-devel/renesas-dts-for-v7.4 branch.
2. The RTC driver patches have been queued up in the RTC maintainers tree.

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Add RTC node
  arm64: dts: renesas: r9a09g087: Add RTC node
  arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi          | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi          | 13 +++++++++++++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi      |  5 +++++
 3 files changed, 31 insertions(+)

-- 
2.43.0

