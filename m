Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829819;
	b=vKq354lpqRO/m5WNeFPj2HRVPLrSzNT32qJR0zE9I07uqaCSlH5kJgVqdD/G7ecJ1FOb
	 vqfspgrGObi2+1V4GeUv31AeKQXwkrsOiMfVpnM+IuKLysGJ8kIdYt/VC+kGxZI+WYnBD
	 ybLJ7yRG7MDd1Lr5f2jsYcO2lyJgLdhDXdh6asjGLSw+PDS0ZplpmB6CGASY7Lv1Q0TeM
	 tbNSCw4wcFGSvIpkdqqnqxZM0H7YnIOx7ixyhdzvEDs3rMwUAfllimT3PQhVhvSue73ha
	 Av3pEAkzE2yTkIcp5QurT9sSL9LlU5NqIql4DDm3urs2Jp4HOr0+DLkC28OzSLYl8cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
	b=4jWmPwppZJn0MVeQ0Qf7XMDegNYVqYpKW8RFa1YgMnsw1jKFP8MAgHJxMY6tKbfD1LTT
	 wKg78xAqxB585qhFFhd8C6LT5IF4mU0MukPg+ypnBDNRRfYPgHioz/EIr1JT3rt9aOiPz
	 k45lQg4BcZIyHK7ujPxYhEJKFv3tQ5uE4Ft527GQf0zXSnfrOarrCiIboVNgsaRuQXkIx
	 TswALh4Nak3hWTBvuGDNvaiGeJW5fuPWmSx8N/EvNj1+ls5epUt4WrgjM1DJEEvecFoUY
	 5Eglvrg8wUSfSKwvgY9Ziv4aLsm3tMhTIHxvY9GB3t3lFLZcZ+iFP4LYJN8v0z0Cmqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="j9m/eYvc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94078606A327
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94078606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j9m/eYvc
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2250596a12.2
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829817; cv=none;
        d=google.com; s=arc-20260327;
        b=TvA9+tDX1PgSNq28n3S+RGzSiDAFOPmTxqS96XfXPeV8Wpb8VeKh5TyHLWLGF+sXRJ
         D1A/1flF8QkByQwrniFAdSI2CdQ1tmIMNnTBG6/gJJ2ZoYKsdjeHNOA+4OYr4FigYlRp
         WUVa9rFYJdDsckLt4h7zRx7uiuLWl6g+tBuoEv/EKDumJzfathUYXH0aBJ6M3EGjR5kx
         m9PMkKZaLvvMW9oOW0pgeW5Gut7FdfxiV+/JiKl9BTE4ucUlP3T/QFrmIL0xtDXm5php
         irVWqpZQeWBLDnsmEURmKYXEfLQV2gSUz3r0+xatyhInf4Llv6VHO7KHi4l2BK5C54lq
         66Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        fh=poBf9kdMKnK3f3zNjbdQRzRasdaxC9UFsxCO1wYBKRI=;
        b=SBjg4tqcEOMXuWP/ip6/TW3ipZpUgqZBYChFovHow3qWM5DfEYQCPQk///vkXM6R44
         Up8GP3rJENb//hH0oLLtA6UfHm0JHQIQv+lMhedEJx+/E4wPhymxboBNrRrrFsD12+ca
         Hy0Sw/C2YGxgnPSz548mZM2rW/1Fb5Ny34x0+5thxohWMm8rARFsNENGAB9iqWjZl2KP
         B90k5jlmcEU2Ql+iOvfCscCLhbltQEkACjrAsxCoF1E6ZMZVe1s8gFcxEX+N46Tyx1BR
         KX21wnlISV24Rm5ssZvK81C54qlmuB4Bk2MZJGB3Gvf+0YbWfDyqoL/IHyV3MBtmaM7l
         VeZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829817; x=1793434617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=j9m/eYvcshaqWdxR1RRPRIr1ItYrA1TN4RRH0Tb/73JTmjyGNBA+MSabq/chQ3jRup
         FDO+bPo7UmRdMpdeNPL45rZL+MvdTWsOwUsOK1L3CWBxyBfvgHY1GMnC7+rnUD+uEALq
         OMq+yCYuInNRftXgM4Yo1DFyaRmVERqAUmQ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829817; x=1793434617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=K8HqGAHNfsTRDkOCp0JknZLi2hnmSeIAKjCHaoLXxtekD+qXnpelkW8qS5tbY/Mt57
         DfWqFAwB0GkOkBNNeJBdWoPIhjgSpm6xfnspLIEZByww/BaNkwj0+bhU+zHBC7HrReUf
         Kaf3Tv2vHxAa2+8hL1aQrW5ptIGBR+/cakpOHnLBTKB7LdJKuEqT4flNmJ+YRmJUG1Qg
         pqCJh58JqZ0Xb3AkxrgoDOuMDXJKYkldCZypIvSMZ/CxfI6icdyg06KOIxYYuXfn+iNw
         IKbNJMp/J9EZgs7+bWwhZRCYzetU/xpcDceIuI7F2U5p3atFwlIk3ZRVPVEWYHvXNIYK
         bYwQ==
X-Forwarded-Encrypted: i=1; AKwUvByx/AJksS0PZcdhtyJM9cpwcwiWU1npAJX6r1QilBfWcfNCBPAsOSxFB9yPnD73zqb+yz6UsWVVfNyo@vger.kernel.org
X-Gm-Message-State: AFq9FYLU3nSRje7IV5EPsV0ajiBOGpbVmQDMgk8xVWVAXHtOxBy3ccRd
	g6mR0zfwESmMJaoonzgIE74uesr9LCOV7MLqnuw0gvX1tNgBSzYym/UzkZOhIISEv6Eaxcv9InX
	45Phgj//rM9Gw0Il0CZfz8TLBJrPca0LJoS0koKh6
X-Gm-Gg: AYBFou0uR/ZJLMkcddi0ZiEJSf9bZsYI1OOSwnrpXgdeBdbkn8KsqsGTyg0VG6iONLX
	JodF1PfXZl+pF6wNVYZsZpHQ2TZbZMrLBRlOdBOyq3ztv5FshNRPvJoXCVHyZ4epkC/p8+cboD+
	VNUaTDXD/BBYV9IydSwxIJpJhiPlQHugWu50CMJZyw4z+gjmzCqBfHkJyQyQdq4VNeKF1H9TxBh
	vl/tiyAbMT0SHXrBmmFZsCKActfI0rpJXjpIetz8FR6ONMuiSF7LeKbjzN7wUxHaHv+3VtWuyML
	Ka3sodsDCRSa4w9szhBnoplwAW68hiJz6s3Vhu8tAYJj9J1MPVBM3GeorFeWGByfk+8yhKuMDIT
	6vptprIyPc2ZVeLrozFX+QltDGlbiNnw/+aI=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1152906a12.26.1792829816963; Sat, 24 Oct 2026
 01:16:56 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:55 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:28 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:55 -0700
X-Gm-Features: AclHuK-X20URHOUw51jVSQxB-TyQaLgWVXdt5sH3O8YNafmV3nonazmm4bHkTWI
Message-ID: <CAFLszTjoZ=TZqW8BTFTot0ZRcv_--BYZgdOCUD-rv6nT479--Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
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
> scripts/dtc: Add fdtget.c and fdtput.c to sync script
>
> fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
> cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
> of update-dtc-source.sh, and were never added to the sync script.
>
> Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
> kept in sync with the rest of scripts/dtc/.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
