Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC433859C
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363544; cv=pass; b=cKM0a+/P2h4AoCi+ptvpIW46iI7NfgppDflqptsQOvrXoEX1llnOP/ast1OjF+98Y/0btpRUEafQtMk0ENS/CWefkAQLnlDs4KR+mWkQIvmPIfAtPkiMHKrl6AxyR2Ojx/bf2ZYcXYqgWmJIlpmv2KpqpcqITGrQp5eXhLh6No0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363544; c=relaxed/simple;
	bh=7wZosK6aeaOiI/SbhS4X06ETMvRS3uiYeh7hONmxSGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PU621DF9yA34tzgmHUI/mKVEqPX3dmKf6mYJcsMvg1mTcCMGwPPgJmCJwGU3uDtGKeUM/QRm0ZowK0/nIV1uj0odT8+OuPm7BYm7n3B4o8iYOQd9gNeHLv6rldU+6sBmEt9t9/q3jJax+bD70fHupi56+DQkwZcgZxuLUo4Fzp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoDjGGwX; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoDjGGwX"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-673ee2a98b1so5935058eaf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777363542; cv=none;
        d=google.com; s=arc-20240605;
        b=ceNu6I2r8v3SfYiKzhmt5rsJpgL2VGUB6SiD+0a+1edjS72rwwR9a5BN2GvAr8HYiX
         EPQILDtf8hfyUXP/1exMBPYP92L/CgvhhHJ3z6EG3FGr8olRSB2UCurjI8rYmwV6wUQs
         qnAqvsEltcE7iGMtmSc/JKQFdT2cZwVIbhFUgmkvAa8wOhihpWTlPeQmFqXgNmRzJepr
         gnjen6vh7Wp8uvT5D0Vw2jOdYKEGqn8VR6D29y0Mc8XtcLo+FJEy4SDejQKSZ9Zq5rGL
         5CNzmavLAudYyIhDeUleJOg3J4Hnj9cnguCwUFmxeRSdLfzpSQHHidTw24whO/lxNlfR
         JhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cj0MIZTPFsNrU+t5+Fd0yuMDLqm4s74WOZo0xpZHxZU=;
        fh=6Fx2O4ncmUh8ISYbJTdg8/mX9L8LO6L1Kn2Guj/D0oc=;
        b=DNNsxPGaBtC6E4hSbCPKWTcgznCCddwtGVzybl8dkPA5+TlD0LlTh5vm2B1pWILAm4
         c53ZA1+joOA+csi2Qr8cjluzSfl/8nVNuhLMoQo11z9hk+Yh0MZL3DASz23xwzBHovBz
         kKamSP6QRUQZSGiLMLtRGBtRbkMoElQ3nPOeFjBohkk2CB4GVfQYABJ4RmuObY4Cb+pC
         8yec948kl0GscC3aq8UokRwoo03TLqw88On8qDzk4q4w6hVn4giuG52MiZ340OrJbpUJ
         Iyy0hAVCIq9T3c4WR0z4IFb0Wsr9OsUfjCKd5/MWQDmwmBTPPOshh/2yoG8ex4pbv8ph
         sbsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363542; x=1777968342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj0MIZTPFsNrU+t5+Fd0yuMDLqm4s74WOZo0xpZHxZU=;
        b=WoDjGGwXDbUK5i0KOturcrEAkXVQzkaD0pif1wEteoYWf57jBXKhmxtCj/DlZsQcd+
         79UNqSl5w8RZMBc7XJbH6m357bKvbup69oTny3uXqJQYru5tj6RbRpshno3Uigej4O88
         EkXZYINM9RIPZpaVwUmFgFgEflC3aBsBUdNdRFeOR7yIeudBgAsWrpBDTcZt4vqxMlc3
         wJa4yv5UAwlS4X8Jjv9tzh0qbDTRuoO2IBgUbdJYH1pXfQPpI2BCNnXaI/IuBjARB+jT
         tNLMEZy3gYDocMDxdkJcRYeokVxEcfhMOBj4d/O5uJnzGHUczj0C2DLbG/4++i6BjDR7
         qXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363542; x=1777968342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cj0MIZTPFsNrU+t5+Fd0yuMDLqm4s74WOZo0xpZHxZU=;
        b=MNnTp+mvgxco4huRL9wGcrk94e2XjFWu1DwLSg2Q1E4xtWIGYhtSyDf/0RHD1S1OzH
         5K2SjKDuSKdgRKCEh6V/JmA/dGJk7THv6SlFp41riDwpQi/JEyoCrVjTVq1cv4bKTRqa
         t4I8n93KhNlFu6sePjkknqWA8ZBts0FCmKHErOHX01pfh7NC3gLBGv0vK0WX3Z2nuGQJ
         UwD9N0+YY++6aZIhiNupbjUD4KLjZO0LXnrLwHkUlAs7kyuDygwqDT4OP8C8oWm0hiYx
         V/J2+NdawPPSHXjsqblr9zf6lco/xAM6GGgW5v0JAqHgV3XX08TPsbJqPuCF9xR5fOjE
         iZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ9r8aZYgzK/EF59/jk7chpnBONc5u+df+iKpQsUVzTKJM5CZgs9HBwhdckyKEMnu8qhPwUz1IOgXBC6@vger.kernel.org
X-Gm-Message-State: AOJu0YwaflXxA5I+uRrg434C/Dfc2JPCduBDsSpUUHYzqbkdKVjRJ/lI
	p02+6q735CHq8Mg1H1Z1Kp0gcQ1ANL2gy8AIeMSN3fxW8OSLWCJyGKvnwEIO2QdXGg34nYKdZEz
	X2oGfvVEF2V1feEMxcZ9Q6S5riYeIE9Y=
X-Gm-Gg: AeBDiesK4czz+3fimgCHuhsVo+/PWgA/jEad7MrEq8gvdCsgDGJq+pfVdK2shW56SbU
	OsSmezFSKgyQvrl/7ezYW+iA2Sd/aH95BDMp/Q8YlQhnFXvSzFM0NLlDGr4CYSyk4btpT5tmogi
	MXxX3O9ONt6mxLzWpPtGBPlbpmtnKfRFiUcx9AKSYtCH7MtXQpYNZPlQb1g8QJxF5KHUjjFm5ml
	tOsBKQpT41A8f/dPZDr5BkltMbeHsfn7pYHcjlmvixrYWDaU/LiNWiD8Tm0pFQ2bB6mY9XQyIWE
	Muk8ibdypqCAp9AsXfBNBHKefgwX
X-Received: by 2002:a05:6820:2d03:b0:694:91ab:ec94 with SMTP id
 006d021491bc7-6965cb40d96mr1002680eaf.38.1777363542202; Tue, 28 Apr 2026
 01:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428063224.3316655-1-syyang@lontium.com> <ilkpth74qyjxmd7fol76kztjvsdmktjmj74qu4f35gevfjgy4v@nscmwgworotm>
In-Reply-To: <ilkpth74qyjxmd7fol76kztjvsdmktjmj74qu4f35gevfjgy4v@nscmwgworotm>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 28 Apr 2026 16:05:28 +0800
X-Gm-Features: AVHnY4Iy_Kzp1ivcV7THV9OiGUP79El0KrZmr80yMhvSjvHPsG8reQdff8SQE4c
Message-ID: <CAFQXuNY_j8fULY+OCrMJL7Nv570x_HxsXvL7R-+aShPKmVqZXQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Lontiun LT7911EXC eDP to MIPI DSI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 15:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 28, 2026 at 02:32:22PM +0800, syyang@lontium.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> > and output signal/dual port mipi. This series introduces:
> >
> > - A device tree binding YAML file describing the hardware
> > - A new DRM bridge driver implementing the basic functionality
> >
> > Signed-off-by: Sunyun Yang<syyang@lontium.com>
> > ---
> > Change in v1:
>
> How can this be v1, if you already have sent the first iteration?
>
Sorry, it is my mistake.
Next time, I will correct and carefully review.

> > - dt-binding:
> >  1. reset pins use active low.                        [Dmitry]
> > - drm/bridge:
> >  1. use atomic_* callbacks.                           [Quentin]
> >  2. fix the incorrect formatting and spaces.
> >  3. add the required header files.                    [Dmitry]
> >  4. remove "enabled" flag.
> >  5. remove *fw from the lt7911exc struct.
> >  6. .max_register and .range_max use actual range.
> >  7. regulator use bulk interface.
> >  8. use dev_err_probe, devm_mutex_init and devm_drm_bridge_add.
> >  9. Replace GPL with GPL v2.
> > ---
> > Sunyun Yang (2):
> >   dt-bindings:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
> >   drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
> >
> >  .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
> >  drivers/gpu/drm/bridge/Kconfig                |  13 +
> >  drivers/gpu/drm/bridge/Makefile               |   1 +
> >  drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 497 ++++++++++++++++++
> >  4 files changed, 600 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lo=
ntium,lt7911exc.yaml
> >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
