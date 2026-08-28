Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53317282F01
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898436; cv=none; b=VJP/o8xE/h4PZp/8KokqRhb+Vi4oQ14zpvEUTuyIcrIhpaZB4ujVmRU+ZQRhuJ4NeLbA7/BMjp1dqzDuoI/8aB37KTUbF/KkhPV2ISAhPZHYh8TXvUoZjP2tQIssli4BMX1Bk2jD1oIyBhGMfItDWIN52kuHNpnsm0DSOETuOkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898436; c=relaxed/simple;
	bh=jrJQyLSicdIST58KiLx4mo0fvQgZkMwICUN191ZWJ1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SD5tIAwaMRBIJ/Vn+QMA8dYL7zEb/XuwjpFlXpPN/msS7z8Eyk/icVPZtEyeuElKkqfN++IzH/0I7Xy0JeXcmljI5lqN86IDJTvgaogk2nLHEj3yBcSbhYB2ChTvWzoYCk7uY0wdqjhTthAU93/o/8eZYapPhavc2FHjH7ZJcYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=aXth0Td1; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="aXth0Td1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787898430; x=1788157630;
	bh=jrJQyLSicdIST58KiLx4mo0fvQgZkMwICUN191ZWJ1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aXth0Td1pW/vATw0D/69P9O8bGSSNjCUF2ZVsbz5tQMpVW1nwOFPhdUi+flRFgnBO
	 M5ScT3oUL44T+itW4bynz3ppgc0KVHUsW1dePhO1dQT2dIIEC4/4OJYOm9WVzilenN
	 qKGcpo0k9IZqXNwfh5wj2wwr9xjxMCSTkdkcvuBWpMf5jykBSbj7H7gIjvxeqz00gy
	 WfBpwi/E8EkqlNEI+NYKBYtvxfNaMeer3ajy6zHgza6eqeOJ6TPWIX/UUTL47zWoBU
	 3tbAAPm4MVfQ9LH32QY2Wwg5emAI2xsBTStLVkZBu0DcswGUxL0FE2Twft/HlJIgLa
	 9jkpfII6vFTow==
X-Pm-Submission-Id: 4hWT252qd9z2Schg
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <robh@kernel.org>,
  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 9/9] iio: accel: mma8452: Use proper error code when
 missing device model
In-Reply-To: <20260825084024.9A1861F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:40:24
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-9-9b252804ee80@geanix.com>
	<XIgwff89DkNKJD_Vs6lXsPPQtYLLezNI9SdgKQMZpQNuV1diJxL0ccmJ-JzHvCMRtLRf-pbNiXUlRHrEAQ3Xyw==@protonmail.internalid>
	<20260825084024.9A1861F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 08:27:08 +0200
Message-ID: <8733vyzrnn.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] The `mma8452_remove` function fails to wake up the device before
> interacting with it, leading to I2C timeouts and unbalanced regulator disables
> if the device is currently runtime-suspended.
> - [High] Numerous sysfs accessor callbacks perform I2C operations without
> ensuring the device is runtime active, leading to I2C errors when the device is
> suspended.

I will address these in a new patch series following this one.

/Esben
