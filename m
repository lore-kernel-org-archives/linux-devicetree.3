Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D57414401
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161962; cv=none; b=opolaspfqoIq8eMuCCpdWh4YPNnStHqlXO6cfr6BsHDfuDsQMgB3oRRGM3jdQ4r4CQCFpecGBgzj2kSJz/OuEJ9W56QTNaFRvdzmVt+vurFZ5zxhAB68GfQvcRuX94dHWU5VLUN3HvWgSuTnCsAam624zVi1OgvKvJ9N1bjMbr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161962; c=relaxed/simple;
	bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMeQVEmONtY/AQfc8+5F86ggjTuldvG2AavO64GfwM4A4cv7QaGYb3dDfqEjHeDNNh4IPIJw6coo1hp0vb8I6+c8xle6XwrDDuwEyXEL0IrDqV2LBoR6wDu3pAzNYU1wIn5OPyNm9iFLQdLig9tI5AJQv2JjTCkhzm9X4oONnwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c435mPst; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c435mPst"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso4523585ad.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161961; x=1790766761; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=c435mPstr8MA6KIc24xdSbmGxqHycKTcHccN30qjA1anB9f8Di7ZETnoWfHfz8mSHb
         dIZzzrD8UiN4Z2f/O8CyuNnEBneP4XkJLRPX0/6Rnf6e/19DlNbhNXNmoqLQzhfXJF1C
         FSiWOOLEDYmZYQJ9et+Wp3nsQmsPTfbwl1ne4ggdefW8z7jsi+kO2iXlXSLbuvJnQQnC
         2uSDgi/4/qgUpXSw2Xnez839PVLYuUiY+NP/9aqgUoidoFDe9NoC5SnRYHUOIJYa/oFF
         bc83epYx5hmbARIZMqHIyjrXq73iAdfGvOh7XLG68/2Z0cWUJ2Waz6OFc8ohNj6WoBaQ
         sGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161961; x=1790766761;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=iIDGNQZBYZwOE/f76G1L/IuVBgMsdXN2Ab+v+FJ69mmNnUjxwTzghkPkVoxUMYO54y
         rvlVwWzF9xSdHKkk5aZokNj1lVpY7JJyiKAWiAXjgwQM/YeLViQpASQgkUuG4oncxCq7
         5btMuxfnqDWaKPNR+IyKsC2nVACGbiDa1FilljNDCh+FtLwgluqylqzELzzvzOndUYpW
         1sE1Lsd2g2UbKXN+GJRRIWzH0Q3wrE2eqF3VgAEtJBM7lMJOiEZTiiDjnqHqWSyfCLzK
         i62lgq0Q8n8nFoA24b/eDlS7jY01omq7ii0oS6zahvEGpYVoNsRBeJb9yx3ngmr/Harx
         5S2g==
X-Forwarded-Encrypted: i=1; AKwUvBzKrfK4dJoMzf51XGnQEZ7rfY4KsSy+TbUv1T0PP4cvWzi5hrGf4rz+nH2P6qj1O31Lx9758aOJeCer@vger.kernel.org
X-Gm-Message-State: AFuF++nMDBXLZ84GLwpMd6IfqcRnRE3xNKrwiBSD8eero9YaZsd2tZvp
	RPyIJIAIfW2wzss7ltG1XWH0zZvRKKTX61wRb6k8y3/8JewsbzzAEzR0
X-Gm-Gg: AYBFou1fSrDh265D79ql2+0FoZXtXdrhHRljhFV/i0k7h/e87ZScoY5dl5Q2tIhg84Y
	5Soqa9jWjRii5Uqhk0e9wAg202LJwdv2SmpxDvtIcvUiAoQdBASHdkkIOX0UvrvVzLWY/iYgnvt
	UwiectV1mvKAXyf3CIQ2u5UKI9yFIh5EVYl04o+l+h9ZmD3RasVmjflR376iyjeHjy0vwXn+GZ9
	V3GKN2bLszGqyGrEET44rnWI2GXc24wKuWnhefBaL1uxAN7ZWM3oK2DfSoDbZYLG+NwjdPiCl88
	2WGxdf1/oxiaQ2Nz7GY7ptkvdjsWrb8O5BKkc6ExHQluAVrh4v7ZYS04ppocZnh49zXBb0GrKcy
	XC1GHZQADmxNIwGvjOrco8sfeAfkyeui2tfwb4Zw7vx5P3ZPnzoYP+pi8mPSNn/8dBLUXsuzhGU
	R+3h6zQxfI+fdJQ25uHPbZQv9RLkCoZkvEozvb87wngrbWnMtpKkcEIguP1VjMiL2u7HYRuf5OV
	h/H08gAgor1JeHSOF2PtoMCW0+bRY0pt/G7pIeMYo0uXWRHj1DriRAYGXH+NPAYbyyW8e6lls0i
	1eIidHsmTbxe6RejB372jawSF5JAXwu9bodTk11Hae5oEwiK228=
X-Received: by 2002:a17:902:d54a:b0:2dd:c053:d739 with SMTP id d9443c01a7336-2df69dacfb9mr19455635ad.32.1790161960734;
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f5886sm8814555ad.72.2026.09.23.04.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Date: Wed, 23 Sep 2026 21:12:29 +1000
Message-ID: <EVVfptRVTru_6AKB_uY-lw@gmail.com>
In-Reply-To: <arFa+frv9QcL4b36@opensource.cirrus.com>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <arFM5QGrJx1aYhGK@sirena.co.uk> <arFa+frv9QcL4b36@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 22 September 2026 2:27:37=E2=80=AFam Australian Eastern Standar=
d Time=20
Charles Keepax wrote:
> Are you using the wildcard mostly to skip the component prefix
> stuff? I wonder if adding an option to match without that might
> be more explicit.

We use it in two places. The first is as part of the speaker protection
system, to ensure that all the relevant kctrls have been locked by
the same owner (us). This one just matches without the component prefix.
We also use this facility to eliminate duplication across left and right
channels, matching partially on the component prefix but without "Left"
or "Right" in the string. The second use case is rather superfluous so
I am happy to get rid of that. I think at that point it would make more
sense to just construct the full kctrl name in the driver and pass that
in to the existing API in the one place this actually remains necessary.

>=20
> Thanks,
> Charles

James



