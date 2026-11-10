Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284654;
	b=x95EWaCtnaSjDSoSUV2KgJiL8CuoQqIZIp5BqwQTZtY7ze7Bwi+hW3IAORHGwHL7R2zl
	 y9hb2EhDFb1IQVOe59ggt/80zFJvqepBoa0Hmw7w/JgubfsRR0RYwl60A35teftmiL+tY
	 TZBMC1tCw+SbFPhaDDhIQlj3dBG2ESw+ENlwwXiGkB4aQtwPQ9zORe70pR62MK0oB6VSp
	 8vMhj55e674nYXC9guSwLtF04x/RPoJjJzQ6WSvhIdGqZ6FQDt79MipXZhGlBDtaCD6R5
	 JnkomaBoodINiXQ6hPezg8+v6uxfpRbxR5cAg7us+KsCtBelW3X4KG1kU61Xi8f4UJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KtQ7MYeLVAuI+S3wrzryY9ksbyCrYV9o4wIQkIktrO4=;
	b=IM24iXRQh5L5sMQ0oHkTKASCmOKb72Fw2rFIqnjcjWE9PS/JVQSPYpKv7NKXR4GEBERo
	 KFneR23Pd8SH/grN75/FGwjeuUI6gabKJhqTfT3Xe8ZxNnIEcatOsbOHhY3eKmIdg+h09
	 TtWIcTlWQ/7CvS+JKonlXAG7pFiib54ERmQAP2jskkEcgIe45jA0uCVLrg9CNcTJIw2ts
	 6W21SZ1+4oXw+/V7kNxIdez0sUetKo5jti/mIpdccSE6wMaYAmU3vd9B6NWd6XDtbVfvM
	 DEcDeTkshNolhbno/kyzCfqbT8gND1qTrL7bcSgnQs5ES+RL4ngjy+Q6y2DmzZHyxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h9I8bgys;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61099606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61099606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h9I8bgys
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-372bdb942dbso2198025eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284652; x=1794889452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtQ7MYeLVAuI+S3wrzryY9ksbyCrYV9o4wIQkIktrO4=;
        b=h9I8bgysoRZzEi6t8lGPtPIabGW/3UTAJ0n/QkNhXiqoivFsAFS1YplzBF1jBvdUyx
         zPoGIa+DiMCVE5K8EOZiy3O10CLCiKvZFZhrxoxfPRQcgTTsZG8zOn/miUQf3pDAYlYQ
         fWies2/r+vXax4gGGrS/rRRBouQNbMDe6ZoEKOXdUA4zZzUEUQ5xLlVh6F2f804fKzWW
         kuBQhi8+J6dxpzeqwuZ7CNZIZA0UPEJkcjoY08+vJy3PcL7ZVtJhtP3y5FDWgYWyPJh6
         566ZqNJQwshB2u35fhs3OiJBUhxK2YHgO6VcqlWyIbVwacOPNt1dNFw19ueLdS5cTQ7V
         sWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284652; x=1794889452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtQ7MYeLVAuI+S3wrzryY9ksbyCrYV9o4wIQkIktrO4=;
        b=A/K+6TAZxp1ZjH65fleP7FC2R5hCSNwseIImtaWH1t0G8TSi5bZFL+KVGXc+pW771D
         nrYpEPDHnEE9k1vXQPQ3nwgcU3ZerOWUrBiLvNzseGfgdW106Cs1WXd9xC5tzjlBJI28
         y2+G8WiMPv2OqM0AwPv8cBfJTiCbhSk49/C2632LEtGdOTaDwa4i5UT9DO4wgE866ddd
         ofAbbkGh8qePiOCar028M/ZJ5XW5MFZJhWIYiaHRWXEMWFJWXMFpM75q4/dx/bLyWPuS
         rvK32wOscK6pIjfNcFSzJ0qF47Rvpz+sWngLARX4e/4Q6u8DJ629SRER9+IpKwZqWlT2
         micg==
X-Forwarded-Encrypted: i=1; AL+hErGIQsUTH7d/IG7e08PhRlM36MHg6AA7qIbeLFSAw76ZvrwBC7RqhrIav1BYCcoFLGkGfk/8peLBQ511@vger.kernel.org
X-Gm-Message-State: APuU4Z+nwYVbJuK1GIRNXclfJ57JfKNKAW9bDIAwhVX9i2MSKgK6tCNY
	GVnzL6lmvzVohN08sS2/y+qdIMXrqULdOndciwHNrK1FaV/94C4cLvxYsicckuC/kg==
X-Gm-Gg: AYBFou0fDX+B2bPQg1JHZu2IyyastBaWYdAaGhAXPYNSRW7cgT/S3H02Vezwh+vmMop
	uLlZa8dtxjHIuKE1gdDSqZ58uXAmFYuHcHhMlnDBFdx28m0XzFAdMFOqihQ0rXgD50Vjj9830mW
	htjvRUiVs1qfNrasQeZeMhUvHN3mQC8MhWOzbJfVOzb9zbs9ajff7Co2yeY0zQDbZ0i5eUzbq/F
	Ugz/U0AxvNxuKcDhEk2Z4YESBQRm8IHQUZrL4wu83QznNMkLvQNbZH0n2bkyY/U+qRbaZOX82c3
	0h2bgQjkC56ZJjuqm/R7YEYOl1C8XW2FgFFUwo+AaFtvLSAOmekE2656Hu1EZV7kFHbSMWNgysn
	H9yzs67SyZNjfdFyelWMpRDcZuUr70yvVxhi3DgGoGBZazuzrFMDjGIS3RQKbrbiC0NsD+QNNhs
	eFvD0Rr58gSa5iAx/A+JccMViKlOKtoJAePcWClCtu+CWUgvjc634AseKBjdgX8Dk2FQK0V6cD0
	TIj9yTWgqYxokHSheaHTUgqjU1Q5Uo4a4VmMB2rEPpsnSIZDlKq+/NZcrYBexkDyL/JFK+HK5Kl
	orqYjjEa6BkvVIJaMrdGsGAIRxGBxP/ZAbQcEOwHQsMYkLi5J6Orz/Ki45CQPt4/exmNaUTpoHy
	mDeqXkd7QmyCwcfgN
X-Received: by 2002:a05:7300:fe43:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-3751ee7bee3mr1721070eec.11.1794284652163;
        Mon, 09 Nov 2026 20:24:12 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:11 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 0/3] net: ethernet: ti: am65-cpts: add PTP_SYS_OFFSET_PRECISE support
Date: Tue, 10 Nov 2026 11:24:00 +0700
Message-ID: <cover.1794284248.git.jjc@jclark.com>
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

Patch 1 adds a syscon compatible for the GTC register frame that selects
the bit. Patch 2 adds a ti,gtc-push property to the CPTS binding, which
names that syscon and the CPTS input. Patch 3 implements getcrosststamp.

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

[1] https://lore.kernel.org/all/20260828100615.1700223-1-r-sharma3@ti.com/

James Clark (3):
  dt-bindings: mfd: syscon: add ti,am654-gtc
  dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
  net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../bindings/net/ti,k3-am654-cpts.yaml        |  17 ++
 drivers/net/ethernet/ti/am65-cpts.c           | 289 ++++++++++++++++++
 3 files changed, 307 insertions(+)


base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.56.0

