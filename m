Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421998;
	b=HhdYG+lWui7V2++YnMnfPIVQrTYBZ4l2vUq4pFGoDbrjAjZsZNRy0STFjwWmyuB5CCjO
	 gM24CP3R/Bxfnx2Lw+QNv/flEsaeO+RAYrycPG7zUVr0l9lUKa/uT7zEJPyCzjKKD/218
	 B+QpUspsGCq8dfchkuQ4HaWknOY6XhwkaHDKqAa344WoMWFd/2QRQ2w2x1UM+GXhiqsxh
	 XFLRaAoBr/PLS9QK8/cyPImuYJNsGJ8b6GosSeqGbYAVFT2yUqZ+s0M0xdCzo4ZX/xCJx
	 puqUp4huEbSt3kzn5kHvNleuLuavan1zxL1Ul8nC6xJyw3vknJcjzyUHCopb1lJBvQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
	b=uDBSx00w+X0xQtPr0rLDeWFPTfznb8AKTrhWLznGRg8DFPU8EWFD1Mruk7eTFys2C25c
	 e72TD8sQQsoSAvIi5d9QUyo8QOd4eG5BgM2R6bb7qQU440KR7raL+OPPqM7GPeojGdgl2
	 hXiBwRufAiLiAxCNgZyRYT4qwD8NXJk3mLclNRCO80rmk619x1t+LcsnjuD9N9ggQc7iV
	 veODyj89abzHQSGCBEupdEFOdF4wcis3j/aACgPm5NTiOMnCiyIMRp7gKzGTLZa6g4vSq
	 9cx8MSrUOmDrdqCHNpBIEaLHuTyxjDdTnY8ZA5fkKjz9bwuIbzuf0PJLCAHVGP6Gt8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=es5j+XNP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C887E6078871
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C887E6078871
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=es5j+XNP
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso131840eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421997; cv=none;
        d=google.com; s=arc-20260327;
        b=VgA3itYW0NW0tLIj4Gb3S3ibwDz6KFDREVpZPayyZ3LEnma5SHThlg459LDEWDeOLa
         hSFK8GSqK1+ldp4b+9hBbGfdoDtXD9ZqnVFEmy41JNKlHKQ31a1AEtATXCJrMpMjbiOR
         6IumgdBaHpVu2L3UW+qRrajavYiBSFjZdkaNmgtg57DEp1JXEROyplh1UR+9CApvXAuN
         Af8ucO5vmTjgSwdebZlh15k6uJ5DiWWigfac7lu+FUORRXxdRmoiTkFoQ14asXfg1mOM
         IbI6FNIT/o1f9MJQx8PlLzyoqcbEMawJ9zrLmCKtkG4bHSeqyNvuQNJ+CljjVy9lXlUF
         zkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        fh=+xIET2fcwfmP2SB282pyfcS944XRqciECqxxuGqnxk8=;
        b=OVdOw840mlqqcBQYcuapSsBUlPwsvlmJ1x0gHUQxmZEoV2WnLLNnK8B88rc55BTqIz
         C63pxuU4k5AWply1qRDsFk8EoqS97ty2EOfCQKYEWwGStbMlBpmo7F97RukTOC4V7zRQ
         PY+MgXVNtGdBJHYJuK4fF8q6K/Skx2acPPmDcPZAS80ukxLV1PMtIqpHGTE2MzWwcEWb
         AA0KqDGGFotXjkv3Yq7d8k/X3U1CNhnE7W02if7Iti5Pgi1w1zLb8nx6J6oz6o8isQ0E
         S321vNahVw/op3pIFuqJ9T69KVQQ2ooaLOBYU15JeZ5DXjKCzLZdhuQmM6Q+nISRXNIz
         60Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421997; x=1793026797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=es5j+XNPy0vQhY7phMc+bpgICxNIdwzctank8y5azkZD2709Tgu61B+cbluxhH1nPL
         u15/SiYCetQvBwOfZMXGxEgY392oZZvz2jP3rB3yIIFNlwxJSa31cDdkoypPNUJTHCS3
         vqg9TeHZzh5+ecPXweLZy//cbNvvzfMyeRooDGQHFYRKthadi8Vkn30HOKRkWWsNuIqH
         7HXjGYQZ+eMhDD0E+9GN9kfYRo8Mje+We+BtZIPeOOKJ4iBZOTK1Rc/FVS2sZr1SkUm+
         DsjGy6gI+pek3TF2r2cCKTXrJgfYKEtHu25lrALbipY7tHHrLLQsD0DtNbaVvfM56w7v
         tqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421997; x=1793026797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=TcbBGIkiKZWcLv/OA1tqAQvxGwIJdivk9DOLjrcZv2ysvf96nteJBW1FnOLTOfxGn+
         qcQZYUFN7dB5bs3aSPOutguqXC56og9qk998DWz0y6RZKZN4DaFH0JdRC5e7cq8aWZd6
         PcpYmFkGN8TbhhaIrXqI633ao8Wdzhz49Jbt/UpMPfagVJrRW2K0I45OhYLP67TjmdH7
         d6ckkV5SGtjHp0KRXdN3Ri0TH+gXFaJ9entAjCXD+HT7EhPR/y1juuj2F3JkMlATDSxk
         TqhLLOOmnmkb8ndF1Wc+nJB0Y8jhYNKW2LHfea1mfrT7lpH8Cit0rSSWK/RYCZGW3/xC
         y2QQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+hwv5Xrvx+bFhocD6UjIizyvPYpLqyn8TQ1goaetFvYNPrNTNx/QeSGqafrWr6m/MBcjXufuqqQ8G@vger.kernel.org
X-Gm-Message-State: AFq9FYKo9F8+foG9XxuG3Q6ML8hhAc3olSu6AmU50W8YQ5kVDc/lnnyF
	pDjadvgJreamVmr3OAIZO0rZeWk/iSy6PPeuyoWAyrxY7pJf3wyiNCghMoFl/BPwg3uFLSu64vn
	RFQY1gZ4DZfxMdMK200WiF2RMYFp5EFc=
X-Gm-Gg: AYBFou2v8NIeybRBirSxQ5XJLCJI0fDsi85fashCwo3FcSyW8SYCoADiEziZ1k5gZ+L
	jUXTjyD+bjlmwUbjkL/NzibamTkx68GCJ7XsFL2xWJGPNAe9r1F2da9Z62MeH/da0e5QPQOKZLe
	7w3DBsZB6tX7No6dIs1ARbGrM+fUnHyU6kmsdZ7hTTUfsH9ID6MpJ/qo7vyoj3TnO/MdmgnSfhc
	oTeZb9onEbo4re5mmxIGKku0CjRqEmewy5lCUmA/5EyF7K5qPJIl9T08ITVABz0kQIp9bV7rmmz
	ZGitpzoovcQpyjD5pn7l/GIMkW4GiVZ1PIIKJW/wxUMwUzWNLioYw5MpNI6PoabIwYJTPQ5Fe1W
	oiq8GxacF85xXmggAbpIjiv4=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id
 5a478bee46e88-361a18634bcmr13588245eec.17.1792421996823; Mon, 19 Oct 2026
 07:59:56 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org>
In-Reply-To: <179198322819.839288.5272985130898382430@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:59:42 +0300
X-Gm-Features: AclHuK_ZuMv647lBIwF248HcvuKvZ7xEYTSnrsbVhEmmD8JSr7pPARagQdu9MDM
Message-ID: <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
>
> [...]
>
> --
> Lee Jones
