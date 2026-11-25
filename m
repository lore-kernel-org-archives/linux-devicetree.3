Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600617;
	b=bA69aUNEyrWMk+6VvUqHN+EFe4Ae1PPTRnYw+jnRD8bllz+G6M0A2rKWsx72usyRiwa0
	 +sbNyOfzVyRzZQzd6j3VnHgQ2DWo71HPofGzrbxLQIAiJSLLrtA0D9vVrZvaoytR86kJ8
	 BSujueBhOu+6v6AUIh4Nv6D8FQ3p8FkMFq1BhDcf3JK9Q4poV5Yo+VJOlVjMIQ+b8V+kH
	 jxTOs1ifgjiD/lrw/QZDOVg6O5Tu/+6kaPEEgPEFD1aYCEbp1Y5F4mkLfFvgssIvxtkZO
	 7ZIA1KF4kDl2p5ZfOM1fKqjgBowCiIu56Hm8qbdkGcHesMcopHQLu4VlQZeVIjInBAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600617;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=nPEw7aOERYlIdruT9TqrFmk/oH6cGVDE62g1FJtuBus=;
	b=vtuqCRHrTM9xAk3/dDQDc3x1zJMqmFZiGCS9iP6Yw390iPHnTSA1+UG2sUSniVu+aGcQ
	 EXmuN4xsXy9VnmOUQfC9bVTJVrISa2OEWDSPI1M1RRdHUaHMZku211+dvw+thlSoS7uxS
	 9+w2DsEgEDI7CHZOZcsuJvKjVv70uuMkH0Ad10zITukLSGiJsVvOy3x/gK+BrA+7K1azd
	 gx3mTx9/E+2PYxu7X9P+6dUoV/8Wn18UyaF8ta6vERbZHb+gvR2U/OEnFoP/BTrNGYhFd
	 jmGRJwLmlx5n22Tur60ZHOd+0NpRQSmHp3cWsg01wPfNd3QhKMOCMAld0KxjhcHgIkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA610606A31E;
	Wed, 25 Nov 2026 09:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA610606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-05 (Coremail) with SMTP id zQCowAAHoLXNsAZr2kjpAQ--.1098S2;
	Wed, 25 Nov 2026 17:56:30 +0800 (CST)
Message-ID: <0caf6ab1187bc701815f4777e8f15697b61c9089.camel@iscas.ac.cn>
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
Date: Wed, 25 Nov 2026 17:56:29 +0800
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
X-CM-TRANSID:zQCowAAHoLXNsAZr2kjpAQ--.1098S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4DWr1DAFWxuFyDtF1kKrg_yoW5Gw45pa
	97GF45CF4ktF9Fga1fGF1UuFyFyw4IqFy5Wry3J34fZFyakryrXa9IqFW5ZFWqqr4rW34I
	q3WYqFy3CF1YyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07betCcUUUUU=
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

Ah, yes.

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

Thanks for the review.

>=20
> BTW, I see that I never applied the MISC clock patches (1 to 3) from the
> v1 series [1] like I said I would. Do you still want me to apply them?
> If so, I will fix up the platform data check for usb_suspend_div_clk in
> patch 2 when applying.

Please apply them.

Thanks,
Icenowy

>=20
> Thanks,
> Drew
>=20
> [1] https://lore.kernel.org/r/20260507081710.4090814-1-zhengxingda@iscas.=
ac.cn/

