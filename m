Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D93B71A1
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830722; cv=none; b=m1GwivODsg+KDooX8VSyAGPVIDUdgfWpKqbUW0/o8eSOU8MAfuQF5sMkdTnIXDeq8+Jv9TaXGTEzfy9F7SMYNhl5f9wVtUksD6dt77G3eOsVsclkmL1LmdgaIDdB0f05odlVT+4jl5L13Mp9wIQ751ayfikPH5nY85ktSwumuAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830722; c=relaxed/simple;
	bh=2iwV7kyuakkEDfG5RsSQJj+N3P8k/pN6D4hpRK7eClU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQqGlZK8FJb9aH7qW6JSpKpOAPxbfHW+XqiU77AjkjYZkGpihaBM1hxwAMlzsuFyYr0niAJWRPP2vLcHXApq3TM9ZcOwqYTOxt6g0HmfJK1XRH/rsHwS0iFFrE0IIPv0fwL6QNTUDDKDwfnAoK87Ru6RFbSJkiXRRsh/DXQYfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=aQ/Z54a1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="aQ/Z54a1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8196075e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830697; x=1785435497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLtaD2vGvX5YufCFNfLuN9dGFNzANa0Z0dsAvP+eVoU=;
        b=aQ/Z54a1MLiHD0eBnAzQ6k2nwPUpNRWaEXS6FCGxi1AskjIN5E3QeQgb+xgD6GeMOm
         CipWfmuOXgibdcqeR03dprvtQ2KYqeSpJb1K3btpw/lL6/AtWq1JP8w2Gi2DMN318ZRK
         XgPxjDC1KZleXpeXBMD76I0B34XC9f0elc4mcQBxNhxAHJdVcR+htr7gBVOAJxDDaDo6
         6YnpSNq3eiAqQ3Vc7iOnbwcwyWzsauEjEGM61YX1uM2gO6wHuH9meW78MD+DlHnTSzJk
         7b2n17I+mhWlZx05ODCDNrIGgDsXk1UHP7eDwMswS+UdpyQOVJGfc3CfwljprJ6CuPtj
         vQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830697; x=1785435497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLtaD2vGvX5YufCFNfLuN9dGFNzANa0Z0dsAvP+eVoU=;
        b=qq0uYhC9VCQYzVcbGyaBeEBPmKv+Yn2R74nIdWAktwsoZJpt04m+RFkdoIAZkEIUS5
         oltuk+98CtcgwvpO0U0pdkkf3MwTVIZ7DlctRNEyBrszSHKxv79tnXu7rYjiMbRAJa/O
         ovLQbtMm3xVZeX7CBLc97EPTq4gtIFHo+OowUY0GHCyB7FfLjA/9k5GxCaFfDplsyBLP
         JbP/bjCYHdm82EhcGNVZ4h8NP1H4KSONsR7QvBrXs40EiFhiscMeuVUCdIZgGMMsuYV8
         VLbxXZibdt5ytEjgZYACfe1+zVd+oGyfBr2JKSefD91jRV+EpsK/7VIv9OzpvVJEW8ST
         wgyg==
X-Gm-Message-State: AOJu0YziBNCTXTzABFR4NNmcqHQK+3hUefnNZNkDHMOg0ECzW3xk90EW
	xUZt4rdugVJlIRNvM9K9eUeYfqICr3drbm+LLi4OfkOiIvYfYkkGOZZiqHf00WzTP3g=
X-Gm-Gg: AR+sD13Ab0NmvXDdBGbFEl1hp/iXgIkWwzXDVncL8JPNIglt5jrf//Pc4jFtua/Q6MX
	sOR6mT7bnLoL3rJdWTgDwntMeZbYiIC0EBgzei5TOAOTIiunMUi5bzHYYLjUSHkV41+3cqVKEOL
	yXsm0hnJYnZmwwPgK70WlWauOvUNKx8W63hL4XVE5bEwm+4Y7A9iwOtyd23Py7QU2Pn6Mhp9ZAN
	XIg9giBmtUu9CaHFVw/1vNjPz2T5j/XlGElPHpLVLtKUqE0yKE/vYSsfStGvbmXc5u1ahNmmI7Z
	Sa9tyHHInm2NBUac+wkW614HSLLSUnTW1gjh0kaRWgZDbylm67JELPR+n2vuKc7j7UeHhIIRFFQ
	cnAh/85+tc6osYHW5OhvPAi9oOSWYGVudaAbMYLwFPOzyQpQnPZpQOZxp0KHtu6gXb4C5KQsZpD
	e/ytdIR73kUaM5af3xXpZs/Khik3lwJNro5Ec0GCDaOnECfjFicrC/VFdOufZK/fsgneAvW3j+G
	Ilh6tghyvVW+vV7VuLLmxq2+hfLHR0mfMDlrbqusylg/UDLqdjhbA==
X-Received: by 2002:a05:600c:4f81:b0:495:4cba:e288 with SMTP id 5b1f17b1804b1-49573c99584mr49269755e9.15.1784830697356;
        Thu, 23 Jul 2026 11:18:17 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:17 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Jul 2026 19:18:07 +0100
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-1-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add IMDT (IMD Technologies Ltd) to the vendor prefixes list.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7b0d79ebf9bd..5c74da791c13 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -791,6 +791,8 @@ patternProperties:
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

