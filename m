Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B0347FFE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405415; cv=none; b=jH29uD7V+OqXFYyJpoaVuNM8WMhGoHtttb+ZjBFpQ9KQ65/q2w2eADtly9Agvmq8I3FV8CM1PdGR622m40ktar1X9JI6+D/z59nst4h9g5bKSp7axYlD/5nimCuXJvzIZOsSfwRCxtnERUmH8zoU804c6cnL6AgWA9cJTr+aDj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405415; c=relaxed/simple;
	bh=xHQ6XQWtm/uQmDG4gnrnsHK8rLnojO9qFxm1iB1QW4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ss7BZTR16T8kFH+AO6wdq5IsNkzsJqi5QaSYcRMAAJDrXAr5BuXPTuqytlX9jfy83FArPswbEIk/KCGiOEyY1k9riKR6jzbOmp5qqhXcVyOqsb4FJe+QB38FmV1ZFNBzDIm6pbw5ClFrLYIu90/dAEREMnHlcHVjKeRKSuv8jE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5zf3ncp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5zf3ncp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so2225703a91.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405414; x=1789010214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYMml2DkNP7Frma2GJ2kCIB8Z1oMp3mA1sKgO2NFFEc=;
        b=h5zf3ncpfJZ2T9izzIeNFmDIU0Z1evwgJQPZfngcXhef3vFj3pax6eFM9tddTiQdtU
         CW54hWybVPn/fixhI70e3tOZM1j6V9p7lueKhj/K55OmjcLdnnHjYC47fIHZrzydLLgl
         VPkq6Y1ipJJqlMz8K2bHIVSeWX0cNjouLlGJuNKBA+jByHOND5c1jI8VptWSqEar6H8N
         zNoufZqHW16f/m8FfzcHc2IFZfOExn33eL75R0THRFl/3V7YNvbvPxdMnVo1rxJzWM3D
         g9wCjsr0RnxrXsVe2Wark6lJWxLbfdDMa4w2AO81wmwAA2/zm1p38tefnDra8BfL7pSC
         yydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405414; x=1789010214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYMml2DkNP7Frma2GJ2kCIB8Z1oMp3mA1sKgO2NFFEc=;
        b=GlPVzOOKIA7K1GWGemvI6nMiJicAF0S01YfLcb1RgssazBiSnMLsGRs+VR3zjBBhGb
         PeF/mGhjjyj0qVNmBtLC3wloY1dqCOyghchGVzMfeWa5uzyIN1a74Q92rOvLkxQ5ErK6
         R6F73+yrvQJh/FCAi+QZdDC5DXQKL1PWQ7j0Ytz7vBiJwM1VLpk9atvHRd8Ch8viXgSN
         FvzTvvOhuYqMvvih+iS0cOqP4taIiwmkOXFvvHPiPE2a0W38uX7bfbpHBUimcpolgEqn
         +/0g4OhsXpzaVaCmyDyT5QJEzuT58F917Chf2hBAFV7C2ecqcYe6hu8pMdMld/S0dmBC
         xEKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBm+o+TqGUF1pcgEp4XIakd4FFaG4gYS6umZbz9lbC95RaMXCfaCJOKgkvSI3PHe865Hlj+ki3Gl4R@vger.kernel.org
X-Gm-Message-State: AFuF++lf1XLaB3NqnAKoLqiOuWo5HKqwHYI3IT3FN4SQcUa/8+N5ocqR
	QVqISmXEYivIpXhIDCW02uUQCoybhc9PJBAvrPT32rmazvUDhark8cEf3+99uA==
X-Gm-Gg: AYBFou3O6wEV1YQQmpbdBaPC0JvP2iDgNx+oNhPcOUR3pmpMU/zGcX9t7Q6NAq3qsNS
	jQ6heSU5/0vMEiWJYA0ctOjS9JTuoSID4TOnhDC2zCNLUrvH4yqysxGqWdzeRVlxWrwTq+YxKqK
	cnVFtE0bTt2edhrhNmgzDaFMdRmsapXQckWrlIRnqQVN7ZDpNK9LDemW8TkmjFRN1Jzgi9FI6MN
	yD1sWNjziZW/LnsiVzpw16tb+L/ZU8iPIsbcu4EeEdPr+Y23f3uFRAGmUmuUypPnyuPSX95kkdE
	LZXvvgX2R99slsoOSfnGrtfDTsyHNVZelgQL9w7NHZIWEhWS9Djw3SIJIzkodUfIn4cYKbd+H8h
	if4TRUUlibC8wqyAYi5FeYvhA7EcSLREFId24wj0qhzR3sgOJ5Bil8pSIdsLWLoVoB9KIj1R0TM
	bEfwhGCvlBl3Kowh0m/qEEAZeQJjgAnglDcVpD8/lOm3h/4nPJ9Qsj4SNtbBDBr3uw8uxHiPWuU
	o1z9YUGUoY9ePgxBwKPgtkwlQ==
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr15162321a91.22.1788405413647;
        Wed, 02 Sep 2026 20:16:53 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm2244114a91.8.2026.09.02.20.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:16:53 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v12 1/5] net: dsa: yt921x: Check lock status with lockdep_assert_held_once()
Date: Thu,  3 Sep 2026 11:16:22 +0800
Message-ID: <20260903031630.356840-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903031630.356840-1-mmyangfl@gmail.com>
References: <20260903031630.356840-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mutex_is_locked() was used to check the lock status. While it should not
be triggered unless a bug is introduced, it does not warn on lock being
held by another thread. Fix it with lockdep helpers.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/yt921x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/yt921x.c b/drivers/net/dsa/yt921x.c
index 159b16606f6c..44fcdd47ffb5 100644
--- a/drivers/net/dsa/yt921x.c
+++ b/drivers/net/dsa/yt921x.c
@@ -198,14 +198,14 @@ static u32 ethaddr_lo2_to_u32(const unsigned char *addr)
 
 static int yt921x_reg_read(struct yt921x_priv *priv, u32 reg, u32 *valp)
 {
-	WARN_ON(!mutex_is_locked(&priv->reg_lock));
+	lockdep_assert_held_once(&priv->reg_lock);
 
 	return priv->reg_ops->read(priv->reg_ctx, reg, valp);
 }
 
 static int yt921x_reg_write(struct yt921x_priv *priv, u32 reg, u32 val)
 {
-	WARN_ON(!mutex_is_locked(&priv->reg_lock));
+	lockdep_assert_held_once(&priv->reg_lock);
 
 	return priv->reg_ops->write(priv->reg_ctx, reg, val);
 }
-- 
2.53.0

