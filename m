Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294409;
	b=f31wh+r+V65Ox9UtOh292nPgIIW+MaRxXYw0KQ2BtBQuCWrowamVXXKhFge6CAiwA+bH
	 iA9jOg7iDzZXKDKcUUhZqKzsq5C9IAejGGsXfBzdUATH1Gxww8XKYW9h9XjKM4+aNCWPL
	 70tlrrh0YDSWRIVkj9pnF+qj0z3BKAdFFQ5HS2oZrd06ep3OSM19/t+umnrxxRzM6QNxu
	 iJ7cCA7pTHo8b3WwKDNmkYM2lRqPQnJaAZVnoeizuCg5kPqStUXujJFy/IxleNAJ7A/kT
	 7FPIRh7pxHxyQ1bkvXRDduS1iNakhXWgBS2JZ8LJcR6XYbMWvuOp48NYy7Q4YTonV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
	b=XaIq+jn8fxl2wAYOWX6iNCGUn28toj/hf1U3BG8PW8eosYrrV7JleObrqOMKVZY8Md29
	 CEwq3dEW/N99zyInJGItyiexmR3HIt+Y/wKwS6YToKXEGqROr4QH3l8/oj8ue39twihYK
	 AOaJx9ZQ+fwWppEsJwqHvw+ipSHpQZXY8UU/nSBzfxZUfuqlLhe8VsofYJxaSMyNJFCg1
	 UpPmUQZjhh+gK+vEVFNXFuXZnGfvayoJz85BI5adM5X4KHcAyztNK0W1fjOH1JtCF+uPX
	 xBTBhMESKDtELf2dkcfbr2uS9iZyYOeawzq9xs0FHogbU4XbT4ER54JuwSW7ak0CLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xur0yAYh;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820FE606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820FE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xur0yAYh
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1034207b3a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294408; x=1794899208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=xur0yAYhREMTd55KzyJm5zbg3HXoHVb1qk1JhWPSqNWMyhGSzmKR/0NOqEfdIcTGt0
         032kXl//6GeRrYO5qabzdcEi8jRvx4DVKz+MNvgE/1lwV+fx5cQFmDjKq4RUmRtrZeUQ
         Kvaq9CHdh6vGjJsFmWKcvF7/EAB8A983xBzQ/6y76Cr7kR2XCMWDx1EUsQ2XVq8CGeT6
         kqaj9pDmn5Xu7+u96+GHsAzuG5w1pkt7iYlII3g+7Jp44BWV5xvUqQpn3jLqzgK4HT7E
         32Y5YB7O00VbjWH4JbEY4HOoCWPn32OeG0vC4vAGmYyrPu3Cqpy+MIoFVqmyM2gpmczD
         fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294408; x=1794899208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=dG6/SKsGPuKEkTLjkRB+/56oJ11j8NTolOwZ+jFZfatVNTi7I1vflaIOpDr3HKlrOv
         GW/2R7/5rQUi7VYAnJ23DzS1GUwMjjpoCiVKuyO7dHmTmXTlnR9kXKaa3pC10Wrf1Ebd
         i1VndwIyhsnYpyg6GjqN7XGP9ZNLzAwvVtbCX2Zq9nX/oeecJbCYArnFJD0SF/K3hGbj
         HN5zO0yCBYlvs9H9pZQCcvTd2OHOKi3IZ3uflhUhtSTQce72+L4VpJb/HkSzRxqG3D97
         dnxaEdbHfw+GbCK2vuvvwrDRqUitUMyUuE2yHMsUyY07/swBDLCjJoK+e1O4KJVzBqdt
         9qsA==
X-Gm-Message-State: APuU4Z8gHp9myzYn/eTDBVYebSKcO+Y0APiarlyDFN210baoDe819RoJ
	19mGxhi9wKkOwQoAWcigLBlvQgdQJcLGFfluT8n0nns5jWsC2spNhgMH
X-Gm-Gg: AYBFou0zMoR7Ps48fm6bUo9V6XaW9fsaxN+sYolcp5B9HAIq/NXtzffCJDt9hLllwEC
	m5aD0uTHcowIDNYzuRcGhJFzOa2QJinZvySq85NxKSvpXT1ybLTudeC8erpCc5UEmxj4MIQGaNJ
	xLC0/cpQXza2fm8gRcl8Y5a7OCTez2cRLI+SnD38Wi/AteJF6xbJ/w9OTPG72mY+FY0yWTaV4pr
	izQrKESOZzDxZWvWuAnW0N4NzKfRwJiCJZN155ad3KazJD9dJcMw27Y/3rbSmJYP6td/OFcLA8z
	/nGzMlMGoRpvihyrMWR+RqFocarTa6LsLVk2WkRAo/3fS2LBpVfhGJe/oTVZ05WqP6tZS18Lw3e
	fN/9c9BuDiBF93gyrd43A+QMnOcNWgNko5V0xGQ+q39L0rCaES0zMa5dBopzLTKEca9v6OyRC1f
	dQELH+ZZRLFEn8fhbRMI6XFQM/FqL1Zcnle3MSPkcvD2VN2ox3g6eiXD1WYff32NCrQWcpdffYs
	zY3T2FVIFjZiRGT7yAUklbbSefDk3pC+B+eAd7w3hNQ6FpCHLuGAk8TQnKRwng7FOmmddDhSpqB
	GJ9vgW7HT2AqRgWw3Ivqkeb9NNE=
X-Received: by 2002:a05:6a00:1389:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-8ba8725e415mr1910547b3a.38.1794294407637;
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3f3e7sm511794b3a.40.2026.11.09.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Tue, 10 Nov 2026 15:06:21 +0800
Message-ID: <20261110070627.217946-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Inochi Amaoto (4):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC
  riscv: dts: sophgo: Enable USB role switch on Huashan PI

 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 +-
 drivers/usb/dwc2/core.h                       |  5 +-
 drivers/usb/dwc2/drd.c                        | 77 +++++++++++++++----
 drivers/usb/dwc2/gadget.c                     |  3 +-
 drivers/usb/dwc2/params.c                     |  1 +
 drivers/usb/dwc2/platform.c                   |  4 +-
 6 files changed, 73 insertions(+), 21 deletions(-)

--
2.56.0

