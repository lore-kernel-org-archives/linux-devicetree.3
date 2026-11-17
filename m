Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878344;
	b=oiPSXFszg1uObBMikKyaj7tfLCwPqn/ismmYB9CsUTq3KCasNN+jEirno3V8+8Ot0dD3
	 GDFmurMVABaTMa1zzEMlIETFZYqeuH7PC3D5Za2Wo4Yu6r31kV8AaBhgt11GY6jwW2vro
	 1tPHavfU8CktOCHnrP6cuF88xEQATtz/xgdwHqKNDxd3j+7yzxu06Dg+T70kvAtapHaJX
	 5+L6gxz4sgNJpTKPBD/Gj6QNp0aIK9O+JHKXg9+LUJfqqUt0ZnhEMtbv5p640dGtXLrfP
	 A8IASB5oa4AX2JQzXEENNm/tdPSfEJKS+x/BrRq9XsorzqbAQOu1YX8qeHgspnwiMyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
	b=kuKoQ0r33lUj1AMKG4wP3pPI1m/XygXmBBb1CzRNphW0T9ktajdGUJrSOQvFEMUtaFdp
	 G4WF1qYjjtBRSnvuc+9sS/pV2z6Wp38kvdFKy45fb9Q/AHqITI5rBM8JGOF2xizgNNyUD
	 YwkeJpvCjPh4X5jCN8ZV8IZL9Ae2wOSoBQtE9n7uzU5bqVCdEo3WracKH2BSIhQtbYK8O
	 m4i/2TsLZvWCxoUq9knY6VweW1ZFdf3SZp3a4zO/zn1G97Ex1B3QrQjB8s+Snc5vUrutz
	 CbYC4WxPtbCSVN56lXgj+NUx9QzQbScx19T/IkuX6HkgnI6uFu2HgOjJsc+NywOPhaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1sKZPNT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36585606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36585606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1sKZPNT
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adef977ad9so36935531fa.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 17:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794878342; cv=none;
        d=google.com; s=arc-20260327;
        b=NtQ4Uhy/lr8cvlgnKwwWRPO+fX88QpZrMHJFdTWyAz/yQiFdtdHWU25RlzXRfYPcf+
         EZ3Iq2DZsapwuWHMWqafl++gNEGLTcsatHgoIwGW3WSYScVrDNp8gEIwh2qOa00OoHXl
         SxNv6agY0RT3IC+uGjkRAgMXkYGEeOcnlLyFsYVJM92u/byjNGrp0D71pJ9Y1l85O6OV
         VbEnFVK+d61ORdFDPH58cuk/3ZZco7VD/p7AuiK8f99jDKArkDDfSOCnvmnHIyAJpd1Q
         hTY1AYNjkzG0dHXw1m8dwpkWLcJtAtZ8z4Z+x4ig7rxpLPzQVRjOoDt0JTXXgCxECbbq
         iShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        fh=pRiMfN/EO5XibkaYck7hoxc2CiHmiDYQFvJKP6wd+Gw=;
        b=NN36HGxEosV9/kvzU+2y5fr1FZDx1AoiZs0/i++FRpP42E1rNsuX20419iuy9/XYBE
         hzOWD/oJ9+md0k6ALfllAl6JzERliL1nG6ain715bCYCEGdWAlqOH+GBnHTponfAiQm8
         01Kgfkc8slQvak9PbEGuRPtWruOv/QTy7ZpotqBKRk6WFq+3Hv1HryC6iY7uf7+Q3spU
         9uclluw+UYh4zPwIA/csIY/G9iKq9iie9XZSpCJHXSO6Ol6+Q+fhEsmXvKkwgV6w8aGl
         KYDZ8S/HQl9Gajgt4nmW5MRjjs14M6mp9/bg8CkZ/aGT8sdW0lULiThpl1NnTMcmAq2G
         ATyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878342; x=1795483142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        b=x1sKZPNTBgI+oXYSIw4eVifpFiIzZkJlL4rlZLx3kOxRYR2UD5N33hRjLk3va6Vsrj
         M9A5MgvOKKavPDk9a3EXOmoKe/tmJ0kovYBdQCX9+eLE7X90MKvW1AMtuIb7sF+5akJd
         JJtuZGABTZhSN5r20zZx2JzH5t/DK8GNah2osDJvVVL8U+jE/pLKRX3DPNnA0qupZ+O1
         WPbReXb48AVxZRtZw2ExHTtIg2++XNad8/9TM6zOlytRNwQMEKZEO1lzJPotKKehBdV3
         JTkVviZDn6hP39W6ZoVO2lcMAU+nNuJvYeVX0uAe9Wo760P6h0fjCoY9xcbjJX71Eetr
         wBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878342; x=1795483142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        b=ZWrnpb41L5raA+vuSJ2ht9y2I136yDOvLdzLgspZScDwwWaPD24maq/QPix8D7grrT
         iUtWWPyxGyzsqo0fw5oT8CXfHYeP8YbsxvC6JCozbuFiM7oViPGs07usBD3s9e1vSRaC
         nAwLJM7fa7DQgKmCQvtYHPUWjXQWpLye/jhcIVJAURgOogfhuhH0/VKuLvBG54WolUQf
         E2ZAeSkgrhaZJXKXLmn9SbqrIwV/DxOXVR67Hkr6Fqe1/O4ZH4o/n2cHcUdd6AbDZjzG
         dgUejVgIyS47uA4CRtX2AGXxuQuy9vJaVq4MN5gjMiiGGzT2DyXB/OQW416FJIULLm8T
         ViyQ==
X-Forwarded-Encrypted: i=1; AL+hErHeHH6QooEgF97uTjZNPDWhzpuf49KACLm9hh1UmmLIohoEJkq0FT8vvDjTSG0nIRQe97k5tMVOsluT@vger.kernel.org
X-Gm-Message-State: APuU4Z+OBolNxe/aWJzWmd19kP1hO34b4n5ATr7G9ypqquXKEdPb97/7
	FhoFnYUHLUa4NZoRdWRz090ghOVZruGUGfhTzCpL8rXrCBUcGKYgZLEvyxFYXsElxyNK4+TQ45P
	JDhFHKulUPrOP1uIidzGmUQqLWQ5RSEA=
X-Gm-Gg: AYBFou2+zsKVmkMD8Kqp61l1pyMpB8HRtrQBH83jakK3bqj7KdpTPQvyvH47WNeOHsT
	qcG5kLLLUdA1AiM4IWdGhiIlW/ZO01QsT1puAM1aLbxW8wOM7zAOvUaOUszADJImJzUdR3Q5hJJ
	SYVTSA9ZiNHKdkWUhyOGL2bU/0GL/z1dg7yZxW7aY1Xrb4M/Ghxz2645O1SFlph+36JX18xcZaE
	x8Yv3th20KDdtqr3VHVdcw7v7jPe3/M7tF3PsZuQthiqyDxvRja5sedsGwviGR76isJoLfTxsv1
	Ord7mfVrpKz23YFXGAAvPVR7yHdtZJNp9vjG7B2H6H+3C/Ko6VBtsIkpepTfxyZNL0Li6lKJLx5
	raH++Zz7Yt6gXcoob4neS8ceirbaUnrf+WuX1X1unVVegEe5axiv8uOBix87qjY7wFUSTBYs6BC
	e4DBR1xkU00aUDs6Gi+15ZUKoENg==
X-Received: by 2002:a05:651c:41cf:b0:3ab:4f5e:3edc with SMTP id
 38308e7fff4ca-3ae2b4f0263mr32473621fa.15.1794878341861; Mon, 16 Nov 2026
 17:19:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260311194531.70441-1-festevam@gmail.com> <177344689795.3706356.13043407533958417879.robh@kernel.org>
In-Reply-To: <177344689795.3706356.13043407533958417879.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Nov 2026 22:18:48 -0300
X-Gm-Features: AclHuK85a0wTDwYZkXytyVwys37e_78s3w7QVgGrJmJ9qPzFcQX4mkAQjyHnXmo
Message-ID: <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: marvell,sd8787: Relax length constraints
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: briannorris@chromium.org, conor+dt@kernel.org, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	johannes@sipsolutions.net, krzk+dt@kernel.org, kvalo@kernel.org, 
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Mar 13, 2026 at 9:08=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 11 Mar 2026 16:45:31 -0300, Fabio Estevam wrote:
> > Commit 31ed9d9d71ec ("ARM: dts: rockchip: Limit WiFi TX power on
> > rk3288-veyron-jerry") added calibration data for the rk3288-veyron-jerr=
y
> > platform. The commit message explicitly notes that "the length can vary
> > between hw versions", as documented in the original text binding.
> >
> > The current YAML schema enforces fixed maximum lengths for calibration
> > data arrays, which causes dtbs_check warnings for rk3288-veyron-jerry.d=
ts.
> >
> > Relax the constraints for the two properties that have
> > variable-length data in this platform by adding minItems based on the
> > actual data used in the downstream kernel:
> >
> > - marvell,caldata-txpwrlimit-2g: 508 bytes (from rk3288-veyron-jerry.dt=
s)
> > - marvell,caldata-txpwrlimit-5g-sub2: 744 bytes (from
> > rk3288-veyron-jerry.dts)
> >
> > The original maxItems values are preserved as upper bounds to maintain
> > validation for other platforms while accommodating this specific
> > hardware variant.
> >
> > Fixes: 25f855413885 ("dt-bindings: net: wireless: convert marvel-8xxx.t=
xt to yaml format")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Can you pick this one, please?
