Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C95551985
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924564; cv=pass; b=YX2vIpwYx20xrlOoUkIaaWZwdr4oHTkhdDVOgwQUg59ZFBPsOm/GUt1BVS0P4/1f/QWfeTpwksdVDJLGqyTrYMbc4MZhk9ienRzQzQqo82Rg3SCN0p9I6VxPwBVZNP7de5XSd3+0dSaR0niovHIX29o7+bsISQigfOTiz2K0Fvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924564; c=relaxed/simple;
	bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVOPgPlKofGes9MCFnfsAl9PcfLRZ1M9BVocBcZkY5B5iCukkCVh3dFmRZIojEgFFZnVCKzsHuIRMemq9TvkjFSJwDOk7lJf2hALuofxQo2pAeYIbNklFKIhGnYLmilPNi9d+33E5MZXDCRWoY/r1/Qq5AeuMfPFSKWzoY9BLgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hq0WLQJE; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hq0WLQJE"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so3182688d50.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924562; cv=none;
        d=google.com; s=arc-20260327;
        b=fZTxKBHGmFxERqxrYud4s86RWrqDiaMPshsgQ0j5OqX36s7II5gWKi5ZUALhY+SMl0
         js0iuDiHD3K+FcvKEnuVVYcB/uranXZuEz971C+fBWRVG3HXmvI3MTia89U4N3xsZgAO
         p4Mnxri6eBpRbKyz+IQnV9uIoOFdOqMU+taUBtUwgvPCHawwg9wwqFtx4b2BuR0PhGFR
         XtRD8Sl4t9jJRN/hd2Shzj9EVKe6NKL1kZ1QImg8qvzU2QIfmKwKlchFYyzjyeLP3cTI
         gcA04mLvAjJGxjtaccCJcuf9sUxFdxcf1clCTLo4u5Ay7ydzN90trx+aDa3PRIAMK+Bk
         XdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        fh=vS9/6tOtIVoIMiMMAHC7Uk+k9ZdxIn5M0FKa9zdyjFs=;
        b=im40t78ZioEhV7Yfx5AJV+wj0o/ZN5c/Z+2lKepZkZZILNZOx8isjVCeaW/mHF+haA
         Eh77mpzU/KnUvwIF3OF0Q7l265xjpLP8OrXMGzKMDf69sBCPphbOSW2WztBoKihDBF6o
         ViZ4L243+Jagg8DHtSefYnPBl5+p9KdrAdTzIPxcFg0063Yon6OdUO3BLFOPZMvNw6on
         xr7LbEuZ4pVT5lfD10rTs2bI6e1BsxGP82/P066DmjBai8xobyS8WnPMpzVK1dEeDQB6
         CTOcaPeCFr2tRdz4TbIiPE8X3vA3jANuwTm+qlduPrRtkBKkkZrwoLTOUQRLqQLImr0a
         dRyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924562; x=1792529362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        b=hq0WLQJEF6QP73pmJ6c8FJeMVwrlj6kQptWIXaj1nw7k4uKBOCtdqhFa4ZEx1U9iI5
         2noQBoKQenrv5zmZJK06HyjM7oJBoTx6T6GOFZDkIBKYzCTH4eq2ThweRjcfkv9OdK9g
         gmGNRBbxuOwIzL99EqhlmFKi50HlDL2A7kFw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924562; x=1792529362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        b=0OWMnRI/zY7hABRyYrAN63kjcIfEubbxGl9KTgDBf6yxLsgdiDgMi+z0F/JUVV4Jew
         1aUk36kj3KoUMKckWIpenhtuQ1TZLXVPIhr987WIAEQiApMNdHYPUaGVbfNd1I3WOG+j
         hmUGe96kYERvkY60IXOdCynCwHhtI5v6LYcBnZvv1z4gJ6h6MYSZBIXSaP+CqC29bQnB
         BDLUCFKH5P96JcR+VRe6dw6vO/JjkWz5TEO9bCbggdcuqgfoSqv1OXHcnOBchzUD0FNY
         J2xrdkuFMuRIeMvWusVrxtU0mTOZ+I50ZwoR14z0bqhXBmKY8uuLUR2lNW4Zr4VgHEpz
         RKEg==
X-Forwarded-Encrypted: i=1; AKwUvBw4SP7f4BiaWv5uXAIFoibzBzVRHhrs6JtdN2IgnXWpRUIbM6O0FIP8D78QCOUHl/RVGG1BHwb/1WTR@vger.kernel.org
X-Gm-Message-State: AFq9FYKzHbznCUBgrcNpWzFy14Df9ERyV94N/1wtgnIdHs6+lFQ+YKsa
	ohtVJW24PbwB13Mxm763zXz4DNvUGb53RwkQh7xvKa/rnNrDgisqt5b11P941tKgS0Qp9HOGdBV
	/jiIW1rx8XpOI3lAfL9xLaN1BwPQZg/4nLYEB+PKO
X-Gm-Gg: AYBFou2fEseoxFr5bgZlG8PEOP8If6J96aPna5BPq5NwAcCDHXTCS8rEc0kKSgwPWED
	KPAM/iWGlKPd8Fv8RtUe0KnX5AaygIXi/qjQM4ipor33Wsx7rz0WU+oo94EUzUyYChuhHC2w5JK
	LmukfWn9VCUYcI6CQpNHgbHf7rgDris3toyYQX+Zclv5WqYlG9rmLM4LU71dHBV72ukmY2EVo9e
	Z5oEPzLbCaGMD6J4HcxZw8GV0Xk73ctmYjSn3mGMvjB75WWycR4pYJC+rZLZ+0Xe42SvxV/7Srt
	y1YCUHyI6E8ZnGkMO3TEel5e4SdBGLL3+NJ7wWjHSJzZK8S2od4TsmS8WjgxIWJjpDUI0mnWKUL
	P0zd1GlzgQw==
X-Received: by 2002:a05:690c:3346:b0:89a:63da:fab2 with SMTP id
 00721157ae682-8b07ee2c80emr43041947b3.109.1791924561531; Tue, 13 Oct 2026
 13:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-1-384af01da3ee@chromium.org> <be3f853e-8b37-4b41-a998-94de1cb552f3@kernel.org>
In-Reply-To: <be3f853e-8b37-4b41-a998-94de1cb552f3@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 13:49:10 -0700
X-Gm-Features: AclHuK9ox7K2COGXrl-FRR9cM2pKj2PME_s-ad7oALLfV1KkNB6t3-cZk6Vgeos
Message-ID: <CAEe3GZE-3rCTw-2L-dzXqim5qHxLs1BKjpbmo9aT85ZBLWm5_A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 11:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 10/10/2026 00:25, Jingyuan Liang wrote:
> > From: Jarrett Schultz <jaschultz@microsoft.com>
> >
> > Originally output_report callback was described as must-be asynchronous=
,
> > but that is not the case in some implementations, namely i2c-hid.
> > Correct the documentation to say that it may be asynchronous.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> No, you cannot test documentation. Do not add fake tags when they simply
> do not apply.
>
>
>
> Best regards,
> Krzysztof

Thank you. I will drop the tested-by tag in v6.
