Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813540;
	b=oYKGrc+DOC+PbY5roUQbq9HNu09geVcHSae19rcLwHMvI/rAhw2pFeXQaw93AfqqTq5U
	 Rtxy3FbE385cbir7VKMP+Pkc4F5vAlVOc1v7a6C5WbbKICXlBof+i76iwls0xODkfWFuZ
	 TV9JovrolPEwFBmjkRYCu3wZJo4gOHvpbM/tb0SYlPrn9VtW+HqSvBTIwndEkTf5QmbMQ
	 ej5gFRywBT5eSpEYhYUvsJUxxbtqZNTaqI9K6fzmBe3MEgRw4+80NbOufiO8+2sTujwmV
	 gkCLJLLKxWLzhi1jwbsVA35mFnCfW54Bm/0ZEriOMcM5MOo7MO8fVwOX1h1twKXGNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813540;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=yrcUJkxPg9w4wieDebgOR1w4YdfQXDDgdmwz0kbg3us=;
	b=XM1tXkthGimqVZC8zKlIwrCn1owsPmnhYq1dCj47POOAQRaT+CipdJTjy0Eq83FOXFig
	 ONx7XT8bwbLY6xAZ3o8PtsuEqrsNDTRk6b1NpzhlRLNQNscZMKzt5zRtybBEiz9exUseN
	 27Z0XwLGBp1yWDZDHlO9m4yhf6Zx2YyuLaLDGnBUsMK7xa4K4fUGil1MNSaWZbfmEbgTh
	 UBkW+1S3JV/JhZ6YXqQP30aAuovsbxf8g0EIKhdIaT230cyPtxYGDm95CmXbJNzS86dte
	 oSA9bs5EEMy4p9BLpEfH6AOdmHLyTHhx1Kqfb5YC15fNZwaSc+jUIMObP/06O4xK55A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVCTH86;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D9606A31C;
	Fri, 27 Nov 2026 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVCTH86
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C121F000C1;
	Fri, 27 Nov 2026 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813539;
	bh=yrcUJkxPg9w4wieDebgOR1w4YdfQXDDgdmwz0kbg3us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbVCTH86F+6Hzu2TOHWp83P8NPz/WeUuXZ+aaZBNkYNAnMpjEoUqohdm+gTJheBJB
	 NvK2V8aOrMweg4bxYoBtiUA+Cr8UgIijMtSz5WLYmhqHc+4g6kVh38RgZR4oiOwgT0
	 DEOVyab6whMayvF9KVfEpJwAdXNPDYZFEm4R1j3mPHrr3vfdHPzadu16ZjIltSLtjK
	 w97Nt1oTvJ09ehkW3xlSe40y00umzwX4VKuXflh5TvvRjo+NmdW6sly2xaVuVDR8vX
	 YKJN6GANTAcs3an7zDuOgm9QjiL+0b1G/V/QawINUpJevdRTuAyuWuXRm2ZPztg6qo
	 /xmcxuvqsNVuw==
Date: Fri, 27 Nov 2026 13:05:38 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <awnwop97gErg2d9L@x1>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
 <awXrnQVKZBXKsV2c@thelio>
 <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
 <2da5ea0d928af93418c54f70ea52bd9b1f0fc36d.camel@iscas.ac.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2da5ea0d928af93418c54f70ea52bd9b1f0fc36d.camel@iscas.ac.cn>

On Thu, Nov 26, 2026 at 05:41:33PM +0800, Icenowy Zheng wrote:
> 在 2026-11-26四的 17:33 +0800，Icenowy Zheng写道：
> > 在 2026-11-24二的 11:55 -0800，Drew Fustini写道：
> > > On Tue, Nov 03, 2026 at 04:14:44PM +0800, Icenowy Zheng wrote:
> > > > The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> > > > some PHY parameters exported as another system controller along with it.
> > > > 
> > > > A few PHY parameters have unusable defaults. Add a driver that programs
> > > > them before releasing the PHY from reset in addition to
> > > > clock/reset/regulator management.
> > > > 
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > ---
> > > > Changes in v4:
> > > > - Make exit callback always success to prevent PHY state machine desync
> > > >   with clk/rst state as suggested by Sashiko.
> > > > - Re-wrap some comments targetting full 80 columns.
> > > > - Use dev_err_probe for PHY creation error handling, to prevent spamming
> > > >   the kernel log with -EPROBE_DEFER.
> > > > Changes in v3:
> > > > - Use fsleep() to replace udelay(), and add proper inclusion of
> > > >   linux/delay.h for this function. (fsleep() suggested by Drew and
> > > >   inclusion suggested by Sashiko)
> > > > - Adapt Drew's suggestion on the wording of the commit message's 2nd
> > > >   paragraph.
> > > > Changes in v2:
> > > > - Removed unreferenced register names.
> > > > - Changed the behavior to leaving bus clock on instead of binding it to
> > > >   the regmap.
> > > > - Removed early return for reset deassert failure in phy exit callback.
> > > > - Tweaked the Kconfig item (removed default value and added "select
> > > >   REGMAP_MMIO).
> > > > 
> > > >  drivers/phy/Kconfig                |   1 +
> > > >  drivers/phy/Makefile               |   1 +
> > > >  drivers/phy/thead/Kconfig          |  12 ++
> > > >  drivers/phy/thead/Makefile         |   2 +
> > > >  drivers/phy/thead/phy-th1520-usb.c | 179 +++++++++++++++++++++++++++++
> > > >  5 files changed, 195 insertions(+)
> > > >  create mode 100644 drivers/phy/thead/Kconfig
> > > >  create mode 100644 drivers/phy/thead/Makefile
> > > >  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> > > 
> > > Sorry for the delay in review. I think binding and driver dir should be
> > > added under thead soc support in MAINTAINERS, right?
> > 
> > I am adding it, but maybe it'd be worth to add a N: clause into the
> > MAINTAINERS file?
> > 
> > Although this wouldn't belong to this patchset.
> 
> Well to prevent merging conflict, maybe it'd be better to substitute the
> file list with an N: item in a commit going through the SoC tree, and
> prevent changing this file in the PHY tree.

Okay, good idea.

Thanks,
Drew
