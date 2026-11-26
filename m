Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706564;
	b=l7UwH1NF20piE9eCjOgMGxwPky7dZ4UfDkSuLtjxVabGWSL71wsUKXQiEgYvoQpDR4zO
	 4z4iJKHToR4Kligp/bXsxIzKJYIPVg3ZEvdmwCtAGD+OzvMIZSryfmrJtjuKT0QX3bHHZ
	 5KJ4mtaUXdfTovPtS2vh9lnOHoHLUTreIcEsEhhku+sutieGimHtzhXACRdW0kgI1GrxS
	 y6bMmLiuvr8iN7roRs0hMWaXINiFcmqk/zkmKb2dN+/UxR07elhjO3iyrcvwKhufE9sB7
	 w3umscR1CxIFyuOirJQ9x1J+YcKcLLArhxhOqYFqpEh+bVMi1djB6x4E1hpB+hRQLNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
	b=f9U4FyDLFOjbDreXz2oQWe4577rFBnvj02shXOlAgAPhK2AN8kOHYbJHBP6QjhowFFl8
	 apJ29cxziiCZe+hQ2jooxp15usKcUfdllMhbQIMET+8QOc1G1ezmH3YCprXQ5tl2Zdxvt
	 AysYUdXgpIvCaRL/MvUVZRd/vmzqBlK7klTRT8g3jCz4TjTA7VNb2j/2msmd61oZG5vv4
	 k9ji3LPWR2su5ZZ1SpCnpN+0PSH2ggA3kDNNAA8tBIzv9k1tUEapxiWcR++hhrt5jqF/l
	 OpXkiPDkUsnx4TdieWTgmWixtO3sYk9YzT2ohcanBHsIB1tuTo3VggL7+fMyTHMe6wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iZu+/D3B";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711F2606A334
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 711F2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZu+/D3B
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso51107825e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706562; x=1796311362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=iZu+/D3BniANHRXs2lzbkw7LWRXccfghYj35WKvmta9S+XdGY6U2rH8Mn/8As16s4w
         lo4HwXSBajMqRiU9kbpUWvPYIDQ1FPJmaZ2AX1EgbehGTLoboaSEqFbm5P7EP4M+GyKX
         znnCZR0o7glLDfiEtbztxhzRozOI6FJpdWiwsCKZFsgiEUGrv1uurtDK2LhAPjO+/jVO
         1rhvel0cCAeM4wV8nDvDjmf+cOyhq3Vv7tJ6jDAZihpHEO2J6xenYpTTyPlsC/TfDzSm
         a++r4qhm2D+aZOLOYMNocDhDij4OquLkvot7uFDJEcUfn+x/QAcr8MYbxNOXUUk6iUo8
         Jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706562; x=1796311362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=Ugu84A73XXS2iJKTwiJLiPSGkwAa8QWtL5BZXOXyR+rjlkH54WhKu1u/noUrUHMK3c
         NqIN2lSYGZaMseb4wlOz6nYmoQunwJo64OFRpmBrQRSkXBym/gJsiivgdx1YNxjzJAdp
         OVcm0GLyKLDX6pBMKXFZIj9TXSSVVSdIm5uZcU+Xpy71IzuvAwvh5HHmChwz91bLVuYO
         578AhfNqNT9+LbH+kqE098x1fnLA+vrIakyk8TY+Q2+7sAqoFWfiyjc1DxwVvvAyo5A7
         RERGtyIQkrzMDacWi3mi6O2EWLXXOy7+0F/2qjYyuUH7f/W+m9pzRkwyYgvFV7WhCs9w
         C1fA==
X-Forwarded-Encrypted: i=1; AL+hErFPZfXIYBlpnZDaI09RskqSbeQcN6t5xEVuk8P86Y/GI8cinSZU4JyD8gEAR0YGJhGHuXvbe+ClTA/y@vger.kernel.org
X-Gm-Message-State: APuU4Z+CqSyCHtg1+DjiJ0U0ZpC6mpe4Jpm3VGPFGwx7qiYLn7giWkEN
	JXkTJ3eWNd9ll0CFE8xiheHHSgXBg5JlLRii+WlaQqnVupSMS1pG9GXl
X-Gm-Gg: AZFdTZefdQCg9Wl1hcCd1uZwESzISYXIK8hL7EwpDHHOrBBEGRJJNj0cjo34yXHuiiU
	GkoZItw47Vbt0aI7QDD64iEk6fmYTGMzsWisowmBzvZAMrItMc7QkGdz+BpwTf2n+ArKGy+Zitk
	PxQUGHtSdvzyJeHC9KKFExE+ZXFcxr/lu9wKcHSRwpTqNvxVjnBNy17GKImtlZjw6b1dGqrS/gL
	rneppcbDvss9r4368dlO61f1bFQc01yewTSOddbeAK7THZ/l7aU8mfJV/95RE87By6np5WY8ehg
	JRttHVgXh2QKSncxKM2hECNbYBY7WyNAgzEhT2wPAHl/EBJ61b+HjaPl96zB7sFtXHuAloV2i29
	u4e+uqfJeeUsixkkBfbebUrMd6gCyKWvcEimLm0np+N06zhTqDe4rh4VzIVysfRpEdKCVbUfYHW
	YeCNGeYti6xSry8Cn1wPg13ljxnXMsOPT0GBjYiG+FRejmYhpg9XQ4HwwCEthmO1vd/5pbZqc+V
	kmEQu+5tZtNM07jwvt6finzUrHYV/iyab/ZzO1EkcqnFxxcEz1R3VsxtHfcCtW6uQPFMVaXJNFa
	9XUjHUwyLTtCkpqSQKvjjRdETjwGvXkGTdxHig==
X-Received: by 2002:a05:600c:5303:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4bb88786cfamr410681045e9.0.1795706561725;
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Thu, 26 Nov 2026 15:22:32 +0000
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: halliday: add gp_mn and
 gp_pdm functions
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
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-1-b8543d6a83eb@gmail.com>
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1404;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QegpgPfocKYFJp+cQizBP2hJGKseGJLDx0NLMt+xxOc=;
 b=cnZmYNJ0J/woBA32L0W/n2FpxJmTXEFp2rRyZGRko+DsuEi6MzOSuCfu55i3nZbkgD3GUjjJ9
 lVDNNmqaX7YCDxP78kfu165KKFClqU6BbexaMsOaMD5BlHlOSdC5/6f
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the gp_mn, gp_pdm_mira and gp_pdm_mirb pin mux functions to the
Halliday TLMM function enum.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
index 2615d40b0478..e89220c185a4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
                 edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
                 edp1_hot, egpio, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gp_mn,
+                gp_pdm_mira, gp_pdm_mirb, gpio,
                 i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
                 i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
                 mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,

-- 
2.55.0

