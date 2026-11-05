Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887137;
	b=zEK/rdPfEuQmH+yWoALfuE6OtdAW+KkHG0O3HMld3uqqP0AzQhc1qdiICwLYXcO4g3lE
	 zOmjjgXx/lHIZRCXueSpb65CzKI0iZ+J70c+WdsCE9+g3yi8onDaPh3u7jvXZhpzQTMNk
	 9cuQmJ2IMe/y0cloWJxCKgVqbNNUCGTrPZOxv7cvyGOkn/CBWQAmwx/0U0k0+FsHqz5+0
	 JHR7F/9D9clNrEwARVBqyUZRTrs562y1bN/it3SzSFgM3LvEMUWfvtsA8R2DRkmPaP7qq
	 VaUn2dh+fVTHgOBPumijcMxkFUdiWk4X7fP0az0hZDUt2+6HDe3eUzu8atrNyazMzjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
	b=k0g3TgnyEhiRlGm1/RNWvyxRVA1+MhveKaR6hLLOE9ibmjZo905j42/uQADY8eB96vg1
	 AvCEmB8tTbx7Jy/Ki2mmTeOzk3DzUgmF1JLHDGYO7uW1DR/3WXaQR9ZWSQCnxdAcc3Z4O
	 L7T+k9rgSwAwW7DNWDVoksAIayOuwuF6g07sQKSRac/FN/wiU04pKlYNJFBR8AIlePzQO
	 XQ6Yc2N+t2dNKCkwVI//IQ1irsTLqecgD7/cOiFng1Cu/jmRaHwLm7gkoPOg9xjMAAdnj
	 gHkDcQY1KcUSHVils5f2RI1wVVrYcxVY/CVysYu1uX+0dQjbV4j531ZZQUL/luDF46Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0ibYapT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26054606A32F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26054606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0ibYapT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso14381205e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887129; x=1794491929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=E0ibYapTp+snHAaLfFV5C5kwF9bCnW48/3xjOj38X1Awn0rWjO2IHMNwe2sdoJi2Xi
         NhkIaFCvlExF3CunDrqNLZ1BIIvnetZfKieCryQ2Gy3j1wqLADFAsc8CshWNWk7uQ1dY
         XyvQB++g1KA08c/s3njsnCmi0inrSKlArTCe0sVwQzLJ5fNVX8WT6EtdW/qCLhpgoyNy
         jgSQen9y+B0oSNAZJ1B5Zu9ziznXalyeQ4KZi/a0IJmncqqhwgt+mlLGB+bGU7OtYhsa
         Ew4E1J9yz69l37hI/lMxYXUih5vde6EJMuEZAPgxqAMGaH4LX+L1pnUe0fTkPNPLDxuh
         CU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887129; x=1794491929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=FNPWlTkPCCmYZCk/f01Ou0ZtqCnedUMd97IpkcsAL8jNX0tUtHvW9a5zCBFg87JER7
         WW0rvM/dWmZqOuxWRJRcMhxNAihT2lXPJ4XIiiVeEs/be7NNK8sO5DOcoxhVYIEzV+wn
         KxACKLUkwn0DBtg3JxtHN3u697AXEnTF5Y3nqnDcukJM3emSBB287mChdzpP6xFqqoz3
         JThAb8ezWGDQLg91pPfLP9KYqlLk1823dXAMCpJIuk8c/T0HOTAVlphwfge99VPFc8Nu
         C70SEKbmQ8IZz2ZtIhFPpHmlM68SjHu0OVmuzhCpcmqogY79U1QVCcKUiIhEy4GokcyQ
         f+mA==
X-Forwarded-Encrypted: i=1; AKwUvBy6bFgdAixHoaIcEKKLsjJf6v3O+9mIn6IEcFE4F0A8/Zy0LmMrahAOcRnIY4ChpDFDXfUjpjlIDEAo@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ywn61FBzERKj5DINQ6Cc3GPImlqN5h4whAW/w+Y/6VD9Ok7/4
	YeaAcpZpoykdy4ItA4oin6u+Mfm2J425TXgLpu87qzyYGc46/WuysmAC5DyfzFhn4bc=
X-Gm-Gg: AYBFou0BblKtweeOKW/BHxW3t7ZW19TfexjsZi4ihFLLz9vau1ydXf/V9vh2U466mv8
	9FCcjIdEo5tul9sjnFCorPR90D2ZuZhGZYBkGzWXazgVsnQjc62dCX6JqthxtgmsaG0mPcaynky
	MCSH3IzP22IRul6kmI6dAwmCrDj54v0ET6M9S9v3+Rl+ATPx4JLEIgnrhBHWZonofbHjvYnMudC
	lyWp3MN1VsQiOUNptGhgCkm0Mz7s5g6HGyWDkbdlPffVlqEcSLxL7Hh4msX9dPzXr3QeKrsmvuZ
	2IEV/qsj3LV2GSKU2WP5Q+YrATw9/SywhaBRrELaCW8Kw+uXZzleHjma66QAj/jcuxxgF1pHzBV
	sl49wZzz9ElCKj7vfPgb0YXD+n4yNYYEIpS3RWI0cU82Qgi9JoWZ9TK0kkZkvIbWehoeK+jOoDW
	joj+rd2NnPJCMFG60Sf+7++cVkee2h6r+H1xOmDdsM4fqux9NktfjRpclw8vY3MeumRGHEbnuS1
	6mOCnszxBJYDdRYkQScWM/48BIkS2w80Rvvgt7D33sY9kqQKD58gUECi0BpVzProQAwCBMUlUl5
	fMTW6NdaBYsFYqLLD6QD1VsRetBm
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr375702725e9.22.1793887129505;
        Thu, 05 Nov 2026 05:58:49 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56ba6bc36sm75097435e9.0.2026.11.05.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:58:48 -0800 (PST)
Date: Thu, 5 Nov 2026 14:58:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
Message-ID: <auyLOc4djmm29Bnz@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-3-tcmichals@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jfoalgweekh6k4p"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-3-tcmichals@gmail.com>


--6jfoalgweekh6k4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 12:57:30PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as this pulls in a lot of
unneeded build dependencies.

<linux/platform_device.h> already provides of_device_id which is all you
seem to use here. If you want full iwyu include <linux/device-id/of.h>
instead.

Best regards
Uwe

--6jfoalgweekh6k4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi5EACgkQj4D7WH0S
/k5vhQf+JI5oqB8wirr4Mfq53+EuIcbqVBMYKSJ4VvYsL5NgmUbk5OmelFsyFXLh
1cTpKfp/pSXjaY74bSTdw8Wzj26UAD6h5WcL7M+Y0R76ERavh1U/j83g7GfDBxJr
eHota1nXeLkRvpDqW7tWDBWn66eu0IeVsO8nlokpZTVhmLk/uFlIIITHp+IbJSUS
oBmB5o0SK31zlNe1wrqwI8jCXjAUPyVcVouZEhNQ5mtIja4FE782+wlnw7agZe69
vl3MG/TIihE7J63RC8U2iKs7BsfN9oB5xF5H8YMQYZ8/3uAj4eNkgFSjpbU8xXtp
IDWe63lnv5ShurGsD35Z20wJbKGEKA==
=hD40
-----END PGP SIGNATURE-----

--6jfoalgweekh6k4p--
