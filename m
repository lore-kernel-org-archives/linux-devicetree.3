Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F53A41B365
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675827; cv=none; b=H3Z0fxVIYn3+NwRmUP4e6b6rDcUIt80IYJARIjnsL/6V5t7qKSgFmrLQdy09ojd99BomPy0JBiS/VD+sAX98UummPPrBPKHFNPm29YJWG//ZuZ48ck0RxfB3kudjKvmI69L90K12YWWSnN2DJiGJOyJUOtTHe4ccKWdoOMC1b0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675827; c=relaxed/simple;
	bh=WFhpbAIOGp9LGtXB2JY82FH52Mx74tbbIw1hp6aUqxg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WVGV+yGQXsGLN8acsxSbo8HweUtnOndH0TbyUsMUhgHj/jFoqIK92otsVndbiOR2m28ASB5dVhueXTrwZy8KcTqOin4S0uQRejxTWYvrFoTSU6eT4F4+1FZylPdHeosITx42/JaGoLAD3ap4KI7Jhh0A7V0joirwbiNeNPTv6FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SHi7+609; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SHi7+609"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d102471a4so67026535e9.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675824; x=1779280624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=;
        b=SHi7+609j1bqygV9J/Mai76vgIAGfcn0rCyn3AgQy8M5wMibOeN/+UHuMwbLGngQXm
         uO/ZnraJnqVlAwFsTMxzLXYPa0KLDu+7jbmq6qmEZcwfL1PBv2wAx1nV+NuTp4x8Gzrf
         dvAIPxCC3fwOyQYPwcMH+LnHj21F9tFJyfHAmvtLDwI+ZP7dk+J3DfU2Ja/junPU3Nkj
         Dk+cOQc/1NQzpCBxf9d2TxdNOx+kQz+ZY27ZwvpUFSN7eoZf5GSdqWj/r48aM0W3j6Sk
         pLuodOg9aShlV/H1plWnlOsxupfT8ZkNFEicNlKlUyCzrvXIXkNro4ImTNNNha+FfVfl
         /KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675824; x=1779280624;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=;
        b=qdpZaob7XzSlYyys+IcCwCtmcyJwY14n4o9NqL7qgofB5B3+1Flk9I60bvQs1ycEoC
         nUUVbAbhqqUuix4hX0MMiouYvXrxNQfZeVozjRAebZXRzWtCBitE+9LZ2T3ue9FCBEys
         JJHH7tmtZ6+5qMyB7luXYHZ/1NDCx3g/nSovzRvYAYiDqTgCj2L+r6X6LLnEw7aczkaO
         O6mBjxXdz6xY7kfPvV9HFgwtYERqH+Ia+oZ6eY6rNaq1nKT2vtZ1xldbcttDriLN5Vcm
         Ii9bwQgyA0IoaobO04fu7MaezFE9dGV3iLJj1BpsU/ttGE8AiWokgBJxAUWhdgEqi4Kt
         dB3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9tCntlKx+FF8Dj72hNlufnUqtFNnCG/Nkmbg127X61bEWSYSbeUxPqMBz4AZQvWKScuctxkhGBzg0U@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/47YeycyoWdwrGdpe3S1Irqig2ZaeAGWVmZSs8pxT9IRdszC
	VD3WvuJw8+ly8J5RCwLdfHC68m/vFQQs53WPT1idBv0Sn7HADg5htcMEmRtO2C4b50k=
X-Gm-Gg: Acq92OGKWtzDOCoUbNKYUvhB10wEP/W4g1UOZCul+WCo79B+thy060eNnp9cYK6v83m
	jKtgHF3NdHKz1yXyurjyPF3MPiWWpunLvZb2ZBhezUBpsFlfxFQya+y7mik9524s9ufq3X/2quX
	/BRZKcZPvWuXl4dGB9jXZ6KkZkxbDz+Gis1RAjpQ1Cns/0fwTXWT0XEytXdYD+ja4kxN/Hi9jNH
	5Rd/7JMdih/4A2OeF5/VyjZOSJiVvvKFB11jr//VXYv6YewOUbdBhnKcWz+ICntCVkqkLQKDEcu
	EgQx0tj3KK6vqSUUE87FCMnWDQkRLxsMEtQgxqCJP0736l1EVBKTVuSUo942ubfJlLhf+x9i/dv
	k27HIGLvmZyA0an4Kqr28tdmfvBoi4jA9vKRPqF5fs+oiC/kdnkId6C4IxaBieblIMMSN3px2K4
	EW6EiTsvdyHpQDWhjJ58qNoiRnR55Gw67XBB8y+h5dU88l
X-Received: by 2002:a05:600c:3ba2:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48fc9a0dd8cmr50279545e9.7.1778675824336;
        Wed, 13 May 2026 05:37:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: amlogic: t7: Fix missing
 required reset property
Message-Id: <177867582359.1433419.10249035871609628577.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Tue, 31 Mar 2026 16:24:05 +0200, Ronald Claveau wrote:
> CHECK_DTBS shows missing reset required property in T7 DTBS.
> A new CHECK_DTBS with this patch does not show this anymore.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[2/2] arm64: dts: amlogic: t7: Fix missing required reset property
      https://git.kernel.org/amlogic/c/068bad69dc4d3ffdd8ecf41b455cc9e1617d00bc

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

