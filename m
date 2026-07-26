Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743B36654C
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077630; cv=pass; b=pJNHACpR8oFC0bqy9kT2FoDjdkTcW/zt+eNfsgy6I4Ue+4q2p9JOFwzp0qf4ROU4Q/RSZkPx4L162hqN7+dL7qRYlpBO1cZtcd8DWajYBWPBwqWEXStP+fMypejL178uQCstw7l+N3I/SxadkIhNQ1XadPpK7Yj7AkYygA21RA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077630; c=relaxed/simple;
	bh=mod1J03m0o/n/6SY4TapYr5aOfwXXYQmlrmD3GioYac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7CFtGKZ5ADBZoNoHGlPf5gwI9jHgEDQdGk5xlRYiGiVJKCl5yzM9WyooLZdjZ6crOmrmX4Lk4SJ5R652aFYKKWBKsTxR5OEh4pGE8hHibt4bVjLyaP8N8GezbfTuBMu+Is/J4gGFI+R/vVirE0JPEjVIOaNBlBAgxleffbQaqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSmpO59j; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSmpO59j"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69f4acf7047so273320a12.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 07:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785077627; cv=none;
        d=google.com; s=arc-20260327;
        b=B4EaNQLoNzKBNQUDIuKtJ3lES9dG/aOePkECfLbrvS6qmzk1ZSwiDKe4rmJd7cHQ0D
         Uh9zdt6I2xtc8y8noEWMEiKwMEJLKgcIZxCmc/usoaqLccleXaFxSrzWaRmRit38qsvA
         IdDI3WaJ6WRKADlT/V4AfovAGvG2T/wEe8xRlyRjGWthFmX7PeeAcOB5E2V4lu3s62My
         iUPaxnOkcMLlzblx7ctiAMOyQVtkh8KUJ4LU2z0wn+iZj9JLXIptpuiTUOBJ4j7IJpIO
         DEP5unYr4UJb9ao4lKukgNdbJAMI0ssWRq5UuHQ51O5ZLII5XlSFq65GZX15BRGZ87Ph
         BIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=;
        fh=unUPw/wwivsJOJHV724go//LjogTpmd1UtoJD8W51/0=;
        b=eghVBOu73kGqrj3Gt4JHS6tCjkvmsHSttmGOzAwJLX8/t0RZmvRlEH8OmdXHVdP8TE
         fQi2UZq9rvT2rgT+TZaAdhQy5lF5mDKPF+oYyHpaIdNFKSr7XiMQQy4Ejuy34UVwW5hZ
         lMqx3b8jovIgAqVsYOQd3GtZZfZaUU12OzA1DGjEiJMcTcbBoYpD2AwhQyi+js8mLYTU
         d+k/8A04OX5zw3TVBmzoL8lpu4LudWH/465zZtgccGcoH9DEgQrAh97nY5GuEFBEuxZ2
         A42lmP9ReC8Prum3F1Cco+IGJ8MvwS8EquwnoyUF3qWQr7eiiT5fcp2qXtulNc96Xh2g
         sR7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785077627; x=1785682427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=;
        b=FSmpO59j/mqTz01bHk3KRzERhPq7j9FJ+PslFKvpTOFq+nAdclL2iqJ6leFQT0mnH+
         p1RgDp36Hdw4wLDcEnxZo4DKx/zye+X1YRkuo3nLK8LDUaoPOG8iAIa6k+y4pK9k+OGB
         ZujqhKs+0wOvtcezZ6IEeOmvTmxeEgNtzurPXNiNinw+9joUMqHHAZHZInzrzb1qo1aY
         CuU4ipWi4q4UDIR+qQxesYkEjluHVTTNrSN+pBZie9NcdaDP0sA6TnC3ykFHg6g5BnZk
         IQ//cHOIATpvd+cwkPvwT+W1zf6xXegmeND0bW4d1o+k+bCTJgEjAPRreBAJQ6c+9orU
         bc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785077627; x=1785682427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=;
        b=CNaJvaamaPNWU9ewS/OC+vCNVOjLlM+gwKDMrAFV7VhXAoc8Qgyv87iPdkZaBLv3Ks
         KtDotleFXGbjF8GM7BgGCD6OsbVNrhMtsAKaUjQY6OviohYrDwenHElxOW2ROIiP5ow7
         treXJKb4SpdztnL2IDVR3qYg5tqKRtOh2b5jn/3jLJtNvxqECSgpUW4ryV6ZZDzSl/OT
         Y/1Guh35Z3XPbM47j/DDEfKNWOtGaNLGOVBIUk7YdcGUfcb6fk9RXMhvSSFDe9EjtxU+
         wbAFgsXByo/xrV2xvXH8d4IztibLocV57jKE4vBZuyT0TEvxTX/8xd32NNkTnzZ+6/cv
         d+tA==
X-Forwarded-Encrypted: i=1; AHgh+RpUzG1iYV+cOnG/gD7Ilm0JK7MD6P84wSMAmMzkUz2F6xxqZqJjOUkPn4flbvi89Dr/i/aOnnQ84887@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCjnrOv9lEZ4JWy83SxXjZNyyhP+v44zUK34YgOSQ4u+Z6b9J
	K9FMP/NvbDpBuqCUlx/2yUZxHBLEs4YfUYIa6A379cfDGp6RMOpyTQSVmmXmWHPtUHUeetZbrf7
	GQ4heFPDDgY6/H3y3vcZ6OKk3pBXVuzg=
X-Gm-Gg: AR+sD12iVEeyAFRRD0m3aixx7BbmLrGTM7XJWUdGq8os3EMDRGYrTYdtHIzDVq/fWbl
	ZIkDk1wTwGVzwmGYIqKxE17165uqX4u073ilYvknJmt7mXynaoVhomvAeMQjjuNeK920ENr34tP
	MdOSnpb/0eqCLj2CeLP4Yd4YU246vVTDdqEx9KA1oE5TS5bUrVKNvuZVx07HOHnvPz9pG1KXziY
	F29mfGcA43lQycijhwGwLTuYS+3rUQn8Xt5VsaA+pY29GZkzHiI31H5zy4LKg==
X-Received: by 2002:a05:6402:450e:b0:69e:1246:a86a with SMTP id
 4fb4d7f45d1cf-69fc0f3e1bfmr2140114a12.0.1785077626864; Sun, 26 Jul 2026
 07:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com> <20260724-incredible-colorful-trogon-9df033@quoll>
In-Reply-To: <20260724-incredible-colorful-trogon-9df033@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Sun, 26 Jul 2026 22:54:21 +0800
X-Gm-Features: AUfX_myy7YsobI1pf_jlBSXk7SDYrWERjtETFkIdeKdn3VY9LKRwt38o3X4kakY
Message-ID: <CAPwA33JUWPoWokeTFmP9RR5AzBqy2v7cEA8NUNr1-eUKyaaKYA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support
 per-direction phys
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review.

> Filename must follow compatible or binding filename, so this is
> rockchip,rk3588-mipi-dcphy.h for example.

Will rename it to rockchip,rk3588-mipi-dcphy.h in v2.

Thanks,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8824=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Tue, Jul 21, 2026 at 06:35:19PM +0800, Jason Yang wrote:
> >    clocks:
> >      maxItems: 2
> > @@ -82,6 +92,6 @@ examples:
> >                   <&cru SRST_S_MIPI_DCPHY0>;
> >          reset-names =3D "m_phy", "apb", "grf", "s_phy";
> >          rockchip,grf =3D <&mipidcphy0_grf>;
> > -        #phy-cells =3D <1>;
> > +        #phy-cells =3D <2>;
> >        };
> >      };
> > diff --git a/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h b/inc=
lude/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
> > new file mode 100644
> > index 000000000000..60f6630f58b3
> > --- /dev/null
> > +++ b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
>
> Filename must follow compatible or binding filename, so this is
> rockchip,rk3588-mipi-dcphy.h for example.
>
> Best regards,
> Krzysztof
>
