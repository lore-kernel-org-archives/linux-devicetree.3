Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558222;
	b=14G7YuWtkfPZawq4235MyQBxSJwJqF64SgbhKxd9MVKr5y0ZBNsKUeU+TDheEzZnml4C
	 2nj98EvKQkFfRy85YFYjq9JyegM2fSJxftCQiq+dqkuNW57ryAWWI6QsbWnJlDf7UFN6W
	 DvgPQMTBQFkcPOOe8+ET93e0peORMuQ+4jI+2mapQenz7QYuXYKmx6TOdot7P+JEDrcyv
	 93st6rS/ZCelu/hTyrVBPcggDkA5qZsrSBn2Vh65FISpAk+4uZZ2xV9T3fUHQanvNhxrc
	 RgdXIXdmzPt0HsTlNSlnJaLJLhpeXXprbR5Nv9+XMGUkpyTjjCY9KKtSw/bdlXD4jPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558222;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v6bJWGJV5mMZDYLX31c8NtD1QW48bqWZ0xQYf+Io+I8=;
	b=D7JsuM/kgqj+gENah0ydrM6iefbGZybHjYS40cHldsblndB6hYejvHRUpvUwNyybd+uz
	 7CYwLpf7f7WxVLJSknX3tLQBVPT7dc4JslYKDCXx+yq7CaCMMMdPrMKAjnFWP0RKOWFM+
	 IKLTwEGjDbSbcIMtOlIcYCoeDyF1HFoTQgOkDOoDYW++nN5j1BdEw+EeOrx/xd7kmSCbR
	 BQdue7S9xsQCAdJmkGDjUuTrhkaVn/BYHej1qqd43DynVHi/9f5yQbPBePOWqqCrD5D/D
	 Pu2PZwNxvxCgMUIYvhXAIuamQmmvuLtLo5Mi3cFM6yjL+4x7HSZGnu18y8cdVnoOkiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cn9rH4dx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488960A2639;
	Tue, 24 Nov 2026 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cn9rH4dx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558221;
	b=CeeSYXsAvjy9wxH40o4DYe4X7lDfJt87m5fuwQQewxumDaQpVikiXMj0wtvFStztsQ9B
	 6liBAWFQ59YaV7k/lZntR17kjbdCnhB/OAEMWUtCPDmHGb5+0Wt8cT613QusZ0UXbIiDC
	 ftphn+WBJaJj8YbXOHKhsWtQpesQ27YFOEbcune2M7vlRahgwoN67/yhFUKZFH0Mffkvq
	 QCAFOMaLTXLpgEo3zExApCF/SUIuQMvVJ5OYY7gYB2MH0M2O33v9bqpwiOqNHAbNemuob
	 mkIpGepbnkyIwkmqNXAfO3pXAvXNnpfsDiAXAH4JCZu7CUIowpPm0/VmsG77/3JXY+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558221;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v6bJWGJV5mMZDYLX31c8NtD1QW48bqWZ0xQYf+Io+I8=;
	b=yxClCCv4cFCjIeNWmbuT0/3qxINpPAn/x/bRohwqpBV3GM0tn7BFn4hdFazDgURyNTVl
	 5gg5ALTMz+5yPoN2Rzc/lsXZ4ZQeDaytAiRnDU/DjxkcEdu+c/kDMiBNtmDadAQIObZlM
	 /Mwv4y1mM+U1Qc+TWnlemzFtoQnAawB6DdOK9e3YDp7k0M5D3ue7ZkfnmwJCLTnzCSl6F
	 pMjUPq2xXpsOZ6PZxHH6DP/arXcyqyp5wjL8+c7PG9tIol1qthqGH1IeNYznjF/zTk6Fq
	 wzQfB9DIzcKkJiEjZk+pe7PxyaK3mFKW567Kg/b7GUm9WP3Ow+6QA7eLARaHd73ZNbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86BB61F000EF;
	Tue, 24 Nov 2026 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558221;
	bh=v6bJWGJV5mMZDYLX31c8NtD1QW48bqWZ0xQYf+Io+I8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Cn9rH4dxV97wntT6RzTZO6nEH77XxRbkhcTkpCGLAV879g+OX9xOZf8KUYr26RZSo
	 JyGM5Ev3dlY/cULN0LaTN3ATglwZovQgNXd7mbsBSEOjBg9RNBt4IVDyyLtmehrU+m
	 ssN5OsiP/5paMN3G5hDkPizs9VPC+H1MNj2nYaXXJmblH85+89pXyCqzwMP3kvVesx
	 NosfuOii2pyZAgNlcOFm3bj2OYK2IFlnEIjyD8mXZpIUoged19Zj1hmMEQJ4kgZtZV
	 AWiObd62VsZaNtSDYzHDjjglF48mKatrvYPvYGrWLcEZRawAON8K0IGLJzvIOB2CPP
	 TTtGLARwVxWQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CADC84CBED;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:59 -0800
Subject: [PATCH net-next v12 11/15] net: phy: ncn26000: Enable enhanced
 noise immunity
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-s2500-mac-phy-support-v12-11-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=2436;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=C966iz3saGflBqVM1+r8sZrgsCLRry/KSK6GQ55D7VM=;
 b=6odO8G91jLGqNTePKgtHxLVUmJqbZd01Z89tS+zzSR3StKHNx6SjXmxd4FjZF9ftjrPjjN+aW
 w6f/27zPrIbDFXQqWBxNz/xqykICC7G/uu7NeN2y+7fZtGkzb6XC/XD
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Intercept PLCA enable/disable requests in set_plca_cfg() and set or
clear the proprietary ENI bit accordingly. By setting the ENI bit,
noise immunity is improved and it is specifically meant for PLCA
enabled nodes.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - No change
changes in v11
  - Updated commit message to be more accurate
changes in v10
  - No change
changes in v9
  - Added Reviewed tag
changes in v8
  - No change
changes in v7
  - No change
changes in v6
  - No change
changes in v5
  - No changes
changes in v4
  - No changes
changes in v3
  - Moved as a separate patch
---
 drivers/net/phy/ncn26000.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
index cabdd83c614f..888d74b83125 100644
--- a/drivers/net/phy/ncn26000.c
+++ b/drivers/net/phy/ncn26000.c
@@ -35,6 +35,9 @@
 
 #define TO_TMR_DEFAULT			32
 
+#define NCN26000_REG_PHYCFG1		0x8001
+#define NCN26000_PHYCFG1_ENI		BIT(7)
+
 static int ncn26000_config_init(struct phy_device *phydev)
 {
 	/* HW bug workaround: the default value of the PLCA TO_TIMER should be
@@ -100,6 +103,24 @@ static int ncn26000_read_status(struct phy_device *phydev)
 	return 0;
 }
 
+/* Intercept PLCA enable/disable request to
+ * set the proprietary, ENI mode accordingly
+ */
+static int ncn26000_c45_plca_set_cfg(struct phy_device *phydev,
+				     const struct phy_plca_cfg *plca_cfg)
+{
+	int ret = genphy_c45_plca_set_cfg(phydev, plca_cfg);
+	u16 eni_cfg = 0;
+
+	if (ret || plca_cfg->enabled < 0)
+		return ret;
+
+	eni_cfg = (plca_cfg->enabled) ? NCN26000_PHYCFG1_ENI : 0;
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND2,
+			      NCN26000_REG_PHYCFG1,
+			      NCN26000_PHYCFG1_ENI, eni_cfg);
+}
+
 static irqreturn_t ncn26000_handle_interrupt(struct phy_device *phydev)
 {
 	int ret;
@@ -151,7 +172,7 @@ static struct phy_driver ncn26000_driver[] = {
 		.read_status		= ncn26000_read_status,
 		.handle_interrupt       = ncn26000_handle_interrupt,
 		.get_plca_cfg		= genphy_c45_plca_get_cfg,
-		.set_plca_cfg		= genphy_c45_plca_set_cfg,
+		.set_plca_cfg		= ncn26000_c45_plca_set_cfg,
 		.get_plca_status	= genphy_c45_plca_get_status,
 		.soft_reset             = genphy_soft_reset,
 	},

-- 
2.43.0


