Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF083644DB
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619731; cv=none; b=YOXLnG0xQvFyIhxB9IhuIJStfmXeeR/8TO4qXT1HSLFU3AgUHd3u7xDOeAROWoxvHzGS7j6cW8gxOuZ5DsfhC0rkh9sqpmqHPEpXvZCXSxO4qalk5u/EBKBV7SIFPWGAcVCXw6eU5y/hy9GYMa2ybsO0mJdMb+51V+WUi91aiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619731; c=relaxed/simple;
	bh=BCj2FLTcOJgjzO48MJefQIMPqJBsSoeL9qxaR0JSpFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfEXB5z6Dd/P2xu5S/izsD1AVnZm3vaxRO5FAN9aMe9U2Lz5fAmbkEaGrNHW0K0m1VxdW0q7zfzNqBcA2lkpXrrQmqrTueHqhbE/3BHHll+JSNJN0iD/+fFsG5YpxyPum504oPnjrXN2muN/mTBLydxdSaiEsnhmnAvv9erC2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3mJcU0Y6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3mJcU0Y6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so18051275e9.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619727; x=1778224527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9cBOyPysOTRVWivLRI31LjBpVlIJ+dTPcG0HTJLV48=;
        b=3mJcU0Y6z+Qkkd5fHiSbrJBrZg/uWaV7LHvAJJT4NWFQPAAh/OjWh7FMmNAFJt9tmG
         CFrODfgM4JuPpMXaWWE/ejnQLyfQBQbb7HdPXbOHmYPOG/liieoRK0je6OqkjRaLgh5z
         LUhvl4lCTYVsmLs819IaIQgoBpmMlrq6LIMBh5V+9xeUh4vRb09vSz+D+kyZKUbC7RPH
         gybTWcU54hSbM04ZWhS0cs1il3a2q5/u4i7NpKR/hhtZN5QR2dceg7H3V/l416O6pVAf
         A5WgFpAcZ/gyMvmXv9msnLP2pgxz/wenvrVqj/sjoPLMPSsv8Z4YulTV/tbUwV0hE+EJ
         u6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619727; x=1778224527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9cBOyPysOTRVWivLRI31LjBpVlIJ+dTPcG0HTJLV48=;
        b=VEiOd9RMy1mtYECwTB39GjSNf3qb1MO6zoW3boZuvXCzID5sRUe7ekgTFCGb/K0k5g
         yhiMPLIstfibfVIF8NTZ+krHcsUrNU9O2xvLSVJB6wAVS9Zf18jeJ1STexlB3A3pGjR6
         qo5ic9qcTDWa0IbUTCsohoq/1zAM249KSkKeMJ+BSEgxldhMl3Ua0WSqErJ/FoF4DM3x
         +6f8QKLXzkl9hPMUOBuuKyojt8hbH1J+/61gFM2jZRSBN8OFSHOxGeBFMejp0yceolHb
         o4AiMpi+Q189Yyc2L4QL2uuk3QT/mjlmxiU59dd+o5bF4jI9vBq+Zg1LlLPDuz9HAISY
         sBFg==
X-Forwarded-Encrypted: i=1; AFNElJ9ebGDCdZYhFSa8wEBU08gDMQaeiqUcd1PiJ0JigZCYrkW3eictZ6QicPzXl6fNYFHvLjDI4uLWwpoC@vger.kernel.org
X-Gm-Message-State: AOJu0YxmqLY7a2+dB+wIrwNSz6dbxrCjjXB3+hLi1oinsen4k8es9D99
	ZhlLKzltAQWSzYiCwNUYCFcsz1BDRcdNTn9RuH8BKPiPeUls7imIzCoRX97muwn0Shs=
X-Gm-Gg: AeBDieu8rbKUmuL4JIh03w0SLnsBxnle5KW1k8v24Fu1gUVWORyr4VI5cY+IOZ7fOlt
	7CAOCBSKSRPP3SV+g80+oAfPNJhBvSAi2GhWSklV0BQY8ul/sX/urwHWI71/2i48tJbfCuLXQxs
	MgswNDYFZ9p7t3KMWeYj9ryWdNe0+4s8m7nQVAoV8KZKPazNSKeY6tltTvFV3mjMo+8cPjf9vej
	ziKd5vbtqvp68Z3M9eKcNTwcWHqject+CpaB/KtdHQTxCTDQ2JLNdpPWM+r0tS3v1lKtu4tYIsq
	hT43olHR3bWcbIVCXmi7ht08Suq/genrLm3B9B8mZCJAtFjfp5L64eFNWr9vAFmCwa2txYnwqrv
	0l41Co4xDf2ws5P1nSVeSPbD7zv4Sjuhy7dyBg90n2oAASf8phz0wXHP8lZxJts1PQCe33wqUaK
	Kx9gEkcONbvW7UN/ghyJgomY7RNeRE14zbzs3cC0YOoEEB1C+ZMq3wDAepAxG+3Bl6OJqlCR49p
	MTb2HX1Lcq2A9Qb/eo=
X-Received: by 2002:a05:600c:8708:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a844e4a83mr97816475e9.3.1777619726960;
        Fri, 01 May 2026 00:15:26 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:44 +0200
Subject: [PATCH v3 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-2-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1188;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BCj2FLTcOJgjzO48MJefQIMPqJBsSoeL9qxaR0JSpFI=;
 b=aX1/waVjF+hvivOAF3HL0UFE6nbkla3myKttlbuQHoweT7fKoatB5FZR6ILx8LPMNgVvk1SLI
 ENhaEJDidHzBHLymIm0/WL8AWCn/emn650yUZt9JQQroA8ZM/bzUE83
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DSI Controller on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a24fcb914418..dbc0613e427e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - qcom,apq8064-dsi-ctrl
               - qcom,kaanapali-dsi-ctrl
+              - qcom,milos-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -339,6 +340,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,sa8775p-dsi-ctrl
               - qcom,sar2130p-dsi-ctrl

-- 
2.54.0

