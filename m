Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DEB4E4C5E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568788; cv=none; b=bwvVXW7txCnTYXf8oSaj0pXdrynl1D0E7OxSc6I4fqv0Q3rVQqP/0uxf8NJBV8BX4y/OQ55c2Nr79fLK5y2SvZONSjMJt1eX2oO2fAA6rrgJIrXMWZzHGLVqo2fvWXt1sO6y/+AB95IpltnYhFDnfbEi7jhmiDfDG9pPH7uE1w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568788; c=relaxed/simple;
	bh=P+poAH8wG69axUkwsD3K3DEA1hw8lvwze1Qf6c/Rtfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLcmQBpPq/MXhXd5kLlC/SotSEf3HGsbiryOQuO6Ro5OqzwL7C3wRoyyOVSgVPEC6RCT8wg7niKXCfANWzSA9GfRCP2xXCqKRnTsj/MUZjpNeMpjwg1LIyNDicU7kSeoz0bN3ZFNFMBcYvGcdEVvuixNRyWSTbgZGhRemmyW3K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGh8+tN8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGh8+tN8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso12458865ad.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568786; x=1792173586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFrkjvKvgK+7671NmiTvcg+1m+zHAdrvgRTHztiv1Gs=;
        b=BGh8+tN8XqMN2QEAJxZV1nS/pmO8qOzKROTHnrON53EJd8IlkiB5vj1orwNNjiJqdo
         6HJ1ZL9V0jtbL25/qst85fUAXSMTBPXhLcPlIv/1Dw3IV3Q8bGZy5cwTtcFdvZugmfYC
         ylkMTTdogcgtG/ev/MGP/40XawHgnSsTo9CT9Te+Td4YUuvnVVSyAYD2ajgTHCPLQ3/W
         3RQVgu3o4/O8BTIeK3Y0r7BBZqjkZzewd0v9FY+Anvje7jHjL8U68I3ENqdiiDPIRCj2
         pGLf61UXWjqA7liizwaNkAV5TupiA2siDeHYFhv+Wqx8uUUEwvz51ojaX5229mg0EGCZ
         O4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568786; x=1792173586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFrkjvKvgK+7671NmiTvcg+1m+zHAdrvgRTHztiv1Gs=;
        b=1XYaXT/IvBRDXGEzvjjZkG4f0Atb/QD/rJVgjKEW541qFQx6L1B+8a1H+0tVw+4mUa
         Qu5/M5I+tMXz7F2wFMJRWAVOvL35BnIIzqMrKtYIRISmuEEKzdJD0fFvLAXFJ0mBMTPC
         xR6VgE+f/QDxGwgdw5s7KP4akTFNMcC+aGzVrRVYrfsZ139ZXjbmgNQpy/cTbXUq5+y4
         iTniVYZEDNlzNoa9YMHObg12djP/pnJTyAky/tirPJJ4C7SBhxq76HsRnIPcUJ8hx+3Y
         zEj3TU4kISSwWUAyPO87R2frCZmX5bjJpf4bF8X8B85EbSbwmxFN8G8or2oFEyDsazU6
         EU/g==
X-Forwarded-Encrypted: i=1; AKwUvBwTkYKdfdeqcIUyRPf35JogSmY1LhOVAIzcthATYf4bPuGzANHY/BINIl5dpP9IO6lCLZrt1HhMflwD@vger.kernel.org
X-Gm-Message-State: AFq9FYLjSsYj6T+PjImZSqqS5CiYhmDPgiDBeEIBq5R+HqEGnHoinB4E
	4Lp7HG13YQphYP1gxt4874oX6KkmgShwwcdOnCvZiS88SkhoWqikC+Hw
X-Gm-Gg: AYBFou19puKi/g/LuFZzR/BYI+xv5jiMoRTcTICQTe0c/5iNAoh8aHvxfLsrhBmfvGT
	aFEwto+ZoHB6ftQpsXW08voqOovTh0AoQA0vVv3tXTwaZFrW0nrz4o8cey0Hrk4uzZj8oqORwA0
	thw2Vqlywp+IHYoKtYy1yyxk9vy92uRBun8IG0mbrdJaKPbgdZnfneLm0XCyUwy/xFhxFq6nKIW
	UA/e1n53jsFXJ6/8dKaM01th2HH08D1s1mI1MC+Ptf8HKJv8F+G6IuyQcjrKCeeaiyrr4ZlQcf7
	nleHShEdefwTjhFhXxMcdvaL3h5IIE41z41etlH0XSAoLO/Ocg8Q4AIQrxtcFMVXUwk8kAfvHGC
	soHWL+PpuNg121FuCHcYKSA7TWpTn4c7IF5o6tIuRreEi7MyIy1ZIUntMOrrgaj8inoBETJGAuZ
	6KYWYUp/bahjeE3pFifFOp+HXdvw7SSon1wrFC2p4BJA1VEhz9CpQUy7j7TOZeGK/8H+CV+wFHh
	hziDcC5bW1G3xo40HzaWAwZkHuyPqSt/Qg6
X-Received: by 2002:a17:903:26cf:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2e8404bcd1emr20132425ad.8.1791568786245;
        Fri, 09 Oct 2026 10:59:46 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm14167105ad.29.2026.10.09.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:59:45 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/3] net: phy: motorcomm: Add cable test support for internal YT861x PHYs
Date: Sat, 10 Oct 2026 01:59:29 +0800
Message-ID: <20261009175936.428256-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YT921x switches integrate GbE PHYs of the YT861x family (PHY ID
0x01e04281) on the switch-internal MDIO bus exposed by the yt921x DSA
driver. Add a driver entry and TDR cable test support.

v3:
 - add dt-bindings
 - add PHY_IS_INTERNAL
v2: https://lore.kernel.org/r/20261006202352.1616626-1-mmyangfl@gmail.com
 - split into a driver entry patch and a cable test patch
 - update comments and kconfig
 - add yt861x_config_init() and apply the auto sleep setting, restore auto
   sleep when starting the TDR test fails
 - use separate variables for the TDR status
v1: https://lore.kernel.org/r/20261004184246.1260426-1-mmyangfl@gmail.com

David Yang (3):
  dt-bindings: net: motorcomm: Add YT861x PHY compatible
  net: phy: motorcomm: Add driver entry for internal YT861x PHYs
  net: phy: motorcomm: Add cable test support for internal YT861x PHYs

 .../bindings/net/motorcomm,yt8xxx.yaml        |   1 +
 drivers/net/phy/Kconfig                       |   3 +-
 drivers/net/phy/motorcomm.c                   | 152 +++++++++++++++++-
 3 files changed, 153 insertions(+), 3 deletions(-)

-- 
2.53.0

