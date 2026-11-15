Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794763408;
	b=0sWVnzGBc6XX0s2INLyo2pjKDSCQx4H+thsUIntP6mDNYmQOdSxlz67b93b/OGgEa2kZ
	 3gi6HbnD/qwn7MvdKklE3lEFtjRpOGr6BsL3vWx9P5z5ZfhHwUwI22oiDHWYObsgcUH1a
	 2je5qECvW/Fj3Z1D0amlUnoc9aBsa7y82CXouRIOJm2x6NPyM8Vr7tl/GtjI1A+RSpxg4
	 k39EmWsrvPwxlwc7wtaIuICuMT31o0MsuFOPYLPFbPkZU12bGY6ODIIrYA1RLZCcxk2s8
	 XlfzsCEFETI9MZVZCFvuxcpudiAp78j839hbZytQmE1MZHRI3x+KatQN+kMQNp6U96Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
	b=MZDjDLQM3kbqq8FN4F1R7kHCYipuCrgP3l9BlLljB9XBu1gp/UArx0usSJKnWvPfgL5+
	 zVD69KsuWlR7k7XL8DgDcXVwm+bTwdvbDiak4QN4uYrmSurcqed8CHvKZtPAEsgAfbXYy
	 svVdTN6y012DoORcMmMXkJx939VXSePXmqOfHWhBCBM+8YuRzwDkVtSvaqaFRreEkgPwA
	 HTyRbESCkTf66yUF0IUiB/Id7Gh4DgEkWTXBsK2qRlmxHnIt0kWJkCp3Fh7AdJDfSBU4u
	 1Ti8WEnDsuKLQeSZaxfdr2aMOPs6MrjIMYTMdX7XApvTorOj+Pf8ey67iCCKoewDj9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JRJyzGj6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D9606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28D9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JRJyzGj6
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so193921cf.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794763407; cv=none;
        d=google.com; s=arc-20260327;
        b=M7PzK2c3nqKv96Cege68bAQh2Adveqki+kY1WBso0AA+ciju2zcP9CCK/luTg5b3Cl
         G7FLnb2qTF51CfVnvn5m74BjzZv9xm4F3aBPMjfCWWNENqHKyL9+oBTy86Sf/VVdYmyj
         Q1nhGb7H3t1qultAINI7SUURNSPzZfSt5q77+BRrk+gNDwZnaJq5MMnGaVUG8Mcp7/Np
         cyiV/lBlBX00AGOhqPJln90f4O/YCmQrdAyYKBn4Q4/+RoTsdxamjFg/uOmgaVmFCpXT
         fv0Oay7IL88LLUfI+vimQZo7ptcd1YCE12cuVxL9ZrLpLvJ/LkRP2KQggA5CI8qtAxjR
         Rwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        fh=VsLOgJgMtXIh3dHKzl5RSrjMCwb13x+XM084p/ieLmc=;
        b=EQQPO/GrOPeaEc761Lf/Q/cwIaQC6QxHjFPxOQfn8rl6d8qjbK35rdp7nNXtQJCLn3
         aKD/2FPGl1wmyJjXOcF5Wje+poKtsnrscZr2Updsw6+h/aTJehP77uVpBYbRSUtHhqRB
         I2gNgX6zBzz9wH2xKyJiRPmjcRGd+LXwCMwyEiy0fOwqShkaIlt1GW31VC5ajYjN+C+c
         WvrkYbxrO5NPndp4oPgqKObbXdf+DAjuI1AJXjTI7BG5gx78jjJeBVdRpRTye9zL3BBz
         jDu0GfpriFbarEEkDfTvwcNv0zMoX+E00563zSjDkGqeHZwVxvHd5FIB9DogduH0lQhQ
         0XAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794763407; x=1795368207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        b=JRJyzGj68632hJplsVF2tEzCUeB/Vf8X/HpM4Y1Mu0x9QQWCKqYK78QXn8WRlAAp99
         NSSYLD7EzSgbeztDJnF7pK+Dly7A8B8TKCo75cuasa4k/wpLMJ829nU0SQ4pw8etXQvy
         Sl7QD2zOjJKHc/YN08A7f2W+7BlcaPYKvJz8rNMVH0vSklOijmF1+THvXvH70egvuq3I
         TaNJ0c06GSlmSfRNQp3FhczibwCDR15VsZzRaafxrh0enRAxC5TFpwRDLPndB9KHjzSc
         tu34YOM33QyVpjZDyCTdmWUjxfbXE5xTJX37GlTtCQtRAiwtgU0uc82EX4sl3ATkTpb0
         bhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763407; x=1795368207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        b=QZVlDHkp4Eh+NoaDmW3R/ECMFTPqhL1qWK5TCNfJoZJSUW6f4O4f6xVsHP+On+c7HZ
         gO1jbhFCRTLixF9RsErHH9DE2UL+zAhUjxhfFS+WcOgUr15xbXnKqSTdG9jvTg97JZJa
         7oD+OuPWPNgw1BWy+n8FOuXF+ynoviHtZKNQvP9y2fQT9CZVTy4XKW05EiCk4sgRKcEm
         XcJpveuRcXane0R/Ba53t9enD7yyTmMS8GaJy7KbSOn9Ik7Iywmv48xZhnP8X1Z1GXm8
         BHvPOmy/IBQYtU5Nfv8YeQi8hKk3CTFIq4v10lu4OAp+TKX64qlBgjYjPP7mTCK4qhYO
         +dCg==
X-Forwarded-Encrypted: i=1; AL+hErGwxbYibPb3+wyR9cBf2fsPZx7xrQGwlmlu7xqFi9Pi0vlyOinbqj/yH9ELzH30WQmgOjWufd36nWzg@vger.kernel.org
X-Gm-Message-State: APuU4Z8/2t3vjZz3cIPOl2YbczFUO5SNcbqglwVER7VeYHeArFLCF1QI
	WEVybyZoWwdduNTjcU9R/dUegA8nrO2VxifsTSBQj+ZwMI7E35IOYjhgXXf3j2MqzL2DUyzTY67
	GUebR3PPkxJIenuJtZ+BgAUxaDX/X0aw8N3g67fnn
X-Gm-Gg: AYBFou1Lx50ic08GHIB3sFDD5n1WC1Lmplm1rQFjfNlN0BavYf1GevyMvA+hOf0Yujy
	nQvXrblHw8xK+pmfZEJlmwZt97oY1eNi2t2mV7ikhDPt8RpCAyS/aSjpDqTrQdkg01Yli4HKld5
	KF8vkvXNJ3wm24nHzoZCuch6G021hSdOVoKkjkdMF3Fhe22qTmuqo9NBLhUrP+Pvu/peByAnH7d
	R67ERmXOY1kUZ8zVHhIhf3yBS/Wwk3AwlkmaREsHCie+qt7EWxgpwAvHVJwQOI34MBHv46eRih9
	KDgeKO5gnYmKRZSfvQToU2b9tdFIRMnKPhvaCt1Y4vUCjcDPS0pIzfkplM2GwuuRmeEJ39YOzcl
	+avQ66FDgDuG5GIaoe4kadw7FQCnYHSJ3na1QM4LvOPmGzCbq+sv7T/pQx/5nFQJBKLV4t8918x
	unxuahG1kyeqzmKXuqLhYu928eiA==
X-Received: by 2002:a05:622a:c05:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-55c6934cf84mr23298521cf.12.1794763405925; Sun, 15 Nov 2026
 09:23:25 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-4-vamshigajjela@google.com> <au4HBJBd7AD6WCeY@monoceros>
In-Reply-To: <au4HBJBd7AD6WCeY@monoceros>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:53:14 +0530
X-Gm-Features: AclHuK_5V_UVndhWj1-YMtxVTtoYTR1vzesn2C0sHyenO3AfXcdkS_s7RvC5uV4
Message-ID: <CAMTSyjoGH-vdL8U-ggQEF5FmgDkWvHNKxceauSM6sW_2_mWDZw@mail.gmail.com>
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Tue, Nov 03, 2026 at 09:56:07AM +0530, vamshi gajjela wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
>
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
>
> > [...]
> > +static const struct of_device_id smartdv_spmi_of_match[] =3D {
> > +     { .compatible =3D "smartdv,spmi" },
> > +     {}
>
> { } please

Will drop <linux/mod_devicetable.h> and update the sentinel to { } in v2.

Thanks,
Vamshi Gajjela.
