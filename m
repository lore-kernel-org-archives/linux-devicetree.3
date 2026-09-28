Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6EC4DE702
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607170; cv=pass; b=pjk6k1Gj57B4n1exNcEGoCOCFIjxCar6DczvyGJ6uYMYtvTRtzLO1nCkC5bF/3jSiDcgpX7923jrubTHqp5xqMoM+vNY2gMTqMA9reVm/yKHl+awCurFOZOIk19lo05QeJxGSYixRw+1EXNOIfFEeHimck5T2oPtiGV6Ex5Ua3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607170; c=relaxed/simple;
	bh=zwdSz2w253UymLEvP+KLFb11gn2H9KNoZkqnPSepQKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/eBFTFd2pcuBgqMm2q4ZGVndNeyaAt7BEtBOAh6HZe7NJAcCOKzY76lywAIOxBZFbyfxis6YuWkZ6/nyfiwukXk+wfD9pVlxRuOUE/77DUGExWcSkyq8wgnGRCM8TJnr32a9J3hFURuCJa8VQ0Fnb9McDQ9+bPI5ozzwJXI//M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkDvUUnh; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkDvUUnh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e6ec4e1dso2306798e87.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790607166; cv=none;
        d=google.com; s=arc-20260327;
        b=SMEtNvMrTV0gy5rJK+sAXFuRNa+I2uizc5ZW6cXB+6LRGy/sUZcXi+d/GBEnQAfmby
         1eNgY2656H/kytAYCaC6AOui6NZGfSNmkmP6syHy4QNaHhFOX38W8hPW2b66NkB77l16
         FSmm3hMATrcJBQR4cqbX94eVw752GVGvqjK6jqiY6jBF5pAF2FbUSxvwJNnYy22O35y0
         U4GeBPHQxzju6z9/2kT22kFyM2A41SlXQwb4weeFkcoLgI0+iBWcAsVSL8YsGLQMloVb
         5iKWrGzl/uqyc+1j25W2qBO2QBAYKoEukybbI8EFwvnmrziLEw0JM8/bmwbJfW/Yi7xF
         Hu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LayCXAFHVmoDJ7OzuMd5bfhOgMn0WjtS+zr0t0p63QA=;
        fh=5bJVSuJT6w60arVBsv7t0NBB51Mp6zAlosiFJhvsw3c=;
        b=Eik4j4xp7KLI4haC5MflONZr/PjHXbYphBv7WMXlOEjCcvhAzoctKQ5SVGwOnL6gen
         jtFInb9j2iyHcHtqwd5C6KoM/Hi4VZxjVDWLMjFWBCON9ENqPlBVvSArh7BHqLAAGY2p
         DcqgiF5P74wdMQdrqu+1ZN7qa2ciLLLk2w3g33RrukAUTUllz8PonK4VtNwgp+jFFFUf
         vMadMk86HqJhYmm7YItHABMlwguZ1AeGIEMXrXu4ldcnN+bEIUwfU9VXTyIO5CX0XVJ1
         Efgeky+iqaLL3i/0CYqAAfTGw3naUiKGQitKxfUtj3Wpg1xD8YsCxFJ9oXNKVSX/tgwS
         XJGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607166; x=1791211966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LayCXAFHVmoDJ7OzuMd5bfhOgMn0WjtS+zr0t0p63QA=;
        b=fkDvUUnh98mM7Fxswg9mMmfKrqic7/randob08kokX+4YgFifJDoqHl7eKV8t3ORAr
         jT/t8sh7OFtboMudetdaBts0I/dG5t3RtO9RR82qWOUs81PwxTD8ScQAvG4kRQzqwb9Y
         tuAFZYKIxv1+k+IL8y8DMlSOpANqtRilmo+iuXcpZj+Oo/jlH7BPV/eKfFDhuOh9zs6z
         51MDlY8E60Nqn3zTrcWuNklgqznJ6qi0VPoJdqVvCActml8+DQTP+hSJ0UKYCkjcdlug
         LW48XSvQAi5+ERg+KOQ4QvP5viRtjLmzelZlC58xrS+18g/ddoDV9hrqQT+UcO5BlxK9
         6REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607166; x=1791211966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LayCXAFHVmoDJ7OzuMd5bfhOgMn0WjtS+zr0t0p63QA=;
        b=kxexQMWbyvoAJbm1qbKpZGf6tiFMUG6fsz7BVAPB+eNwzbxZIAwAEO4mHWcuDHgR1l
         yvMUx+SpjJn+P9Pk37ZLuXops+125PECVFh28CDyL1NMsyPn4/rV7cEz9/Tsf8pVdG7d
         Prg72iF7akKmFiUanYguVVTrLaaFOJyTsxPq5TePTwTIEwjyQnZ5jCLogr9VHM3g0IxE
         Y7z8Qft3D/EawY1eagcvoxfie2c5HwDKXQWs+jH9EyoQ1oyOQGUDf4vcl2HiCAk1Tok7
         /ko7Prh8pcaI34VjdpEPO02+5/Z0NOv7/5bdnjGeYVr5uEzz4dHZWMGzm2nuH4NBip6V
         1Q7A==
X-Forwarded-Encrypted: i=1; AKwUvBy+Ku4hVSWIzvklQO4z0lIHdhCNuhGPasQpd/w303PURWKNvsOKzgQqmLL8tnHJ55uj9NJvjfsTB2J3@vger.kernel.org
X-Gm-Message-State: AFq9FYIuOl9Ahxz+whXxLS3xYMvF505FA6hNinYoGdl7e4LswXOf2ET4
	98w61PzxtvxJDkZYjwhhC96Coe3pX6CvvztSf5JI1QCl5z81y0Q4v3jD9Fotu7zUqwy3H8h16VO
	Fw5HVKAgQpvDI9izdPCXtHHOYZHdkjEU=
X-Gm-Gg: AYBFou2e6wnS5i9wy3KCqJdvSxQxlUXLMJdNSM7OEtmeRDDR2zq7hlC+WHzwe6ByGtp
	MPvA9BegLIVwai5WrzV2sSpS9E7rkPR1Y5RJY3969l7MaPQCwbZDwwHMJ9MMO2mnTBpaXXaWPVg
	gqP7sM5JXD7ivGLyIPe/MnRPat1+7fc1MdpFaZYOHB4hCQ/xfDdee/QXw3yG9Idpc+3mfYFdfhR
	8I3g85JUIDIYxOh5wkQ5mUvwPkTnQD6+Vhwo2GWo5860y6TxvquMTN1DycBz77OcvbV4Iy1Nt+A
	fmmWKDtgEXe4b2QhMnC74MQIpFLFv8Gk8zQFFpPdPMTeLqtWaa8bDRqUIGdmRFZYRXZLSbykood
	G1xmxvLGJX3ZrWZzjRcT/8hEYZeekdbA069mAHQa0u43p4rssKW3qe66jXRDKJL4Y2QxmY01m+e
	kZ4F+pvu1hig==
X-Received: by 2002:a05:6512:2396:b0:5b8:f417:dbf2 with SMTP id
 2adb3069b0e04-5b8f417dcfamr2127641e87.45.1790607166317; Mon, 28 Sep 2026
 07:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920193944.110983-1-kieweg.leander@gmail.com>
 <20260920193944.110983-3-kieweg.leander@gmail.com> <349a5c40-5cc4-4e24-8e24-4e05fc8a7bca@suse.de>
In-Reply-To: <349a5c40-5cc4-4e24-8e24-4e05fc8a7bca@suse.de>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Mon, 28 Sep 2026 16:52:34 +0200
X-Gm-Features: AclHuK9TPVsBjaiGZv0TSHgVz7QThaWnF_VETNU5oTwrNIVOU7PP1d6BRDXXjHo
Message-ID: <CAMwcS0jd91B+9PvYeZTC+yuOxMc7hO8-Q0YMbXE51WiFHnvpWg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/glanda: Add initial DRM driver for GlandaGPU
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

> One remark on future updates: I assume that you want to further update
> or extend the HW design. One thing you should certainly add is a
> version/feature identifier, so that the driver can distinguish among
> different hardware generations. We also cannot merge support for
> everyone's hobbyist hardware and you got the benefit of being the
> first.  So for future submitters of similar drivers, it might be better
> for them to build upon your work instead of coming up within something
> entirely new. A distinct identifier will be helpful with that.

I'm planning to add a hardware register in a future revision
that exposes a version number that the driver can read.

> Is there a reason to no use drm_crtc_vblank_atomic_flush() ? It's the
> same code.

I will use drm_crtc_vblank_atomic_flush() in v6.

On the QEMU device ID: it's currently a placeholder from the
experimental range, since I haven't submitted the QEMU patch to get
an official one yet. Is that fine to merge as is, with a follow-up
kernel patch once the official ID is assigned?

Best regards,
Leander
