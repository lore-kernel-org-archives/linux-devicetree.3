Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E140F746
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802627; cv=pass; b=IspM2Au0ufi59xI2nvqf/bIJjzzgVmpT/48aqQmtJPhS0ydNE+brDyJwkRDx3TJAwkMIYN8f4PSMibeOkwzDakFHfqCk/RdeKyyHYU/yKNdN07XCU6KM3IRx7fBhNLltTlFnQYz0fJPgD6X9Bf/wWAmGz0Ag6hKx8MUUiiOhizQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802627; c=relaxed/simple;
	bh=+kueSqtDkmmifGfg+cVRz9fNJOmsRyFdj0JLziYDbAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeQS/MlpWnybuVMfWmRma2aJ7Y4Uap3bVVISxrhU1iKT+HxZJSWfp6SJKGntMImz6bRAqlhUeejHogfpsoo/zDywchXxkZ/b1Xv53oEmY1+VyryHr/XpOgSCtH6q6za9IOzJuR5by7HXDxfUH3Uv4gzQ/WDBds9kTx2GeRO9mNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/4UMKz/; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/4UMKz/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2acc1e170cso281144366b.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802624; cv=none;
        d=google.com; s=arc-20260327;
        b=ppBBL/GDZCJaNNVxUm7t/Nz9SaNTMgYCoGfLgxanOuBizNl/rlM2drBx5PJNr1frQG
         dPhbJ6KGHwyrkfy6Mk8FQA4ZhVGOTyAZ2MXsLxLInjcspU9T8EP3PQxRlvn9C0uMK2jT
         unmQaJrGXcQ0KXdowgS2GJ6XJgE2NJPFEBTyYOUA8qq2CciMxOJagzYOoRzgRMbWU6Km
         kn0T6ydav91IKejwmJ+FeR12MaGsv8kx4e+vp+3o/Pl1GNuFAIbCktsW/wTvy4Q+6Qzb
         1mVwRB0BRHIK7xllYVLRt83CMZg5fKQy8A3UwtfnNu1sI0+jkg57IvQtfeoUQjB3pgzp
         m9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        fh=7xxxUZjt4grF9P7LFh0SHXzjwXXpL/RcbbI0IRbwmF0=;
        b=nW/e+5f2pbxLlJhYZETxYTum56pzTSdQcCSPX7Iez9Dz6bm94si8D8sSmJpz+m/Erb
         8htlgNJ3BWuqoItIRK1btc1Ayvbt9EWGWiB4cpSVWqha3klnaNqmMazghBp1OKlQw9gP
         8f5b6tNxsCVHdaKliCLkY6T+kOoySGUbAdlhOGItwtLMcVExR23U7L5YKlF7/UYli6X4
         eCaLBR7OcfFVz26gp2IIoUdn7P/3kdzzDAlydCdjEYfxvzJfgnvDvD9jVQAJyh4oOL0O
         8+8wqdTbhsvdrww0VqjRM6qTycdxeaiX19N6hBrfg9qYSMVKqushtkAbUqKzMiLFYCQQ
         QgVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791802624; x=1792407424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        b=F/4UMKz/k/J+nvY9qJtL0iFliLw51eQwsSvFWhRQ7E7GvumHvQEifOuosxqrUmFOw2
         z4fKtvAhliQ6VqQZ4spvsNH7jcioOvnM9slRCLAgT2GWzztWqUnoX9KARERu3ck/0Yvs
         jqevguxg/dTYcUubBodXYff7Y1UDnpHTeFn0/6NnXFrWkwTb4XDG+WyLhqXYbJFuZGmi
         xeLBp2Sib+351Yu6eivCgeTnnkTJMeIAF5WMmPqMQP4Y3UXNcRlkqz6wZhrsTOQs+swJ
         qaNm/4HdTuEJLPFsxe36D0xZ572gnTLPvGaBnHsQcrGwGDS3WJA/X81zUlDgjqGy0DeC
         51gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802624; x=1792407424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        b=MPTIYsK2gKojrU3m6FjJYd0IpXNRLgHFKvg42vHkL/kAdcAcQYHyCmoYbQiTCEn9tw
         PdmwAzpXFsZkYrlHDvJCydvIJuaqwnHO73D8dTbhsl57ziag0TFB4shY9aS4+D/XUMiy
         kr969GSDWkBqO6j5askTH8kI7bdbnTjg4DTbnt6ER8epD5kRCF1NVBYrbrLhh2cy+gnl
         tcOvAqA/Nsb7iPNlFUw5HZQwN45ngkZE0r4/6s+7MMeFxewpcnFC85Su76Dn1BbaLtED
         IWdMjaZYu1iAHDlKClfKn/RKRPwH1BzDOoycOv5YG15Jhxy0uYtdbYUIVTkweoOozHeL
         QUyA==
X-Gm-Message-State: AFq9FYICVrwNSxQ73ClQTrbQ70lbn5B7z3G4n8+/8uFC4Lv9XWkQHPWd
	PkvymMfZOFNYjv13b0EzZHVZhsFluIYj9YM896pOXwP9/zCLOb0TRFwZbbbGdKtf8Lb+28qjBYK
	9gUfU7T/WF9ggz3UNhYt+MUjY58TXycewmg==
X-Gm-Gg: AYBFou3sryoWdvCZ2g0ow8L1Pkr27mdFhb5B6/0TLsjG6kzgFkW+jkbOqoHBJfZ1SKH
	B+MnB2800kMBKNr7X4H5Q6N6R4DMErlxv03Dp2iyLoE4ZUiUstHdO/qLSAZiqLhDg8zztYBAVBj
	nNCNM2pQh5BgnaWiWUFJPFq9ADFJST5DEMp+de7VZAbp9/WzzRqYi00OwVMEzs6tdy1bhr+K9dC
	aqItf7T8kQLgyAf1ca1xk7l4yGxRmZik2UTA8Z/NpW0HRRxpkxbQYfIwZvUUd/CUTozjP7NdsQx
	M56KeJpGQUxprzPdhHiWB4YIKLGQZwxV22aWCJch3qRz3II3g0caeZ89b/iZ0h7kM1lck+6hR0p
	HKBU/R2l7K1aa
X-Received: by 2002:a17:907:3f24:b0:c29:f5d8:9c78 with SMTP id
 a640c23a62f3a-c31aa097abdmr895867566b.39.1791802623456; Mon, 12 Oct 2026
 03:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com> <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
In-Reply-To: <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 13:56:48 +0300
X-Gm-Features: AclHuK_ZqxpgUVqij2whdQ3M4VYrk50vnAb18U15iemeFvFo2pCGgfBKHQG-j-Q
Message-ID: <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:5=
5 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:=
45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Add nodes for recently supported device (ALS, LED controllers, haptics)
> > along with minor tweaks and fixups.
> >
> > ---
> > Changes in v2:
> > - added USB configuration update commit
> > - added p895 power LED trigger update commit
> > ---
> >
> > Svyatoslav Ryhel (9):
> >   ARM: tegra: lg-x3: Adjust WiFi node
> >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> >   ARM: tegra: lg-x3: Lower supported suspend mode
> >   ARM: tegra: lg-x3: Add light sensor node
> >   ARM: tegra: lg-x3: Add flash LEDs controller node
> >   ARM: tegra: lg-x3: Add haptic engine node
> >   ARM: tegra: lg-x3: Add backlight LED controller node
> >   ARM: tegra: lg-x3: Update USB configuration
> >   ARM: tegra: p895: Update power LED trigger
> >
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
> >  3 files changed, 127 insertions(+), 10 deletions(-)
> >
> > --
> > 2.53.0
> >
>
> Hello Thierry!
> May you please pick this patch set if you are ok with it?
> Thank you!

Oh, you already did. Apologies!
