Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661789;
	b=Yd6EEmocX0p6PKpIo9OKw+Kk+LWpCSN4vFgyFMzLcQ4eg+lpT2FDahUp0nEc2UNYpNwi
	 9Gr5gBMiof/4EeVZ2InuWTjFuX2KWxsACP9bBnj+bMv1wyb+m/4Vy5BYU54+dRL4QRgl/
	 GmjpwsUpyWiv3kz5WWUq7sU2c3xtlvnUrcxSEvkjn5CJRH+cP18BoQTJ7Pm+Zf82bJopW
	 qDGS9FyhDcdRG4NjB1fABc+s5DQFbmL9zY/2cy/eIHGOh9PhAOs7J/vGHlylfk5AU16/v
	 XCmAMQuMNH3Tc8E5BBGJfGqz8x6Snb0Ei+X+Vetnw2/p5DK2jkZBKJ/lXyhl7gsLJ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
	b=TtUPkgLRzhbGCtEKgXQTU2b9T4jh3bDDVj1kSNXIFEIXA/mp6dBxMml7MLxzVtnKQmvX
	 QXinQF38oqCMLgy5UIwaCCT68F8Gp6cy5E9i2h9ZoWQ5U2+Ut9TVRHeD4GNcGPd13S6jF
	 pfcY+EweFO1iR9SYmt11trKm3mAyGjtLaz5I8QVWwDXOXse0xUiSRZbKd+ZxUi4WD+g/I
	 Re3ugLlxk2eAsJMzJsFiaf7wCxUnhYGzoupkga5j0Ydhfq+jmJSulT8rKaQDa8A4I/zzP
	 BJxP5KubN3cV9ZqVHz4RvnjAzA7ocJtfPNaOf3Y91vZuo+AK3bgZAn5/6wAeBYzxLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hUkzxamG;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19EF60A260A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19EF60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hUkzxamG
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso18700885e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661787; x=1793266587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
        b=hUkzxamGHFvhVCDtj1CW/b8pkYnSHLfJeOmS8a3kCaoCPNzCnN6B0KgfBa3rjLe4yH
         LXzbuLZugymxBtGzo5FzvFgDIexyWkUf53LPcKGCLG12nKpGq8KePWLs6kj133rSw+2J
         BEm9vm3AV0t0XIYCQnsK+uTo5w/eTSdhql2rf2B3/4SPY7TlnbSZ4Pm6OQ1NKqbnsqBR
         YQwZQNPvwyikdiulas4iFn+NBEkAo3Et6umiy/WGNld8dbDzpuJXPNP6D/ZYWUNMY6AD
         DoY+M+5dV8DeB6Cu2ZPweWylWY3hvRIaZNYbn2qDXW7ViXOrR2t8TOZI4cRc5YHW6+Pw
         qDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661787; x=1793266587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
        b=JzofS1OfxdHDuqiJZQi0Y4lq2E7xGrF3J0dsXKLT4NDZwYc5lFd7rN/8H+pHR18PjU
         26H9AbEyYXCvZg7189EQue0pNmppd57GYIZfJCZI+Ovqw2X2jhdqky2a+qnL/haiQpiC
         91Wn7VgsuABEkGBIJRDDpp2ezR/ndaQhMOdI6SJQSwbubGSwha4dVhjFbhybC0DGsVdL
         qS+nfm32FCUQidc8HgDKkQ/mB4EJfnd7KbSXYO+HFJlQQ4KkFAdsB4BHNZOs0xS5h0/q
         2IKDw9CmeFySR3e3Bn749htZvbE17baxcjwGh7oWnxiTQ3GUAnfDUKjFDkfwF7tURZMf
         XVbA==
X-Forwarded-Encrypted: i=1; AKwUvBxUyOaWZ9KajX2HBDSPjl3zeG2Dmq6GfLLdGl8SXwVkA9ESAK4XEUYeGo3SUTFSVFM7eLHPfZQQbYk1@vger.kernel.org
X-Gm-Message-State: AFq9FYIkhoOcG72lpp0b9CScX/F6E43W/GPb1gZLNHfU36l0EO/sbu7v
	KseNx8ZFcWkEuHodHhRamSUqy0m+pWXm6l05x/Mgc1mb0QaNYANUyWL1MYszjNUvsrI=
X-Gm-Gg: AYBFou1uh2Rx60jWqGN1fNKwHDtqjtSH0jnbutIj7bn8JM7icyo0oI9siaVWKfPmIQu
	u63Bkh9FuhILSjJ9v4EHwcM5wm5V6pnOJJdKPF/Ia/53glCl7lElWTs/505uQDlNxYm+acprp5Q
	M+uPIBBfdStvcEtrf4lLlTjNNOK+PIYWv4MiNvR5dBF+b5Shx8+EBxV9LICiTtAOMqb6mB+Bm4t
	8IZ0qjwRTojgpYl8Hot2oJGrkbkySQcXCjRTXGgIj7s0c+QSDXLDu0UVu75KmsRAjOkf6gcd0jT
	sSfKGJzNXurWI4x/orrw/TiSm+von9iq8l7yekAOvltxXGjd9+1hVAXO45c+S0UD6wMLUFWmDWO
	tpchaQ70AJOLLnD+0l99FtXAgU26xTeqI3rwNXOenZjwf7X53Z+eKYoSXzdQ9iTu1TiNiNkBfCk
	SJlqjPHhPsDV1MsLAfeApzk3yyMISKsjC0R6JzSRaCYsw7wjvJeB99a+ZIS9Ox2mhoZksO4gSwr
	deYhdw1G7f5YbnEf1MB2fssnNO9ztyRSkMWBOvXD0c5ysS48ow9+I3g+c49/KUzhwsIHJA=
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr96044215e9.15.1792661787266;
        Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:23 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
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
 bh=dmWq6B4Pndw6DTEfJIcBV9nouQ11/jt7zUcfeK+gPCI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkXjrv+iVYQ6idNZbpI2VZE5ehZcwZ7jv0Ex5Mi
 S8j3y6qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFwAKCRB33NvayMhJ0YUWEA
 Cp4xhhWi/+krtbY5HhA8JOPBMUlAXpWMNtbC8Se5P3D9Pbi+pEiLsnrRGfTq14fJycSX9j6rDUaNEE
 qj/1p+UYGlJHV3GY37+MA1EBmQx7Fv2sfgPUDuypGBWAnMSJd7hPrWD2XiiEhFbWXcksxVUfABicOT
 TXGpOdhCLn3FFnKIt8IaWdoITX6i967VzpK6BADr49TG9jvYIPbdveXK7WxZupt6UOHKwWWvOgfSwr
 JbJKXIcHZcyELRKzs3MoU+b6zJ5N4l2VijN1yhsThhLD0tNmncSYsOFYiKjF06QIpSzWfT/uF0X0VH
 oZ2tYlM5TGTNQn4M/PXwX9uHzi+8lf6WpvT4oKxr5usQGWugd9OsGrHI2QwoJmyQpObOUFjVs8BoBF
 6XslsGWAflb+FliyyCREtR09TLal/TESrArDZjdhWH2uQ+OW0/QZCVX2W/Dz6mSPccJ2wshyt+560s
 w8uIpmYwZvJFuGbNJdSPPoVWUMgaGNDazjvSDXcj7rEFAG2YEhEOW3cS++aeCg7emo9vE2c391e7vQ
 T4WZDmoDFJPaCykYnZKGGojULToR73B/eCa8MeHBqXFhxtVJVo47DjgxO82JzWU/BchoA/ditIv+gs
 5z6UTG+7p8R1W99TcevRebM2LFv8NngHFFt2ObyB9qMb42HOuIdIDxDrt+Yw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index a3ab0bd3fb01..dccd6fdfe5cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -203,6 +203,22 @@ platform {
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

