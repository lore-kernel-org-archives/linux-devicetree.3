Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682BE3939D0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 00:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558212; cv=none; b=qJaDdT5gix/jpoggP1EtWRc5dlE62jagX3AOqB7Qxrj1ZjQae/pksxkxyH3p12Xrnqhq09aX4MuC1uP+8LsWys68F4yl3CBCUtYNjmpSRBsS1CWCZPFX7n9e+otRYozdm0bUaJSmpHsMkFU3Ls2hCLpvnM90Chkfqpjp5wzq9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558212; c=relaxed/simple;
	bh=tlBwYf0b9XjU9uTZIFTm8XjdV5yV4hbezrjHQCom/jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdiGKI4UZA/yHc7BBFZsMviKDq97loMLBhyWvKKiz3+eqvfPsan/8CmYiTFBjUGYsX4gyj1Sa1isSpxcTd1C0aEDMt9AEnK6UGFZkMaxbiT6yopkCbyrUh8+JvqD9nH1sbSDkWOXeOOxrrNR57CcIFPCSKm/WIfFn4tug4UD7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn9zLvd9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn9zLvd9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso5228215ad.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 17:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558211; x=1784163011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZ7Y6Bxon+oOUVGfq9tz5mANF1fTOnqA75LK51EcslE=;
        b=Qn9zLvd97nqxAzkW93nM0uljgIn6uV4wMQPTHypCKJwCsz34pDZJkH0ZhFWPTaW6oz
         yTINqUjmKiorKp/pe5LAKMO8kxa6C9xdFhtbpbpnMKVg4tU0CHmHf3PxskVbloMQnESi
         DvTmHir1SkHNK0MLrPaTq89sh4/CQmGuVetDKa1ktS0vsXSkl5iWINIIc5Mgc9t9zB9l
         ohduOoFHf4y+sePE3m0uWnDpzG0QYsYfka5M68Frx1j/AekU8JRbgavLv6rccTkG0BRo
         ZXubMHmfw//Bs6OYfYayJYtXfgxnyz5cyvyRaym5kHbZUSkL56CDD+9Du+ltKVvVPHBV
         d9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558211; x=1784163011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZ7Y6Bxon+oOUVGfq9tz5mANF1fTOnqA75LK51EcslE=;
        b=LFAigQxqlPxWbJLLyFjo4sQP4ZAfiwHGsdCsNtMdBm24swCgf7Apb4X7M7jk+B5HGZ
         kE9YrpmyWrsd5FJxpQy4nBhLh1gLERrUR7tUu8CbYjySSV0Mj1/IzPig53qKgJm2N3UA
         n+S6I2HHYj4jjd/lC39I05bJvyJcQ/Qe2YinJFv/Ck5L0gcy+XD2g/mX89KmnDhDdZi3
         hcHTfrtOfyMMB2xdCEA0wS4mz1eCIdUL7bHxSTRY25eHb5sSPIWOSJ7u9n7nuw+ZFmeQ
         ifqq2rH/IAIwtxiwNCDoByXE+FPSmlazW1blHvqvjQK8EoLQlrb9JE9nmNV8s7HG7ccB
         a13A==
X-Gm-Message-State: AOJu0Yz65+V/uQw80XpgpDQQQ2Vgzw+23tmpy5xHrcNGKVmSEdFfJaZt
	h9LvxEF77i0DtIwR0vrKkRhVk7z3LdhrDLb0qCY3MJCdr6hPKHSU/jOv1epj8Q==
X-Gm-Gg: AfdE7cliV9BORLnoNShpp1M56ODFNgIW4jRXJnL1HOh+OcdZQ96c9++MeMOKuSX4Y/2
	pw+1J4hux2X1g6iRjQqshTOxZjtACJorrBECfDqeVEiDGaynlyhUoyCdTwY6QEJ+3vKsLHiJP60
	s2t66I/eW3rgHB7LQEJ7vVaoSjvNsMRZhFGYO5R404cZGE/qpc16+Uokn5hZ32BdCt6WR+fPvqB
	2ec/qPQD9WNYJkfT+7IBMtoiqvUTqmFU32qDAYw96BePuPVpSlvojYZdRIP4rAiKv6msazo8z7H
	PErhcEk4Byz+ZqfSbl7HfsrHh6oJkBnSX8uaXhwaCEznTDXI/k2YVl1eENkme/IMMI0gVsOWqiB
	qsDvxDAqWQ9x8B7gU8ZDOYMUIIMMtVUq3mSCSjpzWwhPLYPlL+CRGGCrIa+fB+00pZ9WLPVjTJw
	wltLz3nHh4YNcJ+QOQpnItMTs1DH1SEjdwIA5onCLoEew4iK96TZ9RG9zkHda/PrF/dsd+ODWS/
	U2QkJiXb6jG192+kic39mh4oMo3Y88hhVHpMDgRT7iQkelwxJism+kmV6KMKfDEAA==
X-Received: by 2002:a17:903:240c:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2cdebdb10c3mr5477215ad.26.1783558210748;
        Wed, 08 Jul 2026 17:50:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/3] ARM: dts: helios4: add vcc-supply to GPIO expander
Date: Wed,  8 Jul 2026 17:50:04 -0700
Message-ID: <20260709005005.1587852-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pca953x driver requests a 'vcc' supply, producing:
  pca953x 0-0020: supply vcc not found, using dummy regulator

The PCA9655 (PCA9555-compatible) expander is powered by the same
always-on 3.3V rail as the other I2C devices on the bus.  Add
vcc-supply = <&reg_3p3v> to silence the warning.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 05540b8012c2..cf0432a0e71a 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -169,6 +169,7 @@ expander0: gpio-expander@20 {
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
+					vcc-supply = <&reg_3p3v>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pca0_pins>;
 					interrupt-parent = <&gpio0>;
-- 
2.55.0

