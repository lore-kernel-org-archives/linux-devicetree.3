Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029433FE33
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774881; cv=none; b=g+uibz7ISrYPvz65avQmdd34Du5oooxcdmYWWYuN6akDq8HIyEKNY2FhX2l476dOpoVBBABsWwJ7pFt0mxkz84j1fTt4sGSZgeVOU4IDNxTXutWJ2IByc4g77906a18Ry3+rUASpPEIk4STw9KBrCxaCg5pGsp1tpCf9hnxRheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774881; c=relaxed/simple;
	bh=EEVP9pVu3z+hlSGNX14rsUHc7/USklIJ0bXaAo53PIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmzB/plW6ougBtghibOu6E0MI/ERtiatawIrAh3NUvaqOke338tmtfVEgEtcc+GyXMWJbwKbJyRAdeQIJRKCOWu/3k4Np+ZsDmas73q2fh8ua2Uug7JuY9RDEM/moTsxM7fT9wK/yQ5wDLbFg4xBcuvqHSY2VFY+0tA4PaStTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLsMybfx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLsMybfx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf110997efso8149595ad.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785774880; x=1786379680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipT5exq6LUV0S+KzcId/vjoUA8Xp4TlUp/KpBpmvGT4=;
        b=GLsMybfxU6ASp4LiD/K3lXr35tB6BzvzN2CRp4GkU74dWa6dqAI5tJoaHeu61aUUkA
         sVDqof8WaVM/Y3VtdEXrADXI7IT42UymQwwygeFstuRQLN8zcV5Lvz84LPFTYAreOxcO
         ofwx3HG6ZtpoZeodBYhKIa5g+ilgxxUBDmCKhYJ+8y/7+GBk3mHyPn3yyCK3RKn9Eb2k
         qNwWWR7mtEDBtUCMyhTwMXsuVnUHspu9wx+bgu8cZamGV7tdcDFhBpwJo3V33xfknjVu
         VSM0NjWggMuZJT2P92SP7ME2pW0nGFET8wye83fVn6UsaRsf6xW5+/sOWT+2fAiQW2bV
         2Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774880; x=1786379680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipT5exq6LUV0S+KzcId/vjoUA8Xp4TlUp/KpBpmvGT4=;
        b=Y43rEZiYVt+beCw1C3KjzzqqFyP/KqWHr2rRSo/HGphU3yWrsxvi3StVW4fl+2V5Wl
         p0GhqU/scAv9hL6jOxpSJ2GVOY2gKVfIugynIMMmjwosTjs+BPo7sO0Vt/ywKFdtTmCs
         Y76c2Z6CI7pgf+cAS0yRvqO201adNfM/dZyZ+z7BQ9XJir4bJPEzyNvZcBnIPWD+pc64
         YVCaOEZVJ3abN4TgBDkzZkumo8RJLl3Wmdf2HmgVygLvlb2hg1IAYMvlTeG0nD6dvuIk
         BJbguHIavXhSPJDAf65b/sdBIvhNwPgtDgqBOguS9YTrLKu/B8W3wcCCjGnhnJe4e0ti
         dHoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpk+WF6m4xNkNfSGyZo2sXjDULQbsRg14tjs9Sb1TwyUPNltm+97VlWHt6RppOF/mIE6wTmm1QsY8Mh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MBrBrANvOTBr65uv/fjMSwZpdKkqxVqM5NkUFqssmuyXBzWr
	8osPzYqBFY8qkLFyFUaEfhTjK2xA15Oi5nHbF8478ZofCurIS1ZMR27S
X-Gm-Gg: AR+sD11O6CksvMhcFjJTjLBCiyDKvTK7WTTdRLYsnTTnJVlN3uhKYx0eovU9UwmN4+h
	Q+CqjZW7sSk7vw6PfLxDBmpJBcAb6FmU/NUD0Cqajw+kECzr6wiYm6+La6pSnoGgyaZeu5sxQ8m
	6IbViyNN5fiGi/xmADgV5shdtXCCh9xZuT+Gr86pa7+trDwDtFYyWmh++7BYKp/KhGIN+e/kpHc
	atkKcwG+PRV/mpKKCO9By/b4f3Pg/hs2qp0mgF4wcL02FW/h2SzQarVtyN/St4sECXZiS9Kjb0+
	Cnbcr0/5szUy4mX9QXIng9crOqGtW64EgiuszSrieX5uba38CDTx6cC13UkYUcj+IaCxcgO5zqr
	kPVNS+n4CahRia50bbFxB8WZGZjVXQlzJI17yfKnMSJvFaCxQNTx3ltJXUGysO/V3CQYga+2GnC
	xDKzWSGeU8D2wkhhvrcUrmRZYzFb+lcIttZpD1bH/LvH3oAFxywTG1ckQhOv7NLJ/nq6Hm8Ixuz
	JMOQgZLip5v+kk8NBg2fea4QZNYwUjKSMtUV9Ft7P6+gGtSCAzPIl72sESmJrZSPE8zh6AN3oUY
	SxMKzCFh4OrvchVg++KQbY0=
X-Received: by 2002:a17:903:1aa3:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d05219bb79mr145306785ad.1.1785774879604;
        Mon, 03 Aug 2026 09:34:39 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae99af1sm41180545ad.33.2026.08.03.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:34:38 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Tue,  4 Aug 2026 00:34:24 +0800
Message-ID: <20260803163427.74445-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..cf672cc6b935 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

