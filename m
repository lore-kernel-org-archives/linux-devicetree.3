Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686105;
	b=GsNfj14fUjMtH0QR9A8JSEm+1uGw0Z867R/J46G/tLN2CRtwQvRSCfeAdCUYk8aH81nP
	 1Z9uFofN2GgprbvdfLTkN+qj8xyj40BZSRD36aRJYPVFdFbOOrjckkLwo3kT4LOO+UXaj
	 XgdbwYwbR54GKXV0fysVlQcpY+k7f7l3WnUW79iCDGa87H8INwcTlOLf8qSlIT4mSBBjZ
	 dg2Pd0ltYnF0OyHGHRT89f1NuaBFntVC50pGeudpU2z21MkTH9+co4a8tgcWikETu5wbe
	 ssaP/1+W/tNemK9S6Ckdv2ZkdJrkjb08mgOFwhmV2CHQpLvTXea6fa3PVWObjzF/eRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686105;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=GNDASP6rUCpmwiRkOCnx/Y4DoNB2hqMJAKRW/SDyyqQ=;
	b=pI5JHvd7jBoQ0xal6Eq3NgDtWUjjCZDidF+cUJR6ZvcNJa7EyxKcdR8cL1jjJSVgrgum
	 uuvb4X5ZJ3+m3qYuTx/3X08cAki/LhYVp66UFAq6c2nAOggLp6UTCDjKbOvxlOjl7KZlF
	 9FtF0nLssEAzsqYVU5uI13Gd6xDAsg7KRSpOFcnWsucvb/scpnLdjwigN47AtfAB8SKDb
	 Utt526y0J2yTMJDoqWe4pXADin3e/NU29XOS8/2/1YTVYTfMZNMs+VGY2/2ayZebs8J4k
	 AwxALKyPNbTS01uEQtG8Dfnp8N5yvpo1VucW3SHYV94oEGW0s74TU5w9TSHrv1xxOeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C5606A326;
	Thu, 26 Nov 2026 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowABXY5TN_gdrxEHXAQ--.17711S2;
	Thu, 26 Nov 2026 17:41:34 +0800 (CST)
Message-ID: <2da5ea0d928af93418c54f70ea52bd9b1f0fc36d.camel@iscas.ac.cn>
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
Date: Thu, 26 Nov 2026 17:41:33 +0800
In-Reply-To: <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
		 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
		 <awXrnQVKZBXKsV2c@thelio>
	 <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
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
X-CM-TRANSID:rQCowABXY5TN_gdrxEHXAQ--.17711S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr45trW8uF15tF47JF13urg_yoW5CF4Upa
	yrGF4YkF4ktFnFka1fKr1UCFyFyw1xXFy5WryfJ34fZF90kr1fXay3tF98uFWDXrWrW3y2
	qF15tFy3CF1Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5IAp7UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-26=E5=9B=9B=E7=9A=84 17:33 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A8 2026-11-24=E4=BA=8C=E7=9A=84 11:55 -0800=EF=BC=8CDrew Fustini=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Nov 03, 2026 at 04:14:44PM +0800, Icenowy Zheng wrote:
> > > The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> > > some PHY parameters exported as another system controller along with =
it.
> > >=20
> > > A few PHY parameters have unusable defaults. Add a driver that progra=
ms
> > > them before releasing the PHY from reset in addition to
> > > clock/reset/regulator management.
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > > Changes in v4:
> > > - Make exit callback always success to prevent PHY state machine desy=
nc
> > >   with clk/rst state as suggested by Sashiko.
> > > - Re-wrap some comments targetting full 80 columns.
> > > - Use dev_err_probe for PHY creation error handling, to prevent spamm=
ing
> > >   the kernel log with -EPROBE_DEFER.
> > > Changes in v3:
> > > - Use fsleep() to replace udelay(), and add proper inclusion of
> > >   linux/delay.h for this function. (fsleep() suggested by Drew and
> > >   inclusion suggested by Sashiko)
> > > - Adapt Drew's suggestion on the wording of the commit message's 2nd
> > >   paragraph.
> > > Changes in v2:
> > > - Removed unreferenced register names.
> > > - Changed the behavior to leaving bus clock on instead of binding it =
to
> > >   the regmap.
> > > - Removed early return for reset deassert failure in phy exit callbac=
k.
> > > - Tweaked the Kconfig item (removed default value and added "select
> > >   REGMAP_MMIO).
> > >=20
> > >  drivers/phy/Kconfig                |   1 +
> > >  drivers/phy/Makefile               |   1 +
> > >  drivers/phy/thead/Kconfig          |  12 ++
> > >  drivers/phy/thead/Makefile         |   2 +
> > >  drivers/phy/thead/phy-th1520-usb.c | 179 +++++++++++++++++++++++++++=
++
> > >  5 files changed, 195 insertions(+)
> > >  create mode 100644 drivers/phy/thead/Kconfig
> > >  create mode 100644 drivers/phy/thead/Makefile
> > >  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> >=20
> > Sorry for the delay in review. I think binding and driver dir should be
> > added under thead soc support in MAINTAINERS, right?
>=20
> I am adding it, but maybe it'd be worth to add a N: clause into the
> MAINTAINERS file?
>=20
> Although this wouldn't belong to this patchset.

Well to prevent merging conflict, maybe it'd be better to substitute the
file list with an N: item in a commit going through the SoC tree, and
prevent changing this file in the PHY tree.

Thanks,
Icenowy

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > > +struct th1520_usb_phy {
> > > +	struct platform_device *pdev;
> >=20
> > It seems that pdev is only assigned in th1520_usb_phy_probe() and never
> > read. I think it can be dropped.
> >=20
> > With those addressed:
> >=20
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> >=20
> > BTW, I see that I never applied the MISC clock patches (1 to 3) from th=
e
> > v1 series [1] like I said I would. Do you still want me to apply them?
> > If so, I will fix up the platform data check for usb_suspend_div_clk in
> > patch 2 when applying.
> >=20
> > Thanks,
> > Drew
> >=20
> > [1] https://lore.kernel.org/r/20260507081710.4090814-1-zhengxingda@isca=
s.ac.cn/

