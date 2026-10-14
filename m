Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C22511E69
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983957; cv=none; b=k7EW4TN47GgAXzkCk6ACp0oPx9OqxmKo2ibDp9KBUh7i5rYrPTAnczU6Qm5nguzHMtKrIZ7k4eYKj5qSu+CLkU8pFdtrMgnb+OutSaCoy99oJ22T+AjpS1OL/9joKWr/Yvpfu97Fx4TYFBKlHsN7mxrhv+DEqOFj+IQJXyes1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983957; c=relaxed/simple;
	bh=wCSHkmpmqNds19gvHTj2g8eLK1v77hJYzp6d27iq/I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IskwoVtWH9BrYJuQrbPgofHXsZcAe18MzZ/6JL8xA6gTaEVmxmagnNQOxJupZYm0mQmV0YFAh1jq3FNQ8l4yk4NV2s50rxKb58jd0S4WosPJyoCw9bXuylZcPP+vZgb7OeQEpzWTN/02jh+CwWu2iNJDBDrh4uhsx0L9+wG7CYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+IAe1kE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+IAe1kE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso29488125e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983953; x=1792588753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3mIZvb9NSu/NJ0MJgWC5kXaVTnE6zGUGGsd2cXGCbI=;
        b=Z+IAe1kE8/3Nkjw8lPdz1EUArIVRhKOCLIYU9svGalcW68F4eWZmWPRPA09vHQyUdk
         YHIRN8KmIuUZDGikVUwLW48srtI48t5VuladhwBmnpg0k3qDIdRVYcIbz5YcBblzO0T2
         qMSpSfLxEmTgTsEUBt6ZM7FZtSrsRMobm65nfHPZ0wBwfLLronnlMdIg/4IxKwVKdfXZ
         HSKzs33CF22Tbj7Dlz9DKJ+tfMTOiM+FOtKiUf3LOZbh5NEQiUnP2BK3iH1+96gcRkUx
         B01+9VQng3/02VdZfGyjDf2DedEaHUULqkQ9wzaqJgC2HXWEAem8UAl3SiCLFnhS1okR
         A8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983953; x=1792588753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3mIZvb9NSu/NJ0MJgWC5kXaVTnE6zGUGGsd2cXGCbI=;
        b=BcX3JFgu7xKB/ie1lhykkn5QZfPZVDNmSEwKohrPWJTBl7JwvuW2DYYCdU4zxL5d59
         LEKS9pHyP5S6Z61YyakgKLJbV7bMjErh60NJjRuqad7aHNFOd+ZUdoZ9PsEE9g8QVo2k
         KlshTpd8JBlHqV0tmqPYwwLgSZ1uXN4eLsBpd95nZXeEjuDFISnSbcxM3O0uhuGg7Zr3
         BDuBwWBF7BuX/TlggG5NA7cXZAFl380MnpvR64NoOVOsr5zL5hQV/0XS2Tq4MII4tAYF
         qWNAq9Ci/Z7jB85cLwrJ8+TckbhwitBLuIm+JNhGPJmZz+PH3I830BlULVb0o1pJ1W24
         qU2A==
X-Forwarded-Encrypted: i=1; AKwUvBzepuJL2fc2RJ6FCUZSg0nMbVfmv1m1E4cIWKAuxuz+KK8USscSFfchnLkdu++VIuylIoPZOHWdkBwu@vger.kernel.org
X-Gm-Message-State: AFq9FYKYDuId5DhmmjHEvhnrZL411Gs5KOaNz1UAa9Aiuef5+S97kkhm
	/vOvCpAioefVyPd71+jF3utdKb8H7Df66gVBdGBE/f9XK8DfeDC0H5qQ
X-Gm-Gg: AYBFou30pGyXPoPphSUwFaE74unFUkMjyVT6S+WHvRWV4GD94metXkDiPb0CiLNb2ZC
	sCyXT9dAnA0EhzSy4Sqvm+Fvg1NMh+ZYG0wXY39dX6R6p1tMkvE5W+C2Y/0psIiq9q0pfKnAFnG
	Nud9rr+snlY1XkvtyFCgB4A9MTw/ZykdDhegUw8+PRmsSBbulPDXmN7BUjxkBLoA0XxlwP7ZLVi
	MlfjSFh5k6MGWyvbo2mpAFMp0APmzxYDUzhoh564l77KLZju5NwF0p23eGFXFudMuJ0VKud9HwU
	ZzMi2HwTcqX5E5F5sNrems+B3t5C2TOoVyI7f7EQexjzp9jMfBzub01wH2o1x64ZAm30nqdoa2m
	T4CN7hlJ5o5bnsB7MzAxBp2dEbZXaWjf+4nOicXjMnlX4+Mf78BvpweJ8I92H7m8xe7ABmG0ctu
	CAxAvRnTNNVkcjOHhimXOtlwoDPY45ImGJmC+BGEdsvKck7+nTsWq9OM/bXTxKPFXe40BMlsKv9
	oBUUE31Bym9ip46fENjuHuDYwkFv+adJ3hEV7HM4ncG1tsXUJyLDRZ/91i3MvOoqhmv71AxieW7
	9ut/Y8MK2qQW8BKFE5ilHibFqtnP
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr289780235e9.21.1791983952579;
        Wed, 14 Oct 2026 06:19:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 01/13] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Wed, 14 Oct 2026 14:18:49 +0100
Message-ID: <20261014131906.990077-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.55.0

