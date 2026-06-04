Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0EB480945
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582826; cv=pass; b=D8GJVYmOgkwNMlvztjyffQpJHDpvep9UD7RmL5ic3u5+b0x607nsr8wm7q5l71TqQM6mRWVTMWqfUMCJ325tZ6Um/tBrIkc84R0IgWWPQVOeZDq8+LjwibHWrTIUXibq8wI+JY0DaF8cJg4aYNtFXqp6tf+lEZUdXwLyG8aIRT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582826; c=relaxed/simple;
	bh=UBHDs0KMwEJOWexVy/nKJ4CDaJuMR5YSOX1Tb1qxhHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lp4Ng4g7B48aJOQ4HK+dlQnVNhII33GKLOeI4I6gFom/dcHUMpR0lFep+yrh5eq7NI7J20A25ILzosXdsTcPpSaAA0XMpC/FLdpoqj/F/1nC3+cw3S6woaOtLNo/vrx+uGQm7purUbCq4nGYmpA4ONXfUpH25iCsEp75bA/jZ9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=l4h99/Js; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b="l4h99/Js"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9156b74006aso54580485a.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780582823; cv=none;
        d=google.com; s=arc-20240605;
        b=Nh6gY7m6/RtfsML+Ck61taLvrDecsGFHRVH/VnKS6vnHUrIoHy2sUooHgXjwj8cfCL
         7OpgBqmjuhn9SzUm0z1pIQdfvbPSIfIFqp7TRJpDKjLq3N06lWyNjfd60r4JvGE7/o2X
         AFHqvVuOfHlE3Ab0ijd6LFXUuXjs8PLnK0CF6tAQBP02JxrBQ6aCKi10xjYX6RlaL3Uz
         SE9YEMBt0fZzctikOQKV4MIXTQ0+pxzRDXX7KulsCTazPuDeQ+3qk5QJ4CCs/dDClwPk
         PPt5kVvBpDE8o0lvx2zkAiir9vwe9mjEuwsSyaxDkxGOgfomFuKYooPY+IeL94PQ+RLM
         /OeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=;
        fh=tpeA/8CToTmS7fxXpqRB09H6GdMd7NTkk1HAk418nG0=;
        b=eGBXtKUzvaeRzhXvLUL9VWffrko8nJLdIu6iU/HCSCPlUgWWkOiAposm9BtUGfYX/7
         kgF9LUtgDC0Cf5W2Ka9Y0rBazKcFQMGWRz9/4VOQ1V8RzSprmTIhSA8+ogPM/PwSUFcc
         Njf9mLCm9M1SG/WjYJ8r/mM4iW3lnYX0CbWq+xqZ1mg7QDaxcIekn0R0YgOJ04Li2Kf7
         5G5tTrZBMFQzzmkzqC64Mc+/kNMizGNWxD/scuP3e1zijob3fPZ0JDvxjn5zvFN0oKHk
         XDdDTiVjhHK7bFpoG5SMM8Xo0L9ziZ+fPA4pLrl819a1AiIBKAXpmbHvWM2aobIb3C03
         Rd7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1780582823; x=1781187623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=;
        b=l4h99/JskV7NwNV3nE06TYP4kemQjxF4MeUzOqzYDXFT9WPZJMPx3Gd//WxaMS3uAu
         lY12F5eN0wSBmAkZb6vzpkrRMIPqVQhFgRs077B1jRPiNJrN6s/tR3vtpVRWAYsp9QAV
         xVOshVrJ4L++f2OiD50xjRgO4epTGJmEsh9t+h/vD9YdbqUs3rRttYQTdq4vJaJqfqjz
         X3qJkQn6ukDqElJVEOZaLms7vcif7CGHE/UyZheFkyGSOy5U8r3M8gJxcy5QmWte6fHU
         CQvZtCqEeT2AURM8JUMPUxKn/z9D0EMatXDfzWjHFqf+pilpxB+JBkBomLWEKXq4m0HB
         oOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582823; x=1781187623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=;
        b=bZVm6F+GLexI6B3dWuJ1VqhEydsFpq+BzolDi6O3plLSAwOn6qIimxmWJKh4gMY2B9
         5X3KExtWOcNf5YZxa7K2qSHGcR/+5FN+g3f92qd086yFBk+ncdABsRIYW/5F7PQWdeXM
         WTtpf1F91QRm0s9DhvoDnDOx2DnS23gEa7wI6mpCp+LgR//0zcTDw6MRtBOZRaDEi1z/
         2ysu/zJbxfa7B0wFKLcXeJQSoIcnyWwhJ0h1GMTve6P8f/pHVZfgdv9WQ8uk6E0RY0Ha
         z+ph4Mz+DoRaFOE55TnT5T45U46EvZKqGP+VWgBNVMi7LeXLBIwSx4hpWFO7E4opeOtT
         S+tg==
X-Forwarded-Encrypted: i=1; AFNElJ9rGtYJc7oNbUEgzb7VrfukYkjaMp0X2uRs+VXY2f6jvkO573Ny5D7zGBMDDzddvKLm3aeisCIHbaF8@vger.kernel.org
X-Gm-Message-State: AOJu0YypBidIG0+tDtYGgbmohSDwBc15tCSMekTx2uHmAZJHQAPyeYlP
	jY9XUFSZLdJ1BL358yNbGhwG9BRx1YMhcqLPOEyIAcesIM2erwSkJtvgPOXt51ELvre45OC0T6n
	B8HQAo5ZsqMi4GBoH5dfNwa4hhnzH9sUX9ZRXPG3RgA==
X-Gm-Gg: Acq92OGXkL5GXw38dzbUuyzVC8wqsRKuK08YbmW3k3U03nMsgsk7Q3R9xvDrvi9vB0S
	1oURWb5HVN0wrN7AFkO3F4yJgWGYOKscfSN9QJ9s9VnS2uNrK95BJhoUBhb8qqfQBkPnn19oo+6
	03XLGql3vdy1fPMsPpKEW68oMX2ongoNkw5Qf3XKjGsA9b8d2wwNhpfDkd13+2xbO1TInAgxlqk
	8dDk0q8KMk7G63iaf8B7cBDeinjBUEVZhNAusj1QGL/2ygGmPdNZFvmnRk03O32mBHPCLovoDGu
	l/adQYmq9RUk2wNr
X-Received: by 2002:a05:620a:268d:b0:912:c0b3:7d9b with SMTP id
 af79cd13be357-9158a76739emr1272633085a.24.1780582822784; Thu, 04 Jun 2026
 07:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <20260604135255.62682-7-midgy971@gmail.com>
In-Reply-To: <20260604135255.62682-7-midgy971@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 4 Jun 2026 16:20:10 +0200
X-Gm-Features: AVHnY4JQeDtrhyq7YBnn9raVEBX1uxBzeM4kDcgUj1eAV9LhKWI5-NL4FjfQpnY
Message-ID: <CAPsqS2RYjf4dMj=Maz1c2vViW83ZsrEW9eOez526eh=TsKvQww@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the
 RK356x v1 IOMMU
To: Midgy BALON <midgy971@gmail.com>
Cc: ogabbay@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 3:53=E2=80=AFPM Midgy BALON <midgy971@gmail.com> wro=
te:
>
> On the RK356x v1 IOMMU, RK_MMU_AUTO_GATING resets to 0x3. Bit 1 enables
> auto clock-gating of the page-table walker, so the walker's AXI master
> loses its clock between transactions; a TLB-miss page walk then never
> completes and the IOMMU is left stuck (PAGING_ENABLED, never IDLE).
>
> Clear bit 1 (keeping bit 0, the slave-port gate) once paging is enabled
> so the walker keeps its clock. This is required for the RK3568 NPU MMU.

Hi,

I'm not able to review this patch myself, but maybe it can be
submitted separately while we work on the NPU bits?

Regards,

Tomeu

> Signed-off-by: Midgy BALON <midgy971@gmail.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 4da80136933c4..e3d8b6e9ca12b 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -953,6 +953,18 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>
>         ret =3D rk_iommu_enable_paging(iommu);
>
> +       if (!ret) {
> +               /*
> +                * RK356x v1 IOMMU: RK_MMU_AUTO_GATING bit 1 enables page=
-walker
> +                * auto clock-gating; the walker's AXI master then loses =
its clock
> +                * between transactions and a TLB-miss page walk never co=
mpletes,
> +                * leaving the IOMMU stuck (PAGING_ENABLED, never IDLE). =
 Clear
> +                * bit 1 (keep bit 0, the slave-port gate) once paging is=
 enabled.
> +                */
> +               for (i =3D 0; i < iommu->num_mmu; i++)
> +                       rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATIN=
G, 0x2);
> +       }
> +
>  out_disable_stall:
>         rk_iommu_disable_stall(iommu);
>  out_disable_clocks:
> --
> 2.39.5
>
