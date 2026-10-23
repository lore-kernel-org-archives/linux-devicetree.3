Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756376;
	b=PsNVErCXmPAWuzZ64+5QHEiTTkVpuBVGW4ny3knunE9wcwyMO/H9ZGxx7fuMlNzqwLNx
	 Py/8sRP81zwcdzDfq3Pax3nFp8W3Smj6BtzMZDLJFXklg9cA9W6J5WHBw2MS2HVPE1hWS
	 8PIDfTgOhqeZ5MbJW0gA71iVwbUOSOwniZXG+6Kt5SE90P/Vp1M0jKy8a8LjfOWIOinhI
	 qO+4aMN5a0Yz/KWbWkMZy8KegKbnQJpcg9Ka1j5atzJLzlYm2oXuTnTxG/O/rUSUG2r+j
	 NrS/cAXJ/u/q4XepxSlJEWVIc2c4WQUjHRHdrNQ7remMi//Q+VfJWRA/rUm+ZZedqdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
	b=N/XhbGKCQXpFbk5GCtukKgGXBYk2w7VRH0PEQfU6QchONzXH7wHk9sR9y5wVtSPxBQl9
	 9y1cd8JveUoKNTiVW1MaakX6jPXmwuEDnWHosXsBR0vT0xn7yzNyk/FMx+/xMry8iz6BW
	 5paONZLE1roUHIIR0TjXUfjobxwbxUg5PVdPeC8uDHt/xb0huOX7IqGAILH4v6W+ssJk1
	 Scf+leUrUbYCW/P8LF3hkF2kciSY/IwEJ4d26bVFN50u2GGJiPOtcEa87Zmn1HajT0Ei7
	 mvAdOMMJHp+C0rP5ADH+cLTNAS7J0je4/YzM9m30vuQ+AWHCRnA7D4PTndZZd12nOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L2jji7Ya;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B103B606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B103B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L2jji7Ya
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5529715e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756374; x=1793361174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
        b=L2jji7Ya77Gl5ZZ3kYXaGUCOvbNwit64oGKdphKbeVSKKGdYM2RwPdUNUOOIxbKxBo
         c9gjFvjp1os4CCgEU8MpbnbC+FSCQ+0sAqEjujKoK6/hHiuDdpoTbhTYiDVsKKuDQf95
         zUYyKgGOQ0D7yus7IBmdXvRlt4ldfw+LccKuFYsvBWyBeHzM7mNBUv2joChxJ5pEIRo7
         mDncDrhd8rk2XtW+uBvxkbXSgWxyHcWSKg/Ux9Mp9tmewAwEBls1nraGDz0FOXb5Cqw1
         GViKwPjgFvMOdiva5l991BdaRfM1x4OdRo8+opm5ooEBir42hh/V9p0uiaJyLhNVQQVK
         PHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756374; x=1793361174;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
        b=ic9uIE+rxUbhGtEFDLyEFsqz7TGrbcdBX0/L+qQnfb94ycrD1epq7ZEN4mTk68pdTc
         wWVWlc91FLGps5bQzyPuMv+jAWSSw68s/FGRMLOgGd+Y4WmsIEp6LNNeJhfTIm/tr1vx
         hZ/OW+Q48sRXJsyX4lKtKQQ6aQgfmTFfgGCODKPEb9QbGeNWq9Cmb6G2TXjiULzNd430
         Gjdr+qU4QUUCOcBpF+N/0oiHgdbV6v1mhr8UJKKgQWjYWS0SA4NjHRA950TckwjoQepj
         10F+it853X9yvmdgU8sMqxsOH5F0jiMq+gcOoRKCWwUZP/hKym6A6MnG+i5kaFkrXLA9
         pgkg==
X-Gm-Message-State: AFq9FYIs50FN7quFQ/R+u8T6xAKvK3X7PTt94JXAQxcvr12oOeyg/AOB
	sWC38EYaDCS/kngh4/bHrNpy+TwrJk0bYYoWQkiqYfkvQtSAqvpne/FF8CARdtaV
X-Gm-Gg: AYBFou3Swpu1CPKUH+zzfLw6RViCRQHcZ0i6kJaA4vCYjUoOungdPq29FGGBGVoQaGr
	07ErDJ32oViZNZEEed8HXYQH2NhiG94Z+c7aCEtqpiOdPzYSH5HuwUgA+nuDIO4o5Tgm1mc35r+
	xxb6dLX3Bu3m8dQvyVkIDPG/eg+FiwV4+utdy9LA83CRjIMS39mpJuXtOqkSZnmSP4UWw+fN5PI
	aZ2BwKWBdXOJvgXtHjsVcoXSQf/ZOI+sWam0Y6WH/iJfaxD55gCfn7M1bMmpAAuAh144yIWoEh3
	YZ9ENQMI256CE8HoPYTC6nRAK7zXFCzwkQjcMD+Sar2LZq1Tzz0x3HWBwttucnewB9kI7phVmFW
	qoTtEG/Ov7Vyt14bcQNQoKEAY+qASKOmVcOjxyEdJsXehX4AEo3lrvsKGDPuzue0K/ZA/ypT7yk
	qaMXRs9kEbkP74jglOv1sXw1mkwfTolUmxGReYMYblz5hOaCTBs4fgh5wiyZzz4Rr65vagyp7s0
	TGObBMg1QdeGHz1qlIqgHqonV//TYotQCFIU5ui2i3IdgnTpW1Weued9mMT/xFeIfzAT+lP/eiG
	wjJ8T2EIz6y6QeVKZ5yX9jcW85Pl0BrIxlpcHj4omuAhw8ER+ZUUrl6hl4MJFSfDC7OfUN6xZdM
	=
X-Received: by 2002:a05:600c:c116:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a211dd9423mr26760585e9.32.1792756373823;
        Fri, 23 Oct 2026 04:52:53 -0700 (PDT)
Received: from GLaDOS.station ([187.13.215.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm83319775e9.8.2026.10.23.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:52:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [RFC] arm64: dts: freescale: Supporting Variscite SoM and carrier revisions
Date: Fri, 23 Oct 2026 13:52:41 +0200
Message-ID: <20261023115242.11197-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,=0D
=0D
At Variscite, we are starting to look at how best to maintain upstream=0D
Linux support for multiple hardware revisions of our SoMs and carrier=0D
boards. We would appreciate guidance before settling on an approach.=0D
Our goal is to support new revisions while allowing customers to keep=0D
using current kernels on older hardware.=0D
=0D
Our platforms are typically described by a SoM .dtsi and a carrier-board=0D
.dts, for example imx8mm-var-som.dtsi and imx8mm-var-som-symphony.dts.=0D
Both the SoM and the carrier can evolve independently. Some revisions=0D
require changes to the hardware description, while others may work with=0D
the same DT. Over time, this leaves us with several combinations to=0D
support, without wanting to duplicate complete device trees for each one.=0D
=0D
What would be the recommended upstream approach to organizing and=0D
maintaining these revisions and their supported combinations?=0D
=0D
One possibility we have considered is keeping the common SoM and carrier=0D
descriptions in .dtsi files, with revision-specific .dtsi files extending=0D
or overriding them, and small top-level .dts files selecting the required=0D
combination. Would this be a suitable structure? Are there established=0D
patterns or existing platforms we should follow, particularly to keep=0D
changes for newer revisions from affecting older ones?=0D
=0D
We are also wondering how to handle revisions that can share the same=0D
description. As a concrete example, we have discussed the following=0D
possible grouping for DART-MX8M Mini and Sonata:=0D
=0D
  imx8mm-var-dart-2.0-sonata-1.0.dtb=0D
    DART-MX8M Mini v2.0-v2.1 on Sonata v1.0-v1.3=0D
=0D
  imx8mm-var-dart-2.2-sonata-1.4.dtb=0D
    DART-MX8M Mini v2.2 on Sonata v1.4=0D
=0D
These are proposed names, assuming that the same DT correctly describes=0D
all the hardware combinations covered by each entry.=0D
=0D
Would it be acceptable to keep updating the first DTS to support a=0D
compatible revision such as v2.1, retaining the v2.0 filename, as long as=0D
it remains correct for all previously supported hardware? In this scheme,=0D
we would add a separate DTS/DTB for v2.2 only if a different description=0D
were needed.=0D
=0D
This is an initial idea rather than a settled design, so suggestions for=0D
a different approach would be very welcome.=0D
=0D
Thanks,=0D
Best Regards,=0D
Stefano=0D
