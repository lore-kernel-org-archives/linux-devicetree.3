Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49372E7185
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215650; cv=none; b=Ka4wTD1XHntFOT7VywpAUnPyQIwyw583/O8BfEZ8i66fA1OZ2qRrRl6HQvGd2d3hrN11C8igQBHqy4upkE/ipcN45GZlV83xozZEm2EqcBb0bmCM01sl72EJoEg+hhaIxqs/SgMYD3DryyyVVWWRzNJLJwp3pfTXCUYT6QnWlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215650; c=relaxed/simple;
	bh=aO1j+V45gKVspVh+STk4Nhcf53cEsgoJkFmIjjpcfHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StDYESTQMLc3fTFaZYOlttKrYN8iwtdLp/46rRhI831JnHfLTg5p+pvqLoaYau6hPcT+djVh8eifEs9ppWboOn9HXP9N3oSSr4AL135jmCsNNQ5hakhAsLwGpqrqMEOSGmcoE4GrGJHnuA/i/xlmkMBiSmYlqJd0SCrhXhmvGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTqx9WJ8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTqx9WJ8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cd6614a90so799934b3a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215642; x=1775820442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NHifJZgQHQqWkUaJjmrpZ1+zeEyrq0oDIlsASkhbXs=;
        b=NTqx9WJ85Ju1zwhHb0HDfYYccjBZFaphv2/UeMJNyKp/g1Yu4udwbdIz5His/9OTcq
         O1EwcQMRTJPQx0ZjYXykr+ksG+ZBS3WqqLaBH+PKEBq6sIJRIX/zv5iw1a/TCrjD6IfJ
         ob4qsKmVnKKzl3viloDqi3foSi62yGzx3l09Ey6Dj+VPkhsTSXwPUzbbnro+qbpW7fg2
         q5D7gjC3jp+vvX/o3yAx9aGNbgaxowKbcfYcv7fH3Tu4uRAqV/YY+uqVxTPhF26c3Qry
         JnjNe4TUbjv0KEsWJ8LkKDF20P1yozVWz0EaHnTYJWGXXNIc1zdqAmxv0md8R9ogRYqG
         Zrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215642; x=1775820442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NHifJZgQHQqWkUaJjmrpZ1+zeEyrq0oDIlsASkhbXs=;
        b=b7Zj9SNE7hC32R9OPIeJy6Gn+KevGH6Gpolitmno4IRcKi33GEgIYCev0XdypkOdNi
         B+elMKwqrYyuWefhsiNpye2mg5fqzMDlQZd0jThoxPCz6RnA8uxHKt+Kw4LqSi6beH2y
         HGFzPoDmAAhLCVWAZczsWk+rAmFzpioe55kSqwo8rrj+NbkRQ2UwH4af3O593ETs7p2x
         gYIT7+5SjWFP+wdFWrVQBbfzYYMHwMdqrTAxyfRbwdubpUq6quwE9qfGwdMXA3JRbnwL
         DHegVg7WpzZE3AjQAEOKGw2n40su7SzZlK5YhMwY6gPcqrExGUnfSsARqWoyfwHb0Dyo
         DLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlVuuIQQOsBoHAkZrlS6NXO5eJlB6e7416fU0X5OIPT5dvd0qzi/snoCzqSOeX4Jraz9X1r2KS6hr+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0djilQE+GNXG1uwgQMi9K2j7i2ccJLFsKfCjA+3kOIL7i1SiE
	LzOYUGDa/xp9EC9bxPuJvhZElmIpiFAwEWzIWu9U6v/U/tmijes4hTObsLOQZg==
X-Gm-Gg: AeBDiet7XXSv2naWg6rkTV+xXgvYp/Ni69twf1nPd0+T5kjGJob3HW24TeEL7vJJ2TW
	HyxrdbV111ZdiFfRCb0/Unva4XbhAb9GVUME1L4dPs6Gd94Awt/NSMtor5lWk38LXVD4kwKSHkE
	hcCjAWuZcBuhS9BYwyH65uJURpVGDvy4129t5MDmq5iQYP9nMIs7TBZ+/DOVTioLi/QTiHCbCJy
	xttEBM0ZEYPpyUkpF+pCnua0DHEHPwQnQhyR2ZIzHEMYVOQcYBqMHMVcsihJrbZgiVQMqOz5XY9
	1ZdY6tyYo6J+fZArb7LxSY2jEfYextaMaNMVUzSMnVBc8nBsRt60LCj6MGMLFvKqkYU7LCMQ3j+
	XVprbqboXVON4vdmv40kn93NyaLBOGoJEXqYTxAGo384sSODbOSxw4Ez9Ba0Vr/mcL/ppHDmBtH
	K1mYmWlqPcXFKarxMPz2vjwYbyBnfLg7EzKyck9GepQRg9pGq8DDOD14RyEQ==
X-Received: by 2002:a05:6a00:1745:b0:82c:21df:807a with SMTP id d2e1a72fcca58-82d0db6ac7bmr2642877b3a.26.1775215641956;
        Fri, 03 Apr 2026 04:27:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Fri,  3 Apr 2026 18:26:52 +0700
Message-ID: <20260403112655.167593-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its internal registers. Without this clock,
register access may lead to a system hang, even when the FSI
functional clock itself is properly enabled.

This series adds support for the SPU clock and updates the
bindings to allow multiple clocks. The driver retrieves the
SPU clock and enables it during DAI startup, then disables
it on shutdown to match the audio stream lifecycle.

The binding is also extended to support additional clocks,
as FSIB may require more clock inputs, while FSIA typically
uses fewer.

This has been tested on r8a7740 (Armadillo800eva) and fixes
system hangs observed during audio playback.

Patch overview:
 [1/3] dt-bindings: sound: renesas,fsi: Add support for multiple clocks
 [2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
 [3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock

Thanks,
Phuc

bui duc phuc (3):
  dt-bindings: sound: renesas,fsi: Add support for multiple clocks
  arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
  ASoC: renesas: fsi: Fix hang by enabling SPU clock

 .../devicetree/bindings/sound/renesas,fsi.yaml     | 12 ++++++++++--
 arch/arm/boot/dts/renesas/r8a7740.dtsi             |  3 ++-
 sound/soc/renesas/fsi.c                            | 14 ++++++++++++++
 3 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.43.0

