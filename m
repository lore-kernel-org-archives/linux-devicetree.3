Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765965;
	b=Gpq06aLR/g/VbT08HF+kx/lmKnOHVB68R14dtW1d2VMVzJb5Djd1ZGaBA7VbX28Cd9Cx
	 dhRCOrpg2VccfmWXt4ySNpURs2iAuBpj/J4O8Hd/VyfwsHkPD5VF/XyBwY9clDnNKDOwT
	 mUOd58F5DNK5cPV4rdDPuJJIi2NdBH7tu3iYxUylmjVhOchwD35N0eKgYWQxfZGGAqnjo
	 mwG37Y/SRHUdsKt8eWppWv2F4DaJ+XmD5WO8T49dJUMh2kNiNmzmmB70Rp9hzqvSXkkQd
	 0MzOZ2alBmukiVbOojIceRTJ7j16OlF8RCOkGKlQp9EvVUyXVd2oGpL6WRLIFA6xrkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
	b=d16uxncCuntvuibxnx3HA/Y+YRsmbqJUwggDakKppyu0pGzAs8TR3wdR3XVsjWGMz6CY
	 h/JZyHRCbaAcazSOXWr7AYZjDVJ2yNaQlYc99CepRdV0+oexeAHzolo0yvuLg3ORWTk8Q
	 5J4sC7gHKRJj151V9MELvFs24YdAFb5A1v0g8cfqca8KRlTiMfKqXzsgVAVpzJsMgvBnn
	 M2c7WCST2mCWwLJ3bRRzG7eAsAhI2WBnNv7lWgyuaFjwn0rSDRhQXgprE11Lq8GDSDJxC
	 PlaCwmnGUhuZ2/kBk7PiuY6e7yoQ2GPAbjagsbI1g2CTyji0FqRkcFEM8WfCA8joQ7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fMoP0H2Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B0606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fMoP0H2Q
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so797675f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765964; cv=none;
        d=google.com; s=arc-20260327;
        b=lYXXdDTbn4K+lfyQBiP99x/wBWOGYegLCGzwvJtofQlPUMMch8GGyMXYrA94ZSw7hZ
         5oBlvUNapeSDnd9c028N7bnPXNAxvaKBKvHhpBS7SBsB1eiQVoRPhpngh+sQ/HkBbZ5i
         QULiQE9Y3ITeeuAzCFhqOJPXO8EVaWjPcMsy0q10fz7nC4HZACvIGuAkgVXc2dVmWu0M
         YV8DwQuIHWmCSGwy2TYlX131p8n5f/fp22My5YztRnr0HRuIJaOIk0WyEEO3XCrwTNbT
         YJZVWoIPdtuXoHDJ6BzNjSvOeK2/g3nw6gyrhr94US721dcLFL3mQlTZCmQnHKpKZ7jD
         wTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        fh=Sg+GH8kCXSLv8LlKS1Jkd/J+g1RVm4unZedn7JQiba4=;
        b=S9dWxsxYQznzXuglgei99zOQ/2i/IubGuu9rOGepNYecIpKbv86MXMQzgNN2RkCa0r
         s63GAQOktwADAXj0UmRo5RYrluAKFDyXFuAgfyjxz29t6rAPzVctMx+JfVGPqy9IWoSD
         XxXUxGw3novjmJTjKoK4XhKSySFatKvgYj/16j583rPqh1JZ1Hron3N5aWb0OesWC/kU
         1DrygysK7PlAUUNu0/WayIidx166pOYB/oDp1R60kSIZGihFMEXpJtBALGDFj1k0HqRY
         19caEYVxBJ51Vx7MIz6+8V53nhKk3Vu3faXq9kEqojV3r9AC/XrzllIMFks8QqBT5+9P
         B9kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765964; x=1793370764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=fMoP0H2QKNpHGwuXAjxXuJcMZCnKegravDJQMVUHj9yyTWYdJWfi9RH5cgT/8IHBbw
         JH6R9bCShRqKMC1Xob78FUMdD9csZTPK3lnGW0TYplitrpeiH7/KMMf9vfaqtnrvs8HP
         mPxghVDeslu8gQ2L2t/dCSC1zClcjLn43t+UAGSS6/08juUKCRru7PnXvfVrJS9h2ggx
         5ZOmrbd6bsKgliAl/0viwgvGzIdQcYsLGb46QDW/UW5MMdzxrh7KrLydWGLMitHj5kU/
         mCWWPdnrvcVolsZsFjnXRKXlBF1/dwvz3/vSJYMtJbPxvnZuz3NlmoiIO66VEPwmhFKf
         5+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765964; x=1793370764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=NQ6CoGKJ6taxzx4ieEZWHBmmoJMQJNgom1mNo+yWJ9cPdSTIf4trtVrcQSnsXwNTWj
         tqt7PBA5ywKZUgD4wB9jItcS7NTx2AQUEyOLmQH2K0bDv9cMDkXKiq93Xaw4TYUviqeK
         lGr7GkEKbsx1V25MfgjqRWJZcYAMVjTQCQGi+Bclblug6NK/oqyqvhAdxFoefDcdABKD
         bPTRxtaR6zjFBZorQHqbLpsiY5cZxVITSujkJPU8JZtMj7I0adVUXmGnK4GHQUgaqWvi
         GMB7FzPy7XYK8HVaR4jDrC84sjAGKKXqVMy6ggzLrXDUk1O34aPE+0wLwNiGsvvStJox
         uBeA==
X-Forwarded-Encrypted: i=1; AKwUvBwC1aRcBilnYV3YiXRkgwZS/h+KT5a/uQeEJq8f82rD1lge8ItBXD/HbeJjVGROR/LJcVKq0bZTV2Tt@vger.kernel.org
X-Gm-Message-State: AFq9FYKlZOGIGNOkByZimDDDQzOU2lJkvzvk5v9uKGTG6h0pxbV7egBq
	ADqga3YwUgtQerQgyqnudgipZTUEb89csJ8tUIRYKhStKlCAbfJX9sgAjHRyRCtoVw3XyVfkvoL
	H7kzjjMpFpHdWPIIwY/zwaFtT1kR6gtNrb0XLAUovCw==
X-Gm-Gg: AYBFou1mhwsr6kK3wsNl88pTA0I2ngxDq1smLnMT04ytuaC8EjkIIVkysuzJePeZmlV
	rOOMIR3wxLr3Gl5O0cME729cGjJmd8pT9lNMkl1C8XT4V99POutIbNO63h9Cv0P2qkJxployMwz
	SfG+psrPwmJ9VJ4oIToVKbO3XKthmA/NYMzGtc/rnOP7yQiqK0RBIBfgFLiL3/9h6vaNOk/7Ql6
	r/RAWPb7Ah8NEcxRzvsfIC22ArRFTHWgg9I4Nwjrq1mTSrpTzGlxhdhSk6cbMx8TNyWU7/4mKD9
	r8ICBSNqluymS6/VIBvWTQtAFitds8hZqo/9Sfo+Z7qT8BtJ9ZoaIhMRvq/tVh1k7INgvm1bOQK
	qAzwVTpk3K7K8rIGxyTjvo2NiSNHKWX4RoiaVbzyIqHhCew0mDvlibYbq8Lymw3zMhiraDzWVEF
	twZHw9RRCVv4lorT7CS8F7HWTnhEie1sG1VcRSb6PKTygbpev54+iRu0Qy
X-Received: by 2002:a05:6000:98d:b0:48c:7ee3:e07d with SMTP id
 ffacd0b85a97d-48e385bfc42mr3907352f8f.52.1792765963409; Fri, 23 Oct 2026
 07:32:43 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-4-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-4-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:30 +0530
X-Gm-Features: AclHuK_j5l_mLkVqrJqA4yovkMFdDFBB6LDPnRF9bN2ny94R09y2JYZPHifdEPA
Message-ID: <CAAhSdy3rxvq4X=AFx8ps9dSwKR6Rw6M7m8ra9PEbV42tH9o8Vg@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] dt-bindings: riscv: add Smcsrind and Sscsrind
 ISA extension descriptions
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:39=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Add the S[m|s]csrind ISA extension description.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-4-7909f863a=
645@meta.com
> [pjw@kernel.org: use official extension names in the patch description]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 16 +++++++++++=
+++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c0..ccff2be1224d 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,14 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>
> +        - const: smcsrind
> +          description: |
> +            The standard Smcsrind machine-level extension extends the
> +            indirect CSR access mechanism defined by the Smaia extension=
. This
> +            extension allows other ISA extensions to use indirect CSR ac=
cess
> +            mechanism in M-mode as ratified in the 20240326 version of t=
he
> +            privileged ISA specification.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -226,6 +234,14 @@ properties:
>              Profiles Version 1.0, with commit b1d806605f87 ("Updated to
>              ratified state.")
>
> +        - const: sscsrind
> +          description: |
> +            The standard Sscsrind supervisor-level extension extends the
> +            indirect CSR access mechanism defined by the Ssaia extension=
. This
> +            extension allows other ISA extensions to use indirect CSR ac=
cess
> +            mechanism in S-mode as ratified in the 20240326 version of t=
he
> +            privileged ISA specification.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking a=
s
>
> --
> 2.53.0-Meta
>
