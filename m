Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878067;
	b=hJq2KFKLcSMGTOYGQ3P2aEnfsTaBcftoE9tKElrEFgPSLyX8xcfd49teoOezZRxiyE/l
	 KiTHoQhFUh5uODsvzmxxtL4xfI3vozvib2wtUVDj6okISO7DSHXT7BHUuNRInaQh4QcDW
	 dmfcMfeh+JwXJhrhvv0Y/E1YbYKqindlejtlZJrJIpgmpLJC/5HhWS48c+ySMO2yNVrIN
	 vL2HQN5lrKkrUOxv7dr2OGs2y4eIEzJ3TffKXwV+cQYmlIg13PnCato251Cc2WqSF4VJN
	 ECcToekpwhpzI8sHSeP7+QxNSflpgJrtVuOUC6i3U5iFvGFz+stIPfl3PGiM76n0zEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878067;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xXjNLXbKtaiU3JiuzfGRd1QmG4o+s1nbrs6MCjtYeJs=;
	b=KtVKlBC56aoEF74bJIINdpHx2UkmIMwJrSfPkogTLxhs/eeCEUU+6hHuYARzHCulyY18
	 yPM//bOYW/+LwDCKgnF/KIWmgjVt3XZoXEYBKLPLHWfyJ7Rtksr1EhhtnAJ6EGy30qwm/
	 YzY0JXpkim9qUI0zAP+WAqt6PFKcEVE5DYxXOky+bVTDmuKuAcZpVx1t2i9dh+u3grWPr
	 sggyzYEiwElJQl5saFlyo9ZYsBJYQgSuRcsfbpcAdmN0uTpnyFlAu0ELAWSiEce8qmbpK
	 k1w0OS8N4lE8Y3vj/xyYN4ZmlHBTDdB6gEOaZUL6lYMCo8IdBf0XM5joNrsrZLIOTzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611C606A31C;
	Sat, 28 Nov 2026 15:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1611C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xXJvC-000000003eR-0oXv;
	Sat, 28 Nov 2026 15:01:02 +0000
Date: Sat, 28 Nov 2026 15:00:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH 3/6] clk: sunxi-ng: a733: Mark mbus-msi-lite2 clock as
 critical
Message-ID: <awrsqr_7vfnipcra@makrotopia.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
 <20261127100808.2292229-4-alastair@d-silva.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127100808.2292229-4-alastair@d-silva.org>

Hi Alastair,

On Fri, Nov 27, 2026 at 09:08:05PM +1100, Alastair D'Silva wrote:
> The mbus-msi-lite2 clock gates the shared MSI-Lite2 DMA fabric used by the
> USB controllers. Without CLK_IS_CRITICAL, clk_disable_unused() gates it off
> and breaks USB 2.0 host DMA transfers.
>
> Mark mbus-msi-lite2 as CLK_IS_CRITICAL, matching mbus-store in this driver.

I ran into the same on the Orange Pi 4 Pro: once the gate is off, the
OHCI frame counter in the HCCA stops and every EHCI transfer times
out, so the on-board hub fails enumeration with -110.

I would rather not make it critical, though, for the same reason as
for MSI-Lite0 in the CCU thread
(<20261125115320.3692954-1-alastair@d-silva.org>): the gate has
consumers, and they are known here. All four EHCI/OHCI controllers
(and the DWC3 of the USB 3 port) sit behind MSI-Lite2, so each of them
can list the gate as a clock, and the clock framework keeps it on
while any of them is in use. A board without USB in use then does not
keep the fabric clocked.

What that takes in this series:

- 5/6: add <&ccu CLK_MBUS_MSI_LITE2> to the clocks of ehci0/ohci0 and
  ehci1/ohci1;
- 2/6: the generic-ehci and generic-ohci bindings have to allow one
  more clock for the A733: five for EHCI (bus EHCI, bus OHCI, OHCI
  module clock, AHB USB SYS and the MSI-Lite2 gate) and four for OHCI;
- ehci-platform: EHCI_MAX_CLKS is 4 today, so it needs to become 5.

With that, and without this patch, all four ports work on the board
here, including the hub, and clk_summary shows mbus-msi-lite2 held by
the host controllers. I can send the binding and ehci-platform parts
for you to fold in, if that helps.

For transparency: an LLM coding assistant helped with the analysis and
with drafting this reply. I personally review every line before
submission and test manually on the hardware.

Cheers,
Daniel
