Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893367;
	b=pHBtyKYeifXontgsCwP6wPlRcClVQI6bCQD9SqwwuF+0w4Qt+whJ0adnq3C8I6kB/3uI
	 pURwlokuL7y+zx4TLnDUweBnVU7XQuhx14BhFK9Ky6+eL4C7+yndJVEcu4spFp8lRWKpp
	 nJrI7Jdwylc4mly4YZtTonxYcjKRlqT3fWcx57o0kjZjqUAeWMo0ouWBhr1x4m36r0LpJ
	 X+Kt28CpscynnpU7EhobAXvX0zh6uKEMfQCpZks48KJWeDpqRWA9CiVw4UVHJcEdrWW+c
	 CYfNgkicZkv6VlFczoF9JcHkqw6S3cGACjEZvUXGq5zZULe3h4Mww81ag/IH3farpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CNjjrSNQGLbkLKnHiNf/ABSrRsMuuhd+YnklcW3AyI0=;
	b=i+J/nvmnTwgzwctPR7o4TK6YZEncbx/ARTFF8ZRat4cs3vVRB+sifSPnzqmPFFRVUGNI
	 Xg3EkQOyZhagyqPxN7Xmuk+P3Q9uQlxKHCftzJiU3fRDupZGvcOc4lshgKl+xR4kFWDIh
	 aaP3l7mPm6euP1bo1FU1lwUsg6t7j8x3Avl1yw+xCGAgm3lJjLUj1RxVDygQoUNhVZ/WN
	 LwyS3uM7qusQiiMJQtraAnDLdIt390ukYxpjO7FFgwoLIy52G0GAcxcWz3Wh+toaxg2MB
	 8wr/36zyiR3SHGBs0aYPo4NcO49qjYqo7Cd7sqP8VzYtWQgOK+mLmiVNwVz08FCPikw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YkCthRMR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F4606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6F4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YkCthRMR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21815745e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793893364; x=1794498164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNjjrSNQGLbkLKnHiNf/ABSrRsMuuhd+YnklcW3AyI0=;
        b=YkCthRMRKMiuRd2Z4NfKndCCeWHe86gUxzUIWiAlNnFY0Wo1vBpt+oxvKGMqtals3p
         Yy/lw3IAFgg0RMoIvldBnLb/vacj+9QQBvMIrXUeIALFxhKov7zmXc8ftWZb+7gMIUq+
         HmsbDWdkKFy7gKBozRej/ca2uHLwvaViwSpEWds9zNdgOcOyG1J/WHV/NpBWVyKweLcH
         9GLmvsc4oyATxsTFBzi0kucJreoY0z8Sr1/TTAg1uOwKj7RsWU1gOzXMaX90EgaDrBjl
         Vd/DWeywNz3MHUifdfjzXdS7rcxlm5SlX2be3DkLNdCFj0IAb+0y9d37iZl+ZjMatgvi
         r+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893364; x=1794498164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNjjrSNQGLbkLKnHiNf/ABSrRsMuuhd+YnklcW3AyI0=;
        b=Oz4AXb6Izhi1MtXDd4rEVVREoeXQFTJSRCDbfNjSS2HCmKVAEsmiMPBih0Y98/8V15
         ytRJzCSuueLe7swkPGfjVYbTWRkoUq7foQkXUt24hHC4b5qHpqNrE9FwXy7tYrII2sZ4
         79JqSqlyuFyZXyTvLmVIGNmWGHKO4yG5oLH+28AhwhBtcysyXet+PnFtM1eS70FtOPfb
         T4b0tqNeV1xlfQ6i7O8WqZM9afY6iGHefFqCPDbzx+a/6WrZuaC2sN43EsaoU9YCRBgB
         jpHz6CJFHS8lfVBO0ZNWnykHlSRzL6BMpfVmskkbsswT7aDCoUwipAbOp7D2jJW+sZuw
         lWyA==
X-Forwarded-Encrypted: i=1; AKwUvByJwnh3k5mu6xEB8C1KTVHfyvk8woCZyzlzzj4/mgBrach1MuNnT06pRdwxmFTNiLgw5nc3D5vcr6Qd@vger.kernel.org
X-Gm-Message-State: APuU4Z9F767NmnPz03+bgUcLdZUipn4XzTporGUi/KrnuAlHdtGvwrr8
	BBYqr6WRR+rE50MKbsscaT+1FMtIO0YZZ2Bniq4mPfllfqrki8utUPjVPMRx/fndz6E=
X-Gm-Gg: AYBFou1NLzTGk3Jfd4ibhXz2vLsQfFZtc9AiiHFJZtUQ0JYXvBVSqi+cEFpTUS1wZed
	+tJFhSEIYX7O+0vc0gKz8hzgVy/nDaCEn06WH8he6F59tee7gwU4Ctv31ggJxjFnDhukphN9zgg
	kbAvv4D6SnF0PeWaqm6MkvTVKMhIK5wvxwI8aJBTIxDLBOop0APLzJxVxBFNJx72C6Pm6VrYtkf
	bXGOo7LZqh9BvuCASfD7SC3KHTTj54EREOA2UWpmAwkHkeH87/VE9EzCua3gEdHLvaxET8UVh8k
	HWl5fPu2JlXvWW146xmpps8YSYDdmDfwgJw2SjlHR4yBts/im0gyNFgPMiCOwL5aztu1Wy347zd
	VIGvWDsh0lcVqaSz4Ze1OQp7QKUnYzOUODmfd06nGB8Zeq+09l6zGx4lWt7mXNA83GlGbhPssXR
	qE61IiK6G1OqA5TOR4mQg4FWAyQxQDk1Qz9TkJ/X2BldMcrvQfkejUdlndl+h9SdDS3ZZ9jaWvh
	+J9ZJsryD5VU5ykp+ll5Ks7v8hHPaAjOdRA07pB+z7S2rVaTACrqU+764saIdsO/ZqpFiO8yEO/
	250192cZ3L+TEMDOq3ps4s75S+SC8LwCMSKtIyor+wjsBVL4VmwnC3rQfosV6Ya5OL24b37fHgv
	99DdVZOBjb5BctQcCM/9bJDY0dHdTGPZC7jkG
X-Received: by 2002:a05:600c:190b:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4b6267adeebmr31331575e9.28.1793893364291;
        Thu, 05 Nov 2026 07:42:44 -0800 (PST)
Received: from localhost (p200300f65f19a9044f222dad4d982d50.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4f22:2dad:4d98:2d50])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fec8d87b5sm10229911f8f.11.2026.11.05.07.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:42:43 -0800 (PST)
Date: Thu, 5 Nov 2026 16:42:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Rodolfo Giometti <giometti@enneenne.com>, 
	Marcelo Schmitt <marcelo.schmitt@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Tobias Sperling <tobias.sperling@softing.com>, 
	Eason Yang <j2anfernee@gmail.com>, Marilene Andrade Garcia <marilene.agarcia@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, duje@dujemihanovic.xyz, herve.codina@bootlin.com, 
	thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
Message-ID: <auyjgDddFs3OvnC3@monoceros>
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="yopseine6onc6aoe"
Content-Disposition: inline
In-Reply-To: <20261030164705.297354-3-maxime.chevallier@bootlin.com>


--yopseine6onc6aoe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 05:47:04PM +0100, Maxime Chevallier wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
provides i2c_device_id and of_device_id. <linux/mod_devicetable.h>
provides many more *_device_id and thus introduces a big list of
unnecessary dependencies.

I recommend to just drop <linux/mod_devicetable.h> here. If you insist
on full iwyu, there is <linux/device-id/i2c.h> and
<linux/device-id/of.h>.

Best regards
Uwe

--yopseine6onc6aoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrso+8ACgkQj4D7WH0S
/k44lAgAo9dVK371hYEKF67NIG+UneFq4MYJzAcDXxvTtOhkbG3bb3pvqR6IBDfT
cuJDoIH2cpFukhzp7daIjeRVZpJ9S2/yuGTPjumt1eFVYZcFvNB8FU87IQ+3R47Z
utePF5ukTS1zmkZe+1b0fRCH64mAjTRZYEsWsVqzRjg1lmt8vrD3NInKYzW7rJSw
j9qrARlJ8XOODrkeq85ZYnLncp9tj1ilDLcOyU4ffM+IWCHDgLt9BJSZx7F9G6j0
OqBCEhqyudx26Gg0Tdb/HE7uBUDFIeqcV0PljqUHkmfaLTBSRPNsVlQsoO65SvfH
9Vyt+P+ogAtsiSJAyxM1OhsbrNR2BA==
=ujJA
-----END PGP SIGNATURE-----

--yopseine6onc6aoe--
