Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051122D73B9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811964; cv=pass; b=FiJdaoXCB0zY11k87dtmiSW9M7QE6HxO6FYLFzBxTX72Cz+4+OS7JYYdnHkhMyljwZqihZSJSG6nkI+KKF+nMcp5J9LBeuxxcVDW4gRPH2XqpBXnY7qde94S0Y+h+qRfnJLMppcooMwdUn2B/W+7sZ7W+2+/RwiZyqu/uDNkKpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811964; c=relaxed/simple;
	bh=NDjkwfI8U9JUA3ny3XAbHQd6laguvZjtJXKELmljb1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQ7z38LYwXrICeiD1Hq2V/icO+tq/ZyAyKwfYZGCAEgvxiL+EoKTU46jGYyws8IBmpWVeg+o7Ld8D+uIGnfWDaz9xaKVthdJ9LQiEqPyPxhXqE80RcW621rw6eoj9yJfNqLHa6qhZ4XgaSGci3UaACmEFlTA8QKML1/6L3T9C+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFZ0+Pbn; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFZ0+Pbn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso25131115e9.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782811961; cv=none;
        d=google.com; s=arc-20260327;
        b=QxbccizVXnCCLtP465prkfXCbY4hvDVrK7K6Q8cyHTo5S02a5wMp/+BXYpki18qrgy
         KSWVvUYUMNg09azOkm1rTLIEjJVCOnLteH41bk6tEMZFpzf5nn74xajEmZp1WE/9jyeo
         StJ2Jl+j9HTM7IYcE/cGwgMv382ELffsVhqKyfBiV61lOaXFhC3UEeQEz9sHrN7XWFWK
         jTvPlaAPL4Wd/PKOMQidSJMNS3BRe0mKL+KIEeF0kilJ+kI4jLso6A4Yb2qnmYJZoAGn
         1m2yQmm7ZAuB4kKPYL7a/NBtQpAyC+z30xKgDqflr1KPL5cHNynxTauqg1M3zH50DH+d
         ZE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNNQ178ENgLjQuyBEnkfUDg4xhb41skAqKUJEt7HN2M=;
        fh=EVh1bj6hVFgDttRY28odj8La614x3eb5YQwPDd4Mk3g=;
        b=SRDiWkPZ6bRyUR5Yi1LIXUqSPryzS8AqgbSgAOlZz+foRqbjHN+XTmStNBqCdd3geJ
         uc3XeVWwx1Hf9oJnnpFxR3DWeZSuyZ/J/VI3+x3LIlpv87rx+THK090DPg7s7JmjIopa
         xyhgYpWJWzaPGcXbOP4xBH8IR55s8HzTuFvf46cFMHE2DSupDHvC90/XtGs1XxTniniI
         pw0cSGZPxrXdQz3RpCIuBvVOXlFy/FuO72OLyd3RUFWN0iImFS5ztGxEwSA0akh9PnEG
         zCuUgFDOMqePeerHCtUui5Ce5NtN7uLqHs33o3y2kUgcArrQrwXibr5Vh2eW2heVpWCf
         EZVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782811961; x=1783416761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNNQ178ENgLjQuyBEnkfUDg4xhb41skAqKUJEt7HN2M=;
        b=DFZ0+PbnwwY1t84P+ppJtGltmBvpP304Mhb684NiUbixxMoehdYp5W/Sz1OeMO29Za
         jzvMIBZwNTPUJsMN3s4Uc7E2PIFg4YugAAxxa4/WAxSxT0Uce75qG9C3V093p2b7xYX+
         AKSitEUg94RjRW3bWN9z/C92iDgaGmjPG9ziE5B8onrgY4ZPsWkONZj6EEdrUiBtrMe+
         P7dFre4iBA8AtDBdTCH8lCsCkkYPhJsO+8daO731V7//FNS0Tvp4ID4sy4RAsguHM2We
         XEx7orJTki1aB+WNv2VV/cntNwhzda/4UDM0mBwWaUIialPqtdVvGDyV8zD/uWA6n092
         eeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811961; x=1783416761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NNNQ178ENgLjQuyBEnkfUDg4xhb41skAqKUJEt7HN2M=;
        b=Tq97vfRsJGSwSZmBlKSAdxc2vsIzvapZPQtfkeQnzXmLVB79m3aOFM7SgLOza4VKfx
         clU8Tn4cqglBI0jJ3RGx3Ek15Sjk1xtdhherTfCpiQb4b3MxD/BSP+AlxmZ0QSjaTP+S
         IAeyvAwOdN2HwbSJk6npBGXa+y54rjADwEc+E42DNk7Cyj6I3GyOcR4b10vNd6huBlkq
         ZDHWRH2frYASVqNsn/kLS9tTroMz6egaooM8niTmsiiFRGW0QI3kl3UGpeZZIw3Xfqwt
         NaTZYZBlzdSjBl/64V0LtOxJ8/joonfYuMHSwretWeXL+0RARHwzDixRz0krn7sNUZJi
         LUEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pdY03Bz72X78fdSN/fr8WcBd318WRxBOU1AWritlV4DdXfgsdbziyBxVq7eNsatQGm73RbRNUw8tP@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOjGl7XXXJ8E9B71zwY0nXHycmOIaP+6oWGexo5Bf9kxLhEfj
	PrhC6HP9dO5EwXV7tiVM1IndjKWCTBS6Yk6ZyreK8ykl2zt6kJslRhtbYzWK62xKKye3mSCRwaF
	Zo4EFA5QUYh7koE3b4YNgKFWgFwMhzUNL7DSuazs=
X-Gm-Gg: AfdE7ck9XOVDhtTqQ4vW4CscXzYfBCk9rGzOtxU4DxopkcZTwasMXdIkf4JxuZQiU1Z
	NV4RNX9p5l4Szpl+MYvDz2iwwdH+wJQf01AsP3Lo5WfZJIR8hSJ1aYLm9QZccN+FP4zRfpl6r7Z
	T1EsuF21+xheBLujCBn1jjyWKYxBrLw46265zsT9ROBDeRLEm/v7/AriWnJcLH5b/t5hflY28Ud
	pTqthb8ZvmuNH+tHMv9xv4Z+jINVxDcAYDHD8IE2FZdxEKlgk0TyAzjuOuVZBGTYNymQWfOXYRx
	UL54zNWJYbLnd8/yP+QbgQAGDFfB
X-Received: by 2002:a05:600c:698e:b0:493:b34a:a25f with SMTP id
 5b1f17b1804b1-493b82acdf4mr39230555e9.22.1782811961270; Tue, 30 Jun 2026
 02:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com> <f9c24109-f480-440d-8658-84033fdcf9c0@oss.qualcomm.com>
In-Reply-To: <f9c24109-f480-440d-8658-84033fdcf9c0@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 17:31:10 +0800
X-Gm-Features: AVVi8CdiuKcrDOYkggRWbIOH-hiWJPwJclw8ylr2q98ysBV-hJ7fxiI45KXKhb8
Message-ID: <CAH2e8h6emYrHPHYJbBaOiExNDjQnbbDKxE0NdiUKKZVovR9JGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> > DSI panel driver have been added for a while, so add the DT node to
> > enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> > describes the wrong, no impact after manual disabling these wrong
> > supplies.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
>
> [...]
>
>
> > @@ -616,6 +663,9 @@ touchscreen@4f {
> >               hid-descr-addr =3D <0x1>;
> >               interrupts-extended =3D <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
> >
> > +             /* TODO: set post-reset-deassert-delay-ms */
> > +             panel =3D <&panel>;
>
> So.. are you going to add it?
>

Yes, this is a TDDI, so the timing(ts after display) is required,
panel_follower will handle this.

Best wishes,
Pengyu

> Konrad
