Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175938;
	b=b42+/wSoOc6LfJ4cSuX2D5QRFdWl9FjcdABQ0QD0oaYfdW65/oun4rJmEtBMvA7Lai0Z
	 iQusK8+e0vm8k2rmd9ZtlVdZAANLT7S9bjmr9KsSE62jd0xL52gP2F6+C3TICY9ummech
	 HfIkJZZ4V71bIGqWjRZwNZTg3QNQjDuSTFd5LdIKLnvzWSJsTpNe95P8YCmQYmeTZEJ9U
	 YKbe8x195rErqYeqhaBK4k1LPqJqM7fj3sOAyCUVL8C7g2GcOFVqFYbA9CbIhHYZz6Y8W
	 8itnWKL5eQyZbRvJRECsCvpyCGh4HI17E32dGvbMhlfPcYkmoghyEG5TiUbURBi+Kpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175938;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=05l+8JW812QvmCS5ASRMEsto/MViEuxLP3EanVEdMuk=;
	b=QWwRSJByP8mFe7OVF/hfIL6Uj6u54Hu6zpTuldFqTFeu0bwinisvz0aeLToHtl7ecJgF
	 ijhQcvVwQeoHtt2pCnmiNy0PteFHgX28QwFphaGJoFkSjBHRq38CRIllfKS9C22OLqC8/
	 QeEo9J/MARkupLokfLxekf3abc+CZd9mXnmpvA9BTuMXVuZUDJVG3eTEGtNXN6AnrnVeU
	 44X911tXt7Yms3hcCZICI5uZ2rnMBjDalCPNOrk4IkX4DzBHqJktIMDE5LI3mJTfDSZrg
	 ZdfnpRTctyX+C+nOmtan7dlUlXchc205fSSZqXj11sZ+RR0YUbNTV5inlzZ0bF+2w+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh5UxeZ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D58606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh5UxeZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065F61F031E4
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793175937;
	bh=05l+8JW812QvmCS5ASRMEsto/MViEuxLP3EanVEdMuk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jh5UxeZ1SiyWyhZKrGsTkAzISKGPgJzuHiQjD/CYuFRgCLjIUR4rvYsQlagvkehTX
	 AoImjCrz/jrmRZWqqkwlkiTTmHGQcA13o66ATdXUXGMGVTNEfHbPfINtsYDQIreQv7
	 8Hg//W1tQYaDp+WuBPFrbVuUdiajFX0zCTQBAxXIdK5fWL36Sxc4vn51ZYmUEmUPRK
	 fdosq++7MQwEk6lAW4ydudWaxq6flnmDG9jGJNoEDLgqtAKlvcMb2ZfRpFNzUCMu/u
	 o5zPzTmtXIj+LwG9ANVDcNHYa7166zyzBo6CBh34bjNehhTv2d8OyDxO5ObEJmrUxp
	 19bkzFKFiwQvg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso6544991fa.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:25:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6m6kdnI60sPph6l121T5hFO0z2nxJZtELngB20PR8KmQeUrqFNK/cgOVohAHDMMgy46pF8tsM7kHg@vger.kernel.org
X-Gm-Message-State: AFq9FYJRZ37uONNRsBu20SZlUjblG0x3I9rPMPL7XoD+COSGoTlm/Myi
	oAMBbhjppZu5RQI7RjQxvSajZJD713bPFT2pJPB2UX1wuspwrE9v6MSo0EPl71ahygQ/OXQPrm5
	uFSt2ojAz/iX4kXPPEF8e0/l7ss39RfVOS4PZ4RKg7g==
X-Received: by 2002:a05:651c:198e:b0:3a9:87c0:7737 with SMTP id
 38308e7fff4ca-3ac9cf81e73mr3153621fa.21.1793175935670; Wed, 28 Oct 2026
 01:25:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 01:25:34 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 01:25:34 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com> <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
Date: Wed, 28 Oct 2026 01:25:34 -0700
X-Gmail-Original-Message-ID: <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
X-Gm-Features: AclHuK_avRcSyuEchrSyhnDYEBcfCksI2Ibe_hZLUqTV6ryNiIHPJk3TgyKxUG0
Message-ID: <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 09:36:06 +0100, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
>> The embedded and gearvm variants of the ethernet MAC use different
>> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
>> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Do we run into any problem if lemans-gearvm.dtsi simply overwrites
> the compatible without this patch?
>

Technically no, but then lemans.dtsi is incorrect as the MAC compatible depends
on the firmware variant. I'd move it if you're already touching the files
anyway.

Bart
