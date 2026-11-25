Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578260;
	b=ypmVlunyffz/YNQLvfNlVPb3cwnwVpRxjriaq1mRXAzojgwy1j2/ywcXNIDvJiJcdZjn
	 7jbPKJpGAssjxZ0d3jbBRo0v3Qzt94Ikl+TV3It9j3j9slnfh7YcIqk5rAZSdBJ87I7rE
	 1KqOvYs4r46WQe1W6F7Q5aGBjmuvvKGTYUInsjiDTUIDGhmTlS5dkqux7SZPY2lBlyYvH
	 I68pu+T6YD6upf3NcXJW2/JsfajiR9pkWzyA8nO5eVVduwvXvXUk1GuPo835Hf5aj5hi2
	 xepc0kV9EAOhspNcKdJTFQp8xImc8jUfMw4txqrJb5od+a4nGjD5KB2QHP+YI49H+tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
	b=uoDraLoWlncryRZo1iXkrwkBC8fq+2fCbx8KHkTB1HyD0RiQcejT2iY50mzQeO7hx1uE
	 vCky9KPFQ3akQogKybm/v2iN41O76KHy3uaMappoTjTGtVHsijJeOA5exO7JxcvOqLHwS
	 ZEGocKFSgofN8sNIA2CS0EN0O3usxZ+Bba68iVB51Bcd6SxJQT2Qpdk6i+zXJAnEoh3/y
	 +WeeFaOLvgTlkcZmePjtfDxmzHnchZfNG8cfxa+KAzNyTGYPuewiqw7nV1brwCJ7cs9gB
	 cXxpy2ZVSMdG6Wjc+ESY3RvGuHTrvqi8Q1sDeVYTJcmXyTFub6rWJBCp/bHQihoMNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC0606A333
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DC0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48473765e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578259; x=1796183059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=laYSzHNNApvR6hkCfW91e7FyeGAkAKidR4abU+y7ghA8I/ig+rBp4IhezAN7BpYWH3
         f5Y7CPtN4xV7uJPIaE56Gva0Rp5GUYs5GwSqRjsJcJVv2f1+wmo29KWJzeu7eCxi6m3c
         9Au+o4hVYVaxhe0/Cel8skNSDR0POHCdew23VxzftD2vmyoJQvIikRA1VdEp4QXuCv/m
         hlsnWVQEES+Dp5ga9WZt8jZfea89OqfZ6LI28tB1H92eEcyOEQQHudx52eC5tBgRnRjh
         wIhDoX2puuAC+T+JmQLUJsdgugRJfZMB50IIm48HMGcA99AvePM/gHhJt3ufW5ZrcdLd
         r9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578259; x=1796183059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=NPWPwOn1hgarnSoeiam2fNWNdEQK3/a8IFtipeLgHIV5zU2xA8ANi3gPTWeWY4Jvyn
         bZDUCAeIAVp5sE/bdXH5Nj2QJaw9oHPMP/icepqgotZDkzkuyRP/J0IAfmeOYuRknGvV
         12cMy/5esce236fQ1ge8GwEGST47A6ChqDhudt52KLToihEyvzxiFJCyrSd1Ln3rFvoh
         gjncCbzsUylgkgApMbVRY9HJGdaqG+INfDHKKPHwqQTql7PbXRigXlTsbGhzwEYUUX5q
         Avm1JxTprY8MY5qfB38X/Xy1Jzat5QX0PfC5JNqSvOW9pwpCeZPf4FWDma0deQ7rtNTO
         hnCg==
X-Forwarded-Encrypted: i=1; AL+hErG403glP01k70ZPEcwmFHX8L8rW7YoESDAFik3L+0KYtrd7WQCH7fDTRw5fddSEnbE/a4E//hBg+/ZK@vger.kernel.org
X-Gm-Message-State: APuU4Z+UxsNVqOvnPnVARDeUZMbRN2JZ53Z/4EcWR9XksV3eSkjzq+F4
	4LVEJvYlmdTp76y8UUFHpAUMnawDW0p2SwYosjeOm/i6cvu3oUVxI6Td
X-Gm-Gg: AZFdTZfetrKRwuibWLwKnim6Qtkntfi0In0QLRTlWyuZdq57fJcQCtXeiRW2jyjY2WO
	MrKt3IM/TZe4Utznof7AQOEvdzO9l3sP0cKnU6mkU77CWg3JC1KiEpMn1mMG26S5JoZTTnbEklM
	NNHWniDh9tN4rg+8rAoygQBngKGX6wq05bxOP9T+QL2BsThqizUMtlQTtHrM42AESNAFbzMLat2
	TI/IrmklORYcudFtIEiKH0cEdfxKII/wuEzzdB3oBvJrG6xYlY1jPAMTDbP5+ZeOEwtg72hPgkR
	me8viX03wbtOpanEUjfV/4lrHJ5aElp1+8casNQ0sCp6jnndSLJmKAA68rG1KyuXNdkJfrBdudZ
	pV7tWVARNvPSCvQgqh3+UlHL57bap+iwkHrQfwaAteHvxinS0SAe6KdgcXKtoVlLqf1U1aS8spf
	0s5eBjRFnR78u3QxtmqdnIdmnR0U/CKgyQS7JFOz2uCzMLBct16PQNxl353DI9DL1JAsCSLAVnS
	DkBld97fZVyAsoG8xXhDviVRpyKwnqI2CrvlDTZE96A6YochE5M4qdSLcHgzbOgZ57WPO4J0xRe
	RdKBA1JLdCMecsW36nUvRX6TajiREZZSmVofkw==
X-Received: by 2002:a05:600c:b85:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb8892ca5amr333720795e9.24.1795578258707;
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:05 +0000
Subject: [PATCH v3 09/14] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261125-halliday-dts-v3-9-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=899;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Gu7LEPVBsHDlbEA7f0+bCh3HrNIpvCrq8874bMnEMyI=;
 b=LwuvM0V2lFpMa4PY9K99qzfFeTZgXvTT9zRsWf5xnLCKTkxZox/BBQLcveRV+2SwtDIXcUnAz
 dTyT3erZvMTCCtObEN8DKkAXoSDLM9Igo6aZR3InSklVdITD6tCjFp8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

