Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC649E157
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086543; cv=pass; b=d66D41CdXA+wyVysIBjCOMY0YEbyN+GEspqXfklIoUksTSWP/M2JME4e9cKZ9KhOhAJKEE2dqBVKeOFidHR5kGQPNuL6QMurp7tm7zttAJZ1DAYhifiVTou7tmpBBooCPOmAkmXQMP0BWvOjdue896Ghj8hL6D9wB7j/nOkwQtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086543; c=relaxed/simple;
	bh=CA+fAMW6xZEkmh5ZL75MipQ6Llb2/zi+5i1YmY8+u78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMm9JV5ljv7NY6id2nWehJy8X+KXPbsS7NYzbQFzNYqQ+EYF1MmxwYkxB3RChpC78OooU/xCQOtdPffmkr1c5qH+xLSjDrloWkl9KCHJJ9hyhwus/ZQtug7Kgw+jdazAXtImfwQWAVkTVQYoBWKAvlKiD4AlUcy9y8ZVlOhWPIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRDTKmys; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRDTKmys"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-86cba60d4f2so1960697b3.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086541; cv=none;
        d=google.com; s=arc-20260327;
        b=EfaEkmeaCFTkbPqQ3/pP2LqKO0t03pNjpBWSgMD5mud8H+wKcEeZ3V+U96U75sJshO
         XIYgRqGeUueTmPNsqrAox4pj39mOkB3CZjr8o/SJDamYm/thLLeDz4+H1JiOhZJ8J3a8
         T2i0j0u4yz1WIKsuZFbQ9vR0jNuRtSwzZo292Bnz+ELDfZZYJSCoaPuD2S6WKAkV9539
         fJojwPbo+B1ywmdrQpNoYT9JG7R3NIWkmoEGgXnjj43b3s70ev/uOnIqCwVaZu/oWeT6
         VLTQXTKSoKzb5Fn31Qs09x3JebUMNLAAfGl8KZCsI/La/MDm9Jquhp5rE4JZ91zSncIz
         hr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        fh=4Xe/OUXITK0E0N+7zaiXREWVIf/DmlGREQ2qaeOcLEk=;
        b=jvNsxe0/kTz5xdl2deqAEzAk7UOW867ek2YdRFNMJn9kzpKU+VqK4LcJdO/Cnqv3o8
         FEcPfps5CjL1U3BawvhCC5aupqXh9xS/+MrmsBiMFm/wG4jScYBH8z+MBuP1gIshPDV9
         HRDHS81LMnnq6DDFer3tz90RnNmjAhUUub+aE9/75vpu3i6MoAuc1sRVzUAQTIKkpcl+
         iETc0qW4o5Tp3MGq09P60zz6qWnXRMXpjW11vhN6oS6a/aZALmfWLA9+Q7ZwCrpypx1L
         lJEo0xL+4ftzGT2nA5zCLzkYfzcRXKGlQcOU0I/V1QObEznwvRynllaOB/fmjArorawu
         Jt1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789086541; x=1789691341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=uRDTKmys62AZQyCrwvHqMtVuMQsbm5Y5hzwsaPqljHYaWF9yYbs6LYi5Y3hPHyn0c5
         itJhPWxRd4qFlqmKPlp4n/GqRN73hCN/VYkyQXY4OvQLZafogsurHnZqoGKyReeslNHg
         Rp+IP0JDeAQ5duvGzuzHTveWebWdMOXUVBNohIZ1jWcvqb6HXvzWbVtlcQU3t+mKJSmP
         ZXTQBUkjxp9x3pAkkPzfNjLKlVehAftUh1tFtb3/sST6hnwXluQqVsctSDq5kFRNVhOU
         w21VwHhxcJIu9yTaFxGjlndW1MU1GOwkk+nMrue1Equ+BudNqZgTJenJYb8JYUSiQXyQ
         8Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086541; x=1789691341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=mQ/bfs4bcjwD+6wQrCbXzyFP8QTDv5okoTEQ9D5l0TLFBuHvQI2r3EIqpNGS9BqzcK
         +jljvZYzcmKYmXh9qJ0vquxbFsqP1iTe764+v4wn5j8pc8EjXhyDPD4dHvEOimj2rPsh
         KvG0CG5O/hDZ4FOQoa6FPFLU02RBMUbtTYIbtGqBVs2LZj8KXN6/RPaJ5jwlirbKHxLd
         9NU4lLoSoibk3AZmnNxc7tK96aUuY/TonTJ74yymShYfvbH5PA3zNAM/mRl6pOFXZrEY
         cXXVMjnAZ46QyaLPPwLhKhf0Fp9Zib6iq7sVnV7/s7MRzYmTsndMEPAKl8jYb2tPLr3i
         IpxQ==
X-Forwarded-Encrypted: i=1; AKwUvBya9X3O6RET2YyIKwe6wbCJRpaMTQCWDr8WFh8EC/oyJBkONBgRIRpE4fgRIgTi1KH84cBHwyOrLcIx@vger.kernel.org
X-Gm-Message-State: AFuF++mfDEkpKjd9pcjQjVcJugBFpLr54TGnwAGoPJDybYn6u45nIzoU
	XTwlpNu0WAElFJlTYbsEUK7m6fyyq3yIX1ZYXkVplLJyH3GFPbZCMOsia0c1tSk2z7DmVjS/md/
	M8v4UK7HSGZGLxMT5+UTe65cm990IRwRtHsNqAFGR/A==
X-Gm-Gg: AYBFou0ydN37hZh3uG9SaPbBYYZzdq+PEOVox23mPsqvo7wkJXRnptIl9wYl01rMZow
	WJdW9psuPTuPfCGpdHWeTIPHHsGqfbCnhe6CUvZhRjDVzl5ITV6GEC/vzt8dUUqD/xq4IVLrx3R
	tVwTB+nN2P7iqY2l6o3XZxYHytOOSonZsEXwGeWhDIfFnIgu+qo3VhfBRtuX5s7FPPYphNj3mg+
	42a9rEZL2D3w7kxEd0ts74DXdXBdN/Et59pqQM8C9otDVuWDcIzJBfcN3T1Wj7mWzXQUPmBavzD
	YKHiIC6ySRb8D8HffB09z8lmcjijycicEY3zmmo+l6XsUrbeq4hbSdcKVJKh6uWJiPggy9xP85C
	wPqohHNojjpLQCQ==
X-Received: by 2002:a05:690c:5805:b0:869:adba:625b with SMTP id
 00721157ae682-884af36088bmr6196187b3.25.1789086541234; Thu, 10 Sep 2026
 17:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:28:47 -0500
X-Gm-Features: AcwNN1X6TqUaxW2SYT093nOASK8ddNR0F67KzkQysIy08gGg7L37ANaw7yFR2e8
Message-ID: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 3881f573ec08..0b614caa411c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -163,6 +163,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x40000>;

Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
kernel (v4.14) also say the APM SRAM size is 0x30000.

> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>
