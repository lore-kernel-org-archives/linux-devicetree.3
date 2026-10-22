Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661788;
	b=qLZzYpWb6IhZIvqz0QfHVGu3tZSFl5lR99J2pS558MHOl/+C9mVYnM1gQiJ/TgdOF3t4
	 DtCcvuKOlJQKMWN0kVtS7UaaghLs+NYmZ46yjnU1GUJBaSLI6nWcFwS0NRS2GN6YK+a3L
	 nOdcR4EdZIa3zyAsjwb12qSPnudIcUpF3YA8f52BBDzusZ9sb0Vm+hArUWjoAVkeQwQt+
	 72hJizkGWtU2qmGSmIiSkTqw2beTIR0iCvh9DXX9z1MVC+BL2KqIW7GG+XQA2cRgiK5HX
	 6TG1K6jAIv3r5T3m2V5bYYSRZeSnl+A/Ci/cSi+BqthrhqzPt4ZzJoZKgZHE+f+lFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
	b=y6htCc4uQ/w5DM3u+s183sVW9E/dG1x9lbaJB+ze0uO2QslOwAgCJO2UpHZyS5r+NfxZ
	 h29h3MMF06lm8qVxGLbw7YSpvY29KAJTFNUutT6HkzwHsHfDCvViBWgQOGVqARO3fC5hN
	 FqIcmov+UWc2O/g1sBYEjJQ8EP6HKLBGigivnVzu3AYPCZB6epK3dtH8DaOxN5BPCE0Gl
	 kuz1pZeACs8fEd3cQt1Zzf4rVXpnIrC7h6LcW6Z2fQ92L1zni54mP+09Fq8i6+7Y2vsLh
	 GYHHQa0/H9HM/c1hGiHz9MGT8Zi/0ehAJCnuc0FeQL430apY5zuAkDxVfPrpg+By0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6Gc3KKg;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B2606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6Gc3KKg
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2374925e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661786; x=1793266586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
        b=Z6Gc3KKg/oYAyfA63MIOzEmNGfHOAR/1Lhci/ackt8SRuDfk37Desc6os+fkBrryV3
         PvczyzJSWYBJR/mEJoMbQxyt+Tln0KuEh8sThqbaEgH3N2S76Sn25SUQZ13IGWROgA35
         aTQFIF7OL5X77aIAec39hFln9l8ZOo0lm8qYzCTkznWspomG7pZcdMu+E3as7mjukHky
         n60co3jOknhHrKl0cYCHYyDGYCvhCFUJq5fuImDk2m33wdz5/hI9mjD9Hru3ddzT9xFh
         R9pPXKtydSMY9Nr1u6EBS8Nn1YuxroQOkoks/GrhxbI5wyRKPARcifwiHG5VnKLr420S
         yp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661786; x=1793266586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
        b=X8QtSaFG/ihrGJc4KSgAJqixXrtIuEF6EL0rU+R6OBTKGGqNTTHt2LgbnvcVHunocy
         ewBFhRauY1HZkNij+Hhcy+eTqnyZK10T4ZnabS9rzVkbY3dqrsa19HZSozFtSXML8N9r
         ybY/XmwCpk+kQCFEvbzXXV0Ma72YXRN2rHl17m49yvYKuoKlQNUHxezKIyqAG67IJovm
         gu4wQ7uOcaMpdrI3C+zJYhJXAF0Rk4plVp5Ofx3mdIafZLKSO3Bxcy2f++r4U3RiNs7H
         4avST4ppMl3rA22R8YviZqOK+rcPrChyNksvKTZIWaMWTK4VteR5E/lkvLZGHlnOXipD
         mI+g==
X-Forwarded-Encrypted: i=1; AKwUvBwNG1WwtIZpE3eYn7RZRm+PKPqat3Y7k38woSTQ3Ok4Cb7fYnutEe3sNIEHLv4E4LuvChWu2CVYEQWU@vger.kernel.org
X-Gm-Message-State: AFq9FYKo+Jgj6wlLSxyWZJhr9Lo2S7xKy5BzT15/JBsKrvt6EgmpknvN
	G5ax2w5V/N+giVTM7dbm0g8dkCC5MX+GcwFO0nh3hZ73zPOAa50meLNJE+bSRD5FKFs=
X-Gm-Gg: AYBFou0/qv7tIncBjY5j6h0oL/N/n9B14KtmRXOAn6SWs4l4Hx5pY+y7tO8aFNS9YNX
	6/TQ+KUHPkz3CDyXI1njxNn+aP1z/yutpEy0GsKtbJ8mS4VNy1Kqy7JKJ5MzfPph0EymTHwuUOh
	SpJpXTZ9BIzmvgSRA5G+9o24fngG/6qsFLJWkEvWmRd4xWkA6EPen0CqENi4/y24Kr+FsHWyyoR
	VxDy6NcKj+92gNmjfMclGYYl4d20Uv6IcK9kQeWsmYA6NL+osCPtk75hGLZhjX8f/FhY0TNyKvg
	/SKwqwymN7qd/+HP9pvGdY5d+UngFWiKjI8G+Nl4Lx8wG7HcCJrIK2BjRFzMtVQBZ1IAQGQXQlp
	XmqLiTUvnRtJhBfLXrBT/08rGoDGdvFpG4hQE5lISYqrNme+vKGyD6hJmiJLPB+78q00RI1i+5P
	g0TKXsIxyxEBdm6GNH9FmriFyfbAnwGlBO+jr5cxfcsS+n8j2IeNkas3TMa0bMTQHivWcQCr/fb
	rD2ZZD5Obj3ydqudzyOdhfzJ7LGI4mBJCsqDrJsKT/4ccB94SFI60NEHIPLubUy1OGXcOSl
X-Received: by 2002:a05:600c:1385:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a204baec93mr38224445e9.14.1792661785913;
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:21 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UWXXuzC/enK1xjhdLzN2w+vJuBnYK+K3pjEzgf3HLbs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkWO2ra7tqkUJAk5fYcrGA26r8irPaElpk1AkSB
 UoAXgfqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFgAKCRB33NvayMhJ0doOD/
 wLPt3RnWZv6Re51uWRfnacz4vZKAixI2yIt0Z61uZDMmMHZLbOWYQ5NFQVisQdk7m0kH8O004YdkUB
 F7CRSZ8TX157lgh1EwhR9iE0SeSf0fCYGqk47G4iEr4wdQV8Xw/qpmqjW1YtP1gcK2SCtplbLcYGgR
 3VssKsOv/n58OUJOfoNmBuPbNd33ZUF5ONpVuIVl1c8km65mGgXlZY8Dv+j12p1A00DsXlIYn/0d0r
 HDQVCt8t2CtOHcMUU7/QbRPcTHv0AShhjJYC6xjFWqsF+pKMcI9q1rUZ81Cmm5h+jSKeJXx1MjVSjX
 /b6Inrs6ELdCuZt4TKJp2lvM4EPWV64mZdJmGBZ8GL/2iiMWkeklLbkTPEV6lZPXae6LrBRZj7Ncf8
 8sCesuWb6BJzlezlBoKBt9+owNX8r+1e9qj9QtnuKLSSiNqrJvzpzJxRT1v2tCgTT1InbqcmiblKOt
 bd/4/LHB9FiIar2tJzoLAntQVKM5N1jlTkoTIqCRJioYuLuRLc9hiLlvDp0fEbC3vCS+vD06TriBfg
 7/nkGWRlh2ew+6N/u9MxT1xvetLK9sO6cg+mMGEHLHFHHoZoy2Ru4ImEI8Nhg3T4vUm1XMxkqA6vde
 146K/0zTO5QCJ7nGOiA63WTHtaPnG4Mjs+50OLjxpxOePrfLgIT6j8Fnko8w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9b55d17869b4..00dc873d91c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1113,6 +1113,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	dp-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {

-- 
2.34.1

