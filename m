Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BFB476059
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706530; cv=pass; b=V+MLp7I/ymKcGS5BJPk+/x8V3VUeOCIKBsQTsqOC2tMg5PKn8X4Mb1EAg2DkVe0F6caX9m6RT+bJjsqtv3VxGuL0PTbjZ58cFaDzywVkU3G7iklm0asS2oWfM77UZXP7VhNEFUcKCmFmLoVsln2PsBYoGUPOHCn5+n5jUodrM3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706530; c=relaxed/simple;
	bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8g8ePIQPSICZi5132ZkKlvM7R2l0gMr/90vd5Idm9BBmcPvL+Ey31bj7KqSPdx255kjqPSmupPS4fjdVWxqe6kGcTWKtZavbvkgcuA7BmKA82YwV/q5/amGYVcRfUN4FXseHZ7rLKvlavro1HD9pWgkvz5WbnAYQLziHaABsW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=YexVoXuR; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="YexVoXuR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso11420159f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784706526; cv=none;
        d=google.com; s=arc-20260327;
        b=k87cdMVvebwd+kysNpmL5IsnBWnoxV0lVPRYthEh4ku2S90N0jY/yZZkGs4+CGFDym
         AOU2p5wOH+R2+pme950fADpI8GAjmrRn56l6HKUpdvqUiSUampXw9gRT28w6HvW3lHOK
         Ek5ryKkJ2j0+F+a0pJNh9sVgVJaRyrazfH7tIKLgQt6GfA3ZMmRqnAwvpffhJ5pXYH2a
         kCbz2elGSgl1mL21Tn3aCOntS1R9KVhoxlr1FD1t6w3qSzYlxS4Mhfog/qBXy9DGEzh9
         FHsWLknQwn92afePzZd3wN2QnEO2K0Zu1HC0QftmW6xD399JiOgF39ZpU397skut+XfK
         YSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
        fh=Wavxok2z8skktSgzrf/N0BYByqKsQP8QVDbTrbbhoCc=;
        b=mdzQ5IgZmPb/JdWJXAFu1+BP/cA797j0KTSAk/TTJdpGojroNBy/qdUFxt4bI3pREY
         IqQYFTkuStx/FzMIivdvZegkePWqaa47Kxf0a2sBXUKrn1krfgbixyi2IG/gvAvaOG/2
         3yYQEKomFjQZMUpE+hbpCNTgaXdKQZ9aZX1+4V8GgTsNE6s/fso+HoBqjY9V3hv92Api
         zO8lm8jUB4eNFp4rfcMoRyRWtGAcTharlzx0yOd8+M1MOv02ER1AMpzKNmRFfV/7W+Iq
         +c1ulX3CFuFeX/j2Ei4zAwoSeCU4vfB2CmNIohL9YXZENrWZKAkgMhaPjeHQ3oh/E0hl
         92ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784706526; x=1785311326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
        b=YexVoXuR/AfI4o5hEtWT/GZy4YOMyKlwgiVwXou4j9veJSDCRYESISAJIPntAboXDf
         wwTv3etg5m5gfcplIpI3CfQLV7YVCGZnsAQJ2ZTLFWwCP/bo270KpIg3UhrfV8WA31ln
         ex/b2Of1ph8BnHVguKXGdmtyZDyqQ9UZKL+97uiQl7xEZFR0+HNj3hZH0jA+DmJNlDaU
         I/9CqSu6HOMwL2IkIADsqLG9T+W7hfG/WkZ5SetKD52ES2xob4u1UAEI8ejp7CiksALK
         HgygNj8mlXYCLkymNXsl7l0h5fz2V5J4YeM8KbZTTH964xyr+OLtolxIB1jSynbJys7a
         81iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706526; x=1785311326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
        b=MK2VOiRcJgnP90ajSWkcP73qfuqExdr9WfJx4E2l9dods4/MbdFfx2wI/yg8fDlBEc
         n8dWrqaUq2DmgabLAmK0kx42+7K8j8LVrWWMd12iOlUiYMLmx6N9fqQ3YKh5Z2DSIqqo
         k5l3sUKzWWEyV9ABULExTuAVu/AD+wcoVtAZfP17d1wyCEYzJwYWSq1nIF0e9XgGPdSn
         zI0x6XjWS0s7iyAASWkAYXWDKkNYAef85e85FEQp23j8pL9PBTstzNLX3zcQJbHyiLD6
         2dVBBHQaeKyu2dKL1KnpmvdjC4hLSC5nq2qKxTnGaOptJpQ+WP5duGfqlHnqT4jSuU6d
         DNCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rph9l5U9NzdpNDJMVFMShMYJJzjzOWGgAM31yOua2dgwWy4ko9IE/WIlKpt82OT84s4QU8GcLdWNuS/@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXephdCbXDfzsyuVP4Syb7FT39CjBqM8IrfGkhqb+QJ+3m7V+
	x3ZzeobLl7MroatlN5UhQS+An/ygrvJ/3J+fD3FeK2OUq5oUZ2z2eZEhrk0R93Uxf9U2l6wCg+w
	CiTvDp7p7lYoyzh4/YHzJ+hqPBQu/Uw/qNXoztnWzDg==
X-Gm-Gg: AR+sD128+NOWH/JeZgweXdLHSzNTAbYWv13YAl0mIqoFz3utgaU78RwGqPc+6bfyUCH
	74Q/pCpAZf4DUgtkwrUfSwvKtmd6zEe6nTcGFR4vTh9OY/NYKfscMCUaG98g6GvFsdoXQqu+E3e
	8mgGcTXV+pfBMZsv50PwW6qBKn8YqrV2f4bKKNJZDwPN6q3Uwua7p+zR/aCYxn4DtHhtQIUoueW
	qvsk4K6hgNRoKKXhCROLG56bLaBF8qbiYWkuHhjCj0LQgmThBRewgDP2fs4N6vX/BmVL712qebl
	z2mC2Rov1Y/2gyhoko0v5M22//X+NoWdaxLdnFcQTWNDgmw=
X-Received: by 2002:a05:6000:1785:b0:47f:7b75:61a with SMTP id
 ffacd0b85a97d-47f7b75083amr12134285f8f.15.1784706526183; Wed, 22 Jul 2026
 00:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
 <178412588365.243141.16731478852761544781.b4-review@b4> <CAFi2wKZrya6aHAN9Wtwk43gqQTMPp1BamM9VKKQ+iH1UPzr4HA@mail.gmail.com>
 <793ccb3b7af22f6f38ff6544ed633b7800ea68b6.camel@codeconstruct.com.au>
In-Reply-To: <793ccb3b7af22f6f38ff6544ed633b7800ea68b6.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 22 Jul 2026 09:48:33 +0200
X-Gm-Features: AUfX_mznQxf2UYusZQbYzHcCnp0qGiF5STuXfQoGRl4lbxGWdovDVg2XFHP_Lfs
Message-ID: <CAFi2wKaWiE61y_rUr_2UNN2_fSAEswG7CXQrPMWT0NiSVBcBVg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan.siewert@9elements.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > so you're describing a second `ast2600-lpc-v2` node which is unnecess=
ary.
> > >
> > > Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. =
That way
> > > you don't accidentally cause an overlap for the devices if you descri=
be more in
> > > the future.
> >
> > The 'kcs_bmc_aspeed' driver has the kcs channels address hard-coded.
> > If the 'reg' property does not contain the three addresses used by one
> > of the four channels, the driver returns -EINVAL.
> > So having a pcie-kcs4 with regs 0x914, 0x918 and 0x91c doesn't work.
>
> It does work if you fix the driver to allow it.
>
> >
> > This is why a second LPC node was added, for the pcie-kcs4 to have
> > regs 0x114, 0x118 and 0x11c;
> >
> > I know we should write device tree sources based on hardware rather
> > than around driver limitations.
> > Changing how the driver behaves seems excessive for supporting KCS over=
 PCIe.
>
> I don't think this is true.
>
> > I think a point can be made that the LPC over PCIe is a different LPC b=
us.
>
> In my opinion it's most helpful if Table 8 in the datasheet is used as
> the reference for address ranges in the devicetree. With that in mind,
> I don't intend to apply a patch adding a new node as you've proposed. I
> suggest adjusting the driver to identify the X{{I,O}D,ST}R4 addresses
> as channel 4, under the existing LPC node as Tan suggested.

Sure, thanks for the clear details.
With the Table 8 in mind, I agree and I was wrong.
I'll work on that.

Regards,
Gr=C3=A9goire
