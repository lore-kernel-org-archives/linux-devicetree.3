Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA33DB980
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067873; cv=none; b=XFu/RUqL8QKQ7jhg2fo1eeE7rhpRYv4G9C2Dv/+QUoGzoFbwiIKxlFUl0BXAsXEzoRVE1zV0tywH9x27+luuCnrKb37LiK1ji8SXJlgCtqA0AXGSEDoglBsuQF5bH2g+u9XRWdol49HaXoUH3IVqNyvjuca2MR5dJA1ynOzBeBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067873; c=relaxed/simple;
	bh=CONX0Ytp8zUhCpKJ5m+J42e16vjLl6K+7tjQXEfrOSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hy9N4pZcuOGkdO/FpgVqHcKI75sXcFzYxT/sLyS+wuOj3j+MwMR1nHIyE99CpEfP8jfsHl2AdUFTkSi1D1f4X4gMCYMMn6ANpWMZrzax+Lkn0I1s9N9lmlAVgeb8cKGnxiBgEqyvEPMnfoaRqjpzp71g+qtLtRc23waibKrViBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqNBGjmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqNBGjmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A951F000E9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067871;
	bh=p3QI8/LvhRnpFsEEynpOys/8+VPey05yR5TfdpAmSdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JqNBGjmNb3Mlfg/0OuaS3kaD9bjY9KUD9GiwbWRX4gSYyGa/BuTvSxYeFtVbK8mDT
	 o+/DGBdGpghA61KjJ7zGqUpI/hiRNYyCZasCMa2/8y9FK6zkDUW5truEiKj9uvkHXX
	 rhB/s5AH5tbALPY7gYaR03+ToHaxJwt0kQ/YScHgDLIE1o/30sLQJmUrhhrLCWGK+N
	 3VA4xGBzLGqE6oFDIqkGQpRvVbChQdHb6ZB4CbyhMZfHq928aMbF5FaaHbL1fSNudC
	 NE/WG6cIGMqd4zmNJxJP7DR1X9+wYlTMHZMgZ/TE2wBHK3Cuc3dI2ANwebDirfDfUh
	 m3r1NbawbUDMg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ba5b151dso192442266b.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:24:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rreu3NJQvqGsq6G6+30lsn923pV5MX4diHyIljwViikdSvHUAXRFfxBuKqRQ9KVXuschy+OsamTg9ZB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcn0k1VAoMwXrR4eccqhAWwTBshkZfiY6Eo7kdn8KcMoV6E421
	tRKkweQna0w1dHiogQnvCqehSsyonf7EXG0LhvMNm7J2/e0832RTfbC8bXR1u3QMpo4tyEIM9yo
	KBti6tnzpomvLkmMXD8HVP+BAXhN9kg==
X-Received: by 2002:a17:907:6e86:b0:c12:55d3:f00e with SMTP id
 a640c23a62f3a-c161f4525bamr742525666b.60.1784067870501; Tue, 14 Jul 2026
 15:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
 <60dc7a9e-3ee8-4419-a53f-dd6c746f9276@kernel.org> <e03d1626-0220-46a5-af0b-dc149beeed30@oss.qualcomm.com>
In-Reply-To: <e03d1626-0220-46a5-af0b-dc149beeed30@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:24:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFz_mgY2qtCu8CP8MwjPdkMrOv+ta3Nq2=kjcdzKS6Rw@mail.gmail.com>
X-Gm-Features: AUfX_myyv4DcjcnV9TSgTO0RulNfGu2cQrnvzH0QbHSl7cZE9ucD3mN6Im8yGOs
Message-ID: <CAL_JsqKFz_mgY2qtCu8CP8MwjPdkMrOv+ta3Nq2=kjcdzKS6Rw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra SoC
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 12:52=E2=80=AFPM Komal Bajaj
<komal.bajaj@oss.qualcomm.com> wrote:
>
> On 5/14/2026 9:21 PM, Krzysztof Kozlowski wrote:
> > On 01/05/2026 19:53, Komal Bajaj wrote:
> >> Document the SCM compatible for the Shikra SoC.
> >>
> >> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >> ---
> >>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
> >>   1 file changed, 3 insertions(+)
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Gentle ping =E2=80=94 patches have Reviewed-by.

In the future, send this with the .dts files that use them to make it
easy for Bjorn to apply. IOW, don't send .dts series that are going to
add DT warnings.

I don't need to be chasing down new QCom DT warnings. Figure this shit out.

Rob
