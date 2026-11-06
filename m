Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974288;
	b=d4wzBp6C0g0/LW3i9cVwSAFCfQ/uxpl0pIlx+H+6yJV48/CkCABw6/CV7F/udjawLaQP
	 ezCZaHxIqBgdos8p423VtMtkzSQaUp7uYy8jJ6bgiW3MGw3dSgAyhaXnv1r5gt5l/GkUE
	 mr93YLhuMX8uKm3zvZNHXabur+8QlPLvpvUbgdt5yDvTLD/pxKRp7s5TUd4EtnEXOIttm
	 syP7czxYhKtUBbBpeksXg1KeDmW8dj1ZUNMSnE0wVahVphJezoiJsfa3RlJ16ETBEABFP
	 VgwZwXPc6gJR9yf0G3/QYRt3ickrUpybLt4YHQRj3WurtOzhmMFiTTjpuiJP+WxLtmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
	b=vtlOpZ8L9wF0xph98lpl/dtZTyJhFt8vrzePfKSsMwInBz4EuZbr5/cnbg7oBN/YhuXQ
	 9nuMMFidB5iPK9/W5zlHTWtsGwzz0qcdzlKRsTgoggfkAbrY4WEh85zk2IajpNsX6SdKm
	 OLH50fly7df4UqQZ177lwbCuFKJhVHXZKYkuPpC/6DuyroC4GW7AQDScWqpYg/1EvS1eH
	 G4VnxbHZNRhqX20NY/tW9DEG02SuSOEol4s3D3t2LUo/VmDkRZGSGBu+e+ChR3oGy37Fs
	 XiLgmeE60CZC4vvKG87CMmZyjKsq+yDpqBkL3byql3yF4WF+UB6rRmzAp6WlJDgqxow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlF9vvx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57446606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57446606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlF9vvx0
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso96729466b.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974287; cv=none;
        d=google.com; s=arc-20260327;
        b=Vvqu+t3EWb5iYv/D2dF10Zi6+M6KitXH/FlGswohpFdrDMt2oiI/OfPyq0SCVpqe5D
         sO3o3hUPLfUGAyXt1n8K5wiPVgWU1vnVAmRHlzaMUO0sF4B+VhB18r7/wmsLqNQ7zfDq
         SMYo08gmreGv7AkAW1At98oAVWXm1TwiYcEVWHNZUQEeXaDx59jMBYxQtalGV9+3HX25
         eJ8DDFKc4t2cXBXbIElyQ3wRato6KVxjco+EUD4YtbYv4Tn/tnLRIPU1s8wgPtKtonYI
         kXY6LkYK6w5MOycbk3bbp2IyTMsOGMs29i6IryyAxW3DV9vk3fIPwf+hm/jmHb6UQi3v
         L+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        fh=iiSX1MSJkSCYxVxYt/emnfSLWFcTRwkvVBBh5h5tafo=;
        b=dURYLbjpBi7bBfOo2OcTbWIIPOts8L0x2Jy1tZpuBEfVN0zzXbK4pSdRFNQwAVW2qb
         kBK/HwsJX+e13/RYpL1H/P605X6RXTMk5SvxO0WaHp5M/tH2h9E8xjpBE4ae0ui8hCHp
         uZU8g8hykuem5G9ENd+DV+UR3LnqjUB/Ec+9R/PtV6y1Io/Y88QXhUIS5AwsXkM28QXH
         1gnlsrU+fMvEvIid+8WP9iMHO0YRZ4CJQ3AbRkY+GXwKbgGsKWPt9/7EZdvwNq2jfRoW
         +BVankdnzER/AJy/CtaZkYl0IlQsGC8r0J7FsVGCd9Z5CVxeoE8Tp5mHZACs+YQgP+4N
         YHOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974287; x=1794579087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        b=wlF9vvx0jjxE9XlesKjv7QSscrOhN4uaUzQXjeIb+ig4zHVGuWCB7p7+ABbzV/xMB9
         v7QxICPrlsJx9mwTtSctvbTJ3/f6d3Sye/9JZDoHyrMCbuGZdZ8rlzMY9Wglhk5uK/EY
         J98XpdHuLfOMg6ZH2rPyE2gHC19j+bxjIkhL7oMyDqF0ItWJEgiHdJZgxiZQ1bXRgpnU
         +B6/nuEOkEmf4scBkKkpbR374nG79tbJsqukzj64xnPULQ7q0Iu/BNmEPeAz1OeevHte
         HePrgXhcAfQT9VSS/UCDvZxmdjO8x+neHVtWLYHaSxuXB47Ld3p+asftyratZmZQXnqM
         JSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974287; x=1794579087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        b=ae1OvAY6DReZgajtNpKNTbGbOFMxvmkNiIAFpwJZuoJXbfVKkFC61vbWRImnR/NGZF
         zU8BcrJ9pIktiv6+z+/A4qk3AUKlMQxE52UG3Ai+myX4n5fKmpsZP5KqQIWa3QKmKkjz
         5RzYYyjhaXl1reEw5OQisQ5tayBM5WMvHlf94bdc6UzLflDpNERw8yN0UmLfM191WVPp
         SaAPhIzHWwqhvM0vXdMEs5ablLpn8DWa3J6VEmK9ICE89dSH0m5dpfyVjjN2rDcud8+r
         +EvYs/k8c8Xxlbw2WO13cUkmmTlbM950BantALnmt06OL9mQJ5ma73mrVY4P5sLUJUAp
         iRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEef4A1EseQHj2Mxat3RPf/zwy8bCXTa43w3vYyPhcL22F9IGZlSqb/nX7T+Q5MzLDd+XQJlbGAwhG@vger.kernel.org
X-Gm-Message-State: APuU4Z9IFGEr6epdP+2CASGn8GwPaafJuNkVdfMZb6n48xFeB3GjbjZO
	MhLDDQ3s3wMdsfEc/j1nSt8V5A1cDcezL58D1upaSOaP2BvBLHjHL0IwciavxrXb7sa3j/LCdPO
	hdvUEgou0Gs4WQDtDi0Mz4bAecL9V/0o=
X-Gm-Gg: AYBFou1Dv/5cDlOpQg/SSbR4oZfkoxpFKoLs3OxE1bjv2lCndCG3os3MKGgzYb55r2B
	EuUS/bNgyBzgs/FpxETmpsIQBdYTdiLSropPu2W0nfwo8nLNGRn6pXbk87IooswILOWxx4JGfpI
	z7PE2Fl+zqisO1p+V6vzai5JaX/g+8GnCybXuMhAgCnAdHTFOtGJRaI+zT4P5UerpGB+KR95WWn
	ymMWFWMblee9WEZ3Jx1rZESIEWQosctaU8pXalJwl0OiFFCU49QPp10/i8mE8gEz8mhPzTPeGF8
	A56p71AO5fhBZv9Q6gwQX/Zno8bD8ArfVgaIsYmuMCg1j9TVOzB4O1XWQ1QN0tZqM1UKQmhQ/xy
	2/HSO3pakEazpSTSCHx6EgG6bNKdzNp5aoE+ape6CCAy1CcLOsdHGknmiTB1SM/LTsuYxqjndsk
	LKxfmp+wWUuj4FU3aFPbIBXnEFXaWlIQ==
X-Received: by 2002:a17:907:3e8e:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c4d3526bc65mr237868866b.4.1793974286564; Fri, 06 Nov 2026
 06:11:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome>
In-Reply-To: <au3etybQlb5CtjBL@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:11:12 +0200
X-Gm-Features: AclHuK8vFqFS9sw3roYv91eoeg5V28eK0ZMbIUEIj7uPY5ywLKX-LdV7NUmea50
Message-ID: <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:08=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
> >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> >  2 files changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-dbi.yaml
> >
> [...]
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-dc.yaml
> > index 69be95afd5627..ffeb124905dbf 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc=
.yaml
> > @@ -79,6 +79,16 @@ properties:
> >    rgb:
> >      type: object
> >
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^dbi@[0-1]$":
> > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
>
> I think it might be better to group these under a separate dbi node at
> the top-level, making it a sibling to the "rgb" node. If you add
> #address-cells and #size-cells here, I think that means technically the
> "rgb" is now in the same address space as those new dbi nodes and would
> need its own "reg" property and such.
>

Only 1 DBI node per DC is available. Adding address/size cells means
nothing for rgb.

> Thierry
