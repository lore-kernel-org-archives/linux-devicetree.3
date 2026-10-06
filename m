Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5699B3EC69C
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290872; cv=none; b=aIunwVMiWErU7LChNzrpOStRJ2XGD3/s0EutNUYCh5bL5kX/fNH5bOwGb31iYxgPQ8XpkMS/LgwaLfm9dP21qBEOWr0HNUE32WDbNPm/f9IrUyfyn3JQYl53NmhG8dw18l0NrGqBtz1uJ0vkh+Bs1oESFhO+CLxg4P+8B4aBfzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290872; c=relaxed/simple;
	bh=8BEd9pOmcZGMI9o1dv26yM8HUC5GCtUJRwGdm5AKk/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWo6ZxkcpW0EfSgaNREL1DGNu9QB0P6KAXjqDowYjT1CDkpAprzP7ptvVelbMqRgaMQYvjkZ2dXQG2rBzaotFRapEjhspx3yRSLOWERufvu7aWS708c+F3k3VOhBUQ7eJCtjbz/Z2OfBfZWU2qwT7mPE/+UgMXB0mPagYV5OcQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Q6T8ZaDG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Q6T8ZaDG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2898266f8f.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290863; x=1791895663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=;
        b=Q6T8ZaDGBQalq5djdVaWXQdktxralCcEzEHUyls7DfUmEQW2Ra8vNLQ3s2eX5N23p6
         Z4dBz4/HE8GeAH86foTJ2eYONGtasg7k/6Y/Yh3GV+8vzdbSK1eBReE93iKQvjzfDUf8
         FHBVG4YjcyQuUOlQb+E/pUMC44QDRbbu4hNHvmMXq0O9bsFubTg4hzXREPsdpEVjysXp
         BVfjT4wKNhFTWCqmCgGPLa+yEMNLrU9nLH3tmJQFKKwpGPwcTc3+BbfEppAi25b/N0em
         g884yTzW3QJczyUoM+o8Hf7DotaILrkNsikGHJuV/mrSPV/bpOdFZ+R2521ZXIcr1Wqa
         hqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290863; x=1791895663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=;
        b=T3J5p4BHuqfSxYR7elrgp3n1AJ25Rag3es/2JmKbrhQQZyTqrsmD8LlTiu78wYRxfH
         DqJdTMqE7m2L94PlTaWZlS4DEjuEfh7tD0rweJW7E9x6CQWvh8i1/GVytgOXQqTqRUN0
         Nfm8WmEE9HNKmtFw1DlxcIvCPezqPGWwamTenYdaiJxvAPvCtIvFmdK48fxsRklfpkpo
         AlV3IZh4SrLM1gEYVFqw7qWRMtbZfmGwVgNuHd3mmF0tGiK/S+lkl5hvccVx1hIBFLhb
         ZKAbrr6Ih+I75af0MC1bEbtKHzOA13IEHKghK5fJWiv4tNsysFemanFM4KbypJncEkRG
         lFRw==
X-Forwarded-Encrypted: i=1; AKwUvBz2jSkmXly+k1bTl1Hv+LquBOXdxtvMljHyLwb/EbS++zVKdU2HAvgA3fln5a1zGwqKgRG1wBnuZAQf@vger.kernel.org
X-Gm-Message-State: AFq9FYLYnCzSrx1c+7eNmwTkEubaR25nCfigR421AKnzf/nMEEIN/uNK
	vE1FnolmlSLcM/MRJFNPRp8A4pbtmjudXovTDFUJoZGfXRvcdXB62Mz92ubby2TGQPM=
X-Gm-Gg: AYBFou35nedS5BVy0rAes2Hgcl2gqI3HFYdXIPjdz3Y+Wvu85wZn2NBzx3KyoTnqAj6
	ZqRdNAbhSWby5eUXZT6eAGoMte8N1PwkX2IVYkliVitlbrzdA0NvqFV+FEi9B5mgLvmsk+78Em0
	SXT96EsYnYKBo1gtquH/B2bbcClhbVrArk7569zfAsrB7vkS4PU8b6kJo7EysOXcOcalfj5mXwG
	BwVw9g1rjW5N6EKYlXAPxVlobkN2Q9jPrpn3lEIt96gGarm2SsezzH2kGNmuma+KPLX0P/c3BKz
	d6nNqnTRm6rlXMUtynLRYEOK/bgfCchk0GzTcOZ6nGcVu3jRZykqbRpfIOGXOGTCKkq68Arzp4C
	CrM3bkdq2vydrEeL9nHP1i2PjxPUOdwaU8ekg/RvjW6VQMysU27vR9LrZoIMSYzPwwwEQaGdEk2
	wQCQrZ6hklYOW4OY7QHAfTeAfFMtKeEAQK0qEqdz1qZIRrZT8Fpw==
X-Received: by 2002:a05:6000:2510:b0:48b:2a1:dfc1 with SMTP id ffacd0b85a97d-48c6d17d529mr2163808f8f.22.1791290862711;
        Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 3/3] net: dsa: let user ports wait for a PHY that probes late
Date: Tue,  6 Oct 2026 15:47:31 +0300
Message-ID: <20261006124731.1528963-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
References: <20261006124731.1528963-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A user port connects its PHY once, when the switch sets up its ports.
If that PHY needs firmware from the host and its driver is a module not
loaded yet, the port gets no working PHY for the rest of the uptime.

Let a switch driver opt its user ports in to phylink waiting for such a
PHY, and opt in mt7530. Until the PHY attaches, .port_enable sees a NULL
phy, so the opt-in is per driver: qca8k dereferences that argument, and
gswip programs the PHY address from it at open, so a late attach leaves
it wrong until the next open. mt7530 does not use it. Shared ports are
left out.

Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch), where the
EN8811H behind lan4 has its driver on the root filesystem and lan4 was
lost for the uptime.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v6: the dsa.h comment says .port_enable must not use its
phy argument, rather than cope with a NULL one.

 drivers/net/dsa/mt7530.c | 1 +
 include/net/dsa.h        | 5 +++++
 net/dsa/user.c           | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4e6f..e4c155605e27 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3548,6 +3548,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	priv->ds->priv = priv;
 	priv->ds->ops = &mt7530_switch_ops;
 	priv->ds->phylink_mac_ops = &mt753x_phylink_mac_ops;
+	priv->ds->phy_may_probe_late = true;
 	mutex_init(&priv->reg_mutex);
 	spin_lock_init(&priv->stats_lock);
 	INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..04b151cd52ce 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -455,6 +455,11 @@ struct dsa_switch {
 	 */
 	u32			dscp_prio_mapping_is_global:1;
 
+	/* Drivers whose .port_enable does not use its phy argument may set
+	 * this to let user ports wait for a PHY that needs host firmware.
+	 */
+	u32			phy_may_probe_late:1;
+
 	/* Listener for switch fabric events */
 	struct notifier_block	nb;
 
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..41075bb74193 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -2661,6 +2661,7 @@ static int dsa_user_phy_setup(struct net_device *user_dev)
 
 	dp->pl_config.dev = &user_dev->dev;
 	dp->pl_config.type = PHYLINK_NETDEV;
+	dp->pl_config.phy_may_probe_late = ds->phy_may_probe_late;
 
 	/* The get_fixed_state callback takes precedence over polling the
 	 * link GPIO in PHYLINK (see phylink_get_fixed_state).  Only set
-- 
2.53.0

