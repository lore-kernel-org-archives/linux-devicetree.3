Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C863B7B9E
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516003; cv=none; b=eqUU2htn0jFLtZtpXUkPn3A36w8ZtTvLN70czi/13ciSQZmVWeijkmaxWmX4qy1edysLU6PuO+knPO2HPVJ09nZiFcDnchNjX6vt7SAYR+0LgdIOOsbnj6KmotfXfv4UzH4hSqNm7K1OK/XoQnuUZlUQQcuaWvx7OZJSbKqatCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516003; c=relaxed/simple;
	bh=Bb99gFatmbb7L/aZ6nbf82iewUvBeukK3Dhty6PRoEQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QgObQLwWCx8Ud2ygDEDG8bI+Uqrz7+0kcWdAqsabS0u2wHrO5UlN09w0DlDDWyVpUNQZDhq+1NxlY45wYlvcDVizKpvTuy5OigKTTWA43SArOxGpWkaFuVAgpEjvc+fOQpfzNj1Zq5Kz/jvX1FLALAln28jGu1qWMM91E/i0ZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9qcl6aY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9qcl6aY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso6284955e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515998; x=1775120798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=;
        b=D9qcl6aYvcLVM1yuihhwYcXVbO9YNy8tNPCcKpFucLNUinoN95SKuLwMsu9gQgvxvo
         9fM5HlzMG7d7BmVU/mkgNNe0MOEcqv0LhuQ7uBJNIlAzgZvsyRq3OKUOykSgl9zAEwDF
         aOWOnaJOjAoa292vvIbWap+0/1PCMzD8ExX4nZs/usX0u2CtC9JCMjR8CYlzgWet3Pyo
         FNErDqWdTnt2KGv8mR9/RDHL5r2uDhVBHfhKRY+S2jkAogcBRTRgeoi8jQIrWXNCpAcG
         rltC5uv82XcuWS9pgNDPTomdfE6kUTYPEvETn9/ikOj1PdUb/1BySkWruOZ31SEnv7ce
         VucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515998; x=1775120798;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=;
        b=YWjWrHz76vIAmhRlhB+SG+lzGB/L4U+3WNMiq4Z4+RZLkYQa73v2bGIJpIVggswvr/
         2KK/TGN1D9HMMZBTEqpqtrCQnzUFXk3z0oS8O3G3OMGiLZsn/eHvaCpSvxy++J/0uDcg
         Y3nxsa9Dqwm0d5hTbks1D83dDTCpI07lPbK4LSwvaKZRaHvmyb1KYqFXAUoKTJp2ukwY
         hS0OmxCEZvkWI+hNjmYpbs7pDWBl8d/alHEVVqHdEhn5JA5pKboq+EMy9ZTpSyN1GYxj
         xFLJzubAstZbSZwQMuehixV5wxB66Vja8d80SV2Sk0OXC86RsS1H94OVg2OxSeF4kQ3D
         hPJw==
X-Forwarded-Encrypted: i=1; AJvYcCUA4fZDOHnaCAMpg3PVrT6zcwEWKhyCHRC0Q5GkZiKZ2IPmg3nUdVX5TnJKB06/1+DVAs1LkUUBjbQv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi98DyRWTxJY80TIouYRbVjXgRsU4RAaTH04v6MExao+WbgRml
	YkZx+UB1aK2tjBxnHV3FRPnakTeu32C/TppP4tkMBHRKJLQYKNIw9Hovq0c8/MWPVtI=
X-Gm-Gg: ATEYQzzlhESG/ReedLPloeyWvtj9ddttXWp1SV2AL0N7cRt55cmDZPkhnGKTe2vgKvO
	LwimVGChN3RTBvYFDjzqwaZx8AiCI70FU8mnrdpgx9DhZMQZINVpmiSsbbCiqNpsUbwPEzYS/Vf
	o3QPIPOPeaIobAhkb3MmTBcglFukbPK7jwsJ5Uk34JG64yNAgmMx1W3pF1y+NszU81goW/Cuv/H
	VppK11STaQjr8ETbdOJ3QlofoDCXp4cU2gSo90i9yIsfLzOgvKBV6+NiCJlTSe0/ImUoJ9jY7jk
	voRzTCaB5Pegt0IpkNpHTofXOJMD+3AmSch0J4Jkql2b55cuxALGpyTCjw2D3YXdLjz8AWKUXJj
	FBrmwMlnCiF5ZVrD3csZTTIo7sOYJellEx2gIDHO9k2e4aHZ0D8t4l89wyi5AiFSsBGRWquTtoJ
	OBZIRIpsmkkRixunRcILR7i+++9Ul/JfJSqvGHGCaQ+9dM
X-Received: by 2002:a05:600c:154b:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-487243fdc55mr572145e9.6.1774515997897;
        Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20260219103548.18392-1-linux.amoon@gmail.com>
References: <20260219103548.18392-1-linux.amoon@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-axg: Add missing cache
 information to cpu0
Message-Id: <177451599694.122020.11374125029762505205.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:36 +0100
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

On Thu, 19 Feb 2026 16:05:46 +0530, Anand Moon wrote:
> Add missing L1 data and instruction cache parameters to the CPU node 0
> for the Cortex-A53 caches on the Meson AXG SoC.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0
      https://git.kernel.org/amlogic/c/e28f4b18c134f944b0ae93ebf1bacc8e517fdcf5

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

