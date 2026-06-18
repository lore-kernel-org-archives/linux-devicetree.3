Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6202310763;
	Thu, 18 Jun 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778904; cv=none; b=P6boZ48MQrRKc+6+FvBOT6DM45QytWFHV77OuWoO1MauVCK3u5Wm+yfWfux7GMvLRAgZxWEDY3oX/CXJ1d/vNhAfU4TGkdhDszXKo+k7d0PDXLhPcFB24sGJFrPpuy54UHWuOBscO+/clCLNyx2qPEdjK4YVP1jGmx8deiO+8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778904; c=relaxed/simple;
	bh=+WeL8V5C5u7QDbMGQ8sIWRqSvp4ab77YmrKWhftWL4M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e+NFVOSDef/gotcFEa6/iBkGjvq0G7hcLbyT1OXPBt990nF1Ypm8rpaZ8qGV9sZDPZ6UezGyiODg470SZFgnCoWKcuiMKfUUdFeZUD0n8VRef6JA/KWGz2RsOVfmKy7cBdLg3ThKe/h+OM872jtoueurNklnpWXMfkiGjBbCCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.206])
	by APP-01 (Coremail) with SMTP id qwCowAB3HNXSyTNq954yAg--.9056S2;
	Thu, 18 Jun 2026 18:34:59 +0800 (CST)
Message-ID: <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Pengyu Luo
	 <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio	
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 18 Jun 2026 18:34:58 +0800
In-Reply-To: <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
	 <178040480680.1778078.1165164069560552075.b4-review@b4>
	 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
	 <178073773007.397244.9871455646149843167.b4-reply@b4>
	 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
	 <178073918523.417326.15121723011916371966.b4-reply@b4>
	 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
	 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
	 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
	 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
	 <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
	 <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
	 <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowAB3HNXSyTNq954yAg--.9056S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4kJF45Cr18Ar1kGw1UGFg_yoW5KFW3pF
	yUJFWUKF4UJr15Gr1xtr1UXF47tr12yr1DXrn8Jr18Jw1qvr15Jr4UJrn09F1UXr18Cw42
	yr45Jry7Xry8Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2UDGUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-18=E5=9B=9B=E7=9A=84 11:05 +0200=EF=BC=8CKonrad Dybcio=E5=
=86=99=E9=81=93=EF=BC=9A
> On 6/18/26 11:04 AM, Konrad Dybcio wrote:
> > On 6/9/26 5:54 PM, Icenowy Zheng wrote:
> > > =E5=9C=A8 2026-06-09=E4=BA=8C=E7=9A=84 14:23 +0200=EF=BC=8CKonrad Dyb=
cio=E5=86=99=E9=81=93=EF=BC=9A
> > > > On 6/7/26 10:49 AM, Icenowy Zheng wrote:
> > > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 21:51 +0800=EF=BC=8CPengyu=
 Luo=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM Icenowy Zheng
> > > > > > <zhengxingda@iscas.ac.cn> wrote:
> > > > > > >=20
> > > > > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPe=
ngyu Luo=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > > > > > > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=
=8CPengyu Luo=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > >=20
> > > > > > > > > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > > > > > > > > >=20
> > > > > > > > > > The magnetic keyboard (USB HID) can't be connected
> > > > > > > > > > somehow,
> > > > > > > > > > others
> > > > > > > > > > are
> > > > > > > > > > fine, such as the spi touchscreen (not upstream
> > > > > > > > > > yet),
> > > > > > > > > > which
> > > > > > > > > > utilizes
> > > > > > > > > > DMA definitely. My config is here
> > > > > > > > > > https://pastebin.com/SdjuyJYk
> > > > > > > > >=20
> > > > > > > > > Is this a defconfig?
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Yes.
> > > > > > > >=20
> > > > > > > > > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be
> > > > > > > > > selected
> > > > > > > > > too
> > > > > > > > > for
> > > > > > > > > exhibiting the problem (because there should be
> > > > > > > > > "public"
> > > > > > > > > GPI
> > > > > > > > > DMA
> > > > > > > > > consumers to trigger the stuck/reset).
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Is this still necessary? I checked the fedora
> > > > > > > > discussion and
> > > > > > > > your
> > > > > > > > GPI
> > > > > > > > DMA fix. And GPI DMA is only for the QUP-supported
> > > > > > > > peripherals as
> > > > > > > > the
> > > > > > > > binding mentioned,
> > > > > > > > devicetree/bindings/dma/qcom,gpi.yaml
> > > > > > >=20
> > > > > > > The devicetree without this fix seems to be still
> > > > > > > incorrect,
> > > > > > > because
> > > > > > > with the device tree fix even if the GPI DMA driver
> > > > > > > misbehaves
> > > > > > > the
> > > > > > > system won't be stuck (although it will iterate all GPI
> > > > > > > channels
> > > > > > > and
> > > > > > > then fail to function at all).
> > > > > > >=20
> > > > > >=20
> > > > > > Back to the start. You said some GPI interfaces aren't
> > > > > > available
> > > > > > to
> > > > > > HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a
> > > > > > quick
> > > > > > test,
> > > > > > and spi6 consumed it, no stuck or reset. Could you give me
> > > > > > a
> > > > > > unavailable channel?
> > > > >=20
> > > > > I think channel 0b10000 of gpi_dma2 could be an example?
> > > > >=20
> > > > > It seems that 4 channels are tried on gpi_dma2 before hang on
> > > > > my
> > > > > gaokun3, but as gaokun3 has no known serial access, it's
> > > > > possible
> > > > > that
> > > > > 0b100000 or 0b1000 is problematic.
> > > > >=20
> > > > > (The reason gpi_dma2 is checked first is because it's the GPI
> > > > > DMA
> > > > > controller with the smallest address)
> > > > >=20
> > > > > BTW I just took the values from Windows DSDT, which is quite
> > > > > conservative.
> > > >=20
> > > > So, with DMA_PRIVATE set, is this series made redundant?
> > >=20
> > > I assume technically the trustzone is still protecting some
> > > channels,
> > > although the system stuck issue is fixed.
> > >=20
> > > This series should still be relevant, although not so emergent.
> >=20
> > So now we're down to the case of the TZ reserving some of the GPI
> > channels (presumably for locked down/TZ-driven QUPs) crashing the
> > device on access, is that right?
>=20
> i.e. now, is requesting these channels through (wrongfully) enabling
> the devices in DT the only remaining concern?

Yes, I think so; although I think few devices will use GPI on these
devices (usually only one or two SPI controllers according to the
DSDTs).

Thanks,
Icenowy

>=20
> Konrad

