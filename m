Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF63DD507
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973801; cv=pass; b=ZwthOtimK3lDmSUhKS35jBZhpM/yANqEmSPi419Tyb9FGtaikvCCdiUhVO8zM2luWj1yWAjTFV7UvkoPTCzktMRrcmeGXmCBMKl8YPBAb9SUk67jCsri7Mdm9UsKsi+eZpH6deJLxeqaTMP9fRWAAzhrexPTdeHyRS8CsaLHJBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973801; c=relaxed/simple;
	bh=PdXUuqEb8P2nLtRABdAf1D54EhHyDpHz88/TU3e1YPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmoQea3xaIuHCHTGHgGvVSsYOus++CsVOCazXZOkTlWsPI2+ORW28CKGqe8Mz1o7iXFdUDQWC2VMaFPSrrzONddkPTH8Lg7pTykbQ/nP1gBIKk547LeHpnOFtxVx1/pJOLJRVigFWW8a7Tq9N68bbRCGpD/4wWDdanyG7/+H8Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qkR/+e6r; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qkR/+e6r"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so59978931fa.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774973798; cv=none;
        d=google.com; s=arc-20240605;
        b=VysFae2ZEaMIyJJbyEfmBtv4v6LrvJi9SBGO1nz1tOy37di0ah18YJm+st3lNd2TkI
         AwF2vix9OMwMr3t0HwUka9RQmZ6WJBNyeRHh3le1b0JpKFF6APyJ0m1oOmhcU5caT3Mv
         FBjNm7GSef7xHv4VSB21Wp1fnFAOx6ZObIeTGGYcSLWeGD9BoxG+JjN0wyEN/aRZBuFp
         jykT6RDH6ph6BhZ9DQDgYvGvh03akwBcpW+n+cD54pH9akmmhMQG4NSuXw+TFMBhw7ax
         XIAA+oRaIA+7TQQgOH9CpInISL9arYNwRJrWVweh0297gvdot5mYPvOowV/OKHT5tz69
         BvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fYuenrYxRs1hIaVFfS5LtO+C2IDv/Kg8rgYUxajz2pc=;
        fh=t3T1KOgQSOhkvkepoMg5m/zhtfRigLPXYoQpCY7JD1c=;
        b=ljcv+JAxADEH+lK5OeZnG7xRsuzXBHtMe5ZaxP3t8G7UsXpl1H6bS+BSs3vSmnNZle
         BQJZBiqPPW235nSw1v1alfkqdQzGLJDFVX5dfNChnJkr2xAHyNb8kczOL33B2lkP3fWV
         288euK9Z+r19uSXU8nBRESFPIIZxuNtxxKaizX/bzxsHkE5iY1DLOXEXsJpq7e/7+YCg
         HHP3QY9ZDQpwfScuGAHtQ9LNFBZ/6LyZ+g+84bqDNHnG4PxLzwZTGsWsamC5h6P4c04D
         b7ljxseU2G2zvHIxWVTh5HqiJPiVj6Cm7da4+JsPj00GZJ42yz0X3sEb3y/St0OTDoiZ
         HPGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774973798; x=1775578598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fYuenrYxRs1hIaVFfS5LtO+C2IDv/Kg8rgYUxajz2pc=;
        b=qkR/+e6rSC6L2YeCDzOPO+16b+5+XYdYBzx2UAHu6ZGClEoe/Pl9npFO3+N/VONfOv
         QeqfgZDj8+wWQwvPhUNqDQy0P23XzLhGiqNyxL/Ek26f2DiCEi0JLWI3xnoXBC0ok+of
         dMXW9TVBKNWinsFa57dcOpOKfPUIfAsZn/FXUO6v/x1CJf3Dagw9wYrBOsE1AXtTsPM/
         qntHP0n1hAVv43WSbuw5MpIIORyEqOzG+MKHzDI5d25S4Sn7sKSLTKWjWjk36SFJiJM7
         doHMQuTZ6nyxjWKAP5CGzT1uZ6f3fBmH9J9bsesz7p0IGE0DvRJTApJ6LhhVVdXR1T6h
         gmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973798; x=1775578598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYuenrYxRs1hIaVFfS5LtO+C2IDv/Kg8rgYUxajz2pc=;
        b=KeZttRZodhjxxKBMDWjiEMtgFG7bbS/Vi67wW4q5SEtbWwuvfD7AlgWpdcXyNUyc81
         sIVsMoKEYSbn9BcGdKXsgCwLIl3BO6donhsOI1ABqQjE7BL097E+QAvQFj+8zZTMb4gv
         nLetVG0eSfW3PqurpfXvQtLQHgYe+TETvHgZObfD+jXaSsNHv6c9bAAcQuYkYxPvSwNT
         QoRjPe/7L9L1AnWAN5m1ekSr8WO71n3E+jjoPqRHYwYIEWdgg3mQVOC77g6YdnqaSu1X
         hc3HLWZVG32PQWcauJ3fPkScYCWGcvKHXxhoRiykpoBXb0w2tPfITjBvkSQRBlM9g6RI
         xklw==
X-Forwarded-Encrypted: i=1; AJvYcCXEf8Sd8GGZVNRgO+13lMtpjea0rEGpHRyT5ztYdS9pBZn8J45hGH3rLxuxtDFG2zztf49TjPDM8TTm@vger.kernel.org
X-Gm-Message-State: AOJu0YzeUZQf8bq48vGY1J+3dK06M3XRaewqcbb5K+39cqWnCds5hGJ3
	BAp5njG16Z50Eg0lqj0hD/+jCKqQHzvoEA9fYsdlYhY9pVgdSvToPv3RGuiXoQF+afKl/GgeoGp
	v4429kZ7zMex5G3Qzrl88G1caQdaAgN9RRd1f0+MFLA==
X-Gm-Gg: ATEYQzyXCjslzQxZGFNXCyJR3ZM7LBco4xeUs11rWkiabDpKOBsUnf0t0kv8HS85u/3
	XKhqg/nj7WUN6y+EIyVyKEV6/k06uxjwm5IF3ydbxFUdDk0CXqs7Bzq7ujqXtpTUSKHLKrcd6wk
	XrvVM7OpjOgPecX3R+5CJdqPL/pXMbLAoa/PBRqmsWHdD6JrWFfny9IMY/RAwz+5U8uKNQetVdt
	CRSRAF2I1rm5DkBOSaT1I1WRdLmWr53x3Aqqbb/LjVDKCjW32xsbR47PYTIxm65gz4r54QK4ViK
	yuy9aoGB
X-Received: by 2002:a05:6512:3c9d:b0:5a2:7e5b:5a48 with SMTP id
 2adb3069b0e04-5a2c1f1971emr25224e87.26.1774973798287; Tue, 31 Mar 2026
 09:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 18:16:02 +0200
X-Gm-Features: AQROBzBFDKvBTS1qjOaIkCHToGwWTNjtaDfuibyZ6KRUHSwe3KLJFjsj7kHYFws
Message-ID: <CAPDyKFrTto5j5UeNOmmUa0dW5_StgRAgN3o3YvL_wTAqE5LQZQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Add USB2.0 VBUS mux driver and extend
 rzv2h-usb2phy reset for RZ/G3E support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josua Mayer <josua@solid-run.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Mar 2026 at 19:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Dear All,
>
> The series adds:
>  - A new mux driver for RZ/V2H USB VBENCTL VBUS_SEL
>  - Updates to the rzv2h-usb2phy reset driver/bindings to support RZ/G3E.
>
> Merge strategy, if any:
>
> - patches 1/6 can go through the MUX tree

I have quite some MUX changes queued via my mmc tree for v7.1-rc1.

I can pick patch1/6 as well, if this makes sense for everybody. Peter?

> - patches 2-6/6 can go through the Reset tree
>
> Thanks & Regards,
> Tommaso
>

[...]

Kind regards
Uffe
