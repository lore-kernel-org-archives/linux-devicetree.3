Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831D3EB11D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531987; cv=pass; b=G4UD228MwuS4qG8p42haijGDJf0W7UM/g1FoeelrZte87BaFLSiDT/J/v6KNLpbMXx1bcAl24RQDrgK5uSEFUdWOKPKpH7gW+z8hFKPxv26YnTDx+41ieLmKoe6q+a4WZ+iu8LNBJ8KwSdDt4pbnAbPxv1AhAhD+81JnM6OYvqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531987; c=relaxed/simple;
	bh=0gRN2SakYbEgJc/3ZWGnLbXr3HCroechbpStJaaI808=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTYYmd1n70n5eGano4A6VucW24jWzcpX+Nc1klPwFvsQ2qpI1pBYklRaVXnA2uR7+xYW8HUWY3CX7/xDAlt1jKurydo0WW0Cl5KI+mAdrcMpALgd1Dg+uQnolpAcMtpFQKGjWz4Mm+PPpJX4jrB3uNNAq4rXollOlDhrm9UnANQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRV6jeJ0; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRV6jeJ0"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5350cc60b51so59959111cf.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791531985; cv=none;
        d=google.com; s=arc-20260327;
        b=F/kmi1sdBtgRALCWZ/ZDWx2boCch9rIqSCmwAI2Al84QqtcpAkp1DV01qopy4xzds2
         J7Rl4iBerRlTFd6usMW1YN3ZPYoTuDzlK3uN2vUkGwvtgEa7tjKM0pvC2AJ5LrktBJgs
         NGAkIq23y2HmfUvYumYhNmti5PYt4khL3aVoNO/00XPVY0nz6FVLLmgGE7lJDeKfFdGK
         fo9kg+AMCkdO+rOS3QwevyGWsD0fc7YUrlDLvJsiNIZIlFEWboBtG47cYMTA3eDYldxi
         OAt9WuN6eCDVEHH5GEazyLRIVApAhpd65SL4C2pkn8r3CdmmCMTT87GPG5kTv4BSDmeP
         /NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IhbhXrSuqXoly0LP+ZlIux6BvCSs3BvpYjEi3pYxM6E=;
        fh=I57xYs6mSMeeRvl+hwGIWPqX5rR9NFUwj4/6PO8ytW8=;
        b=pWJl3hsB69/gEx7j6+tclgCyUaw/bEHOeLHCGo54uOUVvact/nGnWmYf5FsaPbompQ
         uT7ve4mYbg1CXxv9RpRFvkqLyCA5Z2zvUq5JjD5xScW1gvYgRRW5CUiycfJx3v+rihwP
         nTxII9ofhp2p3oQyMZaTeEmnxaJ50XKhWeJgDH0cYLNeUcKV9DEtDkwzbwwJHHyCXAiQ
         d/xFyo2wRPDwX6GU2saim6Y4GRkK4YjvcDzb/jTcnYibIkFC3W3lSlD1maTkRPVRvUyn
         78QLh2mmrlU7MNUErohBu9sCYf+WWWbgrfZkYL0IiDiqnR7d8w90j5lp1kiB3UVmwzBH
         pq6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531985; x=1792136785; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhbhXrSuqXoly0LP+ZlIux6BvCSs3BvpYjEi3pYxM6E=;
        b=KRV6jeJ0kIlXGoyfazccjIuPBD+0kcgmq9FyawAchST3ThtywFwF03gwOMBUKPVb7y
         s9U5+RCiJKIiG2kdNF5lYwTvQxH4lyVU753uRn5JbKX/7C0yNYCO/ml7FSB1Pr1LFU+7
         +X91Wuxa1S6pnB0+pdvrTvT834Zhq48te/477IzHnGeFHDdsQuz8pvyBGXS/sucHkriJ
         a5fddnyjDS5KPdd431dUPujZIHHcXR380LLvPOW8eLc+EJxmF118z+GL5HzGc6kVGaR9
         diVqs/wxYaHFyGx1b8GSJkyZLCmGjVtB9mtbJQFrBBQjHCdjKbVbGZfW2GV9My1UbUKO
         5XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531985; x=1792136785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IhbhXrSuqXoly0LP+ZlIux6BvCSs3BvpYjEi3pYxM6E=;
        b=dCe4wPxry4SMZbUaUyZYsMFzSz64sRbwm661lc9vQfafdvjT3RWsPdk6Up4SoGP33g
         ZNP92cWCDWC7eSgfF/9aUOFDoMdTZVSqaQR77xEFSf3oUU2C5U+MTR0H5jhH0L4veC89
         3C7cfXnRZ1YPtEgnC1LSII88aDzy5VEw0HbApZ4eLZwhK2OLhv8g7MEeeyN63KQZ2wOf
         4ge2dkFsiB6n3ELKf4lPPh4q2+vWZHaCNUZVRganL3HoLj4F9oIj8ihmwBDUruHLtLU7
         AydMk4mh0vAuowpRKGtuUJy3iS9zuy4EdlrO4BnIXG5noUSdrys8sxLqMW/Bi1UjW/Tc
         FEGA==
X-Forwarded-Encrypted: i=1; AKwUvBw5O0XYMFH5nuggrJT7Z6B0N85TPIjkvfkqF+m6qm52W0LMAitOHh2C2Agd8/UMWOHx+vuLiATAQOWS@vger.kernel.org
X-Gm-Message-State: AFuF++kUV9hlkn6lS/D8DmXto+5BityyFxvILP6YYGvpCCVIsYHl2pis
	3WLRC69BlAH/DZZpQoN7rYFoYJItZrKYHrZYqxqQTyl2fubfKsZ8/XfACZtw7E6RjG2UMSSej4i
	wcASVnS+Pg4g2BCKj7ykc3YtXZ9XRQZg=
X-Gm-Gg: AYBFou286lykPKkwjeOquRVo4ZFBAfOwioTgarY+QcK3+JX9C1bwBQQp6pibPBd1HB7
	Y7WlJtDv30KcsJmeQnRGl33zH/DNHilOsITouInkmAM27+ZeZxx49IxMLEFOZRh6+uOMIRGgGWR
	n6YMxMVYE7nOvWYLXu5Ev3TX6EEU6C2iY43/kfdhIge12FSN0gaZXZzZJ86Z7VJWbM8KvvyecIj
	kBOj2Cxcu8BzGJIDdVHESdSAj/xIepHnNXOxeAbnNlwU5N69tNO1OMBannVDDKemr9UeDHtPe6e
	pmtkUIyGjZI3F6MTTJUxdio+VQFh4cO5ddy7SIfefuPBn8eSMVjwov9OarpMUtFBI9xUyjp6cAc
	Kb5+BSAcCiQ==
X-Received: by 2002:a05:622a:e18f:20b0:535:a5f7:d593 with SMTP id
 d75a77b69052e-535a5f7deabmr2793261cf.77.1791531984791; Fri, 09 Oct 2026
 00:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810143057.651478-1-ansuelsmth@gmail.com> <20260810143057.651478-2-ansuelsmth@gmail.com>
 <20260817-strange-belligerent-gazelle-d55c5c@quoll>
In-Reply-To: <20260817-strange-belligerent-gazelle-d55c5c@quoll>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 09:46:11 +0200
X-Gm-Features: AclHuK-f0LLvQaXw4HZlaL3j-e2e5sO13kwV5bV5TdRjah04dpSMzW4-ITExMkA
Message-ID: <CA+_ehUwTH-mn2p44Qi=TGi+55PngRra=3Ovf3mCUv8ZZ=Cky4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM / devfreq: add Airoha SoC devfreq driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 17 ago 2026 alle ore 09:46 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:
>
> On Mon, Aug 10, 2026 at 04:30:55PM +0200, Christian Marangi wrote:
> > Add simple Airoha SoC devfreq driver. This simple driver register a
> > driver from a given clock and register a passive governor to scale the
> > frequency with the CPU frequency.
> >
> > required-opp on the CPU frequency will be used to correctly bind the
> > clock to the related CPU frequency.
> >
> > GSW, NPU, SOE, BUS and many other clock will register this devfreq
> > driver to scale all these internal peripheral  from idle to performance
> > mode.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/devfreq/Kconfig          | 10 ++++
> >  drivers/devfreq/Makefile         |  1 +
> >  drivers/devfreq/airoha-devfreq.c | 99 ++++++++++++++++++++++++++++++++
> >  3 files changed, 110 insertions(+)
> >  create mode 100644 drivers/devfreq/airoha-devfreq.c
> >
> > diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> > index c999c4a1e567..1e857a7e9caf 100644
> > --- a/drivers/devfreq/Kconfig
> > +++ b/drivers/devfreq/Kconfig
> > @@ -75,6 +75,16 @@ config DEVFREQ_GOV_PASSIVE
> >
> >  comment "DEVFREQ Drivers"
> >
> > +config ARM_AIROHA_DEVFREQ
> > +     tristate "Scaling support for Airoha SoC"
> > +     depends on ARCH_AIROHA || COMPILE_TEST
> > +     select DEVFREQ_GOV_PASSIVE
> > +     help
> > +       This adds the DEVFREQ driver for the Airoha SoC.
> > +
> > +       The driver register with the cpufreq notifier and find the right frequency
> > +       based on the required OPP set in DT.
> > +
> >  config ARM_EXYNOS_BUS_DEVFREQ
> >       tristate "ARM Exynos Generic Memory Bus DEVFREQ Driver"
> >       depends on ARCH_EXYNOS || COMPILE_TEST
> > diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> > index 404179d79a9d..5ca27684dee3 100644
> > --- a/drivers/devfreq/Makefile
> > +++ b/drivers/devfreq/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)   += governor_userspace.o
> >  obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)    += governor_passive.o
> >
> >  # DEVFREQ Drivers
> > +obj-$(CONFIG_ARM_AIROHA_DEVFREQ)     += airoha-devfreq.o
> >  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ) += exynos-bus.o
> >  obj-$(CONFIG_ARM_HISI_UNCORE_DEVFREQ)        += hisi_uncore_freq.o
> >  obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)    += imx-bus.o
> > diff --git a/drivers/devfreq/airoha-devfreq.c b/drivers/devfreq/airoha-devfreq.c
> > new file mode 100644
> > index 000000000000..cb6d8b49e4a4
> > --- /dev/null
> > +++ b/drivers/devfreq/airoha-devfreq.c
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/cpufreq.h>
> > +#include <linux/devfreq.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/clk.h>
> > +#include <linux/slab.h>
> > +#include <linux/pm_opp.h>
> > +
> > +struct airoha_devfreq_data {
> > +     struct clk *clk;
> > +
> > +     struct devfreq_passive_data gov_data;
> > +};
> > +
> > +static int airoha_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> > +{
> > +     struct airoha_devfreq_data *data = dev_get_drvdata(dev);
> > +
> > +     *freq = clk_get_rate(data->clk);
> > +
> > +     return 0;
> > +};
> > +
> > +static int airoha_devfreq_target(struct device *dev, unsigned long *freq,
> > +                              u32 flags)
> > +{
> > +     struct airoha_devfreq_data *data = dev_get_drvdata(dev);
> > +
> > +     return clk_set_rate(data->clk, *freq);
> > +};
>
> Some odd copy-paste.
>
> Anyway, your driver is heavily incomplete. You can scale the clock
> directly from each device driver (each should register devfreq). You do
> not need completely new driver for that.
>

I sent a v2, the thing is that those subsystems need to scale with the
CPU frequency. It's not something where driver configure a static frequency.

There is a specific governor for devfreq driver that follow the CPU cpufreq
OPP call and with the help of DT required-opp, each subsystem is scaled
to the frequency.

It's to handle idle state for power saving and temperature and scale to
"turbo" when the SoC needs the extra perf.
