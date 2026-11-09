Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184160;
	b=sKsbsJlQ32yHaBPn/J4bZpwXuQUkK8W/XKpP7+AI+w7L/1qSehbfLLV5WoZDkg0UFOvG
	 q+4/fWJNaCkXayfIxCnW4FDxZFM81s3YLJD5C/25ZBn8LD8uOX3b37EuLh3yzpJAQAKai
	 e7iQB4eM+ghZ9jt6p5/bC4VQ+4h/vYrJDHqRr8ZoR0SbngVHOYbL/OxlIoK1SGD0wtsDu
	 5dL+kFJz+Ang3GJ/8HGFohL+i/TtQHfNlRPURDAt14N0PnZAxju5saU05q9Qx896UwVlN
	 m6ZipxLN3fJn6P65HpQCzVBeLUjA59CwBQOvNo/Wn8gNN7sJzhwiCox6mx1Dsq1GBMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
	b=fyt3/3prPjq5+gM/gNYNmFIUBKEZb8PlI1PceQmiq1MUTz9Lose+wd1nXAEyhy89Ftjr
	 5VVk0sqqdMAn4HXIh2GsGt2/+gfp/XgL2c38Ttw3T2mnOrAaXEM9SOkLAUIdPFMomHcNw
	 EaHw8jUFGY+ycGfQiZzMr5/uwJqKV+OkvVgEn2tFTdHCxYwCLRVjP2WwfJfFfgFkeeB4S
	 Nm1abSRF64iM57NC7LzUoEbI4dW1Ezo3XtSXLrT7qvLY+WZxunI8YMRm+l6KlUBXKcxLO
	 ptxZFys1PPKxmMw6SPxQ6FyJwZaIv388U1LRt7D5JnMOY1h4g2eTZ2zwLwzPn3ldTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CE606A33D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2CE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so3529795e9.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184158; x=1794788958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=nr+rvJPK3LgSefZHQcMuNoy5ys5xeLDvzoC9dL9bjp8RsH4nbUvtSXjE99yObhKnrI
         KVL569qwb1cNWqejwxbmHvDHlCCM9a0KALsd+kBI6FvzO7MIFWyCNFlZuDEIbHakXCkO
         zfIMQfOZFaAE3OJ8FnLCKYM7zUrDs21JikhpKZqp8aXIXjfaoZTJGEDD7K6S/o4SX5ax
         oowccfChKBzSGvGYv+RX3eVnKnndMe0cVvbZC/RuWGeZ2dWFUr7H18zUaqz5ZW33sdsS
         wL85GB4wROuyI9HV41fK5wDrYkNmeiq3h3ee4AveMIdzJFeUnF6yICT2l2yCcUrEu8vb
         jQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184158; x=1794788958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=LS6YLO2J1ZlS8a2ov/eJh/esSD3w44vWs0WT5PIKRePpnwDMyxLuntgIPhDQyG6VEB
         npNpMfxU2QKSj7yV3cv1nPuVWoZ4v9G3PCT2Rtkh/UxIC0tqetcfvbSA4rftIjDTFeGe
         s9OAFd6cGjkV8z/NXP5aKjrb12iTWRtMH5Oy3tKoXv8lqAYGEQ0iUvF6ICtsJ0Te/r8l
         R3/XLg4PFye9qrK/7p7C5sCqF/icNafW27yOc6s/14BzVPwjRbTTq4xqLSZGaKqqD9iv
         kfecRG2YFGu2vv0wsqfyVSO+cwUxnwUDXNbZR3lJAeQJAREXHSZ14AB67Ey+iimMnyKU
         WEyA==
X-Forwarded-Encrypted: i=1; AL+hErHN1YV2SLIHfZqtJEz9guO1HD9h/UoDSey0kGUouFzdbzXlz+FZ8vyLolCmdM5QQ8VYNhFixapTiHgG@vger.kernel.org
X-Gm-Message-State: APuU4Z+zSdu/X0umsmGHU93u1oVAcT7MlwZKoTB+5OVB5gDRzjABYYWR
	aKplSwiODDpt5CDeIG5h/D3r+VESIrj6eIfCjQ7G5VBoRPd3YN1y0uoFTyOIItOqC0w=
X-Gm-Gg: AYBFou103MBZsvVLMvrYQGtNq2KwoOfEaBDWmrCdSgw2iPLhMDWhJA14tPCmP+gtGUz
	JaPkCDzzvnmnfVaJFBT1pxYB2kST7gXLEh0fNVJqc8EK3bGqUfycgtlQbGqMh/FQvzGnyB7RkpD
	cXAcCxeIkqznyT33PwIe85hmJM+rkWhQE9+4GL3N8zmpo23iU72bHcg3WHUjdf/3HwAL5RBhWyb
	IRekwOkHt2fUalDJ0StqsgehUuXJ/sjGKmxEsc/hSDB2fHC6flss8ksXeGBgZ6dseVoxA2gbGhB
	gD1WHVkxDpwCaTO84FTz20xfcW551RHjLRasdvMVKLXI+m3gbfEpv98ruZ3+6G1qfyfA4gY2ukq
	M7gNmYMGWYsdwOk/+beVytS8MGpdNDPHgUtmE1bP0yxgodbS/XpWf13dNwUU6hO3hWEkCJYNsRX
	9do+kNLwUALEAAVFcNmIB6YRBhl0jtQ1poGlD6CAYi8O4gpfXwjMDTKW3QZ9qcNrMVdTqld/uzw
	5g9SHyQD4d9Oj6QxWE1iG7ds1g63jklH7YQk/uLM942X2gFhGztlPukkUd/mhySjaQtrtAo6sEL
	g4ByhUVKn0/ZCOwHlZ90W6Pz62EtXPYVtu6kFBkJ
X-Received: by 2002:a05:600c:3e0a:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4b94d762f58mr49204685e9.3.1794184158186;
        Sun, 08 Nov 2026 16:29:18 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:10 +0000
Subject: [PATCH 1/5] dt-bindings: clock: qcom: document the Halliday RPMh
 Clock Controller
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
Message-Id: <20261109-halliday-clk-v1-1-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=820;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ra2CqCyJU+PQw7aYPTd3iwXLS2r2IgX39NQHfJ7L+7w=;
 b=2nnGBX79rTyj90QOmojpA8vtdMSBp8gr0IrLIj+ozjNak9ZQIQyO+HH7+ULR7mGoGIXokPJ88
 iUIUnzmfx4CBKWS7MIXWXCNck7cizjy6ph3FLkNDcHhSietAdpSWg45
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0

