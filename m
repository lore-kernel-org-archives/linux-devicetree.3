Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF65317557E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788740922; cv=none; b=fmeVtevTL6bV/V8PJy7qtAtyPSVD0TWMnkNlrc0/0uEOPtkcXBfaeGVUZovHBVqsPFMAbqmv246lmoKSp+wH/DIpAi/DhG2NpBIRhEgv2uaG/uXgbx4iYEnX4PQgp/8hmQIWDatP/DB6j8cbN7mvGSYUs/sdEADUJGwJoCXtLNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788740922; c=relaxed/simple;
	bh=BXf3BxKM1Ry24+Btv4DKMA3IKOzmPZEdfw4Dh5Jj9Ss=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=RIBD5xpus3hY1RBUbCZiz7jLNlRz+aNBj2T9sFWrozm2cN1irTGkW+KgzUy1PdXbtptNhysP1EbuPngDbi9ZqyMOUu+/i6hutps1NNbbku1YIoA8mBu3DganLKuHi2YGxgdJnS8OQ4G5wJGWKG8o1YsGQWNkGhQWXKMIpWxxDBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzpENCZH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzpENCZH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1948039f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 17:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788740919; x=1789345719; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MgZHADWpXS9kOhNwmKYW4eHLUxKCVK4/x85xToQp0Vk=;
        b=dzpENCZHJ5jw/OAKRJsO92TqW0KakA+mpqvWTQnbwjfqiBxgGxs9xU9g4XGYfvawxT
         ejnTFbFmvtswqmo+nNXCbb9vYNHY5FAqVaRAVqherd1mEIWGIDdwaKoMPfXR+/8DNR7L
         G+E+uxVYJ/fXAnUCfbye+kdnPG6kbjQl5txsa4sRv9bEll8x3aWzOwv0G45dkHg0YpCS
         JiuCi8vxa2sJ6MgeQeK5LonMXmm6K8pVSGoXlddWwKXhTwVFuPxq6gcGEgeqEhgtIuja
         0DgmwUTahtM7NOqOiRDoAsQZeKDvje+A5SuuqgA+N6VtoZKjrcRkZU4DM4DV2H930CD5
         wAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788740919; x=1789345719;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgZHADWpXS9kOhNwmKYW4eHLUxKCVK4/x85xToQp0Vk=;
        b=H1e5uxJOxa4o1lWY5SKc7JgXfrm9ipLxY7Dn/q1aNspQo1QjeF1hWnxvWJECdGQOpd
         1AcKUcYdzc/1SdhjdSmn36uzTlDJndel97XtqCVy7pWaAwRq+GL78WwATTOk9n1ngFni
         Kt/7jXAR4tT0gfZaT8NY0yOvqrq1c0X5WE9jIuyTeQZL/V4JE6X+24CNWqi78ntspaz0
         ju2fa/RRknLpRL3iRw1Mx4wWmj05sEX4k059VzamgH8+ymxAqT0CEslkhg63RewokgYc
         Np0zrjvhuLEMehrap9+DBulXBToNcsnFpmpRrWQaZDv3JYMOTbwZ0EdBbxrRxD53cdw4
         eoZw==
X-Forwarded-Encrypted: i=1; AKwUvBzia60eTGO/zbLsU1DCg42tPsfJP93Xyg0M/2SoFsqR1FQraRP3iRwGiyUVDqHEOmohDAwpXcGvk7n1@vger.kernel.org
X-Gm-Message-State: AFuF++n4u/FIPIkwymE81hG6D3f89ARkZgG6FbnR0noge667wYqgHCee
	bNop7CDoopR8OIE6FV5x9lswOdXaDnKjl41lMpzv8CJNs06KGFwZeDePoVfNRg5EfjJOiNTlVQN
	TqHvm
X-Gm-Gg: AYBFou1bdMTrWGGT4ZmXMrZW47O/TjFABLC0mErSeG3IaLgoiD2mliEdC2qPB/hO5ji
	rrNai/kqAXZBS9wlAszjkO8dW6hG85/IGjXM6gQ8Gi9HqDjmqo8vLfiuGM5yVsOKMhSi7XBIUu0
	1hGxG1ggKTADkK/DUxg4hOqMsc/Swz0E8dguiMm3w4prqGjZM0WfOHJLWQgoEuKEGZrropZGWub
	iScVypHvJg47v+K4dkpd5XzwJvA3Nl/B1HEwF5Ua/1UNR3P1Xoj89xXdIa1pcDS+KMqBVtO/wZ2
	COCOjp5vm+ku0m5TZEhAuROQjhmkORFmcCqToL1KBVOq3W9oBzMcb3j4F33t/cvrRcpeSVVL2k2
	ay1wICnLjWwj+Dur1py1CC7nD0jBNPSoH1yoW6G1nWbYJtUTf0q9LRFvaYpbrZf0w9nIomQ8Lry
	76UlivA7zNhTcQLinrFRepkwQUxQt6j6WRFJJkJ1tivpetvWTyHxXU1Fl1sSgYWyRk+2vsdrl4C
	4yu2s4iZ2Z3uq9O8hVDT9ANgFJ2oDkiNwbE6wHpw0ACPFDWnPRyFCMTxk8z
X-Received: by 2002:a05:6000:4710:b0:485:8a47:5b83 with SMTP id ffacd0b85a97d-4858a475c60mr16910358f8f.32.1788740918931;
        Sun, 06 Sep 2026 17:28:38 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bc74298sm21639306f8f.6.2026.09.06.17.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 17:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 01:28:36 +0100
Message-Id: <DL8NQGNAVSYK.18TYE03LPQSW5@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>, <semen.protsenko@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <peter.griffin@linaro.org>
Cc: <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <thomas_turner@talktalk.net>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to
 Exynos850
X-Mailer: aerc 0.21.0
References: <20260905170914.1640-1-tturner@lineageos.org>
 <20260905170914.1640-3-tturner@lineageos.org>
In-Reply-To: <20260905170914.1640-3-tturner@lineageos.org>

On Sat Sep 5, 2026 at 6:09 PM BST, Thomas Turner wrote:
> Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
> for temperature throttling, DVFS, power domains, governor support,

One of the sensors exposed via ACPM is "linked" to the GPU/G3D as far as
I know. The driver part was sent already and three sensors work there
(two cpu clusters and GPU).

I've never tested yet the DVFS of G3D via ACPM. Maybe it is worth a try
on A21s. But it should work the same way as clusters clocks.

> boosting and voltage control. Once PMIC is properly implemented, support
> will hopefully increase. However, the panfrost driver probes, the
> Mali-G52 GPU initializes and the core clock is set-up.
>
> Testing for this patch was done on a device not currently supported by
> linux, the Galaxy A21s. After enabling this node for that device
> locally, I was able to test and confirm basic GPU functionality. As of
> now, this patch has no users which have tested GPU capabilities and so
> the node has been set to "disabled".
>
> Here are some logs I pulled:
>
> panfrost 11500000.gpu: clock rate =3D 377000000
> panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,0000=
0400
> panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x=
00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
> panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> OpenGL core profile vendor: Mesa
> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL core profile shading language version: 1.40
> OpenGL compatibility profile vendor: Mesa
> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL compatibility profile shading language version: 1.40
> OpenGL ES profile vendor: Mesa
> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>

So, I've got A21s and installed pmOS to test all that.
My logs are slightly different but graphics is definitely alive:
[    0.200787] [drm] Initialized simpledrm 1.0.0 for fa000000.framebuffer o=
n minor 0
[    0.215130] Console: switching to colour frame buffer device 90x100
[    0.225540] simple-framebuffer fa000000.framebuffer: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    0.226134] panfrost 11500000.gpu: clock rate =3D 377000000
[    0.230960] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[    0.230981] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[    0.230991] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    0.231002] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[    0.232329] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[    0.232726] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 1

Also, when this is applied with status=3D"okay" on Winlink board then
panfrost itself seems to be alive and drm initialises despite missing
regulator as indicated in my other email in v2 of this series, hence:

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Thanks for working on this.
Best regareds,
Alexey
