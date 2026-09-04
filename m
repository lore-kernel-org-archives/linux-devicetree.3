Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2C3A0E8D;
	Fri,  4 Sep 2026 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533545; cv=none; b=k/X2lKOTji0VvQqwl21xGWfTrSPzhc0v19mCFKWfYzjItBU7Qd7lNavD3paA26MmdvUdWssbyTBKsVC5vpzrIAaNo46RdsHvM2I+lV+F9i0K6L8tEx68DwUsg+ra+FC92XTSMnSjX5Py83B0JONbT4dvBdmyN0rd0xMXcB368i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533545; c=relaxed/simple;
	bh=sJ0E2Ers6nk/UT6ZPempThR91Gkq2iNGULZdT4GDs/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg94PcTNk9jMMTNkI+DXj6Z+v0wtUmH9obaKgxOlLhuH6jrrjx7vrOW3cPZgFXwniB5P0C86sKraRk8IJFgFewiNfaDelODqPF3NqfZhSlaW2AJfQgSFDkYBCGzcTfu4EWftpjn/rpze89jCbz6o6tJHH7EVNsuQqYzVuW7bl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 24E12201F5;
	Fri,  4 Sep 2026 16:33:56 +0200 (CEST)
Date: Fri, 4 Sep 2026 16:33:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 00/11] drm/panel: Add 5 DDIC panel drivers for 14 Sony
 phones
Message-ID: <aprT7A2w0TWrfcdn@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com>

Hi Linus,

On 2026-09-03 00:22:41, Linus Walleij wrote:
> Hi Marijn,
> 
> On Mon, Dec 22, 2025 at 12:32 AM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> 
> > This is the second version of a largely reshaped series that brings 5
> > new DDIC panel drivers (4 Samsung, 1 LGD) that are compatible with 14
> > Sony phones:
> 
> What's up with this series?

This is repeatedly blocked on the request to factor out a generic Samsung panel
library.  While commands look very similar across drivers, the same commands
are given (sometimes) different names [1] and without spec I simply don't feel
comfortable writing such a library as that'd sound like claiming I definitively
know exactly what each of those commands mean / are named.  I don't.

[1]: https://lore.kernel.org/linux-arm-msm/aU6XXi2HmgjZY8CY@SoMainline.org/

And I'd argue that DRM/MSM has seen a lot of breakage especially around the
DSC and dual-DSI paths that my panels/devices rely on [2], turning a simple
rebase-and-test in a multi-evening debug session.

[2]: https://lore.kernel.org/linux-arm-msm/?q=f%3Amarijn+fixes+dsc

> I am officially a fan of these drivers and I liked the work done so far
> a lot, is there something in particular stalling these from rebasing
> and merging?

And there have been many small comments left and right - including my own
observations and self-review - that all need to get addressed.  Not a lot of
work, but they add up and it's easy enough to miss something which will make a
reviewer "unhappy" ;)

Coincidentally I submitted 10 of the 14 Sony devices to postmarketOS just last
week, specifically as an extra motivator to show the world that we can truly
run all these devices with completely functional panels straight from mainline.
I'll definitely be submitting a (rebased) v3 to drive that, but it might take a
little more time.

- Marijn
