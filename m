Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779952;
	b=fTtVHsvE1hr46i8N8yyzyU5+TO5S1CxsnaFnccuKI9L1JGHugtEVa8TLocFhMrS944Li
	 oLNNfVmMiW+WKQW4Ch1i2FW+iskgLeAbEyInqulN9+ORiMd1CPLdXV7IrNyg6tWPDhdzw
	 w62kJbSJkiqln5yxjS1E/205ORfvEd2iX78raHARFT68WWg57oJ1hLPwNq717S4NBPZje
	 KSdTJb347+ilAeS22549VVsk1UCVa8f9lffrnXp78C3jZH4XQ2Z2R9kxTEE06wVMLGD9d
	 qv8wwXwanNraGeAAJp5yiEhma8IJeGvXDSpKoLzeHC7zzYiCuSRLLN47l3gkdfZmDjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779952;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=seLBTqo+TbPyZH6raQEMgMKdv+2iIg01h84sk7q1r0o=;
	b=dds/56QxIotaeZpUuaqBX5Y1Mqsr/t787X+rhHpfAtDa6Fax1QYGrNPG+V6elGTftmRI
	 kNBvnDFBoCQE3i+VMfNWHjXuUo1f+L6+bIVsO0gX5lQXvAiH59cFubE2JrD0JgEEBRQTV
	 k2rPuZgZ4QavS/aYvxjJD1IpwpSTwGSy0Lz9bhjoBmQPyzs2edMsmWY/6n4eKxD6KVB+C
	 jySZMCqpMIuRbgAph4X4klsStZ6W9LI7Ubm6lMOr7xjIHLEVkTsdGeR3Ezg74MzTcowre
	 uYm0pa2XxPIE1NSjHCayThQkcvGpJFwZHXWHinO+rptCptLPWcZCsB/ZuowmJ3+Tl2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Aaa4ARBi;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2985606A31E;
	Fri, 27 Nov 2026 11:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2985606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Aaa4ARBi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=seLBTqo+TbPyZH6raQEMgMKdv+2iIg01h84sk7q1r0o=; t=1795779951; x=1796989551; 
	b=Aaa4ARBi59yFLhOPsTm8K45PwHt2A0viLSitkRZy4A2PLMiAqXbKgVYGiYPNX//2gh0jJqDrABP
	BMsFvYhSuwEA5OJvi7KMgp2w5SMW/phQ4nzvzT9soaofUUuEgajfR2/9vmijeN5OG+K3VFCl66+Or
	8+lW/BeUugKfNZGeSjEV4gviotjjy3gTffG2cKblR8m23fPwHr5zKZbnT5LDLeMlATufO9XjAfVN4
	tZmRxubLsyTCvfXWDDMXACXDBb9j89SnCqNacJRSu3iE/7k+GGIIrdEQ+cr1rvjvCu+T8s8LYG5fC
	b10QUBF0P7oPMLwlI67QRWCWR7vfnVFLVMIQ==;
Date: Fri, 27 Nov 2026 12:43:18 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux@yoavmoshe.com
Subject: Re: [PATCH v2 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Message-ID: <20261127124318.276552d2@kemnade.info>
In-Reply-To: <awhl-wsYhZlC_VD4@SMW015318>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
	<awhl-wsYhZlC_VD4@SMW015318>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 11:01:47 -0600
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Thu, Nov 26, 2026 at 12:00:53PM +0100, Andreas Kemnade wrote:
> > On Ebook readers there are often situations in which the system waits
> > only for some GPIO IRQs and no module is active, all the clock system
> > is using most of the power, not every clock gets disabled via RPM,
> > esp. those are marked as CLK_IS_CRITICAL.
> > A usual he situation might be mainly wating for touchscreen input.
> > Since nothing needs to be sent to the display continously, clocks
> > are not in use. Maybe some frontlight is consuming power, but if it
> > is not used in maximum brightness mode, the clock system is still
> > using a significant portion of power.
> >
> > In contrast to suspend state, that is not forcefully turning things of
> > and wake up only on selected important things when the device is not us=
ed.
> > E.g. you might still want to have frontlight enabled.
> > Vendor kernel work around this by adding an extended suspend mode in
> > which more things are disabled, e.g. the touchscreen.
> >
> > So rather add another idle state, which is only conditionally used
> > depending on clock usage.
> >
> > System timekeeping is currently using a high speed clock, which is a
> > major blocker for this idle state.
> > Use 32K clock for the timer and the clock source to avoid that
> > dependency and allow the timer to be used in stop mode if that low
> > power clock source is used.
> >
> > Other things preventing entering that idle state:
> > - imx-thermal driver: probaly needs some notifier block called by
> >   cpu_cluster_pm_enter to avoid false alarms like ti-bandgap does
> > - PXP and DCP drivers are missing RPM, so they keep clocks enabled.
> > - serial console: needs to be unbound
> >
> > With these patches are applied (and the not-yet-upstreamed EPDC driver)
> > I can run a loop displaying the current consumption in every 20 seconds
> > for about one week. Power saving is around 70% in such
> > situations. =20
>=20
> Nice feature, but how to make sure don't cause regression?
>=20
I think it is quite opt-in at the moment. At least gpt1_serial should block
the idle state if not reconfigured accordingly for that board.
CPUIDLE_FLAG_OFF might be used as well initially to not have surprise opt-in
one day.

=46rom my testing / maintenance experience (I have used an OMAP3 device as my
main mobile working horse, which has very deep cpuidle states):
- Most problems show up with only one device active at a time
- Sometimes waiting for something with clocks disabled my cause issues
  -> explicitely enable clocks, pm_qos (I do not think this topic
     is that present on i.MX6 (mechanisms similar to drivers/clk/ti/autoidl=
e.c
     seem not to exist)
- context save/restore can be an issue
- puts a spotlight on any pm omission anywhere, mostly by blocking
  that deeper idle state, but that does only mean as high power
  consumption as without it. e.g. DCP and PXP drivers just keep their
  clocks unconditionally enabled.

Looking around: there are quite some devices not having a driver on
mainline (or at least no devicetree entry for it):
- epit
- csi (imx6ul has)

no driver... no breakage

Looking around in drivers to see if anything happening at suspend/resume
should also be done at runtime suspend/resume:
Interesting commits targeting the sound stuff
What I would also do is looking=20
05cf237972fe6 ("ASoC: fsl_ssi: Add driver suspend and resume to support MEG=
A Fast")
8661ab5b23d6d ("ASoC: imx-audmux: Add driver suspend and resume to support =
MEGA Fast")

These commits add context save/restore handling on resume/suspend.
But it depends on someone setting bit 0 of PGC/GPC offset 0x220.=20

arch/arm/mach-imx/gpc.c does not touch that register at all, does not
even have a define for that. i.MX6SX TRM lists modules belonging to that
domain. The i.MX6SLL TRM contains almost nothing about MEGA besides the
register define. So that all are indications that these things are
a non-issue on i.IMX6SLL.
Also I do not see widespread context save/restore in other drivers
like I see on OMAP drivers.

Regards,
Andreas
