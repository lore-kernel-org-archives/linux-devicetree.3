Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE0183CC3;
	Tue,  2 Jun 2026 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429714; cv=none; b=W0IZjTrwVfYxZmDcUnahk4Y5sG3bHaAdv19z5uyJMUFe6iH3ahXP8brDYW9/hvJRLn90tosrH6m90hQxcf3AvxoFCLXw/UU9doADgaP61eDdtX8DGZ5xQTAllc2udz5pP4xZ38X0sc8JpnI1HWxit9YIsax2JW+1+U6wlElwhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429714; c=relaxed/simple;
	bh=Iqo7/zwN9aWfNkgTeE+VK59ALzPS5BsWnY41xGS6ZDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx9DOZrSylOr7MnhMF3OsBS4A9XXPPvrmWORAQP5fX/13yrVGfRLe2kNexio1tZ9ClrxBamMiU7ohdwJOxxIoyfNdaq9wfpDxdf/gY+fwg23AenDjolwCGNMPglzTVZbiI3MzDsgaImxs6H18S+KeIVnuEiKWMaAjnXHI8PZveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=KgBmveCK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="KgBmveCK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Iqo7/zwN9aWfNkgTeE+VK59ALzPS5BsWnY41xGS6ZDM=; b=KgBmveCKIwcHhTi8gtRwgA7q9S
	Zc8Nt2rKQN+vBy2nbYXqSpKmFnGbzR0UXG1Ap7LDihqEBh3BHkVvnaDHnZ6+SAkgU63ENV4H2GMFI
	+52051e5ehSkJ9rXadd94htTuoFJ7EKlBHyJ8uzri+GEHV/3gbix5I1n4D1EwCAtpPrOEqaH29D8u
	9GYGLM7Fwhxej5mA5PBaFl3myaN6mTMDpCIvl1vsK+b81zjG468M+nOSMDGfWmOcrneq1GGV0coL8
	prdQLTqjgl/MBjeuOoKnpPFZmdpGx5cSNxVrIeBzviyK3wGkKW+A8fRks6TJGV4D3k2UhJx4tCNAG
	v0x/p4yQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject:
 Re: [PATCH v2 01/12] drm/bridge: synopsys: dw-dp: Support unregistering the
 AUX channel
Date: Tue, 02 Jun 2026 21:48:11 +0200
Message-ID: <8220078.YiXZdWvhHV@phil>
In-Reply-To:
 <20260501-synopsys-dw-dp-improvements-v2-1-d7e7f6bac77f@collabora.com>
References:
 <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
 <20260501-synopsys-dw-dp-improvements-v2-1-d7e7f6bac77f@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 1. Mai 2026, 00:20:28 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Sebastian Reichel:
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>=20
> The DisplayPort AUX channel gets initialized and registered during
> dw_dp_bind(), but it is never unregistered, which may lead to resource
> leaks and/or use-after-free.
>=20
> Add the missing dw_dp_unbind() function to allow the users of the
> library to handle the required cleanup, i.e. unregister the AUX adapter.
>=20
> Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller suppor=
t library")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

picked the same one from Cristian's series


