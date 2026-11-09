Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268101;
	b=QYVSI8Blr89Ozb+reyz1tUkheMWLfW32XBLT2PhTYKhs5gOFCbfq2WsUuJk2JW8BYL8O
	 6ccYh+7sWIVAc299y+I23aDapFTw6/h2fpGb9BG3RPUFswf/1bIx7tviRcKijX1VmNuoJ
	 ljgNzpqbabjRoLUyPYGAYNF+2FCNj3qOvItNWMIE1E+wFROIu7ySdeDhGrfbgTwCpmiY+
	 VpMA9gqF7QHTPNeEZ+7gfBKNbpf8cEUF9FHok/qmpCMUIqwK8eGcXhYrgZDkx7Kb7Z8Ix
	 agp9mhrHK0OEZ9iuGFfzaO9HZ5NGHE0mY1yI5/MvUpaV99WpR/ZORjUWwn/4aaXn3CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=0kg/HesuQx+H+4XlkLsyd8/tGdp9/7GasWyI0Chc0Bc=;
	b=Q8ykhfA2vSSAjRhMFxcHPWod9GyUs/LmUHKS1PujdfBpKyN3QEue4WdPo5pLI8uZb9Kc
	 MwLD0N/XBixWb4Fc072fZqADFnD/sclS4ganTlagdFF0NZobYbGGyv35hkjibYHs4aPL5
	 LXtNvCWlKk4lqXgvRGpaZDbtA7F1FBevNf8BPfF2TytpP1V4o9uw9GJh3DfcOsrRaocur
	 BK9YlvJm0ZyjtLUaxRccWQnp1vnFr0klGAwzl47LrNCuEXQk5K+oQBuUVd1rx+VNd/gtk
	 IVmbGqmYs/qkXND0IMxgS2zBZC26R3F8eBhd85/5PJMI95WrhQLSrGIi9xzEDT4Lb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CSHDzbIh;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B088606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B088606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CSHDzbIh
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b2382bf051so832640b3a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268099; x=1794872899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kg/HesuQx+H+4XlkLsyd8/tGdp9/7GasWyI0Chc0Bc=;
        b=CSHDzbIhXxfGeqjdbH86qI7hJislmKI/V2LCUpEpyRpUZoBvES5AW/84/K2TT0s/BH
         hpnKKJrjkZxNSJONJ7wulfrFj3piNXUsLE0EMq72hvAX0pk1+NvI9y/qKy7pJjfq3/6U
         ZFs3DqUh62TldCLE7C1jvXuXUwqQ/SR/MicEOaagE8VRnxdzzGTkK8F/GnSycryt8OMY
         q1KTA2BFZ7pLwUWy5by1JBFe2xkvDUreki5UWswHxQufHPyAvEuzyJyKxQns02p52PCb
         59F8rrKQaGe7WOuk9ujru4n8Y2WkDq+he4MRXE6qWcbdlP9lEyqRZpdhSEjkYbs4AZEj
         mM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268099; x=1794872899;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kg/HesuQx+H+4XlkLsyd8/tGdp9/7GasWyI0Chc0Bc=;
        b=m8NdVgGAQJcUlfxaONvqX7Sw31oHd4Q8K6peeswf/30x/1FR6PKZnb18Qa0uXO+dK+
         L+nQJFprBmALwNWIqpGKe/fiVPjk4k4Jt6Tx8KTJ3Y5twOzJeLvwCisLU21Bvd3mnjoZ
         t3h5gDihOyelo7V98sThH3vogKmOVQdwuIR+HGcdWZS6eAV2zSQHMkPNvD/zHuS2zYon
         8CJ5hpTgJ2/iJpERGTvUqRkif5lWGkPG4GMe1j8NHmT2ZhHA8O7f/NIlRLb0c4W0Xcw9
         lLZevqQYp4GJckkhjmQapB196pF0+6DFY5WFzmQdCxFIVErOa7lZIvo5qg2hUBYaMd85
         GYRg==
X-Forwarded-Encrypted: i=1; AL+hErFhkKihqRIvI8JukKvRpif82iXtRk69K0wCmCWdZdjZPxaWHAEDPGtE2ijP5uw20rV+Cn336Z1YwhfY@vger.kernel.org
X-Gm-Message-State: APuU4Z+PFPNiWF06Oon1dZsryQVfUs9l4tLpl8fDeOf4n2F5kji0cTne
	2nEnAaE9TstxL8RCexFIJ7uhdcRm3m9MA6BM4JulavEbZPMrCf79xphR7ZOOxl22Igg=
X-Gm-Gg: AYBFou2tHCt3ikSATUlDYGOdASvAEV7dG05J1M2f3Ztsj4d3nc8+pI+5bNu2aBAWieI
	RnPizBUK1zU9O7CAkxiuLjffB2ufHoKPj8p4pG9o3VaDXMp+Sn68MFEiVoe6eEzTMcU1iPfEZp2
	MXkmD4UZbd35/LpdiWapq1s+NdfOGkTrjEAWOJNpydFLyKP98e93m0J48dueubSBz/CO7sWlhlt
	Tu9/byx6AXoZWBJatvexVm8DOnAtyaC1yrbc0uzNU7pgJsdCSalDD9B0cMHRI4ltu1D1kUfTzg/
	NOR7yN7uxsOAXkbr8eV9poKEoEY419IqmnDcBrLgiYN3VStNp99tnT+NJF8xXU3ll/eYty2oz8U
	evVeOKFsEv9/HSNPlJCpmIpZJxn2pCE7Y8rwD6RrfQDUoe8OQ3eN1LPq4OnsTEDIL8RWN1y+C2F
	Z7toZx5d24XzXqNjUFM9K9VW8f9y7RVEB5HMnrMJ9nPRCLdhHjELRZjCeyUivO2OqPwVLzvm6cI
	2qmbQY23NJb6hT+bqYjOOldY4agrk3YO4ay9yYISWtOQh9xKAHjIRIBSDdYsK2v+ZIx4l8bsp34
	AnEYccaAXH9WMZuHVGOjh7keTSijJnrBb3W8Pq/gDY3aUw==
X-Received: by 2002:a05:6a20:8f29:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3f18f98b947mr664988637.60.1794268099444;
        Mon, 09 Nov 2026 15:48:19 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cdd8d695905sm200663a12.11.2026.11.09.15.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
Subject: Re: [PATCH 0/3] Add support for BeagleBone Black RevD
Message-Id: <179426809791.2265990.16577191585004964317.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:17 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 01 Sep 2026 16:42:20 -0500, Robert Nelson wrote:
> The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
> redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI
> PHY to replace the EOL NXP TDA19988.

Applied, thanks!

[1/3] dt-bindings: omap: Add BeagleBone Black RevD
      commit: 4020138a2339cbb0cb6fbfc6ab08fe693ac5231b
[2/3] arm: dts: omap: Add support for BeagleBone Black RevD
      commit: badbca2876de684230329b49c30c7087cc88c10f
[3/3] arm: dts: ti: Enable overlays for BeagleBone Black RevD
      commit: e0685c2acb7fb85586490791b3e28497884fdb7f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

