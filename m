Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221B17BED0
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469234; cv=none; b=gRSqM2xxHwGUwGTh19zh1hDtcDYQpl20q5cKvbgH+NDeGNoHBtZVd0mJq6H0GtYZPYRw+fDJZwbsNCTN9NyYN4W3OhxO4qPqEv8e/tdzgohDuFScIMGIIM89+9APD3wo8SZZCklFKLVdYnzTfrUnYX0a0GHD3koD0vmy/UYjrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469234; c=relaxed/simple;
	bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIQX9jyGoO3Vc/0LbI+zvT0JhsVi2u7Pe4qqg9AMiwXSLTTiiBnxUfduAk9cpCBMUUjP5hBD7+QsOLnjgfO+SX67fg3ptf1jT9dOs8pO6w0nVBQfVbbuqzP80Q4FmTtCIIXBY5idpZ83W7R1TPkLqCy5Ds1S9afTfyNN4PM3ZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1EPHvZ/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1EPHvZ/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47dec32798aso91552f8f.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469231; x=1784074031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=D1EPHvZ/NT/AMVFYpcNh+7Je57VtpKVVQ/8q5qOR2McxQuClL1ddOXB3LT6DuziCil
         o5To30SJO6kn1O7xnaP5I0IkyUtzPtiVIG0G97+gz89QwL23b+y9h1lXihtz1Fa0R6zo
         2F7wIWoYTyeqHOpPna7dChH00vIA6pa4xQ2lRNXI6fgp/6yz647I4AgckGOfm6BsbRMv
         55pegILgzWTpkLMNtcYhOJIit/NfI07a4UaTs71bwvXl5tFLR3b9CN+fgUA3EUpj9Wfv
         9UlFQ9tdlf/5/qL4IFHzKUcYn7C8agvUDOZY3RdciWOdbjOO0+etkoICXcCimCGqOQGD
         JUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469231; x=1784074031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=LFSroMWn9ceQiWx76XEls73jTZaZu4Cn58wodz1Go5Wp7ZUCu8tjZgnoqmsF+iNLYW
         yjp4dyNLZdNE9iskcFBzwlrdrd17Hg1+o8tlyyx6qecIZ6mIathRrneTtjhW7whhbsws
         3NRvLUTd94vra/Jmlz9aTUN9YNrrCKhg8xpiFX+pi4xxaRAOmEkfpOB3KST4o/Mi8Juv
         TcUM4d7QYtY1kEFYwDZsN646mtHgRp0f5vrJ3gD1GTHjA+C6MWkQehdOTe5j0dqfpUE/
         LVDN8CX6++vx2nv4AXFcA1FaNODaTjHdc02rowL5hLb1KbcYLX2q6lCM6ZrmwxehhJix
         6f2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrDIyIZcInH1AXXAieMQ08VBDTR6icFb4pYKZddrTqNFgF7BlMsG4+0260HhXp0EO/X8r+4k6iQSBKW@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGqBdxbELQr0IVOc9Vfy38YKIPxjHyDjoDnBJYd/+eTuJLX3s
	WL3cYezSIussRg3VldDse+jwef3kxAqlkU4rWMUITbC5S9hA1A4mE0Xbsqsy5+e3Wlg=
X-Gm-Gg: AfdE7cltz/QdLdBgO5k2W3wumLH1T3ETYUEYWqoIl8Yq+LN4SvQbdyEFaMG0KyKDZ/+
	iZIIbSdzVz0ApMlZpQHqJABNaJLaYJNaUxeiOJwcS+Pnxgy3HFOUKGOradQ4jHQG5k50+TwFGyO
	k8Rlo6jXoZZAIliqivioVPFwVwimRwxmpTc32sYNkxuI1Tumg6StyiPQa2EKIFW4LXD4P7TDvzF
	F46spJLkZKeApoJV9VzC16Exb1F0ZJy8SodD1TO40YNhBeVm78ZC+JYvNQcVPDZsLjAm30n+6VE
	HDO5PaNbSHvEn9NVYP99QVDh/wFPOzSzRELeeQrfjVq/wTE5V16toaiKeTE2gOLZV5rotO2WHYw
	8dTqO5TFHgn9M+auLqK6CB0B+VDNcG/9VKF8l+EhtiHzprk5M4MOEU732Ls73KBSKKehvrXslhl
	pOiK76hKvxAdm7+9Dw6vAk6so=
X-Received: by 2002:a5d:4a0f:0:b0:473:b32:ff28 with SMTP id ffacd0b85a97d-47de6644b7dmr6101950f8f.34.1783469230847;
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:57 +0100
Subject: [PATCH v12 3/6] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSnIwO7RDbt7xUzJzUmsuvZjlPXVORNHmcV/
 zBgF1OqeC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 OrzMD/4xiHaBTiPb4JG2qSnj5fgWTIEt3ZtLDoRh/CetULjYEQPLBH5hsjsfk0e6btpOXPrQxp3
 lnKGaVXA+2mq8K4G0uRkw8vv65xIN+qqvYbdMiwYsgTdH8ummxk8W4tvRuCYlW8MPhTNaXpHpIf
 Kk528bQGZr8aGYGlIn8cFXAALnoKlBwBB5NvgsgTlL3xn8CCBzW26hrjQE+a3yciLmx/B7XC/RX
 7NdLCcibOfTP0tnhMD7WYFTZsdVbK6vsrxTI86U7pIkf4YM23VIs57WNxflt9wKBZJeELByfKia
 7GpVNmHaoYG9UlNtf2dFS2mWbxEDgtG2uWX9HnDMQrsFaFn6hXkbx/FZ8qCzJWLwR1GadAOIgJC
 Vy3EjC3uqOz9p0aqRyMd63fTspTR72mo3ok5HjNercfM9UabdbvWeznuY6O3ot4EgVNpi60FzLd
 +4N1cBTSxEDQw4LC4lF1XFWmkjpNs7OlrNg/mVVZTtDnZ1xUHnrnTyLf43rP3lB/JFxSjyqe4Ub
 b0yrfEQBF2e5nntp5pEGHj9ffr27htrWuYqTHrb+7ADbxz8YccYlSWbaz8OBeYarxJFb1wz2duF
 MevatqeiXXLujqmn07kLIv9ATDKUf1zH7TqNwjNwCfUCv/vXD8B5TVImtiXHeTOEk+3DkFjhAlx
 BOUyKECCmiofnUg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Use devm_of_platform_populate() to populate subs in the tree.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..95e655a8b6aa0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.54.0

