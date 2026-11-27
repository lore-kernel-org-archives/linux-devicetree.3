Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798405;
	b=O9KVXz2HXpr/65jArlGkEsJ7A30q5mUHquNpveol1GxUslTHjQQiDufULDuuwIS36BVq
	 Cv0G9So0tCOYcW+kwKEGNUlyoB1UvbFc8eo6Ii7OYl7z/VrNddd1cbq0gF/FOPBXsu/x7
	 NI4PbrVX9JRR850u6X+oBykwoGK/WNNJuMmRFToioi/JTh1+X+BlR7BYiOkfnX2lti8dM
	 LBRWJVlCaXzRNYOW1TqHt/LUkPMynB54Kz1lf+xm6Nup+/YKkFyQK4W86XstwFlg4NYDf
	 D/DkaoQndgqe9LN2Un4a+LWnmzE4abwMb/wsnaorBkN+c1b03DR4RrVWnYycqnzDRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798405;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=7eCRdkskUVIKAV4F73pc7bqV887F0lnrxukv66qVTv4=;
	b=1d82HRQqj7SnkqZSrgoHIU3wi6i/zyvwERHTZesUoeXUjlSR+2P9XrSmkEDPNgnz5suw
	 xFJaRIc48A4kq3Z3AY73ZNLcUtxqL/uK5rPBWsb5rKjwEBDhP0Ma8XESW5D8UFNHrtUtr
	 sRaFeVYJ2KScWDI9aRdqzzO9J0a/rVhp60r1hzJKQMJFTV4bbxgUFB0/v4tgLEljYV6sn
	 FSFMwQU58JM86a8bGIZxxCZIw2+MttUuKe1PB/BIIeFI6ruwz0NVzE2Z7OVmai5wF82Y8
	 6omnh5vIX7meZqN9q1hhg9YsO6YIfIb/bqpSQ2qkTzb28VbNhC478T9vIKPoqhyD60w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uXdcXHCN;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC8606A31C;
	Fri, 27 Nov 2026 16:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uXdcXHCN
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127165320euoutp024c5fcdfeb78bcc21adbc48f75c3ca089~r9SFz3d-_1155811558euoutp024;
	Fri, 27 Nov 2026 16:53:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127165320euoutp024c5fcdfeb78bcc21adbc48f75c3ca089~r9SFz3d-_1155811558euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795798400;
	bh=7eCRdkskUVIKAV4F73pc7bqV887F0lnrxukv66qVTv4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uXdcXHCNDgUvKYjGzs4I6Y/LbSNrmKUYF/1I7VJEdq5FMAsBOJnK/421qd1tvZBCH
	 LhDrXlSqopL/8bPiDI3uNpIQZPrPJqWZ8PpjEnUggYOoykHsf67rgoaMckrVXdQB0r
	 q/UFtioXKgOj9nRw/8+BsmCSOkgieKfI3SQj27S8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261127165320eucas1p2d67ab9f6e81486993b7490f3746c914c~r9SFgBiTE0677506775eucas1p22;
	Fri, 27 Nov 2026 16:53:20 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261127165318eusmtip137bf72803c990386bb415f5deb6f1ddb~r9SDzrCr51687116871eusmtip1Y;
	Fri, 27 Nov 2026 16:53:18 +0000 (GMT)
Message-ID: <eb7ec558-7f5e-4fa6-b8de-db99c0b56467@samsung.com>
Date: Fri, 27 Nov 2026 17:53:18 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] drm: starfive: jh7110: Enable display
 subsystem
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>, Manivannan
	Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Byron Stanoszek <gandalf@winds.org>,
	Owen O'Hehir <oo.hehir@gmail.com>, Conor Dooley
	<conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261127165320eucas1p2d67ab9f6e81486993b7490f3746c914c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155359eucas1p2f7d4e5137f38415561ce77fd55023466
X-EPHeader: CA
X-CMS-RootMailID: 20261124155359eucas1p2f7d4e5137f38415561ce77fd55023466
References: <CGME20261124155359eucas1p2f7d4e5137f38415561ce77fd55023466@eucas1p2.samsung.com>
	<20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>



On 11/24/26 16:52, Michal Wilczynski wrote:
> This series enables the display subsystem on the StarFive JH7110.
> 
> Merging: everything except the DT patch goes through drm-misc:
> 
>   drm-misc                     1-16, 18
>     drivers/gpu/drm/bridge/, include/drm/bridge/, the display bindings,
>     and, as Conor asked, the StarFive SoC drivers and bindings (patches
>     4-6, 14 and 15, which carry his Acked-by), since the display
>     bindings and drivers belong together. Patches 1 and 2 are inno-hdmi
>     fixes with Fixes: tags; they apply to Rockchip as much as to StarFive
>     and are independent of the rest, so they can go on their own.
> 
>   Conor's tree                 17
>     The DT patch is included for review and testing only. As Conor
>     asked, I will resend it to him on its own once the rest is applied.
> 

Hi,
Patches 1 and 2 are now in a separate series with a third inno hdmi
fix, so they can be applied on their own merit [1].

v9 will drop them.

[1] - https://lore.kernel.org/all/20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com/

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
