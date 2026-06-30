Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B43F0ABA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815533; cv=pass; b=m+AmYFZ9fsDCO+AGxpZdlirO30Sz/quYli5FUSpmK3qAgRnqGD/m4lBqAgI4tMBcGUYjqa3MooxCKN544hWKPsikLg5HONnyqeXLx+XwJBZGu1hMVU5O0BMPL7/bzwcoOTyP15t4Nmpsb6V/jrXCu5zWBAbNZnL0YR+nKz7k1gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815533; c=relaxed/simple;
	bh=iaiHu6W6GnKaNNpb32KibdKR2UiO7AgOuNqniQ0O9Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkVA7z713w3aT9QQ3xXgNi9wX1GfS78EPsWkH95SMC5hCyt4INZpO1h8VUZimws0bkONafSuSEZwFh9O7YA8BFRSYGAseJNnvK3qukppolPdHo3RJ/TYNC1jRh+M0o8p+1/DdN5I+4bb1KxLuov7lJLNx2yZq8ZO/NareRcgSiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TknVawk0; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TknVawk0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so3238325e9.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782815530; cv=none;
        d=google.com; s=arc-20260327;
        b=nsiyxkAxuFDrUjlojnQeVPIKBkirWo+9drl3WFVPOpL6nzmKIByMcYMuDEtMkboJl2
         lRR6EVa6k5pR8Mv5T3z8yXAJOVP42hHtFoymNFN0zvMKrIjh6eOgXwXpWGTl/jtHS9+y
         BN9QqXOr9nU5gR+ls6f5+xnKffU0wnEFLl0G8v6WWz2jqZLnYoBV6P65j8ZBTpJyIdXt
         MVAXEk6rmKouBjW41RiYQG0b5IkESVfcmSDN1qMVzxjHMy1dutREzDcdiGYXJwbSc2l4
         Qv6eIORF4W/QWmBF0EiszaornuFk4kpO/N8kE+VInK/b6APiRlrclvLrxDMl4omkVyS5
         7lKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHL+qHFUDdbeMIZQEuTaVwIEq35Hl0MbyNWHqvq/S80=;
        fh=N1EFSFB5fuzUEvNwob7oGLHmXf10GzccAeob/gY75XU=;
        b=V0+FZnqICt8yykAKV/k1lyWpa+mBmTmdo4IFRDRTrh/HlB1QpFvNHrvmdKmxb5pRxB
         /eyQjP3rPLCmqqbTUJZBom+3UOBRzDPxNz7Dh+xdqwSYViSqmcoIC/XSkXekIgIvChxI
         6SiMeGKxZiZznfxbRUmosR3sgT2Ys6RRdjjYP5Cbqvg6HNHPp2VrJ+I27VdpgAw53GFh
         b9fxdz9NQ6pOX2a08aZkMGJEOaSNfPMV6j/s829aJvxqW0DTx1YiO3KUre1ZDUiU0P2M
         aA3OZjEDjnYYI8FoLruA1MHuTVNo/cNJJUp33+QpSaDAHad4T1DYzrZrWeEF9Hxsgl+4
         HENg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782815530; x=1783420330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHL+qHFUDdbeMIZQEuTaVwIEq35Hl0MbyNWHqvq/S80=;
        b=TknVawk03XaiNYvvi2l1zmyWGXt7iVeK0pcEc5nOV3BxfikM7v7ECJUIgcE+zwsIZX
         JG14/ezAYE1rqKtJtrNmqRGzPyqJu4iMfeAqkzT5II3VTCT/chljUONKLRRQsu/qCISa
         ZlfbLfTmEXT9ipSqywP6dwwKREjMSr+ABlficxfFKjDhdv3jH1BrRmsWGrAhRjIbM2yQ
         fcLxe+SxMJklxS7fBKsxpiKFrNIUHFFd7iJUXYmncLC0JMnKXpH96UWt22dYugZ89+Fh
         d253soQQFzQJXrz6ua/IzzvxN5/h2XLYwGkshvwbGDF4a20prYwD4qbIYjvigETh210o
         vi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815530; x=1783420330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHL+qHFUDdbeMIZQEuTaVwIEq35Hl0MbyNWHqvq/S80=;
        b=X1F11jedNq3G1WjNFr+hk1rF6kvyeT/mYBEwwFRPps6pNaE2QANkbYHv6RAiJ+xyCW
         0riABCFghQBzp1vr/Pwh3JH4NBmCVk7AVuq56/KcLypLl3RctDRxHnNtWL9xmS3wWEED
         LAl8EThK/qz+7j+efdL1LMOfVpt8LJniDHJXgT0Aqu/oDCWUy9RlpknRaHWQDMTrRm9H
         Fqh2QpxypAkJ2c8WraLPCqbyH+IfBZHCW6Dg4lrtzxMD35klaCjEduVF0sb5ZDBfv9Q5
         try2BTXq1qT73+qxwC2lf6utIFf7f60p6Wuc46CnZx331GTFgB2VfgCsSns6tb0PJpHb
         C4Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9hyHuZGC8QH9ysaarGCMMdSP4UvelHdMkjYND+iiNGhP/mxPE8ykxmx79+HGL4CBftCMhHYDsB62OZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCPxOa9R/FoelEI5yBmO8Bd8zU3kvyJCU4ZlXrMpdAHhySRYU
	YGqINuVrwpymWMPko3u1EnEWQyO5g8+PRQ0rhlwidB5mVJctArkAu6bOFXrmKU8Eoi68zCgBQ9o
	+kq7pKChiccgbG9Rdz1htVCzlVI4DycE=
X-Gm-Gg: AfdE7cniPPQ++BnY7rX+pcDtdrppwg8bbrU4/oZcnVogNMeNSfVabsW1JLzhl+7J3Tz
	zDZsIJDTsnR7ETCRZXcawnFjgDkGvRmSjMXXktDcaD9Z3tSYvzcynlDzl9JniMEY4ViQUtTcTZy
	LZVu/+CWQ6uR2LhPEzCm1CZg48eQTOvGHXlIRPDeRaG/B3juWNQRKoDdg/gl6nPu65nrU8v6xve
	RXYboRibd/gpuNtxnBnVCxTNVUHPuh0s3s1R6GZFI5K17dtNIK6+HqZaDPjQ1lYAcyHZLmGqSUq
	lsICoOAZz/llToxByU+qLzsdpHV2
X-Received: by 2002:a05:600c:548c:b0:493:bb45:d52c with SMTP id
 5b1f17b1804b1-493bb45d5fbmr21230515e9.25.1782815530390; Tue, 30 Jun 2026
 03:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
In-Reply-To: <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 18:30:40 +0800
X-Gm-Features: AVVi8Cc3I7tdMJ00Bv9I4U9Yc2lCcMBT_1z4M1b7v5nzQzRKyNXteY5_feR0ihI
Message-ID: <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>> DSI panel driver have been added for a while, so add the DT node to
> >>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> >>> describes the wrong, no impact after manual disabling these wrong
> >>> supplies.
> >>>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +&mdss0_dsi0 {
> >>> +     /* real vdda is unknown */
> >>> +
> >>
> >> L3B: DSI core 1.2 V (both?)
> >> L6B: DSI0/1 PLL and core 0.9 V
> >>
> >
> > Yes, that is what I saw in the DSDT, however, I can disable them
> > safely (hack the regulator driver to add a sysfs to handle these
> > regulators), the panel works well.
>
> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> ends up being on), UFSPHY and USB1_PHY
>
> L6B additionally powers the same components, minus refgen and USB
>

No, I confirmed they are totally disabled, since there is a way to check it=
 now.
https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152e6c9=
58@oss.qualcomm.com/

Best wishes,
Pengyu

> Konrad
