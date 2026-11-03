Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699648;
	b=d8isXAnsthxeubomM44NF8lQ1gb65YBA2XJeUldhrRHCCOQ3s0lSx6BgWZv0izbx2YwO
	 cTIAJSH646rhvaU3IWnnaT1neXLCchQhbmP0QCRlu4QNNzmwVlIszu2GrAV0iTDazPYfR
	 UB0pRuX9A/2+cXbsgc+UuFg0oBPbcQGHwiYRdapz/qkUA/Fimn78jv+ml/14DEm0ADLRy
	 8ggD7XsmTGTlDPMNHAIGCZIBb76L+8URpHsPUFLvou1xYZ+DMZn7HUwKuFg7Rotd/RvHq
	 RVehewT2WpSqHzt6PFTZyOAKo/PwlcEXnfiGVuCL+a/JxKTy+ViNLxwAFRDv7/BZgSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
	b=ZSO21GR8qdGdRro/hFK3EdSgT1jkeDx9eC3H7sy3t3+bDPf5vTM83ydLpNcZ2USuOmHI
	 E4BIkZE/zyvpW73WZPBcLVu7y1JvIOP+D5pAk8w7hUPng3a/VDvVonC5G2HXHYPNiMQ0Q
	 28dz4HD6gB0xH1aHEO+mGgddAGo9aohcfEvaBDkzGoXlWIunCN+FOoLy46TlBwLzP3NVq
	 zXonDUNMg7IXeV1fD2Yo0GbRLNjv3xjnN2PeiV5yIFOQBqpHw1afp9rkasTB0ndtFiWZe
	 HFRraX9OOYWLn8ZTAsVnZRQUjtLTKwYjVE7C+WIIQidGTJCwhz6E2L/rtPFIYXujAjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V7754Six;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB96082BF0
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BB96082BF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V7754Six
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so20205825e9.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699646; x=1794304446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=V7754SixUCzWY/ur9GCxnDEK5yQzADgaoWUgg3pItG/CpNSHi4Op1t2Cad+mggu8iD
         +gygaZehZEM9vwjK7eaAK9S3ursV6KoYB7m/GKdIgvSCiB/CXTvVjLHiJZ/l5TA3fj/T
         ndQIegwdBHWlKsSP2+WJzo67ZIGbxIvoRDtJxmg7eQLgcMoyWdB0Oa0qaLgBpQ0gwgYQ
         t1zsQ9eGQi9WcH9oN29f9+b58bM88c6JZbNl3grp/QZrs29xJF2KH+q2/9gj2vlxnHJa
         coE5a6t3uivyp60Go4uWbK7OgTo8wEcWriTNd7SxcvedwjJ+UKhhG2tvwQCPbap3zRgX
         ek4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699646; x=1794304446;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=J1ChoQW8zgGapE+tLuTR+zw/vjfQRD2G0euVFkBIN0gIUMqAgS3apXw+aLfRfuLb8S
         QyDGo1QjE0C8ozVh46OoufU90pKikqhpZDo4v5JlCuF6inDNFv+uS8l0YPQuYXsDQjv+
         oOt9qPIqCEIudCYaNS/NNR8KolVAbj1cLgL48azDbQsR260LE8bVEvSlFkGpLaeoOGMl
         fXfgCgtQrMYSGlxfhnVE+nMvS2P/kKTmovfZL4KjxluAtGK61jiqpCUyO1rJAYd2bbw8
         NYlXUtT8tjjOhhKacNgQCchIsnckuQkQM+kH7AortvINJ124LI7qzRZO24BB3DEHT/gW
         BMyg==
X-Gm-Message-State: APuU4Z9HYK1TCV2jGpnn9owfHFWbikj5J2su2plPli8doUzvqcszPs3J
	PnLlhfv4jZmxZ6qv08tJKsQIjK9K160IYVMpVrp5JsvMjQM7v+Lh13Qm0HDCz5XnAi4=
X-Gm-Gg: AYBFou1CdUVbSMEU/c3Mx9ciVAH/E5h7NsH+zy/rTT52NbLG3XAHBRQMokLdOHkgZHy
	Fj5s4suIjjrVSJni3Potyb7ikup34s8zaD/hg2svt5+AjktGvNZH7mo25xyo0s0Kx0koTg3J/fJ
	tICMvMFTuxjbPFI+Pr0v5rXxiYuj9e26LNDip5R4PfJc2mHA2Fr47fYr+Z3MOyZXok0k6Lfzdcq
	4YYKuNRC7ydXQlW0vKkcx5e8e3bQ7Ff4vv5oB5XroPZ/MKd/69aRguEAjvkZptP0f2XqwHRwVWk
	lQMsFEK+9psS92Jzd+amXom/mOgyt3AiqCGDvo49EbSAN7bbxTIdcIhoTzV1qdwzVYW0LZEGrtb
	hcPLhzwPrk9oaqj+zFDf7Lwc45xjAKv42MxG6wOy1sgIrkIt6lc4RW/KO3WakoURakNwqlTs3Mn
	u/IoFC95089Dpz0ucXuwP5RkPfmXytegS8enHS5jrihFhc4lZHYXRuFjGd3UXFWGICW+N09xJfd
	cKHTCQ38nGFfLhnFxsNH7boYaPY2eQh36E3pZAL5XJughYQ8H24H1qcyYl4rGsWdzH4u4cblcr6
	/v4cN9B3Dhg6w8pzh54WkmHKJwh64djCf4n/soPBgWpFO7sw7dO0erApn32u3dpOIsr/BcOf
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr284036325e9.22.1793699645988;
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC
 address and LED properties
Message-Id: <179369964538.2330120.3831399405443215739.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:05 +0100
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

On Sun, 11 Oct 2026 21:31:39 +0300, Fil Dunsky wrote:
> Two small device-tree updates for the Hardkernel ODROID-C2, found while
> adding OpenWrt support for the board.
> 
> Patch 1 wires the eth_mac eFuse nvmem cell (already described in
> meson-gx.dtsi, but so far unused) to the Ethernet controller, narrowed
> to the 6 bytes of the address, so the kernel reads the factory MAC
> address itself instead of relying on the bootloader or a random
> fallback.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      https://git.kernel.org/amlogic/c/06c71037627974652c08ae107032d7459f1bb0c3
[2/2] arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED
      https://git.kernel.org/amlogic/c/94dfd6641686dca8d49439896efe678b47e05654

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

