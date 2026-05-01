Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ED2301472
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649498; cv=none; b=fQEPczzc20XAZl2dMDHxdW7gaB52Yb+WzBy8MrYPjP27vrMxMXlU4WsydHK5VkuZgTYyrIE+aUAqhbeL36QhGn+56Ry/IrnCrH5+/qBCaa6dol+B/T+ZXtdGXsJ/B6msP5f0nc6Gx/7bNI8QVyOAaYFUCuMAxV/JNC4rwPWLYFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649498; c=relaxed/simple;
	bh=sZptyh2YnTUW11YXeW5s0iLAeCrXBy0PXfU8miqgtMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F66LvQYA6dZw09GydYHnxnyXkbNdCIWXjMeVM3ytShy24BSbhEtgppfQvlk/TnBXczNWNb78TrWF/dRMAMs63Jkv2Tx7Tvw+J6gkOfV/k2kGxrLkv9Ss9Ys44T/KWr2jYWOpErZfruh5CJSBz6XGd91rZhC+p0uyoGX5077yqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAcse78M; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAcse78M"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7b23713eac9so22413347b3.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649496; x=1778254296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=MAcse78M15tyfa+Z1eS/10jPTj5JBIpkHnTsoPrp8TLGau2ywADmawOa512wIlZZaX
         r68eWKCMzW2W9StOrnx+uD9TcRhETQ2wTMPKjLnlQY/TblCkzUA4TFfWvVfHTi3siNCN
         6LhpmyEJQCP+bL2VGQRXtS5cT3QvOxlVywmNc5jyCPKKw0IsaqLljU9rLSqHELajglrh
         Rw+qyIEnNh6yCU6YSExLVlkFMosHbWykv4T9wsbkUxuuhF3yFCdT8VrtWS4keQjjzT8I
         XxEwFm2ifMnVnF98PdY6Ol5LOoTHahsaSSTSa2rWQYyAFY3HWp2xvo6jodm2Y2aUr2BR
         /Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649496; x=1778254296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=fPAmu+zafBnKc+7YBobWALmzhWkv7aU8h19Wft1FeZtoM/oHuoQ2HML4/1AEfxdh/v
         m04B9rkNBsIZdgZC0Kf8HpHNkPt1syWmKcjaZkZ9ZtMRJ4koZihJnLwuxVx6pPDmmYpE
         o1LKgbIbUijXlLWjV8Gb/teq8OqhaYhZSnh0+2Ryl9JnRaF4q+8HhyAIBgZQFwtZVvtR
         mj7emoQAiIvShXFGjcLZcaeb/9GbZ6LWqGnXf7XsJqJTNjxgpgavpmJjfLDKy8XkTfSM
         WAbTA9uK0KIKIo2VdWcAukiolZsRusIqvBTWmOb2n5kGIj41Vyahs91yQ6zTrp7leUfj
         sq8w==
X-Forwarded-Encrypted: i=1; AFNElJ9u59DvIZwyxLtwXvVpKjoJK7CUNcq3LTvXWPQ54KG8XW5YGfzrKc7RhCA8ZULruGll1nRR+bOfUahi@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4+JFA/GgDzNlqUFyRZLlF5yiA9XzrGv1S3GO3FtcgGyM/+8e
	Z99wNry3NjCqdFK7cwlKzinLOeeevCkfD2tDBBrtxXV+I07a83dpiS50
X-Gm-Gg: AeBDieuM4Uewn1nOpwk//ZBsrz6deuYzm/WNzmcuDVoso3XS9xVAk1d1JjqdIi3jlcn
	PaPjD6rdd6pGFOGraOIieyZ9DYXXKASi222i++j5DvzUO+sQIi/dIvWmz8DWsD9w39pfT7/E9w9
	CASXqoeWR1FBJWZS1aqqKVJG7B53W4RPutxOhp51/zmGz13h9LjkdTd98K8umSQQxsSiXde6ryL
	PbDv/128ee71te37mpi8gzU4prHKNQSUcSlQxwGLcyi8WsCXZDoicbF2h4NsGTum59lU47hf0AB
	UMCvHr4JD2cmW6k2Fu5iHoWT1/VthgbiF2o7h8m4KZLpCvU1btjgACrfI9ENySLBb/2wv+UyOGI
	5Y0PfdPf0c1rdG5cilkKxAQ6tIqVRwHUqGHUgUciWiFgvrXgX+AeZjOMlx6kkZmWOrxw4hK0bPr
	/Lw3xT7J6IMXWI5Xh7LSVehDRVqi0mxDUI3d+M
X-Received: by 2002:a05:690c:6989:b0:7b2:7dc9:360e with SMTP id 00721157ae682-7bd5448e19fmr70151347b3.0.1777649495949;
        Fri, 01 May 2026 08:31:35 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-510408de8b2sm19702151cf.2.2026.05.01.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:35 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Fri,  1 May 2026 11:31:18 -0400
Message-ID: <20260501153128.8152-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.54.0

