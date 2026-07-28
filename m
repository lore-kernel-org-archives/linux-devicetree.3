Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B428B3BE652;
	Tue, 28 Jul 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275089; cv=none; b=QivZTYkVgb9StXflbpTqrjL/R8T7ocIDz2S/9IPcWufsipwB5IGXc58ELWI9eBLsDIlrnA3Zcex/f5VOshT/WP9rhQf1CoODMSqbdhjqFrT43hpgePhIkaOjwwLMdX4Exrf0DMKZfObXC140x+mzKWBqGHYAhOcN9x64dWJaAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275089; c=relaxed/simple;
	bh=U7spWcY0H8vLDHg6cxrAcR0wDjCwQpic/rcHbeuIKrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz+pvZaaiLW1EIOjZ9AC/4lHPs+BF7kGaO/9PU+O05Uesvz1FWWWi2xUCUZ/ulGvI7Ztn9T7UPxhVcFQv9R6FK/CNq/KKYg0eeqF9kOvcohXA8Yxcw96i95CCewE0ib/4PfZZLbI+bXK8KJkIaNIEugBdDU0TfSoQyeota5yIFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFJZswlJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFJZswlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE3F1F000E9;
	Tue, 28 Jul 2026 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785275088;
	bh=ydnGs5+SvUGu/cMH0rWpcTt/UFbIzII65j9MTyYxVuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LFJZswlJbEZ5vCLjwKbIc+cUiUQu4KuMDbtT9X0e0fVpXUZ2lwxtWE7LDD+adU5uB
	 bQQwcJvtW510W7ZYm344cpnMROEbSEoG2xRWx8YIw3L52POaUSaVhOzzMRRNsPuhKd
	 DfLsBSf5/qW0MCeToYHyYtYAvLjiM3x8vzOklguIcu0CQvwM+HblPMBGMIPEbtK61o
	 jZLPz3sUXECucqlTgSslsLiGMF6XHYV3YnhzoJVI69xtcz7Cc0l+d+8JNhd5AoAciQ
	 nG3UbgjpTs7/WPFiIp/cVZln5NCXKb7h0AoDwooGM7B66r6P2z//3nBgT0Q2pRWEnO
	 xY4L9srP0vZwQ==
Date: Tue, 28 Jul 2026 14:44:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 2/2] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <amkizlBd6lUUG08g@x1>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
 <20260723084316.3573714-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084316.3573714-3-zhengxingda@iscas.ac.cn>

On Thu, Jul 23, 2026 at 04:43:16PM +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> As a few PHY parameters' default value isn't ready to work, add a driver
> configuring them before letting the PHY run, in addition to
> clock/reset/regulator management.

The second paragragh might read better as:

"A few PHY parameters have unusable defaults. Add a driver that programs
them before releasing the PHY from reset. [..]"

Thanks,
Drew
