Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322AB3A4F5C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741173; cv=pass; b=ouuHSZFHjuXrO3Ubr3g1lLLrS7GxtiHNfZyadbSXZ9SnNvgYhbt/Jtyh507604Roqtq/zmZ+ukMqMPqvLalsdA/yRYPHzV+zIm6RA3+QF0ew9EXVHBbXOOLpupr7GWyPbsoxc4/z4gz/FlE2jS5LYijmMSl0cap6ZjIRIJl3Shg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741173; c=relaxed/simple;
	bh=Tny2wRJd8kuNr/d0LkEONs0UgrsRvV+zKVumD3cEUgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGgnIWm+U38RdfGqGhJ9NCuwsQzYIYrkmuEn6iaaCEP2EpVpZTHtk93VAgZ/4DHbmLZoD3vsFDvJxMYojwQl15TKKzrIuaQciZHvchoR827hCIXBQdTfFjIAkF4DxAhtcYO5hYyo+MjD6g2tuN5Atxb1UWiXJfUw5Gpy7rRxvWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk; spf=pass smtp.mailfrom=pcc.me.uk; dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b=sZ1VxqjO; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b="sZ1VxqjO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso13579757a12.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778741170; cv=none;
        d=google.com; s=arc-20240605;
        b=KcZuFkQ0RD20Kpf7ruS34Xv8yzWwVzcDmkk2l2tBNq0d4svByLegZsxJQnkbfB9dG9
         vRSXNkk6rNjIYzaa067K9R/4roBrHJJTnMyFOmZHtZ582LdsgFtrPBNj/2OK6BFHUEpG
         20NttY2QDgTxujc7zsrMm0bmDugL0jpK+OdcYlFiRD3/bUrZss14suWv3ncY0HPST5AR
         jERrDRwsiSdxI87WvqejddYlaHhkpPZE14c2V0KgnIwnvjiYMO7c6zKQcstZQlyf6/9d
         Vs70+3FA9RkC1s7w5nquAZ4GqhMsKNVU45wI0L2EjPjfusdOQnQxfCWmv4b3+iTgTCWQ
         Etsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        fh=lVuQRuQHcb9I/X7M4rHRb+7irLNGO6iBXZl7dSO6Oyo=;
        b=bQ4vt2T1EkA6L/OWbCTRtAFpaKjRUFs0U/gXQdCJwkk9FI2DdHPhEfoN832bNlNZoY
         OhZ16hZjsWSAcU/P0r3RdffJURm+XqOnR3EgTIb1QqSCAqT0wiPxecLxHquPIkWsPeNH
         c8oBQQiz3n4Kxkwb0wZMb9VKEgdrCgrIv2QM19lc6v8zyOL4990LnoiGJhC0x4Kv+54l
         yWBVNsWgNxp+j5lP5FH2pl3iXudvR4U8Tb+2Xs6GSuFW8FPaMYPspcr5xfqo1Hv2xyO+
         bod12t4ldMyP4Mqcjc+2tHwdxMDzuFjKuUyjOeSi6nBF/V/Rawc1bRO2PQoevZDSp3tR
         ylyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1778741170; x=1779345970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        b=sZ1VxqjOG5keWXNTXnU8F7T66BNajUI6wFcbQcPBnK1SfHWrcXJ/GyikzGFWIsh74d
         xZbWcAvDQcJ/8wCVTJtVuifa9wKSAQtkCZYJY1W8i0aVdmjdzpGzDQgtSqKHi8LkK+jl
         YH/XMiwR8uone0G16axqV/V8H3V1cTpXdb2flf7gKNNYqZKvHPKZC0f+jSy553CXL+gp
         E7FticWsQ9tqkpf6sSEGmGG7rX89KXGkhRTEDjItd4KehZWfivxC+9fXOfDP7D4AIvHL
         yBaLpxFmlVnwZ52+24qhPrGCClFqIgppdPIpWd3+w/SovGqPXMK3O9549apME7YrlrS2
         TaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741170; x=1779345970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        b=l1ExN7IZKRFzBsEXcfSmLubI1KhfqaXuPDP6FVmDZAdZMVXFgPb51y+V7rwYFAY4TG
         zWXWzxLKCyCrpTO6+B2QtIobcPu8+UIjf/67k6+QdirjMkeYtPN3qJ6f4h2TJYb4DtCv
         AF5C1YhHlCeQR4V+U41wlHmw9U/eqIxfYYM5gJMddsnQnPx12KluPVoGK0Av1hao1Y/i
         l3xullUHJ80KnJ/3mLbw76wGir5oye2R09JLaGS/ZtYY1wghVUW6Ui5muxo4lndmzyhV
         xm52W+Tu+5yFIWVlGbqaKzJ/YXlnxtkpVazL25RGn0W4hXd643zzmIspggHI3dO53VXo
         o8yw==
X-Forwarded-Encrypted: i=1; AFNElJ+VW9ivMsl7tMJnzhlb71AxJwV2leuuc82RvVoPlFUe3raHvts43otVdYu+7SK37cqQqx08Epupi2ao@vger.kernel.org
X-Gm-Message-State: AOJu0YyLuz1YBQyTBqT2UE6mLM6ZdU07+OCljHFm0846/jKjCGgF+Nvs
	BTF5VMbEfj7NlI0nKuemge3EksTal3P4d6Ln9kJSGrWHLWSRaGXC62qGrED0wAZRLPZXypO5Qga
	ADdH/C+WDVik7MN56NIGnk5TfJ0jynfecGnaM/4j8rw==
X-Gm-Gg: Acq92OELnFDxV6m4Jc2QwJSWkamgmqCG1RxGqbLVQYjSmjVptBgx9fzStpM4axJBAVP
	OJaCgd5l5GbxjNAlBriA2nLgSSCEtNyWjxY66VA5Ma010a19iSAH1tg1XHzKtdtR/+oKXUG3xCP
	KHe+u+cboZ6fF5tq43GOIVb6OntH7oK4NRTORK1jY2zv0qWEbu9FhHnF9nAlG80CB5UU34ixo71
	hYh3blRDbRbEBebtGHCFaoelUSikozOrdtm4eQEEZOT1MIzrQW7Llt6EWRlZBeu/GrU5hgiySZK
	YZFi2+wVOdH0fNfxF3AlkwzpqIvXfw==
X-Received: by 2002:a05:6402:5512:b0:67b:6d1b:475b with SMTP id
 4fb4d7f45d1cf-6830b0f742dmr1311888a12.11.1778741170088; Wed, 13 May 2026
 23:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502074912.12193-1-peter@pcc.me.uk> <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
In-Reply-To: <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
From: Peter Collingbourne <peter@pcc.me.uk>
Date: Wed, 13 May 2026 23:45:58 -0700
X-Gm-Features: AVHnY4Kp0uXaRPKAoYXDkfobOxz_it19oo__Cj0m2cZABYgqpxJ1WuoISo_LWOo
Message-ID: <CAPQLkRgeb=o2psp_bjLzdZiW_5E+KBSDYdBBtGVTqYyLS+zCGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 11:49=E2=80=AFPM Sjoerd Simons <sjoerd@collabora.com=
> wrote:
>
> On Sat, 2026-05-02 at 00:49 -0700, Peter Collingbourne wrote:
> > The interrupt number was taken from a downstream DTS of the similar MT7=
987
> > [1] and verified on my OpenWrt One.
> >
> > Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
> > Link: [1]
> > https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a1=
4b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
> > ---
> >  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > index 4084f4dfa3e5..3c6fbb6c5333 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > @@ -38,6 +38,12 @@ oscillator-40m {
> >               #clock-cells =3D <0>;
> >       };
> >
> > +     pmu {
> > +             compatible =3D "arm,cortex-a53-pmu";
> > +             interrupt-parent =3D <&gic>;
>
> The parent node already specifies the interrupt-parent, so this is redund=
ant.
>
> > +             interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +
>
> Otherwise looks good

Thanks, sent v2 with removed interrupt-parent.

Peter
