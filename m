Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7853750A9
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981176; cv=none; b=O5+2RGHwscYar3wmAPS7Rwl9+OOtwJeN53JluGZ4CHhxa8XKSyGraSHdP6ijo70+Nofndm6TERNbvEbZQ52uf78qcdiUTL3pXwu00PjwWq4KlHEdAPa6YlocIdJovfTVuj77hHShLzwHei7PC1nFFm+aYxqZhaduM1Sy+FW1DNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981176; c=relaxed/simple;
	bh=IrbH0+MeWZS3EtapDOYDSvqhUmoEOkl5mwOPkUGL9QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gC3cPJ7dEOdmFhs+RXIkMWckmAVtclTpcc+r0ZNN2GL/I4OvC3IBbB11hI1Wbs5vH+g7Zs+Foavyf78nOzXatEUg/gK6uelI77SEuNpyLaESIqjiQ5Jq0fikrGqQwOJVGb/VaUS2sUIognIgekWESzMGbAGU0nLsGJY0pfl7Y1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ZkpNDnG1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ZkpNDnG1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c253425b253so282663566b.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 22:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981169; x=1788585969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndvJn5dEKLN+yyXRdH9d+TfDQgAC8xbLM6RYflnahZo=;
        b=ZkpNDnG1+jbjAhKVy7tS8OwZ9MjDPoSz4bAliFawPbD5o+eNk8SNJXH959xIzhv9Pk
         n/UPK2YJW7Og01NL2fdNEVFTFAnb3HLDS4vsB0njz8nUqDJybWatr8EtOEZqQGahvnRi
         /KRr5roBjPAmVRlB30MFLZGnDpjNF2Pb0Pq6d6BgWbLLZzi0rzTb3V17GLY4cv89S5uD
         0PYLGUWHxCqBn9S8bljATC0LqqMS34/+Z7Jc2t9cu4QrrXc1sEMdB18yItXoeIlTiAV6
         frlnWLP99n6ZI0pHne7BlHlV05yeCeu6vd8VV3Y/A9BQASkg5C4zLaQ6clxlEKSMeFTK
         OgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981169; x=1788585969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndvJn5dEKLN+yyXRdH9d+TfDQgAC8xbLM6RYflnahZo=;
        b=Zujcycgh8hW2KEto+Ct52pqfFWdfAckni3qRs1NE6IAxbhMkbeaaAfpKDpVaLvM2Lu
         P0M6VZKxMZ158jUoBB40+LZgIkkiUpxHcxaexRyVUB1EZNcKLNKvsGsx12ouXfB6xSHZ
         LuJws05sXX3588GulwiwpIcnPKShn/s5j7uAgY1x29+y0O3fGxODvlGzA0k2GK/e/3aK
         yrdSe/sp9Ds6brEuw+PSCyeT1n4eMeld3FjFjCiFhuw51GcUJd6TuvDs/wmUAjarPWh7
         3Iu5mgPttNWUD9TwBELOAgxgZ2RCAI85SrowSjfnx5MOQHOsztBzB0oIYupzDRr+0qeL
         5FFw==
X-Forwarded-Encrypted: i=1; AHgh+Rqgyr0kSDMixJYzVnA975jd8++2GLfM7K0S3mfBpKTuQghpHBdIgMbU3vKdT8kFx3wqErcvH6tkMgjS@vger.kernel.org
X-Gm-Message-State: AFuF++kIPAZc6WQr8Vr2o52BM9PGOj4PoxB3scDq6jvMNUERq4momI6U
	XqMoc2o2rs1dL8U/MV6BFwkQD1z5G+2M3cfsY8Yb/r9qG44NJ5L0atZ+fRTBNnn8ZM8=
X-Gm-Gg: AR+sD10yNA7ZoJWsrGZ5/1ANMPQCf5XG55C8dXwyLkAts7Nbt486j9tBo5lhsO/ZXjx
	DMfUeEM1uGz7w5LM5f7Wg5SJBD2fDd/7TK3Y/4Sxo/KwWKzaMRG+mZ2iJfmbgxIrVUtAtFOMVKW
	GxI0qaqH2VmWoCIORXwXqE9lf8jZC2/KPb3Cy/6tXYNrLHCSGGqE17opKKoZuJwg52FHF4t3oi9
	XcUzaUmE2RA7KjqKykYRLjJ+1U8VTraaCPRTRtjTZLESkkhwPh8Ngm0HJYtNUDfAYjKFCuPghvs
	AbRqVkshK4f1BmIpYJU0A9kkZac66EsWbQwakcr0glZdNc8w2Y2ql9GMvhFRdB72GL+j5y3azRO
	79SjTaaR/LhRO0HYlOE3N0YrJLC8NXj43M1o/22dWzama9m8yj/JpDbBgBfXkKeZhgdR7mDugYZ
	1tXa2hJajXnNmWnYCacfszzxA8NbSdVfB9pqxZebbFxSlBGchgZroV
X-Received: by 2002:a17:906:6a05:b0:c25:608d:7934 with SMTP id a640c23a62f3a-c25608d8c6bmr644259966b.12.1787981168897;
        Fri, 28 Aug 2026 22:26:08 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:26:08 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 9/9] net: phylink: report no link modes while a late PHY is missing
Date: Sat, 29 Aug 2026 05:25:46 +0000
Message-ID: <20260829052546.1152446-10-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port waiting for its PHY reported the MAC's full set of link modes and
accepted settings for them, which describes a link that cannot come up.
Report an empty set and refuse to configure, matching what an empty SFP
cage already does.

The EEE calls need no such guard: they already return -EOPNOTSUPP when no
PHY is attached.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phylink.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index eda7b61ba5d1..6fbd1fa0be78 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2284,6 +2284,12 @@ EXPORT_SYMBOL_GPL(phylink_connect_phy);
 /* Ceiling that interval backs off to once a connect attempt has failed. */
 #define PHYLINK_SLOW_PHY_POLL_MAX_MS	30000
 
+/* True while a PHY declared slow-to-probe has not been connected yet. */
+static bool phylink_slow_phy_pending(struct phylink *pl)
+{
+	return pl->slow_phy_fwnode && !pl->phydev;
+}
+
 /* A phy-handle has resolved only once it names a device with its own driver
  * bound. A device that is absent, or present with the generic driver bound to
  * it, is equally unusable: this is the state slow-to-probe waits out, and both
@@ -3106,6 +3112,17 @@ int phylink_ethtool_ksettings_get(struct phylink *pl,
 	else
 		kset->base.port = pl->link_port;
 
+	/* Until the PHY arrives the port can do nothing, so report no link
+	 * modes at all rather than the MAC's own capabilities, which is what
+	 * an empty SFP cage reports.
+	 */
+	if (phylink_slow_phy_pending(pl)) {
+		linkmode_zero(kset->link_modes.supported);
+		kset->base.speed = SPEED_UNKNOWN;
+		kset->base.duplex = DUPLEX_UNKNOWN;
+		return 0;
+	}
+
 	linkmode_copy(kset->link_modes.supported, pl->supported);
 
 	switch (pl->act_link_an_mode) {
@@ -3173,6 +3190,12 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* Without a PHY and without an SFP bus this would configure the MAC
+	 * on its own, for a link that cannot come up yet.
+	 */
+	if (phylink_slow_phy_pending(pl))
+		return -EINVAL;
+
 	if (pl->phydev) {
 		struct ethtool_link_ksettings phy_kset = *kset;
 
-- 
2.53.0

