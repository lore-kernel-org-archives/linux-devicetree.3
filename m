Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A24749C8
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114801; cv=pass; b=QZ3V6jzivqv/A0OxgHk0qngszlDa08i1LLif8sQzEJlwdSQKL0PTVGSjdinPzIwp81CL8zSa6lpYYdm00XYoVdRN1qDPH7dCpnEPupr/tnm64p1E2QKfNW3mhpYpQaKMjHBZDqzvxxz/3KYStrbaZuqg0JMQNs7ntYoWqnBGdog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114801; c=relaxed/simple;
	bh=gV20Qq1q8KHAEqMNSgw5mTDYx8Xl3nfNz4w7UDZshT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3YSGbsmcpQzISkUrASYXhUKBLTCnYapL64uvi5a3R6jJoETl5iikzlfnOkF2BzrNRURwzbxCOo4r4ZXLz2Q0EhXpkgEZQ+yPNzZhLwa+RWVhdGn8hThg4z1ZqVpiYaZcvIZ5+8EJ4hVTQ1+z7HR8686RY0QHa5MyFSXtxAM0TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gyl+qiOJ; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gyl+qiOJ"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso1860462137.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786114799; cv=none;
        d=google.com; s=arc-20260327;
        b=fjsUUaWX6vLYM25OxeiWhcUZ7Js7VPkQo0KNSBrUBlYIebGnZcMv9ag6Pmnt46A8Og
         0RPQYms+Tuw2csxjsTSHxELgyeip8kHjkqLOW9EmOMXjDPv8TtWomUdkO8tq12zn0+zU
         j5GVex6rlnnVFq3KHTL/LxIzzgvHn0vvHTrj9z5pyzvEDzSAAa1Oq5ijOtN0VMFeEQlS
         bcYhvPooeAAJPku3OpwTPIP6YsaO7f41p+lAeX9yg4ERLRS/ti9mfZlovl4DF7bp4M/J
         VGNw0R/0XHuGgZ0QCwVKAr7+YvDx6rozWfrl17r0Ue83wpNTd/rZKxIfaWaWQ2PYtgyO
         7aTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        fh=BVDh9n3/ZSgN2PIDxXgFjM7bVqBY5CsJ4ZGh94xg4FY=;
        b=Kb+KHdsY71+m4XMrCZVz/MeSfOrF/dcbcY3zsvv3k1AWt9UBOvHPrmZem7eSjxgo8a
         iXxiJaLEcL4Hf2P8WDRgYiCm7/GWJq7SLhl8QePRFQxcZUXuYn0/WB6Y1Q/szqv7z0Q2
         8bqNnxWE5F/PIcmbhGJTBO1nebM8/WpEh2ebYHGFUW104f/y2xVLfzFjwI9vxc53Jvvz
         443XeHRY7Vv651nPjodFKZ87p49t7Bc3/QmlQsVehkRT7BpdNZBrlYcenGCI6UVCGGyW
         kXZsFxGac1LudBmxGhab/4tAd2tJAMpHrvwjukKANMJphJhQYWAxzCx6ms9JgnjvbbRX
         /Cmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786114799; x=1786719599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        b=Gyl+qiOJiAmjPzSOy+yAUbgHE7C2l5ryrcwZj7SEstdeZ+RQ/gj0b3pqLcoW8xI+G2
         w2S7/9zA5bbP10Ap0l2Y67e5QA9K44vSAFVIWbKWgO6Z/6LORJD2qArzV6qC4vK4fVhi
         eMxU0mH8NslkObuipwS/rQBTeJrw5of9PMksU9uX9cTRAZW3bLaQY6gq3kblSvGOAJvT
         3U2CmeCH60eiIbrMmDDH3T+kowUcOpAd++FiuYPTcTvC8T+++pRDc2WTzkLjNMsD0y8b
         mryaobBDYudLE61t/mF0Znw65XqqXKH37ghcuoyZbB9lu0pIgHgMsV332cNNIFOP1TRa
         E9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786114799; x=1786719599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        b=jYlKyDTuvKCS9HR3j+dMZIXj1AzT3O858LugZZjiYJOSrzLYlxetsQj1b3s+9g3zKx
         xUZgUoMbnCHOdkBR+1HZUowkf7GXkz6lH7AtjiHMLZ7FMkDhgLusUoq8WVqBVNeBGN0W
         zx/Av8ct0+akCBMWFFs9KTbvwMiAwQW1EyoNilmsH8g8tjKJDqRY2rRjjHIAh8cJiGN/
         /YRW14aC4eC0SrTGdKISnfJGanpTDItUrsWZAgV0ZAaPcllvWkUTHiNwSYhyRU96wdAj
         +ouA37cU2V89iaF+TSjFtJEv+COKHBOlWU6zF53kvv+SJglTLTlU+mDB2UhSDtl2F79Z
         JBdg==
X-Forwarded-Encrypted: i=1; AHgh+RqcorC2AuC4b/IQbhERJP8PvQeHcWVagU2yqWlgKV3FhZhlKHsxiKCJ/IWXcLSu7ryshXvkfW+nWVQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvjxfHLTPxpZgtF3FG1tnzhmPodJOFAB8LrZqd0lRUVAeB+6n
	jWQE2LLkPGYrzuQfg3qBZdBr69ov+VImvsrzxxgeNJ3Zfv6MoEw/Wv5dRFCV0ZjP+s8hRV8UiQV
	GoZKQewT9wJV4xyrSytXnkNPXMh/jMmI=
X-Gm-Gg: AR+sD11RvGU6XIdefihKE12HT+nyCzCp2hxikzOKr7Wcvu5f6J+5tAzzN/AqN0040e4
	V9x6bgT4ipn5GtUkiGL/CrOiwJRSN17ohAN2J161rMwL92vV4e+vO5CVqsVhC4d5ZeJjGpPC6v6
	xGxIKkb3qTg1CR9yX0F7jyXpkjAUFIcJ8NQ9m0ErtLJ9DkIHPTrUdPWkpeydWLS8yXLFVCDcM9i
	hCC+nHiS5YF/SHJsPDYJkHkwr6MngRqCtVehTCeJfwFdf5S+p3cgpxYnzYsknTQBiU64GTGgawb
	Y72Ub8F/2kZuH7SqBOOmskhBBAMwXmZEYGSvXyOZaW6S4lZfmmpIZp/18MuR1jmG6AJUejLh3Yf
	LBFX9VCpdnhT1yRaAQDUM0JlMm2KxyEmjDdje3fMY2PkYSC9UVNTbZJpX9dvBdAWartEPFnQpGs
	E5G1DNoHFcdGthurHudpzOLw/1Z3QBf2dzuQbV
X-Received: by 2002:a05:6102:54ac:b0:738:bf0f:d0c6 with SMTP id
 ada2fe7eead31-760e3b9ab74mr7413161137.0.1786114798682; Fri, 07 Aug 2026
 07:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com> <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch>
In-Reply-To: <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 08:59:47 -0600
X-Gm-Features: AUfX_mzMI4rGrSWJxil0rkCdGHQcdQSp5kYsnGxukt-NVGzxhhYkib-rvufG5PE
Message-ID: <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 7:16=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Aug 06, 2026 at 09:54:19PM -0600, James Hilliard wrote:
> > MDIO buses enumerate firmware children only when the bus is registered.=
 A
> > later devicetree overlay or status transition is ignored, unlike on I2C=
 and
> > SPI buses. Supporting live reconfiguration also means that population a=
nd
> > removal can race address scanning, PHY attachment and bus teardown.
>
> Please make the bootloader work around the issues, and drop this
> patchset.

This is just fixing OF_DYNAMIC for mdio now, it's no longer used
by the AC200/AC300 PHY patches anymore.

>
>         Andrew
