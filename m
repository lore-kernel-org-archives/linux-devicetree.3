Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0D27442;
	Sat, 15 Aug 2026 00:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786752447; cv=none; b=dnJWe/XDjsd0BUO0/ZPTDyrxwr9bjN8SrU7MOu1oKfUpDx8MtNPkCAg508S+jDstdkNEY5Lv3JtAGitGpPepMHSQO3mqZFmhuSyo9kWfhTXGImClvKZ9vYCQuQ53dA7pCmEFyd9FSCDgsYpXejbrVVAHbRSLuw5hbLm8R3l7OCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786752447; c=relaxed/simple;
	bh=D1Xl1kIlCuj/VcXEQJ1HzyJBUjc2loIOMAquKPKf8iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EanKVMlUJPUiTmoQ6WJhbQf2bqIxDJ60YghodWwb66nfLYzO+F2g5p4w5BJ31t3vklb3gyssHbKtvSUwVAMeXKosRmPz6XnX7HIwZN1RRddk1outHhm1E3r+S1LJQzzmezm+cCRUFZdiFu9ZAFE9SYopVgZGsoMVkMwDOilopFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGXoFfFj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGXoFfFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537161F000E9;
	Sat, 15 Aug 2026 00:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786752445;
	bh=8VX6Ds4+VVHwji9yYO6BlrcNEeBvIEUFqy5YGaI+leg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RGXoFfFjb6Mv0dWBOVI3QYiA7TvdYqUrMBRyZZw3W/X6N7Et6LZTZVXiWMUN6KB7c
	 6/2972eydibNJVlPds1f1jbD+fhU9oRDtBOOOy/RkU/ecRKbARdvNlrmGV0ZDse2aA
	 OA9MbDo6+NO1cerhkiyWsGNKr5031quVbQ6FSLqu4Znf6nxYWFMVs39PvO2peSrxYv
	 N18AFJshFUg28ZRqf159kk9yifFue5gklIh3KH1mpf1y1wnjgdQ7W8KyDVdrmW1vWd
	 sPJMlTFbaXEzt9cjZG2cQzZU25o14Ik8wkvE8zBkBFT2va8+HmVHy2W9E8cXuCUW8D
	 EkZ6y43k1m+8w==
Date: Fri, 14 Aug 2026 17:07:23 -0700
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
Subject: Re: [PATCH v2 0/2] phy: add support for TH1520 USB PHY
Message-ID: <an-tu75UOjleqcA7@thelio>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>

On Thu, Jul 23, 2026 at 04:43:14PM +0800, Icenowy Zheng wrote:
> This patchset is splitted from the "Add TH1520 USB support" patchset,
> with only the PHY binding/driver part.
> 
> Icenowy Zheng (2):
>   dt-bindings: phy: add binding for T-Head TH1520 USB PHY
>   phy: add a driver for T-Head TH1520 USB PHY
> 
>  .../bindings/phy/thead,th1520-usb-phy.yaml    |  73 +++++++
>  drivers/phy/Kconfig                           |   1 +
>  drivers/phy/Makefile                          |   1 +
>  drivers/phy/thead/Kconfig                     |  11 ++
>  drivers/phy/thead/Makefile                    |   2 +
>  drivers/phy/thead/phy-th1520-usb.c            | 180 ++++++++++++++++++
>  6 files changed, 268 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> 
> -- 
> 2.52.0

Hi, are you planning to send an updated version?

Thanks,
Drew
