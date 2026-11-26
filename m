Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685642;
	b=rvdCJvydeHiuurPLnu7cd+Y+QeUTShdN7uOex7v9/urywVheoU2yEBou3MfNZ64aO0rQ
	 b0c+VcUSyJ+ANyKQpIgt+fBNLWHgTw7tzFcsQUQMl0K6giiU6nnAhHCM3EvxbHATpYo7p
	 2ki0fFy0ecamxvI3SWq8sjIrdiRfYR84qVl0OMNqCG6yD3ZsR1WOhwCbl4gRJX4V1JCJO
	 zo/DzRmR2KnJtN0i1Xk+zDrK86a8I9tQ/mKxPajf46zGgog7DaW0dcATBE9hy1izT7Maw
	 N3FJXbtxTeeHwAnMyyIPWWhJrTAlwAA3a4Rp8ML5/CFwbUurflmbnLpLrw8JExSN/mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685642;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=ucEpGvcA9SB2CroMnWM6cqu6FMxnXaGuOXTzc8usxOI=;
	b=o8XGjmH/O99DYgk6zbaeBJJ4Ie0HE0ONGnRavQo9dO5su/rBbEzfRDr2dpa5Vn74xcec
	 WDcLUbj5nk3xc1TVY0OLwN9e2oZwkr+kwT04ZJX36onaL3law2Gqtoh14BZryUQepR0xw
	 Fc/39L84B1Yt4YpJ3xx55b4TQ8lIY9XWFTDD/LaoJ5J9IxTOR4H+LORK1myXNx9cN5vaz
	 A1AbPLgqz6nymMZaRlE6Jy7XnNA0Y39Ujzd3edKc1P1IY2FUOEPGdjm5RDAwZ5CIL6FOv
	 2CjSPnvsNC8pKPxITvToeXri7ADNZbnNHawI3xMO64cyHLdV2XsORzuYYBJIl3Ptjyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1C2606A31C;
	Thu, 26 Nov 2026 09:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowABXZ5j7_Adr5R_XAQ--.11314S2;
	Thu, 26 Nov 2026 17:33:48 +0800 (CST)
Message-ID: <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Manivannan Sadhasivam	 <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Wei
 Fu <wefu@redhat.com>, Drew Fustini	 <dfustini@tenstorrent.com>,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Han Gao
 <rabenda.cn@gmail.com>
Date: Thu, 26 Nov 2026 17:33:47 +0800
In-Reply-To: <awXrnQVKZBXKsV2c@thelio>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
	 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
	 <awXrnQVKZBXKsV2c@thelio>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowABXZ5j7_Adr5R_XAQ--.11314S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4DWr1DAFWxuFyDtF1kKrg_yoW5XF4kpa
	yfGr43CF4kJFZFga1fGr15CFyFyw4xXFy5Gry3J34fZF9IkryrXa9IqFZ8ZFWqqr4rW3yI
	qF1YqFy3CF1Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-24=E4=BA=8C=E7=9A=84 11:55 -0800=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Tue, Nov 03, 2026 at 04:14:44PM +0800, Icenowy Zheng wrote:
> > The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> > some PHY parameters exported as another system controller along with it=
.
> >=20
> > A few PHY parameters have unusable defaults. Add a driver that programs
> > them before releasing the PHY from reset in addition to
> > clock/reset/regulator management.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > Changes in v4:
> > - Make exit callback always success to prevent PHY state machine desync
> >   with clk/rst state as suggested by Sashiko.
> > - Re-wrap some comments targetting full 80 columns.
> > - Use dev_err_probe for PHY creation error handling, to prevent spammin=
g
> >   the kernel log with -EPROBE_DEFER.
> > Changes in v3:
> > - Use fsleep() to replace udelay(), and add proper inclusion of
> >   linux/delay.h for this function. (fsleep() suggested by Drew and
> >   inclusion suggested by Sashiko)
> > - Adapt Drew's suggestion on the wording of the commit message's 2nd
> >   paragraph.
> > Changes in v2:
> > - Removed unreferenced register names.
> > - Changed the behavior to leaving bus clock on instead of binding it to
> >   the regmap.
> > - Removed early return for reset deassert failure in phy exit callback.
> > - Tweaked the Kconfig item (removed default value and added "select
> >   REGMAP_MMIO).
> >=20
> >  drivers/phy/Kconfig                |   1 +
> >  drivers/phy/Makefile               |   1 +
> >  drivers/phy/thead/Kconfig          |  12 ++
> >  drivers/phy/thead/Makefile         |   2 +
> >  drivers/phy/thead/phy-th1520-usb.c | 179 +++++++++++++++++++++++++++++
> >  5 files changed, 195 insertions(+)
> >  create mode 100644 drivers/phy/thead/Kconfig
> >  create mode 100644 drivers/phy/thead/Makefile
> >  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
>=20
> Sorry for the delay in review. I think binding and driver dir should be
> added under thead soc support in MAINTAINERS, right?

I am adding it, but maybe it'd be worth to add a N: clause into the
MAINTAINERS file?

Although this wouldn't belong to this patchset.

Thanks,
Icenowy

>=20
> > +struct th1520_usb_phy {
> > +	struct platform_device *pdev;
>=20
> It seems that pdev is only assigned in th1520_usb_phy_probe() and never
> read. I think it can be dropped.
>=20
> With those addressed:
>=20
> Reviewed-by: Drew Fustini <fustini@kernel.org>
>=20
> BTW, I see that I never applied the MISC clock patches (1 to 3) from the
> v1 series [1] like I said I would. Do you still want me to apply them?
> If so, I will fix up the platform data check for usb_suspend_div_clk in
> patch 2 when applying.
>=20
> Thanks,
> Drew
>=20
> [1] https://lore.kernel.org/r/20260507081710.4090814-1-zhengxingda@iscas.=
ac.cn/

