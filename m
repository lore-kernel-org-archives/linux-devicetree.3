Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B582E06E4;
	Tue,  5 May 2026 06:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963788; cv=pass; b=uSjX5ahHDfWRap5bBWiyHJLstKS1Xy5xDmX7VilF0f8+sFXBMV1Zpf7/njobUHMIEAVVtH8mZwlqfKVenziKbDtVKPVl7eoluWqWbjMWcpL8YKUt2DWx8zOhCXjeU+Izfg/lyX7LJaCC01y/kXomgYV9pg5k3/WN+mfseUaA82Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963788; c=relaxed/simple;
	bh=+qOsPCOc57uBN2XUpF8157PoTK7L1efFwFT9RhreG+I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ub32Tt7mlKIgNf82MlQu8YohnJiPRc2ky/sawY+wHbb24TXbLAKVEBbmC0QBnWU+g6drKBMaRqyY0D8fpvpfL05SxyLAanq0RcDA+xTVa+bmkiuQwDMR894QRzEIb/rnU8I+6h2TNwNImTSN50f1Q5aUYoKgUn2B/gvd523SOEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sjoerd@collabora.com header.b=CDULNg+V; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sjoerd@collabora.com header.b="CDULNg+V"
ARC-Seal: i=1; a=rsa-sha256; t=1777963778; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJq6pDGenh8py9GIApZpSEo/n9vzbml5iAbCmE861qH+OKBgvLs+cWV4+mJuyU2FUZs6PUcrAPp3AZuy/1PglPbBTu8uLR3lMSaszy04X3NPmURUYZqGNs1QWUrcpuC3Hf8yoLaviTNnmMC/Ip3eTUt6Tmn71gvCBMMeLIEsQVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777963778; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yXd5fFW5+hV4sE9fLs/inGdGi7ufqi9nV7XrtFhIiX8=; 
	b=L6OiivbxLYE6yOuUbtSbilr5d8ZnlAr6em6u9rchBQqCBi5TNbmwbYK1mHCb5Q4Y6jkdQMaoQ7vnjyRD6h1Eue3Ks6Qj5O7oI0j39u1CbjbRiKbpk07mcHcltdynYLaFYI5WrNT2hnGyy5gru6xgISRMKedo6JVhXl/lsL54IVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777963778;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yXd5fFW5+hV4sE9fLs/inGdGi7ufqi9nV7XrtFhIiX8=;
	b=CDULNg+Vp97LhZK+YeVqB6h4u2Th00Ue2RqZd5XYhBQs4P66jjg2h+g0vEC0xzv9
	mq7Z05ZLeXMsJkzRtLE43XJFAh+MuWR0Btyu3e80GgmDRZVX0GBOT7ens6lMexVtN4d
	OrsJZsTY/OC4h2lb36rmAEr3keQ+nLIvCukRHEiE=
Received: by mx.zohomail.com with SMTPS id 1777963774575650.9780236530866;
	Mon, 4 May 2026 23:49:34 -0700 (PDT)
Message-ID: <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
From: Sjoerd Simons <sjoerd@collabora.com>
To: Peter Collingbourne <peter@pcc.me.uk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Tue, 05 May 2026 08:49:31 +0200
In-Reply-To: <20260502074912.12193-1-peter@pcc.me.uk>
References: <20260502074912.12193-1-peter@pcc.me.uk>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Sat, 2026-05-02 at 00:49 -0700, Peter Collingbourne wrote:
> The interrupt number was taken from a downstream DTS of the similar MT798=
7
> [1] and verified on my OpenWrt One.
>=20
> Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
> Link: [1]
> https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b=
215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
> ---
> =C2=A0arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 4084f4dfa3e5..3c6fbb6c5333 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -38,6 +38,12 @@ oscillator-40m {
> =C2=A0		#clock-cells =3D <0>;
> =C2=A0	};
> =C2=A0
> +	pmu {
> +		compatible =3D "arm,cortex-a53-pmu";
> +		interrupt-parent =3D <&gic>;

The parent node already specifies the interrupt-parent, so this is redundan=
t.

> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +

Otherwise looks good

Regards,
--=20
Sjoerd Simons
Collabora
