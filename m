Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBBB2147E6
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273404; cv=pass; b=aA0iPih33RUW5eRHvBxtEhRSavOi7BYg61nPXWn2g/WU4ZOwZ3FbaML+/NQHMF71Hw1855maSEk+YZ+vFK8r7MVok3rWbMly4C9SidhIUYvwiPJAdp5JtfpxAeh4uNVfPGKqilrrcL33qQ2yFy+mwj+MDtBolviD9vcbkQEgQ4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273404; c=relaxed/simple;
	bh=fdyYtJLtjKBQJv4jqRopDa32X1ZpejqoxxymTnmIn78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCTseh8OKRw/G/0Gmlg1s2Dp3p1cIjwM5/l0CtbokWugH38WsBYVgA4wWRkophyri/RBka3GbJQG8NtcdhVupwpdYtIa7ipkkvOGoiaLFGxlsWQr7aba16d9sN5Np+IjM7ezlUpqu5p9YdBzaLXyj9lISYShkf1stZvcq2UL/Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcP5rIBW; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcP5rIBW"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso3605993a12.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 13:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778273400; cv=none;
        d=google.com; s=arc-20240605;
        b=R8qpWPwM2TY/Ny8jGNS/4YKMPaAMHzwCOyMXvIFG3DRi62GZRnJaHKnBo3YXxasFbX
         ahdc3qU2yzQ6ZYEpEYf8WJhucDVCaxV/O58SnNPikxVPyQ3CnhzosyHFyFFR8sGfJR0H
         PCqJClPrgsE1MiVzubTQ6c6qNs1TcgamlPqVCllcAXMMPcNUCXYZGL/rlp6bByJPyz60
         VivlCcbPK5RNnYIRLBhWDZ/F09rdTys/gXmzBkXKann7Y//+EP299ue3TArg/j8NeSjG
         kyVfpCPwLgKPLs8SQDSenFM2LWhQDQpvYehgpzx6zr2JoAw6hnRuhhT3VceRZn34CWMT
         jZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        fh=tTK7tlIIn8uV5tOmwO+9ftNHQ2Ow812jHx/gmBlJZLA=;
        b=RW4/yu+XKF93TGUxmQDLNKHtJ3qKrUrxGcaWdQc5J9uSv7agHQjvCvIhHcM3uWcvwo
         q+/XUJxopKeTNtYasyZ1tB7lwZ8gLaV49nYVJIntXCw9X0b4on/dX08evJtln5WrzCeo
         soasP8EaAEKVVFFUD+rH2zpZhUOQ8ogT1waTbufVI2BktIm/+9YrUBh71mFGMC35zjhf
         5Ycw1TSNUOHvbDvlsCWtRLHV/bdIEMIInKQRx4mP4kouK4hKAu2vsTO9VuIXtadYQ+l8
         Nc6oc6iAx6Mm/d1oU3cyxg3DraMowMDi2WcSYjBI6l/wBFX3bXuXDfmtfIAsHY7CPQrF
         258A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778273400; x=1778878200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        b=kcP5rIBW6gqOiJl5twjlvffUxmDWx7P3xNydjQnO6Ii2QVeQ5eG5HdMM2IJ+84qUq8
         66jGN8pkwX3RIbXR1B5DSsE5vS3bYqOvlNhP8J12UG0nxfrFQHLrreMTB8Z5S4E+VDj8
         1JALz3xtPNLEWP8lU3HIXF2Bo/97fx6JzsMUuNW9KOlCy0L8P94UAmw+zjfyU4li9wCS
         fs8paWrwXOAqA1Ag1YWDDN4pKoYyIYwFeRYzVK/HfFoplfLQIsldygHE4pq4q7XnmshT
         1bgZoloIZcOX0cqMxSbxtdZwq3yTlYzR6llq53IvBIqwuhxGUmfHsRYuuAJvnUt0kZJe
         nEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273400; x=1778878200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        b=eYSN6VrTYX4suNCDfUQ56Ta/5ORwIQu4mOUOHOvQPkhLIT3sUkS1+jjtNMsSUV1Y6R
         87vqiItK3gPxYdbNOO3jcYsG//W5ooKqBAfB3+58ULOKq8ivtD3XV1kqWTRLdrpQVigl
         uX60JN08D1gmV7xNcq7vGRwyWLyBJVlS8iIOgMZcxLimJ+vWl2ROEsKn+4YRrA9MCylQ
         JQUQCuJCUaOPXBlndWAxciqmVb9SmqlHZQbtcco9WVi9QBnMIMM61A5fqod+6OvJeObq
         UMjHiDcx37Fkm3XI27LBIgrnsMrts59nfaSYoVGfSQL7X7xYIBikQ28SiIeAnxcQtPsP
         KoKw==
X-Forwarded-Encrypted: i=1; AFNElJ847bgOAif9I2f8MzyxzGZC//e1z71uIxfyuLcw+9YvVODVopZWmUOxc/ppC88jQTLo8RpGR6XU0zIS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd46H9+7kLlMukYfWPwU1nd/my+vzvCizvlJDl8oGsjKg+VS4C
	iQv2FopuSzF0sfQQtXF36oEMHz+uzedTa/CdQ8J0S0Gmel29VTbV1l4aQLxZH4fMqmfrQq/Vc3f
	2WNluocBKTTZjgIj3fLsDE34x6QUfk85Gi9KmI2RN9w==
X-Gm-Gg: Acq92OF9L0ns4uLrFSrOnoNxDflPwjDbgobDFwNVXQZ/G6Gz4RJEMcFFAndFYXdK+qX
	tm/n9rXOJAo79h2ohxVJVJwM8oGmRaIb6LDtCmCFmiMcuZis20nUYYfRYqvLFRDYRBhJRBhbEkt
	vAAotLxHzdwfJ6g9M4RJXa0L8z4aIFCxp9Xaw/IpzFXm12LuY19p6n7sq3N4BTBohD1A+sZzzzd
	ryL5vsdaB2KJjHqGJwBGUQLSFasMrONQ2l6g68ksg6xfUF7BJM/Vn++z8JOLDxMrQmTWOMF0WYW
	1r5ndC83t/I6UdxkK2CCTc72XhQtvUR5p72/52Lq+w==
X-Received: by 2002:aa7:dacd:0:b0:678:960d:cb34 with SMTP id
 4fb4d7f45d1cf-67d63d85428mr5050590a12.6.1778273400285; Fri, 08 May 2026
 13:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:49:48 +0100
X-Gm-Features: AVHnY4IaFcTZPm9giV6Jc_QJYDLmEM1tYy3GvJxgbZ4vj91rTyPTj-YVRCvMm3o
Message-ID: <CADrjBPoSiZU_BzXxQiU8unJNSqE8EFR1YPQe25rN7fhfLP2DqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 02:56, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
> property for the 'samsung,exynos850-pmu' compatible so the driver can
> obtain the necessary syscon regmap.
>
> The Exynos850 PMU relies on a separate system controller block to handle
> interrupts generation, similar to the hardware design of the GS101
> SoC. To ensure the hardware is correctly described, this syscon phandle
> must be explicitly provided.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..6550c3736a3b 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -182,6 +182,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-pmu
> +              - samsung,exynos850-pmu
>      then:
>        required:
>          - google,pmu-intr-gen-syscon
>
> --
> 2.51.0
>
