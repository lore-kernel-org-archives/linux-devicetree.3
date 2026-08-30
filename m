Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51D3BED27
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114049; cv=none; b=UsAlwQe1rkV4otgCMH9891HkJMYnUh8R6BrgxLXvFbyhl4kJLMs6Ud82MlGA9GpmGIrWVDiTnkzf3iApILE1dxGlogr//Qu+yamCIx476fB3MyLPGXJ29pbtMt1TaXMyGYdn9FREon6LrvDBPT1kQFHt3NNLopu33aJCsL0JlBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114049; c=relaxed/simple;
	bh=u1TIZt+CHOCWQOH9BZ/QQLKHjmLWjHuJGP5POnmAlzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxpLwtwn574H+FCqUhg0rMoTw9tEtvlVhDasLAApRp58RH93jG/JO5iYiVhVHWm0nH4577sYvIFFP9nB/bV3ingyqMIVvU/YCSrGTLT998YHBX29XIhBHq+uOtCKFGFtJ1Lz3KWXBBW8iqTLssAKgwoCSNlBipMpdNbRKTp1XDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drhh4W3T; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drhh4W3T"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso1864733a12.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114047; x=1788718847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=;
        b=drhh4W3TVrk21h7U2VRLEBGYDnOo4WVmMpOBDkhSIKN36qhtFdf0ePF48lec1pbTe0
         KU2Zwhk+oyppaQKlM7SdgqH01oPtmHAo3Zo/oNkn2oNWe+XOrk3NCfbgHGrP1nNM03De
         mPY5QWNRCuAE+hpO9tANsVf9wswsmFadbseXBtH589Iq8Vn7Ax8jc5dc0oRHTFyTlGnD
         uicurQmiLzQwkd1QzuOiSV9DoiDMAdIf+x/vbpGVVOfSuQBfS7trOU4VX7IsnFZwdDLj
         3rhx/P53hn/Kcm1wUCsdWPboKdJUPTg4Bys9gkc4aoFVqeFGNeCB3+Zqe51UeMyAW2ek
         gBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114047; x=1788718847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=;
        b=SjW6++WC4uHMde1aRnSDFgxd4Pz82nj6rdm6lPPUv65nAaMPjw7mhxVLBqlSXUu3fC
         SLboTokkcUBQThy2C/OFfS3y/4KQV6GvDIGR9fi6KGgqUZo+HeiJGlNfJjAq9RghE//Q
         +ssga3IFvOY1BO+DCrtslhTFH7SvxPzYM+NBPp2WahXLHwwB1mJ8FDmzEt7D79aNCZwX
         87V3rOwvjhgjuPJ+Dix8Fdqok2OUzWXCvRYRbmJ9dSJ0NsYRCbF0AQ9hJjmmLzv+/Wwi
         zDDwfXGJTUCXhTnV150PKk4An8aR/QIWtT3rBCliY7TA5sB5cIAaV+0jPD8bnZr39duf
         8Xdw==
X-Forwarded-Encrypted: i=1; AHgh+RqQuvRdxK05WbXTjpB7rnkQwVn5qVN8YLpEE/fDxearGqvx1ofsUomUWiC/VpIXQiI1vqIfLLe/3FBf@vger.kernel.org
X-Gm-Message-State: AFuF++kCbTWDVg9SjT8zXqs7g7xI1TGKcJbMwINHDzqu3WEJ+x8CIOPt
	QAFwKh2RDVA0T4xC00tzw+c++tH8+2VCErw5B8PK7D2rgdLtwFD8vvG/
X-Gm-Gg: AR+sD10Fd5Ow2fW63L03P4QhL+Fw9MbcCQMHyc3ewAHHcsUTo4bQhBFUwZ/Ntf/N9tX
	9joYtRuuSdIgyT2Pw5bjGLpVEzDIjp9D5fDxdkP+eAD8plq5DeAVMEkmdv2OFtLKcyrQicVBvLN
	p/Kq252gMEYILyORTUa9afl+C/nU1j1JwyzZkRS6kJsHKjG/2g4m3H/VDJ+6Q7+9MBX1seExRD6
	p1OQQ7tDMk4TOj/wo7fYffii7zDLpyL5VVY1NgWX6KNbQoqRUb+63+VS2TXMabrSUgs9adX4ryL
	8qNLcfaqJyvVvCGfs2dYR2CSncAFUBl5yB1nYO5QLzvu6SlWbpj+rybzzeijYHWvtM4MBoauKop
	V8bXIfyS82EPAlgaERa2JEUpco8lmO9R1s3Uo4JTmhKRRW8LXfEot0+ecQ0eZyZKuHhJ+cNkoUY
	b/Bo5kcxfL3YDHLIl6qrW0QeP7GfMDLAOXhJ82UtsoTb9d/Vzl3R3p2yWm0JklMGcEJJMS2eXUL
	QvB+g==
X-Received: by 2002:a05:6a21:4d07:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d3af44f160mr20178531637.27.1788114047417;
        Sun, 30 Aug 2026 11:20:47 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:20:46 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Sun, 30 Aug 2026 23:50:34 +0530
Message-ID: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

The series adds the board compatible and describes the BMC memory,
SPI NOR flash layout, UART console, and MAC0 connected to an
RTL8211F Ethernet PHY.

The MAC0 RGMII timing configuration was validated on B650D4U
hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
received no valid packets and accumulated RX CRC errors. With
"rgmii-rxid", a 5000-packet test completed with 0% packet loss and
no RX CRC errors. "rgmii-id" was also tested successfully, but the
additional TX delay is not required, so "rgmii-rxid" is retained.

Changes in v4:
- Validate the MAC0 RGMII timing configuration on B650D4U hardware.
- Keep phy-mode = "rgmii-rxid" based on hardware A/B testing.
- Add the SPI NOR fixed partition layout validated on B650D4U
  hardware.
- Correct the BMC memory size to 512 MiB.
- Order peripheral nodes alphabetically by label.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 95 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

