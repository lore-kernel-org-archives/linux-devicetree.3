Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8CC304BB3
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627956; cv=none; b=n14WgReRQs2Vj1+vtgK4j12RlTZhApRWIto3B0/ywnkW7kt9NHupwyQQRi3xQ9LaypcyHwO9KRf015ysd+A2KzQ1ejs8hrFgAlR5am8x07YtbDc+0ngGuQcckwtvEF7X/VPU85cUSn15+spPbEzixoEP7prhVpORLsQnaWrtbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627956; c=relaxed/simple;
	bh=/iuE8Of7PxtUN21ThxuyRVaZpwkJ5NvVO+YKGCgqQ64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikEEyZSzqygr03rj094641Ifsv1AhSCClIn5eCqT9HBxKyzPMAV9mTv3iEEn3X3s6rokSWPa5f35OKvEf9etE5bZZl8GaJfliwEs24la1kZsaD6GgkjSA8w+7YJwZvERTJfTwkq5ZqgWaAFYMeard0Dz+gE0ulQk5YPmX0j9acM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I0olmsWo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I0olmsWo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66b32fd9f26so1023929a12.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627953; x=1775232753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMi8pPc1nu1OwZY0Xf/EDRaYl50oxCMJcLrOAypEPLo=;
        b=I0olmsWoxpRstCu65hD6A96pnIQoLAgUICUYl8cPWFFInW84P1BbJvpl1MPxPnt7+u
         BexgOiQ36XOJaG7smjtrD6hJeMs1sb5NhOBukp0eAld1Kjq3upW7kc66eSKzvulg3wRk
         tgcXvCsb0PPuPntDyzPazArt68HGJuMG/jrC2KBVj2R4y5EhdZLB6pt+eW5NniEMCCQt
         4a5fCjVF9iCAR/MSCS9RGjO4vV49iJVPrULDuXrHl3bGb3lUaFB5w5nZxVLGGrVH7LlP
         qatvBxzPb3LF6R/td1zw3/hJ9Uacu7ISidcxi/3jQjBt+kizPQxFefjb7V6jGrjDeMsC
         kfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627953; x=1775232753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMi8pPc1nu1OwZY0Xf/EDRaYl50oxCMJcLrOAypEPLo=;
        b=hegYwmLHn7Mu6l3NfhlL+2zDbfW+IXwiml6PuC2kUKDWU0W/yb8+g1wiWuLqVeNRg1
         TkhBgv8w9Tm6/6KYxOtIBpfl9AK4dcVlq9ZrEHiUn8s6mVyZZZ5RkrKmxE0cuy5qDlOH
         WJOiLhZXcS6vboQb9rOX/1ZbzjwvVTWCFfm2JAniwqBwelJmRAvyb8ktsomj7cJr4CLJ
         ujdvej6Dk/uuZSDfFjfqz6VSK4R/AoxHIBG71oqA8RZWFdW1nmU6d3HdK23jKBbS5Ocu
         QJs9J3IPLB2NpmOs24HUrMfpwV+mrJwptjV893KsP52Si6IFo/JrAgnoNg54IVBKRtlp
         He3g==
X-Forwarded-Encrypted: i=1; AJvYcCUo5KHn+XK4mQvSRpptV/ksW2/INoRVndHKwaJv7+JoZmSCaCnYxAgSh9GnW8257ElljsYW1bV6hd0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzCImiWKvSV7wBa/dUo2KtW9MX42EF7NFREN94mLMN+h20FJNKy
	qpdQzM7eD3f+05QI3PeKV1xMJ9RO7uEnMG1BtRYwPIVZbEt2RvFzLHTp7ib41IxUmLI=
X-Gm-Gg: ATEYQzy8lrFWm7h9kX3GNs1oHa+Nf9etb6G1TskO+vMb9KRTz+yBxpPuDjETxkp1tdu
	cCIidyshb2icy2iGEDb2EowFCOIt5tQTSit5n61YQ1S8v2XXdr8v+mlefyDSFAKBDR9TFTjX/pf
	99E38MdboSBxAJEFYwd32ZQk2NC/3LxI2nu3pqfou1y2Bj+sjWdy0d4lGqasYq8aSPQ4idyzMph
	ouibwTKA2/FUblqQfcZiyPN1M0tmHSMh4WBjTifB1Ih4ITR8afPgGBFKlPrtihQDJP8Z6hBKTfj
	cy8mDNajmypb3kIMfx1jmMvBoy7narqt22Jp7PRsrLFiz421NvDR/FnAIxRA1a5FOuB3wJzNTiz
	XCGsJlkXQSUz1Oh9ReX3eAQFVfeCf1dEjdFLl02/9JrMlqX1AfUk7Zy4lvsgy6QKF7l8v4WSl55
	4AtpPGXlxUWBcVS7BBmvBApTPe+Y0nb+UJV6L77E+CYbjFQvKhylW/0Xjym0dffA0tIi1fNYHLq
	TbW+g==
X-Received: by 2002:a17:907:1c0d:b0:b88:58e5:86ff with SMTP id a640c23a62f3a-b9b51647766mr196269266b.0.1774627952962;
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:21 +0100
Subject: [PATCH v2 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-2-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1141;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=/iuE8Of7PxtUN21ThxuyRVaZpwkJ5NvVO+YKGCgqQ64=;
 b=kINHrIcgMlj9z546raEXwcP6A0Lzrq1gQjA0FLzEM+5Rx5oXlRJ2E4maAJbpBS6QhgEJ6hZFp
 rLOVKD1c/CuAO+zU1Y1Cz+Jhso56+ar/zysDEdXku742owa567YKbMK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DSI Controller on the Milos Platform.

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
2.53.0

