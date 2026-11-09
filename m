Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202894;
	b=4Z/PB9dIUWEbKFhF4Cn7CMFu2xtB57jMm9zXW2qDy9FZ2dHW9gtQ0is90Rzaz6pu3qKG
	 GcwSB6d0ZE2Jmx8CVaHXswHwdIqS+3hii8aQ6iMp6EOOpXuImig4gAtp9kZhdrkF1YVA2
	 /6f+0oiHQuDASJ86qoplrFkS6Z9z7it7Jzy9idVgW7dGPZFbKKxXf0TQk5Z3Qnz3QuvRV
	 wGYh9oBwZv0gDFYYlWqzdtgypN+y7jUno8j8imVTTqAp3EvIzXo9S8LUuw1lW4KLo4or7
	 f9wgS/1d3390vson6aaOh826pfKSBXsJ3ECfJdvhwlT6M5vnV4uw7zVz3hfnj4EDggQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
	b=Kv+2R7xDNXumKSSAkdvavTGNljUPmL15uGSKO1sY9mOHYtyeXbxuEF2Ge7YRxX+8Ff+E
	 ux6I5rwWf0zitieW7EAfsqKy9zJ1b8F+cu7WfO9nLSu5XZWNJQDKh3W7FeSnoRYkAAO6+
	 G7NTsAE7ZLgsa8rIQwDnDnrqHi5v5aK2LmgcEQ169gHPgMUb7OT+dfjldaKpPWjPn/mZR
	 yC3h/CnIJiJ6DcLVv6MmD6W1cbSB8ldh2jpDzNustAp5liZ/TlR4xSsxa9HvBAVNd+tkB
	 ZU+SA5M21UPWBShteQjy79ynpCbIqH8NznYdcLQxVDZSI/7FbOK/u2BvBOBuYntXaPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixTT0Vsl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B9606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B26B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixTT0Vsl
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso233885d50.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202893; cv=none;
        d=google.com; s=arc-20260327;
        b=YJLffHvp+ArMmobAi0bPyi+AbkthoBpY9/j7/Ss1uEB1R1hEqxaiHjEop/zKYWLE6e
         9aLmPbdL/PxLIpOuT92ElU08sJp7Oo6bNhUbiYDfpETa5oENSmFS1e+UcdZgunL2GFxP
         /VcOt2M1dugh0f6IsN/HB3LLmBiekqXmYSN1S1wXFgFUhVZ4KXeOZzM+CYEDoQESneqc
         ejPpdH2JXN3N69GmXAMS3WZ3sjFyHlQ+ExhFFkTtp1FDx8nZWHdryp1aOzCwOUpvAuhA
         8yl0ZpJahwSJHTwJGJdsEf15mCcTsnQb00VCmtqOCCVOj6D1c3alANwg0RTamnvMGD9t
         qtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        fh=8t7UrZIbxOInAMcMpkbPy/ytHiw0HW6kRuqqwAdq4WI=;
        b=QU7aRSgepIKTcQaSkxVMrjyk3h5L3bcxpRRL37PqQDVY/P1beA8ulaYS+IJWuqVcWJ
         7anVCOj1joTe4TWfW/4YenGNKytqWOly1gx208OSVXH3i00YHAx1KqcfiGnzfPYDUwBZ
         I2rVC3EcumM+BOt0LkVpqNkdZxmzRBdtMhxkGcGReh+gHgqws+rB8qaWnZppIVIEz+AW
         pVgp/9h+ApxepZlR+/Xoi3PxOhO1UCwoAxlebjnV/KBkPMkJIzzlVg/kxE8lso4p54tV
         1He6KItlKVAEalOo2pItJKnCBRNrDwrar47C0+6WGeXDSpU4EWDtEQwWo4RdsWGkFCGd
         GWpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794202893; x=1794807693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=ixTT0VslnQORGwqIpda8mBfOWdfApgIl4gRZI/m8GqCr9k4vgh64erx6ypah6o0/ei
         FQqLI8k1GNwoShoSH0KBqfUziMxq4Ouh2W2Y5bKDiFEJ2gweCdL/io5mWG/OmENupnE4
         dgOx6HmnuVCdpk4b220rL/apfUh5F5gOC4pc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202893; x=1794807693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=QYcdij5XAUXiR4ZLiarb3bLOcl2/LtpyDJ+hVA1UhypSn5Tud2Dx9SNdfNSk7mbtox
         WjnIsu/ScIWJIbTAZf5Zxt851hv7kkAgNcohnbGr+YjSYu7bll90TbOto10z5Rfe2o/B
         O+eFbT+ocT8HYeO15HHpRbDz6ZjUL+536mE4HD5PKrexGX+UAQWW2Ml95wnH7aXFoSII
         3ybJerc1yLevXqn6+glEnK7K4u5fETfPp8y+IoDuc2BFc4XDJA9di/mKTBID/EYOamrn
         VxksdnCkCwn9BRvTIsXvpbAs8cnyMQqlZGhMf6ffqSqb/qsZHreIqrWRBxhrjFmUuTAk
         99dA==
X-Forwarded-Encrypted: i=1; AL+hErGCHBxhMss89xdhjMnxH2FpkCkiDBlwMbxrq5wrHzc43/e8X3vL8eNShU+z0mkmdWi0ASgnhh+i0z+7@vger.kernel.org
X-Gm-Message-State: APuU4Z82i/Ah+jLOm1hN9FCOc3zKEfADJU5dnnD6a3PeJR7YKr/Mjkln
	ehicn/LmrnqUBOwxIBfAFsEPv9btoJybeK5bGNd6WDyYGYREL7NqgO+4YI2AtSX2T757YexD0NM
	rZAqKLobt13XRj82BQlD7C1qklhvWYLx8AyVY7V+f
X-Gm-Gg: AYBFou2RPFvKHOasSSYYJXRhuZOybtWueetemXl82QNRIcGQbSheMykA7SZm7Qb0guY
	49gpTHvADtP1xHIpQR1LJz5VWvTWJdWqxQ1zji8+eQ5MuQSBt8rr+gty58jViaesjY8ZWAyv0AH
	SBKwzdDE3FSx1VBtDOM5Owp+hQ06eysFzWxmLTjI6I5PXpat8/niJO5p204c6YM1swODPl+gk/d
	lqNM8LtawR2w2hgmD+XigEf0fdu2mlt3XFY4v32pEOkT31yzRf8eivGUCk36hSMwsGQs6YUUFiG
	QRI8H4xdIc7F5B4JzRn6goez/uE6a37jl+dq25hnktS4AKBTolVTnVat8DwnYM6+fKZn6iER1L8
	AynM4cQzHJLLDlEG2dMRI9kVj9s7q5Iml1DBAjQ==
X-Received: by 2002:a05:690e:4393:b0:67c:10d:e377 with SMTP id
 956f58d0204a3-67c3d97b42cmr874807d50.24.1794202892850; Sun, 08 Nov 2026
 21:41:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <179406980914.3424803.6201831446824678583.b4-ty@b4>
In-Reply-To: <179406980914.3424803.6201831446824678583.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 14:41:21 +0900
X-Gm-Features: AclHuK9Uis4PjHZvlrrahSmg0-iKCJazl9kKs9oybOBLW0q8BipFSNFJ0jiQ-bQ
Message-ID: <CAGXv+5G1SozUuj8v64oD07wz6dFbY+bXh-Q3OVvieY7v41ZJ8A@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad
 supply fixes
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 7:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, 03 Nov 2026 12:37:24 +0800, Chen-Yu Tsai wrote:
> > arm64: mediatek: Chromebook trackpad supply fixes
> >
> > Hi everyone,
> >
> > This is v7 of my Chromebook trackpad supply fixes and optimization
> > series.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-7.5
>
> Thanks!
>
> [1/8] regulator: core: Add "enable and wait" functions
>       https://git.kernel.org/broonie/regulator/c/9f9bcca6adc3

Thanks! Though I was wondering if we could get an immutable branch
or tag for the commit, as three other patches for separate subsystems
use the new function.


Thanks
ChenYu

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
