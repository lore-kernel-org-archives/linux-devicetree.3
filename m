Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD426AA91
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629774; cv=none; b=CLtQecK5SE2SJIaJniydlC7tSpXP8MmC61rGGaDAFnsoHQGNrdmyCS7Q9EO9tymCSoZnjLJnLKa7SNyDtvIORHe4IjDurE1en3WcHTMMHzj1J0UwhX/kdgE2Wzl6McuuKVB0tEVqud8dVjrq6B6LLIS70MTkE8Yv+OFsSYeSH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629774; c=relaxed/simple;
	bh=GDhTvkiJqhINQX5MFA+xMV3KNOf+hKPswGRtUCHk2Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qv74gky6NaiRVFcVbkJQx+JB3HkWYMTdwcrbmpQwZ7NgeTmSUpT00fHbSx+FiQ2BeDGO/SjW2jyR4MjIPKRDAVICsoBKY+97kvjQ3FcpGGIBla8U4Symc5uqqrT4QUqKtc2sROlHnheOiUwWZi8cQWD7h13mH7fvrJ0WiVdsfgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZKySIqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZKySIqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B89C2BCB8
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629773;
	bh=GDhTvkiJqhINQX5MFA+xMV3KNOf+hKPswGRtUCHk2Eo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fZKySIqx759C0B5DAtD3vJfzO4j7Sdarm83OG9RGYY4dXRpBpdL5wS21CedxDP8T9
	 h25+qF68ZMlU5K+FoJ7GjfNusGnbgZI88NzgSOsSNsP82rI8LwQOvLwQMUvP4Mvj6C
	 u0pNN5VYY4dupjIs3/dIjNmGjBnaXGFUVVSrFkXZ9HtkIguCax80rRyCCw3QxAvr22
	 VnUycuFTlvaeGd1KdWTax6aJ64Ran0KVPH4tm0HneF0YopVjEb4NTVyndAWo4PPbst
	 AOqG7m4xKu03HHY8iUCEEmSn9rsNynnmBimNn3ToLQwrrNpsWHb51Iko7lEJKHvlsp
	 B4bUP5ILNxV2A==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e936caafeso23200351fa.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 13:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6/nq7mFfhWCMwFXj5anySu1cAUjrvqnxcm1jCloMITzFUx8NntznpIEx6H78XvS9n9y+FC+UK7SJC@vger.kernel.org
X-Gm-Message-State: AOJu0YwDrN6MoIJNYzePOS0INu37K3ZFJlwamboxtD8eiE3lAtgOBwJc
	Q4n9knYMfE6HJjCT9sXIZbH3h+X3LYiJCbNtolLH40KyIoHnDTjrHHC2m46HZm5RiOJypPuqIVZ
	etZg6pnRFGHTLygLam6eIvVXB9ebG9HE=
X-Received: by 2002:a05:6512:61a2:b0:5a3:ffdc:1d22 with SMTP id
 2adb3069b0e04-5a4172e4ffamr3383211e87.36.1776629772615; Sun, 19 Apr 2026
 13:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:16:01 +0200
X-Gmail-Original-Message-ID: <CAD++jL=iJmYKB2psb0A=RUAFZhKtc6KQmsB9HED1-LQAAFbYmA@mail.gmail.com>
X-Gm-Features: AQROBzDjOWLTCpwVHd-bfYDfUqw6vHHRtJrX45Wrd5GY8ZZuzBfZra5z61yRT00
Message-ID: <CAD++jL=iJmYKB2psb0A=RUAFZhKtc6KQmsB9HED1-LQAAFbYmA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
> JD9365 controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
