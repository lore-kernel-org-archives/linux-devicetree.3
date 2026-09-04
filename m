Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4587F3D9023
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509651; cv=pass; b=LCdHeh8+A+0cQFBndekvHLq7A8H5Xiz4kAiSCjzIfSw6LwYq7+sRs6GFazbM2Al9z0hAPhy8p140zKlNTi8Q0AvEKCEbxI//7XcoBCHP70XY8MKW9YgmjB9G9rycoZfm1Twr3s+v2LBFf9SkJ7PaxuJfYPmXYwHoD5Byze9MINw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509651; c=relaxed/simple;
	bh=cODYgkqioxaFXfwJn7xnB9uWDLxGNrCsLV4W2VTwJEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAQsw7w/ZQPThpFjvjyAzoQMU4KzB0Xby7hW2wxkTvy/Jz1YgrwuFpQ9LbpOpKiwqycGuiCqKogFutIIVm4F7xX4I8wpD5oVFetFioBKazbJS8tnTSJHqdj+rtasRJsc1QXhdPeZclrs6UioWeV2pOpvrra3GwZsVQp8akcIDxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hp/XmOUL; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hp/XmOUL"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66f96a9d30eso171488d50.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509649; cv=none;
        d=google.com; s=arc-20260327;
        b=hTBqjfEeHk1Si9WsOtAWoHa+8YWF1maBRqYBoa3h7dM5VFgy2gLP45PywEoM1lJG27
         /7njP3bcf27rD0qaE5fwnLXeka/XBtm5wM0r6mLnZJlZMJuxZt8QdQwuIGMKqb/MXsje
         QBkdSkcd3yJ5wQuBwfCip/sPX7U6QFPg7nC1P5y68SbwpsuLna63yrdNgNcUloZqMeBj
         IwWfTl8P7Y/wTCcw/yC2NjL8wYCHftDcnGgLtkzHAzXgiNYyz2Lz67e/DZ6VJs/8Q+kv
         By87Zg7b+AFjHgLU1GHvxHr0WMarKywdQ1BwCWFewaj0TgztoHCZu9saAbvFmS+ytOPx
         2b0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        fh=4hOOl/29ztMzQI57QbDNeRGlSUpZLV5OkwYWNRLwotE=;
        b=mn9MkG/hfWwAbEPvk7hi8jKUB0XQPM54kjLoQ+HC16DSLkOJNCCrb3/Xc7045RuNOF
         6SC0xjiZRh/1JZqGIpucMeHvWQUnATtnqW1Qbk9aVJDH45kq1yi5KVp0MiY0/5e0LmZs
         nP5vhV5/S+zAQ4v5BiLncjZeTU+oQAiYvkGv6e/lBnY9JPO/LJUoXgqTSG7FEyEHsCwv
         r6QxyaCYP5dgrYd9jndxRmaLGXbeifaSi1u6fWbzVDCqX2CJiDso51Yt/F/VDoybIIzE
         +H1sjC18GJdr+Ufm3SwILcIkd69VhphN/3kppmWGOCiCvjcEldWqIRvhW2eTHVTNuM9x
         Lgxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788509649; x=1789114449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=hp/XmOULl8hos6ueQMCEt77YRd351d0QwD4CL8Yy2gzsVvec+jhdaCNrh4Yca7MN/k
         YhB7tlNKiaM7GQ3zRXyHKeyjCaxZJ/cA0ZIRA0nm6AuTFPVL1ldlfas1DpOLHB/0kpd0
         Ob74Fx912i3fzzb/UVa0abPBSIp99phjuhVgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509649; x=1789114449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=a2EYd9xvEy1msM+hCbJTkhS9skABfisMOqs7e4FtPCioaVqijxMHr9FHuffZuFOBKG
         7khQXlpraPZQP9rNEP6+eg52mF1+rbsIuXin0Z8C7yDZdYwni4lvV5OH7Nh8y4VIUNdv
         h+bdDTQarqxMkdgP38yejphnMSyShNQwlywq/GhTi4w0jgLbwwWSCxIpg12JuWSjazP+
         GcTSvTX707ttLNyWgxRFQfu+vNhi3YlqbMlUMV2gVHaLaejhYHcftAq8d4q9kcu9wd6x
         55+z/7Fms6aVF28NgDojdl81MkPLFhkZia1iVB9m6NzvZfTIiuwZELRCUISRdZe2GVLL
         74PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd3CO4Wf5n47jh1CBFjJ0ns2LxXnUnLeeL100MiOdhfw57wNzwC5yy/oLbyKwBFH9nwT/8GmYr8qxy@vger.kernel.org
X-Gm-Message-State: AFuF++mHd/MCXkB/DWwHXc6dPOBpMNoh3P9831F/SXELkOG8xY1hp+2z
	cXN3cP4L3MVXVOoBeQEoh3HGI09S5trwxY9Vi4SLR98/0T/RF1NWmMCMTFuDBLGScTV2Hwnqy9b
	0mE42cCku10KkvLi2lVCRjlOiB+rD6GL09n2ewSh5
X-Gm-Gg: AYBFou0HyYaElA/PPq634BjNwZpq/OEQJavFZkv2JT+RzRWUoTU6Ienbj0PlEIMB2xe
	KwTKyXXmBd5aGQ8fzA0phgRIMDAxQxOWg8EtfsUr2QVqxHrVv0FRNzSsGHuxkG36iQxYCTJy1tK
	rHbRgfMY4DstPsZ3D14r4u094xasQ1kNwSPjjcC2GzC+Z7wvYWGSTLK49vaAJrBPJ85zpIbvWnA
	4K3CXAz6RPzBdn9TzNuEPUTgfWOlT7B5WcQN8w9H1ECBnCVyWfmch0r8ryxFxlAFZhTkwCXC+xj
	khxapT1uqt3fzCHVP8D7mCfhPOkRf9NRPEq/+KLuJxzd8c0KsjAGLr3xe+9YUP55jO04VKLzSY5
	zfNBQzihq
X-Received: by 2002:a05:690e:168d:b0:667:770c:f88e with SMTP id
 956f58d0204a3-66fb5aeafe7mr1463610d50.45.1788509649151; Fri, 04 Sep 2026
 01:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
In-Reply-To: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Sep 2026 16:13:58 +0800
X-Gm-Features: AcwNN1XC4LXAm1BwVIM4UDg-tlD1lttg9AE64QKW3tHBF46eVGyIPLVMv5NqRcM
Message-ID: <CAGXv+5FEx=H9r5MGequDpH3i62FAWbXdwkk66eBj8+ziT1fhMA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 4:23=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >
> > Apologies for missing this, but the first DT patch depends on the clk D=
T
> > bindings patch for the clk ID macros. This is causing build errors in
> > linux-next right now.
> >
> > Not sure how we can fix this right now.
> >
> > Brian, would it be possible for you to split out that patch into a
> > separate immutable branch for Angelo to merge?
> >
> > Otherwise Angelo might need to drop the DT patches until the next cycle=
.
> >
> >
> Yeah, that's so bad.
> I'd be happy to be able to resolve this, but it's too late on my side.
>
> I should've checked the DT patches more carefully, my bad: I got a bit to=
o excited
> to finally see this PowerVR stuff working on MT8173 and going upstream.
>
> Sadly, I have to drop the devicetree patches :-(

This is a reminder to re-apply the device tree patches from this series.


ChenYu
