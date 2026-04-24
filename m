Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4619CCF5
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047390; cv=pass; b=IDdqjeH9ZrRIM4qBpKjEEr+VTUWE9iOCY/F//EfesCVguPc7Rih85pHaBwjxBO8Zg20S9n5m8IwUHzGYR+c+J9HWAtXIrZbKFAKcAd9mKHVqBf1z1jLYNT0sdykWYcpCa1qCXslM/uEjDHQPcnUAEW0wpjmY6RxFClCh7vjXFD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047390; c=relaxed/simple;
	bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1dKMTR1qBaAI2w5F2pxmphCtSegKUlUR7LpZ+3ey/xFX6WtqjI8LSj3X/Xo0ikcPjSoHMG+1n7YMWBTjvLegPhkpKqBD4IremD8BdhfdShH/Y7m9fLnlQPvD6oyV7OxzNH7pgoJhmfUB1Y0Ed4SxLR+uP6s8S2VA9LPpRC7P1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9k0RaUr; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9k0RaUr"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c565476d7so4091201c88.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047389; cv=none;
        d=google.com; s=arc-20240605;
        b=DBl8jyqaVN36lhhJg99uxjK8oExQbfzQYqiaWLSUSxP8yQwLOKkOE0w8xa3upBLSrm
         QSDNDD2RWHfzqUBjNWunE2VvgTcbDcQ/1xHx4H0bZAqpSiIjbCfdLPFcqsl4Eh2uChKp
         TiEz2ydT0D8rFsgxT/q+kW+YJegCLaB3VCV4y1iYU2/yOlqI8dcM++PTm0jwD1Y8Tpw2
         lRUJjyxpQjY4QA/FoNy34cSuU01Ppei/cq7+xrZjXH9ge0xsCODTjkTyITSSeatzljue
         jkwNMwgcqw32SRIq8gNobqUzKAlACpvsTJLMSArbD6VHN8E93jK2pNUfq04ye4aZcKzl
         VCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
        fh=q2DxLs0lsZForl3QfsM0FNOBXUVG8d2tUK23JoznxxU=;
        b=eg0tTJRGxsAcFTJNGOaSSTRtiqh244v0ao+9fpNlClfY0NbMnIXX664tILGjdfPiNM
         GjH5ErsYqp5SQwerpOgf51qq+Pg6puz1+DvhO1nLNo0Mk+pR3Xuy+5u+t2IjPqQnd17x
         FjNrP0WAJ0LCuhEfS8CnLwEdAWNqIFgb1NIcITOUWHmKbg5EYiWcwP4BZWVHS8xqvgCr
         r5s1g4n7LvSift5LGWb8e1H4eOAud1/ZfOKkKPIbBsdDkd/fJsDKywtGBcOwnAcR/Iaz
         DL902NuLGXEAvj5G67bzsXx9KQ489hIHe1/hVLsRHJ7oBhLZqYo5zNEPB5hfYsxTgztF
         uI5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777047389; x=1777652189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
        b=U9k0RaUriVJSSfCv8YnR/AyCiIQ8z3JBEaYMEGnpAI0DMoFfC0nwxZwm8HN28cPd0I
         RHiBYcge2NxGgrfsONOGf+UX43VSHbNbJejm/DWXb/yxvxAx6CNswcfxvU/I53/LGm8J
         RFLjUnTBureXVVt+4oGTtQsuNXjeyR0sa/MRD1JlxgyL39Ca7+YxxrLj8LxDe82gh9RR
         UBfzVMTg3HYx+DMKdbQW6q1AdVrBnyWS89uHwZAU6suSO+AfcRYORroQ2g6qmcRffyT4
         bKo8RP16tlOMmtdzQQ+4SCOQerS5nH3AOJX5QZ87CcWRw8WL4cPLWo7qNaFXitQNNa26
         c3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047389; x=1777652189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
        b=tTY4iGWzDOYkwuxXcpnXnc+s/0TzEdqQRdUyJ0Y1ajP548daCKk/4xVmYyPSHtFvNV
         Lg5ksSZr+2NCs5w+h15tckhe3gH9n16OGye7FD4gto4GiWSXYu8+vthslE4cL2EqK1Cx
         DCeT01fzgVSDh3iidLn0ViXHrELc0QDLd4u7DE7WjFs+fJzaFXtNdIdd35FsH7HV4Qck
         /R0w3E54RdVHIQK7UQFsylvY+4HNRJciU+xxfnDDmpaX7+eMyHCQUr+MuuCVll1osgb9
         jQNklBirki0KoAO7nhI/70TUIs2Hmf5l3YDCQ9A3V3787pot6il9LPdIAr87oYUeipad
         iNUA==
X-Forwarded-Encrypted: i=1; AFNElJ/zdpH6degooMlZFC3PrgwGLaXqMTWOof/cbexM5ksrp9l58hbi10Ho+Y6NQAF6KQKXjCzcIOzhmymv@vger.kernel.org
X-Gm-Message-State: AOJu0YzxuMQoyEbB9yMyOkJyQEaW39GGf4tWhBvPy2mNaMW9aP871sll
	oyZWP6x4AETkFldj5p2eTHenQprtP48oHCgxUtQoMgzhLRW8/bXARoMWjZWTr7VgkC64FmOf+JG
	5dv0406KUy2DYXuB9jDnFm8Lr5FXZk/0=
X-Gm-Gg: AeBDieskXe43246wyXLEoI8NCQ6KHOKIwB+XvLyzLCi4Xwc/M9EdQnwFuhD22Z0mrCO
	P+hQCtAqBPgBZpoZ2XT5L8Io6crol7cOkWAjrPR9BLrAgTdXuQzEYhOXtsVuZCDW4KaD6hOl/Ei
	lFZu8bKvzRbd26VTGnLglaMBCY9jsoabjVV/RxhVl9SAbwwAfUiJpOJ5CxoIyul1PeSnoZrwvnN
	OjGaR8M24k9LyeHNJ2t0+v9QBfVDz93YgkavLARqyqHD/eZBuDYesyOEuAy6YETY15NPhew+2zg
	94G2xN/RvuYOFb9XIvsr4Q3gN7UfZTe1TK2lY45w4abYdUpaMunQvnWUCnwhQLJM4cq51JXbdxk
	kOXkCbudIxnq58Fj5EliiPZwVHHzuSG8lrXqaKg==
X-Received: by 2002:a05:7022:f016:b0:128:d4be:7438 with SMTP id
 a92af1059eb24-12c73fad42amr16965861c88.30.1777047388527; Fri, 24 Apr 2026
 09:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com> <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 24 Apr 2026 11:16:01 -0500
X-Gm-Features: AQROBzA6ToQMdPNxQfm-1s1rL8nfgq-Z1E4rbqFRJtKj9KT9hbDXQ7tUBkUOYMM
Message-ID: <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: dts: ti: beagley-ai: Enable HDMI display and audio
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 8:04=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Andrew Davis <afd@ti.com>
>
> Enable HDMI support for BeagleY-AI platform. The display controller used =
is
> TIDSS and the HDMI bridge used is IT66122.
>
> Based on DT by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> [tomi.valkeinen: cosmetic fixes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Robert Nelson <robertcnelson@gmail.com>

Thank you for getting the display back end working on j722s family!

After this goes in, I need to submit the usb/usb-hub changes to enable
USB support...

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
