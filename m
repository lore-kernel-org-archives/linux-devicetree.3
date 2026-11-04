Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805241;
	b=qMrLGeGv3FfagC7FkN2TLN9sXvU+/qAyjdI45NI+PlEBlVzh+LgC52aWB4hjIx6cJD35
	 rLVNVAn8KsRat19e3fJJVxy3v8AOPlblP6ZuD/n5FdVC5/7eKLO6tliHE2ykinlqQ1mx2
	 ojaZgDcHr5MK9QIlBMfsG4lQiz5Yj42rOPCSCFRuhUOQknPvHjq9ANn31cSlz8Q21RqF8
	 o+Vu7jvb7NANpjm1MmXc11ExSWbxFHY5dIlJCSc5wLZu8dPcijsrE4eurfP01bvzV1fpV
	 W3UDjMlyt+54xc87a1XV0YivgzKnOn07N01nfcpzo4t/db3Db5YLWAWsnYNOhU1l2SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
	b=LtmSri2B/ZabMGrKDkCoKIqDF2IKvEeh0dIYGySZXol6MzUwjvQ1AWFo7MdmXX5fDwBj
	 He4SNJmNfkpJipWz3QbnwT+ISEWQoqpo5DpT14iR2Xdt9fcMZgoU+uu9TN0BberDsb2PN
	 o3quuLucESfxEgelQj/wKzsV6WgLG1hCSZPK6S7zSHUHF2WGiq9yjezXiElozXnjy18mv
	 jilFhKmxB2S5pto5IHFwnmDhVrioe5nCdAwAn5QEW25UNI6TogBBd86KzLMv3gLKAhQ65
	 hBC3PSwrsq2U/J32GsWjbMR/ITLuVRkC+ob7wJ7d7Td7IK/BkjgPV+Dy3ugB/Z5uo+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtJh+cIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F977606A31B
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F977606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtJh+cIV
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e96502e447so6862185ad.1
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805240; cv=none;
        d=google.com; s=arc-20260327;
        b=nSwPUEJMQn+ju3g8oRGGuR3SAB58Wzx7qHeBAtf8Ex/P8Rsu9CP0LDVmiMGrZEILzW
         lzv3ADZKkV9RwV9ZERewu6QNOCwLJb8Nk8nVZ2Lk/72lViPwFo1GRiJ2xx4lK2FqGgha
         dSBkQzvR2u9h8aR8CPyk41LTJiYlVVYnUoaTCZri7rC4kNeebU+TL+j4eWSWjIzjxMsx
         x9sBliQ5/jQoV6jzrtPX6LcINXqf6+jA/6SDuHkpg6e/Hrc5IjH26G0pgdjft3cq+KRs
         h84RWEI6wfaaCyiJCEJ89M66Bs7rlAKuqQaLE7UKmMsjR2/XbJieICLjCzR5z4dxK0dL
         hiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        fh=G7kW/ZjUcSCFSSa49STa9Xx0u2/gOhDtuiFEfTBq1no=;
        b=TPMF88kbQ+UssbTpnX4UlLtZNl4F+ZBnmJAJE2CokC2hFw9I47hnotp6Evs8em9iDC
         NQ7R+rdyTGGWX7nLaxxnzJsZ+6DPRlY5jL14s+0joKE7j9pz8xpjFGsRD7jKnsckuQ7P
         tpDOSZDzM6HJ2bc9spl5+uwYy5X4T5Q4N5S1XsnmwMwEZUZHr7rRXU6fj0oVqt/jHD+N
         x8JaNWwiHivdEdxS/AcYtSXv3igtyy+vYwtaA6tqeDsCM0uAZDchUZaO76807OBNaeF7
         KBUXDT8EooNpzeJjKL43AhrgKXTNQ3sHFzGXyJIAh4d33/eOrL32j7YIyPtR8ctxoxkQ
         Wc7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805240; x=1794410040; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        b=VtJh+cIVINZ2MEkevn7WmaVLFyNqkYyFIlTjBabgCax68zscjXmpFt5Y7E1GOEb49l
         pDOUbJBi0y+xmNJdzmbHtQA2TFQPErpEVtwgj0CtnEh2reAllsNP4W9y8xkt6LapFBzp
         gxu+t5ur1lKG0trClOunZczrodyKLqK1AFA1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805240; x=1794410040;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        b=aM3tymVFh0ZA9vdGZNJFfyQoZkW8+6BsWgMDdoA8cfJG/rlc7AAhrx+LyM19ySrHhJ
         25oZTxCmefyPMtAuLJwGF7yxOT/3EBf/kj4QZjJwwFvuIMmydEjV+o5Hfn81N69gzY1k
         cx4b3YFFHRrsn6b34xi0SLNoFRkjH460x15GMyFPm9RKxGhF0b4mBqW3ru+PkqMPqnMr
         4vj2vuvn6xrWvi1ZcT229TUJzWDvWD/ppnVaxZag4f7OQ/SN1hr9ZqJBi/pRDoRY77EE
         +zNi5zwB8EiZCabIHtyc+4K+thszGC3lT3IBrszVWnnLFE7we2ZX+P2uYS2NeCtirPEe
         LFIQ==
X-Forwarded-Encrypted: i=1; AKwUvBycNQ5WCeCh30tsfOI/dKPtJKjNFrW8kNuxP3ZAShZGF/UaOVxv9wLOzyvG0UayMA7AzYY0T13F40Vo@vger.kernel.org
X-Gm-Message-State: APuU4Z+iOzlzMxtNZCyBfyJbocD0EkUs6Qk0dYHrzhoH+0sp7JaJWvjl
	Pa9Yhj68v3RsfPcw3IbfoEOr8/KM+wECyU90EEg6VgdnvNjz9jdIU3w81quJoKdLAX/+9dFNzqU
	Bb0LsqUZNzhTm7BldXv1Ihfpcq6S24eU47OmbgUgw
X-Gm-Gg: AYBFou3QrQNZGGrTUJLaJ5WzLVUzuJ1J+KlK7qubpnEskBNKIbu8+g7pxMUKCqs1KTP
	L88hYoI1qbZ7TotXkRITyfg4NXgx8xITypvuRiuw7UpTZWrB8u2TE2iPwDjAe30i85UUZ5TyUHy
	O8KVWWGKxJwxsqmaVIoPt6tkzj8fRrAremGnPVNqIB5XttbizdKZc2DRW4JHfdjYjcu+i7siVbd
	/R3o2xK4tHC0QB84Wn8VJc8ZVSmYKU7GhVUr8HuWjTBK4kqU40bXySEBc2Y0NxXbp7pqPpC/7UQ
	jwNTyJB089pgn60Tydzek+Sq31yi8p0WJBze7TuCJW5p6GD/EXeXsprGNUFJOQrYhy8s4e0w5/Y
	pg6eDcBdfbZqxDAFNYGW4iDWCVNqsCgxWRQJWvHWn6/ONijkab/kxp0VHBwEn7v2W+4+i4GRtLd
	xjPJXhCOCHfzfsSBP2
X-Received: by 2002:a17:902:db01:b0:2e9:a16b:c251 with SMTP id
 d9443c01a7336-2eb36415052mr159360075ad.3.1793805240352; Wed, 04 Nov 2026
 07:14:00 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:13:56 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:06:30 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:13:56 -0800
X-Gm-Features: AclHuK8bgHY5g2vquuY3HnPyoGGgOhTHoSnTSctVzT9j5B7g5SwdvJLxwGfXVIg
Message-ID: <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:

> Before introducing `fdtfactor` itself, the series starts with a few
> preparatory patches: adding a `DeviceTree` live-tree abstraction in
> `devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to update
> `/__local_fixups__` on the base tree so overlays can be applied in
> multiple stages.

Just to check, is this still the motivation? Stacked overlays work
without it, since fdt_overlay_apply() does not read the base tree's
/__local_fixups__ when resolving an overlay, and the stacked_overlay
tests pass in a -Doverlay-local-fixups=0 build. The commit message
gives a different reason (keeping phandle metadata in merged trees).

Regards,
Simon
