Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01737DEA5
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143025; cv=none; b=X2ZGSpQKZaeizd/aXgk1IWGH+hSYZqajSBGcYAPs6OnkKl526yfvcwOPGIUSBXuhRs3wr2gBa9LubwuLX/21QRaN4fuyxTGmKlhz1WKnFovI+0Euj8HQN73BV3rApRrvGBG2Z1JS4vgnC1IjrJj24g1J1nFnHlW8BdXI1s062zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143025; c=relaxed/simple;
	bh=CEkaozb1Hzg1sRymyFy/rp+fVMCBaGU5LmplVxUYO9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taXd2BALtO5Okz6QfAYpy8iDDtxbRgPLJ9AOJcf6t58CaZWzEg45c0DrjPGcSw7X+9HzYBUamz1xu9oU9B4YT7IjJYvxjw0TxVxtDK9CKcx4wFYTboFyrGLqReI9kSi9qvgYSXquRJn+3cQsI0Oi0Tm4um4Jzo3JAHei+/jMnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=PzxGW4/R; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="PzxGW4/R"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba840146so4732615e9.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778143014; x=1778747814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShX64iLRpKGOnAABoLYsyTZ62cRVF5Ndph9BJAzdsm0=;
        b=PzxGW4/RPk2OWxw4daNaHIPcl0NRl634KF5wPiHTQoHH88kdPGdIVyyfnIzepxlArd
         axgxWeL27kLAUhVg+EuLQXQBSI4+q1yEhEZxThxfUsjBBOywe/BDy4cPhzHSAGaYIcUL
         KdmV/2p64Wu/f0x3j0MmOvyctwJIhAKAyvZ3sDd6ef3G6Ub7Qad0aMksq36TcFQY8hD0
         gx6Tncxt91nRfgNZPdP7BYw306pKLI3nkqcm7Mhgkzk0RUgRGFnToQqv8caP3fXu/BRg
         lkYPSEbEtfgGVMw6Kd8nLUr7UBzJnUgd/8KYa8ahmIP99KqQLm4MB5RPcMr882uq54GZ
         n9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143014; x=1778747814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ShX64iLRpKGOnAABoLYsyTZ62cRVF5Ndph9BJAzdsm0=;
        b=mweDSyxi2Q+iISmvunpSCT5k+f/yPRk4ytr3qjwGR+VFRWEHdm3riKcVYuRcVHAWsE
         BOPPnsOqyDQ4KmEekddO8ROEFxdYRkRHkqfICMRo9kBEAExe7FnnC4TaAgNrFfroPcxf
         6L4ZUCwZf4e4HSyvQ/pRTQSu8jHDcDniG+F9KHloabCoXWqFjL0FLGCH2HBcSIB4D5we
         vVpdLELE+VmLZon4ka/6vDU0Q74cwZViBh+p6mVEIkRT8oWNlIkVTYryZibDQh1fXQga
         ySdG8LE+X6JpPU6EaVHvRqwJ0zrzoH0PQa1cu0F4ziNwZDXsuNFfmoWprpbIqbWh93yo
         3M4w==
X-Gm-Message-State: AOJu0YxkzrSCcvC7LfjY9dr8l3Sl/LHX+yYNvhkt7PmZ7WkHNdbjSpkE
	9iK5pjjazdwyIfiEYpHzRrc5UgYYemZ22r5bQmbWAFPmtet00mCUEUtFvZMa0Flvqlg=
X-Gm-Gg: AeBDietO+gZTw1u9Rmhho5H3AhyMOrXl8VDeLsT73O/TTpjr8YCwGn4pXL+cDw+H+TT
	+NbZPIY2FtCxJ1RhtATOlwcviV10nMuGkWU82/0LkVVHAVH8yfdSe++t/ULkStWBiYimNCpkju9
	AH4iIHI1ZWBpQdxtpQL8Yy0KqDxIm1VRVC6PGFsxO7zoecRijXQiZlaWtePJTNaWi+VuxSp94Il
	btMp3kNz9M2inLoE6cUu+w4ZKCOSf3dJ1huemNtjHNrckNntTruTwlQ2F1Xlv9j3h+09FDoj1Fg
	gIo1zwyCGx0oF3XcmIEKU0T4T95HaiZd7heSzwzEotgLGHUF2Rmu75Zrtd64/6JhijSTacKW1U1
	34SyIOld/BNsg/B4ARw6+v19soYER/hj9/ry9E9R8xUSOjXEl6ZwZzrQ9aaPELwos4PYZd+Rw/W
	9uH6rBpA8fCKSxeA+OwAWvs6JpatMVWWiv3JOS5m0437RJ2Pt5siFQAvt6OoHAZDYCWx5yS4Dfw
	aVevIhVREa9OSWkqVjMQeQMnzLONcXoIl4=
X-Received: by 2002:a05:600c:c4a3:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48e51f46e38mr115202465e9.29.1778143014069;
        Thu, 07 May 2026 01:36:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:cfa9:e812:def6:e9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313a158sm35602705e9.24.2026.05.07.01.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:36:53 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 07 May 2026 09:36:40 +0100
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-imdt-qcs8550-sbc-rfc-v3-1-47d3d3372b33@imd-tec.com>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add IMDT (IMD Technologies Ltd) to the vendor prefixes list.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2db12a1cb6e1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -769,6 +769,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0

