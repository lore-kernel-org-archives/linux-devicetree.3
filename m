Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCB41D233
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116327; cv=pass; b=Rx9Bj7LtKPwsFZA+xr1HADbu7GI02VON+ljUAjbDNKeR0n83n/9X9gQu2i/f2zWA8J9eAiAVN0c5QL1ZD2W1uO8wyQSd/V+W0pi6djm/0EzfZHG/Y6YggHil2yY6q2pUxsgwMXThXK0gc+McezmVYceaC6ZuM61pGE8OdIr3wWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116327; c=relaxed/simple;
	bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUI3mk8gFwjMPraN+SdVBy9aN+CW4JtduzXt5eymWgy4qhCzZkPIdt0Pg7l+MLHA7hvSVsG6KtS22TF1QGfAh7S2OSyBWLNp4m4UKmjvjyz4bh3LWVf4yG9fasOD1QG7EQBT0/pnL64Rk+2ZCJwgyhI4TiFkpwultnHINjy2uFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AyRNlueG; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AyRNlueG"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso4079772a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786116324; cv=none;
        d=google.com; s=arc-20260327;
        b=EFFDWCLNm2DuyWXhTkjnsH7AJQi35nVKEZvzRU1034LF7IVhlRK0YmpmpCKEXPRTGj
         ENn3AB/e1kr6mKYzQsicjweXuDQs5dWIBfKVgWkgecoz59ge84a0DDh/NfJY7kKhoBbP
         fgBR1DZOXnvGuZpWZF39BemMXzkemREQNEBmm9TASbX6Ehf6dYplx3yOioDIPqazSHlQ
         3D27Z7wiJ/rTj56Dtlp4Kmn1rvGIG6lomdvqV93BQzeFgkp9ruXBxsYG6h2NL3jU8+os
         T7ZnZecmQdQaqvOuZ5MeiukVi53AdBspuougiJcP2JsQIrKJK+8jdvz/HhjY7QAFbIuM
         +4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
        fh=Wn6omZT7hZHtN8sSmcP8H07RLPB+VpbV79h+IvM47AE=;
        b=rFtxbQksyubZ8eMFUJMr4lcBf3ARvSRhmPW1lcF6X0qEDLkn8KVYx0I82YTaF8KxZg
         u4pcZO1CEISKzl+HA78XjHe/+1AKjUyzmMJ9XioSXqNMfPMboydaGEjsctBUOz6J1qiX
         Y7RyO+TpxtQwYHeI/w0clat+9r0Tgbzkah7alSK4YXP+FFlFixHMmICZRVVbBvB9IkIF
         8eHToWlFTkHrR8Wl/uRd62QTn06L/Aa1uuyaFDeFQzGO67VFYJkZh6RLDVIoLb5XvtL5
         vYSzcANN5svdazD7QFTJnqqB582AdO/ZBYpl01v7zTrfWkyXlLUIKZjvgr0+T1D3ChLw
         5Jbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786116324; x=1786721124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
        b=AyRNlueG591Va8mMFjIwkJN2x7RlyC6uRGHlDJpmZodDeAlXnA4rgmsvmF2oqpzMOB
         /O34HGeFTlORMs+e2s0083ieEpfE1hPdJ2xFtT5byCkaNzFBWowt/ldGf9l076f1fOR0
         QModcG/7WrCqEPSC0tLeOfUPKZiK9hzmVRGMiRbDhv9k/Hd5qj/B6L2A9BN+27v+u3cH
         3mvqrpdD0Ku8+WPy3kJHi1LUeoO4Z2J4U8XMYfjfuoJCi//onrExV9h802ixn/uZk4Oq
         mvGfunmwWycL6heQ1y+7qq3lxGnYCZn/hHqg3xCDsCGIO96/AQFNwJtGUOzJQhdwzdmy
         P+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786116324; x=1786721124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
        b=WfPg3Vv4J+2svjXJJle5cHpbo04fax2U4VpcoGR0hkw1UgVZVN66gPmPVZy+iuvb4I
         dj4yadAnpbN4jJtFv8RJyXUphsv0Yc0Kp2c95l6aDS19Pm7UoEi8xOV0daXLVnTqWgNj
         +Oq8yhKSnaReG6scZtFQCYxCl4MxXnj64gdnK8HlK/Q5y/ioqtu1mjKctyCKYdy7uMTE
         HJkIc9yuOq7wPc9wnieTERKJouhB+pr6jbBzRWQrhGwwzxN9qGztVLOMYCnH3EBJQet2
         34iYu+fmBbBtNcKM8F8qAMtZRMg8EwwFai3oSzo7w3jsDV7i8B7jBBNrDuy23Extjh2s
         SVlA==
X-Forwarded-Encrypted: i=1; AHgh+Rom2NCMIOHb0H3dzzTfugbN5fu6yLy+hbTok018fUxew4GVjf1Q7PGjlyAa0jNSXHF927Uy3NYT7s9G@vger.kernel.org
X-Gm-Message-State: AOJu0YzWflYriAGNvrZCJWVRAsEDwqmEjMXE+I310FTkxws8XtZ7FqVP
	asRZU/iEai0b6Sk9KaKKVgFvJTqTjn/M2b/ks1L3H943NQSCQNV72adFCriHhvRqjq9mgMjELe1
	m6hJc11xDovrtXsaOaz/hy65dqpzNLdx68OXxzm2fsA==
X-Gm-Gg: AR+sD13unvGBztmxNrTSxZNUi4mvV4hmPvCFBbkaTZXgZkZnIKVCUVRR5aPUPYynZFR
	zB61ao+F0BNXzG8wPDHhImwhoIzOg2PxVt7SfDDYXiULlwsigm4T+wfJvTryf1TxTnzgoC1BanX
	aR/JoNKJibwPAvb5HufE/STftwhPJIwcPxRkC/g55pLr6D38xC5V3pd8nswrRAeGYIXgbvCb7i4
	h6JZTCNXy1KrAO1Me+HBWaUMyfyqE6Sl4ZFB++NWk3HwbWc0rJHrmPOu1etSPWdiyi75za8PYLs
	pwpmjl1+ZS5OxQ1KYBuPgB80ZTNAwYB01ZI3m9As0V6hL0LAobQxjFxtRyzJD1LgCITMu7L3OFT
	W/R8=
X-Received: by 2002:a05:6402:1e8e:b0:6a0:8ac4:f055 with SMTP id
 4fb4d7f45d1cf-6a14f07c8edmr11239086a12.4.1786116324014; Fri, 07 Aug 2026
 08:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
In-Reply-To: <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Aug 2026 16:25:11 +0100
X-Gm-Features: AUfX_mzVQ33goKUmAZD3cnZPYWgLmpoH7Rq86A-Q6fueTvaPphB8yY86QV4o3lA
Message-ID: <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Will & Robin,

Thank you both for your review feedback.

On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 26/07/2026 2:16 pm, Will Deacon wrote:
> > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> >> These two patches add support for a new "arm,instdata-override" DT property
> >> that enables the override of the instruction/data attribute of incoming
> >> traffic to Data by setting the INSTCFG override bits.
> >>
> >> It is intended to be specified when the smmu can't guarantee that these
> >> attributes are provided correctly from the client device.
> >
> > This is going to need an in-tree user and a much more detailed
> > description of what is being worked around before we consider this for
> > inclusion.

Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
yet for Laguna SoC which adds the smmu nodes and this property because
1) I want to land the initial SoC/board DT first
2) I want agreement on the DT property name. Currently I used
"arm,instdata-override" which is what downstream used. However, since
this is intended to work around silicon errata something like
"google,lga-instcfg-data-override" might be more appropriate?

For Laguna SoC the first in-tree user of this is the amb_smmu smmu
instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
driver is already upstream at drivers/usb/dwc3/dwc3-google.c

> >
> > In particular, if a particular client is emitting data reads as
> > instructions, then a better work around would be to avoid mapping its
> > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > limited description provided here.
>
> Unless it's also emitting the privileged bit and thus falling foul of
> the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> to deal with devices which actually do that themselves (hello pl330...),
> so that would seemingly only leave the case of some innocent piece of
> AMBA-interfaced IP which doesn't expect to need special attributes, but
> the system integrator has gone out of their way to tie the AxPROT bits
> to some wacky value, which I would put in "erratum workaround" territory.
>

You're correct Robin. It is an erratum workaround for the Laguna SoC
due to some custom usage of the AxPROT bits which differs from the
standard ARM SMMU handling for Privileged/Unprivileged and
Instruction/Data transaction attributes. The effect is all
transactions appear to the SMMU as "Privileged Instruction" accesses.
The software workaround in this series enables the SMMU's INSTCFG
override feature to ignore the incoming value and treat all SMMU
transactions as "Data".

One small clarification: in the cover letter I incorrectly said this
was set only for some SMMU IP instances, but that is incorrect. It is
actually set on *all* arm-smmu-v3 IP instances in the Laguna SoC.

Does the above provide the additional detail you need Will?

Thanks,

Peter
