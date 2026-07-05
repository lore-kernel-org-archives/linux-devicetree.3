Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4717E370D41
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 22:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783290036; cv=none; b=Zx6oE5n3XqaXvOy/ZVPNiI9YKtSdatl2xAmHT8CHJpZSFfbqQ0m0GkuP3hAdmwCsQJ+WwLM3lqsS5tTv7YHQQAvvEC3II/XPvbjQiiNE0l4AiSFNjpimmeLXSfXDmQw+waCq9v1NIM5TRa+yF7GVCh1KvIVkcekZVWBEywMmByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783290036; c=relaxed/simple;
	bh=YTIoM9s1EZH0t7j8ClTFL/oz2+dcipFDszTgT2onH9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=MwH9QfZ7/Dk3ITrlGjuxZIZbbe17cqLS72b/vUR/4nLpCuoPksaHY/0bFEs2iDuE9Tat+NLI7kc9cmD8wnBBQn/7I/5/42GJj2gPhtQJScnnPq7p3saokw7GxzF77xDNFtuniNIP9K14sAyu2DPpT040k+tGFr7o7/eL6hTtK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=N1Wvfg7D; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="N1Wvfg7D"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783290019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzP4IrwF64OOqXOnzQR9aMpiMXv9vAON16c9GzABhuU=;
	b=N1Wvfg7Dq10Z/RxZQ+tgS9JhIQqoRQ/28Z90K5duhdeFQNuVR5zMBM40gudTQDrMhxZ7By
	99luTqRHljddy0yN7kDEVVODul5MmXZ0Uk/umkixPZuR/JQP0GcTx6grrwAFFJ8H+92Qud
	NHeYbi0IRDMV1X1WiE+MtmFnDrwzcO3pz7B6+aGvZ5yX2hPsrYHk0zISLnGdLAzwZ8p2Gp
	U/3NBKqeu5uQnzizL+j2E/L1JKsk2V7tqtyepoHi0YC2+tsD9L9UxlXW56LCoC5ojWgnvh
	mJoSMHesEs9hbaQRUHuS6v6hSc8LxMfaXpQYzyChEttuAJ7VGnujAOLH2OSIyA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 00:20:13 +0200
Message-Id: <DJQZJUFLM425.2J87266L7CGT8@cknow-tech.com>
Subject: Re: [PATCH 2/9] drm/rockchip: vop2: Reset AXI and DCLK to improve
 robustness
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Diederik de
 Haas" <diederik@cknow-tech.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>
Cc: <kernel@collabora.com>, "Andy Yan" <andyshrk@163.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-2-a665cfd06d7d@collabora.com>
 <DJQO8Q4J2LDP.1G8I4FVF6J7TK@cknow-tech.com>
 <c8242f5c-ec74-489e-b378-f225ec3a0135@collabora.com>
In-Reply-To: <c8242f5c-ec74-489e-b378-f225ec3a0135@collabora.com>
X-Migadu-Flow: FLOW_OUT

Hi Cristian,

On Sun Jul 5, 2026 at 10:46 PM CEST, Cristian Ciocaltea wrote:
> On 7/5/26 4:28 PM, Diederik de Haas wrote:
>> On Wed Jun 17, 2026 at 8:52 PM CEST, Cristian Ciocaltea wrote:
>>> Assert the AXI reset in the CRTC disable path, and the VP DCLK reset in
>>> the enable path.
>>>
>>> These resets are intended to leave the hardware in a clean state for th=
e
>>> next use, helping recover from exceptions such as IOMMU page faults, as
>>> well as to prevent random display output glitches, such as a blank
>>> image, observed when switching modes that also change the color format,
>>> e.g. from RGB to YUV420 and vice versa.
>>>
>>> For now this seems to affect only the RK3588, hence the resets are
>>> optional and will be provided in the device tree for this SoC only.
>>=20
>> Why do you think it only effect RK3588?=20
>
> My findings are exclusively in the context of validating YUV support for =
DW HDMI
> QP, hence targeting RK3588 and RK3576.  Since RK3576 didn't exhibit any
> anomalies, I concluded the resets are needed just for RK3588.

Ok, that's indeed a different technology stack.

>> I reported about my RK3568 test here:
>> https://lore.kernel.org/linux-rockchip/DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-=
tech.com/
>> "I then went on to try LibreELEC's builds. The artifacts I (sometimes)
>> saw, were gone :-D OTOH, I did get several major issues 'in return',
>> like rk_iommu Page fault resulting in a black screen and the only way to
>> 'recover' from it, was a reboot."
>>=20
>> And I reported some more test results here:
>> https://forum.libreelec.tv/thread/29953-le13-testing-for-rk3288-rk3328-r=
k3399-rk3566-rk3568-rk3576-rk3588/?postID=3D204691#post204691
>>=20
>> That seems to me a (strong) indication it also affects RK3566/RK3568?
>
> If coincidentally this helps improve the reliability of some of the older=
 SoCs
> as well, the resets can easily be added to the corresponding DTs and subm=
itted
> as a follow-up series.

Agreed. Thanks :)

Cheers,
  Diederik
