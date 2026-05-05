Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052B43CED3
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990810; cv=pass; b=J75gtOsSNdk6Jth++O9iVIq3h6mIDp2CpCRJeiWBU8gYGATao0qU1VfmRqWnqtyVmmQgR53OH+VglUjdZa0mmUKVafp60YmVFN1/9+g+NwUznjYnRL1tEVqvt7JgZtlRfCW7fJyddtn09rdXt9ZsnWq3VCmcx4PPIF3NnD5qkaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990810; c=relaxed/simple;
	bh=ChyoarYNml6Xd8oWHPc66ogwgww3Zb1C5cukHDM5eVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEyZSV15rrT1lJLzmg1GYzav1ty0mKblnpbgoecg+E2KA+uaG1GKdPBh0g3J5w55Ed5bet8ctI2gQTAw63YDREMqgvCsTc7UGSexAcrYNrfj+RNe6+sJGzGG53lJ1CLSfZtcK7fQCi3MRgIMhSZrJ7YDoGUurlBMR7E+xj/YCSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=Br9qflOo; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="Br9qflOo"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5792639e87.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990807; cv=none;
        d=google.com; s=arc-20240605;
        b=FT4yDTKZfrvzCTrv6G31u4PgaY06sHyQ0ZwjN6edf5CeE5ku7o2/TP4GOZ6fgCgj/y
         wA4hUinrL7mHndadpPk4/d1t+Dd9pnFoL3DsnGrJdz08a/d8eOFAFv9ZLI18PK2NlqAG
         Cd0nIyI7v6K0SWY5w4NHIxZsJ+83FCk3J8B0RQzfTRx/G5rGzMclX3yxCRjt5qWsFDxe
         2fdcGbqV3ZMBt+n+F2v/VqyFsnKsaLDvepECN0L5jDSpM/2hOw4lGJYsPOB2MIxBgOon
         nbjhTfuINuAkCsWfhMA/huTG6xPlKPDwGmX32KV/iYunpI6z89nRnfbA+fphO4rc33VD
         dp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        fh=OfDJzgzOUzfiSF0ymE+ZYMk14fNzrNZpQ5QByWIMB/A=;
        b=SARtqsO4oWqd5aImPTOvRWwDPyMFb9+TleG/lnauPmR6EGSkRoSfDqRJ+/k6jEfvYf
         G+Z300jrt/RWX7HMlrxtogJJCvmRXZHmn5wjuEn4xTl6n+CJZQw1ItmxkARJ069pxllS
         FmVzdJA/6u//50vp7PNGfZ6YAoC5IutQVF5ppLWxw1/YVmDRHmJ9ao6wK1cgtULwsGtY
         ep3eYqKQiI+xX6ZYDl26LoT09mCfg6R/EDVxlMfN2ilF5+do/E9dRREQjPhDTmW7ZGMX
         s1ESbGr0LaGAbMWdlP8TsXswm5DdSKs5dXsI4FlQO02bBvsaCrHGPDGpiljOsJhiFZSG
         acHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777990807; x=1778595607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        b=Br9qflOoswHibnoOG+TnewUu0+IGSfTQC0EWEOAr8EVus+VrhvJhME7QhOto7zfn3F
         kweQ7aa2LqyaKEzQiH0hLHDTy3GX0R2Eh+5qZuuRDQogCUHDwLRH/jS4d6N6ImAeypOS
         xAmJ21HuIxxtEsTDnQvNaNIBFExD9wlVGgAlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990807; x=1778595607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        b=HksyC9m5uqWIBCh9jMvYfb4IkcSbXLQSxl1SGuxNpplaGSXhGREjSugi0pk+D26p27
         13LmyhRvWwL0n8+6oMYnAL6KRP44MuYnH8rlSXisjRWQpHwyQDDEyzvcW5EiOOw6AaSd
         20ejMOqyxxZDCP58XeSKm0dURyZWZ+xZ/jNClxOCoZOMhWr813q7sRl/SFvZR6oIawDn
         URLW/gLSD2X80LSD+R7Hx3nOjAd9r99e68sDJDvayk2n15s4EO7liDs75M4S+voPEceH
         j2FWdbVy1ITqa0rIGfQpKvc6D48s+c3RT7NFRgwYByms9xfr9TfHf4uGf3gTGp4k3BNh
         LUwg==
X-Forwarded-Encrypted: i=1; AFNElJ8OgTEeby1iae3vshFDQ+EBGJ7En9ZjI51os7CESvtsF9m4D4Qp9tMmgi+s/0eF/JMPRx3sY8dXNbPD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tGdPuZhbklhcVXKHta1vsx8kLzb3S7Ptb3eyBvgsqSQkmSMF
	Wqk0i8A5h6RcaZwHLX2DuI9eTQwQfkfYJRpg3HKR0kRdIr771Y0tfsjAbEXBm+Ox/eLvKF/wE5N
	rLIWjBTwpyNPGIguN52KHu0u2FDEjEbFEd9zmFc7XuA==
X-Gm-Gg: AeBDieugVE4YKBRA5V4hZ3jm6dSMHNZ4dgvu0WALFZj163MiVaICq7egsqvo1izikMH
	/1Kjueqh9G3NO5ueskKWQXnT+GzjDZZOsSnsYGHAZqWrAs2syQeihRVoi9ga50K4DZoe1d8aiLr
	ZhzQqgzYTvb0WsovqoVZvz4AFqyL9/cswGTm3jf+cRlgrpbX8/o1K9CcEFhYvsZybfCXIE3kxI/
	v1tKLLH2QyQ6XuNRguiXudlFMRFLf8gHG1TLF3YA7dReKKu0uR/ZWK/znXVlqSj1Mr4VvpmpS7T
	T5hXNE+CnWh1NXuk3Ny0qyJ3La9RHQ==
X-Received: by 2002:a05:6512:2301:b0:5a8:750c:2f79 with SMTP id
 2adb3069b0e04-5a8750c311amr3197990e87.3.1777990806894; Tue, 05 May 2026
 07:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-4-r.mereu.kernel@arduino.cc> <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
In-Reply-To: <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 5 May 2026 16:19:55 +0200
X-Gm-Features: AVHnY4Ly1akqLwjBLxTf-Z_CJJjy9OcQWTWkDUXFiYZUdxwPPlqgokETeSK1n84
Message-ID: <CAKA1JhZzsB0HH_szK74ii+wVkAzNG=a8B6ceT9mrwbxV1d9=ww@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: imola: add support for media
 carrier board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 4:11=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > Media Carrier is an expansion board for Arduino UNO Q.
> > It adds two CSI connector, one DSI connector, 3 jack connectors for
> > headphones, earphone and lineout and 4 RGB LEDs.
> >
> > Current devicetree overlays support:
> >  - imx219 based cameras (both with 4 lanes and 2 lanes)
> >  - Waveshare 5" and 8" touch A DSI displays.
> >
> > As can be noticed DTBOs are split and no overlay is performed in the
> > Makefile. Overlaying is handled in user-space guiding users to configur=
e
> > the system matching what it is connected to the Media Carrier.
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   8 ++
> >  ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
>
> Are the 2ln DTs actually useful in practice?

Yes, all the cases are covered for the supported camera since
inexperienced users are guided in the configuration of cameras
without the need to perform overlays or write their own DTSO.
This is done via a GUI soon to be released.
That's why I covered all the possible cases for camera connection.

> >  ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
> >  ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
> >  ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
>
> The waveshare,dsi-touch-gpio compatible is absent upstream and I
> would imagine it'll take a considerable amount of time for that to
> change, let's focus on the other bits for now

Ok, I was hoping that mentioning dependencies in the cover letter
would suffice. I'll drop panels DTSOs in V2.

Best regards,
Riccardo
