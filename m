Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE43EC2EF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114654; cv=none; b=cgPK1pm2dCJYM01pvMKLymCHHufV1O0oY6gpzHdI4i5al8+d6JxROQMeeQG5aO6Z+TNNqXwUmKC3zpPS+fBWC/UESfGJvdyjX9D5HscvK+qYPW3NicsaDRp/4l1HI0YjvBYr15g3CtX8rSt+b+aTNdYndCdrW4Ha7QI7qDK8yIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114654; c=relaxed/simple;
	bh=RYRBQMCFnGUAnQdJMKMQudF8BfHURcyFx9jwbzqnS6k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLq/QkvJiIEUnznR9SwcWleEO1/CqenXYb+SH1wRcEZHjVp6+u2cje4kt0gWnUHJbevXX2/YxPhhXM9C7bBf0sFW2t6kZaOsIQFIya1XV16IcGoSZkrGExkBMRL9M9BFUZrLo+2a/GuVJADvrt38/ylN7D4jqKhjPGHODFDmvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=AJQ64IFb; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="AJQ64IFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784114644; x=1784373844;
	bh=PxtjKv+2SnHab8NdId+Ikuc9e+vZqDya1Cxu37a/MYI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AJQ64IFb+wZg1UcO1F8kJDYzxXv2K7/Vt6LShqfFRAPAS6xB2zbrikxMDWkc0KNSr
	 aUPB7EzLb9R/qQFSqy1NFfLVD7kRkGyV+/iqixtd5i8v3i0v2VEIDFOgKibbo7JaSu
	 eN5DKzjIIblGt4QMvpedk2Z4t170LWzvAEw49EplrdNEc639qt08UNBqZKDrjTV6HC
	 nydcx9S7FwIpaTpWnpIQMzipWrjpcE8+Low0fGw1Nmz1oqwghNsGEBNdaYqWxlmzdA
	 PDC/IX/FikRE8/xSn1xpk7hAsns9Y+0h/LdPfFOZqC3Gt3jLjf61Ka/F7JjPOdUfLD
	 wK28K7Vzftz3w==
Date: Wed, 15 Jul 2026 11:24:00 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support
Message-ID: <4W-fQkS-fQ5Wxua-0vkMZoLw98eklcnIN_ivaYjpWLIVX7qfCBjHGRJq8xQ59PTTIUNbzdT3EqkCsVqz_smuozi0Q3kq4antn54-rPXdmdI=@protonmail.com>
In-Reply-To: <3c112acd-5709-4144-9cab-54e0a51eefc9@collabora.com>
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com> <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com> <3c112acd-5709-4144-9cab-54e0a51eefc9@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 6d1eaa28517f782a5a5cc50cea787bbc1eb84bc7
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi AngeloGioacchino,

On Wednesday, July 15th, 2026 at 1:21 PM, AngeloGioacchino Del Regno <angel=
ogioacchino.delregno@collabora.com> wrote:

> On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:

...
=20
> >
> > +static const struct pmic_wrapper_type pwrap_mt6572 =3D {
> > +=09.regs =3D mt6572_regs,
>=20
> MT6572 only has PWRAP_OP_TYPE, PWRAP_MSB_FIRST, PWRAP_GPS_STA additional =
registers
> compared to MT2701, and the three are currently unused.

GPS_STA is indeed unused. As for others, downstream kernel includes mt6320 =
path.

//###############################
//Enable 6320 option
//###############################
#ifdef SLV_6320
WRAP_WR32(PMIC_WRAP_OP_TYPE ,OP_TYPE_CSL);
WRAP_WR32(PMIC_WRAP_MSB_FIRST , LSB);
#endif

Though I haven't seen any mt6572 device with the mt6320 so far, as well as
pwrap_init_chip_select_ext is configured for the mt6323.

> Instead of adding yet one more huge array for 3 more registers, since I'm=
 mostly
> sure that those will never be used anyway (happy if you prove me wrong!),=
 you can
> at this point just use mt2701_regs for mt6572.
>=20
> Perhaps, add a comment saying that MT6572 does indeed have those addition=
al regs
> but were omitted because currently unused.
>=20
> So, something like
>=20
> /*
>   * MT6572 has additional registers OP_TYPE (0x10), MSB_FIRST (0x14), GPS=
_STA (0x40)
>   * which were omitted as they're currently unused in this driver.
>   * Apart from that, the register map matches the one from MT2701.
>   */
> static const struct pmic_wrapper_type pwrap_mt6572 =3D {
> =09.regs =3D mt2701_regs,
>

I'm not a big fan of dead code, but at some point the mt6572+mt6320 may exi=
st.
Would you suggest keeping mt6572 array or drop it until some mt6320
device appears?

Best regards,
Roman
