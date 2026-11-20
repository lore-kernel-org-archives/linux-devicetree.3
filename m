Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201519;
	b=Yzs2SA+oyx4u24a87UH6lBP1xMyu0m+W1tIW/qjp2BBPxzydJrWpYNrWLvFfnVSWQpRL
	 J/jfZRSqndKq3wJZtuPnPlB18xH9HVqKAe6yC8N98XmtcKNBnl/SmsKngib3b7Cenk6xb
	 LpOXBkd+WDpS6wSeGtvkCoNqqz2TsFesxZkGMBxnG+eqOEWthlOwJmgIagBS+wEIvtiil
	 H9DCCAbx6rPKNHPc+JwM99z6O4U4OjhxmTcBWNCeH6LFzTks0A0x5cnQ/eF6X7s0t5ME8
	 mZxP7ymGnWl8bbbCtaQ2bV8X8MMmUg6o9EzbCFWkb/jxVVunRkws1jAxGTBlE1G2Olg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oooEWJs9gjOAVhgIXEsvVmU0j/MFcc+cEdr5Tko/RTA=;
	b=IMTOqAoIbLVkIkray0+fLYN1wg3ZVL/ODafQqgKheCScHm5phi3XXQlr8ZE+xk1KLcI8
	 AtqanHRadW0LFFJMBitySX0vvYru1OoRy369JLJct9RDU1Gkf1ewedNZpvNSzKp33pYIs
	 wGvq+J1tTXkoVRUYM34+tG7LfKhDQshWbPkQeTcvRxrcgqr2O2pjAWaxxWDVx7/XdnmTE
	 l0BCnLu7ArHEbQgO56g29fKLAcdHlBDuQLVh2L4FOdu+QhyHsrpK/1rGvJ4lzpZkRlSNi
	 j/74wrwzo1dY2vKYZhawVbQTQtCcx9tdnNXWqrBYOhv/OzbeALQz8S1Q+BnJi5IR+6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b="ZjEE3/Ae";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1E60A260D
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB1E60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=ZjEE3/Ae
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11660985e9.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795201513; x=1795806313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oooEWJs9gjOAVhgIXEsvVmU0j/MFcc+cEdr5Tko/RTA=;
        b=ZjEE3/AehuZ80aaH8fDCv5ECdKOo44oVsgXfGFs9s6uzJkvdgAVKXtBLH901utq3Ms
         IFIvGEUyPiWfXjlMKWVh5sUzvYrArRvUGBXu9dN3I7RgLRNmnqRMfIAcammPGOkYCMvw
         yNFwk6hzOqA32sSfL1+R1QyPSVWzkFPy8jmbErO9IwZtebR3AFC3wcxBL0IBny16uCKL
         6hnJRXWiX3ZEHV2Ut980BIaOayK1zRogvmF3SOsb2KjMsXevPWrnNkkqACh9eUDesPiF
         u1T+D/S4lI15tnBkzTrLCr1XVdzeYeBZX/1BCmoOmKp/wc0MFgQcm+yulFwn0NZJLqjQ
         qKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201513; x=1795806313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oooEWJs9gjOAVhgIXEsvVmU0j/MFcc+cEdr5Tko/RTA=;
        b=Xe58U4s68d32jag5/TCj8B5eK+pczjd5VS1l8RnfCEu23IZ382RmvT6ijkbfARAyc6
         HFbsVq28F4ALWEBcU/48W/afXWHHr71axkBzU9bESdzls58BF3s6N/c+v1v5O8siiEwH
         DsBj75Qb6PXznE/04jfaid9BFXBLVl/OsFO/tmRPp+jaTTlWszv8Cs6NE/D9ozUfNqAY
         UZeJWhFzUXiUtVoXahX2PZXoaIp6ofOCTuL6/MFfh/jawbjXxJ69Qg+57h6D5lC+q7zL
         XiYYsHl1br5/O34ZOaYT+G9c62Uaf9vX4ELFcM73pvfPYCvxraL2RE7/alU+50JZjH3/
         SEjQ==
X-Forwarded-Encrypted: i=1; AL+hErGyFJ/b8es3Onypl+ut7Fq8gnFX55r9vIgjnMgOM89paip8uGWuvpvdwE20mCkcj9hO8VhU95/aKm+j@vger.kernel.org
X-Gm-Message-State: APuU4Z9VCVd9wxhx/sj0sqlmAEDCAW4dLwtZRHXYwJPaS3wjgTfNVpc9
	azonqAqIXOhxVz93o3PfRqfcA0RkppADTHp/fFMFPgZbP1fzx76VR7NRPuzFh5jny5U=
X-Gm-Gg: AYBFou1QYMREVl19rGsiQOjQhah8xqbSe+RJD4WwKqczA4uT1ZNsHrrzTtZJuVl+vuw
	ErmiEuBPaP7yw3NSJr8C/iM3QGVbYqDrwOOsUSg5QkDv9etnVpEpVOtBfzOf3A7AGZ1Vh/BVsQ0
	k+WWg7m5N8aTZhcIDhPM3i2WiL+NbKsI5HiQT+TUdm1GE7jSK9XneiWctwFS76LFhYjsLooaXqf
	/mdirRJ6bXW3to1ScnVLIbMGalDxr3b81o9W9rOxyZbxQQAnPYG2/onWtHQzl5pcr/5BxtD/PUe
	qsSVZoFzA0vi6ZlODa5P+SaBCI+ShlFJ4+XO3ZrGS38145C3glZdenw2K4WlSj7ZKvPXLk8QEnQ
	SV3hAnl/j/0On3V3CwM5gybZHt+oBbGoVc0UFp9cSb2242yI18zQLVCp518U9n3ZmxkhGvzmBKf
	M7lTou3FkMJIIAKKl9OQGBYdqG2kelzmFGiju6Hr9f6tufla0jIrkWIZLRVRO35C/JZlcO6sQHi
	bQxrCimzR7X6w1HUth4zw1JEmx1X2A2DQd2DJQpBDpWlibCxy2se4eP7zq3VEyzW2NOKFtt8sVL
	U/4OsnGbmRo8G/OKdwq9Fgrr7hPrko44I3Tg9cUjG+w4sknt0nTtGivz2U59oOmz1CDDvuIN98g
	+6WVz3W8QaXgohY4MVHs8y0dJtPI=
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr93909055e9.28.1795201512760;
        Fri, 20 Nov 2026 11:05:12 -0800 (PST)
Received: from ?IPV6:2a01:599:241:b744:2c96:9736:bec3:7db8? ([2a01:599:241:b744:2c96:9736:bec3:7db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm37911205e9.0.2026.11.20.11.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:05:12 -0800 (PST)
Message-ID: <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
Date: Fri, 20 Nov 2026 20:05:03 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, srini@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 6:44 PM, Prasanth Kumar Padarthi wrote:
> Provide root-only NVMEM access for userspace diagnostics comparing OTP
> ranges with vendor-derived reference data during BMC bring-up. The
> consumer uses raw offsets rather than named cells or a private ioctl.
> 
> Initialize read mode once at probe and mask the fixed secure prefix using
> an NVMEM keepout. Recheck SEC54 on each controller read and reject requests
> into an extended protected prefix. Programming protection does not block
> reads. Serialize transactions and stop issuing commands after a timeout.
> Use a 1-us initial polling delay and a generous 100-ms timeout.
> 

This is describing the code...
Most of it belongs in the cover letter or below the --- line.
Please explain what the *hardware* does and *why* the driver is designed 
this way, not what the code is doing!

> Adapt the read sequence from ASPEED's downstream driver, preserving its
> attribution, and add the driver to the ASPEED MAINTAINERS entry.
> 
> Tested on ASRock Rack B650D4U (AST2600 A3) with Linux 7.4-rc1 and
> OpenBMC Linux 6.18.24. Repeated reads, cross-pair reads and four concurrent
> readers (40 reads) passed. The selected 12-byte range matched a saved
> ASPEED-derived reference. The 7.4-rc1 run used a RAM-booted kernel with
> the working OpenBMC board DTB and initramfs; its final-pair check also
> passed.

This part should be outside of the commit message, like I explained earlier.

> 
> Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
> Link: https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/
> Co-developed-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> 
> ---
>   MAINTAINERS                      |    1
>   drivers/nvmem/Kconfig            |   13 ++
>   drivers/nvmem/Makefile           |    1
>   drivers/nvmem/nvmem-aspeed-otp.c |  297 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 312 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315..5415e2be4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
>   F:	arch/arm/boot/dts/aspeed/
>   F:	arch/arm/mach-aspeed/
>   F:	arch/arm64/boot/dts/aspeed/
> +F:	drivers/nvmem/nvmem-aspeed-otp.c

The matcher here *may* be unnecessary given that we have `N`.

>   N:	aspeed
>   
>   ARM/AXIADO ARCHITECTURE
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb236..e6445262b 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -164,6 +164,19 @@ config NVMEM_APPLE_SPMI
>   	  This driver can also be built as a module. If so, the module
>   	  will be called apple-nvmem-spmi.
>   
> +config NVMEM_ASPEED_AST2600_OTP
> +	tristate "ASPEED AST2600 OTP support"

The file is now named generic. Please name the kconfig 
"NVMEM_ASPEED_OTP" so it doesn't need to be renamed once AST2700 support 
is implemented.

> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  Say Y here to enable read-only access to the OTP data region
> +	  on ASPEED AST2600 BMCs through the NVMEM interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-aspeed-otp.
> +
> +	  If unsure, say N.
> +
>   config NVMEM_BCM_OCOTP
>   	tristate "Broadcom On-Chip OTP Controller support"
>   	depends on ARCH_BCM_IPROC || COMPILE_TEST

*snip*

> diff --git a/drivers/nvmem/nvmem-aspeed-otp.c b/drivers/nvmem/nvmem-aspeed-otp.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/nvmem/nvmem-aspeed-otp.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + *
> + * ASPEED AST2600 OTP Controller driver
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/unaligned.h>
> +
> +#define AST2600_OTP_PROTECT_KEY		0x00
> +#define AST2600_OTP_CMD			0x04
> +#define AST2600_OTP_ADDR		0x10
> +#define AST2600_OTP_STATUS		0x14
> +#define AST2600_OTP_COMPARE_1		0x20
> +#define AST2600_OTP_COMPARE_2		0x24
> +#define AST2600_OTP_EXTRA_READ_PROTECT	0x54
> +#define AST2600_OTP_EXTRA_READ_RANGE	GENMASK(5, 0)

Please keep register offsets and field masks visually separate.
Usually you put the fields directly below their register, indented with 
an extra space. For example:

    #define AST2600_OTP_EXTRA_READ_PROTECT	0x54
    #define  AST2600_OTP_EXTRA_READ_RANGE	GENMASK(5, 0)

> +
> +#define AST2600_OTP_CMD_READ		0x23b1e361
> +#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
> +#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
> +#define AST2600_OTP_STATUS_DONE		GENMASK(2, 1)
> +/* Normal reads take less than 1 us; allow a generous bounded wait. */
> +#define AST2600_OTP_TIMEOUT_US		100000
> +
> +#define AST2600_OTP_DATA_WORDS		0x800
> +#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
> +#define AST2600_OTP_CONF0_ADDR		0x800
> +#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
> +#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))

The alignment is somewhat inconsistent.

> +
> +struct ast2600_otp {
> +	struct device *dev;
> +	void __iomem *base;
> +	/* Serialize the complete unlock, read and relock sequence. */
> +	struct mutex lock;
> +	struct nvmem_keepout secure_keepout;
> +	bool failed;
> +};
> +

*snip*

> +static int ast2600_otp_init_read_mode(struct ast2600_otp *priv)
> +{
> +	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };

Please give these registers names instead of using an anonymous array.

> +	int i, ret;
> +
> +	ret = ast2600_otp_wait_complete(priv);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Restore read mode once at probe; this driver never programs fuses.
> +	 * These writes target volatile mode registers, not OTP fuse cells.
> +	 * No fuse programming command or programming timing is used.
> +	 */

All the sentences say the same in slightly different ways, but none of 
them says *why* the step is needed. Maybe: "Linux never programs the 
OTP, but it might be left in it before, so restore the read mode once"?

> +	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
> +		writel(mode_addresses[i], priv->base + AST2600_OTP_ADDR);
> +		writel(0, priv->base + AST2600_OTP_COMPARE_1);
> +		writel(AST2600_OTP_CMD_WRITE_MODE, priv->base + AST2600_OTP_CMD);
> +		ret = ast2600_otp_wait_complete(priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_read_pair(struct ast2600_otp *priv,
> +				 unsigned int aligned_word,
> +				 u32 *word0, u32 *word1)
> +{
> +	int ret;
> +
> +	/* The hardware reads two words starting at an even word index. */
> +	writel(aligned_word, priv->base + AST2600_OTP_ADDR);
> +
> +	writel(AST2600_OTP_CMD_READ,
> +	       priv->base + AST2600_OTP_CMD);
> +
> +	ret = ast2600_otp_wait_complete(priv);
> +	if (ret)
> +		return ret;
> +
> +	*word0 = readl(priv->base + AST2600_OTP_COMPARE_1);
> +	*word1 = readl(priv->base + AST2600_OTP_COMPARE_2);
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_init_keepout(struct ast2600_otp *priv)

The is misleading, because it also restores read mode.

> +{
> +	u32 conf0, unused;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
> +	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1) {
> +		ret = -EACCES;
> +		goto out_lock;
> +	}

Mixing goto and scope-based cleanup in the same function isn't allowed
(see the big comment in include/linux/cleanup.h). The same applies to 
ast2600_otp_read().
The unlock/relock sequence is also duplicated between both functions. 
Please move this into helpers (or a DEFINE_GUARD()) so it doesn't need 
labels.

Also, -EIO might be better here given that it's a hardware problem, and 
not a permission problem.

> +
> +	ret = ast2600_otp_init_read_mode(priv);
> +	if (ret)
> +		goto out_lock;
> +
> +	ret = ast2600_otp_read_pair(priv, AST2600_OTP_CONF0_ADDR,
> +				    &conf0, &unused);
> +	if (ret)
> +		goto out_lock;
> +
> +	priv->secure_keepout.start = 0;
> +	priv->secure_keepout.end =
> +		FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
> +		AST2600_OTP_SEC_SIZE_UNIT;
> +	priv->secure_keepout.value = 0;

priv comes from devm_kzalloc(), so they're are already zero.

> +
> +out_lock:
> +	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
> +	/* Complete the lock write before returning and releasing the mutex. */
> +	readl(priv->base + AST2600_OTP_PROTECT_KEY);

Again (as in v1), nothing else accesses the device during probe. This 
read is useless.

> +	return ret;
> +}
> +
> +static int ast2600_otp_read(void *context, unsigned int offset,
> +			    void *val, size_t bytes)
> +{
> +	struct ast2600_otp *priv = context;
> +	u8 *buf = val;
> +	unsigned int word_index;
> +	unsigned int aligned_word;
> +	unsigned int secure_size;
> +	u32 extra_read;
> +	u32 word0, word1;
> +	int ret;
> +
> +	if (!bytes)
> +		return 0;
> +
> +	if (offset % sizeof(u32) || bytes % sizeof(u32))
> +		return -EINVAL;
> +
> +	if (offset >= AST2600_OTP_SIZE ||
> +	    bytes > AST2600_OTP_SIZE - offset)
> +		return -EINVAL;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	if (priv->failed)
> +		return -EIO;
> +
> +	/* SEC54 can grow after probe; keep the registered keepout immutable. */

Please describe the hardware behaviour instead, e.g. "SEC54[5:0] can
only grow until the ARM cores reset."

> +	extra_read = readl(priv->base + AST2600_OTP_EXTRA_READ_PROTECT);
> +	secure_size = FIELD_GET(AST2600_OTP_EXTRA_READ_RANGE, extra_read) *
> +		      AST2600_OTP_SEC_SIZE_UNIT;
> +	secure_size = max(priv->secure_keepout.end, secure_size);
> +	if (offset < secure_size)
> +		return -EACCES;
> +
> +	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
> +	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1) {
> +		ret = -EACCES;
> +		goto out_lock;
> +	}
> +
> +	ret = ast2600_otp_wait_complete(priv);
> +	if (ret)
> +		goto out_lock;
> +
> +	word_index = offset / sizeof(u32);
> +	while (bytes) {
> +		aligned_word = word_index & ~1U;
> +
> +		ret = ast2600_otp_read_pair(priv, aligned_word,
> +					    &word0, &word1);
> +		if (ret)
> +			goto out_lock;
> +
> +		if (!(word_index & 1)) {
> +			put_unaligned_le32(word0, buf);
> +			buf += sizeof(u32);
> +			bytes -= sizeof(u32);
> +			word_index++;
> +		}
> +		if (bytes) {
> +			put_unaligned_le32(word1, buf);
> +			buf += sizeof(u32);
> +			bytes -= sizeof(u32);
> +			word_index++;
> +		}

Why not reading the pair into an array? That'd remove the duplicates.

> +	}
> +
> +	ret = 0;
> +
> +out_lock:
> +	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
> +	/* Complete the lock write before returning and releasing the mutex. */
> +	readl(priv->base + AST2600_OTP_PROTECT_KEY);
> +	return ret;
> +}
> +
> +static int ast2600_otp_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {
> +		.name = "ast2600-otp",
> +		.id = NVMEM_DEVID_AUTO,
> +		.owner = THIS_MODULE,
> +		.type = NVMEM_TYPE_OTP,
> +		.read_only = true,
> +		.root_only = true,
> +		.word_size = sizeof(u32),
> +		.stride = sizeof(u32),
> +		.size = AST2600_OTP_SIZE,
> +		.reg_read = ast2600_otp_read,
> +	};
> +	struct nvmem_device *nvmem;
> +	struct ast2600_otp *priv;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	ret = devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = ast2600_otp_init_keepout(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to initialize OTP read mode and secure prefix\n");
> +
> +	config.dev = dev;
> +	config.priv = priv;
> +	if (priv->secure_keepout.end) {
> +		config.keepout = &priv->secure_keepout;
> +		config.nkeepout = 1;
> +	}
> +	nvmem = devm_nvmem_register(dev, &config);
> +	return PTR_ERR_OR_ZERO(nvmem);

nit: return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));

> +}
> +
> +static const struct of_device_id ast2600_otp_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-sbc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
> +
> +static struct platform_driver ast2600_otp_driver = {
> +	.probe = ast2600_otp_probe,
> +	.driver = {
> +		.name = "ast2600-otp",

If the plan is to add AST2700 later, then please use "aspeed-otp" and
aspeed_otp_* names.

Last: Please run your next build with W=1 and do checkpatch.pl + 
dt_binding_check...

Tan
