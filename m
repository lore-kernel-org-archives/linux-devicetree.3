Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617716;
	b=VER7ayxVufURBeBVNA7JcShHjR2J6cXXIvHcXgEIJiEB1EjWXHCbe3gkZ87K7JfUqkaA
	 tO5jx5oKRsfxURqj2Q0hLBLicMifpgwZbVRhTfWyksHhh7zRmggESLle0OrwTQlODIVWZ
	 2bCbfrv0DFwr5eiIHJaJ0LAykLH5kDpBf9hTTmXPcdhN7vWhDW7xeuN2VLgS0/NULKtQD
	 KAYo/4CslN0WD4eu609MOorj2bwcDjycr0D7R4aSfybZttmkAsLqw63uqpGdFqvavjzKA
	 j2dRA2vPIforkEX5N7wxeBJbxTL+CUloaevdNRzPiclMMrpJ+7Yxm1vhRW0zfvujkrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
	b=4UL8cDBMGTM+uRGaGKqeHFDXnMxcSiOFsAtx982MdsP46EvtacectcgNx99/YhYAkWFO
	 qQrpAvWvnXXG6D2tYfBmLB30+2LzngBMOl5nyCZ2dwAZq/GuyCXHmSaWIkSXvUKOPMlZj
	 EkzANOnYf+4zFN5kyvVtGnLj1Gv54gnkGn8V8m/ylRdb21kqLDwcCl48ly3cdZv+G9oYA
	 pk4K0ztJMcLdVXrnCEk65U6jq0r7uDFH4AIAhlkxzy1+NSPlhyZ57QRrTVvKy/Zivcd0H
	 PiLAGg8DksiSZT8qWGVEz7rbAyYYf0iu1N3hJVmRXNeajynkxPe4NFG0l3p8hBP8g/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=odAjoK9l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8071606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8071606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=odAjoK9l
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51373ae637so82964766b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795617714; cv=none;
        d=google.com; s=arc-20260327;
        b=syWIu8EUYITSAQRL+2Ty4MIVf5Qhtr8AAx6V7XuHT4Ms4opWDItnnvO+nJiFMc0Fwb
         lD3Wg2DwYtp871/HzHMPfbgPctwLDLQKCW3YSg1UnIfDszrO3WZrvp1Zzk/YLpMEssnR
         iLqfWCT26asB/a4q35iqK3/VFZcIylGjzU5gstviERktSIKGiUUvOp4E+DZ2snvXTBqD
         8TE3raP9eCtJiOUylhAHtLHnYKHbxvyyp8Be6QSIoUFFegEnlE/MppCD17Ns4t0PWdU+
         mqdKw0UEbUorCfTiYvKdhhj6EnNzbnmNf0xmVSBKsgcHIT7GB+cLqEzQM2mRDg1D5nKs
         l4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        fh=AUcWHNX6RXmWdKvE4TQlRcx1ukPMhNemU/0P7Dwt5vo=;
        b=abFZuni4TwkcCqJWQc37ZQKi+5MsANq3OZfjYJwrUGohhgEo0mpQ+ezomxzqgK+ro9
         +d8Nb43ZVoUMfRUHTD78JWEiY6U/aONnSzcnLGaaGlmhl/iVg1gLnXi1PFtRR9q3FUyx
         srmNTXUWvQwVJi07U3uVf7S4I8BRiFTTYO7U5hmLYzbkpD3JyiN+GD726fPfbSf1tWdW
         VqYm66u4SjZ+D97vALn+3XewGH3dCICDXQw8ZYyAoGzb6IWzB5cUKaHJqbWT3YOsNr5Y
         GNtJe63HnPBlMPWm5CmVEmT3CWWc4rvDqWU7jj35eQLKGbI9AcMVU212myXxxGshHWI0
         scfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795617714; x=1796222514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=odAjoK9l/53NSwRmFiM24jvPCeeXxp/4vOc3k3GMNxbsBQBZi6TJxTLdHUroGvseN3
         vK+7WVGukF1Pw8D8F3SHepUtK9+iku92Ic62HRdxe+CE1Xt6C1n/QKzfSoNlyVrD/HHx
         1XBF76bqvwnNeSYplJwR4LfoEdgs8W2rAbHYNLe7KCxulvyoD33XQpFdv5HkF3lHN/pR
         c3KGrr1LXL6Th9ppIfY3ZwS7hLZJYIqUSXgBaNWlnvK/lDcgEGoMz9BQ1z74C4UAPLic
         dN9BXhAuvPxQNHoogynsDFop0FHAmOfWCSunp+TpXx0NdRPykNVSHPUgQ4abiLX9lPax
         0p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617714; x=1796222514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=Qkk8PDopY0n0F+ucVF+C+gE4wswGOInMu32jsBjNJKEb6oZc/4EY8dh2Q4dKykzOBZ
         vDTqTiMjG/ex4fcZ+ilL+A0hAZfJNiBOz3DWvefW5cMKuU3VCSLcAfHcz2ALy/PfnD9P
         +TnU1DobAJ/aNcDnp/PKNGbwuliJLP0jWlN8lyyMGkZvAejde9Rg7uyexxkRAKF0LOA0
         f/f9X/fH3DbBQPUqSSH1rsMOVE/srYn8yycyd2Oxwx0QmIDYH56fpXROEo82gytl21Bk
         +tMuACBWvNVVMeDPdqXofQ5YiqnCxHyNxM+FKd5m9HpOk0sVCwFhgJv0E5aDsqiSsEbi
         jMWg==
X-Forwarded-Encrypted: i=1; AL+hErEfPycg8aLkwUU2uXBvttbLNPGc8mlURk/QzsvchvF1dwo/sqJlY5LFRZYQQPhGm2iNdyshIFOqT3Xq@vger.kernel.org
X-Gm-Message-State: APuU4Z8dZ+1zPBzS2g0UD3Za9tcOcTARp1LDLGVTu0XigVVP+HWtK+fJ
	Be2LUlYEbhhlTXKKsp/AjMNCr2ZJLsJ4cNk7fVAVLs646pxIke4z/Ig5ctYCVW45Mc7368ydTLh
	GfohqfAufRlmGfiJ7idcBDm4S523LiTKYD2+hyehmiw==
X-Gm-Gg: AZFdTZf6+PptuiW+fmdC4CKZt/52pDQe47W7M8XvwGG4FWDknwnuUr+IYJaFtN34f2i
	ciHBhH1D8+7JgeT3BuOismnDmW6I0OAWaNIs6dG1KwobMbEX2OZFnkWzTTcxFKhnpxof7i/tAiz
	fHbl7aMiIqixNIleLO+Dzmrep24uJhgG9TbAZwx4CBc3t+obww7hQOOv/s5RzQec4B6rQES6Qp6
	SyEz6eaowWPhigEVli/9+XmqFjGdn6U8k/dCdLl43gcO7v+RDH0+Tq9yGiP1KqrU+KGKt6P01Z0
	MVKkeexlnXh/By6r9R8PPafjlGKnpMupazz7GLNdG2voqGQfEO28QTLAlQQoJkyU6UQ733GVwFn
	m5zDsXkqtX33DcbqralOJztn0DWKwlp2GDRU7XEBDr1mGzQoX4PWdbveJn2P1zTHrwaTixhxDon
	dVa8nqWGnnFuU34g==
X-Received: by 2002:a05:6938:e04f:20b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c513ab1349cmr1102866166b.42.1795617714171; Wed, 25 Nov 2026
 06:41:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
In-Reply-To: <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 18:41:42 +0400
X-Gm-Features: Aa3M54p30Iatdogoy58JfnAd55Gl1tkvrMVT9GbSbV-cJhdMvMKH6OgZsz2cLWQ
Message-ID: <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int ind=
ex,
> > > +                            unsigned int offset, void *buf, size_t b=
ytes)
> > > +{
> > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > +   u8 *mac =3D buf;
> > > +
> > > +   if (!id || strcmp(id, "mac-address"))
> > > +           return 0;
>
> I don't know OTP drivers. But to me, a function called
> rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> architecturally wrong.

There is precedent for this at least in IMX [1], [2]. To me the
interpretation is "Rockchip CPU ID used as a MAC address base with
offset X", which is exactly what the derivation does. IMO, this is
less clunky than the alternatives (e.g., a custom NVMEM layout which I
used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
returning the processed one, which Ryan proposed in v2 discussion, or
caller-side processing).

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p.c#L224-L238
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p-ele.c#L115-L129

> I would probably not mangle the CPU ID in the OTP driver, but in the
> MAC driver. The MAC driver should ask for the CPU ID and then hash it.

This would then tie the address derivation logic to a specific MAC
driver, rather than to the platform, and it won't work for boards
using other MACs (such as PCIe connected ones).

Best regards,
Alexey
