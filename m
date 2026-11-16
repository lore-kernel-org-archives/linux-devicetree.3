Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817359;
	b=X8fQUNFyNYyPi5z8DgijDcY7SCuRK0JhUYZNL+tBEU/M/5e2Y4GGeS9yoa4nfNhd24tN
	 l+G+bX+W5lnJKrHNbOWJPvxPxv0Y8BDsx6vplPxHreoHs550Gk315a62sZ0rCe5xzNDzE
	 6cm3T7djKgmKXEIH+NjHjrKqqPzJwq4kqTrJUFLSxG5jPbMt6O+5pDp0ww/pRzpWBK/84
	 fSnZKoKaNUH6ubcRUAakTu0oeJSWDuU4ENqSHf5LbtjwOaDLCm2IBH22I008hlYrDPImJ
	 tbWdMcTZsG15ybOjSena5OLfe5+VelKc7TvIzY7A3mJN6NXv0OPgNn66FY+ChRz8c/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817359;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FhHfyYwYQ9ZGP17NUjMsOu+VrPrB95iXQbOeEOYKFOs=;
	b=fn4e1j+sLoOlVK0dNzCR10ATm5Q1iPjPwYivCwLQ25MTwvZZfX6AIYmXp493nkeOhRmp
	 2vIcfQnXCwIY7Kdjz5XPhcp+DdTpKtQ26UpViiZDoS4tczDJR2CDWX4D/Z7ozJHVeCehW
	 jRP9IZs2p7YNe5axCgGbaQceyXLMwcmNYWaCCBM/G2VE2IxHFfjB+a/y3HK6bG7LbwAeR
	 qjQiuCOzTyHuHtT5nZvWec1VOzqbsrdFfJxKsQb6mDHdR+nFkgOfbXxKvJbvn0J1B24Cg
	 tCKIJ6KEFJ++hZxqgeV/xJH6Tt0UZq3PBz5wXAWugGnv/OR2YrOLJ8PLrCKQSFzNrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="jx/ZBIZU";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A981606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A981606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=jx/ZBIZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FhHf
	yYwYQ9ZGP17NUjMsOu+VrPrB95iXQbOeEOYKFOs=; b=jx/ZBIZUH+eiIfgl591n
	kki9k049+ZNEFJ6O8zEQf43eL2mUryLnYS6WONV35hADltlR8913ZsixH40hIN7M
	VJdX7R7NtHbnnEPcK1Cx4qLIwgAAAkEUIxLghF2sGxEwGhBpfpcraSVFS6OxBnWb
	6knyJdn2tt5NVk4EcrvGRFASslihaJ6ZF+tfI7gAzsFc7aD1zwt/+xbbXmBtFWoB
	GDjvx0KFOdXUqMvBTGcsvH2veU13F0d7G/YP2XBruubZ0O1r2rjAH1rynewjJarR
	s6SMAGdGvyLWzOH4nB8m5Esih77sNNP7aIVQQEjfU1NA4nbdlGVAspdZE4N3OISG
	bw==
Received: (qmail 1194944 invoked from network); 16 Nov 2026 09:22:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:35 +0100
X-UD-Smtp-Session: l3s3148p1@Iy/hemBg+Igujnv5
Date: Mon, 16 Nov 2026 09:22:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return
 -EPROBE_DEFER
Message-ID: <avq9SkUx-3q_28wO@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2].
> 
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
> 
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

