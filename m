Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085423B9D9A
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515782; cv=none; b=a9liXnPYq0pUBYGgVrr4RLuU3Cc7WfNlDgdiwM7Px1ClZtviOb9KVlX5pdJ0zmo+S4gWxckmE6kruXGCx/K4hl362QR4/lpfYN6boj8YER3oKGCRCQ0HRv2zF18gEno/vK1pQAjA/AyPw+Hu1J05PZw+tY6jvUEE9bWqwI69eLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515782; c=relaxed/simple;
	bh=lm1k8et7Yv8mQrSDauzS0HhW87V0qbQsppOUSVqQiYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JansVSeYdL1y1yG0hxl28u706k9crHAHG4v3BEXmrF9CrGEeIYxBb//DRG62pjU6R5aPS2dJPgavwefHm2Gnuz4ZfMvoscZKjYd2I2l9MeFyIslIcNpcxHCAGuVeUJ35g/WsW8pdx4l6gW12MChec3OaB7XO5gwSez01QOLZM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OCx91vxC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OCx91vxC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b41b545d9so681205f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515779; x=1775120579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=;
        b=OCx91vxCK8bHs5H5K1efL00h8yVqYrpt5MZfF3OFmVd52DTX4maQLGRPGw3OgcpBkC
         kJRnK6OYmhzbRc2DQtXK0TH2PSd+/Y1FCLCy+uJuo8+jjM0YYZStNRowF2dyypkLwD2P
         MOtix3ExoQHhQQUqn7Le+gy9sYE0MSSS4mCqBrcU+0+rFn4NbPK/ktOv8mjR/LGzflfx
         nRxnkPoQkzT2W4YuUZiMz9n4/LFt35tgXn4dB9eKVRjDfNKf8n2j8zPWs51Oh4b7n2cW
         NeFAe02doaPAxGC1TaUUYGoKqxpBmEAEMNWQtxFUDCtzKmk0d0tcG3fugDaW5raTBE4N
         bDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515779; x=1775120579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=;
        b=RXXhAkrNob6fJhz1851kxXH+kTieiyIAi0GN3k7LRr3Zx3z5WMVR9rQ3Y9shzm/KC0
         OKIeXWaAejIibN24VAzDjhlry4GLnHhZ98jEYhf1Z9H1pWINAZbSuodOdKWb1xwiK/0R
         VkrDaI0HOlLOrWXMdBukR6jqBGeJs/MBtodiT2LS/hT1uTKhrtyVQuvrWjYGfO1/tZRv
         K0iLXBosbRNq5uv1Huynj/Xaiz0BYeaeRlt9a64qMRQMwScRYj5eOWTUcSF8EEDeUzt6
         IieY6zS3K/bHfbSdKgcvj+IrRbpicFuRGW5sgHEqEzuez+dD428av+lTzxp3mhk38oWK
         hwJg==
X-Forwarded-Encrypted: i=1; AJvYcCV9LnapbOi8RQKCbFgFV7LMcEVLtvppzNzYX3Mdp4m11zBVh3bJKr/i1IJ8PJkVE0PJkpSfzkLhtJT8@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7RqmonrxtLW11LB4yqjA3/5Ths4JzSxH1qGRUMEyXKmOauCJ
	OLy+IA+TcgE7Bu8G0ldmIAI8YfVKHESF7we9cREF882O7yBqNbtjZ/2RD0x3LKk8vUQ=
X-Gm-Gg: ATEYQzzmRNluGJ4cl4AtDcOIr8d6IimvEIOUJA7x0DkjrHGf6P/N+eQxW8k8zGOoLCk
	CYg/8UL/SIid4a6uyHFPHfnhTMz3SfuvPCj1R/4DCgSggXsU0MUOoCS3IDtMkZODCJfTdBysIbE
	XIcaSI1ZWBvruVYLablQRcTRgXLNvNX7WwdidJxUptPHE+taMCLdeedLhekASE6W8bUc2lwO96O
	Vo5xrbfUncyG9lxmDf7yksAmMynbz4RBIy47Bd+ff+Mig8wRcnZCQRvJJBquCxhGpTULW+7wXa3
	kGNTO0zirHLs5Vzr+IYPqcntx1zWdHIVnZ4n3GjAhAMaSbToAjSeLE/2f+3HDOVmAktorbmKZcb
	vkiNrNSJulrw0fb7M8TczDZAD/ET2xpPx8hQ7ztHtSfbeg9t3ukwCzJHznFJ2MWrv7HOnbcll8G
	BDd8GbMXzJLOMRoBXFZIuGBId2KGYiWqiDSAL/aE+mucGY1TY+KzI/f04=
X-Received: by 2002:a05:600c:1d02:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-4871605076fmr107817825e9.17.1774515779244;
        Thu, 26 Mar 2026 02:02:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722ca344dsm14612305e9.12.2026.03.26.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <20260319023446.3422695-1-nick@khadas.com>
References: <20260319023446.3422695-1-nick@khadas.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: fix memory
 layout for 8GB RAM
Message-Id: <177451577850.104526.16114207536960435176.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:58 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Thu, 19 Mar 2026 10:34:46 +0800, Nick Xie wrote:
> The Khadas VIM4 features 8GB of LPDDR4X RAM. The previous memory node
> mapped a single incorrect region. This caused the kernel to map MMIO
> and secure firmware (ATF/TrustZone) memory holes as standard RAM,
> leading to an Asynchronous SError Interrupt during early boot
> (paging_init) when the kernel attempted to clear those pages.
> 
> Fix this by splitting the 8GB memory layout into three separate
> regions to properly avoid the memory holes (e.g., 0xe0000000 -
> 0xffffffff):
> - 3.5GB @ 0x000000000
> - 3.5GB @ 0x100000000
> - 1.0GB @ 0x200000000
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
      https://git.kernel.org/amlogic/c/4b3917cd8492d72e576b837f78c0c398bda4ec27

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

