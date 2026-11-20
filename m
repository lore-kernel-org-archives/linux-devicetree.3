Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188037;
	b=2nNGguVaNLvfqTqM/Jmkx3egymXqpbu7mynIfQR3QqoT6vuHScruGUEwOm8oPj7AX2R3
	 M1ZUfGI+7brUD1BCmFMQW/5Lbyg7SCcymJKAxSYFc3fiye6ZrvPh3esayOST8Qefxmy3e
	 5MMWGDbNUsg+Y/D9iR4xL3ReQwYMENWgOBdhdMUrR0G8ARAjKmKgg5ghL+BxDrPOr7a/R
	 j8rZh5VrmU3mEg3Sqb0LVTRmFqQBy3Pr3iadux9CZ5GE1NskoHUDcz7OfaWOXEEFxNa6w
	 9nsOFtIypKYhmxRfJbAzXXcWWeIgW28IqkU8e8+VuxFVhtpFwRQHIXVp70IummX0TeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
	b=wJoe7WoUe6+/dD28SjxdywCNTMuE7a6HubFKJ0v6f+Lse8HAX2n3WHOvH6TzxJLszqu+
	 uvfQfRWfhVdqJ8yUq0dljlgfIMiD0uuNUkKL+ftA8X1I9aakcU55nRbhKOx7QOqYCm2dl
	 Zc9yM/iTPOF2/4CWEHgrRtxCDFaZ9ZxFs/R2I6p7EA0AVKg2I9W8OOtnAtmnoGJjtOTXb
	 3xqac8iuYn8W7tAhbORMei0GN+pHmA1hhOVV5BEUNB94ZGhkKhca2tYIy0enSZqf1TEpq
	 D9e1BOYP8kJtHHkFeeK79QNAMwSQ2993NuFDj8Lc92oseBvGKCCikpGm2Sbjsbu2Wlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KrCLE9f0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE1606A32C
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEE1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KrCLE9f0
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so1275736a12.2
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188035; cv=none;
        d=google.com; s=arc-20260327;
        b=merKlwSToOcgOTnyySi6vgS3oQzw34rUF4jUAN6mlqIN8ZFFBZcGsDs7qyeD29YcHH
         dof1+PmDCzH7R3V0atNMK0Fg6pQxMsu1x9klxRHAEzk4v5rkdhiu8505Ig6gH9NyOJTh
         jTIVpUcEggmSCE1Qqha36+HRU31HCc1HCbZthxcxPGRQkCgDAVzZbIkYXfh5x1An8SMt
         h63Z3rnXlTuJHSGJtwxhHF5thNwdnu0q+5ZWm2QHcvl8vJhAhQ7GMMY5WrtIcSDwj72/
         nA9/+LEylAlL9PAJtGBBasTUfzNkmSV2DDG/xnAKhbc+ycfg6Lj3R1BqigC/jsssayAL
         4psg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        fh=uKvcaiAhXxP4Y3qbqVd2GdWt3Lfd7XeK8JGzN68csew=;
        b=DNFstJus0k5ZGwQiypaUSUiPqNwMohFVZAx434KJul/DgWNvNT+6ju2X973HgZIenn
         8ZyFhVPZ2dFneaZrSMGF0HETQYuT+7yxAffuKWo1XdI37OqhET3yXkQy9MuENHomLZLq
         Lxqf2XzkBNowK+WCT+UcxY3BpPR+nMVPOFvMCFsGlt41LwaepbBOxCxnMgQQOPfN5eo1
         FsBnpcgAGAhkfVVpTEusxmwHiOeyMVAA/lSr1ecVkYiUamlyr1rw7ttzxYLq7TZxypD0
         RlpOxtWcAJgNJRdo8dzTUHJyxjAsKEgXf0J6+IzGnmVqietY6PZ/o47sx3cisjwrJp+A
         HzLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188035; x=1795792835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        b=KrCLE9f0l5kQICrTLb1eNF7JtQCvVuF5pqZmRGYh90Wdtxtc2EQ/byEDmslVTkS6G+
         Y//VKMfmofLsmNk/ui+8AMa7DPRNVJn7RU1PKbE37nSs9wL/SASUgwkuODsBC0fu0Dc7
         spKgJLyXh2jcWB4ScKLkSdjpaI9+qpIG0aZnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188035; x=1795792835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        b=reFuGgUtmpI+WVg09IuLDDhO82IJK6hiwtTnZmdWkXawMEjZbwZoZZhRbhvss42Hhr
         pVFoy7vZVIKr3fF0QIJW5Q1kBIW+IdlDGlJ+zo8Aco5IRmKgdJZTR63hSTcjw6GPxsIV
         GCvpugEhZ0spHcFRr9LZNvpVLK0dyeVXseGtIVgTZZCtii6/IWhnnzPbpxOjHl4viozR
         gJfHq4L+Rsam84QhCu5wlBurUmj6aZvijBS2QRvPOSdwsyT6j+dcpz01+i1nAXgG3IGe
         b5UntV0VBd1A6cTcku+dMxaxdqEH4GmlMj2KQVBtNzrA4pG/xDpLf74Opf2ZYylgZID+
         C9Ww==
X-Forwarded-Encrypted: i=1; AL+hErGej8IpL28GOqicrW2o1ZYsMu8kZr9pH+GZpIe2p3hKmtQwGmCOeF/No7gnql557yPL3jHmcLjFU5cD@vger.kernel.org
X-Gm-Message-State: APuU4Z8emqwOXkbXr7JVghV1mFmTgh/VZqXe5cG4CInODVz9VBZtnbUV
	37ZrG4pSgL93+VmPDTUjKnG0gOzJKGrFUfo92b9pD1SWZj/zGV7yNeAZM34G/yD5bqOqs/Nj/Jj
	x88hlYKl1bWKuVLn1+DYsDhjSS1paHE/7sqo8EdJI
X-Gm-Gg: AZFdTZf/oPGHBH2uSYi0kjbNThDw1vj25Gqsdk8bTvAcNpvjXhIPKsm4ABeZv0gNRv6
	ykpus0Fmy7bOSJE4gJpRe16zd1Rj+wBh7DXaGyg3gD+KVyIDiz54GDgad8JU5Vwflbh6eSLBnqk
	ABF5BA91hpPSCV/OJmHERTxT2xyEhaArbOgwuOttk3UAoHgyf/17GYVmRjOKZ8chC6wuHW8R/9F
	zoPTJJUeX5TE8fnd4kEl/iX2ROc6C32iNASLZv+jAWaDBYTMkM2cQcFmPcBwS2G42LMm3SKySU8
	vuuaZkAnVVdsToorDIWlBhTbX6WMlBUmPJL2i8AYGuAP2LV1BzG/UZqQF4J7K0tLH0u4k5Wvts5
	VlAF4dqX2r5RPM/2JpFSl+mdoAjaAvrCJtDaFmbbgQjv01aJr1pQCUfsO
X-Received: by 2002:aa7:c249:0:b0:6b7:d0c7:4aad with SMTP id
 4fb4d7f45d1cf-6ba37c75ef9mr2328640a12.6.1795188034912; Fri, 20 Nov 2026
 07:20:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-8-dianders@chromium.org>
In-Reply-To: <20261116205320.1621386-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 08:20:23 -0700
X-Gm-Features: Aa3M54psUBrQPUKXYteeAD9WgtZ-YuEDe8s7JLMYNK5VihZIqFHf2DJoFUBm_As
Message-ID: <CAFLszThHKUSDbiDqbmhSd7SDpMOvpeGcU_NdizYb1azYhejrow@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] libpydt: Add DeviceTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> libpydt: Add DeviceTree live tree representation
>
> `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
> device tree blobs, where inserting or deleting nodes and properties
> shifts subsequent node offsets. That works well for in-place queries and
> localized edits, but makes multi-tree comparison, structural diffing,
> and bottom-up tree construction (as needed by the upcoming `fdtfactor`
> tool) awkward and error-prone.
>
> Add `pylibfdt/libpydt.py` providing `DeviceTree`, an in-memory live tree
> representation where each node holds `props` (a dict mapping property
> name to `libfdt.Property`) and `children` (a dict mapping child node
> name to child `DeviceTree`), along with `unflatten()` and `flatten()` to
> convert between `FdtRo`/`Fdt` blobs and live trees, and helpers for path
> lookup, node creation, and pre-order traversal.
>
> Add unit tests in `tests/libpydt_tests.py` covering `DeviceTree`
> round-tripping, subtree unflattening, duplicate-name and corrupt-tree
> rejection, and navigation helpers.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libpydt.py    | 184 +++++++++++++++++++++++++++++++++++++++++++++++++
>  pylibfdt/meson.build   |   2 +
>  tests/libpydt_tests.py | 106 ++++++++++++++++++++++++++++
>  tests/meson.build      |   2 +-
>  tests/run_tests.sh     |  13 ++--
>  5 files changed, 302 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
