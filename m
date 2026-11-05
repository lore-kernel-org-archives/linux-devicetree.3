Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889339;
	b=DAj4d9f1i7sWsL9bKkj11ekhX5xntc7xELncYThmylzy67K0UyDe6s92dwgy2QPeLSjd
	 GAdGHHo2PI6xlvvmVQV2tAFbXp/WB9SyL/TQAF7t1Jah94rB3sTBJU5IjSvWphBs4rj8F
	 ehlt1LSM+fM7ChpVtYICMXjI11klNfz1w1naTrmLnMOvJT8PFaSSku6hoGcT5qiwN/pgy
	 8pAwKLFcf99FthGhvKkj6vjLss+IOet/Tde3iSkZS0ULy9SbUioRqiYyXlRkh53oA6J+s
	 BrJfNDsdR3cX1MmjdpJ4oPfXoeA2NM++KjuzyhdxTM63AOiQdjlHkTmovpDP6Riy0rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
	b=VAOmK+ILIMSMmijaPmyZtDDIw8wMWK1OAlnHQITbuFX8lpfsV6PqWvlV1gRSfX7EJWfl
	 9e4X/Nc7JZzHCK8ep5yXLqgwLgx0fRLtBdKG2yIShxhAlGmifdGOtYGCTaoWFeySYlv8c
	 4b4HudCzuGv47xOo+6QO9VeYhr0E6daiNpNgVvR/U/+YwXWUDkjKWxoq9hq7WHAKMj74y
	 GLdrbU5IbO/ceD6sYkAfjeDZbxyV2BN0fmG/2no4CAvvb+n7g1MZZn+HcnuOB50ukyJqT
	 9fxdtfGWCHpVDfbp98R71ZR+zhgJ3ykjxYOUEQeD+dBfBlJoOeESXcnCA8JQUOxJdEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Jj56YXnH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0C606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F0C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Jj56YXnH
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a058f74a54so867512b3a.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889338; cv=none;
        d=google.com; s=arc-20260327;
        b=LEZvwbZw7eHnUo+38HQSyMzaX6WZPY7xgXYPPMaQoXeBmCW7Yhrj5JgbiikNQ++Wq+
         jQv06fqpi67FSZYmA1lfG5T4mzZXr0hZ7s8qcMMhHphx2+r8cKCB7JCZhGAwsmeZgef9
         Gxul0TMK5OHtAmK4QsqMn0cbPuSrGVNqCf4yH/bfwkONUD+4PUE5kQsXztDw9el74WgP
         VBxFjliMa2F1xMJcGT802Udmvimxu6p8E3iIGg0+P8oOSilv8IzSrTOgTORDL35XB91c
         cVnU6OJiqcVCHwWG6NxoGwkDjpQ5xnqYKRF3+Pj2s0/9HJX0PNEhY+cTV0jWcYtawEJZ
         A+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        fh=wNFnH3rTm3kL67ZjmwS0mUCXazIqWrbLtN3ALKYaNUs=;
        b=ODbGyQxvUPgnYIzpAVX82KbFSDMkpwPhdAPfPeUFmjTrsRHhydXNVI3UQ8Nhhf5EoJ
         EdUjCEe2PyYwFcQODGzo4Js9iri8nFusnNBwAuv5qIEc/7ymSQLVCryrDS82VOA7mRGJ
         AyQ06lGUkixFiNL0W9XFZTq30jFaH2JE4Jqm/GRa/w9l92m+SapfoP0gwW5vXGsg1oX2
         0FRRWa8oXiyObo9q/rjATG7tnzfuh98roVuOVJYGTlCt3VKj1OaxaLEkhlVQYpVKvp/7
         t3nf/PKiPY2E1iW1FHlu8M4zH54rX1dZEeRVbbPnLBHDFKv/dWPyTZ4634BFJelzeSxB
         kAcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889338; x=1794494138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        b=Jj56YXnHPNA9OiS+U7LQcVvDZoE3GLgUOYtK6RLNXR/tTBFNM8x5JOBWcUhpMwSTHi
         UfVr5BsaD7/XNQAGRXG3zwTYMDSOfWi5H0IygQgmw5b/6xHk/KqqxTQhrORfMzFk/yfU
         xBQxED2Z14vNAb/mS4Ch+zdz0t4jk/4G9T40sEGTvwmsMleECOf/OAIhIiW8CtbtHZjI
         XfmAiUczaElrnOBr56j5D9fgpj2s3vCui/iRlDTyS9uR9ML8ymfXxrykyGVWw9X6O9tC
         ilgrXT9RVlPxoCLCSYf2TrXrCTxxhHPFTGVgTc6N2JF7ZitJrxOhH8YL7jGmW56g2G0k
         ffmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889338; x=1794494138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        b=gaEYRHo29ejDoU1K8TDbGEnFV5ufozPaSheXjtPe5K27dwmbmJThQoS0CEPzfFeUEF
         1bnbVUi72fILikdl7ndB5i2rxFHbaor8ddNrt+ram1bwPO+JL8nFnMBWK+baBcmfM6bC
         RBnk9+6TmCN2HGs8udOyHca4yGZ0u3e9MujLcnK5Y4d3QM8iZV0rM1JLrdp6rCMop835
         bhS9P4rYtd0qMTh9WqLju/tZDc3eMikr0e3cjj0QBLYx8Y3sf8/97Zv+lVH2ExddBmlF
         3vpHr3rTqupgpkTDE2RJXXEQ8E8cZP/cH4/XgyK+nU74tbONo2vcAfoejclTBojTV8M/
         NL+A==
X-Forwarded-Encrypted: i=1; AKwUvBxXmiCgQcpUwbsT7b7mtQ9HfQhD5F2D9V1iHaZ7YcctHa7QCjuekqsbeulVAPrJ+Uh9o3hxk/ncygLI@vger.kernel.org
X-Gm-Message-State: APuU4Z+ClPlVWtb2szT9K8QkFPsn7il48WaEMasPp8fXgDJgFrNOe/Av
	M/J0huCCYAs2GFzSfffrn6OghzWEI8NubeOZhNC8YBUJS1Ng4vnm/Wru2qoZp1AoM0PFbApXzqk
	Wuy4kbKdN4baNCH8vdjWBtIrZkhPQ0z3a2De36IpXVQ==
X-Gm-Gg: AYBFou3sDiYrMl90DyUomEGyL26ANIr1xoc1qcbmXrUEqPOzFudQeYFLVyy1UiUh+S8
	MI3K7G7QksfZxC7Bcc+MzGXCqbFGileRrga5S5Z0UQUFcgOIUes99HPba0dC1/Dy+kfUojO+ivY
	m3dqfhOL13FH8G6bnNxPvYdWo8cKAkgcKtrtmWBaLC83adZkEpC85ejMTJx7ePwyTxSKDxK+UMI
	dsCI4RpjSuriUS4jJdAUEKdu9bbSf/hqEWMFp8QLKmElHxgpHWRAop0AgHuLTTMN0yEyI9HO7sl
	SgHtt2mHH6yFJtKPfoaHpypjd/sZZvg+Oa+Tr22Aan5IdoDuFRQj7QfG+p5NVsHoDJ2+FmYoNzm
	U2Tzx7aEqQKN0YvnOssIIO29TSKIV9S6WT7Dg
X-Received: by 2002:a05:6a00:330a:b0:84e:909:ac03 with SMTP id
 d2e1a72fcca58-8a9be48c598mr16519398b3a.10.1793889338094; Thu, 05 Nov 2026
 06:35:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com> <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
In-Reply-To: <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:35:26 +0000
X-Gm-Features: AclHuK__6TlodHOzyVdjm-UulEeYQ_S-cCkdzywOgk9TNIGTgV-C-tpWJDrX-8A
Message-ID: <CAPj87rOKJ_EEmSwkokjvqytgnzTi8V_EhtGywQHe7xeww+ECDg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hey,

On Thu, 5 Nov 2026 at 13:04, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 11/5/26 2:25 PM, Daniel Stone wrote:
> > But if this series keeps on collecting unrelated patches until Sashiko decides all
> > of VOP2 is bug-free, we will never get this series merged. Could we
> > please keep this series focused on the useful bits at the end, and not
> > keep on adding speculative new Sashiko-pleasing as artificial
> > dependencies?
>
> Yeah, sorry for that.  I'll stop here with regard to addressing further Sashiko
> findings, unless there is really something wrong introduced by this series
> (which doesn't seem to be the case).

Nice, thanks a lot. :)

Cheers,
Daniel
