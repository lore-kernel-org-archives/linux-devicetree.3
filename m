Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269C48034D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189604; cv=none; b=P8Qap6aCA/ax5DGFH1Wvk87R06dDikW5jeATjQpAGif+/hvEJn3UMWfhOn6D2xtJI5ZgVy9Hbrx7LD7DqDmKsnekZvmMBSmvUDeHztESgPPbm27eMw9iv7BFWANFVYeH2tWDnQw0ZDIzDzcAQgFFz9IHD5GsWRdQfxy0MWa1DhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189604; c=relaxed/simple;
	bh=8cnkHSegsO8bCumTqwhx1lBs+4+12pjVx9tdbJJpbo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxNJX+IfyeNKSmMn9K2T0ZTipG/YVER3PYFui2SqUuLcvcUHa3AzdzFQFNz8e6DHRjSRpi78LlXO7MbM8pwByGii4B/KYBwcfKWbbRpOAgTffQDCHcDHWGHHHlh3QKzxTI8YdX7EQXDhJD6qURPjsFVrq2NvT2MhnlfY1xSsuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcXl/y+L; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcXl/y+L"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-444826c16ffso2975166f8f.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189601; x=1779794401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFSzGFM0qEWox8JUZ4uZiuf3xKGhoFzadCX3KqMCbLM=;
        b=YcXl/y+LsfoFOwKOt7RpItSBSzm7wZNNauos9bsWXjNwGkq8+g5nAklV04y1lv3ZjL
         FD0H4Y/Vnqka+OusjOl0zSfBcG4ZPld2lO2BE1BIW7CgZU3nCqdlqTmZU8p8qINSedtL
         DhyV0nlIISNKpxF8IW+DS+AiJNcpM98W69AofdoIvQu/TEpckfZc1rzcggadHPDB8gZT
         ATbi0xT3Q6/4vI6bKm2jIDj+lVbpRp/8wxIk+3xMx5pdTGpEz6bt8vWp5BSftCtshbqU
         aJX6v6jOMvbzb+Z4X1aOsL42m+Ba+tpLr1OUf3cnEBN4wDX5apOwq5pl54TD7QK0FHSH
         GBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189601; x=1779794401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFSzGFM0qEWox8JUZ4uZiuf3xKGhoFzadCX3KqMCbLM=;
        b=U8Aitk2ulJYGJZp4XPq6BnL4ynZz+EUFwPbo125fJHnlSO5L+Bgrpyq2czHwcb3VND
         lpjHfNNfyrjiq7LkotuFrAUGENbmsXDW/sLHqVdxBTYIEWf8BtIuxUHewhG+NkCeej0m
         DMxoglBs4tGPGSVsYh9NdU9iSHZUXzVhvDUdkt4c3uOnamvQxDvanuacEkIF6JUL5r9h
         C5g355ssk6CSORMeLTY7/dcfarMwl7UZV6XhH+IruYGyUTRrzHLFoYX6B01VcuZCUe69
         w3dXrh9Y/B5yBRbx9p8vX5SnXtpnXTjON7/UpjXSoQR16au3zWvwLXA8Bkvx9zh4v+y6
         hq6A==
X-Forwarded-Encrypted: i=1; AFNElJ+NysaVIy8J3PudrEvMe6I539d4+KwJGeHSfpWa2u34hfud9ZjL5jh5jFUbrKoOA182yoN8cIHQdGVR@vger.kernel.org
X-Gm-Message-State: AOJu0YzV4i4tc9O0reTdOapVnt6aO4J07hAOODViHXFurSQnBVXIbXw6
	2UW4h6S9VIXJvJCpsYnOYfHBlKQzVTGmziQNeRgE7jqAWJ6CtdSShQ0B
X-Gm-Gg: Acq92OFn2ALW0Wkiaa/GE9d+43CApU7JgJZg/yTmCMH/auw4mGLYlr/r27MopfjWdoU
	+v3hLDGYcrftJxZnmUm6nWhi+Z2TZdTyg7cGKbLmdY4mpXEHCxabNs0Z4fKgmLvfGbNCFH+H/2C
	ZFVJIpOGIjYxcMqGIbYUxG1AojSQyBzHRs/I9R0oY0I7nXNZDI4UYdYvkWt/Y3kcvtOh2aHpKOt
	c/x57xuhu9y6NVF1Aa1p37db25IFq76KwMhCTLNDs3T/hTosjVBC19hkxWxM8qBDgVmH3Fk8/02
	vSyutsbYygWCESiEfOKJK+N4BShPrud60trLf3fkboMTBmUcQ3GYGSuMukpY+ptavi6gOuiSTzD
	CZ1vw7eEqf25g+N5qC1siWgO4olri98EHHwO8zAzSdfsgUdAe41gCS66jDmu+CyGRL3YO3WDUJc
	QiDwolf3RlxO1cjSR10Y3vJ4MVpjNTMXMAyklAvx5I7VyQd3pI
X-Received: by 2002:a05:6000:22c1:b0:449:a07a:9676 with SMTP id ffacd0b85a97d-45e5c59ec63mr30296381f8f.29.1779189600659;
        Tue, 19 May 2026 04:20:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm46066323f8f.34.2026.05.19.04.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:20:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Enable RSPI support on RZ/G3L SMARC EVK
Date: Tue, 19 May 2026 12:19:52 +0100
Message-ID: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series enables RSPI support to RZ/G3L SMARC EVK.

Geert,
There is an internal discussion about dropping patch#2, as RSPI is useless
without a device connected to that interface. However, as per the
schematic, RSPI signals are wired up to the PMOD connector. Currently, it
is enabled on RZ/G2L and RZ/G3E. Please share your thoughts on this.

Note: Patches are dependent on series [1] and [2].
[1] https://lore.kernel.org/all/20260505123708.134069-2-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260519100022.116318-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 72 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++
 2 files changed, 91 insertions(+)

-- 
2.43.0

