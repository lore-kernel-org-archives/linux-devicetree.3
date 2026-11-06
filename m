Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987371;
	b=E2xnNSw7qntfmUHe0TM3dS4YL0WI6BYCuqQdNxcp2l2QlzLPQlGQOhKQzbp83+dV/DWZ
	 CaTegKijfXTfXeCxwoiORuQmXYtRBnh+QnUpLcGajcs9+oF1NHfPvSra3z7zqxuVGMce2
	 XsvW1JpxGaA4GomjeNPomnuucRuhdZUasTCoO2YiO4Thc8kM6xsXUCNoC1itU8OE9aPNL
	 vD+0ohWP0EKwNLvyO6o971Zrqk/yWftwg1F/5nuzkZ7Ip+apuAaycK7d0P6zwUqfLVA8M
	 Hm+yGbJfXmVqY+cZB6KxIBDq3E4F7S12mqWX32FN5Xx6N1Vv5OkEAr7u4a+7u6vJCEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987371;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
	b=2FMYV6anSUzgUjnnKQfmaOi12gI4bs6DGMaNfiFVp/u2YgFQ7/0XqlG3u9itVJKtJ+ct
	 vFra4p5677+MayjcV0H1kNiEFRJmCDfC1Z1XEEYyzsUt8PkwvkmQBZBa9c4HygTOn+YUO
	 icAmDc30hUmSgpln8gZGCynP3qAQaW9Ap7yY+TlAEd9kYMTqBFlb5cUtAUqNg2RwYFx44
	 LEEG+hbaGhQfdVISojfAp8XPwa0ypVyUJbPSYNvHQJm6A3tFeJjdmvj9DWbceGRB8e6rj
	 9Li7q5nKn7IZWYZ3x4T7gunQOM70hpoHdNXN9aKfhmb+dgBPViav8Egi6sbrvnGsxvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22426606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22426606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-843a4ca671eso411419a34.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987370; x=1794592170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
        b=lKQRZI9/26gYP2dCaoaLmYtn5HiM+zK2cqkuMf4IWoNf3TPD6Pp4EezT23KsiNsB8d
         T3X2T5ML3xOdO/RU/lldCsGciFNHpBkMsWWKMWIwMTYmLkmfuxSlP9KyADxG1IHBRIrH
         5VU8JP/sWYcdJfnJ3MM8RiAL1P9KKu0Jkkqe7lk1zjx3yzhAsLt5kxhaLXqVWw9RV3QC
         wdZVAWLW6s+jyy5oM95OLy93zloYiAVnEO7YEpUceA1ckMLcRPdV4HpzyVlyEBCbWVWL
         /OBbeMQnG7gr7kLKAh4wEX/MiV2c34c4rnOMVConbWiC/H2o+kTX0frYqWuMXFtwtVMZ
         WznA==
X-Forwarded-Encrypted: i=1; AKwUvBwO8KLZHbKagP5Kc3iGdybzlfe2ofMA88okx06NnjFs1dNzLODZ59PdJw94jLov1dYjKrTLZwdnMtil@vger.kernel.org
X-Gm-Message-State: APuU4Z/fCVNOa26huZNn9jgIFDclwqRPc1E2q/ZhmWjsdoBhglOziDiz
	HjxzUoITXB7nsBaDT7keLA1n0OtkMycZ8K5DZ6n/KSHCXuA5Zs8NlRDYAd3GTNpb
X-Gm-Gg: AYBFou2jF+rIALeLv5k9fFO21uxKo4CQPyhm6vQVFogfQz5k2TJF2wH34Blh4+phY95
	vdigGXxiocQyP/rYl/ybAzEUco0vo7pMh+AQ0vcY48eKKNR0jqQFLOaEiyyrUiljrRXnZwXhU9Z
	3DXF15RVJ4sGFbK8ZJpfJWqmHIQKnwCx6nGC/sOpF+bQq1qGKxxTFW+kJ+xLwB7m0luVp60Vgmt
	UaR72Ayt+YwSFaXEukeJSXVB67+Cv2R1xmnFjHxVGLtkd9VARRNZvszEWpNXH2VRc6H6oHO3VxS
	IYjUi44tyzerLqxAzMCuWTOP1F1iYn5BCE/Ket3wpNaebyiEpYXRLsncZx6CJV4i8qrF1CzPExI
	8cstQX1ZorNklueF49iRP9DScpGFL/yR9MUCgktyMAqb9Iic/DuYcxS4iF2keyzzZoiRWhcid7y
	9A1a5gDSAGtL/LxBfeCSawGH6s1S2+aZLjdrV2XWij+JnIIU0JucO8Bm6K2n8ivP12Vtt8V409Z
	YMTPKo39eLDH+kv99IePMDiRiHqVCtE/YpmO42V9COSXMJLPURIjVOCQTZ4IgYucb/z+4HyXTx1
	IWBY3qlsqLtNR7XO1D27PyukzT6Vg8NCBJZ4AtqkCTHPtoDvUjlmg6bb4oOl/PIJYdGmJa3UXkG
	EcQQ0j0iLXMkzaQF07j/lETwIbK/b7gZAOgjm9CDLLbTUtyA3YbiKPkuLKpgq905McDol9e6Hwj
	U=
X-Received: by 2002:a05:6830:3116:b0:819:28cc:637f with SMTP id 46e09a7af769-85f1cb6d060mr3965101a34.0.1793987370026;
        Fri, 06 Nov 2026 09:49:30 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbf3741sm2450411a34.9.2026.11.06.09.49.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:49:29 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-825b40f8a26so394658a34.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByTsXuZj/BIJwtUCTLycgjtF0Im8uGsflfC3qQKCUqAZtd/JaSgE7KUOfXhR/3AAtPnCxnDeEcjk+bY@vger.kernel.org
X-Received: by 2002:a05:6830:270a:b0:81b:9d18:75c with SMTP id
 46e09a7af769-85f1cf95bdcmr3174058a34.20.1793987369358; Fri, 06 Nov 2026
 09:49:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 6 Nov 2026 12:48:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
X-Gm-Features: AclHuK8hoZuMZCPNLtXxjvtNoRHB9-OULlZW_Ke3tPYAl1aigN1s6wtlzqMd3Lo
Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:56=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:
>
> Hi,
>
> mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
> this makes the M4 device trees broadly compliant with
> `dt-check-style --mode=3Dstrict`, leaving the same exceptions:
>
> - the property-order and line-length issues in the generated pmgr nodes
>   are left as-is
>
> I checked carefully that the modifications do not cause any functional
> change in the compiled DTs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - Also fix indentation related dt-check-style issues (mixed-indent-chars)
> - Change the ordering only where the issue is still present against
>   current linux-next dt-check-style.
> - Also fix any remaining line length issues in the t8132 dts except t8132=
-pmgr.dtsi.
> - Link to v1: https://patch.msgid.link/20260924-apple-dts-m4-dt-style-che=
ck-v1-0-3ec651d75baf@cyberchaos.dev
>
> ---
> Yureka Lilian (4):
>       arm64: dts: apple: t8132: Fix indentation-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix line-length-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix ordering-related dt-check-style issue=
s
>
>  arch/arm64/boot/dts/apple/t8132-j604.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j623.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j624.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j713.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j715.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j773g.dts |   2 +-
>  arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  19 ++--
>  arch/arm64/boot/dts/apple/t8132.dtsi      | 157 +++++++++++++++++-------=
------
>  8 files changed, 109 insertions(+), 82 deletions(-)
> ---
> base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
> change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
