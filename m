Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661790;
	b=hZTGXx9GjK9LitVe1UyBqyibrx6h6ElNvrCAl/cN3VsqBSc/BFJnBQvzImMurzvJISjr
	 /yNfxeuGEFcE3JZDMNQbIvzhabvj8u+8gs0LbVLbFHhsMdKFg+OjS2BImVJudbZ49OfUO
	 w48nKR8lylsJYBPE4F0PY3X7xiBcAdIVJXRsJCg+QpXgx6Bcm68rPLNa9y5BolwWnzAGz
	 ijq9U9sWRKiq0yoXHa6HZ70TH2mjDRMHN8ku3bvNOtHhxps3vw3M5JsgklWQweM8tLFBb
	 /6H/73vWf38niIYwlVCBgV56tALofzT/nZRL9vR4l1mPENyWQJcWnGh7lJL04cp4ngQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
	b=l8LubQi17NPK2clVqJq1lKPhOgTv316fUGpJ0rEd1Q9Jx+KJ1AFhE4/NURPuL+U47RHv
	 5KcwZN3F3O1baviLCYfphDDLgKRBf4KEFIs3ZmIYnFoXFQHJezPAAav3VUNnkDmIIunvB
	 S1LvBg5cnG8cnZ4yx5BV8uJgXVYqmHTLwHv/hPp6WMIEZ7gw9PKKQCzd87qtoih92NOp4
	 yUv0KsOtyyoq95Z3wV5t8EMXhmnDGQ41Z68Tfu8EHJBwI0x1/oiPm2FAKOvZYQH102BFV
	 A0AGspfcSByQ+qs0d6fUCLeDqEFCGs0IiEw+SVr6heyqO2OUADG7jKPuxDWclviczaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9yeTlAh;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB860A2625
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBB860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9yeTlAh
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1719835e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661788; x=1793266588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
        b=H9yeTlAhmisCua6DzWdD41f+GW8SU8mecq4vo8AnQAqO9/Px8uwM5dHew5UGa+Cz6j
         RWzmpG2LkyDXIlpWtNhuv5iJtPwn9AQgCCIga5QB6OuHBfuhrAEiScykJPjrkRusldX6
         dOtYH4sPpxHj6ij3mdz/187XGF8mx11uti7jd9fyHW3fxmoe2SL0nDVkKOdlCeyp6+rN
         ndCvEs3YnWwup07xVLhPl8n71TJyVnsZZWEJr1c18Vc7OOJXv0aUCbMCC14wyE+m90Yw
         ge+RxBCc0KuVWOaeGgOSO0sUr0hM3OMX4rXpr7HoyVYMW/Un1s4YZKewf3HFUWiBvelN
         1OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661788; x=1793266588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
        b=wFQFw3Ydahc4FOElo9cNdFR9pQsCJo0dSepiRCPwtxKl20Y37VgnIPuDHG2TDJDa0b
         SgjXgkQ5DKwGIlr1/rUpnh8SAPHI3rotfkpKielNtrSwb6dARMd0giAfRFpzMH47IBiZ
         Hyjd24AoIqMxDkmL8ZhOAsvngu6tWAD9zr4BQLmSglwiO1h8UuhVmSeXEqoaJMr8WMkZ
         oHliEK1OlFXPM5lC9RXISYlYvFEVmvC0NoCOV+mP/rwvLO6NLmEqd/JL7iwDLyYVHt2f
         GyRY1U3HbxzqAI3+aASXPXIRKY9t9+EENiRjnyLSA+MR7mn+RzPO5CbGiJRhmSCGQcX8
         Vwfg==
X-Forwarded-Encrypted: i=1; AKwUvBy0Kk1gkgaKH95iYP8XaHZ7uoPnm9zNyz4otlbqo0BRREtAMpv+WddXlYDm4Y9aKCXb+ki20l/FHBYo@vger.kernel.org
X-Gm-Message-State: AFq9FYJpkNlqpE4S2P4c8gmq86PLIWgggB8wyVXC8+cAtDIiVDiZ2NLk
	IUeczigflokvx4LeKRPfJ0RZW2owyoSeKbZRqwbNlO92EAegzU72rgDbZpboiZudcZk=
X-Gm-Gg: AYBFou1INfZ0+2RxIwgX5bHtM13ob5foe/R3zwhUiogC1v1fmnzr7tGsiH6Hwx6seAI
	Vd4JXamFJg+INSgw/rnyYQbMnVIyA0lwURr9k4E/kZLeUafTdk0w/CZGH5hWawOsb7M00FUfAWN
	fl+SB2uBpyd3vYpfa1aykq2tUV8m/9X1e5BDAD8ZnMbNvPpnCyoKOVeXv73kQkjTCtm5r0fJ7vN
	LYzErlQ7m4xBURYaY2L4zL1JFWXqODwzkfyup9Y+0D9I3GStIPBF3yQEVqBoe7NMDj5m8MOw71b
	Tp5Dgojb+XEe/3zIgnX9Togzkc2tjXwlx6ExrdcBewMtJzGLDEuD12FwW4kezvZQiWN5KYCDZFw
	tbSv9LwZNDFCZDh3q7uHPY96XRLZ7gjZFJXLVQSIjerRT8Ol+MIHqEDJuwMlvuYSV31HAUMRpRP
	cKJeU+H/w/xV49CBg5x2Z6twI5UdNKSJQX0YvMGRlR7DGflU6cm9Onlh6qufiUebiPRRzQjpBct
	eQGtcT7L0otoVLYSR5cN81XpEudGFASjNcmtjOVp0Qdnhz+BKqok37oYhw8VGAESy9lrII=
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr101703615e9.12.1792661788000;
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:24 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Vzm3fMq8aK+Ti8sUZ/4U0hRCLJJYQ9le4GA01KYf05Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkXfSz6pon40QvPlwPcCqOBNsGmIGdye8IN80bT
 v/jWoNqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFwAKCRB33NvayMhJ0Xn+D/
 9H8I7lfUORQxWJ+UfKeeMvM22W6dCz3bOszJL49C8ZmKtetMpLDbp5xtbr6XPkv14s5pMC+G1p5y+/
 TA8pb6E/i5FhS8JXXDRlsZOxhz5kHxpYAV70R03L5s/DLr+2i2Nhn7bFfx9lwRrhV2rhmcBL3qsBF8
 FpIrGfBwQe68aH5bpHIo2yBDRWNpvEEivV6/KcBsIbs5lEaLO24Y81bgy7fwxFtFar6xA6I47mXsb8
 bDkKawZhYvkOqW+flyFsbT8mcz0axUI4K8h6I8iD5KM2R5tEPGAeQ1dAQSrr4VOhAuPi1igMgXamow
 u+HK5SSg9eD5obIvt6dNk5Gs4zodPg6QANj4B2xgFU/Ne/F5Ancye8aYBG0PcHeOMS8iLHkPAjmLxa
 +AzMBvxXnoKBMK8BFP9P/nqvO0xXek1HJyK9chgBT93NWKGTQznPcVFM3xcr3FBQtrBnNk0bYBqlN8
 J8DpSYMiuPEOrrKsiMzqO9N1g/tJAn9rPpUpHpBAGEn2nYRaJyr93Z8Sc16A6NwNT/w7YjjCYP8F1A
 j1+obPRPwreIZCgGB3XNzMXkmRT5uhMKkInLNMXPY4kkYOpdvkZS9HuMvxuTGKes2GasY1K76Lrpfe
 0V2FneMUZ8NAtyUaBCCQlVqdermwR1M+RDscJTqoNR3FMikFHt6QSMqgXNNQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eba989e6766b..9e603ddebd72 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -234,6 +234,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.34.1

