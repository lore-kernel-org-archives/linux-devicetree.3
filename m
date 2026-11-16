Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807298;
	b=zn7+eTszGltug8YMPfJ/5S0F0TJ/UKgmyEorvvU+Hihp9ONQAjn9nE4J0MGH/SkzxdRD
	 O4bwy/SqPGkEnAhdcIruDW2dMmBORSqvUCWqWJ9VvzoGf3Fpy5hPy3JnikEG+iSkjzo99
	 +h2cfMgYVctlRu/hWmU8wyqGIz16PXp+7RHZqLIrgyOAYD3NgHvuwunnpj1WUK7Yu6Y7s
	 VhOcyQejFFyZJ7kwI73o2S6PvKaJQwHDutxDq1HOsbFA3jww9cF9cZbJr8TmWvfisTrJe
	 vWBXFAFGvh4I6CKfH02RnBvE2Np8QuHYwUb0HcdUobPDS1P1ePG65jOdHxJZN09r5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=R9/U5AyirPfRGshpY/cagtExea0G15MCDAnx55QUEWR3k8VI68rVYBA2D/ob3bCCd4YP
	 pQVj6MQcr2116fEy9mKjpnnEtMP9WvQ4+N4ECpSNKU0HTRWQ/BB4XIaE6dApPFrtnH5JL
	 mXkqHdea/pBiYSEcloa+j8gZMvZ+MxfjZioN+N0Ps1L4D7fxfsqas0oO7jy9bmo5GCu+F
	 lCiWSTMhKnsvIjuWbrDafW5AhP6lYY6/xDaxLSzooNoWS8DX3hlY0WawDQn+xi4EWjhOR
	 aAF+yKs8YeX4KcuqNdjgkJwe0Rn/Lor2d431zExje6iHMC104CpXjRT0sKZE8UBLZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F5606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3331112c88.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807297; x=1795412097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=QgEkfLmMhlXHSaXrEB0rI647/8WJYtvt3ZL7nLXeWKGpzH0ChM+Z2sLkznM6o6l77U
         cIn902Q1pBIMkZPFitNjrvZuw2QwqYqnlmtddITPWhfX9HKYLiTY/EqF8a1ToeGRPZcB
         s33PjUoWn8gqONynWBg4d05aZfkRhr6A6OfcR4yq4Q9L5UioKsKqwiZ60DU0/NgroA9q
         Sdu6OPgMFF70Hmv4Z1JO/Oi5zKNhANjV3I13rE0DxZuZ1yZTPpJxVN6wi7PXPUgW4R20
         YfSMgCxfexW66Qe3CuXnLFZFGR4rdRAcHiTw0YZXvFj4s2s2djNDKAJil/XHvo1RLoAf
         4cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807297; x=1795412097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=y4Xxn626Sdmoz6VTlTXQtw5AM5AFe3ohjLwadHOcFWiCftGBoR2Etguy9u91jKaVrA
         mUY4rOJXiUcBU0cXje4tn7T+EEQ6m5qW39gONVKx0gqLFLwXPDGk+IR99Tq43YeMAYbO
         cKua3XzPe8i3GOc6k0o9GvZJoUBh30FDEQH0oBMnaf5SNMxBLSIwDSY23+RfBup+eJ2I
         KmdNu+6SAerY7jV+kqyOndTBag7H7EvFpfWAAix3OrI2ZUhdZZEZbcyt2LbDo9rN8bj+
         PJut+zfGZL4e1kQ9K3zkDlqJOlgpfWZCpjYG6AD7wiV283N+bdkY92jpZ2ASr/cdYrIl
         Koyw==
X-Forwarded-Encrypted: i=1; AL+hErEbeRjR134rbrgXK2P7S9i3wDUAK+e8Y96hgw4ECJhFafau5PTSZCXlWvwjGP2RrrIFnhUV9VlNuJ2t@vger.kernel.org
X-Gm-Message-State: APuU4Z9wmu48qFwRcSbNGbrOlaMxEA+3tTBbubN+BPPe8BkGcRSBqCwc
	6GOR57E0ArPnlJHGVnYHYf6zj5RRyGYH5Ftz+vp9oTOKp8MCL1QElZ2s
X-Gm-Gg: AYBFou1nRsctvXszxD8ohnhEsCdDBjwl8UfoF2XaLQszOwxR1luuhTbe9FJTKKSj8XV
	XGOMKTAcOuqOZfxHEVlIrrNRMQ6pC6uXMsS4G7Lgeaf55Wv1JVBrdwGEMdDZljp8Hu4c/Li+I9K
	YM3xyQtH3Inb9yKV02zudkPIIn6/MbyWPxiM0nPDA967xhByLKjcU1+Kwh84/4xa02Q4M2BH3ab
	Y808zLTSlHdI1n2e8wzP/04SdeBNprqskG1p9qaUBgPUSyIWWsSvwvnExZCvCS+/qrb+3Kre4K2
	a5nH/3a/D7aGTzwCW8XR5WWFNjZXArs4Fq9XbcOE8HMyrlgSMlencsnbpCkX96jH4gey+MtrBTF
	cxCvgeJHLAQoYu88bTsSud7Lc6HWDpVLhO9DEbHZ23brLrSZpsOYYkemk/w6PO9HbYiMNh5rQHE
	Oe9O7JKumxFMSd4pyPTahf6tbafvBgSWeMnEFhLk/fiKmjBGzcOq1pM1hHt/RCP1aezqwt11HSg
	crTf2Yo6CNgbVE9TkKpct81tD/uS7CKmM3KPko9CDScoGCblmE0jG8oTil/pnxapI2FQWV6kIoN
	sEtan7fQDMNGNVreD1APzd0NPErVDdZc1fDIWs7yfrYp/AYGhYmvxINtl+p87AaW6wm2OMKdTTv
	NjHKK
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr6979275c88.18.1794807297153;
        Sun, 15 Nov 2026 21:34:57 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:56 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:50 +0000
Subject: [PATCH v15 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261116-sm7250-v15-6-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=+oPS+u7aNVKFGbhmW2mW9YMFYA8wj0VjuFaEEsNN19MH2mpLFA9LeS7/pYH3W5tSsVCAi+/dP
 DVlXk6/wjvhD/uXpn/EzjI8ASaJBL7/qCvU3NQ3e7f8GcDRtdKMByIM
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

