Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB9A3019D8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357841; cv=none; b=eVp+0BFLwUW+4EK04dChLq4JvDBnR2mchOdHDqVkJs/PV8uRjy/JQw0cH9XSzgi5GgrwU/VszkJqF8RkOihyUL2fOMkfGXTO0J+e/2hKkAdZfF1eTPYmOg0qdEIavlLlm/ppwsi0aZajLBI/PX2GU57pmTkDtU0OzD35XDZOTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357841; c=relaxed/simple;
	bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ69Fi/6+5YSsjDgy8WRUAMJgyo8yv+bIm335GKxGrrgp9vAhxhkkin8i+okmx1dBJPJ1aXynkC50o3SNANQozZY4S5GGUnbaekwJvNOSDcwV5W5nwHmTCI24+wNl3YllwHdcufL1X05FFAoiVvh5vFkUQlQedFl0UukPIAF1SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=juxdu8pD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="juxdu8pD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so24959315e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783357837; x=1783962637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=juxdu8pD2AEmX4JXz9DmYETSYkWMa2bZGpCVvCKoJPK0ZGAv0548w+WplHh7m/xasa
         bfV0SwHv2B92WnWJ32KyM0OP6NVYfND0ksKrqHMgBoTFOxk6T8Lhx+PfiKf+BECSLJJ1
         HmS7AD61p5N2ox3/Hqc+UcXvX+b68NyJ82/1yTiXBJ9usnVgyMKp/syTnSUNBrjHhhGi
         yTSbB5hbbiDbqaDKuTdy2/x0XuhB9x44yOOxXaKGSdrie/3I3Ul2LgiZ2OzRabueWhFx
         PM+BPeNQ6Q7rNG7Bsw0eeaDRJnYNc8+RAbA9roZVZeGaPooeVsgxepIL5ziMkYJA8/J0
         qV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357837; x=1783962637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=K2bl3kD3hmsfbLtH+xhj/alNdoeqs4O9hac44GC1J75Sj3EcDZfAgweClevPjl7y9I
         91zhwsAKoILqZ7rT2UiXp6T0QZY5vz8KYw3OpTrolSjMZgKKCpMWYwypfNy5XV9Rmgz2
         UytTlsZNaVkI8gpbPkr7dElZR2frsaiqr9oPC1SS1ATBr9F8rtvoPKlzLjcjv+xt1Mz1
         BbdVZcKTiNr9RwTmTJRRjtixavlStTh/FRftla9RGSM5NRiLk7I4NnxXJaMsqF+Ko2VY
         lbUWjKV9HHL16DpBkHG01A+WpjX4W8WTZE7aDz0IS+QnN1cr6I1t5beZBO5yPDeBeFZZ
         xGNA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1GgLgNZTFix+DriVWA9M2Sv4+TP8sLz558P66wRhUqyIjVkWFixvnsmSsj2WRfAPws/jJHNjT/eID@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8eAxaMrphfSf4gp+yhlEOsIi6HMuzQn08T7u1lBHWTgyfSI3
	JrzuFj8wtqzjfjS6Y1kd7FDv/DaXnB/7PSsRE0lics+Rah/U9Si+0fFX/kG8sBNLJWg=
X-Gm-Gg: AfdE7cnig1MyqWjOhUho2UzT+Q1WLdyD8pV30tt072TUlCKaAFP7hOOrDgvnKeNmRmY
	Le1ueyjIXY3nXU66z7O8QXF4uK+PTwgRUPS25n1Ulv58hgQFerZohf+jmTJPk+8debxcFj6C8f4
	8HbJe/YO0vNPCm3UoT3k0k8Mqv800yLiuuj+4xEe2OgnNMYFzM5Kb9+v+cZlNCgf3MOVQyF8Npt
	8NpGLb9hiUZmKXhmpGtAgDzD2PlLWODwuw0q3wVnXpEbUtlpgFAsx1Y0Jf0fQPQaxwY+vitaIHO
	i3UyMZMREZpuwE8XHxkQoZNuGj0E+9/o+UoEBz1HKnwlQttLQf8Z9/VMsFqbzDg3XxzNX8kkJ6O
	tpjsxX/EsCEaMSTKfAN16k9W/baeWd6OlvYGW3pIMLQulrhmw+u+fhOSLqZrVhbUNoSvLcDepjM
	yqQWMjOshYwjJ5nWm/9iaEuyDSRDVXE1NmGPH9H0Ssk8ydNqBhTR5aNCmTbLo3tGdKyQjlxiS8A
	9w=
X-Received: by 2002:a05:600c:548d:b0:493:c478:8744 with SMTP id 5b1f17b1804b1-493df0644a7mr17176475e9.18.1783357837297;
        Mon, 06 Jul 2026 10:10:37 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493df703391sm6037585e9.0.2026.07.06.10.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:10:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:10:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Message-ID: <akvhUwQ_FFSJYICA@monoceros>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hya7dxqb4rmwvjro"
Content-Disposition: inline
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>


--hya7dxqb4rmwvjro
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 03:20:17PM +0200, Bartosz Golaszewski wrote:
> +#include <linux/mod_devicetable.h>

Please only include those <linux/device-id/*.h> that you actually need.
I'm actively working on deprecating <linux/mod_devicetable.h>.

Thanks
Uwe

--hya7dxqb4rmwvjro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4YcACgkQj4D7WH0S
/k57CAf/UgOJNneAcYY3lQuZ+RhwSluKHlS9kU+LP6KfWURj/Pj78uMbougI/MWm
NOPHFAV0gOZPyox4TK4XImoVNCHq9wWJVtMM0UMCguoEBhrqgoeV/Esik9YncvIc
INlZjmDSd0r0OJd9oMZmIM7O1eIZxLQugbLTCT2WK9eW0OCT+20CmmtgHzGHZ7eU
krIfDqpfq0wJOa70OZmh/lowgwbJIjabcxyyCGiY0Scvf4F31ClocQmot5e6gabR
OcwHOulxqkUKBtOVZtPrt5lRsawYjY+ZslpAnnZvlrbrqmj2M9IuVyQGMqEW6kkC
CFP1TQBoEVajey5oRSMzdQ2ZlvM/wA==
=Sskc
-----END PGP SIGNATURE-----

--hya7dxqb4rmwvjro--
