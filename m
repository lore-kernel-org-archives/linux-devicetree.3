Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368949;
	b=ybEhS6ejvSV6UK1jNpn7QNWebIiewaxOtjOo4tzR9XzAnRCTQW3W4Kts30yuNNJ22Kj0
	 ojdK0zLsLElgwS285BGL6QahZVIEMVfzb7FqzCeRCmGLX6iO9jquP5I6gSJxByaxKXevW
	 4A+nusiInjJBYumJSJlMi+iE4C04iSg0UyQ7vif3tuzT8KNKlLk8H7xaUjfNBPpxTtob3
	 pr1T2ER/kvzYKagl5oJzrBMrMnP4bxI5Swmil2DBWfKb1Fu0eiicwrvmmTuc2/P85AYxa
	 mOuXbOWsFjSSLc1ir4h9ZkUPjn6aoY4d6Gpk4O18mGBxY9iknF34lapM8RpR48emUrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
	b=H4uljKYivXFxQ06pnopLUEuW9IkOPpIph3C4ZOh3njRH0O8+PLUYSUbzN+af39jf23YE
	 gpeocA966nxqBmCcepuePxYvbFIQrHgcsyByMi0gjm9ferdzmi9PCOLTnS4oQnCu9Dp9D
	 uNMEzl04TUZfE+9t1Nm/1DkxRpfybBaz0mx2H5YU/1LA2BilDAnYtB39Oyoj18+V5RL+C
	 o9REOAts+b/saP3a57m4CeiCZxBS0LW8s4uww8Xe0wrdni/smBIPzXYXou6es7Hctjd4L
	 B5I3N2ZUmU+nPaLqwrpNS2YXJTSUTvJ4O5qkr0kzTe4iqnMp/By4kBtcGtd5q6cS6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDBD606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDBD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso547797c88.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368948; x=1795973748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=RUAGvOS424fngzXVXGnBDW25yR6ASDwqNP4nBG6P0RkE9ctSrz2XI5dWkla9yQdNRU
         8bc+GZlnNJmIL+GnPOD5i/FJh16cvhqcLYZIkG5s/IkqkrVNbUlWzbaclMWsw5QGc6Qd
         yT2/i3zW+d70nhhLwUMIP11m73mOojUYl0aXoDYXwtqEmJhKXxzb7ppUZSOP1TCZoMUa
         zFpsiJE8TN7BQ5GCwoYiz1+ILN3lGf1t4zBTybBd0aFdLHXrkrS6miH8A9n+WXnX9q1t
         tx+eDUcBs7EJU9tDABYma36Kjm9TPSCLgU1cAeRSx/G9t3CuwamMijnomdFYbGBUmUWH
         H6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368948; x=1795973748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=mOmAGn4HJt4DMV5OQH6F2zI8EK5VHfzskPWaELrjMPL0+mmbfeEAtWuz5tC7h3en6k
         HZNUWKIYmbeXDi2XTWpTj04VFJultz5SKzJnu8A5Lk4tYiWDSQSnO0cmwug9KQ0po/Fh
         cX/HkJe/LWAkN0+iTQl36bfEvr9JrfBdEpVPvqAkevOAJfNInAHbzgaoWzbJCGEJmv6s
         Lcz1wn/kQtzABPLbCpzCj3xjpQ65gNT5WMI83jye9GkwAlTtCUG1sCtVTQMcXbnySkie
         pV2HibSGSxjJQ/TiXXp9zqaNbRCoOIydoXp81epPM+d9Nvob5dykbHmLcdFlAcSMyeRO
         8glw==
X-Forwarded-Encrypted: i=1; AL+hErEEIRpspriXQcPzVo7/qqQ3MQRtm5eOVaHxla6klOfgW0+LOmq53qNhJcLQ1XA7LyFTzmWBLSnlY7Vp@vger.kernel.org
X-Gm-Message-State: APuU4Z9ds1QrU2l+9d9DlW1KMtofK5wLHuJKdoWQlp7HTMzu8/hXgneb
	xKgbwYCgC0Y3IIwhnvVS8GodioW6sGWZB4ihx+z9PPQOTPOGmIbgOxg0
X-Gm-Gg: AZFdTZf6/ODvOTf3dzXwXm4GJNYnkC1xhZZxxyyqZjdCOa2WiNGlM9g+Bcy4+4Ps91s
	iB/Qt10iep8Zh6vqadD1gmZuH0RqLTOesALNok1wvw6+JJ7A76Wt7xm+g+7r0pLKwaK3JDJ6HAg
	z+sxSCHzkNrHFTtGO1+1igpfkXdTkZz6101AqaApc0pHHJ0yZf3w86GjvCPquj/28H1MbzMCR0e
	vlKLjFRFfbDO+az1psEtF0IRDzCG4NgUDZ2KCIA14WYAQDVrCdf+WeDAGgi7m91F0nErvsPgh3e
	IX4dQg48FlYmnv7ws8rnOmVsae7e1OL6K9ZbmlnPtMTQxQOXG1jVU0yx3KPxsBB/PlVzPmh796B
	G2EdtxseCDsVq9VYcDtUcgVvXmKgPLlk64vkPnMS4Ox11dmR2TgJJPUC4UKGVVD4Y24rdv4UrgG
	TMV0unz1ISAx1BIaa8YOPR3M5GAfCN+luR6IVqWodF8KFlizGMC7aE6Sp/Sv5tQQNgpXGFMRFMn
	/9bqGAMzaZNJS1H2yNWEaiNALRl3KtYHYAnD6weBaIoC+3fy/ZFQsbJlPNarH+AWueqobymM3MT
	mPR9Joj2rYHeACPMeS2l/nctWFtG+3fL4qkvGXNt//lPeGWH90qIpgQBoNsnOip0mvZda8/vN9Y
	lqqVH53eeOizni0qMurk59Rn76+yERiEiYGfq5fnaVle+PSVOrEjP+7dybN+7Qf3TuIq7alU/sM
	z5InA2Dc06sHbFIHM3aB1Vdkb33g==
X-Received: by 2002:a05:7022:ed02:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b5568f335cmr9548851c88.24.1795368948100;
        Sun, 22 Nov 2026 09:35:48 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:47 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:49 +0530
Message-Id: <20261122173449.21009-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LPASS LPI gpio5 can mux EXT_MCLK1_C. Allow function = "ext_mclk1_c"
in the SC7280 LPASS LPI pinctrl binding so DT can select that mux
once the driver exposes it.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

