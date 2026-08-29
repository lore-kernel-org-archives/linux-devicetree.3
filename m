Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1A3603D7
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983554; cv=none; b=SdNGvg++4WccDMq/y920JOCcyD59CzEFWXJxbHDp4DjLiKrQxHc0SS97EvhuNbDrwQR/jjfpPx+Fz89rTROtiXy1ONUAKK1XNIfP9ke/kz3QCbQjKlZmGB79EdL/Ub050pyWw407SI00o3PggNi5m5GA5kXPfLZmwkngnz6gFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983554; c=relaxed/simple;
	bh=srsIGBTzPnBYSVqsARBZUdEEhyrfQTldRSlpkoIrrCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JZzGIqGcwMnEvqd0UY3n/XXcAV0h24SXe7Wtax/Jdtrd1bSsfpfBAjbpnWo42MgDqmy7IhR/CjeMdJO8Fy7OUQ+6XLjf93aogFvs/WkrdR4EHQouLRWezwMEAkcxNx2iom5lXjbUwZLaLszdPxGmOgF47dnoqiIGSxod8Nulppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrI0aUjT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrI0aUjT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A318F1F000E9;
	Sat, 29 Aug 2026 06:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983552;
	bh=ed5xlWTOd3UF7jO7SFQms93M400gqVbBpLnBcbAfuGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JrI0aUjT1yeOuQG0XosxnY3TM1pGd7lVp2kDgs21Qdi8yOYv/IrR5q9kFqWpMfKi1
	 /lBmPA8V8VLL8HgjkA7YXkriy3h93FvU7rfX2Xs+FmS5+c8z2GMTlA44FfiTJiFYsG
	 aE3xxtMVRpK1X1egAzx81fQ6mXdEcUJv6bPocaGwJwwKWS5FRUOSBuw1atzXMUYTnr
	 Irk6LJdVwD5HzWX1HUGqpUov19+8nzCqM5E7sD7mKgfRwhhVNkuCSFPrGvG5Uoee3H
	 GWrNdKhnesp0gpC0vVR2hWGJWsLTop2ldoTxZDWQzZ6QgKBbn623PGFfgkTnHPMgDn
	 X5MqwpQl64seg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] iio: ABI: Add DAC current powerdown attributes
 and 15kohm_to_gnd mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260829-iio-ad5710r-upstream-v4-1-8af3121c7d21@analog.com>
References: <20260829-iio-ad5710r-upstream-v4-0-8af3121c7d21@analog.com>
 <20260829-iio-ad5710r-upstream-v4-1-8af3121c7d21@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 06:05:52 +0000
Message-Id: <20260829060552.A318F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing ABI documentation for `out_currentY_powerdown_mode_availabl=
e` and `out_current_powerdown_mode_available` attributes.
--

commit 68e36d76df12ffaaa85169b7c722c98c67e19f8d
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: ABI: Add DAC current powerdown attributes and 15kohm_to_gnd mode

This commit updates the IIO ABI documentation to cover the
out_currentY_powerdown and out_currentY_powerdown_mode attributes. It also
introduces a new 15kohm_to_gnd powerdown mode.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/=
testing/sysfs-bus-iio
> index a4f5595722ade..a0f9aada5c62d 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -762,6 +762,8 @@ What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_=
powerdown_mode
>  What:		/sys/bus/iio/devices/iio:deviceX/out_voltage_powerdown_mode
>  What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_powerdown_mode
>  What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltage_powerdown_mode
> +What:		/sys/bus/iio/devices/iio:deviceX/out_currentY_powerdown_mode
> +What:		/sys/bus/iio/devices/iio:deviceX/out_current_powerdown_mode
>  KernelVersion:	2.6.38
>  Contact:	linux-iio@vger.kernel.org
>  Description:

[Severity: Low]
Are the out_currentY_powerdown_mode_available and
out_current_powerdown_mode_available attributes missing from the
documentation?

Looking further down in Documentation/ABI/testing/sysfs-bus-iio, the voltage
and altvoltage variants have their _available attributes explicitly documen=
ted:

What:		/sys/.../iio:deviceX/out_voltageY_powerdown_mode_available
What:		/sys/.../iio:deviceX/out_voltage_powerdown_mode_available
What:		/sys/.../iio:deviceX/out_altvoltageY_powerdown_mode_available
What:		/sys/.../iio:deviceX/out_altvoltage_powerdown_mode_available

Would it make sense to document the current variants alongside these? Witho=
ut
them, the documentation is incomplete for the _available attributes that the
IIO core automatically exposes for enum extensions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829-iio-ad5710=
r-upstream-v4-0-8af3121c7d21@analog.com?part=3D1
