Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864139;
	b=WKXXtuuN/rr7nfhtkxqJNylwNNiGEcbXz+YhSgbywBXp1J9uK4cCftM1Ypy906rncfOZ
	 cXKp30po3zd8jQpoXqZbZ2A8N1ItCbZelQnIXu4Lh3GC4JLkJLGmxMdT6kO0JTpnc2eIv
	 Wf820Fuavgjbb8IAiid17GBjVKSN9BQHKtEckkVQueflK+9nz5c754at27IZtpi6le4mw
	 ryhbYNhwRhbc/zK2bNTc5SJsnXqdD+SYgV+VPx4cKMFUzVrnUiEC/tzM2nuc2YMK+1oeb
	 yyhioJkCxhy7GJRYoxqTZRgInWM8y490lkAxV4NBL1Q4cgyetubsAJBSJrDwllenHZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
	b=fLlk+CrQK4Evikp81uGZXAm71qUzvx/618sGqs8R6M8JouLe8FZB67LbgVDh8OZDdfsM
	 ZNKfb69pr6fDmnX84kPNQ74yPYQ75h+LaisIFsIWGxWvyU4z5EkE5EuyGRI0q+5MDH8G1
	 oY2aLeJPi/UhT/+9ZxpoGCkS/ZNENTyiObNhkX47Sk0XEA2wtaLK7sbG0nmtcbjsM8EMj
	 SEigakedHGcm/fKV9A4/s2zJaQ2yREbWCJHOYX9XuenDyWVn9jiSh4xao7D7jnTII/6xS
	 DYI9bLSHS0it+C7bghdDgy3asP2YANw0nk0jQkq25lQS1/gCW6pRSbHFW8sy0sj9wAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fml0NyDu;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E31D606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E31D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fml0NyDu
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4243612f8f.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794864137; x=1795468937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=fml0NyDuK4xOqqbN+fI7brgmiTe4BvzUncWHAL33hEJOTxY9rQ8kEGkFSaLlKY+dMd
         0UGKD4v7GTNE/oFJc+46i8YikeY/SPgj7aS12DdFBzujza2rO9Namq+HGAZZHFAxrEY7
         YNUa4rlvd3wziHuMuWl8/deLn/JNeh8FG+4T/wwD8/mdqqZt+G6VtlOy1zzlEOw2jjDR
         x3TvHxRO9wZUpG/9/jMcIhqtE36KzRFbCkbt7fqJjP99EE+CYvoSEv1SggckjMDCS5e7
         KTJ2O5vURdD+sLTUzeprgZxQcV3JfDLIpZOOfY4gv4bDBn4wNvQ3knEDHVIkOgypH8TN
         JVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864137; x=1795468937;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=MHTx8LgWhybj9+G3NMOId3qShD0e2PttPdPrMhUs1cCwvz7uW0vq/t40ipDfF7kaed
         j/adfcHTS+845xlQlxPeDEM2Ou5KQuSug19YkEU3nOn6sQUsU/I2WzEV0fgQ3TdCHYos
         brlyzK/ollUtST3gHiiBBbX/l04PkPhrDrhLS0m+KZAaBN5+a6eGJQkdKDcB6j/rZl8g
         Y+o06ELdE1g+rQs8OSDMFShZsZzvxzVjlXF1Q684xALDjhwvbVWl3yNg6Yejswjsyj+O
         ZxaZvsytJuoaHtRLJ+06wcMgDGNqSoJT916Xm1qZQllRLwHG8K/sECRUuaYmJeBjgojF
         kEaA==
X-Forwarded-Encrypted: i=1; AL+hErFwMW6BTF4WdMMFaVNtb0bq4LdsGQBOSu+rQqxdkoCzKJDozJAlNpReQhNSgu7V2wLmHde9ZeULwEiO@vger.kernel.org
X-Gm-Message-State: APuU4Z+/KnhEqqT8+uUG+Gvx5lVeKmSWVvzB+ZkD1w6Dfr8XGfZ6Vklo
	KNjao80k5L3LOIGqt1ifAMur8H1y3s0wHoeZcYtu6OgCd3kK8Dc3qJ0VM0pcdF2TX9Q=
X-Gm-Gg: AZFdTZc150CZImfQNGCWEF6GZqruaguFcxUfAglXIFymBiF7c4fbeLo25Ng9uolUo/M
	ClibYDbWF3gFgWEg25qEdS0t0R7U9zeSKohj3kaqt+Inwhjl5NfFJnf8QHXPRlK4hDPJDNUuWnI
	PmMcHeIQwl3OyOJIm/ZsEQN6YbzrZxOj6FR1IoliVCsdwOdrhhdH21Br4mVmRGB18Zub10VKvrt
	le18LCv6wUjtBHuyfhKWmZWYsQCqQOG8XPFpBZApT6yh12eK0pK71tBwZVCzvQK/FSKp/Lp2bQ6
	2+HeGdQVq+DW0I/QLQn4xeQuRq4Ksl4tbrJOKr/Et4HQq436Fc8++R75hdMs2MxJSyqPQST/ntb
	vFxSrYDKiJWUnRBeYK+oeXzVMGQ99iJHZ62WOG82dGnOr9bmGSLX+RjpCKF3QrPO3W7Cw05Avc1
	ajDLUXtvaIaYD1cCRCwV2fVF0f+S+OkxX0kLafo7Srex86c3q/e6OY5B/gB/X81hq79ZFVpYr9X
	yeiQZ6N+tNHGwkpkeQ9AdqUOC0OEvLKiVvGm4+bN44YtKrnAZcqb43IbOWb8F+lo9VqwoS0//V7
	X9Ns0MWtX+nVc/yqfj/XCLGjaFab7BfrptHQJmxBTIOd18J6syc=
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr30296893f8f.49.1794864136472;
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm23832144f8f.35.2026.11.16.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zhentao Guo <zhentao.guo@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Subject: Re: (subset) [PATCH v12 0/6] Add Amlogic stateless H.264 video
 decoder for S4
Message-Id: <179486413508.1210949.15857134761629837585.b4-ty@b4>
Date: Mon, 16 Nov 2026 22:22:15 +0100
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

On Thu, 22 Oct 2026 13:26:58 +0800, Zhentao Guo wrote:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
> 
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/6] firmware: meson: sm: video firmware loading via secure monitor
      https://git.kernel.org/amlogic/c/fe6c77ab883ecbbcb2d4731a2a5d883a9efbea30
[2/6] firmware: meson: sm: Add video firmware loading SMC call
      https://git.kernel.org/amlogic/c/a47962dfcc5a924d3b824ec7acf56c0c654510b8

These changes has been applied on the intermediate git tree [1].

The for-next branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

