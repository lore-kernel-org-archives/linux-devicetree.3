Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67982274FE9
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 01:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621263; cv=none; b=srYUB+Hnt4ak68Ma3oxw0A7Gax1jOfkZB7Ql+V1JTAcVh2I6EVLU7EhbxhOFkv8xbzvYzIYyXK6awSo3Wnh48g+DzqFxjWj0hIXpUnHZ87Xe1ki8mQOA3yn2SSnp3NTRRT86ajNXtFyCdLWGtYp8f/teob36ksyu/dJRxoKe6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621263; c=relaxed/simple;
	bh=aIq/9ufivsXPLWgxyepAcfegpx7woiOwGaoVD2ffqhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpm4zNMwikUJGFXDBJM2SYEG1Fv0F7HwsMS/uNL+1jrw7XdtTO5PR8b+DG9GRFawKETkbOJp7gYkfkhibcfPqtIGcFnRaZW7cFnUPhdun89KnvnQlTNLivKd5TI/2OLAbRi5ZMUrbvnwkIMlx78UTG3esSDscvCNcAy/METBSA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=QmWrmb4e; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="QmWrmb4e"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4854d5cc708so851973b6e.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 18:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621244; x=1781226044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=;
        b=QmWrmb4eZRkT7Iv6epdW6VuHDutBj+AaUBCXhADnZAOgqQCAHLeIuNF7uQssyG1l4o
         dqnkYsfbdOwTLsRXwSPfyK/+K+oKhjxTmRKe7Fy/T9QwyVidQoUp+A9D0BFgEVzNW7jS
         fg/xVrzCXhDgcQFeLYiKri3r+5Ojad74jLhNAx9DmOybe5ER4VZr5G79tuFBcdAdd/w+
         PAAxm6+NYHagd/Nz9AOpic3RHpGEvUBq3x2KT96pwtKKLgJbT5QoOqoTMN1nMwXORAkw
         zmwYYLr2OCaih3f0WZeF79iWTU3EDIYqYILZEhyf4QxbfMgh4BkLSivXzd81ZSqdcDl2
         hJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621244; x=1781226044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=;
        b=Phg9y2ikRgwSQAL1djpxMntuwyl2IFiYX6FMMcivyuJojC1PVr0MtFL1Mx0PyE87iw
         1u7l/KzMi33JdUHaAnE4cWoOewrOlFQPUq7VcR0VjWFtT7u7wNIQeqJPyb1Ar+2owR/1
         soMyQmBI5WleODQiD1Hmyip1sDXS1Y9BtVHrbHS5k/VQMBYyN/rzMw+5GGcJzZRxQs91
         17RO3SYYMThOU+yOadEYIREsPmjcR5EWfxCKgnOiFfiI3337O86Ej1JkiO4YoGa3OBvI
         1Pyk6KAaFKsVuvvgEIPVGj/L3APuIrxr/5V7N/golGCxpsTjckQtPXKuWTyWcHiECnba
         Fteg==
X-Forwarded-Encrypted: i=1; AFNElJ+9+J8rCiOoX6BIbOaw2qzzJBCwvJWaTCC8OZrpNC39VDX1xT1qlaegv0il4zZyPNScZkbd6Sz5Z1vL@vger.kernel.org
X-Gm-Message-State: AOJu0YxT9K9jeyxXvbxWtYPmhZ8TyCXHdK3l3cU4309hp95lhfa7Fbki
	NugyKXtO+6nbVuOZi67JoiLTweJP0FH9gm2jdw+FKI/KT0wv3d09diffqKBT5AY9yI4=
X-Gm-Gg: Acq92OF0CjVAhVJdz622OeCSOUQoRJG5EWf+nkRvwpVdQ1V7uoNAsaYsbUbB7QjHA6W
	gWqW9xmhSPbCkQ2QDa8Gs2xwWWV6dl51Pa5sKqnI0zwCn1f4qPPLHuh+EVoyZfcdoMOqak4y2eq
	2aAuYoCIP2BsYyfE6aSEnkFk8mK12J0L1t0iL8AVW2+8sUCthfd+KtEmATNbcjazpDmTGsv6qjB
	yq/QjXr/doI4Q361TWJzNSY/orffr9mxCZjNdqqsaTU53xoaWb316pnVJu45w+ZfyD+fJuhWiSj
	yQDtGz36kRyQNTyN2/O7xAf5I07Ng27fz0YQbA9GFjSn8lZlbslq5gjEVmdN/6s5AH187SaNl6W
	09EeL63+Eno+Az8IBukOL9PeKDAlBmcSoIAzCb+vemtMzlWlyGlHGD4QG4dY+HZAn9Jjf/teHBD
	6ZmpEH4yrvK1j5SesyywhZrkwpob8FqGz6SoHTaA==
X-Received: by 2002:a05:6808:a599:10b0:485:a99c:cfe3 with SMTP id 5614622812f47-4868df4dd74mr546927b6e.42.1780621243759;
        Thu, 04 Jun 2026 18:00:43 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:43 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 05/14] net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
Date: Thu,  4 Jun 2026 20:00:12 -0500
Message-ID: <20260605010022.968612-6-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Currently the XPCS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 2500base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081).

The problem arises because this XPCS supports 10Gbase-R. That means that
the reset value of SR_XS_PCS_CTRL2:PCS_TYPE_SEL (0) is valid and this
suppresses the modal switching based on bit 13 of SR_PMA_CTRL1 or
SR_XS_PCS_CTRL1.

A fix for this behaviour is already implemented by
txgbe_xpcs_switch_mode() as part of the quirks for WangXun devices.

Rather than introduce another quirk for TC956x let's attempt so solve
this generically by setting SR_XS_PCS_CTRL2:PCS_TYPE_SEL to a reserved
value when we detect the right we detect the right combination of phy
interface and XPCS feature support.

The generic strategy adopted requires the default value of PCS_TYPE_SEL
to be 0 on devices that support 10Gbase-R. Based on TC9564 documentation
and the logic already implemented for WangXun I believe this is likely
to be the case for currently supported XPCS devices. Sadly I don't have
access to generic XPCS docs to confirm. However I think the benefits
of avoiding a cargo culted quirk outweights the risk of regression.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 76c04372b5b50..e58103ae8dadd 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -705,10 +705,49 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
 				      phy_interface_t interface)
 {
+	int mdio_stat2, ret;
+
 	/* Wangxun provides a full alternative implementation to handle quirks */
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		return txgbe_xpcs_switch_mode(xpcs, interface);
 
+	mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
+	if (mdio_stat2 < 0)
+		return mdio_stat2;
+
+	/*
+	 * If this XPCS supports 10Gbase-R then that will be the default
+	 * operating mode. There are several interface modes where this default
+	 * is unhelpful. Change the operating mode for interfaces were we know
+	 * the default is wrong, and restore the default otherwise.
+	 */
+	if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+		case PHY_INTERFACE_MODE_2500BASEX:
+			/*
+			 * Why are we writing MDIO_PCS_CTRL2_TYPE + 1? We want
+			 * the modal behaviour that comes when we pick a
+			 * reserved value. XPCS allocates extra bits to this
+			 * field and allocates values from 15 down so
+			 * MDIO_PCS_CTRL2_TYPE + 1 is the value likely to be
+			 * allocated last (and hopefully never).
+			 */
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_TYPE + 1);
+			if (ret < 0)
+				return ret;
+			break;
+		default:
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_10GBR);
+			if (ret < 0)
+				return ret;
+			break;
+		}
+	}
+
 	xpcs->interface = interface;
 
 	return 0;
-- 
2.51.0

