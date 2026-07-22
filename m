Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06947255F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707606; cv=pass; b=UuvuI8qUsDGjMIVoTbVTFg2R5AFM2Igs95kdY3PLtzaWePIr4gT/Uv17UkMH5DiF92w2sIdyDiqoexX0/iIiWA37u5wsPjUxlH+IbE5523eowXgg07JZ4yBGPZ+RMX0/OhFM6sHydE+Lx8xDxB+5DKIpLncA1U4nHWcLg4vuzfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707606; c=relaxed/simple;
	bh=IZwZ5Gq6ZOcCq0bDUFP5V7IbE72CYNa7XlLWoUu8rAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXj1lF2kK4p/Hjz5YR0Vdp0exNq3I1pghvejQw5PLx7bqXpWe1c4YzYTI/wrltvyWOVYV4P8TeLWdFwS476xNmNPOlMAh4LfOUPLa4xHXTApNGMJLw28rhGam6XVw3okqY8rm2wi+L2dDyGUGtrKCk3S7s0iuKKc9Uq1/vz4/0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=yctTqs/2; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="yctTqs/2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so18970039a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784707602; cv=none;
        d=google.com; s=arc-20260327;
        b=QhKZvc5oHWtEnH8IJMZqQSq/klTtq1tjSeyHRTrlqW8WZh4nQ4J9aZxyJyQoh6QF9a
         ex8HeRtdjTypRXdN32brb2ADCB0rv+jcZW93vVOnr54nw2FWoXKgbTI/LH1DAKGGiJn8
         Y8Io0APxi8SpnLodxPksyPsDvEsRddeb+SyiDMNdRqLca/Eaas2RlatSAsmRohwyDbXu
         KISPzqLZAcnPnC2BVQCeYxYzIbqLZZrnEinWlA6fELjyCiHGqHTpq6wlqE+ITsmKujQ7
         BiNTsJeEIO8xaj5IPtR9MGFhq1SVbmHcisCiay8AanhZXAyMfvHaj5T0kMzzESdMr0QS
         YR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=;
        fh=5drueaBOgmym4+yfhHAOz2BcVks/up5kDu07LfVaUa4=;
        b=M4aUx2YxsKRk3+Ev7d/rWQZ+DjD8iLUdllwMp30QrVSd0kYraJFUnltEZFbLL6jYH7
         bUcvyFRAHv3ZbdU8KNH4++HWro8f1qFcCrbNCrmR7opCDmg4VGbUhXDgoR/QT/asqu0s
         /CYv/JbfHkeFAr0yBPNevIY5QyPXJlYIuqx0lxNR6NJYZBUixJqaa/lXTFMM2/O6Y+MK
         tt+7aX4oUAlyZxND2w5rWlyYPlNNbK2cnVFhmxYR+0N5c0bslFyueEsyOI/+bg4bigot
         G17RlrfX2xnHfNTosNK3asPWRdpSSRc3+Vq8U5goBtmegSBhDPMbExHB6LSuAvugw3yI
         eTfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784707602; x=1785312402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=;
        b=yctTqs/2AnF3yJs3htxFAneIcz5zkA8xNDSXR3yBWRGJaJzs9bphOOo/E4WMziJ2gR
         HWFna3g6utA9CubbKFbd5DX2qoL2Ur7r+Zk7kd2ZfHzEGYdU4oolb75TAEBxnSc8gFVJ
         oTiweX6nonNAf+gnZkYpZT42xgQo4gdjaIrHTa0refjUXyJ0k/6RRWD6WhMefCUSI5z4
         Mbxyhp2aY5xDJ/WgHE94XV7PzCJDll+C8qVuZ/J4LZjJHsSl8aRpPkLoABkS3doRN5+z
         PFnm9Wc+ZQVRWnDRt6UBu9iVgvT0nLNTyGeJsta8+WT7+WGnrPhDOHDp+4viYNiXYMPJ
         R4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707602; x=1785312402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=;
        b=KagJw/qrNhTXM/S3nEtzSPLoy0ETaBQ1tSdQlpCwl7/dTh3v0mZRIq+K6v3C2fjS6e
         NQijhBSuNtE2oM2bIyhUW6JiWTfD7fEEStAVlrI3Im9KQ3hJT5w7IqRQzHVeptGbHBIY
         GpOReGXKf442Fihg01N0wc67m8uSN5QdTynVsKlCGMu6FBgTcjminHaJBeXuTGweXegA
         PlCHIHT1pa+LGmCPQQZ4TTb95QpjXmRIQgB7yB0JLftFdHFzmftag3aTHQjZcEcTSDZk
         4jk/OGF5Z6VUFRNpJGbr6hQaRWU0Qar2W/UfY5sEMy9hjK0pMtw6PxvbHhhjdfUlY4hA
         p+Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5zWQvub77S8+K5OFC8vz9CgqZDVAFFSRFXjq18ijYAPy3D2wru/4N6BhMSsxzKtT3Q9kmuuLMJVsR@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4gd3L4cShSbCxQKNfZ+FLJr/h+NB7+t8k/qBnuWPZpdEktX0
	8Krano5KQ6KJURAvVVhoODAcMAgeJUXpCiVvsTpqTjKG8AjIae2iOFrYw7qTTd+CDGyVV4xvab3
	EWPr/vFhcmRDwF/At8pX56Xbux10vZwsudAVfKf01pA==
X-Gm-Gg: AR+sD10yHf2g4q3wFffklyRJpUo79fit0b+CiZItV8O8h/rnrFViG8dNrVnPMO81A7B
	4a5aI5f2TvA8XAMOs7wrJa/disUj6IbsAkgTMge6tNv2fDgc3eH3F0E4+taEqFtvDTSrf43oV9x
	hG2+F1lsy5F8VGlXArwa1Ureti2yO0sCv3QeV0BMoiqdL0rsMzZpA6QEHYwiICPStmlrYgvIZBe
	h+FdJkVIciDTsAZJgg63ksivXB8E44kTbYWgFk91hfMnoRxNtjFeM2wpyzjXedvZFjbh3Os+SKx
	EmNDvrPG37Y7UyLQGC1lBZHB5OD9
X-Received: by 2002:a17:907:72cd:b0:c16:3187:997e with SMTP id
 a640c23a62f3a-c16b46ade61mr848716466b.7.1784707602465; Wed, 22 Jul 2026
 01:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-10-f0f4a4ede712@collabora.com>
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-10-f0f4a4ede712@collabora.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 12:06:33 +0400
X-Gm-Features: AUfX_mzBw-mJbEQ5WnpY1t4r4yErUbUBJRWK9UICtFzIcvZnEWvrXDi7mlfnRTM
Message-ID: <CAKTNdwE6OOPHYpMQXYfWPtdA26AiPJjSi6N_J-yGSU0mSL7HSg@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] drm/bridge: synopsys: dw-dp: Add audio support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Tue, Jul 21, 2026 at 9:52=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Implement audio support for the Synopsys DesignWare DisplayPort
> controller.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 230 ++++++++++++++++++++++++++=
+++++-
>  1 file changed, 229 insertions(+), 1 deletion(-)

Thanks for your work on this!

Quick question. It looks like the audio-related change along with the
DT binding update is independent of the hotplug/PM part, and shouldn't
really depend on the (large!) USBDP PHY changes. Would it be possible
to split it out as a separate mini-series, so that the whole thing
doesn't have to wait for the fate of the USBDP PHY series?

Best regards,
Alexey
