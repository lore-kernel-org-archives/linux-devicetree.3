Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669165;
	b=eVUDKiI+Wr/eb3bK/9w2kp+fjY9WwqagxVFYnAuVYYC8RPgM4vLqN0ngTxxoaEr/pWi6
	 HZkDkw+dBFLBEO7mGLdceOBBC1e+qw73MDQhNj2efvztxzFvrouaUC7IklXzbnlQX5DTb
	 noPZ6oWlSgWn5MjOKQ+b/z4I5LdiBpWOFiXYLF3pOdIKKJhVvrWw5Mh2cea0CVHANpvxT
	 55zHkGDN8x81tOKOjwCDxORA5FfFSI7f1X2m52LYgjE8wURvpd7ETl9yORkuHsOhAsMMT
	 vgly6RFvRv5bpWqRn/S+NYM8nAIQpHjYYbE9oHrVfefsaEDG4/JYPMqqtZl/DyPK1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=VCjAQS0/6dHPeLBmCJEOqoHNQUv20ybxSZ3VuHJd7l3HfsixRekn0IGg6mi2HHmDLBPX
	 GvmBszPDfPm8PZQejCdoBwODeTzb+ow4idbGcY14SwpTdFQWvk9cuTeNT0BiYuCIc4DGT
	 DkOGAKuFet/82CEHF+agFDZ8Tz0Lg995/Q4IW/+O4Uw9Gf6/veGnNEeia7OYM/3VFvJBo
	 Z+bLeHI7r++URl19Bl2sJaaZJmP9O949EgGU3Zh3JofcMS1Z26g4SxWTcXuBWqKscs9sJ
	 Z9macJXdBOtEsNy8zoxaH7DSsNbrxLfEyNmSfnI1Q/YqK+6ZOCwkotgtEuWtCxHKQXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC1606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386ab9ab619so8535885eec.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669164; x=1796273964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=g0EUPNu5vCG1KDaEwv7YBLGPLoMP8KZ7WoVFgrp5ESMpyu+wnidD/QLjIVYThZWUke
         Ub1fy5iT1lyS1Qhheq8ppbHt23EmO4mUDGw1PnB/2unVy2R2bty/WC0iuhmSLyp0Vtol
         2YEieXVlMiqDv7YQ9yxEeaT7nJeW6ag0YunW+V496cdBOJMzP0NzKs+3mbwbv+GGBKav
         JUNncL7d7oCSkyDB8BzA7VhpkDJ4+jsHDI1xIbf9en0rpLFzRBJ6a8R+6il36uFagNYs
         I/bhcBDhOPC6Rr9qb5NJeYOwMjbU9ZOQlVVJIJyVDQK6v2RMFlEEdD6L7CfvPq/ECj4W
         5tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669164; x=1796273964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=Ko22lhoTg/C/Gw3Td+letjuCS5h00X72jx692XCS3QzuQTE1u57eqE0kCR3oQMT6AU
         ULgZXF8BmUeOxQYadZNaUm8j+jK2Lyk5PyWly35yJUYkq69iEbEylV6a1L7FiWzje48T
         ADJaNY/IoWpetsa5bCglVVG8F8opInxcwc+YMErCEsUaIhxwlQquMpLLWDE0M7Vi2AuC
         YfiR1PhS0cGR+WEDCR9y3YZ8LiOOa49lG4xzAMugmZi0AcD76UO/GL3U51oeehRw3ytQ
         JP/yuRHJqiPUj3DcOn4iKTCMBn5FIu7XNqw6tCSLtKjc9UWwvakcPSWRvlJwLMq7xfvj
         H0wQ==
X-Forwarded-Encrypted: i=1; AL+hErEAomJMac7mTkDu7bG+xxaPd/tEDgbi/hqjHFFfGtZ4+PznXJXjg7yXuAutaJjUaLfaJsY99IGxu1OX@vger.kernel.org
X-Gm-Message-State: APuU4Z9auxpztQOOyHTngsVmyX0/EsABoRQ3TeCiHEiV26Emz/luQ0nV
	8cuRWTXY2p+FTYOlsg3J2osG9H8ZrtD+KLGS16PDYlF0+IpPCO4TsMJo
X-Gm-Gg: AZFdTZfLEjt2mS3Dv1Tf8GRmFX5UIHJzRXdJtPTY6cbsrw6ag8xfGc7lwaK0gd68N+z
	SG21R6zpgPGVUQYlW3NLPaeXRR9rY0Ba7jnQsj4BYgT0hBV9SrRGZ2JA8LpbQbfqvesOj+/mGvP
	FELzpf4vn/rw1oTM3O82WWhKnqJUC0EVHIyQlcj6BwE7iTJozCNCn2F5hr2/JllDOhvRffmOSNL
	P5GfhwBJlYD+F5qum0hnDmzooMYVxFDCBkCX5dE7ePGs/kjgzoLe+i0ir2lvN8DuFBTFvHPZUJA
	RhLM7kuthTouC02J5KX7GtoUmjLnBI2tzfju5VH35OVVFkfnkW383P5xuPzOsFth898SP0XWcX2
	rnMh32YBNjdR58c0eAl3oRKSRpLetxBlsGQjDOTbwycbh1Lg/mq0Q0m8C5YWRQRURniQy5JiLtA
	TBoVXFZHh7/J4TIcOs9DqBHSFhiREOXCBBmT20kfcfwgpwxGIaiS7z6gG8mhwbIQM8zdryJENfx
	jO+S/PYd9UT/SzOVwsIAAUBCz4ICK3A9QH//FGFP2Wyjm6AKMaEL5HbeDIJuB1v+h1uG1EgnXNv
	5/BhcNm24/yuVI8MX2drQFjfByMKHRnV+4SbBosR4dGp9pUBv2f33unNOtl1nAsIuV4I7alcI9l
	cJZNz5AiKqmDlRRGwKdsWdFenc/Mi
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr24177940eec.32.1795669164035;
        Wed, 25 Nov 2026 20:59:24 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:23 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:11 +0000
Subject: [PATCH RESEND v15 6/8] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
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
Message-Id: <20261126-sm7250-v15-6-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=r2mgp8vyKY7YS6WEV6WlbjzksgxAH2OHXCWlysqnGLfAg4qb8dWAEbzAtXsFTcCD/KseGgpZX
 PcFCJVXO5ABAnOZzv5+RU8kim3m9XyqAWQLCECJmV50I6nzgtR+FIy6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

