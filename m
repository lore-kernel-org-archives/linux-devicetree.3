Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962523C4171
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139757; cv=none; b=TrJA3kVaqY3zHwADoSJYGuKWdreN16u2q4PJ8LYLKxERAKac+7pEXRkAuXKXZk/TUt/sIHAIUuzFGRsUeYdX8hlLzVlOtBJN3QSn2pJqtneVWQLRQk3W4bkJU5tvbhhwaMdzTOBdzE1TLn97kRlRsOPDATwSLqgEONvd/f/AaXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139757; c=relaxed/simple;
	bh=xr62UmcjeHLfyrB3cS5s/ysVodNVlBim8/Z1TtzMcI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkdVCt97BrDkpF/5+neCL8vag7pxXZvkc4u7ievnMiO7c8uh2ZLu5u1RouVUrpH1XKKx/5BPnFV3716jZVit2ezPjkAFgaz+HabsgRgGc01e7Eczd22XTHQjX1/9VB2LAZCwxKtRhyaquCA7OEbpg6zqXgHjwGYbZlOP+BWnSWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7YAUyHt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7YAUyHt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3100719b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139755; x=1785744555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DpStR4NIgPrHPfcxkdDONcrTukgNCZBwr9N0y4XnLE=;
        b=L7YAUyHtj+tBMrze38qRm20+RO1VQ2ospCymZgUexBBRpjckic+3888MqYN5/PWrMM
         zvLFb3gJIOgrTAfl3QKfuXqHl93TTRjksTQ7THifTb54D7chawn12Bvjf4er+xqm613F
         ewZNwPrsoP9cXkBugcb9erwntnWYdMTnLtWi0OU/qZVZtgxMJRkdFV8Ay2hXpY/X5eJy
         YXtIquJnZbJcHXjlfmbkspzS5259lHFjK3hz8Kv62/FCbvouzv/rgDAPXf8QHazSBmw1
         ZeFzHP/hE5cn+eWVdIA89/ux450Y3CziiETBfoEorAvpvHdcNSMHE+jK6EHbqMUd5+Jl
         48Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139755; x=1785744555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DpStR4NIgPrHPfcxkdDONcrTukgNCZBwr9N0y4XnLE=;
        b=PWLB1S1ftO/lfRopewDWsUZsdLUGVBuz6y9rNHCVfNcSS+3X6uB+mRu4RP51JH7jhS
         ja9pkGdZwP/x3g2aEX9c3QM73AWqLTmm7xfLMygYv5yPnswimlDro9ksuVJiJP6HJOnm
         TyVEzuyy/+hCtr+GfkRmH1P/wXfkDRzYroBp4MyN6BELFkjpsHdpaRt5aGFg5bUzZYQu
         ++1ZqkG8kqIkVLP6f2G/9kLID9vRhOBRGNpjGHe6RQIujkFt5r8vX1H54IYhqRYBx7p0
         53qE05ncbwPudF16TXyVmXnxQ7IaLgshUo0VTKsy07yuMFXvf55yKVKB8atsSb+L0jeH
         4uQw==
X-Forwarded-Encrypted: i=1; AHgh+RoRNwuW3EVTLtfjlD66brEDfmIWGb0kOWcchSW7x/BAJq9nYT3iL7RQAML6iVRtbGsMrtHCM54PrF//@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcr5l37UsX3br3JFOkbUhTHZrwGZHoWUxj2T5OsCdGoToyQWT9
	PSkD4R1H3t8FwTToz2NPEnUBlwrGJaVP4ZmGmqdQwe3bANwuUAQnUtd31lX7ZpABy28=
X-Gm-Gg: AR+sD11hTOmSUTC/s2+jVngcpqCU3QKs6osv1tt3trHFHlmqidWO4TUfSQLsFRGxi8/
	V/+z6B1bAWUF2wBUIi6PM6o/EXNCjKKEOY+oLmx5bvQ7joLCnzidL3hlQlgAMeVY+md0G+AUyZd
	qUQHx8HPuDimp3bO75iEw69RtDzokLCSxn/9bCSy2ue2clSkUabktA5toGGN96EFzlTGRxYRcQF
	BRznimB5vo0QW+v0cJ+9mV6XoCE7C43vp8FMqvGCUhGutoN6cXU7yoSiRmlSfe1VsYeHq/MVwd4
	rLWMB5KJgSMYiuS+S9pWICECrIS01tue0/wXBe0Z6fqmeUKpnwdoXKlVB4lTvpmiV6oVyepKsCg
	l7xrSLXoWPgfgTkBkkD0FGS9h7HvG4EiIOW/jkRKvOnNYWvK+Ik239vr06BqaWdAN+hRjfQVHk8
	kk7A==
X-Received: by 2002:a05:6a00:1953:b0:845:dcc8:9da with SMTP id d2e1a72fcca58-84e4e3a7840mr7482610b3a.22.1785139754938;
        Mon, 27 Jul 2026 01:09:14 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2630658b3a.58.2026.07.27.01.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:09:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 Jul 2026 16:08:40 +0800
Subject: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpio
 number constrain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785139738; l=964;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xr62UmcjeHLfyrB3cS5s/ysVodNVlBim8/Z1TtzMcI8=;
 b=qdiR1dk/x/gNxQz/wuB676QNdHdjXdPt/f7TMePVCIKOoycTx5EUwjPWFsPseO6eVg/BejHPB
 2Vphxco4M1FDg1qbFU1Q4RW9iKW3A38vjm+YulWXRGkUeDvLlt1BGY9
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some panel support 2 reset gpio, such as Synaptics R63455. So modify the
number constrain of gpio to 1 to avoid check failure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/panel-common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index 087415753d606..7c450d2799808 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -119,7 +119,7 @@ properties:
       confused with a backlight enable signal.
 
   reset-gpios:
-    maxItems: 1
+    minItems: 1
     description:
       Specifier for a GPIO connected to the panel reset control signal.
       The reset signal is active low and resets the panel internal logic

-- 
2.43.0

