Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486343;
	b=4GcmDqraK5+nq88X0WPDV+JkzB8r2DvEA+39os6vXF2iTCrYxFyJSaQLFfUxMaUpIFSU
	 3SnashGTy1Mm/cMLhe+J1ba8FlnjjnMmQ+lz31ssj5I9Gug3YCGxM0aqQJutXTYHvG1Dq
	 cu3/xPOA2BHMh46BDVd/yx99Fu7dCeJH45PkdLwTECYJWhgSIVkzx2e2pSahYlfjHPkF8
	 +anCjcCwVmwZNgckHqS3iUdLYz4ETDFwOgHAjMsH6DTOud3OI1gj6YEcCqNOaB+zuWi0z
	 68+lNCsAe9A4x7Qcir+a13qD4P4BXONpl7paZv2N2PDzVfa6+HGNeqyW38Drp+NpSfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
	b=JlSk6fLdoinF/VUH8bD2KLxY68267d/tRB7DpAwJTfh3a54TptBF+zLEdF+WNpcFTFKZ
	 qn2ImS6XVrSlugOkIkcE0vjGwPakgQczX/XCRv2KIucMIa5sRnyEnGPr6PUNAX4UhLTEU
	 0NkIW+hU5rHrYSYLKNp+zv0+zwt636ZbPqVo7ja+fqlVxOcFAivhAfuaVd7EHtv/A0gWa
	 fLQ7VSWI81zCCquMIAHySoP0RH35QiCpV5eyu3bkQjiglNqcIqxNna12AdDS7HrmAe4bt
	 zjxxRPxVORZHezt+gsPrHlMxg4aao8JqH1Ch80e+sHoGjDNcVdMNJjU1ycXrNmliFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkYlWrnT;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031D606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3031D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkYlWrnT
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso777414a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486341; x=1796091141; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=WkYlWrnTqUdrWZZm1tK0o8QHAcJHKyc3XhplDP+3YX6tsrRhC0AYQcy4LTqT8tdoa9
         zj1O+B6mDS5A5xDFsf8Pkyh3hwyhSnYcHNqJMXLEhBDTTwOvTETI5S1b3+Rm5vi7Mcgy
         u42trG+PMkhfMsBT3ZMcC8gi23DZi2bzCk8IvpyzIbJmCQeY/hKyOsh96b/i2kleGL9M
         2UuvDDrXlDll0k3f2+m4a2uauQCe1pCsI+caGf3kRmjlxbfQk75Kr8XEK79c+XbG0Zwr
         XEr20HVO6BfOmhCjVPgMY7VNMyu9YagOmsLU3w9tu03Hegxbo8SHaR2gCOWaGLyOIsar
         5Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486341; x=1796091141;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=lPF95H2IIwRUsmHBvl7MzD0yey5vnMO9t/kh/ELLF+dQ+GgUcj0KIkInxlD/WHstD/
         gwL0ilIWKj0qy5c5aN5K5M9EYsy78ydUowwdIhyv5HXWkxrB0pNNCkXLvocMth4Uy6yL
         7D9DZEeLhmVgfQJ6s3lGZ9vpsNk+4PXJ0A20vVADJ799Os58eSb063Gi1Zm335hfNSSf
         Eip88chKyM8zR0L6EEA9Nnj/rauNuEIgKOysdh6ONv6ow/6VcZPZZDHCYpS5pUA+eHhI
         X1/urs2W+gQndGLTjPnXTTRtnf8XnCRCgwiH2t47Qf9yvusnIZzky8TzliS172X7hGW0
         PbQA==
X-Forwarded-Encrypted: i=1; AL+hErEvyz4qcAzEzNGISdY6nCjtVkOFmkdjmAVu5AO5zrf0IR0+RfKWP/6rKs3nW/EjgRpuFmtgi+ICy+DX@vger.kernel.org
X-Gm-Message-State: APuU4Z8h+AYbue43geGjNeA4E1nnDNi8iky993ucr3aDdn82IhojExbt
	xaIRBXiEY/2YKZxgfw+2+GvUoKSCqAHMtNnO+0oF9ppbTeSovPcURbha
X-Gm-Gg: AZFdTZf3pGDjPNUmLWpGd7i5+flIwZVolM8t9gi0UHkFHolHxPUxer576iniCFBykOS
	e4pT3/QzhAqbAL64ocezAF+ky88421xDZUmsuOjQvflk10D+eDMTKwLlJUM4tQb2cT3bf+7m9fk
	/un7ZPON9MiFW+0XDqXtfa4z72YMOqDwJITr1D9YGhasZn7rWFkU+WZAvl9QDzUh7XQhh9nbbZs
	lFD7G0gubArL+qjBnjdECaSfsQyKYsH6emWcChU1l7rl8c37tL8UUVLu3UqolOvWNTMoNENKf/x
	UXISGvxBrHlq3tBrSsG8OZN1nbY7w8sqTlMAgQ43KPuAtdMzW0Jafls4PbDN/LWgW8hX0rNpThI
	cQDBl4SMS2OwACItB52B12E7q1g/aS9+XxlFHVBchl019PdDDI5z7kx5HPBp3pi5GnmmNwWdhof
	pBsJ7HDih5vv2uLMPPbvy7/VJmq7PvXvWvJBZHuI3uHhns/+tSESZuH5Aq1dAvW1zs+uBLd4AmE
	Ju+2ga5TYdnbgFRtsQ4QDK4i0Pp1UJkLSWijXsVviPVLcAsHDb69NUtNDRx/ZbZxsUBRAvKZqN7
	AgXIJ8mZSWSvh83NlmhgrEKYGu8dlu3ODwUsF+WxF3LWfEDeHxD0DFOQzw==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr12780728a91.37.1795486341377;
        Mon, 23 Nov 2026 18:12:21 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm9869004a91.9.2026.11.23.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:12:19 -0800 (PST)
Date: Tue, 24 Nov 2026 10:12:15 +0800
Message-ID: <3b4d214b53b64cd7941260875bbc88d7.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Ze Huang <ze.huang@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ze,

On Mon, 23 Nov 2026 22:59:10 +0800, Ze Huang wrote:
> Thanks for v3. I tested the series based on v7.4-rc1 on the K3 Pico-ITX
> with an external DisplayPort monitor.
>
> Modesetting and page flipping with modetest work at 1920x1080@144Hz,
> and kmscube renders correctly using Mesa softpipe.
>
> Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Thanks for testing v3.

Cody
