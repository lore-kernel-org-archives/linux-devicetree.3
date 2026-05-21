Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B24374E67
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380476; cv=none; b=fd3Fnjt3y3cCZ94YyVmoQAtwXmV6Ej6t/2yd/Hrp3+d8wGURYTxif/ipYeITgdRLKA1h/kK/d08IwL9xP5XdkROF6O/UJHAWHsjx50MJ7+5Tn8fVBFX7cL8nizYaO02b3OzhIdBx5JKmTXE5A9u57nkTrFyT86MrGZluc/iQWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380476; c=relaxed/simple;
	bh=TA/NhmMxKYmBehgXdZK41pkzgulG3RVOxZ3XCI+/ZPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZRQ53VPywNc9O7akajzOKmATZJ1jwVvMxlIo+4KDnCpsX83ZNOzH1wDLaKhcNx+xupA/5Ta232c+h3sku5xzTnhjj+tA9KpcGid8mV10iJU90M+bAPHQyycnD6+KdfdfWzn89kvmw0YqLT6QYwueKHhKcVpWGj1tuVyatICOq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MFn9DMte; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MFn9DMte"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6314d2e31d6so2168765137.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779380474; x=1779985274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7TyF/EJGvHCS2MVisqdtPtRiJMUTpIaFtZ3CYa/KXY=;
        b=MFn9DMteFaM4Y6a/VhV076xofKcjLI2Rtl2ou5nGabXSA0Gz7FCdJq4U8G47sWfUgD
         AdsmNZ+qk32HRAoLLMnILRzp1JZfxpYj8tJ+8rf4lgQ9BC6PwVy2J650qiQl+8vUsd0Z
         tmquyywcwm7CW55oTwytxqo2Bxc42+5EYzBbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380474; x=1779985274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7TyF/EJGvHCS2MVisqdtPtRiJMUTpIaFtZ3CYa/KXY=;
        b=CIta3ANSjaglbjSOgVrn5zwRm1dioCKIZyGvu2toJmcpZDdYr84o6GWrm8Aqt5xcSg
         yp/0LkcDz+1eAXSpImO+vX8wJSwf/JV9BWhXss/yBxjwsgnMe5Z2Bwk/s5TRJaHssSv4
         2usIJGpDtmJMP3qIsxqn9EMMgdW903hK6gtg+5l2InMiSpE2SHW4dhUz0egCWKMg3rCG
         ZESlzzidO8a4VF3RBHOMaR6krPH0h/rAuLHFjaXXQqJM/9eoXLFH/YBok+CEGVdA/Dbp
         wy0xnXpRTngwpoF+9Mh9So18I6tDrMb64xVbWhCYdNySOu87rvMmaG3AXyK515HovwZ4
         0OIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yirgn8pxjvOJkA6pQp5v5+O2OQI7n97FtwaXG4eV9bJe9FPvJEzlu0+yuyoOEvzy5jm6Nzjvg5w36@vger.kernel.org
X-Gm-Message-State: AOJu0YxfhRveIpfOD+CUHHRoCEmk1elStw7UcU39+P3vWCYQrfRn/tBq
	DjmWgDbht0NdNftfxC2aqzxei7Bm6cB05gAtEi+zV+aXpzVUxiuLe1vNLUDMw603QRS9I9Cjq3B
	028I=
X-Gm-Gg: Acq92OFb7RKIsvL24kANXMS2XDbvcnrEonL0ML/APVa2baTbI4x/pwnYr8+p/1bCe5z
	L9/YfOweHFlaI4S9QtnmmODH+F2Dt+X1rfbCcVY7wcUQ7/OVgJYZT8BiT91jUIZzl/NWaBWemLu
	nYzcI/AYCJYUTQLp81GCSWBc4crEa+JJ+gPwghN5SmCN2a7jVUXLh6QFdCfmIOc9fXHGOyD0nY0
	GBcq8ZtLihH0Eq8z09xJnDi+Tep66Z8sdy42Jj8K0SFp1FJH1AkzNUry5e/6x6NVrk2vtfOPqh/
	G8KMRLFApdAeJ4haQUITRiYtijK1av90qmZYRcVbHrKemSvIae4XfBm7XN10K/IvbUqBMJDlPlt
	xZPKpacfCYKOAzyCnCLtEoo2MQefNMGOsDwxd12q+3WLf/t9zZmxrjJGLJ/2sXSsaK2LEf9Xb4O
	39DCdjBfOlSqnUfcG2r4XQ2d1PbwcB4SmD8INoHceftFqndQN4Ij8/EyHDWYIxPluoPqavlzZA9
	9Fz
X-Received: by 2002:a05:6102:568d:b0:65a:fee5:cf20 with SMTP id ada2fe7eead31-67390b68018mr2324268137.11.1779380474051;
        Thu, 21 May 2026 09:21:14 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-679fa70c8d7sm1166408137.11.2026.05.21.09.21.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 09:21:13 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57513a91514so2097226e0c.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:21:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+urhKQM/fJ2kssP6/1ndU8hqi3/ncqXWeIQ6oJUQ5OFQKPspSvncG+jUOGjhjzsfAdfD3EroqkTDj6@vger.kernel.org
X-Received: by 2002:a05:6122:909:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5842700f977mr1997646e0c.7.1779380472617; Thu, 21 May 2026
 09:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com> <20260520-surface-sp9-5g-for-next-v1-1-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-1-9df52552bf87@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 May 2026 09:21:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Va8xWkE3vSPG2rDnDqHHjjQhnGvQFbDCQ1gy7K9dOokg@mail.gmail.com>
X-Gm-Features: AVHnY4Jr92XPJH5Azjlc2EoNETWBXe5PFgKtRtjwUT48hIrAsQVbIHC8sZGU4zw
Message-ID: <CAD=FV=Va8xWkE3vSPG2rDnDqHHjjQhnGvQFbDCQ1gy7K9dOokg@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/panel: edp: Add LG LP129WT232166 panel
To: jerome.debretagne@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 20, 2026 at 9:40=E2=80=AFAM J=C3=A9r=C3=B4me de Bretagne via B4=
 Relay
<devnull+jerome.debretagne.gmail.com@kernel.org> wrote:
>
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> Add an entry for the eDP LG LP129WT232166 panel used in
> the Microsoft Surface Pro 9 5G.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 30 e4 b2 06 a1 25 10 00
> 00 1f 01 04 a5 1b 12 78 01 ef 70 a7 51 4c a8 26
> 0e 4f 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 fd 00 18 78 f1
> f1 48 01 0a 20 20 20 20 20 20 00 00 00 fe 00 4c
> 47 44 5f 4d 50 31 2e 30 5f 0a 20 20 00 00 00 fe
> 00 4c 50 31 32 39 57 54 32 33 32 31 36 36 01 23
>
> 70 13 79 00 00 03 01 14 56 16 01 88 3f 0b 4f 00
> 07 80 1f 00 7f 07 55 00 47 00 07 00 03 01 14 56
> 16 01 08 3f 0b 4f 00 07 80 1f 00 7f 07 2b 08 47
> 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2c 90
>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Touched up the subject line and pushed to drm-misc-next

[01/11] drm/panel-edp: Add LG LP129WT232166 panel
        commit: 31ac8899d1a9284fb50bd42c409f224788220e27
