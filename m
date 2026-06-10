Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE17375ACF
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131406; cv=none; b=jQprPQZHXQFJ79FqlICGBXzw1NBZ9HGLBqRjQHhiLeOjUVUtVcdbgS6fUzxPApx8M+/zzd4h8roXV/xnV1VSXoNohGVWEhceW4izaZI0yFrRyo6jlKXLwiFEPGWXy2NOB2G7CXoGHolec1wRBRG2b1TTFTebZbPEaTQJfOlmCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131406; c=relaxed/simple;
	bh=0mIimJZwSrMOwOod1z2uAYi8SE+ZraOi6XHfdAjx1Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c81O4qpMUrqQN0oHaKGnBlAfJlf+LcGR7Hz8pq7KZDIFWdJGcIWDTZeKmgpnw11IUuOyTJpAN/RQ0gXDcl1V6WHvNhSDdzc+bhJuM/eyLhS54H9sE2BEdsEY5ucaS/Cx/RG+pAYSfpvEpfT0sdLs/pUWGQMPl8+algo4Yp7lYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCDhfGUX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCDhfGUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FED1F00A00
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131404;
	bh=62bFE+9EiC4Wl6sR/gNVDtGRVBnRqEmz0YnELUX+5Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GCDhfGUXvvVNHLXhr3frkjO1Rp4OtsKp0qM3R31fePjb//IULavexvDmNUUwA04Ub
	 Dzlzh2pzRTGy59f+l+FcFl6Yb7JHo1erepIH9ag8J/kku0Cip94/n/lnMR10AXod+E
	 Eo9yh0/1Iz8nn2Z2avr7KPAgjzoa5BEPnlspQTzlg3rKjx1wz7yacqY5QAT1hJvXmc
	 p+h4mmaqYQXlAywwxh+PM6aAWHmctdeOpMdFSOJmYCYFWVtcq+mLZQz8SbOiIU5i+B
	 W6h3yZfiZGrVAGQ4KxdyXBJ5+NYJjpIS11ozMi8kHTJQg+Iz/vEkAJtdxm8C+VNjjZ
	 1YzD783Gy0FgA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so4266549a12.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8B2XYd++RMaCHg61agivV8Co9ae7ZpmK9YIooHuc34wBDCakS7murLPB5ucL4XuXBTPmLIHsQsa4j9@vger.kernel.org
X-Gm-Message-State: AOJu0YyWvVEHBYghx20gmkNLyTyrvHF2BChItV99LgJIKKaYVdf6alNu
	q0Uj0TZPjgi9sny5e/TUT2MNq1++Z0+H/IFkXz9WT7Zot+CwRGbx6CZLI1GnRu/nPYH+aOUP3sY
	FWbOVFGUjCRUhgZ9Isl0u7P3JqgnzjA==
X-Received: by 2002:a17:907:c28c:b0:bd0:df77:98bb with SMTP id
 a640c23a62f3a-bf3702817fbmr1479114866b.9.1781131402612; Wed, 10 Jun 2026
 15:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609151212.29469-1-ansuelsmth@gmail.com> <20260609151212.29469-9-ansuelsmth@gmail.com>
In-Reply-To: <20260609151212.29469-9-ansuelsmth@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jun 2026 17:43:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
X-Gm-Features: AVVi8CfnalHGFSDJtFBoMIJ88H-i-Yw1YCOHz7GBxBm4GdczRrsSV4xJzXraBNE
Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support
 for "pcs-handle"
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 10:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add support for parsing PCS binding so that fw_devlink can
> enforce the dependency with Ethernet port.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 136946f8b746..e6584a2f705d 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-cont=
rollers", "#access-controller
>  DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")

There is no such common property "#pcs-cells".

>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_interrupts, },
>         { .parse_prop =3D parse_interrupt_map, },
>         { .parse_prop =3D parse_access_controllers, },
> +       { .parse_prop =3D parse_pcs_handle, },
>         { .parse_prop =3D parse_regulators, },
>         { .parse_prop =3D parse_gpio, },
>         { .parse_prop =3D parse_gpios, },
> --
> 2.53.0
>
