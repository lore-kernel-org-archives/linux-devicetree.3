Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A3378D7F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072303; cv=none; b=tSMKP4WVjPuks9SeFhNOWvK0bALJtxENLlNdar98i/XSocYSKYS2VV0+iO8iCAJjXOhoA92CXtDyUh3HoAuGmWfODFQYm3AgYblN7IjF4nX/r162YzfFOQiKEBl6SKNz2OK48fS3HRx7ehEwFquSGgRe3V4bK4hqMkJixN2ANoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072303; c=relaxed/simple;
	bh=fMjmyny+PhIm7lZOE7mlk2+b8jRFOkuKSja7xHn+vS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cEDQep/elCS34RFiopUAaicyBzZsXliIL4UNjvsGfRHt3M9yQAz0Vs3V8rWBWYat/u7P0ECEXOjbRLhc9qFF27focazABWuuYWT9mOBtScgqz5CvEQltDnOOrP5s3sqgTgEwO/34hf1lUxbYtyFijIRMBROKI/J1PkPWxmgujVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuSEjEdg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuSEjEdg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493be1b9564so2470305e9.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783072297; x=1783677097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=;
        b=KuSEjEdg0gmHzGTevg0JZETjNqpOXrkT3p3CbNuvsS4zpF3LMZxoxHqYSRvuoUgTgg
         iJITboDOKW3LlKhWaLu50BFoVBZa7rPlSs5jkHkb5JvOTk0LYKpNNiZx80bat+W12jWX
         6BAOITgPx8F0Tks6j5nCmSJA4JFcOXjkQTS2uiPNESqcGkMCJlMYPtLsexdXh8gbu9T0
         FOyJO6ctqG7T4rxA1t+f5tn5X5MFXoKCvEh0ShtARDvYlYcQvwLbfE5aCcoXS/3WJfx0
         A7B2/f49lO8Yx9Ds2kQwwEt8MSWkS805AqGZys0G/eBzm7J3oHyiqHyiFmlB/KQHj9ov
         0TCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072297; x=1783677097;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=;
        b=h/IgfYKdl22EvxgnIGVDtt8qDHurp1hQpMIKR2gwXuXXlL9A7dSFvlm99sv3CLhvS8
         8uABpshM+J/m8yJIFuKvuco3vdmgvDZOx4mj7cB1lCXtiEk+GsUE9L0nJ/MCGbcbSjmi
         JBV8CLlcFkE8uZdfXUvs4WD12+7mXcipR5cCqF1bAcX4PdQ7sBMHVnEmfbaFeMWaA9CG
         UwTdsFCym1HZIlE6l856uCQJrmJqx4NKH5soKQObynFw9jURHb969E3Doq0mj1M1foQ0
         gef2fmpSk8UtyX7bL16aPB1+iQBPOrjCtmy8tZPQ0778pU64fO3Ysa+sJ37MoH5uYyQJ
         haCA==
X-Gm-Message-State: AOJu0YzT/PwBTB26IxhVBuy2QisVhVpcfI4Zt97EiVK39s4J3QFDerwZ
	m1X69EnAl9RiGWkpr+bUR5wOmzYJ4tZoer2cQpA1DMlHmaVlPR1mDrP7x0wbniV1PmM=
X-Gm-Gg: AfdE7ckTqNk6i4ch0Ip1f1YQEOC8MdDAHt1VK4vYriYTnLE1X7E4l5EYo7lHBJYNvlc
	U7SmoDx0iI6EIe5oJ7+uPeOK3UWe5CNw3kkotOTCJDqReMuDw3gWaWT1jiPC6oU52KqasPDRyz6
	pIUeA44FQ7we9QQdylTGmwCxrnUQtbXDJQ0hArgdj4+1xgrFDn7PUmGRMbunaw2ifJ4sTBk0lwZ
	K28sKS2az/7d6ykJtJ5TG7EB/aaKyQH0QRWQiXZiR1MTjEpY+EJJO4aFbZC6cdIK07wHGQ3B2x6
	G1KtwpXiuCGl0WjW+mMljWVCu8saMiW0kSupp8m1+0X1WblQDdmLhdVFFK8/AC+loy+DVCzMtpW
	9q5L6jSNhLX3gGxDlVYZ4BoObYRDnXlfB5WkTuaD97Y/hHxHdQ618h8ag3zLvLnMT3JcdEkGgT0
	rA5fP7zEhY7NznjuPCZTb8QJ2ZPY1RtNiMD16fjhKosLoU
X-Received: by 2002:a05:600d:840c:10b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493c3cf2f50mr96587925e9.23.1783072297045;
        Fri, 03 Jul 2026 02:51:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm16710140f8f.24.2026.07.03.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:51:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and
 T7 support
Message-Id: <178307229627.3254712.12197309292158479320.b4-ty@b4>
Date: Fri, 03 Jul 2026 11:51:36 +0200
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

On Tue, 21 Apr 2026 16:17:40 +0800, Jian Hu wrote:
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/drivers)

[1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      https://git.kernel.org/amlogic/c/457462828d08514fbf53a385c0cd39bf597adf63
[2/4] soc: amlogic: clk-measure: Add A1 and T7 support
      https://git.kernel.org/amlogic/c/8bfdc0393b3f3d6aaa1203e889ef9e96a50b28a2

These changes has been applied on the intermediate git tree [1].

The v7.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

