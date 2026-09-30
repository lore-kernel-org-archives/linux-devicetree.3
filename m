Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0903D3498
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797749; cv=none; b=rcUh6+tXPR5AE1qHIeXqD4xpEoTGYfz/DrjRVHPVk23G5tGG2aUU+JMSTuFtcFEqk6kHR21WQK0yHbXU0mpaB9h+jNo+zaocJJ8YySnZwpWnvZKyRogemN7tAPdK5rCAjM6rSyx5w9R2J08dzMxqyr3ye5UEEvV99hTLgCmXRGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797749; c=relaxed/simple;
	bh=KBjoGURW6Lp0xuEIrYUnIleO+gefEsMNlz5gVLaCbrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHKTyAQjVlUhI9anDkx1bXUyuFmWc7jqDajWHxuiiu1eVMXh7U6ocBQYC0BtaEwjc17KQ/FtvbnlMbfgI1JyXkhOiaOjZWjR5ETOJPTNdcbNx2pMLmYAL15AkEkBp3PcZtJ84uOGnA25DT38xbtC4sZqHl1OcSAm86JKtwaadio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxagNlyy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxagNlyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959E11F0089B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790797745;
	bh=KBjoGURW6Lp0xuEIrYUnIleO+gefEsMNlz5gVLaCbrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dxagNlyy5eOr8Y1m7m/XmQK9pXVnqB8ZIFTzMKunnFGyyZYj4FL+8eSCkFyFXHQuN
	 QENr9Q1J+n3MUzDaTqJm7qjNeOHORQ/stL8Vz//Rg8n16W9BuFOPMg0wuRV+RLiAN9
	 mn7SO9OHYIFNbVBIhv/niKGcaa9ZRB8+iuX2cOQSCamPudNHID/gfZJ02O6MfdAVAA
	 w3sYXzHfPj6gEwS6d3wrcPifWe4i7BUfI4IPXuSBemTYWnzjLBiHvcMymOn3zL4ldO
	 XfTwobEYq7WqTIN1SKivo2X/kAs4L6+MZcZ8/XcCok4Ue2QFjuEbb/qQFT04NoEKR3
	 ZEWW6CPaHEDAA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso11928e87.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydAmfAibeicXcCA1WHtsYmTXS8mTUAQRPNktFRjsGxb5kmuZtYvocm506Xe7kzG8UuQCKcS7a8FkhK@vger.kernel.org
X-Gm-Message-State: AFq9FYJgaCIavwVi44udP/1gRuHcFlanOqQgCNRmnH7Ly4H224m/BmHM
	Fg8ADyiHDl2JBOJqWYc8y95A+aKloiw8tuBtZRlMs+5tvJ+lLXa3y+vsj/L7S490fxKOfZWbR/g
	At1eoOIJjbBkjzzclaZi/maDxvVjHci0=
X-Received: by 2002:a05:6512:33d3:b0:5b8:d8ec:bee5 with SMTP id
 2adb3069b0e04-5ba405ea03emr1058463e87.24.1790797744086; Wed, 30 Sep 2026
 12:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
 <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com> <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com>
In-Reply-To: <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 21:48:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
X-Gm-Features: AclHuK8lnxj_P_eEplQvchjcjf4j1lYtGX2m3t6HeEPZ8smFgSi0dE0qiPGPASE
Message-ID: <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 6:31=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrote:
> > On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org> w=
rote:

> > If you have a datasheet for this display controller, then please add so=
me
> > one-line comments before each command to explain what is being set
> > up.
>
> I hope I had datasheet, but the answer is no. All I have is an init seque=
nce
> with the information in the above macro definition. Let just live with it=
 @_@

I would send the message "upward" that you need a proper datasheet
for this, from whoever wants this to happen.

I have seen from the presentation that you will be working on
compensation for chromatic aberration for this device, and that is only
going to have a point if the color representation on the display can be
trusted to begin with. Which means
gamma correction. (Which we don't yet support in the panels,
but hey, another opportunity to be first!)

Gamma is invariably going to be one of these
"magic commands", at that point of depth you really need the manual
to see what is going on.

Yours,
Linus Walleij
