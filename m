Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCAD423A72
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532735; cv=pass; b=Rka44uOmqx8bqTg43E1Sjs/AW3Jyx5Oi3bt0d9H2TMbKsCETug8fQtcMy+spV8juDegcwC2SMWGRMZt+PJXE9uaueFsXzMVJlz4qmWWMhWnmpUjl9MOqXXw5zCSkpI3xVGRURTcocRuwCCkAIZ4aCvyzg9eNoKK1Hmp43KmKamg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532735; c=relaxed/simple;
	bh=UZD7WI8dncrhHFTt5wBM2441bClQpRuU+h3oUUaO2Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvLAcOfgFe3NZ7z+Ybj/23JGja6BEWfJpZBm7jI75YARiMpbJEwRauhST6ejP/+8u4eGzwoxWaB3xxIYobJUW3/qmapvJywEJvDSPd199PdGR+V2tEoJa667+D+XIhYgYasq/qnfX8LbUujLHfgOvb0SWrmqlGmaMOrcWJz56Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=On6VlMPZ; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="On6VlMPZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1293331a12.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 04:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786532732; cv=none;
        d=google.com; s=arc-20260327;
        b=myUgPEeOvr+ci0t1tUX0CdN7WuqFbFXsB7PrB7vN2zI13qjHllfWNpeOL31d8N3Qi6
         ZkTXlrV5u9JuEYcDmGiP2xrWTohxDjbfVcoIBniuIz10fVliU8ZP04Br0/ZAziwncO/r
         GPpHSSBsFt5mNEt6BlcqZ8AOc8G8KXqC1FMhPY5GvYOEK1yxfiFJ86weoLnjkPR36gXO
         xL46OevegRkbQIXXwXGgr4HwRfZpJLf3EN6Phpo4CHZFhFV3+PAwLn33zctcSixR5mgz
         rW1yBE3a0BmiEX6WzefsvM5/bNcXnn3uakF9DHjvTXpQQPW6MpJY2Uorqyx8MhY2kWPT
         3LEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=;
        fh=DLraGGsszxCNF3qxUdwTu1UtWJFoHG14eM2bT+TY540=;
        b=s/C0vdzILvlPlt2PBdqGDQhAewDQRV22id+pe9+/v8Vn6qLcbwRDwjnTFaCteyv808
         h5siwAx379I1sNQIknyW1OJlqZaEi/Y50eet5658BXMRaSQvvjVme6lboupLsyKN4EYR
         Jlwzk3u7ie+fxWPcJ+AyPRe7za3rQ04CzCnUla2k3j8KU3w/5nn/MIfvk1ttmeD1G5U0
         wsW5xdMVM93wvvkjyoPnaz9RP5eSNssX+SMA545xp/56y9jv3Vyd6JDgLMP/ThCG8EnQ
         8tuEQHpGoN13w4s0Nb8Fa5bzoc0CYhU+G9SrP9pxwbYiue8UW64/jG3FY9EYsA9rz2qe
         HI7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786532732; x=1787137532; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=;
        b=On6VlMPZYVKX1qtfJEgni7uV7+XRWSPRq7GOck0XZEzhZudFqPsR/S9rw4R58AoezA
         /yFzAanclOvkH8EcqaD9UNkPwAoulTkL+QQj+LSmzcdCI8lOGl5eNtanEZ+6nOtxIdbq
         d4x1VqpHGlRYYTOfFIvT8+qScTXGW+bbhebKbktnh9fnEwDr0xiNLYmg8PsxL2ChJASa
         UOJesI72A+Mo6LeRWouY6f6OJWusTBe0QlN0BSeRX/3XSGuad2TC8IoI3+QSaJ+uDB13
         srdASzYQnBruStXg8nXd8W/Hl5SU60f2E2LVQgBd+jT5NbVGDRPL5qsDvUwDQQ2U1v5L
         Tx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532732; x=1787137532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=;
        b=XnBh+nNbBo04EdgWkq6qDXFCRt7Z50W+TWZ8bN0EcMnWss3eLV4ZTGJbTeQ/bYKz2E
         rOL+MtDF/Bv8xDEoU40Dc1hK9iplGGmOgT+Z17Mk19NmJvwbBYPEde1v7OLvRJ0OoDbN
         Q73idy2w+enTmPg1rHgzEvl2k0mtvrcdtc/KxAVn2pmPXfHyPSIMq6aB1X0eO4AmS4zV
         i0voLKQkQaJTioWRLEMahkjkzcjWf/PffEO5w6PFcWzWGTrTjtDZ7ILId1mfox5l57RL
         MmZyQuZsj49Oi0CNhizoaRCLS5MOkeM+jk6IVCWtxM/ls6tFqPdnfOAfTPHXB3e+ETqe
         h1ng==
X-Forwarded-Encrypted: i=1; AHgh+Rp9M5a9Bx2QZxrvbsMDN10gLNekRpxiIgPHIsSx1fNQSUfq1C/ok8qp/Ar0mpb5RG4qzosmD2mcAkQA@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0OYOhJAlOTz35EajVTRxsp0jYkfXs+nCBl/+EsU+osETR6k/
	WHbM/on7hdTxbw/CzUP2Xb7n2CrVq+AoDw7zHLZuMUSo1/K33NkOQYqC5ThYI9qIOLCVDbGwcgY
	L1jeMEhVmA8QHlTFvgFF9QzR9YdD6jOofDebZwiQrbA==
X-Gm-Gg: AR+sD10PfCd/dCJOhuA9AuRO+pU/M0b3xc29/xUfOpPhDOjtbLvcyplhfao+HSeJhFA
	Zgcc7w/xz0qz1aLdFHkCBmFbPNpIeEZ7setsKU7WxhC4kzE0oExeAseOzaFyTVq2ee85Jm83yjV
	USVZRzAdt6kgEKU0JFguMjmp7ow10m9Wndwut/X+CQkZ1lksGLyQqqV2sJSgf156rLBif1b3ocU
	ONkMBeI1tVyfl051TZ0OR6znBT4Me+PpwWQLUFsdDWt9mKDPzfeG3Ju7YVKVSFEb48LDZ9gALRC
	VyGorj9LGzlXdvNftCIeKF+5m2IlyxyfCYZh9t4cneXroSS3HT9aqs3l8A6Gp7MBo8/O5+TXxJU
	EmQ==
X-Received: by 2002:a05:6402:3228:b0:6a1:f95b:8cef with SMTP id
 4fb4d7f45d1cf-6a375e9645emr1820229a12.4.1786532731531; Wed, 12 Aug 2026
 04:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
 <anmvW1LkypAGW6Sc@willie-the-truck> <77edba4a-b6b0-4b50-9328-7c177a0af283@arm.com>
 <anxN6RwREhUEuddT@willie-the-truck>
In-Reply-To: <anxN6RwREhUEuddT@willie-the-truck>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Aug 2026 12:05:19 +0100
X-Gm-Features: AUfX_mwI8H7TXg42iNqR_RkOIUIpO3gOTAkuA-Ll7XQip0ZZWi-1F1xt3OUBfdI
Message-ID: <CADrjBPqRPaZiwpj+cPznsXe79dsXa9kAObLKEOBQk0W5PovU5g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Wed, 12 Aug 2026 at 11:41, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 10, 2026 at 06:16:56PM +0100, Robin Murphy wrote:
> > On 10/08/2026 12:00 pm, Will Deacon wrote:
> > > On Fri, Aug 07, 2026 at 04:25:11PM +0100, Peter Griffin wrote:
> > > > On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
> > > > >
> > > > > On 26/07/2026 2:16 pm, Will Deacon wrote:
> > > > > > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> > > > > > > These two patches add support for a new "arm,instdata-override" DT property
> > > > > > > that enables the override of the instruction/data attribute of incoming
> > > > > > > traffic to Data by setting the INSTCFG override bits.
> > > > > > >
> > > > > > > It is intended to be specified when the smmu can't guarantee that these
> > > > > > > attributes are provided correctly from the client device.
> > > > > >
> > > > > > This is going to need an in-tree user and a much more detailed
> > > > > > description of what is being worked around before we consider this for
> > > > > > inclusion.
> > > >
> > > > Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
> > > > yet for Laguna SoC which adds the smmu nodes and this property because
> > > > 1) I want to land the initial SoC/board DT first
> > > > 2) I want agreement on the DT property name. Currently I used
> > > > "arm,instdata-override" which is what downstream used. However, since
> > > > this is intended to work around silicon errata something like
> > > > "google,lga-instcfg-data-override" might be more appropriate?
> > > >
> > > > For Laguna SoC the first in-tree user of this is the amb_smmu smmu
> > > > instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
> > > > driver is already upstream at drivers/usb/dwc3/dwc3-google.c
> > > >
> > > > > >
> > > > > > In particular, if a particular client is emitting data reads as
> > > > > > instructions, then a better work around would be to avoid mapping its
> > > > > > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > > > > > limited description provided here.
> > > > >
> > > > > Unless it's also emitting the privileged bit and thus falling foul of
> > > > > the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> > > > > to deal with devices which actually do that themselves (hello pl330...),
> > > > > so that would seemingly only leave the case of some innocent piece of
> > > > > AMBA-interfaced IP which doesn't expect to need special attributes, but
> > > > > the system integrator has gone out of their way to tie the AxPROT bits
> > > > > to some wacky value, which I would put in "erratum workaround" territory.
> > > > >
> > > >
> > > > You're correct Robin. It is an erratum workaround for the Laguna SoC
> > > > due to some custom usage of the AxPROT bits which differs from the
> > > > standard ARM SMMU handling for Privileged/Unprivileged and
> > > > Instruction/Data transaction attributes. The effect is all
> > > > transactions appear to the SMMU as "Privileged Instruction" accesses.
> > >
> > > Ah, so this sounds like what Robin was worried about.
> > >
> > > > The software workaround in this series enables the SMMU's INSTCFG
> > > > override feature to ignore the incoming value and treat all SMMU
> > > > transactions as "Data".
> > > >
> > > > One small clarification: in the cover letter I incorrectly said this
> > > > was set only for some SMMU IP instances, but that is incorrect. It is
> > > > actually set on *all* arm-smmu-v3 IP instances in the Laguna SoC.
> > > >
> > > > Does the above provide the additional detail you need Will?
> > >
> > > So it sounds like using the instcfg override on this hardware still breaks
> > > IOMMU_PRIV and IOMMU_NOEXEC:
> > >
> > >    1. If you don't pass IOMMU_PRIV, you still get privileged transactions
> >
> > However this is inherently true of VMSA stage 1 anyway - I admit I had to
> > double-check, but we don't have any user-only permissions (other than
> > perhaps execute as implied by explicit or implicit PXN). IOMMU_PRIV can only
> > _remove_ unprivileged access.
> >
> > >    2. If you don't pass IOMMU_NOEXEC, you do not get execute permission
> > >
> > > Is that correct?
> > >
> > > Perhaps it would be better to override PRIVCFG to force unprivileged,
> > > then reject IOMMU_PRIV and ignore IOMMU_NOEXEC?
> >
> > From what Daniel said, it sounds like the privileged attribute is still the
> > doing of the device itself rather than the integration issue in this case,
> > so while nobbling PRIVCFG might also achieve the end result of making
> > IOMMU_READ | IOMMU_WRITE pages mostly not fault on reads, it seems less
> > appropriate as a workaround. Particularly since IOMMU_PRIV is exposed via a
> > general DMA API attribute, while IOMMU_NOEXEC is only accessible to
> > dedicated IOMMU API/io-pgtable users.
>
> Ok, I did a bit of digging internally and it looks like the situation
> isn't quite what has been described here:

Thanks Will for taking the time to dig into this.

>
> - The issue is that AxPROT is wired so that all transactions appear as
>   instructions. This is an SMMU integration problem and happens
>   irrespective of the client device.
>
> - Transactions are _not_ forced to be privileged. That appears to be a
>   mistake earlier in the thread.

Yes, sorry about that. That was my mistake. The information I found
about this issue unfortunately contained that misinformation. Daniel
Mentz corrected this in a follow up email, though. In the next version
I'll use your and Daniel's more verbose description of the issue.

>
> - The reason privilege is interesting is because of Robin's point that
>   the architecture forces privileged XN for unpriviliged W.
>
> So, based on that, I think the instcfg override makes sense.

Ok, great thanks for confirming.

Peter
