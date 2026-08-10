Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474D37E0FF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337433; cv=none; b=VFmoqt1m8dZsVuunRD6NY5J12vM2gSyHQ02dlDf0Q24DX3KnA8X21RdFeuoKOJXPgZVhn4ZDVsqDzuKrSCGY+7j38o3Bb20kh+RXxfC4E9pHWl5KUp7OD/dTeuO2qhSN0geM+NQTStxBLqOB9/t26TgoVyzH7SeAXi9rh5ltVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337433; c=relaxed/simple;
	bh=Bhskj8y1R552m79fnnauJCbMurjNMkgQt7/Tjc9jmTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oanes99WDZimL7Ypn3toTJQNQLclB8S6WFMBSyIvxDP1B/3DwZnmOCMtqChUAaPkLbg/7w+U/SOlkAIy29p6LikwYUfhGJE3luUpyVzGa1ko5vyVGqpv8Thr15BSMNzOEjKlcWXHgr2VMVhmmqYypO/IdRNYbx3uhezUr38ayxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JTw9Y8E2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JTw9Y8E2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49553515a8bso22311155e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786337429; x=1786942229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bhskj8y1R552m79fnnauJCbMurjNMkgQt7/Tjc9jmTM=;
        b=JTw9Y8E2+SuLN+25eMCSF3yflw95s+o1EXBAk8OrScOQSePtw8U+qHe+jGud+tN6lp
         b5tqGf4Z7qGyMCvkWrL1BRMJDPX2PkY1eUpEqL9qZBXsSKEV7NVzaaTGFofQqCSQngTz
         XxT3Zm5Tzs5/DC3EiGximCeXMyfuuvH93oxjgQfB8hlP6fbiPOVvhy+/29nHw/id1211
         6Q/MBlvGEti9aii/CwQiP7RCdv2+70MJ0joSgUb+XRltJ7oHqNfkgyub/m+raOaDiqpO
         CZDGo5BGjZUIEqGmIKNO4jYIVlU/fEZv8BAzs+fq1NGitsq/kRm35eYs6FtfOTIxl5gX
         0sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337429; x=1786942229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bhskj8y1R552m79fnnauJCbMurjNMkgQt7/Tjc9jmTM=;
        b=sNpvaOqkpFeu2HAqkvvuqvJcfyb6LXXK2wJRBDH4PA9iqFajyLdXVbr1eu9VQnXBbD
         da8M99ANCaTwKIwHARWVFXGeULeLJCUy+siEkwy71YCdLg8guIS7QtABu1jYPZgq9Qzr
         H5AFrSsYpWJ3VJOj2LQdcnWzsx+LaXymNtlEYgONgyNDE/A8bFHHh/MidNNCkb7BERLP
         fCkyZbIavSDXwVISs9uA3zm30LFx/46BA5DUb0cuxtWJSAo6mq+vN8nvOpOZKXx/7eTC
         Ryl+0+BwH8abYf6JIUd9FMPWJH76zovvrJL1OrgN7yA0SyejSTvDNvafIx0zpPl91kDp
         1MEw==
X-Forwarded-Encrypted: i=1; AHgh+RrvmyIhqFoCVmoy0KVMnhpFqe7qwwZfdXmbMeXtVZYGGTUt4nk7Y+TEulLFrAt+jC25EhJpYuiPq1P2@vger.kernel.org
X-Gm-Message-State: AOJu0YwAIIdxM2QDceCf555Nk84YKrDCLzPlU/CM63U6hFCPNerHzwa2
	wlFxH2UOrk80ZpK+7RIcV02/AfmTOVRKfydr0BoutNbsvfhwTA/7NJYgE5ErBm7tyug=
X-Gm-Gg: AR+sD127lKYH1b2yAe3tIRF/n1nba7OJo/z8eFpNGcudlOQXg4F9ILdLWLsx6qGIAqz
	X2qF5Cd8/dEqf/nI8vNQ5fSxufBMYme3S06V6SnvB4HX87IyLbf5+9kdnMnmtI6UaWhWRTB9cH0
	QDpigpr/UqQDTn8nYnDx0XWIojPxiSkF4cN9qUhjsvDKkqlBXqlxq2W5eY0UMftORhDLZO9F6oU
	YpYXU5tOrutw2cSX9NmES6OUfPOjqkCpqf+F5mfwSkIiczMuoCO2vNoIj13Az2w/tQeWiidokD3
	6wgNlj2tvG7ltMkPyQRY8JeDJ6JLWqvVO0nUYVVZU+btjcItym1vBnCOj9mu6PKjYPUfqIqqfLP
	k4UyL/zASIQ/ku0mRT/+xYNdNllqVgqkcKkKijTj01zKgw8GbcWnK+u5RdqgO303tXAa6ZuvCIv
	1ichz1xfRiN0TuTwzxtpqq/1A8i2tB3wdl0udPgRrks0T3ime4lFEgtHXuCoYhUaLkXY34E+yhx
	IHx
X-Received: by 2002:a05:600c:a47:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-49959e2eb00mr345215895e9.9.1786337428853;
        Sun, 09 Aug 2026 21:50:28 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995428f294sm372428995e9.15.2026.08.09.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:50:27 -0700 (PDT)
Date: Mon, 10 Aug 2026 06:50:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>, 
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/3] pwm: add Andes PWM driver support
Message-ID: <anlXaad2BMush07G@monoceros>
References: <20260625-andes-pwm-v6-0-3aef11711017@andestech.com>
 <20260625-andes-pwm-v6-2-3aef11711017@andestech.com>
 <20260625104613.CFCD41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcwqrsz5qzzs4vej"
Content-Disposition: inline
In-Reply-To: <20260625104613.CFCD41F00A3A@smtp.kernel.org>


--lcwqrsz5qzzs4vej
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/3] pwm: add Andes PWM driver support
MIME-Version: 1.0

Hello,

On Thu, Jun 25, 2026 at 10:46:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The driver fails to update the hardware PARK level to the inactive state when disabling the PWM channel, leaving the output stuck ON or at the wrong polarity.

I didn't look in detail into the patch yet, but I think the review
feedback here is misleading. There is no promise about a hardware state
for a disabled channel. The only objective is to save power.

Having said that, it's *nice* to drive the inactive level, but if that
isn't easily possible (e.g. because the output goes to high-Z on
disable) the primary objective is to save power.

So I guess the feedback is OK, but not "High".

> Additionally, if the polarity changes while the channel is disabled, will the
> hardware's inactive level fail to update?

This is in the same category. It's a bit surprising, but well in the
limits of what a PWM consumer must expect.

Best regards
Uwe

--lcwqrsz5qzzs4vej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp5WI0ACgkQj4D7WH0S
/k6uvgf/QZmDu/btQL6geT+qqHEQN7l+EK0l9p3A+CrqaMHlQP2lPn7VVPNxiinb
wDcvRoLSatNz6x9a8ER4AFNJoFioKAltqvCK86Ti0UJuN7+VArjfPZJAl3mtmio0
YOLXdH7PMqbqWuzhBxdMUXavTZnFA+Hmg+Vp9HmgJExrRqqk6IoebudKzXL7F3T4
bYD2F02Gd+oeDjBLxDU93erNxo2G+KHZFF594ZjrO80bqREwoN9cIvqygeaNBnVn
uhoE/oJ5VfFkR+HyXpZnHjSKpqK6JzF9ItcyRvlQih0TyDH2zrm1LB0wZKnyVGJF
BdAYmdSKXBufQIGjYZLjGkQWSnsEDw==
=L6CL
-----END PGP SIGNATURE-----

--lcwqrsz5qzzs4vej--
