Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA848A2C2
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399213; cv=none; b=PiVDyRKg+CMNCKnvkgvVos5pXcD4nKa+wRZokeXypDfuI8KCr4n3Alr+HzhupZzWx2eehg78jRoTw80dKXK3Puef3EHKRirXsNMdz1BLgkgVcVLMBnuuOTONpmrmIeMjgsYROJHJYPYhKgaBu608e7UMbyLjMIXNBZeR4srhMx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399213; c=relaxed/simple;
	bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYte1QtSy9bfhD9XMouzL7ujvFaCsIHmIhfxsxcFYjoztcsGMMnOQDk8ohqSrke8YQxCsyh2wRnbe8mfu0LxN3EmHthGs4wCIVcxRBGCH6rmOntUe4KmxE4mzKnpdhc3xiCrgpXASuxuSyQ2hY+7aT4dT6RVGW+vDVM1J8pWmHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GM83r/SJ; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GM83r/SJ"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso977544e87.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789399210; x=1790004010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
        b=GM83r/SJpRWbneB7WBxf/P1I8//AViPZnbn1Y8LTECCDlh5CYKpwGhSTPynWBxpsqM
         O9Vtb4olKuQgFeyKetlSo7FBSpP+YEO4Eg5a+sAsLx2SNpBJekD8eepjlZeSz32RSdAJ
         Jy7Unh3CJe8ZtHRPwccmQ67EyA018NP1oCRDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399210; x=1790004010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
        b=o18kuyoG24TTkToj11DzUppMrEuip8oaWgJgObeHCqQtRf1CylOLH82QcQsUZVBxL3
         MeYSTrkm9AUhdWAQjGmMTtKK+p1BR2yWbwLfuCVbljkAexNa86mBfBXvl6XK8FFPQL5f
         pH4nvtOmvtpD39koFjn11wD8OYHe6vyLddhER+3HNlkwLoJyJ8YCJ+ZOapzWwkFx6BPL
         j7Izmd49MEQrWKc+5S76MXxFWurDUSEyhnI38qnLAEKUY8vwYrC7YHKjin+0MU4RJePJ
         R80ytozoBgIdk+FSpMkzNP4TmE8fDN1cUvH+50fGjdGat5u2B1xwyUgUpBatMBrSL3xI
         IKaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH14u5lIxaKG/a6COftBQ2Y+pdKUNy1C1jxy7dUSWp7zzTDsPXirQwWvMKD4CZc7OI1Z/9lLs1HpaO@vger.kernel.org
X-Gm-Message-State: AFuF++mnZo7/dUrTBcHCE7A7GlwBiBZ4UA5mHk64hXh1l1vsPOxcGeDX
	HJKXyuu5+lI8PK4WQZuIazimSzPcUJ2ryFoRtwBuQGoSpOJo/PXAmAaqBZZchSqjm1YuoTnNgE4
	SDkbACA==
X-Gm-Gg: AYBFou00VCcmhoXnp0mMEBJKOnw7IKpkxd88q+sTDTovivaXZVt/oaZgWMZ1PBv3CNl
	FGc2MOS9FY5kc0vQi/7HZSieqX3hHZowONUQPEiG9Y4olWaCwdj8k/nbBglixxASsvK90XfZZXo
	+IRxGDcuLTpUNQG5eT3O1+NQfU5/L3DTrXRb9bJ3yQ/o8Kdz97zyVOvAEJoC2FNV1zYQFDYbt8D
	AOataCBH6vK2W7tf4T/JW5ml0eMsPjYNpn/kP19/f8QUPssTJF3HgQGYbdNUguFC3rULDd1Mg1l
	okpTjjs7eZHSURmst/Va1sDJEcbmErHD/GbzXFqwxDgB28SzzRjLsfc9Tj/hVXl4keuC2vf4J1X
	zJoircJHGjfL1aurHsr6FtxxvYea/UmZxJbROFjvdz3Xgsgb/1teGvg53N+M4iLz1OgwhVRZydQ
	gYKZrTn45gGzcY3WNEhRmRm32LHdYZWNXhGghXBX/ZHLZL/6VbLo5pnOxIDa2CfYnt9Cfd4zW9N
	Ysy4VqTCie7nxGZKBkHtMvjY/JdAIYVC6azIw==
X-Received: by 2002:a05:6512:3c87:b0:5b8:99c4:a17 with SMTP id 2adb3069b0e04-5b8ae65d757mr664926e87.21.1789399209759;
        Mon, 14 Sep 2026 08:20:09 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461a05sm2545390e87.37.2026.09.14.08.20.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:20:09 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso3044973e87.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:20:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGKP1JlQO8/iSXrUXQgWAseTyu1jBTfS/wYkFnNWSQ4h3imVmDxNg0vmiUJJWAOHVeWfuvJqP+kadJ@vger.kernel.org
X-Received: by 2002:a05:6000:1acb:b0:484:3147:49c9 with SMTP id
 ffacd0b85a97d-487028be8c5mr4006418f8f.2.1789398811422; Mon, 14 Sep 2026
 08:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com> <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
In-Reply-To: <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2026 08:13:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
X-Gm-Features: AcwNN1XNTZvJpFGb6MbsUkQxxgT0-VHyrG0ryskn4Oe6UeBRJylCSlvDiAONe_A
Message-ID: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 14, 2026 at 12:34=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
>
> On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
> > 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> > Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
> > delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
> >
> > Assisted-by: Claude:claude-opus-4-7
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.co=
m>
>
> I think Doug starting asking for EDID dump in the commit message.

Yup, please send a v2 with the EDID in the commit message. See all
recent commits to this file for examples.

It also looks like you are adding the panel without having access to
the datasheet. That's an OK thing to do if you truly can't get access
to it, but I'll at least ask if you could get the datasheet to confirm
the timings...

-Doug
