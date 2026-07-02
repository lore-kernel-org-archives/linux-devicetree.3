Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1FF3D79FD
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 23:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036296; cv=none; b=FHrja/fFlE8ru4P1F5mrQJJdqaFcxhff4qlwimO37+XKYf7NxysxTyfJ7aMlzHMAL3+7eW47eq7/HwdCzGhpwgrOQGsdlCOIbDG96RGgEeCK6KsKrMCn//eKz1eIkwdhUnKepSHtj6Fk/loQFCVwuhXI6pVP2G5DCcY3vkfuC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036296; c=relaxed/simple;
	bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpA0AzOrMe30Zlmh0VmLZ1mRa6XIg2PElSE1EZpTtYBTpKCgSTWFUdSiIqwfqW6SWIFkjfs+Ic9kosPHlYhQ+It93WIgJRDr8X3VG+z2WEB29LfqdhqQ7VoSEsRkVP7hO1fuxcosL/nkubCei1UclMLbQ8y7tLT5P7TSgX678b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXP96XdT; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXP96XdT"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e6c4a867cso369285a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036292; x=1783641092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=iXP96XdTOToKzaF6Qp9a4gBV8WDbtF1/SydNBJmoN+pRHI6G5IOqWXClcRvly7c6wi
         6lEOxRPkzXSYl0/oape9WgG+TliZqXl9MCfP41DYL+SZVD0LGbN46saXfEQ3MpnDhYox
         FJ4Vx8tM4NW24wLuO5BJcY9q+pl45m1pmpRzIt5sy/PWhKC43S8etATk0F9oBe4kDn42
         Y2/+O8RaoTzYWYqW9ocHeSK3lfBHJr60ZhAFqqbE7PmI5Ovykxbm7JvgnE0HFZEwXHXR
         Am8Mltxt6SLghpGlhaWk9sFlUcl8qlVfOKokhIH/YE2EiQB/BhHGVm5E3fxE1JbQG8sh
         GxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036292; x=1783641092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=A4yZdiRdOGH74jT47iWOoAFov0/4aymATJanelreJnQnuvfGLKA2VGUOZ7C1uKJ6qw
         k1JIn3+4E2BB9gOdsDaUXlJTfsQzGnstMicH6LFdbAL2RoHF97hJKVN2TkmG3bIvtIbK
         iv5tNYc1iPmioJcyYJEsjIocHz6nqXLyuWhiXtWlO7zXt6BFOrVabpo+qqKawM/R5a95
         TTVijQJZ2kaXoW11NpQ4tDB6YGSCrwS6+2N0jqurT4vZDA0c5k7wlM6eNB8acHMg2SDT
         v3upBgUabxA/lPKc4Oo+W1j+LybSxaP+4uDso8n24S33KRSM5LKJRHwOBs1Avpw0BQnW
         pLRw==
X-Forwarded-Encrypted: i=1; AFNElJ/PtvE7L2iSXlseH4VCKdrJZ2uYEFxZzq8KaMU20e+/jYTsVIeyJVFirpt2O+kPcSefqnvCJrf+bzmr@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOjTkRM8d/9XsLkqnYgGr7nQp7OnWx1B1adI7kIukQXZPbDQb
	F9+c1abmdiI53JkjYLKbO7fLe10rDcWsDz/HrJI8PXD8r8tdY6zFUoOe
X-Gm-Gg: AfdE7clTlRmSjn+PR97h6HIgnsTD7knkLf5psatF45EsaVMACZCO0g/tm6VrLCrQ4oS
	b2gd0717+mqdAVOI4oExMpdM3FJe9vs/+fMYDDm7mluG+aUMk4HoYPpeEpfOSsPCz7uHdp6lSF3
	6IAGcqUQiCMCpyLOK/4FVhpBrJkI31DkpJnrziO3203Z/rubbsWdy/zLFN2cKkIo4+NjiexwRo3
	8vmJHYkN4l68LlUKaBktcW+i+NPpfYJAgkHu0v4u93JxDKEfhupdxwR/R2Ysm5K/HAwrnNwRq/j
	xKhYiqbEUcBuxliBafOTXsEU7uvSjaW3o3oGTLiP59hDyPHa7UD72UEv0rt7dE0aFl36A1j7wRD
	FJMkF7sRxBihyrZJilGABeUSfOGH1P2yXkAdsFhH/016/I/6fyDWLyk03U3OyaykP35w3X23HXI
	WdqSuOCjss2HeQk0LWuGX/Box+U3P9FGV0nF8q97/rXPjXLgxub8syYKRe5aKG
X-Received: by 2002:a05:620a:4410:b0:92e:76a1:96d3 with SMTP id af79cd13be357-92e7b3e82bfmr983241085a.34.1783036292031;
        Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm11476585a.3.2026.07.02.16.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:51:31 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Thu,  2 Jul 2026 19:51:18 -0400
Message-ID: <20260702235118.1225793-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
References: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Good to hear from you, and glad the series stays in your hands. I hope
the move went smoothly. No rush at all from my side, please take
whatever time you need to settle in.

For whenever you get to v2: I posted register-check notes on five of
the patches earlier today, so they are on the list to pick through at
your convenience. Take from them whatever is useful and ignore the
rest.

One offer, entirely take-it-or-leave-it: I have three Cubie A7S boards
here with serial consoles attached, and I am eager to put them to
use. I can boot v2 the day you post it and report back, if that would
save you time.

On my side I have Cubie A7S board DTS support staged to follow once
the clock and pinctrl pieces land, so whenever v2 arrives it will get
exercised on real hardware right away.

For transparency: I use AI assistance (Claude Code) for the register
comparisons and the test harness, and I check each finding against the
manual and vendor sources before posting.

Thanks,
Enzo
