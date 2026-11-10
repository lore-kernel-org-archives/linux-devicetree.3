Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335954;
	b=BdMK/4Dap0wM0qlbwxtmhe2E5PyduPwaq5aJRsCHS+rQeaAp5r8H70h4j3Zaq8yDU3pd
	 sa5R9kRHg1XReGjP3A908vH7tpWqStfg9vJLOjLUT/QWhG3wKNyCT1o6Z3uJiFqHIhfIS
	 HC/p1dDKX87mDKQ2/7zx/kZl93pGNUhSQf0VxyISZMld0i1gHhA+SsZ5AoDLbhSWvgcJ5
	 K9MSseu7rGtHABKbX9UUh+fLO6bZZxvtLSvIUojai3iCxDkEu5/n7zhN2buGfRslpYiLi
	 FZma+rajFYP9kmW1c3uhY2212joS7N2dO1iQjh75u36crTmR7KFFF1lzQIhf8bFsIpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
	b=Dv3M7LLjohi1IdbRC8yMExSrxW9HaPCtlebRSeUboJZrFpWsyasCAWQYxIf6Ws3qN0Iq
	 a7tjAvkQHjoNaNnnUNRkjDjhKznnFFetNif5pxCFfjTZeVNVOoDtueBGtGWDsWGu9K30U
	 XRdekj+apdzdo+1td8tQmqLJJGBN3iG1pRVeeUz//1yieDTbTgB4APBTbcOK0HuLC5XLe
	 NtNC+9OeDjPfMYt6ikOJot9szGxAwH0IAtgZUF20/uUd12OuPj8o8lYxzDLKHBF3xSHLr
	 BIvJj324P6Vb8Z/3Kh1T4cWOX4iAhSrDqgeDidgCPocqcbOMNgluC9rnX/W9DkXyRHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZK+++rZl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A570606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A570606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZK+++rZl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ace304021eso20916671fa.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335952; cv=none;
        d=google.com; s=arc-20260327;
        b=J/aKqqqFkngmvGBUjYXEQ+TJDosCNlmUyRf+mF8JE9bxA2v22LHWVwAz7OKfHhRicA
         58sAhaGs//o2f13GgJ3FSrtdQLfONz7Nf6+ICErEZ4jWlVlnbOVtrbBp0v3eyWvAgC6i
         Kb+10mn8cK8k2mRaAtuMyFq97fAClhVIas6JiJ2QSHFrGhMBU2nYtnirabC90p1pUXhB
         YBg+QP52A+dulkK5r6V4cAmGO1H4yscm4JjfCDTwTIZTMVbqiKZu1p1/uvzCMzPYoD4X
         r0Qw2tezUt88I7k+FlmTZt2mSvVWFmi/54rzy1b4ViA9jNU2sEHBXQ5ZWFRdBevsYbx/
         uCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        fh=a+0F96jtdxYmkzlcBSlOtGRwOTcWVEQOVpcZpcwwrFw=;
        b=J43cfvod3oE2/lLkWEgnXpyXSfiuZgIjZgqylrj2yfhXOaK8F39jTO/u8gCTjJ5jJp
         g8nk22E+j+8jZs39alKxhdw+Ct5GY1M6cp7dGfuD0Z+YPKQTmTOCtHq/vhKk8hKlyPsl
         xGRTRnQlEnhWXUt2zO8Y6f27lyd1Vf8xx9335+9aVnKtH/WGJgqJRdx3U519/hjujHYH
         c7OHpRgtgwLHkms4XDZmF9JT0/RzobyQX0BhhVJJGZb6xzL3OJGhzHIyxqGKCuRen6sS
         Ej3o2v+ij+g+TxcO3LKFakVG5mw9DRFRXfdFw2LzEpp3o8FGYcvF5WRkGiGxrDpuiKUe
         B/qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335952; x=1794940752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=ZK+++rZlDpL8nJx/vrqs2LmHOH1By/P/mzHLEUh8O8wjnJtLXEQtQuZj3zWwE6PclG
         4lIV/AOheJPvT2VHdGF7q+mpTiZoI222lEGXjhUZOe8i6dT9dMM16YILK8zSaNgeeQPZ
         AtOYN+PMz/1lSc5iHIL+Y2xi1aM+dM4BqDjlsXcBbVxgvJPIiBkMCOtFTaxirllohYVq
         jaKz7qIHYnqKLY2Rx11Diq7ErC+TxqMHCE91QeWGT7UayAN49ON1zol4e8fZlANsQNhn
         DcM41EUnh17e0HEEgIeRacLpvhJuBsWV05JodBw276Y1m/40YIKW2nBKpF26Vj02DXId
         /b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335952; x=1794940752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=YMmT61Xr9WYSQRdYpu2FUSDZTwDaWIYSIp+QgodDN0Rfg/8v5lmY8D5G7xuzOJSnyG
         vA6lbENnaxqM2VCLvAOy90I9Feh77nHgI+wBnfb6CrBNccTMqv7+fHM6AgPZ4S/XRHwM
         UFEHmhO1Mc8mUu/oyHc2rF7zkay2JFpVUn5REtX9EFG9aCng8waZS3CEz43Wk5BZHAH3
         Dvgxd+cI4dtmCEHqiQNdTuL+0ZaU59uNx9LpPMlYw7kpSIWaPw0L8qXsljwXgPiHBCJL
         ltL/q99UffBjVpFENJ6w7zoneb0kqW3dX3+lNrm5bZWKuYDPHVdSTEujb78NBijFDwaz
         VZqg==
X-Forwarded-Encrypted: i=1; AL+hErGSV3xTBB3uUEqsjLuEqgQOWCpdNYk4htqzWLmjCQ1Odu6UZkNFUYtgkkhCerV+GsoMjXitnvRYcd2P@vger.kernel.org
X-Gm-Message-State: APuU4Z/5ymdfHpNdFGhjRUT2WtTTjOTia8OXSsLxMO676wCS7bbUTPYd
	/jB15cAZv0AyziPT7zQajOAEr7NxP6qtDPdN4f4Xq7n3z5zkDHL9Y4B29axT3jsO6qrpD4JFZ+m
	kHF/F336GtSSF8qoRdRpOyS7Pt/FF0Y8=
X-Gm-Gg: AYBFou2YX+K+l1RWPQJm0C3Mh0QRsWngOWWMxBCYbPYaob+a1pS/Bl7SIx3tUWE/FMb
	h+hZ24PuqQuWhWU++C47s0yfJWdGLZr90EHqA9/Rp6E9HyZVaSVgOuE/+DV4yEei9borjv2drPk
	8f1aH9JUHdCmfSs4QDe1ilkFlTS/IPoFlgciFBRlPYIz/Qqs7M+4zJUKB8zzUJmb5h+pUaUMWM3
	PeumaXWV4tIdamOmqN7lbVALUepmC2WiHSF+igBUWWEMh9icc/9Ff5MfoE3SCPuRb/pEw47+37D
	8xv3aHCxAP58Ebm9blTniGBET9SCwwO/zz9ICvsKcOJ6HnSRev6RHKxAR4voy2t5pBuvcIBTjgR
	s9GBdNXuMS02PUrnDQRJ8uxu4K7j/3eEN9Gt0Yd0rIqe4+DTRDMIEYEAJOWsRYnhoXfpF2cA0hj
	l/oNc2lTvRYC373IzGSMUtgOZOs/hcheZYDlG3zXhn+p4mxZ8k
X-Received: by 2002:a05:651c:b12:b0:3ad:de02:e9a8 with SMTP id
 38308e7fff4ca-3ae0967065cmr7621621fa.18.1794335952183; Tue, 10 Nov 2026
 10:39:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794334398.git.stefano.r@variscite.com> <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
In-Reply-To: <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:39:00 -0300
X-Gm-Features: AclHuK-Z_-LDXVn1T9DAos8gp7iZX9KtLfARNWk7UgbNlE7ndGND8A4QqRcbfD0
Message-ID: <CAOMZO5AuK9coQ5m3h7s3teW-jrX6a268aLSsgVbt2cbndGVSbA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mp-var-smarc: Add support for
 Variscite Echo board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Tue, Nov 10, 2026 at 3:21=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       ft5x06_ts: touchscreen@38 {

The ft5x06_ts label is unused. Should it be removed?

> +/* Header */
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_uart1>;

Shouldn't you pass uart-has-rtscts, as both RTS and CTS lines are
described in pinctrl_uart1?
