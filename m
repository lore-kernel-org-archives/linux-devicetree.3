Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AEF3D3488
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650878; cv=none; b=XtLI5JZxS3xY3cwDlyVQ60Wl2/L0bFPazXdx3svOum6aoCgaElGKsS1qXQrryEZez8Lfgm3XcYifD8Yc4voDNT4gmIjt59s2L0a2t36tYOxkGJrXu/5ZBdJv8MPdnfE6gLj1QKzXcSAeQXzLNRdTZn0nbFbJxmTB0He0B3aF+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650878; c=relaxed/simple;
	bh=FecQt5wh6wqUypR7GIOTL8vQl1Ce+BG0nyhOWnwbzHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmhLTgyanSTIfPdfOZceZe4tUFlyKukABqOUbyre5SRRqGiXkA/2C2WtduCZt3fI83jDMyRcXEpXuOPUrjZU8T6eLt/OhpuulyDnt6oKfrneJIu68/hPPULkJIc8KHWeCMfR73BVNuBW1Xi6NAsdq/wO+EWdYfAsK3i4dJJCWIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tNcg/P1P; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tNcg/P1P"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a15ebb3abbso25852036d6.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650875; x=1778255675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HU0BdifEzvMmdb0M7vix3Brd2gKsWcYWwUTy3bx7+E=;
        b=tNcg/P1PC+kwjWrj+0nDkm12iH83g+0LHIXYlZK9eJvfzDn6Fbx2ejBpmXkXWEbJzi
         dx/ij0rAWyHvUW4t3j57Lz9to9iqAvr7Kb/rbWAmZSR604/Wh4NQ14zcJxh0t8PSpdhr
         3TsOZJxn6w1Hy0Vgf6LaQdO8Ce7xKOmPUzRYOHsuj99wMrM2L5S2Q5VhreaIDRppxEG5
         xc0C8J9QL3TlM9akv6ha8pEaXilam+JPmyVG2IZP/Locgn5ZauqbTgbhqbKPDMkbQZye
         qqpYKADzZgQb2uDeCn6UUt3OSuUNzwKqW3z5MrQEo/NxhQdC7jeVuUqna/uqMsmHIqZ2
         mhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650875; x=1778255675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HU0BdifEzvMmdb0M7vix3Brd2gKsWcYWwUTy3bx7+E=;
        b=mz/3T6db0cMSsZUMDp7RUONyhVd0o2horr7TAhYNMegh//eY6pwxvcIhJ9ceoXDjh7
         Y3LREcAmKHambyPYn1xbd8R6+KJ6Ag+lUO1y143X//N4V+fgWcaea59A44JQzKNDCM6W
         xlkr6SAW9imb4Z+EhXg1ssUXrojGz6LSdXopgbmx/KDXbvCR8xG/KfW31uHaw7+26h55
         Gm8bVtvBLfBOFgXawSvX6Yn9QNV1Z7XPbhCqM8gmNWA48Ht1MbkVoREPPKdGfIc9g3Yj
         HcxZZo9TU6em74sXZtobMMRTt+3w12pFtZcvqx5dQmjYrfdiqcmrq4z/xBCFkAPZ0TpX
         A6pA==
X-Forwarded-Encrypted: i=1; AFNElJ/1TRnOVhA96UW22UzstKSgmyR79omUREbck2e8bJiSHmqpQ8zYb66Vl9JaQ0LzNwbX0paKMSOfCJwb@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXRxyUNNC1cvAlAf3LDeg/e4bG2mGz19oGWqjm0djO4El/SYI
	dlvvRjpLlF6PefNT3b8nNPZjcyDMcgJgyoCFaoXZeuUziIAXpAEZe+oz30xpsvDp9nE=
X-Gm-Gg: AeBDieuH5DAKschIdVTpcWuZwjsMSc7ZfJYAyBODylXOoAA+9Nu7WIiWACHeglWnMSN
	kpKsjyFXC1WTwvPWoqhHnr8NLOLFM0Am7czpN4OMZuTCF9uXrA1Qe+y7pSIrwYrwDw4H7jJ9LID
	qELSbgnu9kRax0RRU/M96tqLH8LyjiNWLwDCjnz9WZta9P5qgqHQXAuVi1DX/DTD0vCZPmE6i8v
	wdmMX7o5tN8AHfCURHrrTC2LRmDgqYo9cDtTiMWqyqMLHltBNtGmdxlKR103TTbudj06FDmztPM
	CBIrei4bddb2IfaDs6s0OLaYwLpkvDWNrBNnexm2F88j2JZ68bmd/6Hcoh2YiRfSMk0DN8rn2/o
	PEvb136novvFbX7SVTqAWA9uTu8Lbp7isv0s3Q7Tz/+s8xWNGZNIJuU09SIaitZiJqYIlLKPiXL
	uPTd2DTw8aBbAprVNR6StmpiTbPHxAg+DtJwyHESBMfmNYTqEHRTOB1F4jTgE9W4tJLugetFXr4
	bIay9CJJcwNmrAc
X-Received: by 2002:a05:6214:3d9e:b0:8ac:b63e:72eb with SMTP id 6a1803df08f44-8b6660063bbmr1282856d6.12.1777650874598;
        Fri, 01 May 2026 08:54:34 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:34 -0700 (PDT)
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
	matthew.gerlach@altera.com,
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
Subject: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
Date: Fri,  1 May 2026 10:54:10 -0500
Message-ID: <20260501155421.3329862-3-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Currently the XPCS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 1000base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081).

The problem arises when the XPCS supports 10Gbase-R. That means that
the reset value of SR_XS_PCS_CTRL2:PCS_TYPE_SEL (0) is valid and this
suppresses the modal switching based on bit 13 of SR_PMA_CTRL1 or
SR_XS_PCS_CTRL1.

The reported XPCS dev ID on a TC9564 is exactly the same as every other
XPCS supported by the kernel so we can't use the dev ID to automatically
determine what operating mode to select. However we can use the feature
bits in SR_XS_PCS_STS2 to detect 10Gbase-R support.

Rather than introduce a quirk let's attempt to solve this generically by
setting SR_XS_PCS_CTRL2:PCS_TYPE_SEL to a reserved value when we detect
the right we detect the right combination of phy interface and XPCS
feature support.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e69fa2f0a0e8d..b2c84b7e1e113 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -747,6 +747,40 @@ static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 	xpcs->need_reset = false;
 }
 
+static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
+{
+	int mdio_stat2, ret;
+
+	switch (an_mode) {
+	case DW_AN_C37_SGMII:
+	case DW_AN_C37_1000BASEX:
+	case DW_2500BASEX:
+		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
+		if (mdio_stat2 < 0)
+			return mdio_stat2;
+
+		/*
+		 * If this XPCS supports 10Gbase-R then it will be the default
+		 * which prevents 1000base-X and slower from working correctly.
+		 *
+		 * Why are we writing MDIO_PCS_CTRL2_TYPE + 1? We want the modal
+		 * behaviour that comes when we pick a reserved value. XPCS
+		 * allocates extra bits to this field and allocates values from
+		 * 15 down so MDIO_PCS_CTRL2_TYPE + 1 is the value likely to
+		 * be allocated last (and hopefully never).
+		 */
+		if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_TYPE + 1);
+			if (ret < 0)
+				return ret;
+		}
+		break;
+	}
+
+	return 0;
+}
+
 static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 				      unsigned int neg_mode)
 {
@@ -919,6 +953,10 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 	if (!compat)
 		return -ENODEV;
 
+	ret = xpcs_config_operating_mode(xpcs, compat->an_mode);
+	if (ret < 0)
+		return ret;
+
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		/* Wangxun devices need backplane CL37 AN enabled for
 		 * SGMII and 1000base-X
-- 
2.51.0

