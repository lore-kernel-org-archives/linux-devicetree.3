Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CF248AE2F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018022; cv=none; b=AakkH5bnKMHAtL3+F3BTFSjxkcY6J6dwnUV2RakS3LAFa1S5kucZ8BUQ+10MI0SLpzCaq8O4qMkLH251WXpoawaws+hNw+S0h09flp2RWbbM3/1pal2AORxf5QdmNvlmWp4zqOB0VfpbmZGaE0vqY6uZKz6FQA6tumtg7fU1ZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018022; c=relaxed/simple;
	bh=tpAXJdZq6BjF0DfbpXDCqiFqjsTUCSKFfSE16ogKceQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNop0Q4BJGs9bGl69HWxcKEQSsVoowOOtqUokSVMkrad/zqh8WDS+W5btU8/aaN10xY4cio/m4vQCQcMY0PkQB9URzDPKrHSQLkvTLTjul14KeaqCNrH8f6Sslk0cDNhOWHczMHXt4EncaxBNlyNe1D6XqsvmKGRVTIsB2H0HA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDBG478I; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDBG478I"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so10319449a12.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018009; x=1781622809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=;
        b=mDBG478ILZBk8Rycj2Q5NuQHr65L7wp5JhR5wTxspx9r/zngFDFH3Ayc7VbnOEzQLO
         AHGOYRKztPAd38+0BUEF3irHU4T+YQSx4fZfDnhZMIk41s/ezIg9rtSVKiLylm9jeA9P
         F81/sm8+zNqKdpD53hg1eCmd4Wged8xIMwKerZkWxUHUOKpUQYmawIU6JYz4qaFRjqjd
         LzxCjONVJMmi/02gh37F/l5M0CP1CSNTucZmM3pOBJA8t0VMvqurSb/cC9mFYRwYherk
         ZERhPJrbhdXbFjFAp5f5k9qpfrYMA5NawbcWfGBzhboMf8HHFqiWWRJRoDtY62iQVuZe
         RjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018009; x=1781622809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=;
        b=PAn5q5OMH1rrfz7H6ZSNP9bpjWRwGtpeSpfvUDnIppHCQZr3bbE3dqmu7CBW09Jrls
         7lcZFAoxyOpRaYj1pta/Q0iluwkXBvp/TJD9fPkjGIw/Wm8JwS9/5bNg7/zsql/R0IYH
         yevbJCxPTn4xuv6qY20/wGb7aUv77RWZyVNBkY6lHqOwfc7hCgr3fv+hg/+a10yQUYI9
         ADHTRMX2w0atsR0NAgPs2SZCaIzK62QDKz189DjoUS7Y/gdpfldoF2bU6e1hZPDUeTXF
         KoQufLcOGAUS006zC/6nkg7q+5fO4vEmpzAB7XjJpoPGZ3vOo7F8FXznEMds8CtGvzur
         mUKg==
X-Forwarded-Encrypted: i=1; AFNElJ8roI9Ffj7SgmyUs1jHY/ut4HpMPXGoeKcMnZzi7yDo8vn4nzCVoPTovdbSrXjSMeb033XL18kJxqJY@vger.kernel.org
X-Gm-Message-State: AOJu0YztCpxjbWNiA5ZussoLzCF7KVpwaI9/Pf1jGOGfflm1WULclz9l
	ZEbF0vr26TXWoSpkWsjPnkHgZhQWe9IWKjt4CX1MiAnOolUVm7iJETRT
X-Gm-Gg: Acq92OGeBDf5XztsTjw8D+vr8ctWQ19si9QIp12bKMhLxXdpke4txQNbVAxbPLTO94d
	gsp3Av2N/iUKAMsJjPwnTXDGCXv/epwQ/jNwLlbR6JVgm7wemjQhaHJlRGI3MrSSwr/KQRPCPuM
	xsWTJALXyinZJKvN/keo0erHodG2Mv8QMb6AHufWLrrcO8zqeTROXphAJoh9jb4LyZbjVlSeWHy
	ZCNvho5UcMsSPoN5v/bqF587cia49PqRkwAYW4gDw89Uts1+zf+WzvIX/koEChNicGg9yTQlTny
	2WOXVKIMs+NTmBU2ss9ANRMVgQPzdI+QBflqRitaWPPcqouGxmMxQSMqoJipgjd1Ahdio8fkF5b
	sgmEm59Tr69yWq7im7Ajc4marSdge1aogzErOzp58YJRT8/gLrsoZnSjNHLvn8LgRM6ZzdtmeyI
	1eXzcF5L8l4Icm3GUQwy+Z8LIdG5J47/c7
X-Received: by 2002:a17:906:cc55:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bf9373dad65mr128724266b.20.1781018009295;
        Tue, 09 Jun 2026 08:13:29 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  9 Jun 2026 17:12:05 +0200
Message-ID: <20260609151212.29469-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 65b67c33e12f..38428b375eca 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index b65f91c78d8c..79a1496fa519 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.53.0

