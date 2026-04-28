Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01C3E1CE4
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370506; cv=pass; b=nspcXbu5tgudJBSrxuI6/xScOTDkC3gBnCnOvflmorGASTLLSupSCuJrWGx8NpIGrgI52qMkXHbI2sZULnmkEhkqwaTLx/btw+W1Y7A8Nbn59o12PSNrhdRJMNNrPH9XjDCVpEbvF2dtUz21lkPahMVkBpe1v+Nv5pYcrXXLUq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370506; c=relaxed/simple;
	bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIpNR2nYMJf2QALSs1D2Bu3ux4Q969kJR/9n15nzIUXoQ4l8wUWBL8IEY9MQbSQ+h2tIVwvtVob68geEpevLp6qy5eArW2nZesgvLBej8k2NHPQoU5tAllfxWNJGvJ0Fn6wUnvo3pPoHa+5llEEZT7QN8SaMcVYTiYRP5qVy7Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeHJZWyB; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeHJZWyB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso9501012f8f.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777370502; cv=none;
        d=google.com; s=arc-20240605;
        b=Wpedtsv8gXhyLZPl0siEpnDNBs9cyBBx9TTO99yCv2QadCqlGIme91X664i9SUf9Qc
         4UxdlTNoat8lCnreuAPnv5Vo+d8h7RgDHI/Boe1MQkTm4PlyD/joIQzeFZZf3ycWm0zQ
         Tjh1URaBLYUJQPeiAQOu2liOwChI8VaBPG+WMsnOb9qXk6qNL/5rg7u9d0dgbMz4zZjk
         buSJWUPS5n/T0K1SvJvq2GgDlSDPHhZVSd1lgN9PflPrmCIr+nQlA00QiKeD41VfmwdI
         euF61WenYvyuv6ibiHDJQ2tI7P1P2TwMzIhfALqCM7+hSxP80yDPZEKckqiMNS+rbmhM
         hydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
        fh=Azpgg3THRaBvvTw0rJyP2tUbEaodISlNqKrwsnvW+WQ=;
        b=SJTtyz42BzNH6T5eY7WcOYxVLec7oJ1kuS4rKTqSqnI53+4FjhKMmCR5Cyo5+HlwgS
         YNIKLkziTmTaAjaEXnilcFoLmkdrW43hGQzEfZvL+4sjWKHhrtaBRVhN5q7ED9pX5i0d
         KTfKe3grD4/1CVXMJ0AHBrAY0MJ3jAxR3MvDwRz0phWbQPo+D6Ra8p5g82efs7DrZRbh
         ah1I6c0xRkFq1grNs0JBYbK7zwNUR5PESXI1qtcB3Vk2D3ytq/XlKD+IGMtiuR5Fn4Qt
         veYmrivQEKeryuhx8o3Z4+KoetPVY6s8/+M6DMIZbqrLqgBkeg2bBs2IFB7VdHU35BLl
         ZV9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777370502; x=1777975302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
        b=SeHJZWyBXaKODj/6bNHkEsNvlJYY1zrNxlvadNl5vxepEPCNr5xGC4Zs9DpkXkaZJa
         Y94bjLNBm7OJmToU/Df9IOCajaiBm6En3vpzCC/c6gp/Gl345ptKB9bN4qKsd7L6G0kg
         IJe4dkHPj5us8M1AwCqlHKxo9S8hgGPcfG6dzUSHuOcCC+JzPtZEACF1sG6e0AHcEfi4
         EwjqeZPQRaUTBvpVP0Q6ZEF55AlDyMG9y+6vjUM1ft3Hn1HrQCLEqgg0YcZGzJnZAqpn
         UO/1DeuV0pzoC5Gn4BABlJKPEdz6o95E6RHGBqMHGPFB6M20lbUOYc49YgIXyU9YTR3F
         D3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777370502; x=1777975302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejtc31VfVANMim0C7tVw1Ik/Wt16XcH03Us2/bf2BhA=;
        b=kGzwFZ/VxxOk7w7khHweBx5AMfFhD4NrVryL78OH68Sd6+ULNZTgBOR7kNcBxWVpN7
         HYxSgmy69YXiLfJg1gNQM35bUNe/2Pj/MGvENBtKqIAGOy5articX0fDqNXwaUbcFp1v
         KGNCz0+nRBUG1sg6cBxW12XdcDmINgUM525lAQQcolot7K1YIp0u572bO4H1sPBtfKd2
         6XRkPAijmnv7D5n/C1hHCQ5RZqpefNKiO74gX9QKD5nJx0uRiUzv35WYihN+XcwoDxdL
         nVY0ImmzeihDZ/3rWn3N+ZSZrS03hfmwnQJEJyTb2b+Jk6oJXUHK0hX+3Ne0jdtqQe8r
         gYdw==
X-Forwarded-Encrypted: i=1; AFNElJ/sal7gAUJfD57bhKQlqwCvCrrYUbwVDiXc7RMacB+8y+H+PPmUg/b6SrEJtgZJL9zTz11aQwoNIwO1@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4SmdKjJZajkdyiKyExP8nc0Sio4YgnYsjYJMWZtI6tJGTiSI
	R7jaS0raiTpwJ0F5tJrBmKpsQU7FO7NE1vwQB+oFTykZVGpQ/tNjsrbB53nMCNF33gcApW5zJJQ
	9374VMS12ZPQACIMgMQxF00sxSgqtcZE=
X-Gm-Gg: AeBDietRiLVihjrTxR0cZBBh0nRgpkPzsxjWYWgeYC/K+aIE1WH3cEBHHLPHnJNrQFm
	0TN1c9hHwYH5oZ+JxQO5WiEPv+H9G0Vuzg271WPcrh68SUTzJYfNh+nafYgmsGiV89LPNrgZ2ds
	5lCe18rvyk3g3bftBVn1Un0FZVxe1DaF48/tk9bVMDU1tiUSMfcD4CqIouA5SVnh/+KRtRsfaVL
	ZtZCTVewYrqZX81ngeGKDkq1Kz/2Ttm8TZ2tUmyjoLD76500rr2HQf2Auw+78n5GywFM5sBO7Sz
	H3CseVIv7fhfnOLFfKwwgdyJ8MauGvEidqh43wWhHobVcnTXSunDr6gHCcZfyWaowPWAPyGLX+0
	l6j2H
X-Received: by 2002:a05:6000:200b:b0:43c:fde7:f1 with SMTP id
 ffacd0b85a97d-44647cda93cmr4590757f8f.18.1777370502344; Tue, 28 Apr 2026
 03:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427154658.276737-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260428-wise-rat-of-criticism-df0ea3@quoll>
In-Reply-To: <20260428-wise-rat-of-criticism-df0ea3@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Apr 2026 11:01:16 +0100
X-Gm-Features: AVHnY4I4coMls4qeC6jWH5TZaGYTyTrcejKFlzmjg6GLt3Vrx9kUkLIvEYA6b80
Message-ID: <CA+V-a8sPi0FAE3V5ijCN4utxfRjcJbfr05Tn7h4xmk9SK4+sxw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: Fix typo in clock-names property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Apr 28, 2026 at 8:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Apr 27, 2026 at 04:46:58PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Fix the typo "clocks-names" to "clock-names" in the allOf/if conditiona=
l
> > blocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note, patch applies on top of next-20260427.
>
> No one can apply on top of next-20260427, there are no such maintainer
> trees.
>
Understood. I couldn't find Dmitry's tree so I just added the above note.

> Please add Fixes tag.
>
Ok, I will send a v2 with the fixes tag added.

Cheers,
Prabhakar
