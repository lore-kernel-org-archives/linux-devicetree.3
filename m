Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151553D667F
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650881; cv=none; b=fzPWrNU1DXRaTALI9PDJVX6WxdtCQO7+SvhdriDy5rk5KwhWtuLOMCvSVrpWD11Xc3e56zvBCbUfYnitUBCXu+R/FVyFnG3Uc+2Zu3Bw0pyfEKzKZOON0M1IWOcSgOTA8SzhSOUdlF1qkxN9Hdg3lhFcwPsD46PL/Tr/YTvHmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650881; c=relaxed/simple;
	bh=vSMz0fMwD5nvE28rW2N/JHi9BJvlZF2OiadS95iYJ7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfiX54s2+X7wJBGESm85ZGFnKaxNE4TLWErxJVjNT1hl8b8ursTjlXeW/Z1+M+Ba9NjuFhBPvOCpHnLry6m5S/wAW52W7WN5oSX2qKxh6TlpQvD4MGDUhiFH/SpoCPL9dB8ooNojeQkbOFPYw7QEVD0foD+iPjM2bcHngwkrAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Z5pLDII9; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Z5pLDII9"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8aca6bd57cfso18494956d6.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650878; x=1778255678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
        b=Z5pLDII9inAZIYRk3mHwRycVsXtkdv+tJIEvThfg1icNH8qCTRn+9tTfuMPeovkW7P
         aQyfaIEH442Fs0eM8ndBTO2CA74qq3PvbpncoYETsKlrO1XAZ+Aa/TUPukzfqc0z42dg
         bjLWAYawkJmCx/oTfbXnbGm1HowNQ1loVD+lWT9od8pPZFGuQmtJJn10620MKicg1cXp
         brPPS5wXGQWUUmaMzR8555yBCFcstfLYTEsZN6RqjSP+ev8ympE/3h8ThKfQfkvZoZ9G
         nHyRUL0Afm51WMx/9vtY0l+lbCP7perMn1H3HIk+UUBm8ab9lrekzEb3fdpREmkWP5Y+
         4C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650878; x=1778255678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
        b=lwTnJNk3v4M8/doJI0w+P5LVdMSlbKCfoHeMpJXmDUUCAV8ijfz2O4KyLoj+jwvlDh
         8GS7qC/ZMxKdIEfq8qcPUKSc0MpRPkSdSVYjYTX6I3/tGVtFgw5vfMdupGOP0kA8IuRg
         W0vPLPMjvlqI0Owu5BYeqT4vkfZ8s9zktIEHG8pvwe0XVDAwN8ibSK5QhwF6AT0P2DeH
         pKOstV+9gJh6bZ/5RAsFIxW7xHytBC+sa0f7UiB/iv2kBUy8Q0JfTPBUXuX86QqPTM0t
         zfexrxAYsyI7U5Gj0HhH9mJYm+RDiv79dIi2RK6u5n9EDZebLof2pjHd7PrJsynpfFKT
         j0pA==
X-Forwarded-Encrypted: i=1; AFNElJ+sA+d4wysbZ03rPSJox33qS7b/hDGTwyoap9luoFWRBXC8Shen1uXXp5qLn98/nwYBuhuK+iT5Q/8D@vger.kernel.org
X-Gm-Message-State: AOJu0YzJPzBjzFMQ633MaPb7Tz9TAEjjNX3rGO3LHRYnZHtiXWD4wluq
	36+iUBbkLOWFYL0SXkUXBtkX5xvcMz9DZ5oFeVB50+nm9kxFWaLrVn+dpxd8X+w6ByA=
X-Gm-Gg: AeBDieulmbfwNqdxm5dCxLpXFc8Pc0K1NSdQwIGkQbB4HjQ0RXo8Di8cNaNyP+y95vp
	W6gG+GBb9daIF3hFAOes422EOKj4qlNep4AP98pAlxTafLMuv0v69DlejqE4BCZ1fqzjaQoFlZz
	yDb81swBObhcunbJp364H+sZIdWxrJ2Pbkgx6/ElQ3ZukefvzTCFhRa079f5WRBLPwk37BmyrBS
	esLHk4D3U24l0o/lzp8BQOmMJgVJWATIokjP0MBY37kIa7Mj5IvH8tAHSQnE7ef9bAmgbPG4jRe
	BzSZ58bqnBcRdODz2qjKAsM9GOC2iZri4IOHTZrI4e90ZJl/aPshPO9e61gRQMIqUVhD/Sw4pWz
	6VChFjZPxNE1rFdIHJGVLG+Og//P4Yq0ue7HaINyWIXCLEv5FrGTFLSCjlsXDQtOVflwktTVJhE
	0m506X29CteiGrCUJltfX4CREp8LAgiusUfIHBVYw6Uq9DQsHQlv8B/G8nH9sm0X72x4IoXkza8
	ldKMA==
X-Received: by 2002:a05:6214:483:b0:8ac:bb62:fe4a with SMTP id 6a1803df08f44-8b665f02857mr1068856d6.5.1777650878062;
        Fri, 01 May 2026 08:54:38 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:37 -0700 (PDT)
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
Subject: [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE during link up
Date: Fri,  1 May 2026 10:54:11 -0500
Message-ID: <20260501155421.3329862-4-elder@riscstar.com>
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

Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 1000base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
negotiates speed correctly but the MAC can't get any packets out.

This attracted attention to the ANENABLE bit and we observed that the
bit is currently set during config and cleared during link up.
Preserving the bit during link up allows the system to work as expected.

Perhaps I lack the imagination but I couldn't come up with any reason
why keeping the ANENABLE bit set would break things for other XPCS
implementations. Let's ensure link up sets the bit for SGMII interfaces.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b2c84b7e1e113..1d62d5b31c61c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1263,11 +1263,14 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 					 phy_interface_t interface,
 					 int speed, int duplex)
 {
+	u16 an_enable;
 	int ret;
 
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		return;
 
+	an_enable = (interface == PHY_INTERFACE_MODE_SGMII ? BMCR_ANENABLE : 0);
+
 	if (interface == PHY_INTERFACE_MODE_1000BASEX) {
 		if (speed != SPEED_1000) {
 			dev_err(&xpcs->mdiodev->dev,
@@ -1283,7 +1286,7 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 	}
 
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-			 mii_bmcr_encode_fixed(speed, duplex));
+			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
 	if (ret)
 		dev_err(&xpcs->mdiodev->dev, "%s: xpcs_write returned %pe\n",
 			__func__, ERR_PTR(ret));
-- 
2.51.0

