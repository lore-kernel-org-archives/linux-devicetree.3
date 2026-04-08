Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100443A2540
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636845; cv=none; b=AYCWrYJ9eW7MsgQ0vuBn6fzps/72cadFeahqfHl7yaP0n9nH45h6mNadnO8vZGCXg1uFQZEIBVOWz/d7VqD+ejrkiy+k3zj02/Y0soNnLiBnvxhL4w7EFAuFh977B690TUN1/rZIyGjz4FfL65uFYxpOc0uR1arr1VRqeg+3nA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636845; c=relaxed/simple;
	bh=Nh/HgkDdzSl2nd13YnkWx/Pm3GBsXpIS/jjsAxO2JZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPhXVvyVEsakU0fxGmiwpyAVQdqRhts8MC3gaUEDJ83rzhcKbViGS7NpNu6C76eBJhsKCfqCujVPmuBbheah8HVjXmvQh1A1YwOY6cww8N7SCl33/UoGDijgIgIEkXmses+bDX1MffYYiGNOUXlphFXRvXJaM3lit6LvPMMH3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcwDZkpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcwDZkpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D49C2BCC4
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636844;
	bh=Nh/HgkDdzSl2nd13YnkWx/Pm3GBsXpIS/jjsAxO2JZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcwDZkpm2MXkNjBMqFo5DXJzgm94Tuojzj5XvJd9cwY2DXDMgCdxOFdN8idqT+oje
	 6ty6QjsFAlpDlJzKrcJph6KNTZFm2pQlBn5dG0gqLFRzI6cnF7BOWCFfvIKSj0l/eo
	 ih16Q5TWM8uQKmbJ8Kpy94Av6+Xrd72Z5MUBuKyxca70LvZQ1IYX8OicKYxlsLjiEC
	 XdpVINSbV+rsEcfb8Cj0wDdGOytZ0hdR70ulTSXNyKd3CPhORwk+7oHwv4wSvdeuAX
	 iZYpdm2BO3F+2cUtupGaK+rq7CMQgQF3qotT/c/KDryj9+hqBJC4qOQeqEiKhz8JNm
	 kHa0FP8Wm8wAA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6501547d7edso6254454d50.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:27:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfkdHzf2QignhFKUvtnF7+ReMzCQQzhJjNWDg1bU690qwc3qi0XMNPmxWQXNHW7c1OiWo2zcurTy4W@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKogrODzsecr2wAQT79s7FG+JDU9+0hmyeh31zgFXfp5wzAvo
	64YOcEon3UdHr3FYS3XOu0yo3X3Jkn9ioNC20vxUyA6xJEWWZlCrykHBvffUYZGBqt/OI9REfTZ
	02n85GInyrEJkn9cB1oUtjXlPpRnynBM=
X-Received: by 2002:a05:690c:385:b0:79a:2ef2:7f7 with SMTP id
 00721157ae682-7a4d6e21e14mr210763987b3.23.1775636844272; Wed, 08 Apr 2026
 01:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-17-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-17-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:27:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnQb02FhQDngY_ZnOeQq-2Naxg4MT38BtQK+2TGFymeDw@mail.gmail.com>
X-Gm-Features: AQROBzDZLZBjPdZdwCQGMrQ2dNUUfDDmI-jmdfj9Sal7q_dMbU4JwTx-3FFyxlc
Message-ID: <CAD++jLnQb02FhQDngY_ZnOeQq-2Naxg4MT38BtQK+2TGFymeDw@mail.gmail.com>
Subject: Re: [PATCH 17/19] drm/panel: add driver for Waveshare 8.8" DSI
 TOUCH-A panel
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

> Add driver for the panel found on Waveshare 8.8" DSI TOUCH-A kit. It
> uses ota7290b IC as a controller.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
