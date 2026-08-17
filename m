Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C71632DD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949025; cv=none; b=Ir+eRcaucPwkreVsoYNc0Wq73w06q/l3GJTty6UqIYAw79C4gYaNXRfMq+6aRgRFpGniarl9usdpBtOiZyrtq3UoiDYF3Yb9VFX2l6X7Te8hTF3yJvXI7A2NQOdnVkxZbl8LS9q4O9XG6MDK4n8dKEisFmE4mS2ukJHGozr7qRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949025; c=relaxed/simple;
	bh=I0rSo0F8Nojis6OUHfRelQegyg5Fl2/yg6Je/yNzj0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mnJaQDow/IqOBj/sg/mTMj1SaAdTx4+SvjdNZs1r0gQFmjXc2wEKZIaFM4LEbX1f2t/qVZgbr1ZzRncG3xDm7mh6vvQVwofsGdOeehsFQP+U7s/aHxY4TkcWSJ28IGs8e/QUSozGzoXlCPC3xhY5wrrMZ61eT7B6M9I087CIcY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXeaLX9h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXeaLX9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE8B1F000E9;
	Mon, 17 Aug 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786949023;
	bh=1hrdmZMdH7iwUYFKBGXviIdnXiUerc/hT4I3VnjZ09I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SXeaLX9h9jO8fQtGzbnPY5LZJvKNWvnU9wuxUzK3BHH/kvT0lekxg3XMsogOn0HNt
	 WxmQNgxmdCw0omyYDL1EuIV1F/JoSG044HCGXXJqISQsipXsfO08Xna0La4nQu/2qG
	 jEMpchVmTdcY2u2DkIthbY9tysAonFYCi+07AlmXG2WrZaPVjaQH6Zy8V9Vca+OP/a
	 nhBIPGtl4gAHAYJdvi1qt17wZRvpYlAFjx9a+uHiuVodckkv39SJgrRNhg/K04iRCn
	 rvZhk36e/jGKQqHMS55x1LcszJUw8V0rD9v1ilUVwiNNQbYf5HYhdbf2J79nZYurWQ
	 cfFfHS9VGmxNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] iio: ABI: Add DAC current powerdown attributes
 and 15kohm_to_gnd mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-iio-ad5710r-upstream-v3-1-3a4bf7b9c78b@analog.com>
References: <20260817-iio-ad5710r-upstream-v3-0-3a4bf7b9c78b@analog.com>
 <20260817-iio-ad5710r-upstream-v3-1-3a4bf7b9c78b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 06:43:42 +0000
Message-Id: <20260817064343.5EE8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit documents `out_current[Y]_powerdown_mode` and `out_curre=
nt[Y]_powerdown` but fails to document the corresponding `out_current[Y]_po=
werdown_mode_available` attributes.
--

--- Patch [1]: [PATCH v3 1/4] iio: ABI: Add DAC current powerdown attribute=
s and 15kohm_to_gnd mode ---
commit 3e8e143ec75a90ed9c1acf741435fcedffa2116c
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: ABI: Add DAC current powerdown attributes and 15kohm_to_gnd mode

This commit documents the out_currentY_powerdown and
out_currentY_powerdown_mode attributes for current-output DAC channels,
and adds the 15kohm_to_gnd powerdown mode.

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

[Severity: Low]
Since this commit documents out_current[Y]_powerdown_mode, should the
corresponding out_current[Y]_powerdown_mode_available attributes also be
documented?

The existing file has the available powerdown modes documented for voltage
outputs nearby:

What:		/sys/.../iio:deviceX/out_voltageY_powerdown_mode_available
What:		/sys/.../iio:deviceX/out_voltage_powerdown_mode_available
What:		/sys/.../iio:deviceX/out_altvoltageY_powerdown_mode_available
What:		/sys/.../iio:deviceX/out_altvoltage_powerdown_mode_available

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-iio-ad5710=
r-upstream-v3-0-3a4bf7b9c78b@analog.com?part=3D1
