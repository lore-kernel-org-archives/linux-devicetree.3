Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795845466;
	b=KQQ1eRFMqmu0FqaYVtoVws8x9xtBz1lygUfSOk/U8bopY6kiPz1ow/OyLlKmpiJ/02T3
	 /E2VIM3uv8WiR2Ap8DGU0h0xCDvoUw5X4nuTMWDAwZ1Jne9M7rPTQ2XFmumBx551ZHLYN
	 DiidCSmBBW4f+0yG/TfLWAGMwKSROTHKXXmcv9iCpsA3rkPHLA8iNw9I/V7D3g40EDKWu
	 jbnG+SkeDfjQMnmyGaJcug0zBu7lQ+LnVLFqTmlQIIgsebW1k6JjrwETTr9FTNyJLu6R0
	 bNIcTC66hzv1UGG8LOPkf+3vGu2cqCW0AQGMNKZEBW+Hcr+LWqKtk/S3Tgfnt5q9zPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795845466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
	b=hCRDcAJcSZBQpwkIMyopxYJGw/QU4OETGXEJlqBIVhxcmpdItJ4yBl/bJxSlz0+BkzT4
	 AAbB1WvaVg5VtkGjWq55vJDC+LKkMqFvygOB5d6ktxKPYR/RB2BNVpMZASAx0UbOuzQfQ
	 qr8wc6uqF6+o0TyoqzgKLKdMB3s1eEEY3b+hwcKYd6CFtgsw2yUKmkTSMDZRKwDJMErkG
	 SDyuwpkaDEccCpk+FAUlX+OtjnRw51DUqSQvsWu4xt2OFgaCJz5+smZMx7TIrHU7CaGAt
	 Tt8XuPEs1/LepbCHOWoEpMABujsavaibL9E5PrH8Zfglssv2sDIlDgR3arPE82zhM2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmrVlhXl;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D718A606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 05:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D718A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmrVlhXl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so10665723a12.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 21:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795845464; cv=none;
        d=google.com; s=arc-20260327;
        b=FMKblQtxBgBC2JPvCggWOptIIOBX6SYzGso0x8zwa4IxFSe+YBYwLZ3Q4LHXzH0cLQ
         Ymy6KdjHdCBwVIqxpKak7rnucapgfOsa2yhWr03fSHRKsKXEYZNQ7H3DvoVUz+S/GqZr
         9sMrQvsKhHvyN2IlYKvk8xkvyFUpCLo3DyQfglH+lJpbsRbimItKG961YGeh8KeaEu/5
         xch7+eaK6l5/BqexCzRap9IGv0WZ2pqZ9n35s80rYq6KlsUqB6ZAFsSQn8aI7S+GfoFX
         45g9/hV0ei9Cp6GEQUdtZHNtz68GiacocozMK+M3mAK1pi3XqS+dPg9Ss76M7sBL2vMS
         7kdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        fh=/lo3Vygo2I/uLQMRTLwRYpIKe873b2Owfo6OepAlcG4=;
        b=rItWvidROwMxL2+WDcCQacCT6+RlquRbW4Hiu57pQZ1SXONbI9f9iei6Jc5fNzxKuY
         Of2ly6EdGsLzAienZ66/WFszjtGb5E9B7TMpgxLK+XsVVKzpcBjuxG6NG2+vT0YUjXNG
         rBiRjnFFpNDW54gQVUUxR8I0S9dj8NUVkBPDpDxeFKjjYvcqnjHTBWrS2q7HtVLH42xA
         bAy78y+1vXExV9YwpcNib2AhjKzUaKygVEYU9965W0wmHEa76FWqQE8wpqagwVhbd8qr
         I5l1HucXAPG+1A5DPPwPkVOId3Y6fmAudzcIpdCnRMpk+LJhSvCXRY8FjlbZCr9LTOCo
         vdHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795845464; x=1796450264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        b=lmrVlhXlsaVMZbgADEPkAy0KVpZgtUOyXGrTxm1M/dNcpxO1ziLWVZEWjImIs7nMKz
         QS8M6rZjvi6UQ4t7uY0V7e86nAywZ+m4bZ9q6mxf4iJRVezZ9yBOGs1zJYsIwyWAiPq9
         KYilKGfeAoBXzFfxukar9PQfOhfOcx6QM9Pmd9Wi4JuQScrJtbKjRQ9X1otNCOJ1sV3T
         Cj5ct6gA/N0tIfcq4HwE8JZxAgVCoCi90dKp+Tu75zIML3qLio09zLpyp5JA1hVN0Lpg
         OsVrSQpCWzBTKlRmZf8CVVBuZm06DRtdcCP3uTaCtU0EAgH/i8IBepG06JXELgKdScq6
         VN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795845464; x=1796450264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        b=ZtWeoKMR1gvzbftTn/q5Odr/MHd/CMtzQlGu2X8S0oxHdyztkTXZkgIeGPImf3E3dk
         UG7lkxVGXhAqA+fcwT2KRpFEmPs5trANdC4fPflc8SdREZHYpCKHGopqem9yYWhSU/UK
         dKEMYGFPfGJXIuunyeEw5DH+itUQzyDtdYuFIw6IC70TlpwEJ3gejqwLyjarmAeESivU
         eqbiClbYjVgqsP9dMM9lcGsJuYadxQ6V1IKRDkSRyusQdILMQ7PN88cf1WjbdzdoAH60
         nbs0M4EyUt/lFdqW3tbZXY82Z/RNVoFCChalI97G37YFc8lydMiZjy+lc2agCFNOv4Zg
         c4XA==
X-Forwarded-Encrypted: i=1; AL+hErH5OAYRnmIgX4e+h1HFqqlfT5GhfyGHxA+RK3y+vtGPAPwo1v5bTY4ie5QKwsNcFgmH+9MD1WS5qh1R@vger.kernel.org
X-Gm-Message-State: APuU4Z/5JtZ6L05hk5fwwolcFHc3c9ZqD7kAkNltgmX8u+M1I/LDIXaD
	HToaBXIlWU3N3E+FXwN0aDCqw6iY4cWgeZFvuuz6sr0y8IaW6JokwLyOVb1Qy6lF5jBoaYKXfET
	j9fspbrLazcb/FhqI0qXdhv55d+r94mI=
X-Gm-Gg: AZFdTZe3vvt2jhqukaBwGmYvX+BpGXippJCjytI9Y5CxmrzAwPl6U+2IOK1+Z1t852u
	xHIU441yvqeU6kcz1i0sqasTNxS1NaY57fG2K+bCm74km8tIxco+wUQ5qjQmanHlryOw60VhsYx
	YYy/lnublW1yWmgTzCS0uoMHxb7CCheL9NqQdO2Osc//DpZLX7KfDzGoziYxsP2PCcwBNNSHljk
	9YxCCAwHgi8FWg9nSwngL2iDU1G4AvTprDIbXK2bSdAgq8WwTZkL24craECHdv8Vi//Uj5RfxZu
	5judK59dxZpUMZpdWucqEjACuO0TuIInV1LBmJu+Z7/jh6Ni/6zWGJJSQU0+wDCDfci4Dw6/5YA
	80DGxVVGjC9e/xFoiWG9lneoMzHpv/9wooaCWMPTdVSpiqIdNLIhiONhxo1TAqpow5A==
X-Received: by 2002:aa7:d684:0:b0:6ba:1e56:b7a9 with SMTP id
 4fb4d7f45d1cf-6ba37d60695mr15032079a12.12.1795845463903; Fri, 27 Nov 2026
 21:57:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 13:56:59 +0800
X-Gm-Features: Aa3M54o6oIEszh6kY4GXIp-jdXDpJqhKmrWjTLxx512KQpOfRsaHP5EMKK4ufas
Message-ID: <CAH2e8h5UCUz0hv203SsZROm_fTRptUzT96Y=ZBNozvD7ntweEg@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] arm64: dts: qcom: sm8750-lenovo-elden: add the
 Lenovo Legion Y700 Gen4
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:13=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> This adds a device tree for the Lenovo Legion Y700 Gen4 (TB322FC), an
> SM8750 tablet, together with the board compatible it needs.  The device
> tree itself is unchanged from v7; what is new is that 1/2 now documents
> "lenovo,elden" in the Qualcomm board binding, which v7 forgot.
>
> Why that is a real gap and not cosmetics: with the device tree alone,
> dtbs_check rejects the root node,
>
>     sm8750-lenovo-elden.dtb: / (lenovo,elden): compatible: 'oneOf'
>     conditional failed ... 'lenovo,elden' is not one of [...]
>     sm8750-lenovo-elden.dtb: /: failed to match any schema with compatibl=
e:
>     ['lenovo,elden', 'qcom,sm8750']
>
> so a board that builds still fails schema validation.  Adding the one lin=
e
> to the binding removes that diagnostic, and the same three SM8750 device
> trees then compile and validate clean (see "Checks" below).
>
> Relation to Pengyu Luo's series
>
> The same file was posted before, by Pengyu Luo, as "[PATCH v2 0/2]
> Introduce Lenovo Legion Y700 Gen4" (2026-07-26, 1170 lines, based on
> sm8750-qrd).  That series did not go in: it is at changes-requested, Abel
> Vesa and Konrad Dybcio both reviewed it, and there is no v3.
>
> This posting supersedes it, with the author of that series in the loop:
> we agreed on 2026-10-25 to squash the board descriptions and send the who=
le
> thing this way.  The binding entry in 1/2 is the same line Pengyu added i=
n
> his v2, so credit belongs to him for it - if a trailer is preferred,
> say which (Co-developed-by needs his Signed-off-by as well) and I will
> add it in v9.
>

Feel free to incorporate my previous changes into your series. I am
happy for you to take the work forward, but I would prefer not to be
involved in its further development or maintenance. (I graduated and I
am a 995 full-time employee, I prefer to have a rest in my free time.)

There is no need to add a Co-developed-by tag on my account. A
reference to my original submission would be sufficient.

Best wishes,
Pengyu
