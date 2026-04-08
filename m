Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E55839BFFD
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635825; cv=none; b=iWhy9wFlLSWiocATXo6zV3RYRVbefghWbLjXnJwqEIYqPbTImEQUYIwiKeqZtGA5TKpo802uoBVjie4gMAZPslrypNs7q1EsHEL9cn6Q9DTva07/xMM91bO7qvsOdq3OnegFEqw6F+LfmntS+W6eObCMuxWyqh2Bh5hNYrqHnDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635825; c=relaxed/simple;
	bh=ECHfPTPhmkdkFd66BtjTzlwbUq3yiTD8+y8hVdw2RfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgaxfu9CjLb5OYBXK+TFc2d4Hk+52XVKXEGKaJ+iUoGcpDvQClx6mNgNxuI1mnLgnxweKTB6oFsEbp2qyjCQk3xuvUmaE4ydMFYTlqEQODWxM5BMlFLNEuW0VM0xepDi1ryvaWnJeKdQwrKPj+26IGjuohxBQACpz9ckeUb6s7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx08zvmC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx08zvmC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9023C2BCB1
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775635824;
	bh=ECHfPTPhmkdkFd66BtjTzlwbUq3yiTD8+y8hVdw2RfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kx08zvmCyMhESbHlfmJm/uZBZ6cNKeBsF0YOShpI5Fwi3guEfaNfVQ/ioixPncCGg
	 BWM2NbNv8njydxu6kJhk9+pq3yPq/cwJjVWPApEtHOkdhB3fjjOFDVt4sWDxJGWOTt
	 zaecLdTgpUmCru7Oe/Kw9h+k8Z7QUAc2WYG7fFOrQq3bnnqDGi3v6M1KtyKexweab3
	 U4Yu12qPNAcYOQTGpNB3SGuf39FsdH5tntcCiNyATkR3ZRqc6XWVPLA9THDWl1oKCH
	 EUq+VwpTNyVmCpLLDJiDaqbQzFrzMyyVrKnZEb8S4BcSYuB+f1CryIbJWocrFdC44x
	 2RQKFvds0UIlA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79853c0f5b9so94753737b3.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:10:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvWTr1c1/IDMc+MpIRsgAySZmRys4jJdfq5dPsSQkThwSGvzG9VPO0enV0TF/XcsrtTyxIw7k4AoDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyTVC2z+do9lSSMdNNbHj3qx+D4YkmAeN9N9R/uRPFDTOoKFG
	gY0Vg+ebWJ8PxplY58MaNpthWjh/gp55W7AKyxnXTA5yN0IqmtkEDYvWj1BH+Z/YuGgcmgVTO0y
	0V6LAsRbkeLbff6HHofAvJTTFrGlcLtA=
X-Received: by 2002:a81:8a05:0:b0:79f:b903:88c8 with SMTP id
 00721157ae682-7a4d3dc8967mr153186747b3.18.1775635824304; Wed, 08 Apr 2026
 01:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:10:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
X-Gm-Features: AQROBzA1L-k3CYGiASnMrssM2dYaCBEXqtHZxkZ8TG5qef9N3AQG7wAPZBWfSaI
Message-ID: <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
Subject: Re: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI panels
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

> Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This looks excellent, good documentation and references to (incomplete...)
datasheet. Maybe this datasheet has the defs I was complaining about
in the other patch?
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
