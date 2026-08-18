Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8653A7F58
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047099; cv=pass; b=qtyd0+3smydlqIX1TYIDf8zn9QpYJzzKk4CIc5bXftIisplP16MNh3+BLEoPKZX783tiSupOOsT0y7D+cA0LO27ubWTIZl5mpBvft4MCmQeSaPCgGTHXwHxWWalepZejD4u2wUrkdA6L+WwawXlp/C/RkDgmRnGsadaqmO7sZ2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047099; c=relaxed/simple;
	bh=v7X5fOOgkMN7zwozDWTMmdpVAqvNyDVzElCQ5lmWHdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdIXClsFDS98pnNLVy4PXu3botzVMSJV05+czGeBqlKF/PwivArnqajthZRkruyRYgpnyVZcvUF5yqJEEP/fsnV3DEGVzn3IAdjq2qb7673GovKwvAsu8BOEvCiCu2qvQ0GR6C7tmzVlWAMX21JXS3VuEIIKq3TLt805LnA/1lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTn1BIgF; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTn1BIgF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b159850b16so4197134e87.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787047095; cv=none;
        d=google.com; s=arc-20260327;
        b=GmquMJinPjrN5PIu4ToBa12A6zlNeKj/yM2a8NyFI5Y9QKNnZs2IuybL5vrV7zjz1W
         TRmwj5cGcYcoEpOtHSIwqlTJNpByzmGYP9TwA8/Jo0SvuEGicLLbZogFrfYdm0vj9cSD
         u3efqOa1s0puyxeNCB2qGNF4b8RBjQNtisP/W+9HP93rHu84GE66NDXAsVhbACpPtuhz
         XQ6nhX6QwpqimZPN6cs8I1SvpRe6RikJyOYF90+0TeBqbfDnzC33YOVhZtdhNGS77YHn
         sjvT5KdubT+kuEqm+a4PWm/q6niWLCsFjMmRElcRL/KHDYOiW8R5ecXVdTpImL5elFl/
         gn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=;
        fh=xeKewJg1X8jvrGVBGGoZjBq5h80uqTxzoTWjMexAo6g=;
        b=OAT8Ko3odQ+i718zg4e0r1V9nMkZj0pkOyAt1ZnF8D2xWFdTDbslGIWF9B1X2Kq+2b
         oLK33KoBGZ5DOqKiI4ojhvyg82UHMZQ9zvDEsYQVMOZB5bVVZ5XGxJjhAMriyfa4Zhfn
         8iZQCyslXW7s+Y/YOzM/K0MPzFAVRrNhVoGjlocdWPwhhKO7dFkYRuKrXSxx6PxD1C2A
         OHnMZBk8aSU/UUJAopwFecXawyqk6fZx8dupkXNQ3eEB93HfmnrnX7eJd4id0kZIwSAv
         xgt+dWj+k9uk0ZyEWqRpXQnRKVAVgJJ0K3jdjXWdvveVb6xqhdVK7s5tFTtU9qkprmrP
         qY+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787047095; x=1787651895; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=;
        b=XTn1BIgFrgnNUBoTe47C0ZSHKKiP97okpPyS1BjPkb1qn+3DbdNtn6UvsTNpQPcwED
         PCR/IqGBZmSfV6SW6NiR42WxSnAx1kc++wDHZ20Mf3KeL05wHYDrMqlYtK/5pn00Ghju
         twFU2mwtnVNZqjCRU5I099xRuq+J+319Pa+CsrBrCJIk4rK+cQGFC3cIpSkw/9QZuv4Z
         oyTSdAsrcJLRK+vXKQlH1qMESygSNW8qTc/CTBlPcLfwQmdU3JsYplnEDRCmVtN9QS/t
         nx5+Y8WuJdgT9dy+xJA79XM+/q5oTae6Itv+GL1nYNUzdPUy3ZMu0Cc28eZXF75T2Npn
         z6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047095; x=1787651895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=;
        b=cMQcKe5o9JYR0VbCN7F9nyNPqokQp4lkQN4PZ8AqwnN/Ms6kWBcAe8XJvK9RrsSrG6
         w8FObQykCMDxirSKiHpN9pKT2t6jYXHhQsaSVknmdoh2VT6h+SwNcCk4lgjbC6mskFSZ
         xwcflJLN9D/kwQHcxqD9iHLSl3jXZ7KrXbufrL/Xuyw/dTO76otB2f6N5UekqaYyqhi/
         oN+Gk+aTYcebrevoyV6AFKYvxA14q1CR1OXETxr2JUi+IxdIMok0miA77YZjiIjRJHFD
         SvKg5gULh3tZNVjyLpvo2yinTaazRP+OL96ER+ZKJe1PO9edDhOTaFOW2d3iDE7vPjLE
         kSNg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9F+J4CWp4AvhNdgwYCmsRTh7cZVQ8t/e6C/mPXcEsa4UJpQg/zbbpHVQ2YVadSsMOT7bVv42Gi0mi@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCGeR+MSHCD+H51nshqgwtQiHpkvSmdonQrMhIJXftzKYeTI4
	13SIEKyv6PUqCRASC3ByMS69o2XjThhJL1N85V/dMIWzYvXfI9iHvDgTbmagw7oe/ti7chyfYG1
	Q5XZR4bgnyRLhNEqQlTVHcvZHLMkgYx4=
X-Gm-Gg: AR+sD101pKOAjMO6wOIWs2mdc6+oUBI/fC7qWGusquk/cpYpN8AtKVbB+dLhQxY9x5n
	Y/eV+7dfY1Nvmy0NeLm4JQ0137bo2Hch8vOMtID/H4Bsuec2SBOFgvtMCnKYbuGzZTAfaJJNWvX
	Xdsb1CSECr2ZhRenfHHu6ziYwj0Z1MUfEYnCu/lYhjKs3+/Y4xlmYQmqRzitT/G5DeeWpbLGEw4
	xFMvE1DwDXZ1KJAJPSMpL/TUWvefJFffajN5xCAZAr2ksbMnEsNx+GJeZb8Pa942u1V0k6+0VJF
	QCqmooEMmFIWi5mwny6kvc5V2XPavYTytAoO+TsPpRWZBWC8Z4hXdS78sHE4J/pjdDpMJWGM1Je
	gXRmwTuxxYeHEpsozveHkxd8NhA==
X-Received: by 2002:a05:6512:3d12:b0:5b3:c15:c688 with SMTP id
 2adb3069b0e04-5b470661ef1mr1563289e87.7.1787047094580; Tue, 18 Aug 2026
 02:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <c10c5132-1bac-4bf7-acd5-1319ce072eaa@lunn.ch>
In-Reply-To: <c10c5132-1bac-4bf7-acd5-1319ce072eaa@lunn.ch>
From: George Valkov <gvalkov@gmail.com>
Date: Tue, 18 Aug 2026 12:58:03 +0300
X-Gm-Features: AcwNN1XJfTB43bmjv2TjXUd_fF7J3LtyinrySWzpxtBcHtKj_KY-OKWZu5UgGM4
Message-ID: <CADOrJmZpJo+MDZpaAC=cGv-i_ZZ0wNjWsMP-dttnE3aQPpHLMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Andrew Lunn <andrew@lunn.ch>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, krzk+dt@kernel.org, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 03:53, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  marvell,ignore-regulatory-hint:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Ignore an incorrect regulatory hint from ROM,
> > +      so userspace can set the correct regulatory domain.
> > +
>
> Maybe this has been discussed in a previous version of this patch...
>
> What is Marvell specific here? I assume any vendor can mess up, and
> make a US only device, but ship it elsewhere.

I don't recall any previous discussion on that topic, other than the
use of a root flag in v3, which was objected to, because
marvell,ignore-regulatory-hint does not belong there. I assume this is
due to the marvell prefix. I guess we can have a generic flag?
Implementation instructions, along with good design patterns are
warmly welcomed.

I like the idea of implementing a standardised approach, which is
scalable to any platform or driver that needs this quirk. I would also
like to add this feature to mwlwifi (not part of Linux), because the
main radios (88W8964) on WRT3200ACM have a hard-coded region of 98
(non-standard EU, translated to FR because it's the most restrictive).
This way I can set my correct region: BG.

In theory it is possible for other vendors to make the same mess. I
think the chances are very low, because they would violate
regulations. The story with this Linksys router is special:
It was designed and marketed to be OpenWrt compatible. Likely because
open-source gives a lot of power they made sure the hands of all users
are well tied-up: all radios use proprietary firmware and are
locked-down to their certified region in ROM. They do not allow
anything related to regions to be set. A third radio 88W8887 using the
mwifiex driver was added with the sole purpose to monitor for radars:
this idea was later abandoned. I do not have any information about
this choice, but my educated guess is that using a US radio created a
conflict and they disabled support for this radio to avoid it.

openwrt-ai:
https://github.com/openwrt/openwrt/pull/24458#pullrequestreview-4956971863
TLDR: It suggests that the compatible string should be marvell,sd8887
instead of marvell,sd8897. The string it suggested is not documented
and would need more changes, which I hope to avoid. I prefer keeping
things simple. The string I used works and is documented.

Sashiko-bot complained that patch 2 adds a flag to the device-tree,
with no support in the driver. Patch 3 adds support in the driver. Let
me know if I should reorder them?

Greetings!

Georgi Valkov
