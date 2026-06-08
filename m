Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B653B47D6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909835; cv=pass; b=hPs2I2P6XZiPT5JeW3ZLpWs/yCAeX1AVknHmmLMtyk1bVMDrC0ilEKmuT3V5uWikmnaH/G8v7DPf4lN+WFOfibP8XdyRqWEJNsOlDzD6IJykUTQ/4pg8D/7NYCyBQ2tUm9ROVoLqo7gXaS4SavVPUum+Pdt38G/0HNPKvg63tQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909835; c=relaxed/simple;
	bh=dZbilIS/Qna4fJ6oZVSTQqKNAm/MOGoPv0Ifm7jq+/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAWumCowJeJwkCyN/8zSr/l06DBKTrkc47bvo8ck4bDFPg7zH6u5HcMuaOqiiQwVP4E9FPB2SC3CV6yEdDd7FseLghi7e6bUForQkU348B+84rWGdoRJYTZ0RJNEAfXCtS///xHrhHX65Soa9U5Yoh7uJh2Ap9t1fnyjkA7N2QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk87X+Fb; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk87X+Fb"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so4406717e87.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909830; cv=none;
        d=google.com; s=arc-20240605;
        b=bFmue48GiSf08lklr6v1NmWZQSUn07iDgJ/NNlimhd16seU7xBR/u2RazwsNDvBxj8
         veQYZ2yJyo/uCV6Ji+NBKL0blsXu/QArYiWGEHpbsN/IbY8j/+kEg7XZy9SV6RPK2mQn
         rsO1bq1lrREgjK+2OziQUcbKX+r/Li/uuvl3zT988uAB7e10q5KPgj1u9Qfy3MQo0ZV+
         HJignIqPHnk1Xeg74c3upBmdsDnXWrVzoPpf7pjWc6ZNv3lWtXfhstU54KtkpPmEWSDa
         +JuzgN5eO002cLZ+zr+wf94pINzrCNEdhmCm7yHQ93zKkI3Z3JPuKBcbWFWWo1JMa6J/
         VsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        fh=Cex3ZFOIGbeck5UX2H/AC89HulcFWX/y7SjuEDAVhb8=;
        b=Y9SuEobMhSKYL9fiCeTWWf+T2vmcvg5lE+aPebocW2qXBxEtiIWruQxqCp8S+n4sKJ
         ipkKHb2XOUQeItNV5r0Im+6l7gwxT6URGeT/MZjRAm+AvyzJzWylfLzXv6Jpyj3Sif2y
         A1vrYKG8cH0qZPSuxcFgxoIG3gY00vMLlMTCdKx13ovK9yBt+dHLy5dEitugO/zbr+kP
         kzGylv3l6UaywFnsAQMEG9uIgMFii9sr1XoIDYhp0nku0OZBaMGArbcqtexdbJx4DB/0
         20pWLIQ50erxfex8q9EOgj6KV4WO2UP/jBGJYuzyKpADK92YBaubrCD5r40zfjVMdVmW
         cUTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909830; x=1781514630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=Kk87X+FbK5KVTKLuUe7lsT5xnPMNY5DSF6dLfAeNQczoDOm8i2V569R4mbxBJbCSiK
         JwMwb40hpEIFMRXcLs+7SpIIG9u8M/wfPG3LqdRZAgk34Q0Y6C+/xLQdJ/wsO8D9Ldi8
         JReHMB7vKFGnJNkYa1OrHLrL+3XKElzCG93ahbk453cSmhqx0qXgFfanu/o/CyfWmt2U
         yh+VqRpNFLC7/SFNIjDnajZ742Sk8KERAc9e7u9QKw25JHcvEE8cYzQmZFVCdg3xn9Sn
         rUdj/oCATdRvSdjmcNnwH2XtAR3+HK5t/QbflfYj2t8hCPzKvb7Sts2waKegFCCtE60m
         XZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909830; x=1781514630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=hIUVIRs+AjJM0M40OTkrB+EnIbGuiUeLO+32WKAPZq0ndagR79w3azRB+2s5bDyKy+
         /sc5xC5xKM9V+tU6LF+rGjj5lAx6bvmJwckoyum/3Fu5HXppf+RJKclrdrywYLlQw9TS
         veTzDKjwyqF1RrQwk1nLyxGV3qpTWho6ghZstW00OO5VZxTZwhoWE2KyQCbHgwakuFzE
         t0Onv2IKrCvoVVZnPlFMzN3wCKr/Ak/G63P8+MFLz7YECvihdHgp3YxlaRqTIl58weGj
         SfF3gcPWk2KP3KQ0Gom+azwzS1hPVFr9UFB6MHy21ZFUYZQdJ5dibEvjdbDbDUIkx8zi
         4BOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KlItYtyxZVmkwrD899a/pRrXCqTiTlIrmSfqwqLKPg8JmNOUX50ugkW3Zl19G2gFfAM1WNjq5YTtD@vger.kernel.org
X-Gm-Message-State: AOJu0YzJtc5m41aPiWoyVDM699+Qg+e5uTzPqRJjDJjw68ylmIgDnyth
	7ZtM00kunAhFFkyA7us2/aIYgLhLpZgN7WOvVXhOsCBPi0P7M8zHSTjinOeSi+KqwsWp7fCPeOh
	ozy7kV60YMoxYT3kNFvp+yQ6I4W+vn1Q=
X-Gm-Gg: Acq92OEYGJpdQSoXbXRWvdnY5XfdtLOeJiOfYLP/2y2yI82RUBVvLH9DvYHBu/4qtYZ
	nNIaV3/IaIGMXBFqoalfArHIgjWlbVkAdZenZY1Mdxw2KnrRZM0gqv9jAqPnQYWEgsW3wucF3YT
	4NO0T8Q+T3deGP9rZVu+tn1MkK+u8an49zlG6dshHNmzVQnfYuFh+urZ4f/sHxI5x2OuI2NJqVX
	ReTP+NeaZg/qQi1ed0W/1s7q85phXebhJS4j2bd53zsjpGydr83HmdAPtGM5eI7nkUyFlOPnazF
	TJItgIjAZ6f+Y039WmLcM8UD2yimCCZY/9JeRjajWqv6FyiS6M03ZzfJdnGGmIWmWZ1Pz9Dcqz2
	sDek78Yc=
X-Received: by 2002:a05:6512:1116:b0:5aa:6c66:e343 with SMTP id
 2adb3069b0e04-5aa87bc93bcmr3927231e87.38.1780909829307; Mon, 08 Jun 2026
 02:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20260605121112.27866-1-piyushpatle228@gmail.com> <aiZzxhljfyYQ68Gl@raspi>
In-Reply-To: <aiZzxhljfyYQ68Gl@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 8 Jun 2026 14:39:52 +0530
X-Gm-Features: AVVi8CcpFt73_s1W6tVAYjL6KIr_ANTO2-Kr_9uq4rs-k3XfwDZkGI2c1mIcJWo
Message-ID: <CAMB+xkZm-FA_hmnAYRnXw6T4tZvVtamM=kmEyatFKZWV0+kJFA@mail.gmail.com>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abel Vesa <abelvesa@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Fri, Jun 05, 2026 at 05:41:05PM +0530, Piyush Patle wrote:
> > Hi Marek, Liu Ying,
>
> Hi,

Hi Ying,
Thanks for the detailed update.

>
> >
> > I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI =
on
> > LVDS ch1). It mostly works, but I ran into a few issues around DI routi=
ng,
> > LVDS format handling, and DC enable sequencing which needed rework befo=
re
> > HDMI would come up reliably on the board.
> >
> > I don't see a v2 of the series and things seem to have been quiet since
> > November. Are you planning to post an updated version?
>
> My plan was to enable prefetch engine support[1] for i.MX8QXP display
> controller and add device tree for a whole i.MX8QXP LVDS display pipeline=
,
> before adding i.MX95 display controller support.
>
> Unfortunately, it seems that Marek is not a big fan of [1] and I'm busy
> with downstream development so the plan doesn't move forward well.  I sti=
ll
> think [1] makes sense(maybe I need to rebase it on latest drm-misc-next),
> so I'd like to see review comments on [1] and hopefully people think that
> the overall idea of [1] is ok.
>
> >
> > I've accumulated a fair amount of rework while getting this running on =
the
> > FRDM. If you're not planning a v2, I can clean things up and send one b=
ased
> > on the current series.
>
> I still think that i.MX95 display controller driver should be in a separa=
te
> driver, rather than sharing the same driver with i.MX8QXP display control=
ler
> like this patch series does, because the two display controllers are quit=
e
> different as I mentioned in comments on this patch series and in discussi=
on
> in [1].  Also, the common part between the two display controllers should
> be extracted to a common helper library as I mentioned there too.
>
I agree with your direction. A separate i.MX95 DC driver with the common pi=
eces
factored into a shared helper library seems like a better long-term
approach than
extending the i.MX8QXP driver, given how different the two controllers are.

> >
> > Thanks,
> > Piyush
>
> [1] lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.c=
om/
>
I've had the current series running on the i.MX95 15x15 FRDM (IT6263
LVDS-to-HDMI
on LVDS channel 1). HDMI now comes up reliably and remains stable. The mode
and timing are correct (1280x720@60), the LVDS/LDB pixel clock is at
74.25 MHz in
single-link mode, and the DC plane is scanning out a linear XRGB8888
buffer correctly

The one issue I'm still chasing is color. Timing and sync look
correct, but the colors on
screen are wrong. I've ruled out a few obvious causes and see the same
result with a
simple CPU-generated test pattern, so it doesn't appear to be GPU or
Mesa related.
I'm currently narrowing the root cause and will report back once I find it.

While bringing the series up on the FRDM, I ended up reworking three main a=
reas:
- DI routing (display interface selection and pixel-link to LVDS channel wi=
ring)
- LVDS bus-format handling
- DC enable sequencing

I have time available to help move this forward. I'm happy to continue
testing on the
FRDM and provide feedback on the reworks I've made.

On the other hand, if additional help would be useful, I'd be
interested in working on the
separate i.MX95 driver under your guidance and posting the resulting
series for review.
If that sounds reasonable, I'd be glad to coordinate with you on how
you'd like the work
structured.

I'll also take a look at the prefetch engine series! Thanks again.

> --
> Regards,
> Liu Ying

Thanks,
Piyush
