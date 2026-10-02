Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D12456E18
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934340; cv=none; b=ATDAb7kliwylfDCpxqlhvHFtuaFLGXmMMy3xgKnHRjyyJwDaOMBMXN5uZ0BJkI13eiRqHAY8XwLF6EBed+kv8PJnA7h6DlhACqXtz5j9FAa9AHww8jwo33nHsm04/2jw09nuzcBKe5C5rWMLa0UABtw36ulpfvgNgJjy4FbG9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934340; c=relaxed/simple;
	bh=/e4orqd9ooo38fMCjozQMvU6+3FatBrm2ieDXdrYcoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWuXlgqdgNxCY/nCkF7QFgqgOD9rwnKXDX8HC8rfvxmrNgkJrYxjnVC+Lr99xgqUTJj+MamEWrIwuoznNiTEX2IwN2JoDTqks9EuzaYLf/gqvjjTKNwqUpzVDTmWdo1ct93nsuvceegNFpOh3/bv5e3b2hMM90avY+OIsG92E5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEsD6mN6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEsD6mN6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso3136115e9.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790934337; x=1791539137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXyCopQF/wJtpOFJwcicNfvyz+Xom9etFu/usBJbflc=;
        b=FEsD6mN6b4hoOsXKlWQWyKHoR5wT/Shlga4jqeACmIJlhlYFxlqH8/uQkF3MJwrNDH
         HdEKS3EOQx/2hdlIZKFMlkW1Mdeigtlu2EU7Hp4Xt2pCbHXzUts1oWATM3sIOS6fILf9
         6IWg2GTH1zBUeyqk88pAojmEd22p3k2b/c8Cyho0wQqHeM/WF9i0LWosU6rG7bAzSqGx
         qBWGhCdvGZNlvFJ8tVajq1fezwme00Rtdon1/JJ2m7sHmte2Ymp0KIQSmnsu5OeKhElV
         CQFaakzgWPYXIR+hyYzM77xpBMek6ikA0y1KYACk5qYh6O4w7XDqdwuH/Nudecqzxr6E
         oFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934337; x=1791539137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXyCopQF/wJtpOFJwcicNfvyz+Xom9etFu/usBJbflc=;
        b=qNc2Iwid7puYKMOcYX9/GSRpN5vuW/3CL8AEuUNCU0jTMwMIzZl3e/lN80bj2Yk/FY
         iNK7Mh7amE/W6SZw4aemJTnJpdJcuRTC2zUGsWdxYUo0aVGg9wK/wUyWJr906kSMZX/3
         ASKrPG7mOJJa06xb0YHdmr6aFprbZVe46v9x5K2wadReKJ18l1JXXjO9mUm1322qGOau
         bysiOCyoJ5yK7DKv8OwmDmwSCCM+XQLjnM8mByWo3AY+fQqbbn7vWzXhJltLorW2Eb9T
         2u17mMPmMVloZKdJ3yxMIQJYIZnLUzLEabpqYWOCmxHp5fkjN6vbHZJkRdW/1Htm8pHY
         w9/w==
X-Forwarded-Encrypted: i=1; AKwUvBxMU2S+oJIelQ3uY86juQze7XfZpWienD4OtLDAwdEMWTwx0HSiFOTXBn3LaoW6eEM8UbJ2cpB78O8a@vger.kernel.org
X-Gm-Message-State: AFuF++lUO28QYgwB9tvrJwU6TWNZrUDo3A3Oxm56LaqWZefJlSBWDOFB
	V2dge+eEq/eHJCe1O3kgT2jQldGLMvYS516JKvanUa/IDOvWfTnthgxC4Garc8RcmfU=
X-Gm-Gg: AYBFou3ikBPYJ/f67mHVDrz45wdrnX38JM3Rio9uWgGIaXzfPsiAEG5vuXvTnHoPbHE
	9nr+N+8/wVVy7VnXcwydO2kpQRKjOlUsa1XLcEEi3nH8/XI/CfDvQomMhtM2n4mph8xJK1yk6+L
	bLeqg2bdr78w/QrVoSck92nEJZowbCqI9DDabqAHV4jN2LGDx4buF1a67HxJguCTAq6ZUuadgDh
	aC6I2eYt6ClD5s8mL6+XdEmd4j403UMU03+oigDJGrPhUUeKCCFIJRX6r5PlYZ+KpXpd8uiqGWe
	vn7vJntLGjSR87e0/HeU3KL9GCCflPwOr6m8QWo2N/unj/VKfLSCWMgCat+qaDScLRcZkgOgs1c
	e5vOCaEhnfkawitvmES2OLOkiQtJ/gQRJC+zXD9CY/nbqIIGdFWyoz3ucEzKRA1cDXV63FQ2Ps5
	v9hKdHGLpayrFhn4jhJcxq+1GWyc7xDFpMX9Fb1sKwib4PNJzPC0nxBpEPTAmwDDHfFkqOFTajU
	rkCQlHgBerzQtLNsFM=
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr36113665e9.10.1790934336410;
        Fri, 02 Oct 2026 02:45:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm72705635e9.11.2026.10.02.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:45:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 02 Oct 2026 11:45:29 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/e4orqd9ooo38fMCjozQMvU6+3FatBrm2ieDXdrYcoY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqv308OwQAnZXSbRNTMIeapM4c7xy5yMn/SJ1QPHKS
 9tqeGFyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCar99PAAKCRB33NvayMhJ0afWD/
 49+j359tBNoaoTP2dpGyr7V2h1+V7ETZt/I9IbCy7h+K1zMBL2VEZcSzn+7AfuqRsBUMgbNq7qoNKa
 oUwM+iO1qsvnFXsJ9es56nD3FrjJs8TnQiFsflT70lje53mcuAjb5ZKuSyAHlLm/3y6Knyw4NG5+lE
 Z8jDNqxBhXi3Cre8TfyaA9eE1BE6FmuKLfW722xI475w+VldEx9KQYWcnLh454z4PKud3AzYoRO0TR
 7iRG3ela28g/qbAvCaASvv2KWDipb4fzlR52KAtIuIZx1kA6FxtC2zXfob2kMKaAISRDCtB3BYHOOv
 9TYQ6gHcrOInvr2HJJIBYKUBYDmMqSkVdHECnMYMpALqhwC+TE9PkAvhE/PT+uD6b5eSWv33XdosIx
 40oSkIrWxjTHW8ky3ByVIlHkG4MMOAau5jfje7ut/IUAEw5Adi2nAD9St3LYVHn30rSwvjfUEkUMXb
 /cJ7A6wMeH8jCckpLBpGlTx1BuuNN2FuWEGw8Pro+atfQ4k/kOYg5gr334hs0J00MX9F5YDgbhE72t
 b/UXew1dMOZBYl1WvjTl5LQr8zFQy+qUGvCP1qss7YpR0EqF2NPkbzeg7+pCpnANthYt6iA4gowY+4
 KEX2O+M5PgSqYzk8rmZwcMpvSaYTgMEpWblIrGTm4Di+dnVPffxyHKEBdD6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add a node for the watchdog on the SM8650 SoC, the node
is marked as reserved since on most platforms the Watchdog
is owned by the Gunyah Hypervisor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..f33ed7909a8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -7311,6 +7311,14 @@ gic_its: msi-controller@17140000 {
 			};
 		};
 
+		watchdog: watchdog@17411000 {
+			compatible = "qcom,apss-wdt-sm8650", "qcom,kpss-wdt";
+			reg = <0 0x17411000 0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING 0>;
+			status = "reserved"; /* Owned by hypervisor */
+		};
+
 		timer@17420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0x17420000 0 0x1000>;

-- 
2.34.1

