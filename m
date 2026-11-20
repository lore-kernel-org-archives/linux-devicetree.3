Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146431;
	b=Y1ZMSLcJSE7pToLh7MQTruJC6fuq7oJXapTHNYZSxAr++39XrIIEfIY/hlrKBVggXhDA
	 MOVBgMi0MbKBi80nqW7ctjZRcmcKnP9y24lModzZBaH+vYPrshaeCeQVhYm/DOPunMLDg
	 irh9+1n35Y1+F7wgSvtxoT24a5BRjLaEhJsoyDRd36QYFf7dMEpRQqmAQ6m0g1+5M4WNe
	 37NfJNDpUDYePKVQlZJsCiiYYyqxyfiWZ4OpYMwbUIx06rglcp6/oRdlUR6eMPKvCgFr2
	 jYP2zMT4+x163j1chUJ+jdMeoUnDdd3AazhIvNbh1f1GDAxSOlGjFx8EksPd45wD8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
	b=20hoEfpc9jbILKj6xRB8rHU2eMm5Ja7HP6TbRmPSyBYh4JFaSTv1ephgxkxb7pGkWgkr
	 nOGPeeKKHkKsR1cv9wixqKjwvf98vz6e1ESQWX9H7FhrQckB9xcSlYaAtwqW+2j7RbAGj
	 aLdMG4NSxEzWI1+w5OmyQ1yp2CCBshFaNBXeZJ2TfcPv+3gDkTj03gZ1Kr/AFM38C26EH
	 +SpApbJ68KR+d9Z0a79ZcTl3SLNp+vffulk0dZNJBayOy1JsUcVkreJbzpZs68HP8tb4Q
	 9TLGZc3gf9lILGQ10fwaNQcs4ZCXvsYaHeQ9NX/ydHSYmshFMVH7fpA/0qOQd7Tluzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lLf2kzT2;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CBE606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CBE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lLf2kzT2
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eff92780daso3210405ad.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146429; x=1795751229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=lLf2kzT2lePKBgkST06X1Iaazif3jW3bNdINE/GdFmoM7vT4txZnJ/K0nhovB8+qzA
         qY2ctuJV+UBu2rqvJLbcAAzW/ut3NeWAmB/kzZzVG7YKgSMQYjPL0q5VRsFKH0Qv99hm
         7W3W5YFugak2zgu93DWFW59YjP7Zt9CkuzRQCLTJBSw8CViQfYETL5O6Ul18Qyf30cUG
         0b4dqlok1MwTlg2acNO0WZkH6a9lK3tkjlRpqfvmTed29LJjf0M47cJERx1vL11/8MEN
         hXuD8PLAiGcBZXbWTOFentBJsiLZRB946I5nigldU236zvOuQZjh9sboJJuJDqGhgD0s
         yhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146429; x=1795751229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=ztt03U3W++QBXa+P5lAklplDjvSBxBObpdDslf6d4XDDRkUo7Ib8SmOG/TKrLflqGA
         FeRhSygUoCjzS9BM9gdMiXrpD/RwKJ9Yj5tr1W+bLeLgutZg5STk0GkGvNdnvvC3sMYc
         uHw5fQk5HcEZZFqOL8Q7idDcQmkhMqBp4ghT/66SIdn3LyNfADPu3Hpj/KpcbZaLiICn
         Bqdw+4QUnGCWT+xa+3Sn7xskUuPT0MViMbn3hRPVCKPynAM7vltjWN/BfXSGVrKljSZf
         8ehUpSwOe0OYYQJbcUkN8zGv2/loCvbZoj4JcO315vhV/IvuVZGjeIZQCDkgkqAOWjVh
         K/kw==
X-Forwarded-Encrypted: i=1; AL+hErErb39IQDJUo/gJYDmxDrADYg4wmOWNZoeyExoBvs3H+X1ovRLBakuic6rcxAFPYhNP0+VsBkvINNlE@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVol9OgobaYDHRo+DQ7o8Z8t2ZbtNa/Qtj0dgMzPksERk9n9e
	iANCEIMXX+CR2BXgA0m5hQ7iNRqOfXc41aAp/5pRN7zLJHYT6vYkuP87fP5h2Z9XYA==
X-Gm-Gg: AZFdTZfGO6Eo0awcyg3V6yUJkqbOEoU7gdl5b86EZazwVzhhbLZOXGmizVqt3BkYykV
	Mn/MQM5JEebVJqZXnGP8XxhMo/t37M0xkcYgcAjYIYhmA1zXvmkpbnonii9wXXOPhHQDehp6fit
	KGsEUfgVR3pKSazLA9Bttj1YMZOsokHTIOvr4FPsiIHj3dHrpdCbYM+GM6YqnUeMRkg6uyjB/jc
	q2k6fnF3uA2CULjz0Zasd8DmeGEjl/wYguyp2uAmC9A7nCrTp89IEBPyIWJxd2jN+B4j/rLH8F4
	/aBF+FvrUCzYIK6blfBqWIoFLA1sADyAbDNjcOkn5qeNHLo9fnZ77qtL1LMxfnKRe5psXKUX21x
	h2PsqiA00IPGw08piHd3KMuzfFmVwGqHUL/kB9Ca3RPFy3BFWTcAHoEfIlDpMAiZjTIHDoZm9vU
	OCTqGFG3EJBAKfrp/nUJxjbMk5t3yIMbV4y0074PD96NeL9Lxefs/n62r1W1/hms4cCYFi63PoQ
	qqoJTasyc+oX6eaAbSCl8zxrhIbKvduDnEmXG+MMgOyC54bp8bdFOXOsm9cRnDU5HKoBDd4Bksk
	33OvkLmB/KgwQfpzcD6AebKnNOy3ktMI3JHEx8iwtVFFgtoHUgvXuGuVUr0vjgcZ1kKxOm74Wxv
	NuTaDqGoDTIZpHw6Z5g==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr1285768a91.13.1795146429308;
        Thu, 19 Nov 2026 19:47:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/2] net: ethernet: ti: am65-cpts: add PTP_SYS_OFFSET_PRECISE support
Date: Fri, 20 Nov 2026 10:46:59 +0700
Message-ID: <cover.1795143925.git.jjc@jclark.com>
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

This series adds PTP_SYS_OFFSET_PRECISE to the CPTS driver for TI K3
SoCs. This brings a similar hardware-supported level of precision to the
transfer of time from the PHC to the system clock as already exists for
the transfer of time into the PHC, whether over the network using
hardware timestamping of packets, or from a GNSS receiver using hardware
timestamping of its PPS signal.

The system counter of these SoCs, the Global Timebase Counter (GTC), can
export one of its bits on a push event output. The Time Sync Router can
route that output to a CPTS hardware timestamp input. The CPTS then
timestamps edges that fall at known counter values, so each timestamp
gives an exact pair of PHC time and system counter value. This is
similar to the PCIe PTM integration on these SoCs, where a selected bit
of the PTM timer drives a push input of the PCIe CPTS.

v2 drops patch 1 of v1, since it has been applied to the mfd tree [2];
it added a syscon compatible for the GTC register frame that selects the
bit. In v2, patch 1 adds a ti,gtc-push property to the CPTS binding,
which names that syscon and the CPTS input; patch 2 implements
getcrosststamp.

The series does not set up the Time Sync Router. Mainline has no binding
for it on the J722S, so for now a board overlay sets the route, as it
does for ti,pps. With Rahul Sharma's proposed binding for the router
[1], the CPTS node could select the route itself. ti,gtc-push would stay
the same.

Tested on a BeagleY-AI (AM67A / J722S), a BeagleBone AI-64 (TDA4VM /
J721E) and a BeaglePlay (AM625).

With this series, phc2sys steering the system clock from a free-running
PHC sees an offset that never varies by more than 1ns, whether idle or
under memory load. Since the PHC and the system counter run from the
same oscillator, this is the noise of PTP_SYS_OFFSET_PRECISE itself.
Without this series, phc2sys falls back to PTP_SYS_OFFSET_EXTENDED and
the offset has a standard deviation of 2.5 to 10ns when idle and 22 to
31ns under load, with excursions of up to 200ns.

When the PHC is disciplined (by ptp4l or ts2phc, to within 4 to 7ns rms
of its reference), the offset seen by phc2sys with this series has a
standard deviation of 2 to 5ns, whether idle or under memory load.
Without this series, it has a standard deviation of 5 to 12ns when idle
and 22 to 29ns under load, again with excursions of up to 200ns.

PTP_SYS_OFFSET_PRECISE has a fixed bias, the capture delay of the push
event through the Time Sync Router and the CPTS input (about 11ns, plus
an undocumented delay in the GTC), which did not measurably change under
any load or CPU clock. This series does not correct for this bias. The
driver similarly does not correct for timestamping delay on extts
inputs, nor for ingress/egress latency in hardware timestamping of
packets. It turns out that the bias in PTP_SYS_OFFSET_PRECISE and the
delay in extts timestamping largely cancel each other out. The offset of
PTP_SYS_OFFSET_EXTENDED relative to PTP_SYS_OFFSET_PRECISE is about
-50ns when idle, and moves by up to 40ns with memory load and by up to
60ns with CPU clock frequency.

The implementation was also stress tested by using ntpperf to load the
CPTS (-D 0 -M at 15,000/s and -N 0 at 5,000/s). No errors or wrong pairs
were seen.

To try it on a BeagleY-AI, apply this overlay:

	// SPDX-License-Identifier: GPL-2.0-only OR MIT
	/dts-v1/;
	/plugin/;

	&{/} {
		#address-cells = <2>;
		#size-cells = <2>;

		wkup_gtc: syscon@a80000 {
			compatible = "ti,am654-gtc", "syscon";
			reg = <0x0 0xa80000 0x0 0x400>;
		};
	};

	&cbass_main {
		#address-cells = <2>;
		#size-cells = <2>;

		timesync_router: pinctrl@a40000 {
			compatible = "pinctrl-single";
			reg = <0x0 0xa40000 0x0 0x400>;
			#pinctrl-cells = <1>;
			pinctrl-single,register-width = <32>;
			pinctrl-single,function-mask = <0x000107ff>;
			pinctrl-names = "default";
			pinctrl-0 = <&gtc_push_route>;

			gtc_push_route: gtc-push-route {
				/* input 11 (GTC push event) -> output 14 (CPTS HW5_TS_PUSH) */
				pinctrl-single,pins = <0x3c 0x1000b>;
			};
		};
	};

	&{/bus@f0000/ethernet@8000000/cpts@3d000} {
		ti,gtc-push = <&wkup_gtc 4>;
	};

I used an LLM coding assistant to help prepare this series.

Changes in v2:
- Rebased on net-next
- Dropped the syscon compatible patch, applied to mfd by Lee Jones
- Made a failed ti,gtc-push lookup a warning; the probe continues
  without PTP_SYS_OFFSET_PRECISE (Rob Herring)
- Three smaller fixes to the driver, listed in patch 2
- Link to v1: https://lore.kernel.org/all/cover.1794284248.git.jjc@jclark.com/

[1] https://lore.kernel.org/all/20260828100615.1700223-1-r-sharma3@ti.com/
[2] https://lore.kernel.org/all/179511436097.97786.7515300839199702588.b4-ty@b4/

James Clark (2):
  dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
  net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

 .../bindings/net/ti,k3-am654-cpts.yaml        |  17 +
 drivers/net/ethernet/ti/am65-cpts.c           | 313 ++++++++++++++++++
 2 files changed, 330 insertions(+)


base-commit: 5b87a11b1547c39da01718044b9f99fd85948b9c
-- 
2.56.0

