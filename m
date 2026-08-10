Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28B63E2AD8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370460; cv=none; b=W8CMulb3VdHSbzLvtHhWUk0CotLo+f8O5H4iIZV3tRoo6/B3/01x0JsidqNJVWRP+nsUAHYjTJsGzIaAgGY17E6tvT1Iop+Sj79E6ddWYjh6CLNL/fOh26AFt6llqKsHG5x4vEBrylHMnggYhrVAGR9cjATGsRaQyuTiIs7ggqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370460; c=relaxed/simple;
	bh=71MkuCXzU/i+v/8TgocJOldHcI2/J/eAUokUuW66wfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cM+FFSSvoQJXXU5Ee/GpzqGFIOYQ2teYowZj7wBQdVRsljarrs6NqtZ8f0UVYOgaRk4vm2/6oeXgZiVhCTYT/9u1u4Izxxom+pp47O30dmDegIFXVzbM5atUkVLIdQI7AeC64x6z4sMWvMgD44qxPsEzV02YQvs8nlyuM8nWj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9XVoxwq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9XVoxwq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so13849155e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370457; x=1786975257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRKE+fE845aOA8OzGKlsy7PDRI6qPQfdTEDqc0pnpUM=;
        b=Y9XVoxwqwKYl5DnDw3CQnX/EGOuLKfbap3Kg6DsD4rGmmSpQaQI6I7Py12t1W2Nzhl
         dmTlJHNndGpn5d1gIZqMuQUls+MaaUyH0S7Sbq+8+xn5y/1bwjwoeQUURJP4/h486mOY
         OLA1XIaxBw+sIF3fNtxUuFqQDlw+txTQgnxc/sRhTkfAmVf16IufX+brnk/y1EqvzraI
         ElxQjP8FyUcOW1xvVUOUM+KXc5m01GsCINJkVEOja2yFV52qayCsGlENgJsPtqZQkmf2
         0tdHNiozGDrJSjPKD8u3Y3L4lQ8MkWHVU/rckC2dX9JLL6aWHwFtMpHeVzzVqVn+LckZ
         BPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370457; x=1786975257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRKE+fE845aOA8OzGKlsy7PDRI6qPQfdTEDqc0pnpUM=;
        b=QOkb5Jw8ACIFOLkcs/3HZdODvIxL/B/IygZYC10EoHAZALawcfynjbFgG2+aJszSKl
         FLUMm6Vf7aiwpAo/aP8VwDjNV8zbaYEdXX/jppxzeb3FJ3p/2FtH8/m3gizEEDaRYH3w
         yzHjgChaSwzAUWkogTpeTT9+AZYNRcJ3HxyK0ZTTiWK/49CLMY1k/N5Yq/hAKW6+FgCq
         eDfW2jzXY79pnFdaU0XFIUy0U6Spu3H4zoyxdYEnk2MHCL4TMO4Iz98qMO9XuEVSEKvH
         ezF+OkeegtMH3mfwBKE04bIZ76QlqEFgwaxvkY5jR8YA6n6oinSelULtDsGWqK02Yg/q
         ElaA==
X-Forwarded-Encrypted: i=1; AHgh+RrWBB6gcWM1GLeb/hBVkax/Gbcf01wJrE2jZsIAgvin5R/NakYs20UagamM0PzNUUWHD2xD41KHTWq4@vger.kernel.org
X-Gm-Message-State: AOJu0YyYm/CZHrnCZP9w/c3xoBtvPJ/EX05YW35YvzHEl7w8nS5DhgtU
	1pBZLZ9aoxme48Lu6L6gQP/iC4oRG6WOeqh6xc3/4hfCe6EHGWs09abb
X-Gm-Gg: AR+sD10DAfQ1DXIvQjvtIfG1KS6iFUSGSChFpEeqOfhD8COTtdABLDqlaBIV8VKA3pa
	zJFmBv9Z40srVNsztOxa6K3Iv3z9hB1jHyVsmKth1GP4Sl2vZ21Mmusn1hn7z3lqQyhgYmHv3/Q
	8UrefhTkz0APY5vDSK3AYmIWE6bRuFJI7UdSGODDXl/I1W1GAQtWpAnYHgISd4hoLR7Nyb6NMUJ
	CUEe0rTxlrjLXRTtnNw3E4Eb7mtZ7P3gPVQGiy/OUCAI9hoDo/Rl/OKo+6yvElpK1a/xB5VWDum
	IysiRD1J0YefdjObPgOuxo5YQN08avCHemne4ygDhfC8beC3BzNqc3fVQIs7IFyahhHyQOaLdUb
	l9GUAedeJ6oNK2zspuBVkKaHlrGWaiBbyx33PspfHm6PZiOR7RHRSGj1e7WKTRnQAmxc1She41U
	GOfZgDghdR3ofJTQ6wuoaKCX5ASwtWCcX+CiO66g/V8tVDwsVQflGxWYqB7Cg59XZdJH4=
X-Received: by 2002:a05:600c:4f49:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-499727a205cmr22968105e9.14.1786370455282;
        Mon, 10 Aug 2026 07:00:55 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:54 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:00:50 +0200
Message-ID: <20260810140053.2793495-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Mainline carries Iris carrier board device trees for every i.MX Colibri
but none for the Vybrid ones, so a VF50 or VF61 on that carrier has
nothing to boot with except the eval board tree. This series adds the
carrier, and picks up two things on the module tree on the way.

Patch 1 applies the EXT_IO pin group, which is defined in the module dtsi
and referenced by nothing. It replaces a patch I sent on 2026-08-07 that
hogged the group on &iomuxc; hanging it off gpio2 instead avoids the
fw_devlink dependency cycle that a pin controller referencing its own
child produces.

Patch 2 names the SODIMM lines, as the i.MX Colibri trees already do.

Patch 3 adds the carrier itself.

All three are tested on a Colibri VF50 on an Iris V1.1 running 6.18.44.

Mehmet Fide (3):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 5 files changed, 307 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

-- 
2.54.0

