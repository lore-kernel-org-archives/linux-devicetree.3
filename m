Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE9313527
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810204; cv=none; b=J863ryR+aEq6FRJLtbUr8/vTpwMZWkUCxg32XWR1IbHvZiN9YP3UeOe6lPGR4q1jef65LOYO0gkv6C/qgRqQ2v9VQlfJ5vWmTIaPYnT9q1un2axDUnZM0l/emtJwlPwe92HlTLvVPpTbujJGcgNTzDcytw55V+jFBD2OPTHDSHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810204; c=relaxed/simple;
	bh=JspSAmg2h5s7/0NVQMAr3BatjKhkiwjv9OkJ2Opmc0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aHuihHNfE8iPcNIu7zdSEVWV/T+JiX8dIfsB6jQ2Xy/DBvpIpLLejcrX/rV1DyYqH4cJc1WI7BeqzfjnN8VOitmBV7x87YM4Wy/CDik5gTAqJtVYk3dEyrSy1+Wk/HVOgeGuhroXzwig4N8rduSaYhYYqxja1VAinI2g74KxiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=UOoBGhzr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="UOoBGhzr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so15486765e9.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810201; x=1792415001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AYpBwd7jtueYD/5N70HOFcX5OQ+BSChXVXn/2tIlCDg=;
        b=UOoBGhzrGEw+HGMlx7IVUpVUgc6bCcBcbBTvnjFs5bsnFlmWxp135zoU9ec5H5RZ3E
         JeqJmDJVbIoj3hOkIo3a7Nw2KxdaEIVXYRKO3AWwjKkgxHecxe8fhrJmloZYa9/B8oT0
         YqFJ6rGp2XLbmfLoq0cSJULmvuYmPEwjqc4AF3CnSrzLmglJJKnIM2Spt4vTNvZi56eH
         8iQ/ETQlVN7cVbAsZZEyiE4TxabozgFxYJJaFSLm8jEhVQ7z0QQKuvT1vzcZyTOkX1nR
         7rwYpHJUaKn8V3o19LTo9s/0vX+tfdMvfWrjKl0ZoP2K4TW+OYEsqEsXa0yp43e4ov2N
         BAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810201; x=1792415001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AYpBwd7jtueYD/5N70HOFcX5OQ+BSChXVXn/2tIlCDg=;
        b=G7Lk+3Y5ZfClPPtMtyr4AkVlQ1kvI8+8zKpRC8yqLFu2mXJ7PSJlAoQu8YINpScZmo
         U6Eka8ZVrhTIfMqG/CHBThQff0IqgW+Kpri+3Ex23Q6VK/cipDRr6BtD8+sB47YWQuJj
         SwSwVxgMt8JzC9BZlCAXA6NLnxYXd6kpMZdlPi2QqK/nSPdTjVJdnIb0LMCNEWQl4v8/
         o/hbRa1VkcSjTDMrzUzpD6FuyHlw2EqEn+Jb9VRJnIz1EOWcAN223nhUYSoyT1q9iWlH
         Rj4QSv561DuzIJz848MDcJp0pB3F/40FrcY4zvTctBrWn1kWO7HtbiYQLvYRPqyvsEkm
         UzMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDs3aa2jjpAg/tL80RA+GNH1NpFY13FRL3B4j8/tIsFSkr3JkbH8BDKnAr4Tb8yX+Ji/sYeP6GNFwT@vger.kernel.org
X-Gm-Message-State: AFq9FYLlqwT1trc/65MHqEjERjDl/92iX8QnH04c9h7u3i2BDzy1cCqU
	wtmPULcBljeyJJbcpzMeObhd3+iEjBaCENPpCvsnFJEKffwzbghFRXNQ07ABorIfIXQ=
X-Gm-Gg: AYBFou3PPWgYy9IiJUIU1/USXSIkzP9IN48R6Pd4xjLgZQ9Amn3hNK+pmBa0rJDnNMQ
	3ebnbFOcvlHDUehs9phFxFW9t1O1jEsgGG1sG4Mf7psXZJunWBak3HlBaXYVhiG1lSsQCfB+7X6
	vFZnK3M/E0R/9OC3BugCe+0O394JSMeXChwvbFuNbSCg4hzjE0uMT7CC5InBKODQqCKbvq5exl2
	15lXIWPqUDWG6n+aoKrEF0n8XZL+UW3dTb3Tuyup9b53vgMNAG7vsTegGJ5ZSxzOhmfvIyg9+o/
	lG4s1Da9y8+ikDZIuh5jgi7DBaguRmfsEmd2vFU4mfi7MpuA8PGoX19DVYBa6S9gtnPMHb0LBbK
	FQsAnhUVdsYS/nxIKTEgzYw8TA83auNZQgQvpRU2+PUVKJH+xnty5+sEg4qVu9arDN8QK7tdXsm
	xPQQmw9RP845Wxj5CO+2tr58hz8ZjjM2v8Aj03e6J9rvCzw3mJdlTlEUhBS0tBRtDq+Kr+6Y4qC
	+7SVrWQFju8/mUPfIrwFo1dkpR68QXuJDx4odmkwkWTe5gBqI2DvbK0Ihq4s4WqjkreGXR2gfzf
	En/3pwi0JPyevB4WM9HYtg==
X-Received: by 2002:a05:600c:8b09:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18e4987b8mr186087765e9.11.1791810200910;
        Mon, 12 Oct 2026 06:03:20 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:20 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Mon, 12 Oct 2026 14:03:02 +0100
Message-Id: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbazGoC/yXMQQ7CIBBA0as0s3YSQCHiVUwXLYx1TIoN05omh
 LsXdfkW/xcQykwCt65Apg8Lv1ODPnUQnkOaCDk2g1HGaaUNyny1VmEYZhFclwndGJX3+nI2wUP
 LlkwP3n/Le/+3bOOLwvr9QK0HidmYMnQAAAA=
X-Change-ID: 20261012-sm8550-camss-tpg-6bd0991432c9
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs. They
report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
existing gen1 TPG ops drive them unchanged.

Describe their register regions in the binding and in sm8550.dtsi and
add them to the SM8550 camss resources.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
William Bright (3):
      dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG regions
      media: qcom: camss: Add the SM8550 CSI TPGs
      arm64: dts: qcom: sm8550: Add the CSI TPG regions to camss

 .../bindings/media/qcom,sm8550-camss.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++-
 drivers/media/platform/qcom/camss/camss.c          | 50 ++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: ba86f67908354f41f269ca1d64b22e4624766dcf
change-id: 20261012-sm8550-camss-tpg-6bd0991432c9

Best regards,
--  
William Bright <william.bright@imd-tec.com>

