Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950093932C0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113473; cv=pass; b=pPaK/dZ9JUsAo43DsJ14dyLHts2Zc6SG9GdnXS4OQpS4wEo6IBlM4ggzh+lH1e3f/6XMivPfm536fnbWwxWTHOql9wJky8oFhwebUhFXGl3q64iz5qk/wZt5jz9gNxNbQ2OBczMFMAxvzxf2769f/JfpzsAOPIBJTE2XyTUYcIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113473; c=relaxed/simple;
	bh=eHqINAXxshzohPgUMprofaAZiRaC00jZPRTFSLbKNUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTtay2uUF3FSi5LVmiz5gRY3wRgbvr54erJK8mhk4pdrAIOKW13h9uG5HKlN2VTl1oGO5qXusbRgV+VFqVOtGFXLl5aHIHaWf3C9e6R0+kBoE50xqH1BVTW5oGQIOLts3k+7KR6N4mspeM9NpQZVHHkw1ioVgdwXYaxMoQiI34Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A7EDtbNd; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A7EDtbNd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a8d251so4735651a12.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786113470; cv=none;
        d=google.com; s=arc-20260327;
        b=Tf/eYVIGuD6ea7pA40sX2DPtOhrhC6BGbu/lcTcF6Zlr9t/ZuMtwJDcY9PsrIjFEfg
         buAs+SszbQdd0GQsVH3XCJxyPus31ldTSMu1tNxdes/tr5zD/PML1+fzuipyuiXCTh5i
         REykJTcJDJE4UnHovhDKVXO44ijVshx6p+pWMZikqbeDywIZwYGISEQEkwp+thndvN/X
         Jm97CHqC7H5SDLVRN6G4YhmHFSGXj6wQCfjHxaEThNb4/yKS3EfhAktqqdT1RINnjs+G
         NpyjWxv6kb87s52j8z6Y0XEX7R9f264qzvD2Y+K1WcrDYaNzYlhnvjKsGOW7/N+FNRd6
         z+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=;
        fh=GLj4+BonviyTtH667ECTmmB2ry1gQqyNaezYzaZ01DY=;
        b=cPYSriuc5/DIfTjRBaZj9O+LJZrYUPOLQ0OJItn/jCizS4sXBm5lIVgyTOXULEa2om
         AJ8uhpNZRSiPSeipVRbFWHvCFeqDjMbLQoBJ5U1Nu6edUD/Ah4KpTHAuffF40ygiTm/s
         kC3OtOYEcU7nkX5E2kWx/5rfZirjzalcxtC76aJRcHOFIhgwlh96C/2z21Wd7K8rIeF1
         HyAY5nerdXPffTfaoBwwVMr1HJCMnk+pkXKqlx5LDjigQ5unhen8mvBPSmYOxuoxBPyw
         xDxT7ZmbVcXOjVsT0uadjBbN9PBXAwUk3XLqBn6GLwtrS5AoiJ0jxnfRPOhIteWjJbfE
         CbLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786113470; x=1786718270; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=;
        b=A7EDtbNdsb7it9rkWahIAdyXVcvowSt8jvCqlHAU4a2tpNj3K3CMspQiujy8f+/TPu
         p0ZFLwQSQEU0yc3z1nVG+IUtEt57NPQcD81GkoVw69D8ubfCIZ/Aby5jDHwxqhPMSiMb
         tiWrTVb6nNfR5BwJj1S10GCJe8z3YE33UNYyImBBDq5fNVNmBXR/R8quAkH9zQgdhRHL
         +ue/UsL1GKEyYR3NeeYViKHdB8vEKidmaZuU/6FweOiCQEbtFRxe2bdUmGUc8hZDQd3d
         xz1X1OBnMwLLzPlPc1PMPyCpsQ6kHxsGPUFpCko9XixrC7oblJjRcicqWgzCn2fD9pHz
         QIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113470; x=1786718270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=;
        b=j/Ig/2jRjtnTMUiJ9vlO0in17LcFCkC86sxtcn9beLyNDs7qCxrk5BD3n3oOUZDA14
         088fYkGRUezsRyWlo5oOC3/ZW5z3SXN1vBXEswjjrQtQoIniJ2S0u/m7nAbazKY9v4XE
         z/l3bb3dO0nN2Zh2Bot6H1HHRVnI4iDjgg47c1EkvFHyCGzLVFLiFvdA9FVUO4FVe01m
         FhMrUXcw/vY3DOkUuVsD/g1yC9TYlVBnYFOSeQ9TDZ2moygfoq5Rt/mnJnGDD+VLrt9C
         r7o+xIDSgz0/r9ykv+XGYDwhN4m0R/53VRu08ma6CQlhUhc318R8q7XoAe0f/Rrf8fdO
         ArlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvOpeb9kBcMEJWcv62aSFqdIH9FV+nwUXJ/obJn6n6DyXT9ysIO/lJh3Hq+h+KDvoMgrqzNh2H1H5i@vger.kernel.org
X-Gm-Message-State: AOJu0YxOUddCZ2j7IkA/0F7iKtTkj7vzImcUQiF/WuPnJ/qO5w/FgIo9
	MnXvExXLCcbsuUOsgIOqlwnulv72nUq+xjwO9OsG8Y6/QjSF4yzJJr1UdfkJDermoim3XPmYVfU
	OQ0ljysAQAjTVxEvxgY2DO2xcvBnZaqZksqUjtwSYuA==
X-Gm-Gg: AR+sD12dGoi4mjatJkqYazGW+dlwnFgoNT2M0OjO0W4raf4DmRqryykyrbzQCr6ZCea
	ZSeNVTdEfnshA0Z47X7biqG3+JsYCOe6BEpj+TraFCkpuvm7zgvnyfR73a4+w5MAizys6YeTDN6
	A73Vv8VU+i3mcOUGCUpErONq4OQSaLE9EfwuoF5nNMkQDKk4tTl8hmVe8Vgeo0bs8wXcLZqCJgN
	SN+FO0aSmbo/83fu84cY6wQC2WGOykB9n1KZ9wmhWW8Wt0ZYeeiHIyuALrM6KK7NhG8WEKnOoQ/
	VyImMzAk9R/HlHbrJ1rDcNDaZ9A5Q9NvO5guarSj+uxX3+z5loh5tOY/0SFau6+Hj26imQIuo6O
	cdhU=
X-Received: by 2002:a05:6402:380a:b0:6a1:1e25:143e with SMTP id
 4fb4d7f45d1cf-6a14f07aa0emr11843889a12.3.1786113469730; Fri, 07 Aug 2026
 07:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org> <amOpSPmc36+YXgCQ@nvidia.com>
In-Reply-To: <amOpSPmc36+YXgCQ@nvidia.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Aug 2026 15:37:37 +0100
X-Gm-Features: AUfX_mycW6Onnp9fcyEmhcQ210POYMAQz3QVnbQpiqAFr05Ok_wIMchvSKnA5X0
Message-ID: <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Nicolin,

Thank you for your review feedback.

On Fri, 24 Jul 2026 at 19:05, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> On Fri, Jul 24, 2026 at 01:39:43PM +0100, Peter Griffin wrote:
> > @@ -1206,7 +1207,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >                       cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
> >                                   STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
> >                                   STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
> > -                                 STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
> > +                                 STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
> > +                                 STRTAB_STE_1_INSTCFG);
> >               used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
> >
> >               /*
> > @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >       if (cfg & BIT(1)) {
> >               used_bits[1] |=
> >                       cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> > -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> > +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> > +                                 STRTAB_STE_1_INSTCFG);
> >               used_bits[2] |=
> >                       cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> >                                   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
>
> This adds for "stage-1" and "stage-2", while missing "bypass"?

I need to follow up again on this point, but I don't believe currently
we require the override for Laguna when it's in bypass.

>
> > @@ -1835,7 +1838,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
> >                        STRTAB_STE_1_S1STALLD :
> >                        0) |
> >               FIELD_PREP(STRTAB_STE_1_EATS,
> > -                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> > +                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0)) |
> > +             FIELD_PREP(STRTAB_STE_1_INSTCFG,
> > +                        smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> > +                                STRTAB_STE_1_INSTCFG_DATA :
> > +                                STRTAB_STE_1_INSTCFG_INCOMING);
>
> Sashiko pointed out that this prematurely closes the cpu_to_le64()
> macro.

Will fix in v2

>
> > @@ -1887,7 +1894,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
> >
> >       target->data[1] = cpu_to_le64(
> >               FIELD_PREP(STRTAB_STE_1_EATS,
> > -                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> > +                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
> > +             FIELD_PREP(STRTAB_STE_1_INSTCFG,
> > +                        smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> > +                                STRTAB_STE_1_INSTCFG_DATA :
> > +                                STRTAB_STE_1_INSTCFG_INCOMING));
>
> You might need to set in arm_smmu_make_bypass_ste() too.
>
> > @@ -5087,6 +5098,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> >       if (smmu->sid_bits <= STRTAB_SPLIT)
> >               smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> >
> > +     if (reg & IDR1_ATTR_PERMS_OVR) {
> > +             smmu->features |= ARM_SMMU_FEAT_PERMS_OVR;
>
> Where does this new feature bit get used?

Good point, the feature flag isn't actually used anywhere else except
here. The intention is to ensure the DT property
"arm,instdata-override" is not specified for a SMMU which doesn't
support the override feature. But we can perform that test without
adding a feature flag that is otherwise unused. Will fix in the next
version.

Thanks,

Peter
