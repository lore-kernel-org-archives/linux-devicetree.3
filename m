Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D0F3CA4B9
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828760; cv=none; b=HkQFgOPGFGkibvX7W1+IcYzqz+aIRTt7wiahwq3MA8MDvPov2yW1eJENtjSgUmIexiNmEPtYzszHbAQtoUavEe+nq8L+Ck6W1xZVaUTxNQWg6ohxHsQ6nHirlT+e9uZz/LgDPtChikrCzLxHTFZIr2961TJyGwC/EG1aVNslWPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828760; c=relaxed/simple;
	bh=l+eF9kpnYx5ME7U4rQDwsCwGUPZwnma2H/VACo1S0UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAh3AkJtYJgg/EEA8B/KRANjZQD2/kSTHKLmx8KA2FVSoo+Dv1EUlCtqoyZxMgefds7gRD5nAek2wzpfS3TpoCU+87d/IB+NFgtGCjOAg9Siv3N7ZKK2Um6+NIktOhm7sG19YK9MliMQcrEyy+/d493DXfQEH5TR55DFKwT8ErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZGsRN0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZGsRN0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3071C2BCB2
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775828759;
	bh=l+eF9kpnYx5ME7U4rQDwsCwGUPZwnma2H/VACo1S0UY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IZGsRN0QQlg7FSFEMGX7fGbsxfyp0sn/l6uIBLXEwuXO181pi+5eM/5dEZCUPsxjk
	 eOxejHN5ZfbsNUW84QTdzQtOfE8a2+qyaYfPz5yzCjIDeOtSPaTph+L/snFW2hDIRT
	 y0RB/oX7lVtwqTKIDA5EW+jBrovZBf47sDLIaEw/574nDbFAi9eoEzdOGUj9bAkNNP
	 XOsIKu4OGcuNBiF/yAuDu8fOgvdhz1TkYKLuy5EdkHG97/7S40ucQtrsJqra40FUde
	 +E0Oec2x4u+/EtprqXCV1hfPhmWF2ScqH4cSxM6M7E8YDnYpB0gHWcGcCP684MmdO/
	 r1nTOSSe5GP7A==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66e6d960ff5so3014306a12.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 06:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJgseT/vRONMkGlfc+rKIO3Iw+b91+kZXq0dggx+auOl923UA1aiBGh2BP1HBIo0y9UfIYrjgnxBVW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZIb4EyS5n+mI+8x7+5HTD/LwnbCI5KQfMLXb1DkKv//LRAL1
	PT/Q6cTsUiCCDfHS8jg7YG4WbrSANtB2o8xEIRYc5Av5Gm521Z5RkCJMXJCaVFH0rWD42iX6t8M
	jKu5iIY6UrFRz1d1cQN++xmvDk1sIhA==
X-Received: by 2002:a05:6402:4012:b0:670:b649:d32d with SMTP id
 4fb4d7f45d1cf-670b649d5afmr574547a12.1.1775828758178; Fri, 10 Apr 2026
 06:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-topic-sram_dtbindings_misc-v2-1-59dc6b0dec45@oss.qualcomm.com>
In-Reply-To: <20260409-topic-sram_dtbindings_misc-v2-1-59dc6b0dec45@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Apr 2026 08:45:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJfV_ofnZB8_7YOwBDSsL0tzw9t9VYUu008BWy3mGL=fQ@mail.gmail.com>
X-Gm-Features: AQROBzCX02ZpogFeR-J4ENYSgrE8ylkkq8zmv63rkon-YRHMSS2I8cuTJbVNbbA
Message-ID: <CAL_JsqJfV_ofnZB8_7YOwBDSsL0tzw9t9VYUu008BWy3mGL=fQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: sram: Allow multiple-word prefixes to
 sram subnode
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 5:04=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Currently, foo-sram is allowed, but foo-bar-sram is not.
>
> Allow it so that more complex names aren't unnecessarily simplified.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update the regex to disallow names starting with just a hyphen
> - Rewrite (foo|)+ into (foo)*
> - Link to v1: https://lore.kernel.org/r/20260408-topic-sram_dtbindings_mi=
sc-v1-1-00556167e136@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Rob
