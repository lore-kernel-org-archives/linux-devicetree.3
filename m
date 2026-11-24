Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532462;
	b=VfmkN8QzAuSseTQzVadeG+z6sVy7MRxRZzVsUO3Nw8xSE8fvwo7tuzCboDn/kmUSV7nl
	 /qUPplllR0jIL85jhOk+Jb2xili1cf5Vzv/IOQcMOSiwjN0mA/I44KzO0SISVu4p24yYN
	 QGq1ycCDVkDcSPsFa/BWH9RX7v19juRwEU157LB9IRCpw316Fl8wZck2MSPaE/4KU3+p4
	 vmSAi2Ud9TunTHRASaL1XFTJSvmPiEdhwNtMtjFjAzH4Qp/rArPwFclG+AIDfTRm9FsFp
	 rdpmiiYl454GQfo3fQQbJ4Su8kptIRbLv3n+MMJRsstgR2W2bqrpux3IuWERbb60Ewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532462;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=asbWuIn9ePuDPZMHSTApP9g/ewv2TUXo/89WnF//TCg=;
	b=Dd+udx9WZ+PjYRAg+jkSW1nij+e6bbT3Fppv1MvJnmJ5nQVw9+ZiGYay1qSuidTgcR1t
	 40ldMAsIhXUU4BCc3arhOaiEeMeGEu4VNyU7TERq62Pw58k7NK4/XerAs8/FUAnEHW9B7
	 Y5Yku44G2NQXqn2BuBk4j1qJPA9JAjEQbsPgsTRPClNAb8Ftus+9khC3h+1KLxF/AbpcX
	 B4cCfRyDwZL1hV8GxqwX+APp7/9IbdoV9MIGziZRIWhBT7+Ga/LaDEe7jKg0WZu1jeaE0
	 XQ+PrKyeqS6rop5Kgm5SQuuW+ObpffJO2xKV2evgjBHxOs2nyj1N1gEd7OWivXkXmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pQ0nXaTV;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCA606A31E;
	Tue, 24 Nov 2026 15:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CCA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pQ0nXaTV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795532460;
	bh=dJcc5I0Ky/5T2QAptsnn0SzrB5NzoLMHaxiGnakhfhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pQ0nXaTVwLs9PqqU6CwULXvJgEIqxRyY5bxvW5uexTE19pWE+hs+oH0u+3jukYvE9
	 y0RiUNk/bwYIkXTnHDceGFq6aIG3JnXjEQq5rEedFvSGZjxUcFFcLA5+xWhKG7epWR
	 qJLqxwsM9GYg9ZtH7cMqOvV3Z9od6sWkRCszde6pNbSSG/lngu/Fq5abAGKsFyZn/D
	 WrQFyIUZCLRCFlhW9InQy5vEfRgd/MIhHhirkWQeuRJRHThwYc5GAajSaEHCEFX+OU
	 cEXN+KgSbk/KVER94bTmr227lVs7lsLPh1T4v74ZsYxB8iBJcQhpxg1TQYcCXPrlQX
	 AO3PveeJUDSQw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A22CE17E09ED;
	Tue, 24 Nov 2026 16:00:59 +0100 (CET)
Message-ID: <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
Date: Tue, 24 Nov 2026 16:00:59 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: Daniel Stone <daniel@fooishbar.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
 jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
 <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 15:28, Daniel Stone wrote:
> Hi,
> 
> On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> +void mtk_exdma_layer_config(struct device *dev, unsigned int idx,
>> +                                struct mtk_plane_state *state,
>> +                                struct cmdq_pkt *cmdq_pkt)
>> +{
>> +       struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
>> +       struct mtk_plane_pending_state *pending = &state->pending;
>> +       const struct drm_format_info *fmt_info = drm_format_info(pending->format);
>> +       const u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
>> +       const bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
>> +       u32 val;
>> +
>> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
>> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {
> 
> Definitely don't do this please. If exdma is asked to do something it
> can't (and I'm assuming that these last two checks are intended to be
> on w/h rather than x/y?), then you need to reject that in
> atomic_check. Getting here with pending->enable == true and then not
> enabling it, is not OK.
> 

That was done because mediatek-drm isn't in the best shape, and atomic_check is too
late for this check... adding support for those components is done on top of a big
restructuring, which still is not complete, as the entire mediatek-drm driver can,
and needs to, improve quite a bit.

(P.S.: yes the check was to be done on w/h)

That said, I think at this point the best I can do, without going for continuing
the entire restructuring here (I have no time for that right now, sorry) is to
duplicate this check in .atomic_check(), so that when the entire thing will be
ready, the right thing is already there waiting for the additional check to be
simply removed.

I have to recheck if there's anything "fast" I can do to make this completely
right without double checks, but I'm afraid I can't.

> Relatedly, most of mtk_plane_pending_state should be deleted as
> duplicative of drm_plane_state and it would be great to see a patch
> series very soon to clean that up.

Again, I agree mediatek-drm needs a rather big cleanup.

Lately, upstream has been a bit slow in reviewing etc for many reasons, which is
why this series has been there for months now (though things are getting unblocked
lately at least for this specific series, so that's good).

Anyway - let me see what I can do, but I can't make *big* promises - the only thing
I can say is that further *big* cleanups/restructuring is something I can do in the
next iteration (after the partial restructuring that is done in this series gets
merged, but definitely not in this series) whenever I can find some time to.

I'm all for making things perfect, but I only have two hands, unfortunately :-(

> It's been that way for the last 10
> years, with seemingly no discussion ever of why it exists (my guess is
> that it's a holdover from pre-atomic code), but no reason to
> perpetuate the badness.

It's there because the mediatek-drm codebase still nowadays has lots of technical
debt, and because there is this GCE//CMDQ programming that adds up to make things
slightly more complicated.

> 
> Same comment applies for the blender.

Noted.

Cheers,
Angelo
