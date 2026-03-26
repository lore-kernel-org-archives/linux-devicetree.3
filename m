Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9239E16B
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503296; cv=none; b=if+/LDnx4nM9GWIBmVa4roIZKTyAc4sqQmVRDqhPmzElkH8ao0cZ60atHLFKODcHCBLcDsVCvamhwz622ciu+SekJZ34hOGZbnuGvrfi5RoeizvDTxYvhZ7yh55uUFK8kv0dLPGPzYzxNo5NJ9QEd9U0JEe6sU9g3DBmXghD3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503296; c=relaxed/simple;
	bh=5GIQlsnTdfVCAo4nbUh67DNVqdtEd6nnLn+oXJG+Kmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W68V/u8+JsOe+IRxCmBGyB+CEEdqH1Ei6aqiTW+0ZdCGmt9JpoFPEdlPBdlk/ESvuY7/hCljxHCVLA/EnpupEjka5T99R4RC2ybv+yl5ZFePM2uwoD1jhnzNiob6TAsKjt1mbC29+Ape9hirlcFob0w8PRNp2RXUMo5Os8mErq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FRop+k5d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FRop+k5d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824c9da9928so540320b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503295; x=1775108095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=;
        b=FRop+k5dkIabq/SurM8gxRuXgIwflt4rV2SPYE1+Je18Qw0MKNqGw/AgihLcce0U8+
         j9NyGsL8YHRnaIW1QMokSAHGTIfUzqUB8MhE00qsHgH14yHQbPyQqO2KiIKE374S1Tgc
         b4Pp/jNiyT4IutIVzjSr5TcV38kqyBTgY7IRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503295; x=1775108095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=;
        b=RG+sBecKNjfJzQLnRlrIwx6L75Bx52Ed1DGVOHagGqXsOmZzo/+jPWebiAF95gJWwl
         UCsVVAzQUAK5trBzln9dWCWLjcCKVffOxSekc+QoKw3ZKg1jUPZ9yS3GKe0FROCLaeog
         tiQfDCFEKKtQwuJhkxFucDtdZRXs2aIypHuUqsqq+GvOSf/wth758vOL65Q/fOqBbABw
         1S3NO2Cun8EG2zeCU+Mtle9IK6IsqaCIlUgOA7Uz45XUdrP6P7wrRdHlzG7/tKECjjGU
         Uauj7BUzQJGZkQ9UD2oXUBL/upRo0XEa4XIOdxs8YdYBx0nhg9QATFiOpTkh8tED4YsT
         flHg==
X-Forwarded-Encrypted: i=1; AJvYcCUTagk/L0KRvDElOamwa2/UThxT5dmL4W1lkKXr/r9IZXNabb1gwV7UsyZANCRAyY7vn3NdNdbIPrhV@vger.kernel.org
X-Gm-Message-State: AOJu0YwyeQfsASLFdU2f3QFg5eB1gu7xKXKIJvQGEMHCPeD1sumgmv2C
	NBvnaN52jNw7Vu05RicTbtbWigVXgslHsbkiVyhdiFuReKIGq654jcXLzXrJmJQIjg==
X-Gm-Gg: ATEYQzz/5BrDNeyrgRu6i1aKxLywueqIlel1N76CKiYHsZ9UFBE7H258ahWoD46r570
	xtckGGJwWiM69+HqPf68PBOVzs+mfQvITVUMb4StJJvlV+77zBRAO+aBxt4LQ2vRm6x9M77b0Qj
	dO2ou5IgYDTftZglwq5Sff+EIIwrRf1se+2a+iiTqGCQ9Iv2Kgkx59ucdxChCma7UbmXdEV6T/B
	jiKA6XPzczn12vPYpuDxRkSbv8mKmRWN3fI4GOOKWNikf0En4hRFsoq2gUzsCIR64GdIbmZB1Sr
	xrps3fegvt4qYpMjr51Z8uco9bbrADp8wnPBjhJ9PhEpDOYFFW/PQ0D3BmctRy0r+9daxwn2QO0
	J76bHs1gurfb+HitqVLJ1H7MfYeG9xeR7vLbcitfHUcvLY16/ynUDTQnFpMw/pBblhvxNMGHqBe
	3mVeFloyFjFuR+UiaYaNPipguJKQAPBohL1iQgLNvoxTei+RMKsjvNoZT7BnlAptMkZw==
X-Received: by 2002:a05:6a00:4304:b0:827:3976:3232 with SMTP id d2e1a72fcca58-82c6de8be34mr6221037b3a.5.1774503294866;
        Wed, 25 Mar 2026 22:34:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d388d11sm1401322b3a.28.2026.03.25.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:34:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:34:49 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
Message-ID: <20260326053449.GA910813@google.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251106161149.GU8064@google.com>
 <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>

On Fri, Nov 07, 2025 at 10:01:56AM +0100, AngeloGioacchino Del Regno wrote:
> Il 06/11/25 17:11, Lee Jones ha scritto:
> > On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:
> > 
> > > Changes in v11:
> > >   - Removed unnecessary #address-cells in all mt6316 bindings
> > > 
> > > Changes in v10:
> > >   - Added "struct" prefix to structs kerneldoc
> > >   - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
> > >   - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
> > >   - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
> > >   - Some rewording of comments as suggested, addition of more comments
> > >   - Refactored IRQ domain handling due to deprecation of function
> > >     irq_domain_add_tree() to use the new irq_domain_create_tree()
> > >   - Fixed to use generic_handle_domain_irq_safe() to avoid races
> > >   - Added support for two interrupt cells in translation
> > >   - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
> > >   - Added support for handling PMICs without IRQ Group register for
> > >     upcoming MT6685 implementation
> > 
> > The MFD part looks okay.
> > 
> > Let me know when you have all the Acks and the set is ready to be merged.
> > 
> 
> 
> Lee, the regulators part was picked by Mark, so I guess you can take the MFD part
> through your tree.
> 
> I'm not sure if you can also take patch [7/9] (auxadc binding), but it would be
> great if you could, because there is an auxadc example in the mfd binding that
> needs that commit in order to succeed the binding check.

Friendly ping. You might want to resend the remaining patches. Looks
like they are all ready to be merged?


ChenYu
