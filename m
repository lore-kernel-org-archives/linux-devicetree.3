Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540469;
	b=S9w36aP0MPZCsErVM2CguxmmZVb73enFrWs4OhCCG/5JeJs6lgoZu86lNKXwWAU2yFk+
	 j4UGZ0iPIHVQUZihRpi3Nv4ra4pnf+wuZ3m9i0LslDgP/82qcZPSCJI5rPkSqqe8LNbHf
	 6MuXmUe/tfNQEL/n/vdDQdFikdy6e1F1Wi1RhHj4w2H4z2pQTyUICFfElRARrSdWr7miC
	 c/ZOsTZtjTFvvFVFnyxICZoW0wv/UmKzn/KWcO+hN7qDR6tZhGYFVkV/QoPvQKTlX0IDG
	 08Y3AZD68K4ceHtBYf3z5E/KLxUe29HF13usL31p5tdCvdu7+3Do3yEvY6U3oafDbYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
	b=xyu2KpDukgrw7frbLkOewdYRQp0h6b5QlxI85u9MpUX3P94ja2mYse0ZmaMighD0xlFk
	 OL0xx+3UgY08hpEniQtPnkV1/cPQnWiH7xQZW1XP0PC++WVHuctnqrGB/jIBd9MhemBHA
	 eodGFWCn79M7QUvwrmMY+aNeHx1NrV7HWZHevpIQGtPDMy5zyUGGXjH5l2aXjjl76pvNF
	 iUHMwickgG6mmeIuGwaUQXymQ3mr+vUaKR/t2Nn5DtywHA5M7t+Uiq4jIMuYQ/G1GCJF/
	 6qqiih1OFyi/dvyzOhqNdUpAcwTNlHDt4IF0GopVEbqGu78Gy+dmN+b1+urgBwhKxHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D00ym1I7;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8616B606A339
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8616B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D00ym1I7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so62255215e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540467; x=1796145267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
        b=D00ym1I7Iw5XfnvfRQUKkpupVs8+8YMvhyMCTzyJV7NiRAWVFYMKK0JBKfQJaoe4di
         VZZ9KHoCv6a6i1AiEcnkxsrvUgL8JBGa63ig99AFzvREh+ohOxwg9aqUW7LHHKTJ45Ri
         ZnA9e9GatxLDOQilXj7aTUJZhRAYXXDfc2YQ42i0Kl3jFe9lvVL+x8XN88/UysKb/8+u
         9H6ECwmltpMgweeCiezCMnymMxEZPqsm4rgP4LgPtRv65JlTgeflaA078R2xx4b4dGjn
         I0WMkOkNOqbgrKf6NaMAKTOOJieSwpGQHYK45i0kqcHmxsZDdHtSSnAtyW7+G+kPtIiT
         1Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540467; x=1796145267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
        b=m6gIUgPvvOXz1anBwt/jrwbFM+p9E85bzpQaG5ixXygj4EWV5sLN2XC+5MyVLUiScy
         EfUli4G+3v1Oc8s7xMLA958sMrhumRdwgrdiIz+MXSeDzCTXNG375Tb+Vi5nfCHPKBW1
         OqcWlBHtaWYhe9Q6i2OwGqB5nTP/xm9dy6dzFOPhLKXHhrTw2IBTw/5zmPlOvecCRJZ0
         cEt9vNMx9yDOz4+CIaCA2AxXMkuKP8D6iz5ay2onJR1GH9ld+ventrlvDCXUhILhYuc+
         uQRV8cV2zJ01WGEg/tjZ9aJUR9trXt2n7mue0jbl4DWzMZI7OF9dBa7NKqZbCkrVjq9/
         vang==
X-Forwarded-Encrypted: i=1; AL+hErFMJHH0vbjt2GGkRXdvSTendoWYNgtpST5e4gJ7aRuLxWHepkFRco8ULd8CWcQ9fgy6Za/7lbkMLzG6@vger.kernel.org
X-Gm-Message-State: APuU4Z81IatHExd4ciNP0AxMQPKnlM+AJ6ayiE9oV9f12sEodVMrVAPx
	2Yh0Zj+K8mM275btXqfNXxTkuILFU516JgM4CJd8NN3skM+e3FhJ0YLV7QnDZoRzR38=
X-Gm-Gg: AZFdTZePXh5cZtFXnrYswhM7HgjKkGmUrMoou9nsmIO32A+N7Cni6x4m32DTBG+c7Ow
	Uv5ke85AU3eUgQAeCMJ1NLA7c7H3MBlHQteHsnlyAZajrtUvYTXvbyWNxtJTQV+yZXRAHsx6GV8
	sN0Uhjs8kY4gYP73JWY1HpFt+UwFiHx+7VFpEOjgImuCW6o5IOCsgi7H1K9UjFErAo+ESMgqodI
	u1zMVabMHm5k3L/zs6n11AVLZcCZH348fa2d5iHSH4KEpMzLDEx6xoaQ76WizDXScNayJvmwn5X
	Nht3WjDpBWU5saZmgSU+J4Jmk/SUg0e2z+SI/zzCej1EPeBY90926sRGORBhtcKDT9e4mL28geT
	5o1cMYrUlQOtNXEYa8VW5hYo3RhT38d28KDoqbNSnoTknjR+gC/TwO4W6Zj2T0SbAfbB1akyBu/
	e85omTU1HuW8b7rXNgqT0ffR510k6E0IQy+OkfdYbf2TbdfV6wII+cI/lMXe//dwOcabXRSQKC9
	l79Z1qFoACzZUG18AN7AfG1+Pa4u5wCpmjB/NvlxxKgQ6wZFlpanpLlgT2aH32FJyJCtSaGfli3
	eZVvjNeb3vSdVzVWSxBicdio5pPWfsddqzCJWqfEeDwSDHW/t0s=
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr313362825e9.13.1795540466734;
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:14:23 +0100
Subject: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: attach all the power
 domains
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
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-2-fd05c8378a08@linaro.org>
References: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zmp4vn3X04bE7pD2IGrBeIQaELOOnUf0zlQOX83mFQU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXwjyCRaJ71OOMWY4Xx1GfsWkuRB7/GrEe7XVSM
 sJEaeuKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF8AAKCRB33NvayMhJ0dvcD/
 9A1aQZD0JS763OWx3fJkPF8CIKL945NiiVR8LJHeEwlJqSzCTo2dECbH+UVpZFAv1CULWOJYPW9BmF
 /2qUz60Cdzd51XF/+gfsQYylToyLDQ0Vdf5Ydfyh9TOLF8TcBh7lWr2Gedat2xtQB+IpHWsNjOJesB
 bVxuyrkKs/5HAfoyfDi8gABtoMfxgI4SzpT6bFMbP+EzsWfyu3y44h9GSPLdc4I3cSlHVBeoMlu7OJ
 rH1mfyxR9uDOVysVK0B/nSKW7gs/jvbmv0XFqOJytZJ/qBbx6mnjFpqB/AI7Y1jfM2DtzRtrs7O46X
 HbKtt80de57a2mpYcjEoNSMeW31f5qYkBpWTYblgTgRXI3OrN5L6Nlc5r8VIWFk7zV8ent0szWx40w
 wy/SKlFLxPQDd56rqjnPhYy9JT0gB8/KvX32DClvrAsLRHzClp8huT7SSiWlrR5vKcPVLdYAaQQq5E
 C6r7rZgRFceGjVIYfboEG8ffMF1ZTCOoKE1KF/3Jhs2ku+vrvVT7+MsMINe4ASwqfmHK5ri4+Hv3Jy
 EEIv/pRQ8UhbVQy+s8B3OnIZf+qZPvcett6nXhN0Yp38eoPgiSiNXv3fi2S9EzNqArEvq1z56+vlok
 psIz91UGoOmzv44qDie603sPF8/TnXiYxwmJv3MU2n7q9KKLIPcHblb96XbA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the LPASS TLMM
block lies in the LPASS core and audio power domains, but the
driver core won't attach a device to multiple power domains.

Attach all the power domains with devm_pm_domain_attach_list() so
they get powered on when the TLMM registers are accessed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 02f678fa75b1..1b1d0f4bddb5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
@@ -37,6 +38,7 @@ struct lpi_pinctrl {
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
 	const struct lpi_pinctrl_variant_data *data;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
@@ -543,6 +545,13 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
+	/* Attach all the power domains when the LPASS is not handled by the ADSP */
+	if (!dev->pm_domain) {
+		ret = devm_pm_domain_attach_list(dev, NULL, &pctrl->pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to attach power domains\n");
+	}
+
 	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;

-- 
2.34.1

