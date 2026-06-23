Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252623D45CF
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216523; cv=pass; b=fhE01UGTGM0jI4axPn9gaWZE94iXvp1fiHzuPRjOLiUAegC1Ec6FHpq+mfzElL+z56vd+fmjmQF/K6ZxjhJayKNd3Lgqkf+Up1DY2zPlVx4N9Fa+qHZmLuKka7VKy71mQ531P6oqvLN1ld2IRUzjRR1JZUB0dFehmUUcOOMGQPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216523; c=relaxed/simple;
	bh=Vhbi7SQsIrEUrRlT4ak84esUp4zh1Sc5xQy/QYPhHTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6fmjLA9JvULzNORh2Z+yqJNdRnvo19DmpCACoiqMh+U9UFqoTKgtMdnSuV4UN8iC3r8J2PMk7AUM9m9nz6OWVes4yWaDGkKdsPJn7dIn/NcvYZfVC1pk73Ni6sehIdsqpvbMNhy5lHlN9RvDf/d9OMyASK5kJ/6zpzSXTLDb44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lfr+Aooc; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lfr+Aooc"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-660e9ff0587so3082958d50.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782216521; cv=none;
        d=google.com; s=arc-20240605;
        b=c3fUK106NgI0qCrEb67nNMvTcP54z0Y1S8CYM6RwbcFdKujGS3qKaKGCnFwHvHpvWz
         OKqDm4SfRiz/wm72cf2BjzugGip2oXRZTpYYUXrqLMUuV4hDrSZonwyFJBCTrLxa+O2X
         GCL+uGi2hgetfawFeVfisFehRtSXbmkufNM11RGrKy0lxGPdp0Vce9kUDJ3rSj0S06UH
         m+zNHJ1fklo30W8trsK7RpvPAJ4Ep22E/Lw3yBhCGlQr4BR6xls5SLvbgGTNJLbrIIuQ
         2nh4Oi+jr2baWZ7lLmkB2DBoB0EaAQNtZKMKoS5OCjFHJOfNu+ClDBC26tZfFvKcUpZX
         HQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vhbi7SQsIrEUrRlT4ak84esUp4zh1Sc5xQy/QYPhHTE=;
        fh=kEyCbUAyS6MY3xNCBCy6fOrAcHd7GA63PNluZ+B/9tM=;
        b=Lqoid2QXE60cEL27yT//SGrQMqwmKIorQx+9dE83nobjsqFjNE4d0y5fGQYcvvQQum
         lr7piFVyi1De/yjulJjwt5pUxjFvMda1cVtNckE7Epx9jT5mCfy1yIasoS/7+tW3OByY
         9EiqUJOGxVlx2zNTs0nashcscexRpUchbEOFXoY6rhKd/El5awKaKXSalO02dG0i5XkT
         G8vplY7mt8kpil1TIAY6bT8Ul+nBDyCuOzqEa020mLQ+gXbtU0hYcwiGyomTXa6G4Yin
         7LD95qP+MymRvKm/eF6kKMidew4GVGlhLMO9GJWynWzmWR1+PBZ6SxgCKRFvrVffYbBM
         BAxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782216521; x=1782821321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vhbi7SQsIrEUrRlT4ak84esUp4zh1Sc5xQy/QYPhHTE=;
        b=Lfr+Aooce03Aj0gBEyuTcSGqXxq8Mi+Si52Tj8yFpdz/c1qTDwIDxsZUfeW/FhhXsz
         j4huGw/ML6c/plPnPGTmJ3AtjpE01AUL2R7Vj2+YPE0G61nZ8i4ERX9Eq28fLtMaZ41p
         NDxwUw0j4i9fPtzjnk5IWYoZvDyg7wB9uphLGNAwv/yBuuCiFmENnQbQ56CZJJoaDx4r
         C/2oDNZGn2amBoXkreAr635Gte5XVE1y201lOmmMIx0Yv7t+v6itRkQhhgfQsHzpqv9o
         ucdneTlqcNViHh9eU6DOayXz+L8g7Q6+PJCv0s9KFQ2D1xWZ5R3gb3jbc+mjV3kdcocG
         ZWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216521; x=1782821321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vhbi7SQsIrEUrRlT4ak84esUp4zh1Sc5xQy/QYPhHTE=;
        b=O+rf7Gl47gxF9B3PELJeLNNklEYuI6mIqGrkOYRu72YJFHT3ptvhWNe6oe7hVNknEK
         bTBLnvhsPZhdhL4DsQ3jUdn7Eqw6tNL8fglnb9qG9abL7o3xkaxe+cXBFz2O/XsKM8s+
         NgJR5vmLEMTCFaTQuF+CbvcCR08lr3MhCfbodwdp6a4NVks3oFECLiooRw5ErAMxFzg3
         5V2Z66Y0vCanJdiO3KQr5+XH2hFmsGJUZqcOX/86kWNvivoxInke/4wqvqCZdA4Ylh4c
         MkVmwNVNZ9cEcwmc3PHSxfXyCtZa9QhR2Pa6fe5gX/1N7B9C4ZawQKsQ7JvRmxUiHlUJ
         PxMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqhs/LgvvD/+ixHSB8qH2qoFOfEBuBbADXoA8H5W2ZCSCRN4+eCKHlCa9wzv34Xe6uf7flyKiOEL/IU@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1Owra5AbC4N5HwIlAkaf+zzGRN4ZBjCzdwPvLPs/6vN1o/T1
	QUtqoEiNx7VaG1iBCvwT1c77QD4dJsf8LsbzhnuR8KdZx54/wjGc0MF/QaHURxjcncOUYH5EOPo
	+jyg0MeL0QC4oPx+gYXxTyXD9OK2y6LQ=
X-Gm-Gg: AfdE7clrFedIUEbbirFl3TApCqCYiEiXfWhtQ3aYgz8SlUOiVtFeq40KEAitW9yMgv3
	+B6K+0k4P68rbQbx/QS7dkMVEMOOhs8r7h7d2KQrxmcr4xznR1GikSE8wmevuw04AUwwas/B4nV
	FEOmrkLU0WGgdGTSla6x1/DIzaEUZMK4zew/xwCCLBfyldSP3p5O4HIrNFa5SXnXwhxGHorAurc
	eHNLY1wxqhZXv5HTkouUNYO6jlviSUWwHCmuMgE/hwPRnRKc4Odvfm2Xb89YvCL6JAdrg==
X-Received: by 2002:a05:690e:c43:b0:662:b875:b149 with SMTP id
 956f58d0204a3-6635d72a167mr1583670d50.28.1782216521010; Tue, 23 Jun 2026
 05:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621143919.4176646-1-ekffu200098@gmail.com> <20260623014246.GA3897146-robh@kernel.org>
In-Reply-To: <20260623014246.GA3897146-robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 23 Jun 2026 21:08:28 +0900
X-Gm-Features: AVVi8CesNfku6LL_A57wJ_mRQ7J_fQ7P5KNGXxQiv5safdtd5uWArtZUQBAq1wI
Message-ID: <CABFDxMG2ysTYPwJxg8Cq-uWxc+LZzfo_3_S8WwG2wtXMcwo9sg@mail.gmail.com>
Subject: Re: [PATCH] of_numa: fix return -EINVAL when numa-node-id is not
 found in last node
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, David Hildenbrand <david@kernel.org>, devicetree@vger.kernel.org, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 10:42=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Sun, Jun 21, 2026 at 11:39:18PM +0900, Sang-Heon Jeon wrote:
> > When the numa-node-id property is not found in the last memory node,
> > of_property_read_u32() returns -EINVAL, which then becomes the return
> > value of of_numa_parse_memory_nodes(), even though earlier memory nodes
> > were parsed successfully.
> >
> > Commit 7e488677a54a ("of, numa: return -EINVAL when no numa-node-id is
> > found") meant -EINVAL to be returned only when the numa-node-id propert=
y
> > is not found at all, not when it is found in an earlier memory node but
> > not in the last.
> >
> > Check whether at least one memory node was parsed successfully, and ret=
urn
> > 0 in that case, -EINVAL otherwise, so the return value of
> > of_property_read_u32() for the last memory node no longer corrupts the
> > overall return value.
>
> IDK, it's arguable that an incomplete DT isn't valid and something we
> need to support. Is missing numa-node-id valid or it's just better to
> have at least partially
> configured NUMA nodes?

You're right.

Since the first implementation 298535c00a2c ("of, numa: Add NUMA of
binding implementation.") skips memory nodes without `numa-node-id`,
I only try to fix the error case introduced by 7e488677a54a ("of,
numa: return -EINVAL when no numa-node-id is found").

IMHO, if changing the logic is acceptable, rejecting DT with an
incomplete NUMA configuration also seems reasonable.
We already call memblock_validate_numa_coverage() after
of_numa_parse_memory_nodes(),
so such an incomplete configuration would most likely fail from that
validation anyway.

So, would it be OK to reject a DT with an incomplete NUMA
configuration? If so, I'll make a patch in that direction instead.

> Rob

Best Regards,
Sang-Heon Jeon
