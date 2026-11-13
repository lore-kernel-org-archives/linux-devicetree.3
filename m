Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595145;
	b=lfz+09vLB45wm2rCV7n6sQ4NIl0cZw5grx9NGxQ+VjNxEtIoH2WvSYO0x2HgysVfo28T
	 fjwFCR9uUOvZILDC31VZ6YHimnOYCHVmQTChPSetu1qU4kmjEE7C3lKcO1jLJ5xXTfGKs
	 5k6IIlI8lengsZ+v/9YrhRRRKBwBaGz8t1v+KRzoQs6+ZmP35heQSyDbtORyxEYOSVkg6
	 RsXlow1cDsyjZL4x8QTIXu926zU5mViHCMzVwj23+Pa25bTi+8BBVASnTbT7xPTd/iOq5
	 84MqDLdIroIChUu5QJnY0BYAyAddf0b4lctZSK9LXBx4hVTIl+ET59WXgS0G54HC5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
	b=ChG4KJmqm/LAbA6CrRCjfsZtNLiyvAIrL6tjczdI+FxTKvbSiot1rs0/dOaesD2saKZM
	 6SgmsyDiR6sW/jt2L13QBYaieLCsotBpFYBthFbKLnS8GMaT8M5yM8/y3gOopVu+w3ZDw
	 A6e0qH6Li/bq2Qya8jhjIuDXKko1qnqp/hgq9JL/F91cqJ/+9rw4RUEm5JsSn7+1dPN9G
	 3WJXMeP/LulJZldSfNKNMX12FHYYFd8QYajiBMErvvGOdt7ZSHSfFZToFxzrEAoUsFUrR
	 FG3UDkKnHHsWOur8B18Umr8H880qtDXq6WMtGaVvflECLQf7wvygDehg6WZ01l4kmCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHOkcPW+;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A56077DA1
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5A56077DA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHOkcPW+
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1260488f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595143; x=1795199943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
        b=PHOkcPW+PAWPCSsGV8WrL7VmLRK1hUSLoOrv7sGnoY8W1UJWtOT8figiBTJFuJhkUq
         RHI0iH3Q6i08V2EcS74axfEZ+Cq0j+8y9Fmy06OkeRqeCGLsv0eiIBsvhl2qufsdBREz
         oq7j4p/lPogKbm5glbHznGcQX8rCIEQf+1yJ8PI2s/+D3TnQdvWN1ERB3mG3Wz1huvrq
         y2tATk0IzBEEFTGIQKnssOD3yggXQ91RR1E1tzI0VgExCvUz4bEEgit8iQ3R4ChjGqJs
         yr7g1nQdi+bJs+40929504rGGJ1RxNH72VkPxPXGxA+IwfoCGfBhgQNKiJvZ2eYm4zD3
         lyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595143; x=1795199943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
        b=goJRajdOVbKVUo/3WoFmiQqEUxwp0cYKSDV3RCSSODWRl9SBpECjbp7HVxFcKwMwrL
         uZPwpgjS6LJPaf5Eg0x5dE6eYRP0FdtEGj8+YGKr573czQchy1URcDl3VTbM+daYfD0I
         nc1B2dP87271Jjc/j16LgZL+NBhXDfwtMg7nHhp6b/HTJO6EEDHglAKSdVG8Vf8ruDNp
         y6tKqLOjfgOcRL0EB/LojLY/8VHpeGwVNPB7RwDsv4qak3skSirfLZccoNFeU+lUTe2S
         +UGETDRtx2vs10SnISMr8DrW04ezr1BdEMV4H+xQ+5Mr/ueuX27th9uk/+YECo99nuyK
         pYxw==
X-Forwarded-Encrypted: i=1; AL+hErFQ+I6GwA5QolXx6nHo22K4oM+HtLqZe0Cp8nhCNZ2RAAT5YMpjF5ddSsVlcV5gAsT2DCbN1Djp8Q4E@vger.kernel.org
X-Gm-Message-State: APuU4Z9y83/XEnynpA3qGbRSdxSUI0kLoR3OYixcDixmB0ieUOoNkh2F
	7KgC7xqGweov5XDjR7WgwwbZc92SLrIB5YE8BPVU7lIcWyHf2yL0FlbUSlHfqRQXa4M=
X-Gm-Gg: AYBFou2Hvk48ok4Qv89uk2ataTr/TkH79HfjUwmL/3zLUfWAx+oLwCtrBD/40vxyRbj
	e9vdk7gUBDqjmY+Rqlv74yghej3foE5YVn3YEwpBoxa+03p9/v67C+G532A4ibI1ONK3ZaSF+sx
	SWFPLjaDEDq//RdeyUM2oyENv7v/glCafmhGHn2MojoxIEYGciZPgaaZfhGYAHakcdNoXmnnUV4
	qrNySERQaIIgyR073z5YGGcpIBqhGxelEqiWF3pVjtUwRlnM3w7fMfJzzzzHVOOoNH5v0pNj2+p
	xMOecNi+haKSdtJ/ooI7OZoQo1lGxU1ZDFPWRJOwsAZ7L8Uy8fOT9Ny9A4Ti/2PTw9FucINBhZB
	M3jwLQLhjXZGCo+f49DXJEsyQ2tJzQ7l+1pi4NX0dnTastk7SrOw1+homiamDLhOdCx/9K+qEdp
	e1QFsyrUgQl6nxrR/Heo1XQetejaJgaxwN8TYQZjSEeX7ZIx8xF96+8CgeAuzGphqN/jm3Dnv35
	IMkcYZIdLOgxfwazDOw/Qe9j1G76TNkntUtKp8tDLqxhgXFJn3A4nfqR/0ikVQ8HbWUdmkHt164
	iZtdhwMzCgwbno+TF+SPBh6N5b4r2HuGhGj53sQVYqA=
X-Received: by 2002:a05:6000:290c:b0:493:a59d:880e with SMTP id ffacd0b85a97d-49c713add85mr7018623f8f.30.1794595142585;
        Fri, 13 Nov 2026 10:39:02 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:37 +0100
Subject: [PATCH RFC 23/23] arm64: defconfig: enable the SM8650 LPASS CPU
 driver
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
Message-Id: <20261113-topic-sm8650-el2-v1-23-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TuP0ZUisg9EWjSIcUm86e7zEnoMVli/g8vNCUSlRTgs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kpXiEkv6/Vb4mssFp0ghv3S+SXNBFifU6hH4nI
 NXpSg8KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKQAKCRB33NvayMhJ0RxrD/
 9VWK4iP0Ou0qF42iPGPcogEvqT+dCtX04UEO3IIJMgaC6ibnCYdgfJ7lQuSGBEjK56j0ayXnneD9T8
 zDg3QYSTO/7vQ98uMZqODrksixRlNB0OCNM7IBHrHvU54JhJ+jueQ0APXrqTVSn6ide4liKpYgR73R
 R+zhLFhsNR5mJ7UrymGr1R8hxYkI5PKqIJAiOJxp7Wy/xkKlWiqvcx0pXQgh0WVxBpEjnzQMNSQUFb
 7bzLIBpv4Z8RH6ORYZclZ6cI8vvpKa3nQEV/smFAoNF49vibmMduja8MxLLbFFY1kdYSnuoETR0GCC
 +2pPh3t3fJ4zFmos16MjmoHh9zlzxZ3pJiOx+VukD6/ZJFnUnqdvW+fyqLe/mWLv6RfsF8k9xun/aP
 q/LiU1yZbgPCYjLGh9n/ctTLsXctEWHj6tklTsnpa3YW4fGTyyDk02MDJSyDaMh7kzuDNY28Ds/Mju
 +4ZEm2EolI+WYfyeTRh0VGx2efXRDXIsvmANBlze28SouA7zCokJbpKHQWVhDYlzK8+xrSxHHvhuLT
 Do4zFI0TA5TFPNxTiYcfUh8WX6SmKFM7eMv4e59PcGkPqv617rst7kwLcPlANrMvJ7UeoxBSP03qFz
 GGSdZ8Wt0EEXHSLVZCeGpFTAR1t3ic4Ja9sSzzwZ6FpbmWMaim1lLb8l5IRw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Boards like the Valve Deckard drive the SM8650 audio interfaces from Linux.

Enable the SM8650 LPASS CPU driver as a module.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..a2dc062f5b33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1116,6 +1116,7 @@ CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m
+CONFIG_SND_SOC_LPASS_SM8650=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m

-- 
2.34.1

