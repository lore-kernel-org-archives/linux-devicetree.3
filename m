Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F403C9894
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819403; cv=none; b=drhPa58ETcylho96UbxOzPlncCFPp7R/BoGdFx7HYwQAsHI/fNnAxuBfJjB9eVHNO9JlWWQgrWe+Vs7SeN14GS2mig0eCQhN8NFmmZx+LluVEUA38z2WCVRxDUp3dqSWwmgPQ7pws8mII7FcKIVeRBPXW7q7ulgIT/W3YvxU3h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819403; c=relaxed/simple;
	bh=k1siOPcWAKNP0ifXqQpv6Fdl+gbu3rJlsbm9cF84yPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3BC3tv0IA07pukoZmoQvnlnrt0VAMkWzf1z3pTsCyck0iyofYuc0Z1iHhT1IQg/NctTqKEehLgZ4g1nEjvavwN+Boc1ZRbOrB4PPim5q4RwJaLWBVda3MKLw1HwiKlpDShlzCVp33JPE5ggGZIE7RTVEdB4hpglD3fALpDlDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STEoDo6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STEoDo6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103AD1F00A3F
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819402;
	bh=k1siOPcWAKNP0ifXqQpv6Fdl+gbu3rJlsbm9cF84yPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=STEoDo6SG9fwUsVOXvJ39bWzZXydJureSnmU04tt+ZrDLU8H38whEcOsi/VkbHJ7r
	 OiRZxuq3TrX8MyWyXSEKr6K4Rb17aTZ7uSN00nDx9lf02SJdrTNr6ZNV3MucNLd3gs
	 7uOvg/mAe7LZ+dFEHgSMSs5GyJPVzNFQQNcZ3LzY+gFuBZ/EDoRE6Y3sObgDevcWwO
	 Ry/B3IYsO/yKEcSwh2BXFccQ8NqUbrm0EL8SOHTPo5U9hvPwNtKiUOl3pTNXabo03J
	 GPx4fm0JgedcLBnvrUOoXQRFU5di7VtihHJhFD5c7w9wsFnh5U0rejLOrXsxrFT/wU
	 gzkBlqs4I7hQQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso2847397e87.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro2u6bDRPb9y4KclgljdJPvXaKrLBMAw/7+ahkI0p0ApuEPDbSoK/NB4EIEChfNZsi4PAl2q8/kNPS4@vger.kernel.org
X-Gm-Message-State: AOJu0YwBavq+ItMIq6E0NeQmV8yNKFCInMeL0J7wjjPcwASMqPYA5XZm
	yP7kvMEXEwObE8DdcYZ6eOIcSTbozVMhkJgPHBkaO1QD8X38OKbCm87QH1PPAHB8M4bfxYc/gTs
	klFmVl4lOjUBCBJbu5C3E337agjIv5v0=
X-Received: by 2002:a05:6512:31d4:b0:5ae:b260:cf4b with SMTP id
 2adb3069b0e04-5aebdbc7cbamr833596e87.64.1782819400838; Tue, 30 Jun 2026
 04:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:36:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYzGi3KrVtTw+m_H=BVWChMaF6fFF++hg_nZLwAOMuCQ@mail.gmail.com>
X-Gm-Features: AVVi8CebyNlIglBQIcQKyVXZ7o8kY_lFSVk7vYSCrSZxltHIlhUqN_iKl5FCZ3o
Message-ID: <CAD++jLkYzGi3KrVtTw+m_H=BVWChMaF6fFF++hg_nZLwAOMuCQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 9:35=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for the
> upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
> will be upstreamed later.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v3:
> - add reviewed-by tag
> - remove comments before msm_pingroup
> - Link to v2: https://lore.kernel.org/r/20260614-maili-pinctrl-v2-0-0db5b=
fc23d64@oss.qualcomm.com

FWIW looks good to me
Acked-by: Linus Walleij <linusw@kernel.org>

Bartosz is queueing Qualcomm patches now, he will decide on this patch.

Yours,
Linus Walleij
