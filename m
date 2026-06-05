Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B5472782
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644401; cv=pass; b=M/gL1l51mPxbPto5K82X+SAxjYyX6jq+MPAE2W4GGorjeaw0TivRgAJqeYCnFR7NNxElCCjtJ2R1omOcZKuv7ajCIFGCIEQTM7DbXOjoXCBx2B5fIK/ENgLkbOmPLvWJ+ncO+y/+qnue1wdlERrafLZPNC0YQegHc8hXft1Hwho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644401; c=relaxed/simple;
	bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfCLkjQL6wGdOI0F4paLlYq4Bsh6fpiCBgLvKI4kEBvMvHkpxcGB0I4xmMPZYJog+oNryrdJGkgsuTSLN4EHRVWDDgT0lknMVo1d/Ft9RxShViTRbU1BRa5aRLrN3zo1FYyIXg3s36cGITH3unGXw9jM3iZ9rpqFA63o9FEluLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjYn9/pE; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjYn9/pE"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso1539410a91.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 00:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780644400; cv=none;
        d=google.com; s=arc-20240605;
        b=h+VXmJ7WREgu7GBotgAUwHnwfUE44AHbMrJ85ZRr71qmLN3zwjWmMfDF/gSKEpsuZP
         3ZoozkErFJpW+XRzpUULfj6ECC0JvwLycYbkfUZBSekpf+lRoteSxk/MLZ0tPtH7XXIQ
         hMpVLKS6Ls6itYF7xxGtqzhNJMNT06OBQkeK6wpr17/6IZszIiFGThWp2VmXHw/8CdaA
         ooAfzaykAPMMqwnK5zEFx602ulMFMVPWlr62RsWcbXmrirKDVuIzEPTO8BrDSQ75+qHu
         tDDDgvWPVSv3dFrE8uJD8iKD2axVBeRUAtB9OXWae6e0tnvUATmFgoH9z6U50htqPjPP
         3vtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        fh=+i8buGvW3S0NO1tMqKtwvgzMtzQ4JnVLfw0A09I96+0=;
        b=krtkPXwwZV2T4yqC0GKHmMouA+gJYnt8UMLWUy+Ufand3Vakm6nLa3NrwiB5uxhtKO
         TYSjT14QU5hNf62EqLFfIiXSGjCeTWofUFnxVoofELFjPSk2IMUZGleZmZ48Kb0U+Gd+
         DKVbqQphj/ou7PDZxvsoR7lJwABu7QeyeszXW+xNQ8JImxtNjvN+gxpJ6MzgEYsHbYRd
         KEp+E2Ig99DFr6vO+jVIgcTNBYgn9spL5m69JFisiVbE3MeOBQr5lcGU4VwvfBJzroOu
         vvd3XwjzdfJr3v//DtcWZoKtBSrgu79Dyg2ebK1/A0+yYqVXhBtp3ZWykwMKlNJBwW7H
         NKjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780644400; x=1781249200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        b=rjYn9/pEh05QzES7RoGmkHiPvNIIbN/2odtkES3+Mt9zgAGbsVTs95R3CZzfIin2VV
         LnAsXEiZEVoZySp61BwJbJSvzgKcw/M2jOVbL/2vKiEgpeFGvCKTZ2PKpD4r5XTT9eyr
         3Ed9jgWuXEl0G0QiX5jGY0WOteuIQkIYWJMSAU5kcFkv/YdfF9mgLe00KLpi8zbOycMN
         1tfrZvt8GANLE7jb8TQEm1ZAehmtiK6Ha21mtlYxIkKMM7mFwhIRXQVyt8dDcWPwSM+E
         Xt91Qy/KFWlGR1w4LkuYh/fGvJWZn2SgpCjrvHt9QW0oJXJtz62Xu2l4+7yBT5OmElmk
         wLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644400; x=1781249200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        b=OkNi9cjp7Nsg4N3cHtUU0UyUO+Ryyhvc9f9zoZ9izLGzjkq44FI5j7GO0xM32Z9xW5
         PRdzRs0u95OIttSazpkmZAzEmWI0QKG3n8JB8xnLrcaZnZWvW/gEc3lEhxMOPmBVEt4B
         ysD9rWTIohuP1eKNkWy+j3rZPPWxuaRvQxOjCoA0GaQPN1Azh62PKOwAQlhgLvcc5dlm
         TXnc5Dg+/otGX5z1xcYfOTffYYKdCoX1f/E7T8vFSyqHz5sFPBA5ll7s/UUAQqCD30xq
         KM+xH1jkfyrzUpjLrRn3uezuXcHJIpZAfTNV/DEQSHBYdKB4+33asjOTFBeIxb3hT5l4
         GJdA==
X-Forwarded-Encrypted: i=1; AFNElJ9FISI1MnIkPiPWlqMabrQgBSnljBrF7iGCd59EbnxjKPnwtF6Ptfgb1fpZbbCQxsxXfmWGGsgpclmE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pS0UeMCChCuDqWm9Kyyt181niu/kDP0DJrFQhSpQZUG7l+Py
	iAO+X3EHpNGDCDBE9VwpST+NOTDe1CjLVHvQTzoEH9q30uDsNXMVOtWq5ICgV+C8zPj31lbAwgC
	qYv+GuPuf+vlRl8cVZq2PFoPsjhq7vlo=
X-Gm-Gg: Acq92OFFNlMtSYwrYmPsApKITW7BLl2XkuCBZ9KYL4XUzeh11rFKCfJ6RAWLHeZV/Mb
	ootptBBUcSnqjnajzX5FitrfTouSZn6WmMRnRYJVtj0Gsu/sJVskTLiJVWr0+HZMj2VIgKl2Mwc
	vlHeYwAWSfIoCvnb17gIhvg4FVVb9/lwcRzZ3PhE5UtZaJVTFz5ecKq1kQ/ZZfN7wz/3U5grVeR
	hfiHW84rT/e4jQb8Vvy7m3xiHZOdrSG0lF64UeFuAQdPNkkeJeybzd4cScRh5IJUfQTM5qMe+NW
	j70thSpYdS5ANBv8HpjLkTCyAz0fP9xg2j3Pbfuuv0Z2KIm5
X-Received: by 2002:a17:90b:2d10:b0:369:d7c6:450a with SMTP id
 98e67ed59e1d1-370ec1eae81mr2749184a91.0.1780644399899; Fri, 05 Jun 2026
 00:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-5-phucduc.bui@gmail.com> <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 5 Jun 2026 14:26:28 +0700
X-Gm-Features: AVHnY4KOKDgSpb0rAAvqs2woy5Hzsul7irxFMBOzIzPmWvsBo4cJyTwoWJkizeI
Message-ID: <CAABR9nH3pZZhvRv5kQOB-kBPgpZ1EGvvrMS8YYoSLtyA=3Z55A@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] ASoC: renesas: fsi: Fix register access from
 in-flight IRQ after shutdown
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san

>
> fsi_stream_is_working() can handle that ?
>

Thanks for the suggestion - I'll use fsi_stream_is_working() instead.

One thing: it's currently defined after fsi_count_fifo_err(), so calling it
from there won't compile. I plan to move fsi_stream_is_working() up, above
fsi_count_fifo_err(), into the "basic function" block - next to the other
fsi_is_*() predicates, which is also a natural home for it.

Does that sound OK to you?

Best Regards,
Phuc
