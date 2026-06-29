Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FE3537DE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727388; cv=none; b=VGMad/AZvIAV8ZyJi3bM4biUpPTZ7ZNdhiASwstQaCXNB8Oz5gg/ZOzjCundC31QODVaC8HqS9Q949g5LxnSqD4ItVz/HiF4NfFjtv+Qc3lZIS1nUa91Hj9h/kaBRlvvMqd0dbRVYYhC6IxoWY8FVFVzVoh5sDvq0T9/GZpocOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727388; c=relaxed/simple;
	bh=Akk8+lloELjMhhWcXzc1Xzdy5EpD40jODPnZl4KVjnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C1bunI8FYTBu3RiGRTtAnjZkUEaZ1aMSxl4OXT35o8KSWQqWjpmZAD8u6PbWhE0CyXXaFgP+21T2yN6d0cWlU2ciF0kW5hYTgIMHABNKwbDJjhooG3iLqlNBhElDlxh7CoPi3xeiSTUKbKBx1KZB3OTKh+d8zglF9VMujhd4zLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGp7tpYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGp7tpYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68431F000E9;
	Mon, 29 Jun 2026 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727387;
	bh=SWoYE6IfmRbtAVp36OC+Vlt6+Ew72HpJIazH8OMgsFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RGp7tpYzQ+8xgt4xluxycUSPPcbH9GJy37AAAf3jsIaoms4VcYD9rFMjLH2jG/wfI
	 lqm3uU75LGc3nGfTiGxmhMOfTmZZpe0V0cM7l3cPnRqY9D6blqqax85TS/ZIMzcojv
	 mVWo23aT1gqyXGAIFZpHkdA77tFPbg3uj+t9tt7zJrTKTISJMdKIvXAvbWAYzdbzUU
	 C3qP5d/OuKjLi+26RMw/s42RFLaP5wlQe/rYPb/YowhUFUkQEO5y6trhh1cGD0b5c2
	 MzZGuSBywhLLamawIagd9jRf/l43Kyn06+CwQ/0MSPlxxDQ4xBSSEn1Y6xjzUSko7u
	 v4c2saAt/GtyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: iio: dac: add support for
 AD3532R/AD3532
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-iio-ad3532r-support-v3-3-f6e4f4abebbe@analog.com>
References: <20260629-iio-ad3532r-support-v3-0-f6e4f4abebbe@analog.com>
 <20260629-iio-ad3532r-support-v3-3-f6e4f4abebbe@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:03:06 +0000
Message-Id: <20260629100306.C68431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message for the refactoring patch claims to 'Switch s=
pi_device_id to named initializers', but this change was never actually imp=
lemented in the code.
--

commit 2f85a102e878e53764e40f42a40c71a43b98d329
Author: Kim Seer Paller <kimseer.paller@analog.com>

dt-bindings: iio: dac: add support for AD3532R/AD3532

This commit adds support for the AD3532 and AD3532R 16-channel DACs.
It updates the device tree binding description and adds the corresponding
compatible strings for the new variants.

> dt-bindings: iio: dac: add support for AD3532R/AD3532
>
> The AD3532R/AD3532 is a 16-channel version of the AD3530R/AD3530.
> This adds compatible strings for the AD3532R/AD3532.

[Severity: Medium]
Are we missing the change to switch spi_device_id to named initializers?

The commit message for the refactoring patch claims to 'Switch spi_device_id
to named initializers', but this change was never actually implemented in t=
he
code.

Looking at ad3530r_id in drivers/iio/dac/ad3530r.c, the array remains
populated with positional initializers with type casts:

static const struct spi_device_id ad3530r_id[] =3D {
	{ "ad3530", (kernel_ulong_t)&ad3530_chip },
	{ "ad3530r", (kernel_ulong_t)&ad3530r_chip },

Is there a missing patch in this series where the named initializers are
actually applied?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-iio-ad3532=
r-support-v3-0-f6e4f4abebbe@analog.com?part=3D3
