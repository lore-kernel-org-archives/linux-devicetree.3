Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776981;
	b=GcBsddTTPUh10wjD/qp9/W3dke62+UAB3HECBaX9U2r1dOloJSjI6U20/aydTG29ddRR
	 DhpCFV7tbb0y8pJizWhgoLYDPsa5BSy/t9Mgc+5rkh5mpv1Gg8YzUyQ4StL+4W7MvsIi/
	 phGqWIIgkcMhLwRgSJ1HoMgYYoyIClMvwCMo5RNzYF49jch33kq/zBJLssEMxIsn423RS
	 5hc7JMAcpsWsM0F9Z8+rsg0/HgRMlZv2VE9uJKcQ4o9MoeJWOOe/s5maFTwjpNHzT+lyD
	 dQULX31B4sVuZBHJghFDNHN1n+ekD8h//WKlprhaS2v8faH+B2HLpJNsNRYGretGX+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
	b=I9noiV40RD5XfoCyCLv4IKsRVMRe3BW1uNtsLw56188XEoLjCZRlzxcGIeJPrf2suYT8
	 1drzH3nmAMEAmPlBtKhPaDFY1WIGF0TKolqRbWe/Jx7ey072PmLJB6HBjtlXGr6kD4g9N
	 OSp+X+EYvkC2gkkaznC7pa24hJiJ7N71wFDzt858v1nAUS47nuU5ytANJZeRWyHBNnwia
	 BSz0mYiG2BPdDzt5+9n/ommgSzO4seDPL2sfREA7YGsnJlqOtyUVgv+oduiNmb8SEd69v
	 6rAFJkr/po57m3mxzxbX6A+43BnwLRg8u/vJ6egO88+v0gYu8/i30lx5qG6zVb8Kjcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rPwbjHBH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96977606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96977606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rPwbjHBH
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so2156061a12.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776979; cv=none;
        d=google.com; s=arc-20260327;
        b=lzdsuJ/HqvRL5j/jaNe9hmLxsR0UY6Y7Vln+9IBwOMLjGRUcloBYwYrJnKfaoVRBER
         j7wNRcEpU6Y72k19gRUc/N9si1d1orhPSguUUCV3Q+j9cPGXX9DVR1v0VbC6WqI8Zrl1
         uRaZw2gJ+Bd8syrAKUj2pAAcDkEn6G0vprqIuNAWGpKIpt++uGjkpZBfOqFVkyD6XdRl
         22T1m8wgHf2+DcRjk5/rvog2eYGugiyR143Lu9phqg+SYxon7L5CGZsZ0RlkbPHYf+SD
         Nk21Zdc6CEfgHaYb3LnQwEUKYq+QXL2bX2RSuTUNSNlBbOebWuaM9mTmmWLLh93GcFcW
         zaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        fh=Wfjc61K6DeHKLDzErpFFQmZqLZYKREAJR4OgnD0FGkM=;
        b=jkM6GICw0e2bDQSWdOND/7Ub2J6cM8EUiVbsYlYqy1Q/Q+LBpcFPC3r9OsMZqQUQzd
         JQzLNVCPOnez4KPw/52KfVNHAg7Rs0WJbZvd7STWBu5rDMxuiCBdW0O6Q3dNLn82IH+s
         3vh0taF596Jre1NISbS3jWJINsTs3b4AifVyGMf3ZVSc8FWApvGtzlWOfjft3+G5y743
         zow5EdljEuTQezyq+gdJFgOy45juAcvW7YZ//s3BDLrYgDI2h0AFCEUOW7VRTpzbIjEl
         TFZHSnsGixW5866yLu/EQ6By2kUhIvulQDBGKCwPOfujAym0RoNWZ4u24MStG2nhraAJ
         4rPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792776979; x=1793381779; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=rPwbjHBH0HP2C0bMtsJOmjM0xJz8dkGbOzrImfDEBhvfVvxo4oi6BTMnynTl86WfVe
         tHFnQYjVPDO4cImnkMGI8H78rv2mxoUYrxiM7dl4wpJ6WB5b65ANTRBK3GKGQB4nX4MI
         6R0taHSx2qctLB2pSGrqvuEql5Mt/6hqC1e7kM5F5FQQaa6YHw2Y9MrPv//VzZwYAMb+
         VBTblEd+sl9M6yiKhbMZ8A7074jPOb1xuPMdEjJjNXWjBCAXU0mgobhdd4+R9EsGvJDt
         UnGGeuuIXWdUvG9FQeUILhQmVp9Za3k50Tlg5KNCzw4tJUCKz4HNf/Fh0S4At6GhClIe
         ztBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776979; x=1793381779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=nrkUBAUQX6i24dfK1klJYyhi3OVMLZmUSbahCuQPS01d0Ayn+YUc5WwoQkExsOruX3
         uUYg3J8KuINuZvYvs7Vp5Uzx3NygiuX6zV69jfLNEnMxA4xXklZ4GnJBY1tuynrNFN3Y
         8dTDWq9bwzpLdFLiimU0O7rAAoThWZS3H90pgOlh8fppvtmCYYfAYePk63bWnk51WwYb
         /vHA8PHUtUZnSQBWkpPFz0VASuqIAz0jTgZblENKUhT2mLwo0kGBpdpxQ48DFqvgP8OG
         7UpzybBcAw280IeyKIIo30M41zHe5D0GkdBVUA8gcNKDcxaK29lTZQg+YCcnpqHzkNtj
         N5/g==
X-Forwarded-Encrypted: i=1; AKwUvBzdgZlrNMfMLJNZXzA3q9c+z/ylum9FwRIsJI1rwCmSj4XFaXjwROYZoe2gCxxuYo7kepxnKEQzB7rY@vger.kernel.org
X-Gm-Message-State: AFq9FYJKIQ6Z5jsUIR3VJywh05T/K37kSrkWkoZ9kvT5aM4gn05RaXDb
	SZdgBOJIEOZMPxjekYwv7vjeWqpCme9Icp6ZCt/QkvbSFvP+OUqq0cp7gBwGWmePH0B9dxp1DtF
	HIqTFVRiLUuXtvow2AFoGBh3QRMdhLiqd9t4te/Hzzg==
X-Gm-Gg: AYBFou1r5So2oPg8Iyh0JympnDahaLsvwo30nUQst/7VysTpgi1xgIOievHlm+gG5ek
	BYlRCzbvD/6ScCkOzDfX7aWbnPQr0ummenzWldD3lFFYDKCuNs6hNfr0PLPUHzqMaH0inx0Zuz7
	0Wx1PxwPQiH3SHywiw9PGXvax+H9aSsb9rWicj+r/rslpsfMCMcKWSFv4sAmuCk7ld7Ut70oO28
	kI6r02/GkQHhS24bfGnH7sxQJ6bfayLEdsblZ8/EcmQU657ucESxpWBXJcfE0ogzcQYvwOAZLf/
	CZEKmGSKa5u9iOyJMm/CB3pTT7j9sB4/ZhEawkexhw+vtxxOk3sq95z40NAetEZSk4V9rLL3DtN
	86Q1Ncp17uNF7p33SKOSrz7Sjt1QDTZ7dQ9OiXfvBavP/a9+GBhRg7jgPZfoqUVpVPrKfn3E=
X-Received: by 2002:a17:906:f595:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c46a8fd5c3amr423797666b.14.1792776978822; Fri, 23 Oct 2026
 10:36:18 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 23 Oct 2026 11:36:06 -0600
X-Gm-Features: AclHuK9m_F_bGO076TSrsT-kULx7SuWcQOcLAgoXUR-ZcTiSb4Ix0VHIuC5OZJE
Message-ID: <CANLsYkwTaeuoKWvCuK-4ctLa9n+7xCJe_yo_E9mDZL8ddY83DQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Francesco Valla <francesco@valla.it>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 13:05, <Frank.Li@oss.nxp.com> wrote:
>
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
>
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {       ret  = <0x90000000>;
>         no-map;
> }
>
> m4 {
>         ...
>         memory-region = <&rsc_table>;
> }
>
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
>
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
>
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
>
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
>
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
>
> ---
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
>

You have ignored my comment from [PATCH v7 0/3] so I'm ignoring your patchset.

> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
>
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
>
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
>
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
