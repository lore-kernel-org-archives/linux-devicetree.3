Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E04AA402
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934901; cv=none; b=btJmCJhwk0sPvM5upbVcPEVGOgOE1KkL1wfMQ+nX6LQEdG9t+RzSTTagc+sQAx/AkxGcKI9ChnBF3RGaFRnfQJS9p7NvS1WB/+AjiUdDVIOHON00a3hq2aqm1zz/TM1ohvRap41QoJ8Z+zSl1n4p2MeW0p3oWjBfyhzjtFmcFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934901; c=relaxed/simple;
	bh=A3FUhVOWfdIO0Hl31ZT5JPOkd0XdxMUAl3z6A0+0Pww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iap2MzAfDC9jj4xK9B/kV/7akW8PPTPE0rYwe4SAWtVVBY1M7hjO25yyoiAl9n/Gji4jG5BaoIbUri6lnviSfY/yjfZq025C0ughhnhWfuookn81EWnBDaKeijEgbJeF7Ix1jJPGBAeFDDcoWvH/3IaiLt9N0CKll0VUjpddMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUc/+8zW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUc/+8zW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B1B1F0089A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934899;
	bh=A3FUhVOWfdIO0Hl31ZT5JPOkd0XdxMUAl3z6A0+0Pww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JUc/+8zWtQEDYr5Anj1fugo+bpaucFV0Oe5d13K8oGe8MRNEXMg1EV+4InNIfz/3C
	 6mM+RUySLQ7P1YlC8m+BWLmDpzH8CFkQsrVMJalN1IB09qcst9b5jwMcwJMRb3AW6T
	 /jgw49sFOhXCP1UTaHDpfioI45qnwAxILr8a9OilWQrswOMl2FKGnoO7KW5PVKYY7R
	 t4l9+lBND9VIEPHhL/vA7qc4gHKTvbdBefZWO4tNhl62xv+I3N6Caqk3wfkvqD0yhA
	 SBnisRmqWGYZfI8C3bsU3mwsKIKQQN2gz33qUhi/X6dJ5Fm77niAhioi2TtLSidWnE
	 RQIdOJrg6feDA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso29675521fa.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMcUcWKFHlw4IuFSGDYw2fTlGqiFWKGpHt+oDoprWX5QXHb70zz47+wFrUKDyDjkQsb+Xc1x38LpBx@vger.kernel.org
X-Gm-Message-State: AFq9FYLUfKjkk2DMJjrSfx2CnuFPC6rFvqpxZMd/qxuX76H2q+u1LwlJ
	f2KnaSYUgagoIENecRS6Kf9PWlZEF5zkhLb9NHUWY9iEO7ZY32GffhRCYRoq4i76DQmL1VhiYF/
	Og91lvnWBUgpAPl7c6OR68he4Eq71SYk=
X-Received: by 2002:a05:651c:3253:b0:3a9:decc:71d8 with SMTP id
 38308e7fff4ca-3a9decc7400mr21468171fa.20.1791934898564; Tue, 13 Oct 2026
 16:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com>
In-Reply-To: <20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:41:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLn9SgrgCoY6rZTeSqtUz2PXitK15cNcw2sxd3gOjG3MvQ@mail.gmail.com>
X-Gm-Features: AclHuK-5QJaToI1M3VEyCK9SLAW1pZniBd844zSmFeaZWQCAJufzB3jf4co85pc
Message-ID: <CAD++jLn9SgrgCoY6rZTeSqtUz2PXitK15cNcw2sxd3gOjG3MvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Ambarella
To: longzhao@ambarella.com
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	Long Zhao <zl020895@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:46=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the Ambarella, Inc. vendor prefix so Ambarella DT bindings
> can be applied without waiting for the SoC series.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
