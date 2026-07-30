Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19183A48E6
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387097; cv=pass; b=uaHD6CRHEz9glRDgyxuwMGgfBrJ9UfrkC4s67RV0dE7pJrWbbdxMV2HgszCZ5q4GiDYsKm1u7J5zS9nE5jHjPIkQbSOXnFFV8DvVsMTMgonpala9U/en2yZLyElifSEoIfnB2c4YHmw4a0S9EhU54JzMxcPqBOPC8BfJfv8fRPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387097; c=relaxed/simple;
	bh=NYYY6bXttSIzHd98I87BJHvnHe3viVIhQmcGl5Svy7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5JMmfRlE2uamht0ux+GUk5ZkxTWANOdqYKggv8hqvJKrhHoN6IURsnItnVWTyaGx0m9TzziKPRkUsJeJd7z1tscydRRz/YO0G3LWJUQhPufe3MSOKi4hifxcR+GukgyFdTR3YcsPuy1qv98u9es/vopXvxFDUr1Jdghrwe9G4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XBQKUVFP; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XBQKUVFP"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81f52945098so8193347b3.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387093; cv=none;
        d=google.com; s=arc-20260327;
        b=UMnNDtizPsn/i3hv22SB0tcezqcchYLBZSKMbjxdoE3WJG0ppZwKUmkcQjbSM+z2XL
         Ot5TT93gsNx4C0nj+0fj2ZqMeiM9N3BKOjMAOfUfovRyWBzO9A9sntSQLZGzdDHtoKq9
         9oNeM/BYw1W0OAGPitA9POIYMZyml89vIkylTuEP8OAynlUncxk+DNjQxbwMLPPIK8fA
         Y4Rv8kgrly172RMLEqAZEP9wVb82gboaRbt7CRdPFX2Dh5FzVQcH8olPVF37cKdvkMeq
         hUuCsRBiI2qjAqoxrvTravMs5g9w9bjrRREuRpiaB9Utbp7gsf0Bw69AjreHTAvHJkCY
         Dxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        fh=+3vW1XzRj0Sl1VnVPQcIlwODI4rcMOoPdDhWVfsj634=;
        b=Umlylx0/q/vlsIT+cLBHqXVzxh5Fe30oMV50vXXgt25AlZa7b31vDN6qAl2jmHNYnR
         KFjCYDziJgjKNij9egNfRAytCqCKwFZIxBzAtUNuke0Az8Y1Or4PFfV9aIaK3hTtg9ub
         VdA1FoSoLI4eZpTyXzHX+0BggyoPLGznnBeExUF2eWa+vuol1K95ilrthT0gO2PItH8/
         lPj/oeBIot16oa6GXWKtDtf7g567A6N1UfGS42uk65wZzNQBoycIp2lNdMvvvMTuInqk
         h/7Cx3ecXD1kzJHp1oFtYrx9thy5rPQyWOOfS5Qcc2GqJe6yuzaMQnySipc6A35gmcfl
         ybbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785387093; x=1785991893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=XBQKUVFPkPb7GsxBT3siztnVMv/M8zQAoRENDzknBzXsPMw/vaSYTL/wpA4iH13eGu
         NWcSPEgqNwGTX+UT0fI0STZ0QU0nelJ6krNoY99ZCvPpQsqlz6ECd/eHf9IObNHK326z
         BMNc1L2Ztq+IoKtdl/oPfN/acLGSy3p/Fy3LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387093; x=1785991893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=YjPVYJ0C7yMlyjCkJ6idsIuiAy6caI2B2rflkwtvdEo/uVB/g7EEATcTsvfGE+9eyG
         5OmnQraUi/8b6Yd3ZfOl6+IflMNsDZPHbyVHUk+lidcZCiFj4HKqZ6hr+/XGq1efYO1u
         MZYmDLIIMn8U+GKqI9oEbPmrgGz7W6km/qxrBbaoqEgUS61xHfV3jRTre8tl/PvMsaGe
         DMwO29LVQNp38x/amm6aQer/RPsPd0L0dcdhPz5q1k9n66y9cA+2EnUJSJ9uoEiEKIdo
         AnlPjkZnr3e0MLXNJbEsUbTYYls1eQRnCqhZd4rgGnzauyDMW1+YofzLigcqXyyFVLHK
         0p9g==
X-Forwarded-Encrypted: i=1; AHgh+RqO2fYzmfEXMkwmTx94WLav5d+Vel/v+KNPRqQVUMB2VgBZIHYxGxVVyqD80LcTBz0+EGKNAKeLos0i@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWJJG4Fnnd648+Rgi3wbiinhOqZXacoxLlL9mXP5xG4ImJ1pE
	RM630v5+y23/iOfSd7cWV9+V+ZGpuetAReJBHcaSQK5O62ksH0eLNl0nfrZXZjPqKZFIVNCy9Yk
	0Q1QxxhdxumrQsnU7MfcdmORxRC7it1qbuX757LCG
X-Gm-Gg: AR+sD10zCpy+TUx2tdyPfIF8fLhlyxa2HuJhloZNs5nilY/q02FxFX2dSG8HJSIpMyq
	m9560bn7d3JSt0ndHho+LbZg7dOrCtAWyIpBbwFlAjt80T52mBkMAMR08YGGjfe15CdX+h8ETN4
	cRxMZ44mhx6S1+GZZ7tV1essALeFPf69vuKPJEBrTOtFQcLEAZt1ztLHdO1+a5xX1p3XPoUufL/
	Wn1rpgnL6R2phEUzg+L6+/Xlpx7pvdTvSvbFrN8vpnejzdsWWiP3OC+OAX59d8Okx4ColiiWWQ/
	gZzS7dLp5T4ickt68OSwXT1Mroi9WsWYc3BvqZETf3UQvob7544zzvBEpnLQOUZG2d3VgbBdYRv
	tDf2BgN5Jsg==
X-Received: by 2002:a05:690c:288:b0:81e:ba92:b253 with SMTP id
 00721157ae682-81fb964be1amr5292937b3.4.1785387092765; Wed, 29 Jul 2026
 21:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com> <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
In-Reply-To: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 12:51:21 +0800
X-Gm-Features: AUfX_mxnxexVKpsRakYQvwrmIlkydC8kB3j1QZQvD5J6WTjr-o8egQw_wYmWxF8
Message-ID: <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Chen-Yu,
> >>
> >> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>> Hi everyone,
> >>>
> >>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>
> >>> This time around Mesa was ready for basic testing, using both vulkanm=
ark
> >>> and glmark2-es2-drm (with Zink). Details below.
> >>>
> >>> Changes since v3 (all in the clk driver patch):
> >>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>> - Added missing of_node_put() in remove function
> >>>
> >>> Changes since v2 (all in the clk driver patch):
> >>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>    - Needed since the driver implements PM domains using the generic =
PM
> >>>      domain library, which also depends on PM
> >>>    - Fixes build breakage (kernel test robot)
> >>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>> - Dropped unused mfg_desc (Brian)
> >>> - Added check of clk_prepare_enable()'s return value in
> >>>    clk_mt8173_mfgtop_power_on() (Brian)
> >>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>    (Dan Carpenter / kernel test robot w/ smatch)
> >>>
> >>> Changes since v1:
> >>> - Adapted to changed DT bindings
> >>> - Dropped driver change
> >>> - Use same power domain for "a" and "b" GPU power domains
> >>>
> >>>
> >>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> >>> some Chromebooks.
> >>
> >> I'm making a pull for Stephen for the clk changes. Should patches 1,2,=
4
> >> go through the clk tree? Patches 3,5 go through the DRM tree?
> >
> > Only patches 1 and 2 should go through the clock tree.
> >
> > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick u=
p
> > DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >
>
> Not sure if I can really take the DRM bindings patch through soc.
>
> I will take the devicetree ones exactly right now, even though it's going=
 to
> give warnings.

Apologies for missing this, but the first DT patch depends on the clk DT
bindings patch for the clk ID macros. This is causing build errors in
linux-next right now.

Not sure how we can fix this right now.

Brian, would it be possible for you to split out that patch into a
separate immutable branch for Angelo to merge?

Otherwise Angelo might need to drop the DT patches until the next cycle.


Thanks
ChenYu
