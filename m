Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460805;
	b=BF7l0LMcLH16R8SxzmVFSdP13n6TihoiBj9XX243Hf0MllhqLNw4k2wugBA6ZtWIwxNI
	 c04KwhYdaPCqWuvTSKd/BIX7pV3qwh9WrLpUCxoVA5o6c5eqzrxgGDCdJMWLHyIS61Ho2
	 otQqBRbWi6j6GNRcZHNq070ko+VaTwFmkesnU2pFj8QvEZBR6KLioyhx7FLwVvXaiTzYm
	 RpYd4vz0k0PWoYYx3Etn3eMzusXUaAVtE+lDYL+ThR2w5bT0z5Ufanek2pAyQBgupZNfV
	 2jGiV+LBEs3nR76bo0CRzE36wkEdL6FrBzWIfdc0RRNpcbRmGeMBDp8+EQ+YHGXlp+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OfkrWGAPbD8i6ZVar1bqY3px5gJBe6GIbgle4FrRdTc=;
	b=QM+pXC3LWo/L7mFb2pIMfT1oAsmEkRBENYadBjahCKqyFFw+GNMC1IjTZi0hAfS6Ke7t
	 BfMubCzwM7+nuzZr7YJF78d+FORzpCTHaLL1RlAjpP6X6GA3/b8tg9U07J//6VXREzkNp
	 MJkAdWEHf5bLXmfVcRAiWhkG+1aMoskcaYDEOWymltbOvViKP3KFB9eNaTlYbcHlr565Y
	 5MFk5yx+1U24cX5lzvOirEptcOkIBHDIpWnx3NxxUmimjoFp6Mr99FbWc0QAOP42/rEcz
	 WOjILzM7kIUN+4HseqyXzaa3SbAF11DDxNddxU8lxKRK/DvrIIH3jsLX8UeVQpCwikw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H24mHwhZ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B7606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H24mHwhZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5826943eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460803; x=1793065603; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfkrWGAPbD8i6ZVar1bqY3px5gJBe6GIbgle4FrRdTc=;
        b=H24mHwhZQumKgormG9wkyTxg+9MDX4keUI8LERXqqRMQtoHEJEoMi1YfMlvkSiAbTf
         vlTzAoORPDvAMWpGkzPL5+6TpL8AVwQd9zbXxzVHuKEhU1eMmwCASsdx9H5tK0XXDytY
         OMMH9zIoFAPQ6ILMiBzwWB+mDSgRUmh0gj9gRdxM58+FUigWiX+mihqDNhIQh5/bihnt
         N/zaKWx2jK9vlRXf6rpnAPqVgxIZsA7d2BqKfSsVgRH4L32JnRvoZqXdNlYDFjZS1wTa
         7aeoHUof9WMaY36mKgRB1sohp7haq0tPgzT+0g7pfdTqhesG5Hiv+SxY6PZqoJirwfKx
         oLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460803; x=1793065603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfkrWGAPbD8i6ZVar1bqY3px5gJBe6GIbgle4FrRdTc=;
        b=pG1fQpaOrBp9EmeN9wdW0JD9wvKUrmmhSxFkTNanrzfBFlBQsQf8iNJrwi3kUqACMB
         YpKw6DeHBdYtdOJuF81NmYSQOujfRIdo2iDhxVXOaLZIOXHtHjaemyqssi+NgUY9FcLC
         6ivf3Ra1Rzz1H3A285QeD9KRr+zQKTZ7DpqsKFoI1OcUxoFMmx62WU9vjPek/4fUVP6L
         k3Xh21fpeptsEL8AsoA0dWQfsL+1aX6l9S1G5unL9rD0Fwe9aajb9fFiL4BB59GmpnyO
         yM8jVF4pXyDFJR6r/ayoHfiHJd7brpRiEGKc2BlQPyyyhxuDSjjNRh5QGfTQhLPbRSjU
         Rfmw==
X-Forwarded-Encrypted: i=1; AKwUvBzWMuJnXOAiQDQQo0WdEEw8bwXutfOJGc/KbZw9LSTHl+Muk1/WJpx8KjkSb1ebI0Y9OX9RwBapUh8Z@vger.kernel.org
X-Gm-Message-State: AFq9FYJu5/m9p9dZj5/4ipQJorteU+QJTGpQzRqdK6eEsOezd+PAS2Sp
	SjBK3ZAF68QcAjnOPEEfUgv7Z0lg5mFQ2dR7ChpaGs9w5Hc9p06kNONP
X-Gm-Gg: AYBFou3LQp76xVaTGPcLWbwlP/7Lf0PEgE4LFwO9LOdH8q3eLYLrNlLMeQCh3i5fLTm
	WSjtJSolDAyULnL9wcrQOFc2UGMIJNWC5ecF/57WQ/hk6CuwyicFm18wwgfk7E+B5hrMumCpirw
	SAxelPlpzbWcuB48GVFnwHrMtKjfJyw9GVwDDZG2KYlu+U6zjfXi/HZY0wcs2zIzwzFw7b/nuIF
	6fS2gPqt3HltAUvalRh1VOXeNaziODtbl8mciyRl5Zp/g4LUay+CNJL0+jDdh7raSSf0cGnKDfu
	/HMl4DMwnui53qDegv5SAQqcJXywjkx1hoQk4gBtXs/2STJ8vj5s3AzlStQc4IXpaPWnlEd55AZ
	in6KyCUOwofu4KTd40IZ6efoUWmI6OMNTJW6cyCCv0SowqWPCQM3zbbKjlwsta5Qtjx9a7TQPOl
	Ehxbl4NP9ymyLRSSYFuzNJjGOhBtq4JkEdbqr5AgRhV0X5iE0qffZ3TMR414HQQuQj+ljxxd7SI
	AdsVcMSygVcwBMpuO62zECQhZ1g/Ku9neeBc0vI+xW6acJhsrXPkeUtz+BOTt1tlG0xnw==
X-Received: by 2002:a05:693c:69d1:b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-3619ed114f5mr12955350eec.3.1792460803152;
        Mon, 19 Oct 2026 18:46:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm34730436eec.11.2026.10.19.18.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:46:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:46:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 07/11] watchdog: Add ARM TWD (MPCore private) watchdog
 driver
Message-ID: <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-7-181bb0d23f4c@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013-b4-cs75xx-s2-v3-7-181bb0d23f4c@gmail.com>

Hi,

On Tue, Oct 13, 2026 at 09:07:17AM +0300, Fil Dunsky wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> ARM11 MPCore, Cortex-A5 and Cortex-A9 MPCore systems have a watchdog
> next to the local timer of every CPU, banked at the same address. The
> binding "arm,cortex-a9-twd-wdt" exists, but there has been no driver
> since mpcore_wdt was removed in v3.11, among other reasons because it
> only ever programmed the CPU that ran the ioctl.
> 
> Program, ping and stop the watchdogs of all online CPUs together with
> on_each_cpu(), and use a CPU hotplug state to arm the watchdog of a CPU
> coming online while the device is active and to stop it on a CPU going
> offline, which could not ping it any more. The watchdog is used in reset
> mode only, its interrupt is not needed.
> 
> Bootloaders such as the one of the Securifi Almond+ start the watchdog
> before booting the kernel. A watchdog found running on any CPU is marked
> WDOG_HW_RUNNING and taken over with the driver's timeout without being
> stopped, unless it runs with a different prescaler: the prescaler cannot
> be changed in watchdog mode. Once the watchdog mode is set it can only
> be left through the disable register sequence, which is what stop does.
> 
> The watchdog is also registered as a restart handler: the CPU that
> restarts the system, the only one left running, lets its own watchdog
> expire right away.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

The issues raised by Sashiko will need to be addressed, or you'll need
to explain why they are non-issues.

Thanks,
Guenter

> ---
>  MAINTAINERS                    |   6 +
>  drivers/watchdog/Kconfig       |  15 ++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/arm_twd_wdt.c | 472 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 494 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 176046436..53f6fa1c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2508,6 +2508,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>  F:	arch/arm/mach-*/
>  F:	arch/arm/plat-*/
>  
> +ARM TWD WATCHDOG DRIVER
> +M:	Fil Dunsky <filipp.dunsky@gmail.com>
> +L:	linux-watchdog@vger.kernel.org
> +S:	Maintained
> +F:	drivers/watchdog/arm_twd_wdt.c
> +
>  ARM/ACTIONS SEMI ARCHITECTURE
>  M:	Andreas Färber <afaerber@suse.de>
>  M:	Manivannan Sadhasivam <mani@kernel.org>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f7d0a0c2c..907e861ec 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -465,6 +465,21 @@ config ARM_SP805_WATCHDOG
>  	  ARM Primecell SP805 Watchdog timer. This will reboot your system when
>  	  the timeout is reached.
>  
> +config ARM_TWD_WATCHDOG
> +	tristate "ARM TWD (MPCore private) Watchdog"
> +	depends on HAVE_ARM_TWD || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the private watchdog found next
> +	  to the local (TWD) timer of every CPU in ARM11 MPCore, Cortex-A5
> +	  and Cortex-A9 MPCore systems. The watchdogs of all online CPUs are
> +	  driven together. A watchdog left running by the bootloader is
> +	  taken over.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called arm_twd_wdt.
> +
>  config ARM_SBSA_WATCHDOG
>  	tristate "ARM SBSA Generic Watchdog"
>  	depends on ARM64
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 9ac406677..4ff0bced5 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -40,6 +40,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
>  # ARM Architecture
>  obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
>  obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
> +obj-$(CONFIG_ARM_TWD_WATCHDOG) += arm_twd_wdt.o
>  obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
>  obj-$(CONFIG_AIROHA_WATCHDOG) += airoha_wdt.o
>  obj-$(CONFIG_ASM9260_WATCHDOG) += asm9260_wdt.o
> diff --git a/drivers/watchdog/arm_twd_wdt.c b/drivers/watchdog/arm_twd_wdt.c
> new file mode 100644
> index 000000000..18875ae24
> --- /dev/null
> +++ b/drivers/watchdog/arm_twd_wdt.c
> @@ -0,0 +1,472 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Watchdog driver for the ARM Cortex-A9/A5 and ARM11 MPCore private
> + * (TWD) watchdog
> + *
> + * Every CPU has its own watchdog, banked at the same address, and any of
> + * them resets the system when it expires. The watchdog device therefore
> + * programs, pings and stops the watchdog of every online CPU, and a CPU
> + * that is brought online or taken offline has its watchdog set up or
> + * stopped on the way. Once the watchdog mode bit is set it can only be
> + * cleared by writing the disable sequence to the disable register.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/cpu.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/cpumask.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/smp.h>
> +#include <linux/watchdog.h>
> +
> +#define TWD_WDT_LOAD		0x00
> +#define TWD_WDT_COUNTER		0x04
> +#define TWD_WDT_CONTROL		0x08
> +#define TWD_WDT_RESET_STATUS	0x10
> +#define TWD_WDT_DISABLE		0x14
> +
> +#define TWD_WDT_CTRL_ENABLE	BIT(0)
> +#define TWD_WDT_CTRL_WD_MODE	BIT(3)
> +#define TWD_WDT_CTRL_PRESCALER	GENMASK(15, 8)
> +
> +#define TWD_WDT_RESET_FLAG	BIT(0)
> +
> +#define TWD_WDT_DISABLE_KEY1	0x12345678
> +#define TWD_WDT_DISABLE_KEY2	0x87654321
> +
> +/* Largest prescaler, the counter clock is the input clock divided by 256 */
> +#define TWD_WDT_PRESCALE	255
> +#define TWD_WDT_DEFAULT_TIMEOUT	30
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static unsigned int timeout;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static enum cpuhp_state twd_wdt_hp_state;
> +
> +struct twd_wdt {
> +	struct watchdog_device wdd;
> +	struct hlist_node node;
> +	void __iomem *base;
> +	struct notifier_block clk_nb;
> +	/* Changed under cpus_read_lock() once the hotplug instance exists */
> +	unsigned long rate;
> +	bool armed;
> +	bool resume_armed;
> +	cpumask_t running;
> +	cpumask_t reset;
> +	u32 counter_min;
> +};
> +
> +static u32 twd_wdt_ticks(struct twd_wdt *wdt, unsigned int secs)
> +{
> +	u64 ticks = div_u64((u64)wdt->rate * secs, TWD_WDT_PRESCALE + 1);
> +
> +	return min_t(u64, ticks, U32_MAX);
> +}
> +
> +/* The following run on the CPU whose watchdog they access */
> +static void twd_wdt_cpu_stop(void *data)
> +{
> +	struct twd_wdt *wdt = data;
> +
> +	writel(TWD_WDT_DISABLE_KEY1, wdt->base + TWD_WDT_DISABLE);
> +	writel(TWD_WDT_DISABLE_KEY2, wdt->base + TWD_WDT_DISABLE);
> +	writel(0, wdt->base + TWD_WDT_CONTROL);
> +}
> +
> +static void twd_wdt_cpu_start(void *data)
> +{
> +	struct twd_wdt *wdt = data;
> +	u32 ctrl = readl(wdt->base + TWD_WDT_CONTROL);
> +
> +	/*
> +	 * In watchdog mode the prescaler cannot be changed, so a watchdog
> +	 * started by the bootloader with a different one is stopped first.
> +	 */
> +	if ((ctrl & TWD_WDT_CTRL_WD_MODE) &&
> +	    FIELD_GET(TWD_WDT_CTRL_PRESCALER, ctrl) != TWD_WDT_PRESCALE)
> +		twd_wdt_cpu_stop(wdt);
> +
> +	/*
> +	 * Load the counter before enabling, it may still be zero. A watchdog
> +	 * that is already running is reloaded and keeps running, the mode bit
> +	 * cannot be cleared by writing the control register.
> +	 */
> +	writel(twd_wdt_ticks(wdt, wdt->wdd.timeout), wdt->base + TWD_WDT_LOAD);
> +	writel(FIELD_PREP(TWD_WDT_CTRL_PRESCALER, TWD_WDT_PRESCALE) |
> +	       TWD_WDT_CTRL_WD_MODE | TWD_WDT_CTRL_ENABLE,
> +	       wdt->base + TWD_WDT_CONTROL);
> +}
> +
> +static void twd_wdt_cpu_ping(void *data)
> +{
> +	struct twd_wdt *wdt = data;
> +
> +	/* In watchdog mode a write to the load register reloads the counter */
> +	writel(twd_wdt_ticks(wdt, wdt->wdd.timeout), wdt->base + TWD_WDT_LOAD);
> +}
> +
> +static void twd_wdt_cpu_counter(void *data)
> +{
> +	struct twd_wdt *wdt = data;
> +	u32 val = readl(wdt->base + TWD_WDT_COUNTER);
> +	u32 old = READ_ONCE(wdt->counter_min);
> +
> +	/* Called on all CPUs at once, keep the smallest value */
> +	while (val < old) {
> +		u32 prev = cmpxchg(&wdt->counter_min, old, val);
> +
> +		if (prev == old)
> +			break;
> +		old = prev;
> +	}
> +}
> +
> +static void twd_wdt_cpu_probe(void *data)
> +{
> +	struct twd_wdt *wdt = data;
> +	unsigned int cpu = smp_processor_id();
> +	u32 ctrl = readl(wdt->base + TWD_WDT_CONTROL);
> +
> +	if ((ctrl & (TWD_WDT_CTRL_WD_MODE | TWD_WDT_CTRL_ENABLE)) ==
> +	    (TWD_WDT_CTRL_WD_MODE | TWD_WDT_CTRL_ENABLE))
> +		cpumask_set_cpu(cpu, &wdt->running);
> +
> +	if (readl(wdt->base + TWD_WDT_RESET_STATUS) & TWD_WDT_RESET_FLAG) {
> +		cpumask_set_cpu(cpu, &wdt->reset);
> +		/* The flag is cleared by writing one */
> +		writel(TWD_WDT_RESET_FLAG, wdt->base + TWD_WDT_RESET_STATUS);
> +	}
> +}
> +
> +static void twd_wdt_on_each_cpu(struct twd_wdt *wdt, smp_call_func_t func)
> +{
> +	cpus_read_lock();
> +	on_each_cpu(func, wdt, 1);
> +	cpus_read_unlock();
> +}
> +
> +static int twd_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct twd_wdt *wdt = watchdog_get_drvdata(wdd);
> +
> +	cpus_read_lock();
> +	on_each_cpu(twd_wdt_cpu_start, wdt, 1);
> +	wdt->armed = true;
> +	cpus_read_unlock();
> +
> +	return 0;
> +}
> +
> +static int twd_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct twd_wdt *wdt = watchdog_get_drvdata(wdd);
> +
> +	cpus_read_lock();
> +	wdt->armed = false;
> +	on_each_cpu(twd_wdt_cpu_stop, wdt, 1);
> +	cpus_read_unlock();
> +
> +	return 0;
> +}
> +
> +static int twd_wdt_ping(struct watchdog_device *wdd)
> +{
> +	twd_wdt_on_each_cpu(watchdog_get_drvdata(wdd), twd_wdt_cpu_ping);
> +
> +	return 0;
> +}
> +
> +static int twd_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
> +{
> +	wdd->timeout = t;
> +	if (watchdog_active(wdd) || watchdog_hw_running(wdd))
> +		twd_wdt_ping(wdd);
> +
> +	return 0;
> +}
> +
> +static unsigned int twd_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct twd_wdt *wdt = watchdog_get_drvdata(wdd);
> +	u64 ticks;
> +
> +	cpus_read_lock();
> +	wdt->counter_min = U32_MAX;
> +	on_each_cpu(twd_wdt_cpu_counter, wdt, 1);
> +	ticks = (u64)wdt->counter_min * (TWD_WDT_PRESCALE + 1);
> +	cpus_read_unlock();
> +
> +	return div_u64(ticks, wdt->rate);
> +}
> +
> +/*
> + * The TWD runs from the peripheral clock, which follows the CPU clock. While
> + * the rate goes up, count with the new rate already: the watchdog then just
> + * fires later than asked until the change is done.
> + */
> +static int twd_wdt_clk_notify(struct notifier_block *nb, unsigned long event,
> +			      void *data)
> +{
> +	struct twd_wdt *wdt = container_of(nb, struct twd_wdt, clk_nb);
> +	struct clk_notifier_data *cnd = data;
> +	unsigned long rate;
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		if (cnd->new_rate <= cnd->old_rate)
> +			return NOTIFY_OK;
> +		rate = cnd->new_rate;
> +		break;
> +	case POST_RATE_CHANGE:
> +		rate = cnd->new_rate;
> +		break;
> +	case ABORT_RATE_CHANGE:
> +		rate = cnd->old_rate;
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	if (!rate)
> +		return NOTIFY_OK;
> +
> +	cpus_read_lock();
> +	wdt->rate = rate;
> +	if (wdt->armed)
> +		on_each_cpu(twd_wdt_cpu_ping, wdt, 1);
> +	cpus_read_unlock();
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int twd_wdt_restart(struct watchdog_device *wdd, unsigned long action,
> +			   void *data)
> +{
> +	struct twd_wdt *wdt = watchdog_get_drvdata(wdd);
> +
> +	/* Only this CPU is still running, let its watchdog expire right away */
> +	writel(1, wdt->base + TWD_WDT_LOAD);
> +	writel(TWD_WDT_CTRL_WD_MODE | TWD_WDT_CTRL_ENABLE,
> +	       wdt->base + TWD_WDT_CONTROL);
> +	mdelay(500);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_ops twd_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= twd_wdt_start,
> +	.stop		= twd_wdt_stop,
> +	.ping		= twd_wdt_ping,
> +	.set_timeout	= twd_wdt_set_timeout,
> +	.get_timeleft	= twd_wdt_get_timeleft,
> +	.restart	= twd_wdt_restart,
> +};
> +
> +static const struct watchdog_info twd_wdt_info = {
> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE | WDIOF_CARDRESET,
> +	.identity	= "ARM TWD watchdog",
> +};
> +
> +static int twd_wdt_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct twd_wdt *wdt = hlist_entry(node, struct twd_wdt, node);
> +
> +	/*
> +	 * Also called for every online CPU at probe time. A watchdog that is
> +	 * running while the device is not active would not be pinged.
> +	 */
> +	if (wdt->armed)
> +		twd_wdt_cpu_start(wdt);
> +	else
> +		twd_wdt_cpu_stop(wdt);
> +
> +	return 0;
> +}
> +
> +static int twd_wdt_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct twd_wdt *wdt = hlist_entry(node, struct twd_wdt, node);
> +
> +	/* Nobody pings the watchdog of an offline CPU */
> +	twd_wdt_cpu_stop(wdt);
> +
> +	return 0;
> +}
> +
> +static void twd_wdt_remove_instance(void *data)
> +{
> +	struct twd_wdt *wdt = data;
> +
> +	cpuhp_state_remove_instance_nocalls(twd_wdt_hp_state, &wdt->node);
> +}
> +
> +static int twd_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct twd_wdt *wdt;
> +	struct clk *clk;
> +	int ret;
> +
> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +
> +	wdt->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(wdt->base))
> +		return PTR_ERR(wdt->base);
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
> +
> +	wdt->rate = clk_get_rate(clk);
> +	if (!wdt->rate)
> +		return dev_err_probe(dev, -EINVAL, "clock rate is zero\n");
> +
> +	wdt->clk_nb.notifier_call = twd_wdt_clk_notify;
> +	ret = devm_clk_notifier_register(dev, clk, &wdt->clk_nb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register clock notifier\n");
> +	platform_set_drvdata(pdev, wdt);
> +
> +	wdt->wdd.info = &twd_wdt_info;
> +	wdt->wdd.ops = &twd_wdt_ops;
> +	wdt->wdd.parent = dev;
> +	wdt->wdd.min_timeout = 1;
> +	wdt->wdd.max_timeout = div_u64((u64)U32_MAX * (TWD_WDT_PRESCALE + 1),
> +				       wdt->rate);
> +	wdt->wdd.timeout = min_t(unsigned int, TWD_WDT_DEFAULT_TIMEOUT,
> +				 wdt->wdd.max_timeout);
> +	watchdog_init_timeout(&wdt->wdd, timeout, dev);
> +	watchdog_set_nowayout(&wdt->wdd, nowayout);
> +	watchdog_set_restart_priority(&wdt->wdd, 128);
> +	watchdog_stop_on_reboot(&wdt->wdd);
> +	watchdog_stop_on_unregister(&wdt->wdd);
> +	watchdog_set_drvdata(&wdt->wdd, wdt);
> +
> +	twd_wdt_on_each_cpu(wdt, twd_wdt_cpu_probe);
> +	if (!cpumask_empty(&wdt->running)) {
> +		/*
> +		 * Left running by the bootloader: the online callback takes it
> +		 * over with our settings on every CPU without stopping it.
> +		 */
> +		wdt->armed = true;
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> +	}
> +
> +	ret = cpuhp_state_add_instance(twd_wdt_hp_state, &wdt->node);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, twd_wdt_remove_instance, wdt);
> +	if (ret)
> +		return ret;
> +
> +	if (!cpumask_empty(&wdt->reset)) {
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +		dev_info(dev, "last reset caused by the watchdog of CPU%*pbl\n",
> +			 cpumask_pr_args(&wdt->reset));
> +	}
> +
> +	if (watchdog_hw_running(&wdt->wdd))
> +		dev_info(dev, "running on CPU%*pbl, taking over\n",
> +			 cpumask_pr_args(&wdt->running));
> +
> +	ret = devm_watchdog_register_device(dev, &wdt->wdd);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "timeout %u s (max %u s), clock %lu Hz\n",
> +		 wdt->wdd.timeout, wdt->wdd.max_timeout, wdt->rate);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id twd_wdt_of_match[] = {
> +	{ .compatible = "arm,arm11mp-twd-wdt" },
> +	{ .compatible = "arm,cortex-a5-twd-wdt" },
> +	{ .compatible = "arm,cortex-a9-twd-wdt" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, twd_wdt_of_match);
> +
> +/*
> + * The watchdogs lose their state in suspend. The secondary CPUs get theirs
> + * back through the hotplug state, the boot CPU through resume.
> + */
> +static int twd_wdt_suspend(struct device *dev)
> +{
> +	struct twd_wdt *wdt = dev_get_drvdata(dev);
> +
> +	wdt->resume_armed = wdt->armed;
> +	if (wdt->resume_armed)
> +		twd_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int twd_wdt_resume(struct device *dev)
> +{
> +	struct twd_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (wdt->resume_armed)
> +		twd_wdt_start(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(twd_wdt_pm_ops, twd_wdt_suspend, twd_wdt_resume);
> +
> +static struct platform_driver twd_wdt_driver = {
> +	.probe = twd_wdt_probe,
> +	.driver = {
> +		.name = "arm-twd-wdt",
> +		.of_match_table = twd_wdt_of_match,
> +		.pm = pm_sleep_ptr(&twd_wdt_pm_ops),
> +	},
> +};
> +
> +static int __init twd_wdt_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "watchdog/arm_twd:online",
> +				      twd_wdt_cpu_online, twd_wdt_cpu_offline);
> +	if (ret < 0)
> +		return ret;
> +	twd_wdt_hp_state = ret;
> +
> +	ret = platform_driver_register(&twd_wdt_driver);
> +	if (ret)
> +		cpuhp_remove_multi_state(twd_wdt_hp_state);
> +
> +	return ret;
> +}
> +module_init(twd_wdt_init);
> +
> +static void __exit twd_wdt_exit(void)
> +{
> +	platform_driver_unregister(&twd_wdt_driver);
> +	cpuhp_remove_multi_state(twd_wdt_hp_state);
> +}
> +module_exit(twd_wdt_exit);
> +
> +MODULE_DESCRIPTION("ARM TWD (MPCore private) watchdog driver");
> +MODULE_LICENSE("GPL");
