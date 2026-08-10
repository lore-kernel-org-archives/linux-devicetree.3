Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706A3C2BAF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371358; cv=none; b=cbOH1Ty7bH2oEFYWGaUchN0X52j1CgShTIQyJQMA3oo2yn0wxggZErsJxpv2bTcz1OGca99Um7h0pbxizxRyASmALh4F5aD5NqC5Wi3pCn0boKCmadusvmnwoFz3vsxoZEEGMLYIQxPXIGhy6aI4shM6q7LRd4o7y63FODR6Ivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371358; c=relaxed/simple;
	bh=4cWe+wDIIr2tLAOrRNj/+BJL3C/MFMywAN03TjAoAAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMj1AyxNa1k9xr+9g+pq3boQnQ9qQ9MM8zYCT51TVWqkGzvyf8BL0WSkfRoLrk8lCLAdyWyh2rlnU7YBkho6sHMQcokOmJyCP5NaaTsjVAifj3lUb4b4c/I6ewgmfOntaePhEw3zaxfo9HxM5GjxGrAraTPnfubslsrlQK8Ehkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jsius1F/; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jsius1F/"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so8964636d6.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786371354; x=1786976154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idlTE0WqykxV7+rArRYymwOTK1srgqcOSOKZC0b2F24=;
        b=jsius1F//kj8uBgmfs05QNdRTgmPKxiFT5XfxlIsN37KZvFOEU99+y0z6XGwIm/vKq
         AuaeutO1EmiGeCrcS/NmXo7s88obREXtCbO1MDEKMa5BBh/Gl4dmqHTYT3uCHVG1DBTJ
         DwaiP+oGWAQTepjQoI51qj3esb0sueivfTRqdjSly2cp18X2kRHnL1XX/E6DHCd2/Tav
         C9MMw9x6FE/MjXcdemvkOHPhN7e4DkXWwX/L/1jIIjolAfe1RIaLhe9x0+klPm9Dwx2S
         vLwUbS5SEOGgKUMeyVd5ExAwOiBBvHeLeUDO1LLgKgWbYw3bpWvXgMhzRB2yReWh14Uf
         l9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371354; x=1786976154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idlTE0WqykxV7+rArRYymwOTK1srgqcOSOKZC0b2F24=;
        b=GEPFYlvlMz9/7hfxzItuTWGeuIBVXotAu4fJZdaEv9QE9Ks/wzVp2k+m/9nED3/V67
         uVEVTqxHEQN/8NYaDJT7eVNjqNNqlcqe7IomaE2MX5JQqZzpG16fQ/au6htMpaVH3WSP
         NnJqCEn7ri33m22fht/tJyNexSpRqXNFUySDHXEHSuWwQ1PDQz4hscfOeSb56dmxtmfU
         UOHp2+fEDYV+CJcdKRJkDfjHyGZxiTJsJN+noosHUAUYH0kOqttnPq6Akn+N0cQIAcut
         fomNuMH+bKLwkCyLK+HMmhci9fKQB5ZSWLUN78B/Na9fjOOaRpDn9w7oH/A//cm+UxX5
         nMLA==
X-Forwarded-Encrypted: i=1; AHgh+RojIgSjKssikP0OuhXfyreR2HSg1k28XrVTy7cs7ppMyL4g+eG3PvgK4ELgIu7rUbwAANVHjk5+xOEs@vger.kernel.org
X-Gm-Message-State: AOJu0YwNUqRiR5v/05gbwYCM8Z3MaQG4IBw4WNesbzeOvEwLpF0NYcco
	9CCLyZDmMZJ7xRyNNtUAtgs7m+VrTXK3IOrO8V1R5YcLF2wAloFnZIfBdQ8hG+du8UA=
X-Gm-Gg: AR+sD10uu/m6+qq13jDU2b7D9jVqVdkZQGJh+cvUVjBzCEr4FkZLMie+/v7ntO6OxZq
	p6CysP+oXP+/gi86HkOt44pmiiUBr3DWwPMC46D0g+Jhn9EdtGHlHNGTuDvIGuXZ+iZahoFZ9gB
	DwjEYSfDrYab1qY8GA4MAPJSZaqpfb1ekto4hM0Ka+/z5dLY0339oFh18/fXdPvfct3Wc9WGX2/
	o3Iu83EXvAWFBBHzOQ630QVwrO58xdUZOr1I7wf4mHXK6er53H2I7YVVibdWXkhtmjdpGDSQ4nv
	lbm9f0Kx+Sm6ZTrF5iUYONO5cF75xOKqKJd/7Rivp6rBZGnrpT61Rsa1n7nTjfhSvEny6FLt8g2
	egbtju79QY9Rv4j2KbDcgq5a2slyUBfXOSorw0Sh6/pVYUOJPTsa0eV369S3qfN8VpHxrp3EreZ
	vORYSluMjeUaiiXb2PA9GWpynd0tAVuUZZ3QfmGA==
X-Received: by 2002:a05:6214:21a8:b0:8f1:1081:a950 with SMTP id 6a1803df08f44-90a346a77b5mr228055386d6.22.1786371354367;
        Mon, 10 Aug 2026 07:15:54 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff8c6sm72821986d6.28.2026.08.10.07.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:15:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wtQnB-000000023Ze-0BaD;
	Mon, 10 Aug 2026 11:15:53 -0300
Date: Mon, 10 Aug 2026 11:15:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
Message-ID: <20260810141553.GP200537@ziepe.ca>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
 <amOpSPmc36+YXgCQ@nvidia.com>
 <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>

On Fri, Aug 07, 2026 at 03:37:37PM +0100, Peter Griffin wrote:

> > > @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> > >       if (cfg & BIT(1)) {
> > >               used_bits[1] |=
> > >                       cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> > > -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> > > +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> > > +                                 STRTAB_STE_1_INSTCFG);
> > >               used_bits[2] |=
> > >                       cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> > >                                   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
> >
> > This adds for "stage-1" and "stage-2", while missing "bypass"?
> 
> I need to follow up again on this point, but I don't believe currently
> we require the override for Laguna when it's in bypass.

Oh? Why not?

Is the issue the IOPTEs are set to no-exec or something like that?

Jason
