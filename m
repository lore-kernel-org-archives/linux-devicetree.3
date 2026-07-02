Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66E3A6B71
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015909; cv=none; b=RfDF1qE4Brd9s7kotEI5cqwjXiaBzK1fDqU/JLfBysU7ayWM+uNDXe4DwKhaIkMoa4hdaRazvzfzAgCH84R2CrXIlxiWN+Z0VYxxVYdfQZ32HLJNZIFzRh3OsJEnOhV2sOBOMoD8V0D7n9UeQrAqWK23E4ItOSNgVdtOdJJ3Q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015909; c=relaxed/simple;
	bh=hwCMbQOiZREN6cIUCJHWWmm1HntdXr3h4PlM+Tbadsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHa4YMlplz6WJSTxIKx07TsNbDwMQLaWUhmutkLF1tvnTKUIXuzMMCs18p11Be4IK0dQ1XC1h/hANFBYJN2NvHktDt/7/l9leQ6MLRmVymSSPC5yOXoLP68DH1fSOwvFdM9Y9uwdM4Gb70LaZRnUnRbkAioODMQ0XFK1/M2TC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Boh8qgvP; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Boh8qgvP"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-922ff615c14so175868285a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783015905; x=1783620705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=Boh8qgvPRVtyxiQWLHjETETL+CqebcD1iN2UmwYm/bWAL6b8ZjW6Jj7Bs8xd5av9ds
         DinP93FoXDvSVJ4SPRPluyqRXt9K5N4EmGJqumF2YQYos2EfW0AlQYTybZD1pygMDvbk
         caK0BjsnDYSUdyss2EybRTxYv5l4JKs3RGZF+w0lMQk4u6Y+p3dw0mYk0NfrP8H6E9V6
         enob59LsJ1UcAH5qi0IMSMnNlUw7Qi/GvgPJE7lnfSrOE6zmeR4it14nZNeY2QjFj0UQ
         ApACkaFh1XmFR8xbIqn4xLKsWb6NL2XVIHpMvpXo4t/bHh0psStB+jTgfAnrvsNcK/dl
         48fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783015905; x=1783620705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=FYkwdSZAUEWuQn2aF85NDjgAJCrCcvUzol/UgT3578uQojQJ7t2zY3t+EBrsDotZwA
         mZROo7Sl/AgfebgZL2knH1oIODUljYYK9fwLRfGeaDxdHYaInSu64QLcbh+gB1UCKLef
         40tB9u59dEr13xulePa8I1uG4hMWha0EauxAlTQgJu0joZd07rHTBbqa+Jdxyc6xtEdB
         63RkecPokEpzlKfx0VYMFlJCAv2ch+CUwNpgOMq2ho6Ll2lDJgx9Px1ZXC7nPtgVjAsy
         XwVDgbIuO7fls8zKwjPxB4w2cH+TWWGydwlxnKHOsQuJCL1osaUGZZk8QZG3acAnar2l
         AS7A==
X-Forwarded-Encrypted: i=1; AFNElJ9bUnfUqX01cBsdldnzd5vwMAKmLcz9v5pd/u4MiwJZ4Zk0AinnpmVIXBvRKC1apLLZe4FjJVwdGcEG@vger.kernel.org
X-Gm-Message-State: AOJu0YxnE50H1nrpWCWGt9KOv7LVleK8XgpNtLGE2GSm6ADpns/1v7Zi
	viGnc0gRcdpkObAkLT4pBufZtfQf25kzawGEOlpcQGnnCiZQ8464P4pe
X-Gm-Gg: AfdE7cmtW3eNaKL9GW9nNNQOl45JygghByoFBvcoZ1ZGIPotcR+xL3cxGZI+sUV2TlX
	RivIgQVXjCa84/x3hGNc3XBeSUFDb5LP3ZXaRSspYPoeyQRyLha3ndCoIx8nBozcfrF8SnEbzZ1
	27LWgpdg/MHJlETpOugjhj4+bNH233zAMrYn6oVi6byUaWaO/M105urOkyArnlX1zJWC0gSaILN
	29ECd4ykvjTPgqgyCPBWO7Gy/0IGVtPl/8+XUH19p8yHirwAiG3uj1eEWiF75b6LLdhx+WhwaZ/
	TDHkjVa4+fPNgnlsP6SDgavw6IqtGeFEdzY2ayZbhSXi/uX0rQggANyQlGibWfUUoAIp3Q1j2W6
	57/QabrraTppZpjvNpYtZCQDUSq2wKAA32XWPc/MJcI3dbbDXerLqwNX0qWAR1FqpAqTe5sJxO5
	I1I8co9ZezhEuI9U4dEJcXHMxSeJpMM1PPlfseJOOwaA/Fn4lwPa7J7Wjeg7QScRi6O2qWk/g=
X-Received: by 2002:a05:620a:3722:b0:92e:4927:1ffa with SMTP id af79cd13be357-92e7825b2d6mr905846685a.24.1783015904823;
        Thu, 02 Jul 2026 11:11:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80194291sm274217585a.37.2026.07.02.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:11:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] clk: sunxi-ng: a733: Add reset lines
Date: Thu,  2 Jul 2026 14:11:40 -0400
Message-ID: <20260702181140.883070-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Same exercise for the reset map: I compared all 121 entries' offsets
and bit positions against the public A733 User Manual V0.92. 115 match
the manual exactly (including the multi-bit GMAC0 entry - 0x141C bits
16/17 per section 4.1.6.212 - and RST_BUS_SYSDAP at 0x7ac, which is
what makes the gate offset in patch 7/8 stand out).

The six that have no register in the public manual, in case you want
to add provenance notes near them (as already discussed for other
undocumented IDs in this series):

  - RST_BUS_SPI4       { 0x0F2C, BIT(16) }
  - RST_BUS_SGPIO      { 0x1064, BIT(16) }
  - RST_BUS_LPC        { 0x1084, BIT(16) }
  - RST_BUS_GMAC1      { 0x142C, BIT(16) }  [GMAC1 question]
  - RST_BUS_GMAC1_AXI  { 0x142C, BIT(17) }  [GMAC1 question]
  - RST_BUS_TCON_LCD2  { 0x1514, BIT(16) } - the manual documents only
    VO0_TCONLCD0_BGR (0x1504) and VO0_TCONLCD1_BGR (0x150C); there is
    no TCONLCD2 register set in V0.92

Everything else in the reset map checks out against the manual.

This analysis was done with AI assistance (Claude Code, claude-fable-5)
and each finding was checked against the cited sources.

Thanks,
Enzo
