Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829826;
	b=NUy08dzmb+dKF4XE6hkGNSxW9BOpkuVuG0GPPaguNzRD7WsQhUhgjK/F5m1Mu/XKHkhT
	 fz2XWy6b5vBTfi6iQ71C6B+jB1Cn/RKL6ggpldCStB6XUIuwCDAmSpKXNJIceoGn3Ab3D
	 N2yqTQ97udeRB8g+1wfMfJVS6A0i/rfJYdn5N7pPHiqjGuI7XDKfYvFdUdQzB/pM2PUmY
	 EfqRcPo0ycvWQqP+OyurXeivPwvJ2HeEMgUKvqTYg6DcC598V98pwIIfrdViRIkEVw7bS
	 Jrjglnu8b/ygPgxBc5pkunR31LxOYTI7c2SgEXBXr0qoUJjtEdp3IT/O3cvhtXcJbxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
	b=jxBSkr1d5mlIahcfTxjJdt2/93Nw7CgOemY9bBGaT8yXN7lq4BXs1ncCtKNeJwGE+G6a
	 FLL3aB/aA838MruukJdrYL84bfgI6Q8tm7mvQACl8tI9TmKF9H1jFDJZqABlpQ0ikLLAZ
	 U+/RC5td0WE6twaIfqexh3RvQ/TWX/XVKOFOUemdiDpoWkX/fzzI03R4CAx6u6IfUa+Z0
	 Ktg9h8EOx2Tgb/pHP5aINy1GM2+8qXx7k2v7Bks8HKF1oZ5FTHxMlkFNsx0c0bm7+gXhK
	 bsaOld2XcmZ7heBr7eiABCUkZd7Cvn3T2iItbFSAuUjHtegoVGj34P+YKAk7CbKl76A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5765A606A32F
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5765A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1630896a12.0
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829824; cv=none;
        d=google.com; s=arc-20260327;
        b=n6ItgayH9F+RUsEEU7u9alglTyqOQipzyBr0a9S/+1aRIESsAh2V1UBejrwIquKqp6
         EMuSTb7Tdy60CQWoy9kL47zDV9egWccJg9BtLXwOmoC0KP6VyT2vsXkTM76ze/wpqFSw
         YeP240mMxjIQZD80vc6X7Oktjjz64QYnrjvuyykRvePMPqp0mFh16eusgVdAe/nDJ8iT
         iDwWNsnHaQLhkkzp/buoo9UZosEFviH6UP2+kV8Ct0svqNUzQ9zZS4GWG4xGxuBAWHd1
         222EynwU4rDjZ/5z3MK9ugI7rMgyPc03+AqqyrY3nXE5QA4md6OI1yLi2tRW1TMObHVq
         +Lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        fh=F12kluq6FExtR59zhFjW4Aq0/b+qZ12MEpMcmcyaJKc=;
        b=VzbXVJ5RREdzsf5YvJ2X47w4WIxU8y0x8qz2moPvWlWRSDXbBgmVGmKrG2rP0uGcCG
         Gd3azH+lZSy9NaMS5OgpaahhSsY/CDynLslcUyB69K78BtL4Qj+tc05BskmHkY4EaUp8
         GHpwuMdCBPY5XrVV3zD9n3iolrW+ufamzC6plS8z6o5nx1qUqNo0RDkejmpqpweVBHU9
         bHPAZe8vnteHaJqp/VA6tSTx79bICgmo30Pw1EraRkGo+UElq89FLaWLbmPwa3JlOh/4
         FNI6NQRWVWE6AcTovPzhRbPSEFA7L3W2LQGt9Qptdt0Y7Iql4dZPI2RfFU/DLtPl07ry
         zX2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829824; x=1793434624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=W+U+I4vJebkEFb5QNBPTCYwC9ApUfixleuac2ENZaWXkwOuFj6DuA3cnaW3c8yPds0
         tHi/WvTYjGDVefxbMVw1K5IsCkrCxG4VepnxhsGx9ZqGiq0iU8X6iCkgER//dJugJW3r
         0D51CHQEWQQOefESyNTnu/XmmwlHjQ+dwEs2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829824; x=1793434624;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=TOXbXs0HDj8Fk20lFzQs+hhAouBRg2RaB3GgwF3ZFPonRzrNWXcdjDNNnntHh9B1h3
         3NWjp784836fCn2fON5KyaG99KmKAbkTzAuigjBfRWgXIq2zbOivPsu1bP5uQxyn2LMf
         LqBYFlNLEYkpa26Ww6C3HMmWbIUR75D0Ybl6U+MBkfb1Oj+Ditw7N1Mm0m9CDg9Hzy1v
         1UnVVbnjtNjFT2p+foXuiEjr0JVmLZIJ3Y5RyypPXx2vNmf+mr+sJ6IePpU81eNhAmW4
         Y7VZkTkVIbfPYrd5eRMs5h0A+iKrzaJSgTqbqBel0Qmf7dRm13GawtDWaIAGrpj8pONZ
         gJPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfsVlTiFYiUgc79THuM1h2CHi/cm+J7PJes9igJBeTS3+TmDvhsWDnPvS9y3yqEhb3CYLUI8lcyqPI@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOlWoMuiU4YKN+NV637NinqiBqKC9+pr7DGToCq3ATE+EYjuX
	WwGaW9JEuHPVvbBneWx7IdC6uTFPOdkKtGj4c4p+ph26Re+T7wJoUSFSUXab/9Vdpj0+kFrDqAY
	9Ebp70PdgmT4DFapsyDfhqNXxA4amrIo+jgzZd+V0
X-Gm-Gg: AYBFou1B/ru0ROuObI1vrNVoxPIh4RS5mwC6OfjUqadX/PpnDu5G7X1CdrTD9bKG46u
	ZPkjbdO5fE6oi9c8YGP7CtQ6qrrWSYrffPUc8K8yPxLiUpe5UuMyUpgf+3xkTZ3eLYafjG9Pw37
	y0le+/iraO6h2Zhskz9OBW5xJ8NZYbZHu8jypFDJUbNvM8ZOVBXUhCZC3KqaUfM4V8SSgEQeMMz
	ALflFNQ0P2sEe8sHrJhEMc6J7It5nJTHOHQqMKay6mLVKzomCyIMRY/K9a8vYOJU/C+dutNFr52
	6IEBSGPmCMLvajQZFxQ+6v7IsefTlz9MmgADUaxhrUwVdGbyLQ7b7o8qFQFPzQ8NwoCHOUvWoCE
	w9l6nVBPrAK+/DyrwOqfM3oZA50Ul8K9lOV4=
X-Received: by 2002:a05:6402:1344:b0:6b1:d9fe:88e3 with SMTP id
 4fb4d7f45d1cf-6b442fe4a1dmr1113081a12.25.1792829823688; Sat, 24 Oct 2026
 01:17:03 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:02 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:32 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:02 -0700
X-Gm-Features: AclHuK-hmUOppF09H1eQU74y6c4oDjFc2inDxQbdayDVgWED5bCCmINGnHLl7Qo
Message-ID: <CAFLszTjATXFecK3ryfO=yVY=C9yt9nc52acFZvxfdu5kqGNvZg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Build fdtget and fdtput host tools
>
> Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
> `CONFIG_DTC` is enabled so Kbuild rules can query and update properties
> in compiled device tree / FIT blobs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/.gitignore | 2 ++
>  scripts/dtc/Makefile   | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
