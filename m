Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE6038E5CE
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635701; cv=none; b=hAwqzV9HgGB/P0kSow4pXD983BE8v5h5r4Q6XoSGrRDKX3ueLXiX2QN8iIiVattn8jqYUe5EzF4Wq1ZwREnnyZsQvxHyTvERXYDz9eKzti+3kyH5bUHkbIGIuca1YOi0klB09rwUkdtj0pIABQ3IocbicCDYM00mK3NchxIGY8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635701; c=relaxed/simple;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf7NP3xPskLFD5VfniURcH8UJDDiwVAQGS+gcXcpZSWyCJEUnOtJCNN0Xdw/J73sgzmC/c7e55lvE6fLRM+8o4pKgK+8RTESWliBa9rbrVBOv85/SyKKCVzMyfMG+6ucEkIwTLGmY8zYmcDs91kBIzwjCpKvitwf2RELJk/utC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXoidbEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXoidbEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0576CC2BCB9
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775635701;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rXoidbEoipXfBtsNID1GnjmPfkexfjpKj6OXvkl6yCvMZJD+FFxLdXGItTqmL1LGh
	 ns9gIUBuAKQdh0CcqvzARbyAd/6rJRdNN2isRpGte0jz7ztx9pshB/VPwGxoEcgFq+
	 K8VPKk2Sj2VsefyU8NV6RjPbD7tCutMoGAR+f3L4sX1Nj2EjBQoNKpcW6SAqpA1eRW
	 TIS1BMe779qhEHVf3rq3s7oQEOhfXiB9y7OWeMs+Ofdc26PbRg8uD5hoXlWXf5MkXt
	 Mprbgd/8GPW6q5KDrMpHWCEAqcp3HeHXeiTOP8MreAKZfSROIUIBvBid9pCNbb0td4
	 9eakEXNNJLwqQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a7109f568so66941667b3.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:08:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOf8DCt2Jl370q7/c7P5Mo+6JZiDXqnEQE9a9uwMCTNTe3IrYuNiZIoD7syhlNlD1M2gIHx1IX2MoG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+YGvwVJS+0f2x6s3Ftbavg7e7um34OcwUkXIXnUfAn2cS3ar
	od09c9OJj9mX02/TOUCC4RavIvgUPJg9V2rMbOed9KtNbJUuBVbvd4eYJxMT6ytxbodOTONXuMg
	7qqi2xbGOyqYleHcy1oCjVhk5/vZwvO4=
X-Received: by 2002:a05:690c:83:b0:79f:3715:1980 with SMTP id
 00721157ae682-7a4d31e8531mr208856957b3.12.1775635700366; Wed, 08 Apr 2026
 01:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:08:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4_hrHPau6o_hcDHxkogcb1gJN_B-7=mG2h_yy+jcABw@mail.gmail.com>
X-Gm-Features: AQROBzD0nHt18W_nwPr3GegJacTTDqPAXGlhjqavd0Oyh2PTNzHmEVgvGVfoQsM
Message-ID: <CAD++jLk4_hrHPau6o_hcDHxkogcb1gJN_B-7=mG2h_yy+jcABw@mail.gmail.com>
Subject: Re: [PATCH 08/19] drm/panel: himax-hx8394: set prepare_prev_first
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
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
