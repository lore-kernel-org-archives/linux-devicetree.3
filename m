Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A184AD7C3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165806; cv=none; b=kYNpdobsekfk/9cNCwceIZwBqLloWrxxcFiN5OeJKIcazkabeNpEi+Rk11cYEnYK1OK1JY7FtGkgHDsy27+IWT8DbBcCDwuiV5aK+smXZTU1Ez2DANeW1bbQT45YfV/B60c/qjocRNg3i4VLKrviETF4QUltEFIJ03ynMt4bX8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165806; c=relaxed/simple;
	bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDvOHOitp6yMaUlvg09CFLEIgi/dXVznqw8s+JBpoArWy0r1UAk0GrFibbKLv1GTiyman2LMu/g2GvUJ9F7vMrYuDM1b9pouzbZyh/kFZ0nKvzlLEF2Lzx6oyFKkPQHbGzkAhzSETT/bEhsGKw/scbUbf+JvSAYIf3y7CqVGE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oD1AeWDl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oD1AeWDl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso6321365e9.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790165799; x=1790770599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=oD1AeWDlnFEvfsZixi3ktzLtCDJvW36XXqWeNcqI4KgQMX+EXI9S4E8sUCGoBAkgGT
         ZTTAHCks2m+ACVLy89wqDoT4uNy51KSoU8CnJRVfgyuGm3atjaCmAiQHl57e2MwBGYqR
         T7xFIuTzFl0hq1Gch+Gm8wk55gHa2jBKSSqf6McshobAEeqLIOIExZhyroKAcoynuQcT
         FOUYnPUgTImsEv/133dLd/DTR1nHxD8qz8/xuOHPzIvwiWUbQovJ4WZK6xhyYPXurAzT
         z18KnZ94S19U6+etfdEKJvXSyUoNUp4XCf2/et98USziM86J1mDw6yphxbljdFJFxmWG
         CPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165799; x=1790770599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=shWk+VcJZdFijU9WTkjhgKTxcnM2oHxIOiNjWJM4s0SWxrn502xmVt1w/+mZ3L3DQq
         Y5LXG+H1O4ah2eQjrbv36+h5QDCmK6bufMRDBAWmPK1LZ1IpUsuX45biPBMyraXwCzkD
         Vw4gLT1mXZjiRooXq1ifmmTKeJ79KwWoG2C82CZt9NqGhIIcWkYpklSJNiWQIVdqdOAR
         AOkRz585QqQJUfLPgFK3XmMPR1g9s1lLYBc8DtWkL5GXHc8Yth5FD2imigCrVfoVYv99
         l/T/3+WPPZ4kJBIsDXL1FIujndpZuWHczWXCv52GtpZ36hvoJufnHo8V31cjata3Ua82
         ZcsA==
X-Forwarded-Encrypted: i=1; AKwUvBwtv6ehQIkX486Gs4Nzcl95Ugeqml8BX7+355RuadO7aYByxBrNCqjpYLjlNkO78lXCF0BVCIOhkRHX@vger.kernel.org
X-Gm-Message-State: AFuF++kyfDlQrGpafu6dJ7CZgsmCNcm8fyn0X6cmm09CBG9yz37WgIeP
	9jBwoQjysW/1hoTGjDUnc7DKbet+XJVwsCYJU+2Ka5DhZ8YkCrxosKuZjjA7PfDQfp4=
X-Gm-Gg: AYBFou2hpkzuDe4vxUQhXQHDNaztej4O8UnJKNQN29+54RDq46Szqaj922P3ikKBNV3
	c4q17H29cDTlXvL/SB1RIOrHOnCP6Tixb2pb4sAa476uDchrVbu8D1rr154O+B+nf7YQGifFX3j
	lPwND+IU956VWWlXWwOVm3FCXWgXXG9pDhjkPe6Y9r2ePqfBhRdC+nbWaR3HS8xZ03Gh34cWed6
	8z+VoO21c3z9hCUKG3AVy6+QMA3hgDWiPY5e7J2PHYgqwtLP1+YgCAXAqqwGqHFyTZ6LNL10aRq
	ofMZeWi85tsVKe1hgdAoZsKeAZOCTFrTi33m5534EjKytdWfCtvFnSewdLpuiw8QeupERlebfFn
	oedHxZheYYkE8gTYHah5EKYVuZQcIc7dyY8w8f8PJK6f5KMEampcjALcrpJiPhG51urYROVPOy0
	4z1CqpAcGco3wgCJhBDUzs+Cv3f25mLKkDlR+oH7Etn4S9wce8jGiyN76iTzqXvnRcbwjts6t34
	1uftSaaJURZad9LRxN8p8wfpUPnfA==
X-Received: by 2002:a05:600c:c16d:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fdee0b7f2mr31248345e9.6.1790165798862;
        Wed, 23 Sep 2026 05:16:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm5410298f8f.33.2026.09.23.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:16:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 23 Sep 2026 14:16:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: document the Valve Deckard
 headset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-topic-sm8650-deckard-initial-dt-v2-1-8361c4548efa@linaro.org>
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
In-Reply-To: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqs8Mj5TJDcH5ec052eG5KgX9HZ7Ea/UFuN9GKHSfL
 YRIfyL6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarPDIwAKCRB33NvayMhJ0Q13D/
 9bdnhDVIsRT15xrCfzJ70ZyN2qHEoRoFvMbulhLAZXqZFJQT38TK5Lg3mrz7+UAyJGbvsR0tp+1O6l
 RdTJ+vhu0oRIsFzY8QWA12MmPcZuJeJFqScye8urN4Khv1bWjn0pKlrgB6er1HnlofE6sz9VCwmrI4
 pskYBxxO6BGX35w7n5+VkPNFVT/y68M63loyEv438YAjLO0Vw1MkRMmLbtPPbWF4U9Kfi3PaBDQb5i
 x9bAX0r+HuAvW5l5NXfGykqamkgS9JBY8cqpijCQYmilIf/EJNvUPv59MXo9G/dx6tB6ASWE7dnR5c
 j9oENYfZfIpwdQU9Tcyy+4ZBpN/objqqWTRHoGGZIZ4GqSKTFWyWNg3EnuVnFByZ5giysL9Mq8pmo8
 qi/mZJBftaZ/cdH+XE83qCuKAFtDy1pyYB/vNo1kpdJTJTD9xcWhPecQaGK05agiXk+Rnz9fzhs/6m
 FrN4xg57csDR0PTOSu49laN3xoOE/1Eb8mX7sp5/XatW3fLMIbXIrN8leQ79SiuVh7m51hfCgT3BZU
 ro68cmxLNNah2n9YvaXE5oQU2Oh8girZZVXgJAUWb+aSjsyka0AeWbSzESEuKEq9l1L4VOJGOxFkQE
 yEeBi0SXKB8KViQzSMXZyzw3Ow7LOo7d57dT3SaBgHVY5hjJmm6qH5VmnWvg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Valve "Steam Frame" codename Deckard.
The Steam Frame is a virtual reality headset based on the
Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..0130bf93987c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1164,6 +1164,7 @@ properties:
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
+              - valve,deckard
           - const: qcom,sm8650
 
       - items:

-- 
2.34.1

