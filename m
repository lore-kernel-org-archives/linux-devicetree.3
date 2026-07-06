Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0E1CAA78
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358188; cv=none; b=u0qNKSPVC8RCIBm4u2VnuwrFZFt48lu0M+o962iX+XNYrzFjPFGJLRX/n6gXpoJm2bPDPFBbIsgVrmYj0MpxyoUiGHcVk/RN5P6BH3N5SNTsCRoepW5mozR6rpPihjduB8Ac5F1+rdp9crJoAMmqVgf13Vhw8Oun087aPuSd0mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358188; c=relaxed/simple;
	bh=JN5vDAyeeb4SlfTuLPS7JMWqVvfxk/NEHX0zcl//X2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I17LbWz6gbTVv96WzoilDVDIjTvf2P9LsMM24VBFiFZn1JYZuVaUIF2BNf6/yWsp0IphC8VYfn0ukK0ml9J9XiyMgNy4T+3ViFZevUsQVFg6TR8O4QImAoqcGNvjabLn8A581dT45THEIwApc2XXlZE2dmfXRlw/y01HCOXvyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bi0qRD0L; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bi0qRD0L"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b779003fso16588825e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358186; x=1783962986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JN5vDAyeeb4SlfTuLPS7JMWqVvfxk/NEHX0zcl//X2E=;
        b=Bi0qRD0L+tHyypXuE1f598sBIoPEurzrhLcXPUfjiZKHzhBIc4MINVapNGnJtqikN/
         W99AaeRjRa4Soatj5nauCxZrEAqW0FFxp8yA6SQV7Ae6OW2MSGRFGEDQobc/6AwMJqKW
         5nhU2TWvMUqzZ0/0R43SFrm4x6d0JFGNI48UDFzqD+KtfbkBoXbjjWjOSAf1twDVdIp+
         4b859ps27OtOqPokT6SxWUFYWGYJlv33KlYSTJM4kq+OCcx6MXCDf6EyHGcP8ZsG/7LZ
         dkJUyyX+gskefCe2VKowLK9FVcQHG+iEc9fdFh/fffZdqW14fW6VcYK0SToI1AQoYyBc
         qunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358186; x=1783962986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN5vDAyeeb4SlfTuLPS7JMWqVvfxk/NEHX0zcl//X2E=;
        b=UZ9TFDGPgOJSM5HzvJ2C+9JYsgL2i7ewzZOBUaEeyTauTI0BmcGCxIEK6qHHcYRfaQ
         Hlfvudf6jitrS3TK5JT09vVxZEUcyYMrYurq+/yA0jc70gs0MGAWyXCwA7SEP7coqAEy
         VCdwy/wKPVMU9GUzIqdRMO/FEwl9VC1DLfETRXy37a6ndos2eoNetWIBTkphIvRizXdn
         ur0wtydz+bOtF+CpINL5+nBq3L8+mmRTgjGgv3KcnxuSQ34rRnz08LyVKckmj8XhbP4I
         DrLvAuB3oU5rbgWr30rfOjWLrti9ae+LWEEK34934jPP9p6JbR98fo2QablxjYhtDh2w
         2GDg==
X-Forwarded-Encrypted: i=1; AHgh+RobLczw/jBhGENBIiXXU1IDJeShSEmToQ8kkSSrE2ajF+EZH+2hyZNBilCSAio4b2Qi7npPuFpOK1AW@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXpThEKPP2LUt9REBStaXhF4s80LJG2KmcNry9IMWMfRty9Y4
	86K72v708syOzErGdg32lAQ1E6oUTCTEE2PoOTjfjeT8wJ9kjVr/RHtiedmnuU40x98=
X-Gm-Gg: AfdE7clfDMrNZaqoC9ZdO3a/40QANmcjtCKYR2Rl4TKXcjWjxxM9VAXxQhoU/2DP7wV
	sByVxy8qejJTuLIqb1NZ9sth+zCDxqc60OOJBkkeUzHs/qyvauYzF9tn74e1SHoCQwUCPG4op6P
	mkc5ycWlKtzJuCIO6q0/+6imIvBWHmnWkhzVziWG8P0Ab6UB5pdLHjkDkOjztr/e2dPMpzjNTyo
	Tvi76vIBQt+FwPd2PDlW13Uce6n3iK3zSPvZ/sPjQ6biNFaXDttiVgRLv6t+Doys+Eg0YkgakjG
	D/E4AXGF6h1gB5+nZdrsJx4pjy+Fq33m4ZxgXd89i5EuwEjikH40qD1Sd5le4ffZqKKc5FczYev
	5u8iqAT6k9r5IX4IU4PRKYLZMSbICX4AZKKGy1jeOh4n/ipfotpOiTGExBZpYHuDdSz1X6HtqsI
	rPyRchIFE4pHmNMnPluZ7r3hX5e0/JFcd9YXHd/Dd8fZpDVsaNXBib6sg/H1cjvIzkL9Zm/Nra5
	WE=
X-Received: by 2002:a05:600c:c168:b0:493:a960:a0bf with SMTP id 5b1f17b1804b1-493df064184mr17991555e9.21.1783358185799;
        Mon, 06 Jul 2026 10:16:25 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493cce040b4sm397138515e9.10.2026.07.06.10.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:16:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:16:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Raydium RM69220 DDIC
Message-ID: <akvis8eaFYh0Ktmj@monoceros>
References: <20260704-asteroids-panel-support-v3-0-38dc92570579@pm.me>
 <20260704-asteroids-panel-support-v3-2-38dc92570579@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ts3aubgs6edhoq5r"
Content-Disposition: inline
In-Reply-To: <20260704-asteroids-panel-support-v3-2-38dc92570579@pm.me>


--ts3aubgs6edhoq5r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Raydium RM69220 DDIC
MIME-Version: 1.0

Hello,

On Sat, Jul 04, 2026 at 08:24:19AM +0000, Alexander Koskovich wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need.

Thanks
Uwe

--ts3aubgs6edhoq5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4uUACgkQj4D7WH0S
/k53TwgAq9CpmcrLTfGp+dOydDPdV1igTy61onUd9jWdDbU+D/G4OCdRu8JGnOJ9
jI59b375/S22e9n+2vt3uld+ewyFSRgTJlKiBCdv7z2jAUllWtO9oYgpjFrIz6qL
bUQ3O7iHto8IJRd7L8YLZc0VLjfe0gHQSGx4xL6nyYvhDTXFiR+w/NgTMSpsaLbI
2YRIbZrVrVZoJ3UcjZ1wASmVEpteCjf5n/bPsfQ6ZjMOYTi3oSCrl7zN+fpfnJES
JAk4UBG24Wrr5+Gedw3fDkkajG3ZuSNpS/iiaAteeo6etoroJTnqYkQiRfdUO2mo
PHklD5QTxS39B8MYg6yB1EKWy9XArQ==
=R1yv
-----END PGP SIGNATURE-----

--ts3aubgs6edhoq5r--
