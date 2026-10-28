Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171861;
	b=TQSHGq/DDJ+bJrYWkMvIbsrACH9GEo7siXEHIr1Tz9kVwFLSoE+iEOWB8qre7jIKNth1
	 /C4WnHDNtiPYS8OSzZ6lzm4div6efFXkDkhrWkyOth0AjQO/17H91ROncENo+yTC1DQGf
	 +Knb2GyLsSxhNp6kW9IGexe+1eK6UrwyCYljtk4IP1a5SB/KxHgX6kfauiOvCBfbA/A7t
	 LD2oirdy6Pq7089N21Qia3sbDIvqzjzGqYXWUu+3facTDoQNJ9mkdp/sOH2DsonkbXruX
	 x++6Zc3qwTwk6dOsD7tcmaVuZ4KcOUcKUMbJVrK6aydusU11PXbob72RucmD7sGyT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
	b=bpk86gy1BQ4RnrQxFVu4m4pnSgNg8ainq6AvcdGezS3p1pjuFsrPVf7bZ72Vb3ByrU5R
	 NcuMXqCK9GOpuzUb+Bvxii/6K2eRX1B9ziX1YdZULQJ8ZkXSasPYCms8I1vsF6HXnSLPZ
	 sewzXfZI9gFM/YJwxv7qp5NPfS/ip3uF1j6S1zYYGkOLv3Tm9ayxANa75vKfbpIQ/nxnP
	 /7oedHrN/zL7wgB3lzqsGHl5hwzSAU0VzJynmSURSGfLnvmDq7j3VDpUr5so2U1RALFvU
	 Dg+JaK9vZSghghkFY/csrqKQvq5hxhHid6TTkEyzsIGjXzN/7rW3myk7FMCuF9YfPFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E4606A323
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3768005e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=mXYTeY1DFU0B3UNUDpGvH1++9XqRCHBN2c55fDs3gaMOQO47WsY0IeKIoXEOK7phre
         qDRnMs8ytOMr0qtfMOSb8TiEdkTuTi3zrvIo29YjRcHCIyNVRu5jvmrnw+c/7+ZTnZdu
         g+m+dlrewe4oGQ7cM44EPt9kdHQxTNGMX2vBj7nmA41j8BZlObfZrV/xzfLKEfzFF9JV
         zX00cy7U2P/7MMHvf57mTP9FPWSpdqrAGPOP7VFbEtS+I5HsiFc5gBOTKp40co7SyViU
         LmvhwSbNkcVsBfy3XytO1tE7SOLtX0a18awiJgg9Nhufe0Sw0QKxI65RIMv39zTiKOBc
         rFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=ttWxKuS7D1svuNvmBGp/8SRZN27Hi9TLatVuS1aM+R1IRnn8mxwsMWAAis4tsCN2qg
         UItNL89waaFvXcaios3k3Rx3wRzK+5HtICgAjvcCPA4qpM8WL/4D1K5+plcYUfEJ1Le5
         Lf9L4VPrtgltRmhRlYsgiJSS42FF7UMyEpAwTAPg/3bw9lsJH/AMSbPMLXCkbcnbrn7G
         gRVOcssxwlgLPRHx/udWHnRzXu8XyjTSCTgP87CSnzKVkV+lUQ0E139fI6l5P1A5txO+
         6QV2aPF7H9wKkN0c9FiLmyM1khqhBgO8Gy5pg2BaJachvxttzSCJpiaGOTZBAOkStW3s
         nhCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMhzt/1NU1WUoufMB2ZFH/EIpzZHhJhK5weUGv4hf+NSe1ccq3+tsDz8V6ZIrm46CXsFuXU1VJ5ON9@vger.kernel.org
X-Gm-Message-State: AFq9FYJrFCcI5hyM/y1uB11Cl5HPfqjvV6ZpDE4gKKIWVhVSHT3OHCJc
	zRPdZ+7bU8tPjWJxsQ6+etaPy4N/PdWtZhDwmC7GodwEJ4FdtJSkZdrXiEruBwy38lI=
X-Gm-Gg: AYBFou1fZLKNSYD3BdCM7uWu3cfMoe36WvD3Y5NHQul2MFDlUfcegrbD+rHI9QNbjYI
	nQONwaUhYTwQvjAUb3xHfc9/k6noFQiLQjzWuhcfBIDi4p5B3ws2XcWbNkt0hWbi0hJIxRUnhRn
	MzsDYAOgUjbiX+YSeWKcJa2WtJAbbGzhjVDiv7P+17hbpKC/bDrfvNQFxu6uVnEZ/Ym5EzAP5o0
	aK2JY5FTS7N12/NxgjM6BHU8mdE/LIbpV0S154/2B2ov26+1L6MlUcySqpJHDjYPuHMhDj0W1dB
	W/KVRT/GtHTx7rkxWh9+FgYUlMzvhkMt9bgeJ6/Tt3vwTBkY7+2Y8bBq3WxYIXnvChtyB4HpB8i
	/hDyA25+0vp+nVJYyaFrzpiEUYHhcosP4KzwLsPnY+wQPj2emjPPfCQcfb8fuder0g97aYMD04j
	r8CPR6eIWwIVx4HLQahJwepjTYQ1fbZTdYiUwlBT1AiZHNyjevqRQJ0PU1N0zdvsZ+quWlYTelC
	rtr6M5EUHq2o1ZWH1iAT4ItwyaLfInoe/Xdo5UFXPFCdBrsRmc7L5DeFtlvz5vyoG85ALyJD72w
	7EcB+9imLWuwOW3utFh3omki6/KfGMa5Q2iOqnmpS0OQQelLXpkwyFSLortnZK8dMx/H/8G1GTG
	SVi039jPzZcRP/OM=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--
