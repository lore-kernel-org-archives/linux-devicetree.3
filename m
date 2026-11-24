Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515983;
	b=hxpyuZ3DtNEG4bJOcezKcxC3ntQWsSwT4Ur6uvyxFUn3uhPLhhUf45E1CgprMsJAq4sY
	 PFeHbTQAd/k/o733ngUBdKAD/3PawBqXuoviWsEVK/zkxKEHNSmpCQUZU9Ygw/gh7eySR
	 eWlShTeR7N7tNdxkS/FIaLbJVcMSESTItPKMgcddg5/mnn6XkLXtPMmUG67YyQ+91lc0F
	 9vRIugqLKfWUWXEa955IdWNvo+r3oOGMvPZ9AtIczIMyj5rLVOJyVtUIE4HAIfv/yrTry
	 9Xa5VZs97ikL2vFpiZYbGcREER5qrXFjdm0hCVfIx2rzJrPgUj7EW/XYnryXPUmD+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
	b=e9ZpkXw5mVV2Z1gi3zlyiZAbO7VxUEp6DDWCZGMfINY7/woVICqGEyonlq+TfsFXAJhr
	 JZt68uqzRd7CvID+D0i2qOPdzBRlTNbQEq10A5XR2EGKu1EMeRRxIjzERVHthMEbskua5
	 wuW2dn+LFZeZ/kKC63uHFwaaULyYfyqBSEvHSw6kPvyVnzSwYXvpGyo9uvkCpZCT6M9/x
	 2H5sgi1xcKh5ZvF+RwCLnUAm9VncMDcNgoHHowfAdVQh08whV7jCpIMKNf+1dcrb6IU0i
	 e2jj4W6k2gGRP8lzpu6z8YeGfLIZhDmTANhWKQIfwGbgnOcTJmNRe+7ykKGz0P5qn+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RYrZtf1b;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F9606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999F9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RYrZtf1b
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso3139322f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795515981; x=1796120781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
        b=RYrZtf1blAhSLOe9QzFCStGYT7gGBy45WvSvwem3GGY+G55p3vjoPBCzIMbxTMZtW/
         OacLnbrxHzSqyX/QhvlPTWN3x7WhviOi6kkf1tvp5PXu8qiqnOvCPGoW0WzmtJIA2BIL
         Ra5AEV5VLWHRIFTHowkBgTr+PgnhYiw7KVvZ+vGHjvpPYozk4lXwCrPWpprhqU1yk0RO
         fZshjvq+lqh791ytCR8j9Y2hgGTS108bJafwrCJXF1GyBm2jON/qw3fK62Gj0ml4tIH/
         tKfvuYRGYZ7gII3s72pYuirE8FwliDW2Jt9m+D1kMWqm2V4NuEuBs8aCZ5OaUmaxPKZ7
         IgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515981; x=1796120781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
        b=qznKWQuekwSA2aeQtJWqGPNhpoBIYF4P0Sax9fAs/8xiOczimBi04lQdvlXkWmOD1a
         n2fW4kAcQYJZdHCLBKxUFnjuuTYJlR1bSOXBfbxYe7DSoeSRZeyGo+SEU9kRd9mkjiBi
         qrLDBOcu+yUd/gzbTsavO0iImaWBh5aLFgdwIthvx4yf5C8cZav4bIuq/aJLX7y8LblU
         nsK3WTZGgtDTL1caJcvECwCQETh0MgBWlbSHvTUALy6BA4b4tPhwJBYy5OyqMQceioRQ
         o94lbkhZivFQm68gFYy4B9TJSQk+oHUZ22gaVwd+6zd83HjO17e/74+ddnplnEUyIwcA
         MOew==
X-Forwarded-Encrypted: i=1; AL+hErGV7+clG3pqggHOx1sFtXsc0opqXA8o9kCwcxQd3WJ4+9+i43jq/Rk4RlOM+MXWailN0GkF7abRzQ9k@vger.kernel.org
X-Gm-Message-State: APuU4Z9BKXmfYeCJyjx/ixmgTpwJH6h3aYTp2EOZAn29TpVTavB/OSiB
	hlgLKCgh1ri+gc+LmNEBxNHlK9Ww4+0cioVQjgThjUoQpIUZNuZB7wUyvUwn+suWHfY=
X-Gm-Gg: AZFdTZcTclF5iopgS8PBFz/cTvdo7beCEVeEWd89DBgyQPy1GCUgG6eI+ZrUkOwEjFb
	/Cz38pGxUm5/sLHLYuvpqX3pXWxpF53qRCtOW77qfjp1dqAceVUD7KLdK/IolOJCQK4/8Jlq05G
	pBa6lHQk/yuFMP1KXMMssgJNqYrRmXtGQ/zJtkcXXrNjtZpdRDCjywmFPkiw5QUaYtPQZkWm2dM
	aSJbSLImGuYbc135bhxDZcH25C8g7hCEm+59iRydQbPNJ8ch/Cj942hcXbOnBukyaBXFi/hzt6P
	VcUPhDK9tTdj12XWOGdGLAYOqbyZ2IOSvxwv6/jc1c9iFOUR3zKpy06LinoFAsH3a9yZAskPr2f
	RUlUmHy5JniJI3kTJ/Wr2rgk0/m/EKouKLqOUSTYEvyAUN4pMbkC1CbwWdI05i3hZxsTLVXMZyp
	lSJkBg0nClzgPrwvZ5llBufgNGi3z1SBCdRfq/XBh9ZTPwvyvDc+Nk65xg9POAhjdcrP7DlVfI9
	yageBkCagW4mUmgCb5jhL3mVJr0PaBUmBAZy7EDpQEDkORl1JhzpndUal9dyScwLrFvSWKAexgL
	m5b1q/LAoJ0J+OXTTozm+HGXdyC++K//ErAvD6gw3AqRJO4jh2zhV6j3oJ9cHIrz/05lwCQDEgM
	j7A==
X-Received: by 2002:a05:6000:29d6:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-4abb58ec00dmr16232655f8f.48.1795515980993;
        Tue, 24 Nov 2026 02:26:20 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm27197538f8f.50.2026.11.24.02.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:26:20 -0800 (PST)
Message-ID: <13dfc467-1f95-4f86-9d01-8a5830007d51@baylibre.com>
Date: Tue, 24 Nov 2026 10:26:18 +0000
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
Subject: Re: [PATCH v18 6/8] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <c57db6883bb9c977f65d34569f1ed9cb5405bdda.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <c57db6883bb9c977f65d34569f1ed9cb5405bdda.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add the RK3576 NPU. Its PC_TASK_CON has a 16-bit task number, with
> pp_en, count_clear and last_layer_clear at BIT16, BIT17 and BIT18, as
> Chaoyi Chen confirmed:
> 
>   https://lore.kernel.org/all/4f300b78-d96d-4d98-8819-dc292b0c9b97@rock-chips.com/
> 
> Add it to rocket_registers.h as TASK_CON_RK3576, generated from Mesa's
> registers.xml, and use it on the RK3576. Count the cores in rocket_drv.c
> against the match table, not only the RK3588 compatible.

In the corresponding mesa change:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43804/diffs

You had to tweak the header generator to allow two register definitions
to exist at the same offset.

From what I can see, Mesa has another way of allowing hw-specific
variants of a given register: variants/varset used in freedreno register
definitions. Have you explored using that?

