Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802844;
	b=cXvmTcaUb31nY5VXxzcit+uFU2FR4e60VqAbpSKJ49a5jhoMaS2Af1kFJ2N+GkDooWYX
	 gDDei303yVsLD1T62WolOS2DxYh2Ml/MtxPrp2yUTkAvAbsowFHMIlQR5f7IycLUcECP7
	 r4BKP6TEhitfrwOk4TX90VD8qfDyV6MWmzxz96xvNsYfHtrYBlN88nKSB/zaNMTF6gphw
	 YnvtwvFfze7vaiTeI3bipLvPHiJU+Eg6pP5cPtjgnUC/afSrkMFiWiFgThlBShmNOiYaC
	 /74sRU0mXy4PBIrF+lhcpOmLi+2icPuehFvaAfvb7vLmQTpMEtl0fpJ4SDat2vblaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
	b=srnr2yy3Sj9cECFTpk/5sTlltndcHz8Amq081ryplWwWfpYRKvOdglGme/sAJb03D/D+
	 xnhqilb+7JhdZyg9Pl6w4/4fR0qTCKXjvnffcW/McHhsMNw8drlGVkT5ipJCtP4vINmfP
	 31UYiMwdt2D8j2ilvekzIQ6Y+0nVYwsTLv+z6+2QhUt7qRqQ8aX+yRNt1920tEVGRBYfb
	 DliPENuB1BGy5DRHuB5V5Ktbe9cBIxC9r+segCkSjl6mhBO9/boxnP7vAQgXG6E6ehXan
	 PjFKQfNve/SztoHeEN7Eh4OyD7xuEmkG7ShYhR/KIYqros/WZ23atkxmWjSC5CsZTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIIqpipF;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D57606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D57606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIIqpipF
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8470d7d430fso4171019a34.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802843; x=1796407643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=iIIqpipFCHcwfHF6yKZF5MXMXJH82GEIZKixWw1pLK7tPRUreyTVop7XToyMIlAZcD
         bYs/RTo/YkkbaoB1VqLTuubTKoMZMliWA4rEx09Ki0h7nldeepYOtAHdAX0L0Q262LHN
         TQqgua8YFhMPBXw/Xux/KCEt1fup5NuSoBwKex/2NjCe0C26+EhI+cW03KdwtnmSPrhB
         4BUiXr76oE+CYfDxErnrrPryczlYj4SPKYYfm73cckptel+ykllBQhW4E0iZqAw6mDww
         45BNQSHylzyx2vLDLMb+mLm71XdK1j+JbmEm2SuvqcwfHjovzcyYd21jhZkDhyHjAE/p
         XlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802843; x=1796407643;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=PTL9qB1+imLB3f8EAozdSdKNjJVTMLK+T4of95UdewVOkwGCezHNYMxNEvU8Sat9yJ
         V1YEd0tGKQuCGO4NgyjVLC4q1govZQinzJ3TK+l03GBNIM98zzMenzyYRgLVRmTGjkqn
         p5eby1w/t19Yl1Dn7Kfbtjf0kArQB4YDa6TzyoMOzqClxYWSL7o5kKaeaOKE2xZu/o5l
         EalBKHcFUWB5YAov4qoDAGC+TL0+l1VkB+jWiSpATPoPiN+THdSlpY4U2q1Zr05Kh/kh
         xFJDgaCXSmA0ZZJvpDPwztJSKj67y/9+mc3EwtnDxtB5s1tce3Hq39U6uYFMhoNkga9A
         OLYw==
X-Forwarded-Encrypted: i=1; AL+hErGkhPYKobDgltWImI+q3Lk7GAY6wsBRLkLMUp/ruPRHEfKgP1rKMXojSo7fW37yAMYCDymCyxdobx5t@vger.kernel.org
X-Gm-Message-State: APuU4Z826+X6734YUuALZ0Jg87AwhF2rHsclJm304Zecr/q1Wq10Aoxp
	Tj/tA/uPdqQ8LodbnnwDOKNOP5jIMMS4HPt5SBP5uYb1sWPT4I//fmamYbNKR2Lk
X-Gm-Gg: AZFdTZdDrK3t6uKpQ3LfI3KQbQrUfwtONafoOJQreD17m4NeXJ8LUizNOULLek+tLtZ
	ESQYtEojDZnTX1gL23kiL+OpAV8hPr+iCsY1ve79HhTG8t4n3bXE2hDzkPBSQNImJh/1Ue8fqJg
	zBN9LP+uoQNtr7576Qh2cbFNkZ1JjQRdkTKjiMSXVzZTB5GqwkSXJf1maQbAqLa5SntWPJRcxh/
	BL4nxFHiR/lTXMbqoJBt00Nh71yc96zAAvi0IY5JTtpIcg4mr/eXd7BDS7bN3WKduquSpllcRU3
	+j7acZw9zjToT8HV9HHc5/N3qY39Nmr3WJEq1LBF/w8x+oXa2aMnQSvFm5PYiHD+7RsvkIMTtHV
	xMbmORd3bHYveR22ewskmbfpPab2SIbl5/8Up7Zz5Ga+A3DlrsIk28vfzF/sYVkyVOrKc+IA/40
	b5ms8kMulFE3lPsJjtu+YoC0H2qv+4+AYjbG0Mb810kdQBV/56fcsRoTGTXshnZIQ0AavKBqj7H
	16+py3CqvlaP3ed/FP0jVX2g4uD26XgJ1QtsacSN9xodOQUwMoBp1oRyWKVjPtnMEHT0q2DI5Nh
	E3fT0JxIYWGdIaOucPNm+59wLiNE22n2RbbWWCIJP5fieD+iXeMxkfWRJellGQqymjBWIe6N7Ut
	xRsw4SQ==
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr26675869a34.1.1795802842835;
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm16267566a34.4.2026.11.27.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: vinicius.eduardo.pedrosa@gmail.com
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Fri, 27 Nov 2026 13:07:20 -0500
Message-ID: <20261127-a733-dt-v6-03-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-236169@kernel.org>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-4@gmail.com> <sashiko-outbox-236169@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +	vcc-pm-supply = <&reg_aldo1>;
> > +};
>
> [Severity: Low]
> Should vcc-pm-supply in &r_pio point to &reg_cldo1 instead of &reg_aldo1,
> or does reg_cldo1 have the wrong regulator-name?
>
> reg_cldo1 is a 1.8 V rail named "vcc-pm-lpddr" while reg_aldo1 is a 3.3 V
> rail named "vcc-pl-usb".

Vinicius, could you check VCC-PM on the A7Z schematic? &r_pio uses
reg_aldo1 for vcc-pm-supply, while cldo1 is named "vcc-pm-lpddr". I
will carry whichever fix you confirm in v7, with a note.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and Andre's reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo
