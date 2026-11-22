Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339694;
	b=LoKM2uckOMsEBfsQUK8XwCsTJRFHFNvTfBAqM0qpc1FtlzCbgP025obd1I+BfAjZaFdP
	 nmT74w7VaRuEf3cYD7KYTRxvxjMC7iAYI3qQ9H70t9VkgSrrXSfUEHuLVCt8ndlQmLBSp
	 O3zCn9UCqztEKcFOM5BXEcfyqINRIh+C1QukCqcS6S8FjNJwR4ylT5swiJUAhQV1fSZI5
	 9T4KMi6C+1HbuevfdsvtjT9bpCHRhh++efTp9pp2/+q2mMcsR+IpDMTOLaBb2sUVOuynY
	 oYDnbKcLbFkgiBFg9q5WyutUIKwWBKUfYFKrKJT52RU2l4otG7VK+O5ZHDg81T60Wjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
	b=h86kOxjCfM+68WLoiBt8C4R1avUIwhjMZcjHz8ftAbenxLw16bLOhBdKT3X5+5m3FwEq
	 KCs+w1uK5gIf2UrnRqQweAYrcclZp6ScKErkh5L3Z+q5Twq/g5kF2jWltXMgcP8gM42aA
	 d9uh3D8ij8gkDOauOyGNEScOYwi7hWfnuI5D2e9uhCS3NeEJSAR6vWRBtnUK7Cov+xrhX
	 F4ssIWW4dFPZFYUPKK386/cS+27B0v64SOtmSsyyJfXewvb3WGirUNDW6LnbO+kbNpedF
	 lwJ5SDXdjZRaFl9ab+Sa+UJaKM+IDiVYR142bcuzk60E05TZWBhhy5xRh6PjVoy01UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiP00lEH;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EC9606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EC9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiP00lEH
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1344833f8f.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339693; x=1795944493; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
        b=DiP00lEHBr7inlzlxo3Wc++H0yHh8YYVi3Mzk1vabyccpEbOSj8FUXTiO5OdWZ/mHW
         XtPItC1QUdX9u9C0v09ZcxfCLOtAqjL+3iawcCBruAah8p6ibnRlRv0YlL+lXsJuK9bW
         U7Pq4kcrp2SSQ5fqpA2xZ9qdLwpWJpXLyyRlKvS4n0GUzOQkwzJ7zJZqNlcvJCSSfxee
         E6ZxB4x1smG2pIpSiR7JxSuFE37+QCa7PMYu7yZGpozD5i+g7c77wqpNpqtrMGzSd3aF
         Mq1Z5JHVV4bhcUpQblQQI0732OI/Ia/ShCWhgg1ITkp6/fDQupMNgg+077XmNijeRHXf
         vvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339693; x=1795944493;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
        b=pR+ILLah5auvXG+1cRhsR9mO1N3C9yTqNmjTINS82cVUwg10hZVFNGFjecU05UbuX1
         kH53mvp9nPlP42BRmnM2vHRvfBAe660x9a0G9AI0wETW3+f6yM+2lcCCPMJavj2YqYZP
         Lk98QoTwOwrZ/hW4PZwonmIyMkAQLJv3fS7Ll12U+PC2DFn030BwI4ljbN1QwHUhSqYl
         B9ErW5Y7A8qJnlUkGXKowLdjPa59WS7jNWRn9NIL01916o77hKOeCzmU96Ttfva8ialU
         1WyE5HUi/Q9cs+HPf7reTiD5L+uQRtyBH6l1mt4OMaB04kOkBCC8xm7/TxXVcTYneMLr
         hbLA==
X-Gm-Message-State: APuU4Z9LvakfpLjtB+WA2CY/whbO6BD4P4GWgZTlK4mQZbfXZMZdCZ49
	vj+PPUs3P/Glx79kK8rpQEXGcUuhf9Hxfcq6lCTmMwwDY7nylT7qMqjj
X-Gm-Gg: AZFdTZdNB1Aqolnm2BH9rpjnBpnWumP5yejAnNbmrl4wx5l6d7V/mDd0Uiw+yGX5exx
	7UP3259M29xBzD5STozRVmK8/qlB59DddwZf6x6ze0cHV7UOOfw19AHvApJ/x2MPGJZYBlxwWl+
	F/ObjOSGzA/sl5qJ/5KmwdU885QIdptFBrbcxyNLK/g9o6h8/fRgSvykLqGmuXo8y/gLT2q8rgy
	E+Bb/8df325YKYUAdWhwxxDh5WiI6Eq6xdnzvZP1fvEwKbqx3sbr9okYbvr9No9XNNQ7jupGVoK
	BBm+8S9vjtQsOvCdGH2v+xdWS7nrEbj1TRbNiRjL/G0FX2/GLMXJnsG+o2dQWV0jRqFdsAafZFG
	5XXAluypfOv2aYwfcY+SMpPv8/kZTKWG7A3MDJN6M++phrHGt3WbTRzeWAbyAAS+tVkO7ApS2iB
	3iqbbON9W7gpwbgneMblQk9ix/MVv5MJEcJNCs50YSw+vfr3QUcBhL3j5PQvJfj5E+np8kWe2wW
	caz/Muc9M5G85VvEJ2oyibzd9fFsFy+AnsKR5p2ZGumGMkuI+mDpbVIn3gQB2yklCVtvm0TX9eR
	+IcL7V2WQ3oPWZxrOe0nRlmF3F1zviEd2pZanHG/Sw==
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr12062401f8f.29.1795339692451;
        Sun, 22 Nov 2026 01:28:12 -0800 (PST)
Received: from strix.localnet ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm12250751f8f.17.2026.11.22.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:28:11 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 lee@kernel.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Sun, 22 Nov 2026 12:27:50 +0300
Message-ID: <pmvkAYeQQxqf6KX1o0NWJw@gmail.com>
In-Reply-To: <sashiko-outbox-225964@kernel.org>
References:
 <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
 <sashiko-outbox-225964@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7pWE9LkGQbyJZPD4mlTCyg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7pWE9LkGQbyJZPD4mlTCyg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Sun, 22 Nov 2026 12:27:50 +0300
Message-ID: <pmvkAYeQQxqf6KX1o0NWJw@gmail.com>
In-Reply-To: <sashiko-outbox-225964@kernel.org>
MIME-Version: 1.0

Am Freitag, 20. November 2026, 22:51:31 Ostafrikanische Zeit schrieb sashiko-
bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] pmdomain: zte: child-to-parent device link deadlock in
>   zx29_pd_probe()

This looks correct - the particular line shouldn't be there, it was a leftover 
from earlier attempts to handle device unbind.

> - [High] pmdomain: zte: wrong supplier device in zx29_pd_attach_dev()
>   device link

This one is likely correct, but I'll have to do more reading to be sure


--nextPart7pWE9LkGQbyJZPD4mlTCyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsCtZYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiWwUP/1zrUTig3p1zQi1yN49m
lZsHM1mGoC+rZz8b6Gofd32dOfizYgpEF7nTr/TVadx3oSzKlKF5ayXHR/Q8Bgfo
ke9bKibuDSpORGTL5M5S4hxiwi9xIJ9Ut6alnVApxneNS1AkYMNFW/mDbSQGaY9n
RdRD6/yKt4miuWmJQdWJLCPaiwcM6e8AbUjCavhkMWEL8z1yxQaUGDNJKIdSrv74
OubQcJfVPr4v6UN7JfUvg/aBCyVH4L/hYNSBaasfH5Gu+BjgB0S6j/i1FY8TRhHe
/+LKiKGph3Bqq5Mh9Ho197e7vfKbK4R4agnxrJV5Iad52JhPtWYhiKUEdeRvduxB
fngHWLMNa2jDLI6iie9bWLAZGAP1Hi5ZeBQrkl2BhXN+BulUPfdNWH8nNzJduDMI
a5NNnM85VdY+jnIMl/D920QGXAii613m+nJg8R5jGg6LrGNt4lV+pcJO3tS7BhOu
vL7UsI2tna7TUMj7bwnVdzmbLMipw8prPWpRTNUNBkP0KaSl5CnKfce7OEYFfgvY
tLLl/eLGF+sOQ7Mx+ZQE6KE50wx23vPSrpjXfERtrFGwm5PyI9OO1fxrctm5cwdd
j7kTk7HZcAiZQUsC+qN436NqIkBHCNR9CCm5VLlOVCRxq9yqYNH0+00P5+jKGjmb
OkG3sJu7139jhrSQYgGPFpFC
=7yFm
-----END PGP SIGNATURE-----

--nextPart7pWE9LkGQbyJZPD4mlTCyg--



