Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBBC41D628
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693630; cv=none; b=pzIdURheewV6efziL6fU3ByFKT5JClM5xH/vbe8MkXf4FggcjYJIjX8IYEQrLJNbKZiRpuXwik1KY8Ui+0QacyfGsAQJawhfKiGpDKop3++tp+OjQ3R3RnYJqN8keWgXuK+KLJet5AHTEHvmvXvouwC9nXNoacmKUqm/RR2R2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693630; c=relaxed/simple;
	bh=ekkvdcRXkpbM4hGg5dbbnxL6NU0N1v5cVqGhil6KP7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPd21wh2WLEphg1qXS5DahiTMFWziiZnPrvXsbB0+QU08g5eeVtT8wsNZTroUegbIwKOBQ9eSvpsgTG8xXcP+EUP1VVm/h0l51YkeIk+hw6yiDPwyDuOaYZqbz/kYxTngJL5WEGW+6AQFCz2LB7GGZUPkbNZ2XHdK1a9FlsKy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5SIkDpZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5SIkDpZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f6609c657so309852f8f.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693623; x=1787298423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=;
        b=h5SIkDpZLb5/jMwWILNM3ZJ6PTHd4utDdTV0xEEWh774I2FqvhUqFaeQ1dYR2H8m86
         C0MiGxFnBfp4WyEnOz2iAZyurvs34gT6PG36/6a36WZiFoLC4uNc76c31JQ7qfaTqmKB
         b//raQzY0ADfltebUGFsU4AGysiwNa7U3UivNb6X0frdZlQcGrMCUxMm6teeQwwPdkJC
         LjaBUUCxBZK7wW/zfXt4d2pb/GBzjq226hXVYzoFib0DZnut133N4T+JmarM1B3MZz+F
         dMiSEo4TZ/JucEJmpfdX2gN97f5PC5lqeDFGTyvEZmR2u/XZ1+DySsNe/+ik/z3gv2Kg
         5FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693623; x=1787298423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=;
        b=bvGW9NyBo/s7zU9L2BZA4L3q4UMiQtn1Mr8oemGO+K19HwGuEKATnXlb7s1/iVBD9L
         BKzu/g3kMBGI5QoXIzbwDB8HAqBGwkhTquAJeivrlBKhIK+TbVx2fjEPm8UiUBy46yoz
         3zYL0XI0N89zEylcF5OA51+BHAQDrEIRipUodtvj2wfXUTJ5In4c93Vo65Gy2WZwOQof
         9Ypd+vAYC0Ys9DCHF2hWWjArbPL2B10GPa1eMc4AX/wrDXSEiBynqI9r/wDGkJJDyTRu
         T0n8St1BdktB5e8vAKFkWbaebKQ+VcVzRRwRq1etue740M8f71hBAFqBB9H2u3HMhEAD
         BR7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp0hYDes30jSR5rHKXZ0YOwbPHBH97ZKZbhljZPHd7RiHlzIRHGkDN3GfozPt2eo0De/X0Q5lNt5B5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPDiGZRoZMOaE+iTtf6EpGpoHQKhVbbVlTkR+jTVShu7tzOeF
	6iq+dyvTHQy2DqmbhPzJGErFvuXSFAZsZSZRigGXv31kDQAXpvstA/dy
X-Gm-Gg: AR+sD10ed/I5AZopfIE0Lsev+aYckwpzoV+fKMy+DRtXw5Yv+aP1DtudnNj3ewrYQxw
	3LnucYs5ZvPRlbj1/j+2W1t/xFBRJxk91gza+bvsFm9Y8WLTHJi7DWNIi2hsQea6PkvrQG7EBZs
	u4rdr7YoYn7ZsSAV6Y6raKvF4bv9KS8FRJwNXAeQb9ykXafUs96rWyyO4/z2IMkUSSzScPMD74w
	JkzDmYNjHE7Nw97oMOToZl01Tjcz2IO0/qgQGujHkHIqb2lvTR3W3fRW9N4CP9jwo8ZQ6g28ZsM
	Qg8LOF23w9vrn+iej6LjueFTDpde4nhxNXTRbknD/tQ+8tjj9bvzSuo5BdlkoBUFRbJsxT8uFyl
	BmY8D2GQsL/+FCA7CBgv3MkzBd72B954ulRfyJy2Zl1zIBEB5npPJfg3I24Qh364tma9wUyTIUT
	RpMU/60Zt++BZnFsMvAZrCS6Lpe3RLuOhURKcLwoDnX+wk+lcdSLTHiVCeLTof0yC5bA==
X-Received: by 2002:a05:600c:3496:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4998796e478mr55812165e9.13.1786693622590;
        Fri, 14 Aug 2026 00:47:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Fri, 14 Aug 2026 09:46:56 +0200
Message-ID: <20260814074700.2491256-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Tested on a Colibri VF50 on an Iris V1.1, most recently on 7.2-rc7
plus this series.

Changes in v5:
- drop the kernel version from the test description in patch 4
  (Krzysztof)
- collect the Reviewed-by tags

Changes in v4:
- gpio-line-names packed four per line (Frank Li)
- keep the EXT_IO pin group applied next to the carrier hog group
  instead of overwriting pinctrl-0 in the Iris dtsi, verified in
  pinmux-pins on hardware (Sashiko review)
- enable pwm0/pwm1 like the evaluation board does; both chips
  register on hardware (Sashiko review)
- the compatibles keep their hyphens; Krzysztof asked for hyphens in
  every newly introduced compatible in the v2 review

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
- use hyphens in the newly introduced compatibles
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Good old times indeed. You did this job before me and pulled me into
Linux in the first place, so having these patches reviewed by you
closes a nice circle. I seem to be following your path in every
detail by now, the hairline included. The tiny board is still out
there measuring every day. Thanks for the reviews!

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      |  56 ++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 220 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

