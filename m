Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C961FFE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550642; cv=pass; b=VknQXoW5Rez6xF5NwDKsVdfLQodFh0oREzV402ws9tqAK7L7LLY3ssJMh0hpVnIHYtUWeYvn+10ihPKL3ofRz2A3QVDLm0JYOJXNAl1HhQP1XPn33J4V/AnH84Gl4FRiahPoxhRU5yTQHR+6UjQQyLT/J/BlFqrtRpCFgNBeSDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550642; c=relaxed/simple;
	bh=cPM8oDxwzYcAcNEQsPk/5pfWXGHxBQ/pHARivsKUXGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx41wy3vgYXwVYmahq9r1o3ZaA4+qtZCKu2unpObm2xbiwA8hm4bT23vwpOkmBN9VGFtK33z400EsbythmpejbX75Adc5AblB0QH5vd1306ESqmY4aPwug5SH22eiKTyTMeIfkpw5Ny5GzMRMXwrHd0j08ZMi0y5m+4E0WIufsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/QLhcvE; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/QLhcvE"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66787b93a0aso1118551d50.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784550640; cv=none;
        d=google.com; s=arc-20260327;
        b=BV0M6Mtws4y+vP2vb4A2WxPYYe9y+WF5gzuczlsAjP8/a37hMXdjsljCI1QzGHB/7U
         tDjR6z3Xz0rFj3+z7mYRYT0mSqdvHw8EGvT83Jelttm7uh6LtIpGUr8CnHxV9axIEfSw
         oPl8AUhuvrEZ+AJ8D1MRmHLhNT5cCJZNNP0Qsnakqv5WLkeUpc2kFilWLyjIxPuFBMaW
         8W73lw7sh7WsWsec5uGrHgZ9hpKm2KZzI9MV6HUr9dkdFRi3GLjB4IF+VsqnMgF8of+K
         GVA2VSM73qzcmJIBtHdNU8k1xVOeMSZZGHng5b59pM1PNqIU/mRZhCLBF2LwfvmXm1Tr
         +x2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=;
        fh=Z3nZwOuWV1t8sRtT1EwbVAPgDE/AKFVhE7Mo/yRtxew=;
        b=Mmx09jmEvcXtAUmmq0Ij+X1K3l8OaAAFjpWReAIvrOs0/TgrOzTbMHObFlx8r5PJvR
         OqFMF6uH8jT09rcVST+A7PQJF0JxUVevu1KckhS3lVWadJDSTqbgm5NEQpH2n0jqD77i
         y7VJ+OzQARO0OXRrlrEIO/SHm3FFL2RF9X7XTNpf3pI12NPoYgWwq/lkquOvA776yBgv
         w6+4nBFNU4lO1kaUNz6A/zM0/2rawMSgfLNvuazKV54ILT/6+VzbKoVG1bc4O9hToNwg
         PqbG4lIJ/bdsgPgvz3EEx+zwaDKRkQdC/JsclBC6CUImEhotVkmROobBYSf+yB2Cru7M
         a2ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784550640; x=1785155440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=;
        b=Y/QLhcvEDbgfmgQxLM5cmpKjUF3I8jb84H57wTPPaZxS5ZQFOLdgbTkIGS8mVt/DoF
         7wZwFNx6L6RiegJomoOvh0ITPLls+YRV293Nstg3wXcgZNSAfNckGBQ7f9iSBssHWXly
         CUVejkFoBe2vgEjdd+W+nxoxuz10+Hq7W+Fus5/T4+ca+bnkeZwzfuHYjdDrj+gywVO9
         I8+IR9/Vulegu0Gghzh22iHTAO5KQ7tRfKRMIoWQz+b3+MgIhSJVJu5Bah+VAuMkZJdg
         0Zl+i+GiMgLJSi/6MnfgWj5Qhd8E1hZL07363LF1ZsHOrHYnCPhso7nZHTr44c2Eymqn
         zkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550640; x=1785155440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=;
        b=f2WOQ4WGNfTCz1LtZW6OiQUfu8L4yrhgqr1yQPBuIGJnGFvWeTtiHu1f4TK8k+Q9hy
         UHHTewznbqgyzDHVGPtmeTh2GCQQLODPKZWhvl6LmYMJ0OX0XZuI12Ed7ttN9irvwA/R
         AI+tJBXdPzbSJl1ioOu0cPsl11M9DpOx+BXTXUnLOvrhytKf6rRoX2dmQqdHk60ndusE
         0K+a+rxu3MFYL7h2tzo6T253pd1JtyT0DHF75BXWuVH47/99d7pvGM61t3QBrF2BZObo
         IcotQ59GlRNiXAfp5oE8BtW88h7x9Zkcr3mmo7O/FNlRd8ND1KJ9dUSo3EgwXy/JwKCw
         HEXg==
X-Forwarded-Encrypted: i=1; AHgh+RokT/FCDX6C6+1TU3EnHpbaR52QmSqnanvwjd1O1BUvWmTcdR5eUlQ/kVvVtg9vZx7e1PW0Ovv/SPbv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw18vcSgHLtxVuPUEvR8CVo5eCDqOh3JxAS+zw/TVNrI4lGFu3e
	x5HbOUxbjrDJgUhm2+4VLQhVS4OCa+BbGjIhVNytduJqTUSp6GqU9YsqEJq38WoOqBK5iObnPgE
	P0hc8TmFAiQIgSjMiaPnROCQIfQe2qbM=
X-Gm-Gg: AR+sD12+pE0jrSGzATIRfXPde/2Rmfn1KNa0veODfP9c+xV/GFpmaGYBAW37OomHo50
	x4F/HjdNh3uSabVgF4SbyGBYsMOhwwzGh3NHyf71jhRl+Rmf6mvQ7EqZTxWAJmT1uceug36oCVD
	NkAsCNM1I2VbhH48hyQaMuGEAoMcMMrCSNgY/VCWSbQIH00IN2gjFLX2ECzTpb8VCkMmcwz5wgb
	eCvrj2SbLwwdfEG78aftCe7WznugL8yQl2RRLXmrU7SvxhQFKD1zmyWJcObMP9HAvUB7bYaGdYR
	YEIC65UVuBOTfUOMNUVZAt7H6asUKsc=
X-Received: by 2002:a53:b185:0:b0:664:afd7:e41d with SMTP id
 956f58d0204a3-6683bd3225fmr3054006d50.6.1784550639803; Mon, 20 Jul 2026
 05:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
In-Reply-To: <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 20 Jul 2026 14:30:26 +0200
X-Gm-Features: AUfX_mxl6V0Fcqr3p7PwGpYbAibraD_hti9tBU-fCmVXnkE6AMcEpLARKs3E8NU
Message-ID: <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Great to hear it works on the 5B -- thanks for testing!

Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
It also supersedes the suspend cancel/re-arm I had queued from the
bot review: with suspend refused while audio_streaming is set, the
worker can never be armed at suspend time, so those hunks are
dropped.

v4 follows shortly with this plus Sebastian's dts restructuring
(shared disabled-by-default card in rk3588-extra.dtsi, renamed to
"RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
reference + unevaluatedProperties).

Igor

On Mon, Jul 20, 2026 at 3:43=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/18/26 11:57, Igor Paunovic wrote:
> > The Synopsys DesignWare HDMI RX controller extracts the audio stream
> > embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> > controller. Expose it as an ALSA capture device by registering the
> > generic hdmi-codec as a child of the controller, so that a
> > simple-audio-card in the device tree can bind the HDMI RX audio DAI.
> >
> > The sample rate is recovered from the ACR N/CTS values together with th=
e
> > measured TMDS character rate. A periodic worker keeps the local audio
> > reference clock locked to the source by nudging it in small ppm steps t=
o
> > hold the audio FIFO fill level near its target, which avoids FIFO
> > under/overflow and the resulting dropped samples.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > ---
> > Changes in v3:
> > - restore the v1 audio teardown in remove(): audio_shutdown() already
> >   stops the worker when the stream closes, so the extra flag clear
> >   and trailing cancel added in v2 were redundant (Dmitry Osipenko)
> > - rename the ACR read locals and add a comment documenting the
> >   register byte packing
> > - drop the get_dai_id stub so OF-graph cards resolve the DAI index
> >   from the reg property
> >
> > Changes in v2:
> > - register the S/PDIF DAI so the indexes match the binding and reject
> >   it with -EOPNOTSUPP until wired up (Sebastian Reichel)
> > - use platform_device_register_data() and drop the fixed 32-bit DMA
> >   mask (Dmitry Osipenko)
> > - don't leave an ERR_PTR in audio_pdev on registration failure
> > - fix teardown ordering in remove()
> > - stop the worker before reprogramming shared state in hw_params()
> > - look up the "audio" clock by name instead of indexing clks[1]
> > - keep the worker on system_unbound_wq when re-arming
> >
> >  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
> >  .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
> >  2 files changed, 279 insertions(+)
>
> Works well on 5b, thanks. Only one additional review comment:
>
> Please update hdmirx_suspend() to return -EBUSY if audio_streaming=3Dtrue=
.
>
> ```
> static __maybe_unused int hdmirx_suspend(struct device *dev)
> {
>         struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
>
>         if (READ_ONCE((hdmirx_dev->audio_streaming)))
>                 return -EBUSY;
> ```
>
> --
> Best regards,
> Dmitry
