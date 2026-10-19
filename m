Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0048DB3A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397226; cv=pass; b=R8wT3Dnz+l3BAZqDfqQrwq5W3ac9ro/YWHqVZuiht/AIdv1ZnUq3hoosqNbEvi9Gz1qC44YHg6cM3kvuEYHiitm6vgmCuFxr9d1xKo4ClXTdsE0KiUntKDDxU/t6ksL0XruPDe5xiFUzU3F0R9iAzgQPSHXIXy6AsnQ4n0MQcMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397226; c=relaxed/simple;
	bh=ojWZsLxBf/E+oTlWaEvpu7l9Gy8FFWSO9+FSkAQyrOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Unhfafh6+1cJ5dJggK+7CSEMoToGiWJuWJNcvu+a5s1HOI6iIHlfVVPP7wjXYb6JkSUdF3g8hdUo+jtWV186kLynd23IJRQTZzC26MfMMgwCWMNN6QYTG/9swmCBGUJUjQLt2OXAZzlyz0nXSVqA8zddyEZiXq/wO8rKTbtFD1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkQOSc2K; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkQOSc2K"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so303337b3a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397225; cv=none;
        d=google.com; s=arc-20260327;
        b=I5klscBCUvO3r6tBUfwZ/v8wCtSYsv4rqZc0qvll9gR3bDjAoZKWf19DLpxvBg0Bie
         W5F/9A+8/Cb0KuiEuAWyR6CE8ghd9bnHbKgZ57DNE7tbxDBXVec9Hqkdg7cMNP+Nnhn+
         NeDXw9bV2hGCT2Mw/3/JNNbWyWMAkBqxS/LM17PyQJiaoyMdv1VF2U9bC0BZvjhXG6mS
         9zk8UMPQBtglmdu5loMFjsgO9MSBHFMB3GlrzrFhaYYEUUbRGtbp8xlH89gfRpYNF6Ja
         KVAgDw3twqQWsqmr0/H5sm9O8LKZ1e053MV+EiLX78ZZNpESJNkuWHGper3Aa0JDwkfG
         MtMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OapHBRcO/exbGoTSwjHoSV037nGR79dQye9OkHt9RRs=;
        fh=L9j/HnHnU7qaLcnk8RqfSxsdWeZgOsHBOrpUHV1PddA=;
        b=pTg0B3rRFDD5jp8+tCsMIQhrV3SGkuTXlrQNEsftXe4rgQscQf9CU79ysMvXgDPv39
         nzRvF54SDgIE1Mh8ZTlXGKKUDP3eHERCsi8uhoaponkRhOXkX3caIWOE/w6BnzoLbsdz
         khQYPj9900hnSxmdti8RDWpW4Mula67j5NVBoasqg9eDZFVVLX7ZK2SflStYTkmPFhKv
         Hg55HhYJf65p5gs5CzoOb1sJeXZzKwAyX+2PARWXxhRsb5J30/kMNBtKMsAmYAkSV5Y2
         t7LATttegp0nuS9//ZjK8+oPrjynsBIppGwgP/ZFf/sqdclUp2U3aDYySvf3MhhI5Kxg
         eLWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397225; x=1793002025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OapHBRcO/exbGoTSwjHoSV037nGR79dQye9OkHt9RRs=;
        b=TkQOSc2KalxknOqVU+eistxoosuP7UMGLTMlh/iZ5K0ItpGMd7YJRzim/mcJwb2XPF
         /hTOtLNK1z3VQCDr9KAqkcofQa6mQ1Vg074rjAHkT/ZsNgxykaDt4xjoRC9N2TdeR8Cx
         AiHl5wDlHzJDdY3SzlWpZrD6qZUj7oKf5wIG05EO1ax/LM2uv3p5XEt2EZuJWihikIhw
         4xXiEehxbpV6y1VIO20PmiHGpZ8N9b7bMN8y/Otw+oQQ+B86MW5sW+nBb5WRIbk1Sdeh
         /A3kH5OX7qB4ghgcBagPE0njtCFzgAvtADwGsUzAkk4EL2u0LUhpS2+pyM/fW3bk6bdE
         gLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397225; x=1793002025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OapHBRcO/exbGoTSwjHoSV037nGR79dQye9OkHt9RRs=;
        b=tB7bdehimBZhnc0SMMXahnUgBuBgf5vclhS+H72jyU/PD1ZBPfKrBE391zyl3EciFP
         Lysb2xp/e4IgfoaPdEDxSKifnUpI6zLMHD+4U09bnCV7pTCLy8Q0r6q7aXMuRH+M6ugA
         jyj3CYiwdVwE4HgHjTTARQOCt8KXQVtGnIa42JOLbBCEzyigJhXzID2hB+jANHRYSre7
         l5SfD6SR4WwGRmT4uDHrLmf8iub3TeK1kQqlGa5SGqfWxDAlzOv434kcVTyANyg3QH79
         E1kIz6z/bw65Pfu/v78jC4u8ww6a6F3waLgibDFPDmrxQHLDvn3JHnS47gjS0Ci1yAL/
         kUUg==
X-Forwarded-Encrypted: i=1; AKwUvBwY/MlBlJuKECMRA/pLwt0F11xfa/JHStQ/ajm2eyVBI1o9PMKL8JO7TsYLycqz9AOrg83hogvU4Zlf@vger.kernel.org
X-Gm-Message-State: AFq9FYJKjEDybrX8KAlvEQZAhqbg59nRVmgoq4gRl2vxa/CD59tPZYmN
	nZiSHO+ZqfB/9nK7EF9q6tAI6Z20XtuvfzSGPDZPtm2gtePpbeR9KfJ6qzyJTkoWawTUpW0WGSZ
	wD9pQV9ZS4CbXHyaaXJA616TmOFaXD4Q=
X-Gm-Gg: AYBFou0nMy7e2PXj4nf0XJDyCxEexepXj5Fk9bSpEMloue36HA5nDpYria+2SrtwOKs
	Dt6h3h36XqetSwienUe42eACTojwXVPIsvvj4s//F57S8PyPfxylxmvCCFzIpf4uGZapD+XZxck
	Bx11SizdFOsdm/XrOqLUHqEuVW2zAG+aOMZeACcEDBMhR1rEutfpmijNCCb4YMfxC8czzfE/log
	X3A2vELkm1E+B6Bqa3Bf9jVrgNEW9CMCFBX7MtQVehOXIPdarmDgIzdi00oPcsiv9pOpX5pThIC
	tdaPJxRber1sRtsbGfFja7zADrB6p4trDzm5mTNYDpD25fzA/iuQA/VI+sEIn5F9eIdUd3vTqDy
	5Uv6Z3sCejVgz9nD5cPBId71UYGyV+huYU8nWnGFN7WAc1sAy8ZKBCDV0OZuAQz7934V6BiPGzZ
	TRM9JOrg==
X-Received: by 2002:a05:6a00:1f12:b0:880:973d:597a with SMTP id
 d2e1a72fcca58-8a04d04e513mr5511453b3a.53.1792397224811; Mon, 19 Oct 2026
 01:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017140827.290666-1-lukapanio@gmail.com> <20261017140827.290666-6-lukapanio@gmail.com>
 <20261019-free-groovy-grebe-7e50d3@quoll>
In-Reply-To: <20261019-free-groovy-grebe-7e50d3@quoll>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 10:06:53 +0200
X-Gm-Features: AclHuK9kTiQI2FRvtYDoJKATe8CTCBUQkubjvei0NZuQDDdDmbhaB9xhCb4qNvE
Message-ID: <CACi=Ov7D503Ug-D2xmKvRP-LceQpEWOrktXTy5Srdc-MZO=02Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT8722
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,


The FT8722 is a TDDI: a single chip that includes both display AND
touchscreen controllers.
But seems like other  cases like this handle it differently:
focaltech,ft8719 is the touch side, while the display side is
documented as ebbg,ft8719. I=E2=80=99ll follow that in v2 and use
focaltech,ft8722 for the touch controller, with the display getting a
compatible for the panel module including panel manufacturer name, or
something like that.

Agreed on the properties as well. The supplies are shared with the
display and described on the panel node, and there is no wake GPIO, so
v2 will disallow vcc-supply, iovcc-supply and wake-gpios for the
FT8722 and keep reset-gpios required.
