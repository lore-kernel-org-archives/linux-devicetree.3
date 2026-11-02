Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626843;
	b=zQ+zaIKl9YnTF3jIGGCHIfj9ZoYQD2uHQp+1C/pAbejtnIt/2XIWjLE+5KoK0SHJMIEF
	 0CP3o/xfIl39YRXdtQGuyIZ6yyOzBdntOk8IG7vvPEQ+vJ1IMvlvXX5CScpshHeVwlwkl
	 2w+k9M7PFZXSem7EVtAL+XhNVUg1qXm64lRvLRT93XwWFT/ZE5o181/sqbHfyFX3vlmd3
	 PW8BzfAU8Y2PSZTjt8p49wBJUw1Xx4zoAScDwGv3ivWiGyOkDQQF7neA22aZSGpK6F+UY
	 nx4ngOK9qaXL2kRV0NA2hJ9G02W1pmlSjAW93LI62ke2DfUobc5oIo2f0UR8eks+qGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
	b=j11h+1swBCUlD1LdibapTfvM/TPilx3H/kK9hQjAitng6NTH9m8xupGFOzazkSci9Fgn
	 1GqbCOVXXr7c1jv9zYfPgtURBJqi6HYj7aZP4+XnqBkuLs7LbuLpvWJ2ZnPYXTgkxYmY/
	 +J93Cr0cNfneVjqlI2Fz/kxWyrL17bYqwjNwyEmlGYr+rLRt72FD3gQBc2ykKsziJKyAk
	 E2hR/5x5B5LPOwirV2n8N5OcweX0c8oddlsUwmC0SoVyRcXC667gFazzsUNJ2rxqg0ESo
	 vnaeZPGXhhJskd273TC0lIEaAd1llH0S/D23RUgH/ylGHlhUwX1v7lugeVhFFWqsaRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=miet7gjH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B51260A263C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B51260A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=miet7gjH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19896175e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626841; x=1794231641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
        b=miet7gjHfQ71wOjG0yXT7GDSHAxbEnMOQ8j2w0bbLCadjcGJ2ZOOe8OmsHrQpLsveU
         nCg6HO2+QCmV+ZcdVPpOkSElgsHmj3w9yZC/r4C3UKRrURfQa19eb0uPDDGHDZqh52Et
         0O7mTJ5wsWn27di+rb+YRcRGzyNUKXSAA6Z4wKnhgMPdn1q8d8UQTzCnR9KkWRZtZpy2
         ejadV4qBK1Nk9BoBmPEEiBiS029T0zxrd2TVduEBzmDrTBlo6lSaHEuDPgrACuXhoUM2
         wbOFRB0t3HELHsWTv+ywLuidc+Gc81+Xy1EXw4ErvzHBOmM0EfULpYt0VezwV42d6Ft2
         Hn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626841; x=1794231641;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
        b=Mty1uakiU+tEzbPqpLU+IG1e5SNlj9Bvg7mrg5T8gMhUMJVQLJTJUIua/VAg3Izl0D
         aLUdvk+w+fb8H0aVdUCoQvfHOPj82cvgsMuUlwprmvVjh+lLROtEZB7g0TI92eyh0LWw
         cctKIMssOIlIaMLy1G/7zlGjfC5VM9+d7nA3I6r7BBOX48BGk/z+YHcCN0aMyJwJh23X
         OwWEWOjhFrNESE/1m2rHyBAFoR80Oj57biqfbGWaejOj65J5+07BTbGRPBIgqIzOfQ1x
         igZ7qLkjY/8kPPIqtTiwctWtGYQ6olEaWOlTfPSAUVgzrUxjMFwT1y9A7HQJyMjcgFSD
         bCiw==
X-Forwarded-Encrypted: i=1; AKwUvByuLendoO6LEX9KTN8vkj1mrzQtlGNehQfIpgbgt2/W1l6OVxVAgSo/RIgMEvtz5q0JR4YzKPXiBuDF@vger.kernel.org
X-Gm-Message-State: AFq9FYLHni7aDyi5BtYlEEk34Ti4O9Ws3xNm5zksvcqTh6cJu/jIXbIG
	tHndCEzfI/Wwx91qgzxvUI1ADFQJiUjFOP0s6gh3VM/cUkYRSZRCCIotpz7GjlrX458=
X-Gm-Gg: AYBFou0lkD83k91T6D3IUWr8dTHOp7cF+zKmnminQpdFSO2BVWnNuACvSxl0BiQkF+m
	ErGAEhCmhf/OvlKeFfLouv54zOg5rMPCbOK1YrY1AcGGYOma332d3CZQPDWTsgpwvmkgBASAcDJ
	IVjyeFzuCMhSTHoz9WrcN3LFmmfRa8U3aLc4/EXc4Vni2/VQb/UH+QijsGuJaVzjH6xv0yPo8jL
	sldQih9tqKGD+zunVPQE/vR6fs5vmherifbL4GgY8GrbQgEDunz5mQIQLXYld+nG00H0F2JFlWR
	pZeLwO0IH8fbMID8C5whQvjDERTUI0x5+36FkWlY8DGngjKfSrHWYK8t3VhD2Mrh3/k2QnCi1s4
	YvkfB7mpSp1D9n2vLciX2gnoG0nFNQuH0NNpLC44jRXpeRlqIJMT1Jy5IVUMvBbO0miyjV1l72+
	x4QypC9sOCMms4sQtgoImNPNraq0qqFZkdQ7R2tzhQ0ZkpbhTTtUcksxZ8zV1SXAY7eesnbuCi+
	5xb3cXmOJuvTCqUPpG8yRCTIhlIjJdVNWvvokEsZWbC4afr7Sx0k+mEf7iEVcfslsx3AtPTxEwV
	20uRGG+lUF0HUz2RbdssVAkCci5kdCkPzcupnIG0wUlhPmci0Q==
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr231192185e9.30.1793626841264;
        Mon, 02 Nov 2026 05:40:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 Aboothahir U <aboothahirpkd@gmail.com>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
Subject: Re: [PATCH v3 0/9] drm/panel: novatek-nt36672a: Extend with 5 new
 panels
Message-Id: <179362684012.3310106.12925421623133714405.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:40 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Sun, 11 Oct 2026 14:54:01 +0300, Alexey Minnekhanov wrote:
> These series make the driver for novatek-nt36672-based panels more
> easily extensible and add support for 5 new panels to it, used in
> 4 different smartphones, all based on NT36672A:
> 
>  * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
>   exact model string is unknown
>  * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
>  * Tianma TL063FVMC43-02 for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
>  * Tianma TL060FVXS16-00 for Xiaomi Mi A2 smartphone (xiaomi-jasmine)
>  * TXD TXDI600YANPA-43V3 Asus Zenfone Max Pro M1 (asus-x00td).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD Technology Co., Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f6142a00d86df12120562c27e82c73cc6d30862
[2/9] dt-bindings: vendor-prefixes: Add Shen Chao Optoelectronics
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b55dbe9011975146527b8d371f5cd9a36f03a446
[3/9] dt-bindings: display: novatek,nt36672a: Add 5 new panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1123a125fbdff4e220be9d7e1613ddac2a32f4c0
[4/9] drm/panel: novatek-nt36672a: Set driver name to novatek for consistency
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/109516c683991707a4880ed26680c45f0ce4cce7
[5/9] drm/panel: novatek-nt36672a: Combine two init callbacks into one
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a834378028bf53a7bba729681afdd350a1169a2
[6/9] drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df9c727a0895f3f27d8cf8f577a32f5d4620bb63
[7/9] drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c13368a4f3f9206034ad89dc979935b0226c48db
[8/9] drm/panel: novatek-nt36672a: Add panel for Asus Zenfone Max Pro M1
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b6b23fa0fa46140c56cbd3886f4c4065b6fec761
[9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer for NT36672A panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46c59e358a47afe5f3de9df39d37f588c5f6dab9

-- 
Neil

