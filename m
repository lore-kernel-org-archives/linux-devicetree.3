Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184492;
	b=Uitu7x+zCb9IA03lJD0JUUm0hf1fhzj8WTtDVRNWqp/tqRRtcMOAEqmxRCgAJznEEBKc
	 9JO9XIbv6wWQ6Y+MqLTSNYP14GLV1l4ql9z79P2jG1dlH0EOmb8VSEi7m/KoXiwSRd6C1
	 s2ZLf84kGiWA1dUK/ZLCmMMtia9jc+WITRUg2mlcwVjg+Bap36qoFDQ32CHvkjL3HkoTV
	 kizKw2HGuu3SMuN/T7LBgU1TXANV9VeeatKe2RlpOSbvLHib8LjkOsUgNrvvDOfWoSMtj
	 UGWs8xiRNjXO3Vzb88hPcs6amz1HjVSgRcHPNbUQbeaNqAZ2KRbB5rOtftxz4ogQMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
	b=U9/FU7QnzR0zB6zSAc+5eDDpdcWGqU7HGShzoqxQ9kbd3wR/cZwIfiJ5Nqf+agd6Ieyk
	 DqFIPzAzNW7L66rmSfpspy7CjYiUNdujzfRj1xWOPkGAvJ2GdqmxvZRln3+EyznCsolI+
	 UOeBUwRXfLk2ua+wZSS+C7KCQ7mdfWPv2iDBES8tefnGMu90iCDTA2yGJVzR3kQg7rdIp
	 YFop7dMFyAnq4/Yd+vhpliBpiR/4C8RlgIg3kFP6rTUeJO1XF+bmEpsH+MUdLsGonh5fP
	 C7xB8s6cZdLja9jN9Vgd9y5AznevjZGcwf4J254iPHlrC/Cs8ccu3GK/4LG5JBMg6Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E5B60A3802
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E5B60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1969935e9.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184490; x=1794789290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=E4mD95aN6utgtguVmche9wruQufBYUmPr7se0FjMNh58DsSqVSMujoYr0keBmRpW8v
         uWQWheuyiSWXxKez1vN9DHsvkz3dIxygT3PejUT5UR97F27EKdO7WTr8MwR/DYX5j7If
         J5n5+NU+o62GTMTKrKJF4U0oIX+yriKVSodOXqH3bAcyiqaL4rHDO9eNXyjje0tgioF3
         kJjFsybCFmRigW6JjznYVc4hYOd89F4ZaDco6gDgRFm/z6xDqoQPjP4mGVKFK2BAHaN1
         NUR9o08rR/2JzDfKTWO51s5/9EiaI8Jvltmy1OQJ6WmNNyfpZkFqT0xbMVSgVs34YbYY
         WCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184490; x=1794789290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=Ibh89svJyoz5W5Vc1KbLtpEUQAsXd2ozPbTIAGs0F3TwkwIv8U6KiNykynNXKFFIwU
         eVdOnzN7KvDU8a2BC5xOPxOFRdqCEuVTV4GcMbf86oAsAlOXeKlL7IYJvlwmKbuU5ENd
         bbVC636OLioBuhkg3i5Eimw0Vhmg2H0I5SYNszGbj2hc3suOxKpczF4/HSu6giGrSuY1
         +h4jg9fygnqItsEfUSqmpmCYYRZLOOITf8r+iWoza/I9/xfDQxYo5tJ3UmsH6A+RqYu5
         QhnzshBNW2JhkNsPcGJPWXLkB0MRU70ZZ3By7B35K5b7rUVjSpS2Oje+CQBB9jj4r+HX
         n9LA==
X-Forwarded-Encrypted: i=1; AL+hErGX89SGlET9BktMm2dwRZQg16HF0zmtrnfX5HXhocnqa/+zzgpTSViW2q628xIbS11bzuqYoV41FOh1@vger.kernel.org
X-Gm-Message-State: APuU4Z/exMq6yyQRy7fF7wYS89QEKyDqSCkNAgkRT4jWd8yeoSeJFPHa
	sPBKiB5buzFjphr5WPbpOLwg21FNBrUuNj18NtZkyXDW4VE6lEucJ8b3
X-Gm-Gg: AYBFou21MgHIhLZYpdYmxXGpKl7odVzKBDMDBpQIh9s+KTB7+nDrnHinCWUBxlG932t
	8khzPhKRKZ2xkVZGainSaUTQgLQl7k0CfyGflXYsPFgrbs4rJcES6a9Ozb42lX0l/o6KImn/+7g
	pKAv95ZWb8yT2xlWAf7adKgJzSEuqLSeBGasfdufJyhz6ICBiPXTPWrqtU4nEC81iy0+eccJHLE
	DsetEwWjjfzLA7CtL/uEi43QLa4LNNcn0fsMNqVLnPlHM7sBkJvnmIapnoW2lMbpwGAP8RIupU7
	mxML+aXlQMn7ptDRv6Y9HjUKalwD/k11LX/AzGg0qsUafoqkT8n8QkDuPeFT8Wz23twx+G4vpqp
	hEbQiQPYMVxIZrKjkny4Tzguptd2hmhykFjgXyBwf+JQYjV0gc8/D0AtgBXTdd+vaurfb9W72HV
	CLAE43N2Sxooq58laNHn8bki68D+31gWdEvvLidWzaktf2kxQhL2Taswl8NtL7DKCHxeBuZEGe4
	JWOzf+zlNUSzApyra3hRdOj491tSDYiC+NbMYlCL7lMSqGHC6T3YwE0cgrm4hokVSHAQhauVFKh
	IV4ntQuwn9DXr0zGRqb2b9zZ4hDlSV3+OYwb1Qax
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr111833455e9.7.1794184490117;
        Sun, 08 Nov 2026 16:34:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:27 +0000
Subject: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=822;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=GR/L35KkjRTQHIwoej6N0ZVQiPJDeokJdA0dH1/xcVk=;
 b=+pMC0hU92qIlScFgbvyLG0yeciXJR70jYMcQsgbMkAruvtq441EcqoAR24w8+H8PddfDvxdW7
 NeEMu0FiaHdAmbbpArcsFtCmr29OynUnIXhIC1Struq0XQSLzW/yMcu
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b96ee339956d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,11 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

