Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E443AD52A
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639526; cv=none; b=BRYcvRDyZMEJmXEJbNj2EV/9yK7xIV7o7/1fifKib+KJv/i8z2/e1xuwFd6HcbLohuC8BqpS1YLfXg1uRwCh9CaTaPfqR9ASQQRDnWS1Jct6QI/Crsv2oJ9dh70EEVeJf0usBfu1X2rrQKd9Kw8We0aeTpAYx6daqPS9oHGX5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639526; c=relaxed/simple;
	bh=98u+otaZXpjYpQd+qKYB4xWsnDZgQw6B4jddi3kJfMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NhEvyhGngo/BGpd+BdP7+f3P7OdGFuF6pf8O7u4un86Cgr6WmKyDn1lqw3DQ3u0rZTao56l+pwf25zHBI7PgzAC6Ii+z7JRXv3ZECiuUUO9AI/s+umG8Hl9WhAWSWIjoOCvkDwPa2ED7NWc663pYAc5lZWCrahkm9NUGiTwnhZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRKOdyPf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRKOdyPf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso5646000f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639523; x=1776244323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=;
        b=VRKOdyPfNrRLOEhXTmNZ85G45fa32hQrMMfcMAw0C3el2bhbNgvXOg/6AbnDK9KxcF
         OwRQzKuIro5Er9KnU11VImT8s7h71TTL553dVAs8OblHPFzhenjQQC7tk4lPT5BUJ2f3
         T5xjN3lmcfC2+FmouDojc29tGEw+FcHoOdNzoJXPst9SV/loSHh/FPGEz1PaudRl3Xew
         8/UI7Eb3CfIzhvVWv7cviB0XVTU2SJr7NP6NS/e44zZn46nXswKYw4fsvmlyBZcq/JIz
         zOPMDjA8FAdMaaRqQzDvhgybD2iZ7Y1ax5mz6a4R17mCz+DDkw9+cFdncj65762rhlX2
         JHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639523; x=1776244323;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=;
        b=gRAkvYsdRVWXG3JW1V7zMLh7jgWA56I4O/YzXAimfe/312xrxUV0/TvGNMvvotJ9uU
         /6SItdg3LmvAV6IMHBwMI+1D380YFWGPGSNq3mjnZD9B6d2fZ1qQQ9XdNi3NpMXx9DbF
         zo6Uq3kZhxIdBVZ7qJtEJyPtA2Xw9DFm0MtAy8WIBLVSKRj9A3GIyK6kIFZ7IaT+Ww/9
         De4saxMSN1Ons+NO/OV4WBohNVdvlNRO7Ox7h7+vc1jMo7d+MedjP2i2j78TmaQ2CvAV
         UMh/u0brWyYcwdD47ZxydKGSVeplHI9ZHrBYwI5DRVtcajHYQhHklxRI7wQbOyhqtOD0
         el6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBUfEQUskfGbWVMwCK7oWvnX1t/g3VXy2CUv4HaiML+/DAW2BLSXfuYeuok0OGGEx1q5Qo44q0unL8@vger.kernel.org
X-Gm-Message-State: AOJu0YzolJZIym+84Is/bDKubnFJcQ6p28VWu6T4N66lqoyUxUdCECx0
	9dQVMkGvChmePgZBP3kplkKQzbmnidiAgUjwh5aG/Nh7M4KtOdwlYykugVsfY7zqVUQ=
X-Gm-Gg: AeBDievQyk7J5ZbSZ48OcDorCH5wrxPAvbBFL52WZuew4GvSQsGDj1VD+HmBXtwxW92
	SU9LvjGr0ta31EpfHEk4itdOuDh5wVr53QmAEHDflcmOUoNZqFs64FVp8u92eIUdnOd7ja2WKBZ
	dorCerOh6tvdQVtcSo20FfxkdBQkwwk3KLqZKPkgfdCgf9znTHVcYKiyjtR22cohV0lCypmwMJA
	i8crjFO6gqTUDxG9QmWJWOQrGb7PYGgWMjbSQecCwnbOXS4TLu0gZuonTqwn0lnajRouKH5UGuK
	i4vfxW9g6f4srt8xQuJ/6EMq45gBcENb7kodRJYQ+bB6CZKLuhq4pUgFAGlgRP9XnfO76dOTiSL
	tLTTpnvi0A/01SUZSEfgbdkPxJC6qxChXQj+oodFd4/YNHLbViywdOLtN27WREPURClCO5aEB4/
	WgxPdHbX1VioKTI6cxNu0MP7ioj58+WuozgR7bVLAehybA
X-Received: by 2002:a05:6000:24c9:b0:43d:6e2:5529 with SMTP id ffacd0b85a97d-43d2927bb78mr29330089f8f.11.1775639521962;
        Wed, 08 Apr 2026 02:12:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm53516671f8f.35.2026.04.08.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:12:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com
In-Reply-To: <20260330145111.115318-1-jerrysteve1101@gmail.com>
References: <20260330145111.115318-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt
 number
Message-Id: <177563952126.3423846.18101500975539971135.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:12:01 +0200
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

On Mon, 30 Mar 2026 22:51:11 +0800, Jun Yan wrote:
> Correct the interrupt number assigned to the Realtek PHY in the p230
> 
> following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
> fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
> interrupt improvements [1].
> 
> [1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumenstingl@googlemail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
      https://git.kernel.org/amlogic/c/b18d1b23558114b3c64fec7b515ca80c76e58171

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

