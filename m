Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0700A37B018
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488496; cv=none; b=Cr40gqt2UtSb0KnLcbCEpQFF6tZrULsRoloVjU+HYFT9DrcxVIxi0waViSc7c7Mlu1AisM5ugacwTVtxUir3w1L+6C8ELAm/JZCQ0mTDobVqCVn5aHtjfTMlqs/FoiEUfzWOEk4MtlcoDaMukJxOMUJ5cOfGr7BBgzI1Xg9KwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488496; c=relaxed/simple;
	bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kz+glBOyjxMQ2vyGNKOpx141n4vlwlUe3aLAu4gy7M9i7g6CGa0sZ7GfmGTegyLURk/M/GBmiiLU1tkm9hiZ/Tt4hp2tqZmJZ1lB1pYZcAuhwh4vuP8Kd/+HRMhySrFi98BrJFNpTx9lOvhWtytB4Y8+eRO/J2e8yex764FaE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmVPmPML; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmVPmPML"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so355728f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488488; x=1775093288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=WmVPmPMLg5cHLA8iedgfnYlvZlnh/EKxSoE/DD0UeeIjOpsf7893oZTwou3ltuyVdq
         TRhHyZDASKyCL6Dk8bHs5tNHImjs0tNstchbNlcnHlPBkri+mpsB7yTYhftiI3Hy0lb7
         YOHzBqZsH0DoiGw2xQAoBhGUGLNlxRPNmIGIG+TUI3Rpog4xNwqIWJQmCEOPIQJ0x02s
         G6F4zUlTnwd/PenIRi120yhYAvmQrA06l0XKPH3s36fR0m0zztEX8TuixjL0MerjGCv8
         PiGcvnJcH+aFzkxMHim9gPhYeHgYhUkMT4Eo513QRs2IuJaJKA4rL6vkqtmyZngv6h/p
         zYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488488; x=1775093288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=VgLacU7cHVwph1Y3VPIy3AAZAnNpQqi6bq26Q6VrpA1akmrHcmEOU5zfVpmCXAyXhP
         fKmrhENbeIXjau36sG1oQFsYR7Gyfh2nuhOs6pAineppksoe8sB+TPqvSy+L0p5Y88Gy
         GtwNiSKvacFkGcgDmlWeGmCqy0mqvPr5FIMhtmbGeWc+gD2K1VXDUqmaeEv+veZ8zXpr
         6LAafUydkuDfkE65ezWqQaoeKUnL5hWT+WD6Jrfklra3jkr2DE3C/rboKJwsgK3LQH52
         CjTOSIRQUDeAgHdBJh5birvIFEXm5nlN+T+s9LBiI7gxsvPtn/esDuoyQXN3eQFlQQGh
         niYw==
X-Forwarded-Encrypted: i=1; AJvYcCUJs8crNlKfGrwGgOVU+unSW6fOEdWc3717KsXtzWmIUmATeKU0wFNjCbKV9jWaaC1GZkOej/vBC4tp@vger.kernel.org
X-Gm-Message-State: AOJu0YxWm+l6Oo0vfWthswX/sdPTlJP4UNREYpS1Lf/zK7i1rfzrjlvo
	vGeh5Nwn5u3AXsietAnW+58VjiV+jcScu29WFZic0YtcITpbdATJwwre2lwZFIILwY8=
X-Gm-Gg: ATEYQzyAuomb/mSPWfhRJYgg/jVcaGCM989FpnIMzFlLhk+jUd5FMABP0p8kj1Tdg/a
	CTBRVkMJeAROsZbEJfgyRtPMCitgO4GuMN5GunU5C2X9jPLHl2sIfz7t0NZxL2nBk2PhiOZZlFw
	3nrq9EVndRXYxTpVvVC4LZjyy4/6RFefpqF7b3bR2Fb+jB567dZxQKl9aPSoTtImGUNCKKsgY2z
	5F1ifjdiAZ0oQTgYgjOSYVGjxRxrtmWfzy05uFARRAqr7UvDUE8I2EuORUxapcyny9PshzsxQcP
	tRebSnPFcO+rSjpzCwXuVWFsKgc4KirnrMKoh94aPofuSMdJxA64fwqmFy8TwdknbTAedC9dfcG
	lhiUYQNCtc8cyL60+pGEPGeClP1SgsYPwPLphZc9cf52uP4SxGRnx/YDpPj7YmiUHoH4aQfXYKC
	x2nutkeEWVaWbKLD6BXG7VkpT7xSw2/ZKJKNY=
X-Received: by 2002:a05:6000:2890:b0:43b:4625:5933 with SMTP id ffacd0b85a97d-43b88a88baamr8337146f8f.30.1774488488352;
        Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:32 +0000
Subject: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/++z8oXlchbJP/1M16TqvlqfGF301jKf2r
 tvWAN5KfSmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OvDmD/9IeYsBBB79Uzcq2AiGxUn5frbN2yao4rM5EyI5w/zdWIwI8vVhpwVrKUTRnPJ1DrvcovQ
 fb6EwO+HedpbY8CYcPjKLFWRNxM8B9CymD0RJh/GyNimakpmkqsK/ZzjRW0qJyHLMwxzVcKBQgZ
 6STIheHOVMYoCqmuMWC5Q0yDrkia1uCszfyaARyX1V/ZNDwBQ8qX/bcl/g5hxuG+k8VQVzlVNhV
 NOH0xS6kyAALaVifjCjL8z/A8491mvPf4ml//sVj10+4pHu5QrkcQwIRXOvbJHmIjkyz+dGDkX/
 cyjqEiqPQK45U+k7Qwnn2ZwKVfkxiEvvmojLvfQECfFh49JvyPXTo6JvyYlKZ8o/6COYLD2IXAq
 /1uOuMxz/5YTuuZcL/G2jvgkAJl+dVSe+t61zL6HrtGp9dRxdA1/bjwuZ4YKjcI5pVBT8dINs86
 tPjzP5qu8CQWrvgpuuTOf9PGwr0KTMeBILGjMGsYhgI4Rf0+N5OZhoh70uXgU8V+ykJl6eDcTIO
 WH37pYR2LCzoLFH4pKeJmXT7umNMkx9tK009I5PkmZNwM+EhJuaOJQdoISyrEqSBfXhzFdYwdHC
 k7snsqE0XnDaEXLa0ZmLyJeJBkmf8NsFfsTzfwNZi+0N/5N+eoLzp8NVTv/fK9kAhf7NtD1cAHX
 dzKtZJFOLXIw6Jg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Use devm_of_platform_populate() to populate subs in the tree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..66ea057291f6d 100644
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
@@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.52.0

