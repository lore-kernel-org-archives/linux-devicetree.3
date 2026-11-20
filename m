Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175295;
	b=174OUbTRl1SFiyRjj3l71eDS39qrXMutmV4/OD6fnHXFNToQ3vdV3wK4WUjCuKGrqYVf
	 0WFI7rba7Vp8qVYtPaQgIIMwnEpcR6kaBbr83LE4pwwroVl1eI07woVLf1YjcW5UcUp9g
	 BJs+xwz0vRfK+Ve2zsZoMei8EVqSaWAJdgsaO5rM6PTRLFUCdGbLcqbuQtNFwszO9PTm4
	 8EUB+LceQZfzfH9TJWSGIPxloQVdI/qnRh/42UI+IdLgwx1aImvNV66oQGes3tFrzPE5w
	 ic4fMsOsXIq698JM3m11uJcT1cFZSfizMRB7dVl6ToZHRD9/MnW/oSJBLhsKQbau6Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
	b=NQyAuYQaH4rXPD1bzNVcskgkaffRA0j+JbWV9DvWtUWPhtHm28g+7m4ZrsjTjCQGMnkO
	 +/7BuaKDUvmz6tTFlf4nnooKF4lG2ejyeg7A8MpncVN0Aj8FRY4kWBzSmDCq2nF7GCMys
	 lDvushV6UkX2+3+JpLb4DA/nLgG6SSt8Pa7s91620DZVwkg2rbbJtvVnsxsQI9aRehhH0
	 JUc8WgOTzZYoQiUPBGOvpSD1qj4CLHX/rB+Fz2zg4GImTuahmoHzGZm2UfbEmpQ5NV9FJ
	 1CPUHXCmTtaUOQohddKY7QuaIUZRZBDHOQKmSJ3bBvbJUZxwLwZGWqiiritznJ6H4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnQ75zMz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F085606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F085606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnQ75zMz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso354490f8f.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795175292; x=1795780092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
        b=EnQ75zMzFcsNYIhOhj5WtMC4nneDEbxdDpsvgL8astfv40uZyk67gSwidrESCxcxgZ
         6HloHebJbnU/LlJzBN01hH1ymx3dMgnJ2CpjPumtCyIwKBU1td5gFp50m1VcKYxUZ9Ev
         yfXgo5wWFe+H4adnPWg7z/9Q78U7sIOmbYUZtyDW9jl5OLW63yAqO5uSuMBDyyuXouJQ
         ZBGs5pNG4E3ulZg5uauzgiMJjwm7M+VRo2IQeRQV9rfTRaLb/p7rGUXOW2xH4Odkxpwv
         41qCvOWfsA6rk6ZJFxIt6ZuT1Y8Y76DHrhBaKeR1IrvBndYIiWgHo5Tg1COGV5tXgPJM
         ka6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175292; x=1795780092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
        b=LUdhNq3JlsaTASsGu2JjvKT2LUwOPvRPeiQewQ9rE29VLnlTfrBAGvjhzGPo8Z+6lg
         Jk408gwboXXu4a0j5Fy1jUcfXdNN/qfdlZ4W3bIz6BHJNhkTg2QXHVPiGNxdvl0r6AbF
         Rr9Ju2a/OLGN6N8n0V0LNT3jmGyfis7W5x3gnxgBnKIu0A0euyanNnVTuvPNj84hsPER
         6CoF3GGRJUQvTBhil8hCUnjpQcP3TUi5kSbxkEdF8n6ZxddeqM9ABxGgMINn6qmli1dG
         zJqfTUOQUqRz5G393Gw+DIb3FX4guLsXjfRaWbWG/QVu6zQWU4yq+CVrtGMBTvqWMCjT
         pQYg==
X-Forwarded-Encrypted: i=1; AL+hErE9SczKJR2lxvatWPqQR1TQKveEWtZvm2vd5MZBFaKd27QTGgsNPMsBWsXuA8xMtqKZsgpb/M7lABoK@vger.kernel.org
X-Gm-Message-State: APuU4Z8tkFQJOar+RrMAM2O7Q3mHykwF5SdxDzI3CprtnyJeCRtChTsI
	NTUgjRykuCNemXp66RVwdunKOkgBCWL0wdFChmGdDQrRZklI0yU5/Zq5MLdKSvTLAH0=
X-Gm-Gg: AZFdTZc2QMMMPa4p4rV3wVo/BeOidlnRLmqjL00FbuHJmQGz9MfPUZtdWAKCSxoNCnk
	SaZycOsLuMtmCjH0uRvQqi1ZkhVgNyPseOkAngK1T2FNrU/hWpvhd6RbRK8rxAcK9G7qKWaBYQc
	1vy7RAcq3Y/WNMfH9jGkeEBENeyMx5gX7CdCWsy82OcJjeizU/alXwEhPMcoNWbwrzgyCqEptq2
	GqJfJzMF5THSafyVyS+QrdStaNSHVStiz3ZxCZB6WgFlLisfNEcWaH7HGH7X/RCIhHf15cQHv5y
	F6A0KBvm9q73oTAy+ac+pPWgLCv2/CxazrnQPA/wYJwTaPWgWFw/nCKjPqa1LaBgtfTvoP4or1F
	YHL2Akanj6ADzBhSAlbc5NoSWuGOVX1O+hRO3W7XQ0lxi1qogWvvDpLKcjM5BmRj0SIepLuyWW1
	/YfB17qW5Fo3RpUpytIlkSUuZOcbNOk1LeDvE7+3gDzG9gExeic3d/o436JfZI6zAr9LT+OCVVm
	VxVkgD5hKgWMNG84XTEzgdpC95QDi+KRQzVvhgBWiG0ZyooOp7Ug/TmQdt5/oNfvHo314clrdYF
	w2C+N8zPHroSR+WNTNeBdF4c+KreSDaE5FR1DYMx8CDQc0vMA6AjJ2nuzu3t3a+No9jKgNRGMVJ
	FmRqUZfPUubvRlIqtTRIn6QPfBycZBfgCuKbZpw==
X-Received: by 2002:a05:6000:1a8d:b0:4a4:6669:7f9 with SMTP id ffacd0b85a97d-4abb400bca6mr5874552f8f.49.1795175292597;
        Fri, 20 Nov 2026 03:48:12 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2c8csm5394408f8f.2.2026.11.20.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:48:11 -0800 (PST)
Date: Fri, 20 Nov 2026 12:48:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Charvi Mehta <charvi.mehta@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rathinavel Sankaralingam <rath.sankaralingam@arm.com>, 
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
Message-ID: <awAzFsX_VUbzTqK4@monoceros>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvydzoq4zesd354o"
Content-Disposition: inline
In-Reply-To: <20261119153758.1426673-3-charvi.mehta@arm.com>


--qvydzoq4zesd354o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 03:37:32PM +0000, Charvi Mehta wrote:
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id, so
<linux/mod_devicetable.h> can just be dropped.

> [...]
> +static const struct of_device_id mali_vpu_dt_match[] = {
> +	{
> +		.compatible = "arm,mali-v76",
> +		.data = &mali_vpu_v76_variant,
> +	},
> +	{},

s/{},/{ }/

> +};
> +MODULE_DEVICE_TABLE(of, mali_vpu_dt_match);

Best regards
Uwe

--qvydzoq4zesd354o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAM3cACgkQj4D7WH0S
/k5DkQf/cgk6stCU1NBfAdhEZ+zxJ6rOBVYVdtcPuivB9POWQAiF75S+YotgohjC
s22HbJ19JiNT68r+8GqaNce4eND7JuioyoyehC4Ghmq+KPZu2sbNqvUQieLSPPcu
9jbJOJLywY7Yr1eNrw4/HciN0FUf+G6HU5caxEZsBmTqt/Q1Op1E3NKChCuNYNpE
mUjAyuwDLWFcqtLlePnqTWbzoruWjKoG7jOGNwmYyisMB6C63WD27Q+nixcbJ114
bEXA+AZ0gKnvFQ8uw31kcG9U3V+dfiQ5FDNKEATVVPW1wmEvd3v581ruaKEeUOw8
jTnn3+G6WqcROn9Q+kwxllOO/p6b8g==
=dMOh
-----END PGP SIGNATURE-----

--qvydzoq4zesd354o--
