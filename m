Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F0361DBC
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399112; cv=pass; b=kRu+RuYQb2eu5Kz533JDP59Em2lP3UHFBgdoheXpZypCMlgHBRsibvYOrg7o1zDIPSQnwT94adw9VZc+UWecoYvd5lATHOSftRy44DPMD7g50aTCENaVIsZUzTc3leHPnAE5/173ptHCodK2xqgp9LppH+xkNg7unZxHDDmf1Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399112; c=relaxed/simple;
	bh=+2ab5IrqPbFXNNIQ8XJUFEH8BXNrH+M+B3Q0jwDK8y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgprtxS24RNhvl2/Lkl9NtlN0Ns0amHks5SUWuqm7K29i//sYJfazlWejbIBXDh3soW2juh98bTgsYH5pvOIQ18DtaCkwE0bOTQCpgxmMgKMzHH9+bgPAFA0q6DQEzrnd18TLwHwTmKAHnyh37beYV6DrNGRyba5sPDBcfVbC2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH8rnOod; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH8rnOod"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a3342d301aso2491836d6.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 21:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776399108; cv=none;
        d=google.com; s=arc-20240605;
        b=XwkRcg8PlCXESLnFprTXy8sUkc5WjqzJQYcPqvNI1VH7GLYxFuncgPLDSujnQqlr0q
         cr9vRzFRM1gJ0DAmK9wF75QjqA99Esse6yiFouWtzxAguXB2EHPWlgjNo31fW6Lpz/9v
         mJYk90waOynyu0Mdj7cWJMYejwbi4TUVGPjUdwYsWWzskEapTZE9iRtDID0sDG7NJCW6
         FFchvJ2k80KqXO4L/6Slizh0U/5Jeacq+T1NeTzjJXxauSYTxo2vp87ORavLtvIlurbU
         CkDgz/kHM6oDo7ha4qEpP2vgnrtTz5IZRHCzXELOS/g7ANqxV97gi0FLRvrjljzYSQxu
         t6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aNWr/yLeqoiJfJkarHcqgujpjoQyDiWBvxAIr+NZ/fg=;
        fh=S7e2ufZav8KK6SK6T2aUDtgwulcAZnTdYbxwmqXFcAA=;
        b=J2RxD1C2ANl7kgATMyrsMGhjx3z3Xtrbf9IoNsuT87k4ekRzzGk1Bl7VzW6O5r2ja5
         9y7Ppg2m7DJ93lULecDytA7Zar8mrZHQI/wQ3fq3KeGxVW30dyTtW8A6LkLjsxNYrwlp
         zrE0rSTUz6cpbm5ulZDwQmGZo2MIMNv7BUjJDxcG4N9vV1EyZcyuaqebm4G1frAzPHhW
         jqNl77PtPOUqQ+7qjL+BL+1v+09udC/CZPXjmQZzraOg1b+ueeA8nhDFJH4qwOjk6JUN
         ZHcXlb2WUZfaRrtnrsefpZZ/+xdpdGrPbGr5L1CGeMR6fBOC/3+UtfoLcsn0kdWGAk3O
         4FQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776399108; x=1777003908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNWr/yLeqoiJfJkarHcqgujpjoQyDiWBvxAIr+NZ/fg=;
        b=nH8rnOodupDm7ykYjQuKn2AGFzEAuwnRouqcJyordQKDaP1N3tXdd8yFQYufSZHKWH
         F7dxRH2FpUP7kC2oxIJUNjkAT4Lv99H7zNuxbwsoB6+1Sai6UCLcBYHrsGYosJ25vTy5
         aI5QKcOpy+m5rf3f2CAU6SPF805a0TvVOhwitwCPjyFbfXuEmWFcBul8SogB5taWs32I
         MwIabDAcdXKyHDaFgq+Fsarz+5sX4WYqd33sV/Wr+w0fUxaLL9YjrMcMYYvuGlhjR4q0
         Y0Z4eB2FtNLs6UHF79XFeHcFweqH34qtLA2FhlUKhC5Ji/D2slgphNH2JQAey/kLPOQm
         ODkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399108; x=1777003908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNWr/yLeqoiJfJkarHcqgujpjoQyDiWBvxAIr+NZ/fg=;
        b=ruD/45Jg4lsNWLKSO0cK2AWUZBug/LLv30h/7L1Ln/xXRlmKet8S53i3dh6SnU98OD
         2UtHQ6pllpiTmVBJiqxcm5hsmS6i3liFlPTA0d8YQaNn71eP9YNo31bpOYvRuhywAQnO
         MJzuCdQxqdRhovoSqPaNqnqNmM1wCzL7He3iYPipJ/hFqvxmsvZ4v3lFZ42o+V9BJiUZ
         TDatVPqIpnzXfcuTHONVISmrfXWC9fb8USDvW2TkBqBgrfV0eRXtlN3L6M/J9f+hdp4D
         RkBih/3VFfGMZ3nRX+pxglIkWbDRWyjPRNrOGcitEpcXn0Mu/Tq+Vk+fS1IJfEzX0j7d
         U2nw==
X-Forwarded-Encrypted: i=1; AFNElJ9MApzonNiGjdchLcCJ5baY2a/x3mGt7cE6ffm9rmCn2saVpBg8GKX/Y+lSiszMQF0LJeBZBubx8HSM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gRpj+FY1S5BVm/LVPAInF5up96LcJZ6BQz5yEIycz/tn+LdV
	Uq2TRO/VtYnxXPpQJb1lcUDyEDuDj/oIvK+5RFGiKWi01PPaJIdR+wfOxSrQBhwdAsf+Eknc+lc
	cYFL/OO+U6vjuwV2IrtnPLK2x+Yr25rkRw+Pz
X-Gm-Gg: AeBDievOZ7CbTepw4+3Vvvxz+oZnjBSVz/+Ej3GIKHXhtRmpNIrw5KkURX1/nDR1pLf
	Ix2TOJk/h7+inTER8r+Y9Cawdey8KJSxWoOw/ofYoC+GOiNQhKZYzt7sT/thnTa96n0Z2JVso0B
	Lxn6LNTPrvSkpq6NgAu0+JXtebm40QYm6Xrtc8NEQnubc7RcfJk2aJvKE+vKXyaPQF4XKCR6uii
	mZrh9BDmyNw2wqhvUsvDqY8FWWKjGk3PVQS099sgWRYqz0Z6aevwcVFU34u5l4WpTu5MSC13EES
	IEiXWb5iOV/2h7wDQ2WEDt9lhFG9/bQI8RVn5TJxqLhTiOsnNiWepXxibCexffAcgTXlXjLYh3G
	Q3Da+IM/4mVNHziKOBSAxGtxBgVHugYG+K8O6
X-Received: by 2002:a05:6214:5b87:b0:8ac:ab13:8f15 with SMTP id
 6a1803df08f44-8b027ff994cmr24935216d6.7.1776399108576; Thu, 16 Apr 2026
 21:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416152329.6016-1-chaitanya.msabnis@gmail.com>
In-Reply-To: <20260416152329.6016-1-chaitanya.msabnis@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 16 Apr 2026 21:11:36 -0700
X-Gm-Features: AQROBzDilUU0qSd7ImlmaZmVdXmndkGf1PbYURtmqbEVARS0JSZHu4ZqyEUBOoI
Message-ID: <CAMo8Bf+jD1QiLOgOcu3OOnfHyG9XCdyi6CTTQ+uSREz7yy0Hrg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: cdns: Convert xtfpga I2S to dt-schema
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 8:25=E2=80=AFAM Chaitanya Sabnis
<chaitanya.msabnis@gmail.com> wrote:
>
> Convert the Cadence XTensa FPGA I2S controller plain-text binding
> documentation to standard dt-schema (YAML).
>
> The hardware requires exactly one memory region, one interrupt line,
> and one phandle to the master clock. Verified these constraints against
> the driver source in sound/soc/xtensa/xtfpga-i2s.c.
>
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> ---
>  .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
>  .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i=
2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i=
2s.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt =
b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
> deleted file mode 100644
> index 860fc0da39c0..000000000000
> --- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Bindings for I2S controller built into xtfpga Xtensa bitstreams.
> -
> -Required properties:
> -- compatible: shall be "cdns,xtfpga-i2s".
> -- reg: memory region (address and length) with device registers.
> -- interrupts: interrupt for the device.
> -- clocks: phandle to the clk used as master clock. I2S bus clock
> -  is derived from it.
> -
> -Examples:
> -
> -       i2s0: xtfpga-i2s@d080000 {
> -               #sound-dai-cells =3D <0>;
> -               compatible =3D "cdns,xtfpga-i2s";
> -               reg =3D <0x0d080000 0x40>;
> -               interrupts =3D <2 1>;
> -               clocks =3D <&cdce706 4>;
> -       };
> diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml=
 b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
> new file mode 100644
> index 000000000000..9a4a9db3c159
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence XTensa FPGA I2S Controller

When put like this it looks like an official name, but it's not and it miss=
es an
important bit: 'xtfpga' is a group name for very specific FPGAs bitstreams
generated for xtensa cores, spelling it as XTensa FPGA makes it less
obvious what it is. I'd suggest keeping the original description.

For other changes:
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

> +
> +maintainers:
> +  - Max Filippov <jcmvbkbc@gmail.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: cdns,xtfpga-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: phandle to the clk used as master clock. I2S bus clock =
is derived from it.
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2s@d080000 {
> +        compatible =3D "cdns,xtfpga-i2s";
> +        reg =3D <0x0d080000 0x40>;
> +        interrupts =3D <2 1>;
> +        clocks =3D <&cdce706 4>;
> +        #sound-dai-cells =3D <0>;
> +    };
> --
> 2.43.0
>


--=20
Thanks.
-- Max
