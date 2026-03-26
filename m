Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7903B774E
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515999; cv=none; b=GZDUe5o2zOOwj9MGZFp94LGmn0IPOzbIeatv71jeB9QfZ8YGxMCAYWhSVlT5DBfpsNRTUAjF5CBePRfx+jSQdhEWPuZl/H1xgYN4Zhrua2/uXtmLqU1WUDuY8OlFJ+qtEw/K3/2+L/NH1pf6qEdCgNd1IGY+mas56/E5ujgBzzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515999; c=relaxed/simple;
	bh=JH2klHYB+MRDA1gYQ4Gg0WwiCqlozt9uLnLS7nm3B2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dyrp0+ocuoFTr2lvcO0Em0ZvhAk5AWlJEvubTm1u4O/9n+YXBWL13RT2lOFmVLWOjZMtoNBQFNxI6S+f/vV4Bz627BcW8mL9DRzFTiekNkw8U4WMvhrmRnUKoTVpRvlO8D74m190F4puk7NPdG+efSAfzCTFu1DfoCmovM6/M0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xmqpp6fK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xmqpp6fK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6753315e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515996; x=1775120796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=;
        b=Xmqpp6fKkneX3tGcJCZWHKQ252I35eV5p16OklhDAQpjfNddMMNcq7zpPRN5QPUgZ8
         yoHrN7tnzTnEmHQ6MHZB0+Uqz7/3WkjfnWqH/qdNMzyymcnhZo1UranKnyRFdlTS7JrN
         Inp/FBdw7IPV73UNF0wgDvttJZpkyD8rl36L7eFggWjX200yvtMbo10f35TBxSLzTB3M
         sdyP/iXWgXZvD/DQlcvUKYHyLYliEav5jvMc8VnCyCJitoEkLmz9r1Wmz5Ow+Gw5OVaM
         2JnHTb8v2LaRu12U3DiYN2wU3uXhRMn7XqduRC73hjzzyhpNeZUYNnmM3yD7PcorAMhx
         wHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515996; x=1775120796;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=;
        b=qxTR/lzEN/LYAvHdWcxtJBUESF7TNX2O6EwvEn1Mdd4GR7m1Ou0E0HkW2MzwMqkLyK
         BF6WKYYAAucVgX9LHqF+ZMbRKMRKEf9z2fbfxSZDuQ7TYTwMGBjz4IuGnT0gwvcfqh1s
         TdHqRs8OaFU/5XA/iEjHSopNgB6TLRZCC1860STNgc16dmtJ5MvCViLBELNIa4GKU4gD
         P+dLKyS4n4DVGaYJT1Vf3u0HJwiVs2K8BQFXMgHCcJpYNhYOuTZ+Rv+iStUOXyUeCzV4
         ync+ENreiJqSWhxl9x3Cmh30ogbcLKzYLJKCaqOnhziIb1N8XOY60nqJfS1B5xc6Ie2f
         Mlpw==
X-Gm-Message-State: AOJu0YzyeJ9rqrmgdOzbA9nZmBswQc79ldX8h+Z+v4N7wG2csEjySe5G
	PyeFI/1ymDMTdinJ/SKkSJsmV+iv0xicYFCP9PJHPmjhgmsAB3UEpAgOLRpeEcbaB6g=
X-Gm-Gg: ATEYQzxHcNbF3Ek7q7nDpZ/zgPK94Uc4NVp5Yp00cAgzNEOvrS8gyxU6Ij9vR4FZbVF
	yWJpa1gjz4Hc0osZ2eNwHjfC78pAxK2Gf+4lSzSwccrFQNgAZj2nbh9Y6+J2xHgI8zutpx7WH9/
	nWfNQHBAdj34MpQTAaORZa3Ea2bPT9n9UaMmW7o0wjBh4Mi5LG7j/eyMjTAP2VqgKkGtup/VjX9
	hg1s+6dP/WZiLS6byJj9ZoNk7kgJ0FnVJbaptYgRzU5U6z27GMNW4bvNFF2ZL5HaoQ04f2RaqEK
	JxQMIOQnpJIB75PTcGmF3aKkBTHsPUcnLDiW4R+Qh2XkapW5mNyux5uzHsJuTlwSBFP3ToG30a+
	iGiBo+9Ag+3F83cbuCk4GDyappc2HUD9JFpm5xazR7p7qf1DIA+XFXfZfdk3KtlIiEFW2yGqeq5
	8a+cPOW+6U0L2zAhEsoIFwWXWC+tiwacPJ8LcwsKQaN7yd
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-487160a681bmr93976505e9.33.1774515995951;
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Jun Yan <jerrysteve1101@gmail.com>
Cc: martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, 
 khilman@baylibre.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, yangxuan8282@gmail.com
In-Reply-To: <20260213073810.552341-1-jerrysteve1101@gmail.com>
References: <20260213073810.552341-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add
 bluetooth node
Message-Id: <177451599509.122020.4339182739490184296.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:35 +0100
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

On Fri, 13 Feb 2026 15:38:10 +0800, Jun Yan wrote:
> The Phicomm N1 uses a CY43455 (BCM43438) module with its Bluetooth
> interface connected to uart_A.
> 
> Add the required device tree node to enable proper functionality.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
      https://git.kernel.org/amlogic/c/d6df314c0165cb809d6c647a593664a4f5028230

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

