Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486250;
	b=y+H1LJkLfSwh1JZAMeIxXEm7bMcco2Kr10OXQMZrL8hF5d04tQLxvmIMirNBb6Y8LJNm
	 ckipd5a1Vvc6GBhv/iTZc4KJ3Sk/ECK0PlFlcetIZZGH/uD2GzLZRmoNvaLLWjY2t70ma
	 7C68UGNuUgd2KDqnlWehjlLhRrBhS+bpyJXJKdLGq5gC/ivUfwoI6ZcJd5Jg+HkXBHKFD
	 NeEDQ4L6qNLjt0A+dychsiv/YeQRTzRg/X3k0CBd/Gbj5W0AIkDBHo2NXuFIfvPRmvC0h
	 PhM9VdYu4l8sKW15F9mnQbfZHQqBgAgV5yA6jtVFhCI429KRqtjRumo3DIUn9s0VdxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
	b=g/+B2H+j7AQT+EmeQKoKrnWsfEuEmjVoMNGBtzJ7bmU1a40RS8g0HRX/ERDh7KkmSXyI
	 i/8Hp+jYxHoeBkq3+hzJRiCieFvYtYpiYnKWnY/5TEbZ8JdLPqT+FaQc/YoBwpeMwomJE
	 H9e5VBNwB3hbN7wjuluv4hwhNAyZFLvW+o+3sYdT914ourRzgTXfcE5VX30ABCh9tNbby
	 D99FPgg8VtMcLnHWQChymfhcZFk5mRPQqdJU1IllFki7ZVC+sEqx+IE36LWAku3x02Qra
	 4b0KGPkpyxvso7QZCxJDRMh9EFooCqpjWB3FjmSZj2ftANf5kK/9gRw/TQ60leA08nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAAA606A886
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DAAA606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso5009188a12.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486249; x=1795091049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=L23mmaikCY+Jsd315IBXg/zTyoa42t+VmyZ8aMGiwsxXeY380o8Ap88X5Mqxl02op/
         bHe2uj8e5n02XfWkRCEhI9hln7bZO4WxZFqr09arcjJBJPde0vc82w9kXA2I3yzvuwtY
         s4A058wfU8lQtbpSfH9Nx3tZxRmY1tfIheJNflspNjHhCURoxKdqXL+Pt6P2OOTurmFS
         NEYQdyw33s9Qa6EmKiWsYojXpcW1LYz9Ea7gDHvnKG2tFKQwG/KmkFHC8JaXTb4FRfwK
         oatWn9QLLbwjn3AJDpx6X7WxREYDlaC8TiMm3heez2+AvSjmtEIS8pYMOelizS+fAVOL
         l82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486249; x=1795091049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=193SNRypVv62zaBiMCLdKHp7GRCV9EA8TQVlSzj586Nzb49L5cJsHwInSHfF6qjUUn
         tSfj0VNGXxHkI2fuKT0tR/e96IUM68ovPlwCAk2MjX80PzRwh/7q+5sURIJmPoYpWUSs
         /d3xXDnfhbwcKfFybG2J/PXQmowvZgwBmbUyeYRqwUHvFLX9kS2LPWuTTI8LR6pKxAoM
         /vMgCu18BaOMMxdjWC2h+0DTkWpG0GB795BLMeBcjNy+mwJqVg/sTs7qNpCgeNpWzaas
         ZE+kc9Hlv4LfCxXWzGYuf5PJjqaoqZx4Ysj9RRQlZpUVU8FgnINugtzq8q1XqeRD8TNl
         M8Fw==
X-Forwarded-Encrypted: i=1; AL+hErEs//ZLa47qn0oHjvF28oLXsU6qsp5aVOPgUrmz0TFRKRswzjUbg+lvv2MEs1WQmB4rJWXGOO7J6Ep+@vger.kernel.org
X-Gm-Message-State: APuU4Z+bs/vwEe8sDzYHRmu1ct4JqmXMdST9YsvP/Vc+8KuVhr2ernmX
	A/XqAKgJX40cBpwzPChKDevOz9wst57ED3LNCq0N2E8Knb156jWY5KW3
X-Gm-Gg: AYBFou1H69iCMqfCv8ZrFFYsYLCwwDR+jdA1B3mYQEKB3OmZnc1gpCwKd/RnGTnYq9c
	eW+InKShtHdt8yi8nHysbaZDoj6zSd1qyAqJoNftQPxnXrZW12RfXErbpe6tKMjVPubh45HAVlF
	tbyCYopI+Lr0mHISUxtG4D2Ifav1/broHgY/TkYsQiX1mIoAtwawpafkQ2hVXkQVfPbLZwwEsiv
	49BWQ/Gt2Q95gfxlrjM5xzNSAxONb1q8VgSNC8/yClPeLhRq369mFivzVKlr3LgNdpltAMyC1J8
	ReAPpxrr3OibHWmHog7d+iRPMdkjhSCZE8CtIgNi/SD3hS2nE4RRUW++ODBpkVQ+YmCue1uay9R
	1ECovgz0HZeR7T1ODfFC/D3bK9Q+0wNjd/WgEsi3Bg5RAi/VJoOqWX4y3qPJsaTLahR9kRFUClH
	7/ObAv+uXKE8z0ZyPtccZIxi1FlBv0i3jECG8weNWDEhlJaUeYks5Y6K0nxUymy5uWugv+vg03B
	LBXZGGeWDDs2BcBFCLFwvZ+msFn8EtSRBHG3RBT56oC1IE9zheJxVwJ7ttH+ORMmTRY3Y/eX1Cm
	Dkfg3y30oJHGGiAZLjDkrb4sBMpEp46RbjZ6wKVm
X-Received: by 2002:aa7:df0e:0:b0:6b6:fed8:e3bb with SMTP id 4fb4d7f45d1cf-6b7773edf13mr3161861a12.13.1794486248604;
        Thu, 12 Nov 2026 04:24:08 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:07 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:22 +0200
Subject: [PATCH 1/2] dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA
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
Message-Id: <20261112-sc7180-gpi-dma-v1-1-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Document the device tree compatible for the SC7180 GPI DMA controller.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index dc7bdf7c4201..01766475d1b5 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -36,6 +36,7 @@ properties:
               - qcom,qdu1000-gpi-dma
               - qcom,sa8775p-gpi-dma
               - qcom,sar2130p-gpi-dma
+              - qcom,sc7180-gpi-dma
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma

-- 
2.56.1

