Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354003793DC
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127254; cv=none; b=ThMOL50vam80B1wd6wP9VrYqiAWtw8NNwnc9Xi0HvDEt5QNaXFRbOPu7Fo/vqeztpBe0achUvxRokMIxcP1dmnXrEJSjWVbd2b1TD48WA4x2APFbo79SenH/J9Ey5JxTiC63uA2p2SayS7LdugIAuT9He4SQMHitFa/Lrf8i1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127254; c=relaxed/simple;
	bh=Kk/Th42Le0i+/EVJjXBpuhzcRB4NEw90hZMlGQNKPFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRvpjmGey4Nn9XmLXhhMjOhnPQvzg5vfVqmp8nSQiMbrwD3P45UU0MdeQRq+N12K/bOjwz9dP0vU7SnqYNFoXk4166Dt2iaJLg183oCVzRqrk2pDidpvBdnWfRghFzxnalrxhg954ImOp5PT1YVMLkhal6nAPY6xWJ/i4us/a/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHS45aHx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHS45aHx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fde295992so1995784f8f.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127249; x=1786732049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3QOegBrxpOQoOf5XBMAtesiyJaIZB0qfo5JK8U5SZE=;
        b=BHS45aHxaHuk0CZLulMxbzJ5qctEZCBHh/51I3G9onS+3+5nzBYX4zmL0Td+csO4x/
         qAwOhYe3C1k29OvT8ZxViQhwN2Q0ct1YPqqrNBfCyl7wk/6fsMaj49fq/cxNL2wO2CnT
         1dH+MCnUREMOEj58//1YEuG/9ZUCQOwQWH1NFl97VkEg2g+tFXs1OH6vtck21HkbBSEf
         s4BpByvTQBHLJQpgUruRKotuVaaLblKccGmjglbM7y7c5iemZnC8yuUY+5UQX6nuXQh6
         kBl+6vseIE7m0vbjJTZ2eADPi5CmefQI+URUtCR4lPdNXut0V2So5qlGBB9CMD5b0AYu
         5LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127249; x=1786732049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3QOegBrxpOQoOf5XBMAtesiyJaIZB0qfo5JK8U5SZE=;
        b=sm9Im8AmG46ZhfPODqX+zwK7vknPmXIK7ZQusw2mC+sO1jVhUNOwJc76z9DZyPfDGN
         qSJHwZOe7yv5vRCDp+Mwz2cq5zRBVI+J4mVYw+yp/U8xs+iFZGglc5DelljyuQtIpNct
         DHikN874w0ED1zB3584W+sJzzMXgHQQMR6SFHo6/NRG8ed618sZS9d8mAmHNEqDOmCb7
         qHaSJB8FydgxgnFDHJJ2Cf+jEtsIl4t9k5Egsu1nZKuEDqe4GsZ8jESbACofw6C7VHz6
         kTJfQoZ662C3SEfAUKyE8tfIG3HkFcTHcQL9xfo3CAFn2h3+tcAfGreq3dTjxoD2Y295
         DsHg==
X-Forwarded-Encrypted: i=1; AHgh+RrKT4fZsElD9KV6PGZ1TwQR/2ZAsbfctYj/zRY8DILxe11JpccW/sVYqzWUuec88i/ZA6RowSEqLWH9@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYLt2aHl8iQ4Od/uIOQmc8L9DcGWX0/xNS9p75sn0EZfqRmKd
	xIANl5OoDeZdhDHl7UqBp/Nvivgy7ml2X3YU6mCgl0Z/uf1SAMwhMICV
X-Gm-Gg: AR+sD13/ILrD3ub6CWBxQtzxIVL9Q02XZr3Qs+JfTVdE022JQN9j4YICYNNpsrH2XCT
	UyInhMAwWbKMfyZujSZNCPZ17/ucMlCOMKxMGX1myrwJ6bTME/+vVh2dl39HcEb3531X47WJ8FA
	DXGx3A7JiTBIQl7BuI47ce/1NRjV0C7OGVGZfhPDBpxmfzmeiAdZTs4V4Y/4ZGQMenPx6RY5xZX
	azxLH93/fX6zxn4f4QlwpEYZBDDW6UJ0S0ab45EWEL3QCs1JniB19/aGOt82P8MDdsmInp8T1xN
	tOsxCzUoWGIIMvO9y2QOTKxu29zqzvB71trR4w49c7N/lhWpZ2iTzF4TO674qWx+sYRww2rQEf1
	tQo4whsxoZIdbxvKgRbdb1A8xUqHtxMNcshN5RQnn0ff61FvCuWqvhp2eGBNxHM2pnvjiIuEatp
	Uj06IVPb0QlGwwdkn7m1tncaw/fBG1UBLk16M16+bG2prFEfm8ECEdSP7/GtOWihZihc5oIOsza
	GkUg79Q64m9XrdHwWynL74by2tzOA28g6ojEdWjG46h5aWz42kFjAG4j8ooGlQ6qdxwK+RKZtc=
X-Received: by 2002:a05:6000:2889:b0:47f:90f1:68c8 with SMTP id ffacd0b85a97d-48131915e4cmr788570f8f.1.1786127249329;
        Fri, 07 Aug 2026 11:27:29 -0700 (PDT)
Received: from localhost.localdomain ([176.222.12.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm8543886f8f.20.2026.08.07.11.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:27:29 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	andrew@lunn.ch,
	chunfan.chen@gmail.com
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	peddolla.reddy@oss.qualcomm.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v3 2/2] ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint
Date: Fri,  7 Aug 2026 21:21:24 +0300
Message-ID: <20260807182124.41572-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807182124.41572-1-gvalkov@gmail.com>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing use of 5 GHz and DFS channels. This also affects phy0.

Add a device-tree flag marvell,ignore-regulatory-hint to the WRT3200ACM
device-tree, which signals mwifiex to ignore an incorrect regulatory hint
in the ROM, so userspace can set the correct platform regulatory domain.
The radios in WRT3200ACM/WRT32x are locked to the hard-coded configuration
for which they are certified, so the only impact is that the region
conflict is avoided and the 5 GHz radios can be used.

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..6e283e223ca4 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -14,6 +14,7 @@ / {
 	model = "Linksys WRT3200ACM";
 	compatible = "linksys,rango", "linksys,armada385", "marvell,armada385",
 		     "marvell,armada380";
+	marvell,ignore-regulatory-hint;
 };
 
 &expander0 {
-- 
2.55.0

