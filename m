Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627739;
	b=RIxwEbrEAcy+mGQo1rLxdaoqEJH5ugZ8ZljvxWymPzzTcrNGg+zgcNmHoJP8jE9ioq7p
	 K9ayE6+dHAmonnlL6sCmrV1l5hlC1qVH/DEz5BLCnE64/2KcXonoJC1QHTheWV+j2CZRj
	 K/iolIF6o8oG6SYoZA6ZhkoyUcnZVZhvvo/jHE6mKiNRQwKCKosSagvWmpJsP+Jz/5zmD
	 5PnjecK1HS8JdKbGq3hH9soILBZYJJb9TJo7/mcMcheCLKykqy+Xa1LNvcr4g2D9XKvCL
	 lKQuch+WH6yQOQmxcug4cdxDadVZ+cxYGPxdvZxXZJ2t8F9OUzHXtaNcHdGiP+TQyYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
	b=GRXyE8ha1Ygqy8ZPmyhPChojj4I0vCfN9mzGWrhRRE0C1XIKXXa743uVvkeSLg2ghK51
	 gICUYVtbYkY6EaiY+1nSr2RoLQtoSgMMyO1lNkViE91OdkBfZqEDiAf10eSuFVecWrnjX
	 nKPSLbbzQ1w/+yPtuCZlqQ518tbjIv9c7aQP0WxOK3IsouSDpFVQGlySd+2/6lWihHWR2
	 4iVlsELJf+0Zn1s5yxEezKa1MTFzydRnGhP5yNySEZ1Hh/MtzLjejUbzgco/I/9u1RwHt
	 0iyFu+eGnhQ/WHmwHycKN3jVQwm4/IvUj8dUyqgeDc+zgqNAge21PTq9fuEKCE7ScuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2OUWgwt;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D378606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D378606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2OUWgwt
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-704597ef1d8so581050eaf.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627738; x=1793232538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=a2OUWgwtx/KHDACojfn9sbwMDoKmjkLUEnhlEPEvQ667sdj1ISSUjYaHRcX5RzfUVO
         TiXfpMht3AoHSZKwdd3WPJzAXpVHUPVTd8Qrmtdcaa+E6eDkJqGEmy6pgDKbSYfxQUIF
         EXlNWtki0Y183F6cWhygbf8xu4XT6/dYiyCsLyeRcS0mRsniC5KNtrE+u88kypK3iZ9t
         oRAW+sMJR5KRxmMsgckA2obs1inmaN7b2WMsPKRRH9dH3skgZRXFaVn6f0mu0G1DqeD8
         hoK6Ln+Q6dYAeKeHRdbBnKQJM9BVgkycZYLcNg975AlitSiaLqQMpgf4rn1XsoiGRWTO
         Bh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627738; x=1793232538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=BaXmrcqIKD2Z1MSYO6CS+q2+iu+4ccKNrW5uP7NvI051tP3gas2jkijw2MN3i0yWTB
         okJIKpO+Qj5fYjFM4xaj/5wbPbnqkzgpO6AwoEJLLKfKkCtJC48syzlBj8OaIUKtiaJX
         F6gwfe4U+4Hypgv3m+BXwBhCN+kh/Th96dKBl+CNG2fQfONrhUNAICQuy6GL30/ZjBj8
         +NeuEUM4BxTZVc5wWjJl9EqfuCGT5LrGj8NWTGxskVNOivaNlXiOBVwcULh5q5g/2e0y
         o6VjKbZ4+BaKGtHpFCESeHWzj425+g9Z5DtefBnCMlGAuhpBjCOoDfxmlEJcAAeyoyoP
         wsGw==
X-Forwarded-Encrypted: i=1; AKwUvBwcpJ5SCgMzg++SXXlaTwi1AMjeCJ9rez75nCLxEKN6F0YQGD9tUxgdGs+LTF7FHf+5oAEZ+a0A/Gde@vger.kernel.org
X-Gm-Message-State: AFq9FYK8G7w1dzfJcRpSbKpyJNwDZbreAXLPTI/yO50hxzAsKu5qGjGk
	v0PUM1SO7oRkWC2hLaKvfo3lYa3SdEn5Xiol7k1c/hSGMhAnkU73C1Km
X-Gm-Gg: AYBFou1uv0rvrTZSAJB296sI6RFWQotaqmhKVwN+8R0IIIJvQoYIuiesDSHqfXBebDe
	JS2Uswyr7JamnUzaPeuEgqpaH6JkC/NJr6KD3ODt16pZSnaJH6INWaTnMPnIYn89NUzfkOr4f8V
	a2scJN7gb6BjQgG5P/cnBvWmNOpCaiuhUwDF9TnEBci9UWp+qmMtMp6Jz+HUrsxyElYRg3a4j7o
	SvAeTLkfnmCHuvg8fsngbptiXtKecqmMFH0F+6akuZvtE1dJVOcThi8fLa7ZHCQwxuhk72vyLl+
	DMZq1PJLbTTAuqvIbtVbADsIOTfJUpTg79KpUcKN/tMJF/t2UeDADDkUOLhuzSbNjT2SXBq6jRJ
	0mvf+ZrzjMG2LVXyF3LZr6/aqzyfcwd6wiUmJR7R45ZZ/nuA1zyxS8b6sk6djxKaevqkjQNQERg
	b6dzuaAzISIshVmmiy5hqbDdR9HhtjtOigHMlSNvfjskKEFIoz+4hVGtxncN6/pxTWSTqkK5AAL
	3hT3Z+hNwpLP3Vv5OPkLkkl3hczi9btGOSHMEDTj/uKQCiKU5c1dZ9yZhGa5xodmZFTwL2KlJo/
	uL/c+/uHSf6XVh3Vo4MwS3cPa+Ys1cY6cWBt2Wdp3GkftH+DNMUswSsDeaK1J5gerCm82dVkBDU
	17QNjgpem9G7CIngqPUFaBWxNXcU1jXG5lQtsg988h5ZP1439vZuHkJ8Bmf1g0Pn7D34NeyjSHR
	TGWQ==
X-Received: by 2002:a05:6820:5715:20b0:70a:1787:268a with SMTP id 006d021491bc7-70a178733admr1123581eaf.89.1792627737623;
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] clk: sunxi-ng: h616: export the APB2 clock
Date: Wed, 21 Oct 2026 18:08:54 -0600
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4Xs2dW20Qr8ivHQrousYCEtEhLCv
 1v0NHmTyZsVEkfhBHWxQuRZkgwhgz4UQK0LT0Z5ZAajjNXKaEwf/5YpR7gowdZqi270BqkfqMN
 Zo61YOeKqrEoPWTNGbmT5Xdzuf86OF9O0e/eFd4nRRxeo3ausXuREfYfNEPF6PMO2fQE4WH1Sq
 AAAAA==
X-Change-ID: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose APB2's existing clock ID so device trees can reference the UART baud
clock independently of the per-port bus gates. Add the public binding ID
first, then remove the redundant private definition.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      dt-bindings: clock: sun50i-h616: export the APB2 clock
      clk: sunxi-ng: h616: drop the private APB2 clock definition

 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 3 +--
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16
change-id: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

