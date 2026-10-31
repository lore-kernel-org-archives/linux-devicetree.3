Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446098;
	b=O+35Xn6pTm1NmpA022vJ8JufYx3ExWt5EYmPkzgQCIM1tbC7ESb6FB8uL7hKxe503qiM
	 MsR2v4uYyGoGFo8/ZNKF7IZ8x2A/dzuZMX4ogK5Wx9hCe/ORIQGiaDL4bcIo5nr34LFNk
	 57QCE0dtavx13ntf43qEmRxPm/NgCayPwu/5xA+wROFmJuq9aEf4FZE5tpN4Y7DxfmEWg
	 esKkMYHCwlAtOYq+kK+zKQzfZ/PuNgV4WLqayr28QIinOcla7OXsW9aprzE1sGeoV/vZW
	 wHgVtcZEqAc98lPeE1tDts6K3PzSSHf6M51aTaQd8IOMKd9wsVXrOfJcRV/bo43c96A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446098;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GxAvazQCW1jR58O9h8smfRyymo8eYE8t5LmlxNfonsI=;
	b=Y0lLLVz8o2rcxp3loxjk2usO54EF8XwKYL0DBp/BbUoP7BYLPoiKp0T25a8WJl3HsB58
	 k883OVEtwHD0621uL24QivEunWvc2aqHsSe++YIk7qwPoiMHejIyWFZJWIYVcBcFQ1MVY
	 2RT7tifR9Gau+JoBeZPmaYVwfPSOAWnWxicevyNA+vQEQdtr+TeEtF0RSG/Y0Bhs58Vx5
	 HgXG3XC4YAbiWxwI+c8T+XaRw1ecG2hZEJDuEdWgEwTOYN5Dot8SDmxp+Fw75tilrMhWE
	 5/htqSrPIwKZCGywPTXm0Yu7PEFUwHghxENX1wzs6YwjfOOOSxZ+BXhCv6d+pHVxXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DXX1hyMv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BB606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DXX1hyMv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126EA1F000C1;
	Sat, 31 Oct 2026 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793446098;
	bh=GxAvazQCW1jR58O9h8smfRyymo8eYE8t5LmlxNfonsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DXX1hyMvoVDv8ZEr7XEMS4zPuSuK8Mc/NGnxvkS5Nx9+JqJmc936Kb5Gh9g1O/EZ5
	 l7Ov+O/wss5gVjiU+A0las37cImf7nWlMpIQ3fdJUFDnaTC92BLrCJMw78MtOpNEsx
	 YHbmx9AeOYfxy7ZPiT1hoSCZLZtke63Ns97bwATlvT5K7LHCkaqZdZA+RbEExRFVc9
	 sb3f04dDKczfr436Y5XskNrQQgYjTbmyVRFkjqdFz+2jtfXjALp81kAex91pycul8I
	 /GBdsYnF0RbcwcMtQJyB5j6OdR63wP5irlWBKzHG0Lr4J/v4V4ZSsBiYv3WHXyqXOw
	 ujTPleeyqFlYw==
Message-ID: <sashiko-outbox-191921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware
 version 2.2.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 11:28:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: qcom: camss: tpg_reset() checks hw_version before initial=
ization
--

commit ed70791a72b90a115dbcf4eead6d852fc6c9f986
Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

media: qcom: camss: tpg: Support TPG hardware version 2.2.0

This commit lowers the TPG hardware version threshold from 2.4.0 to 2.2.0 in
tpg_stream_on() and tpg_reset() to support Qualcomm SM8650 CAMSS TPG blocks,
which start test pattern generation via TPG_CTRL_CMD rather than a test ena=
ble
bit in TPG_CTRL.

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index cabbb2638cf38..a83f9a80c2b6b 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c

[ ... ]

> @@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
> =20
>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +	if (tpg->hw_version < TPG_HW_VER_2_2_0)
>  		writel(0, tpg->base + TPG_CTRL);

[Severity: Medium]
When a TPG subdevice is powered on for the first time via tpg_set_power(), =
is
tpg->hw_version initialized before tpg_reset() checks it?

In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() invokes t=
he
reset callback before reading and storing the hardware version via the
hw_version callback (tpg_hw_version()):

drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
	...
	if (on) {
		...
		tpg->res->hw_ops->reset(tpg);

		tpg->res->hw_ops->hw_version(tpg);
	}
	...
}

Because camss->tpg is zero-allocated in camss_probe(), tpg->hw_version is
still 0 on the initial tpg_set_power() -> tpg_reset() call. As a result,
tpg->hw_version < TPG_HW_VER_2_2_0 evaluates to true on the first power-on
even on TPG v2.2.0 and newer hardware, causing tpg_reset() to execute
writel(0, tpg->base + TPG_CTRL).

Should tpg_set_power() call hw_ops->hw_version(tpg) before hw_ops->reset(tp=
g)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031112203.5453=
19-1-vladimir.zapolskiy@linaro.org?part=3D4
