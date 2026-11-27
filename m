Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779130;
	b=wmNWXw/hGchgKsKWejz1lF4j29yHjGZc1FNEFhLsab0oIMoxgIIjeAWL4UO5Az9jTCiL
	 bNldw7ewdm61K7EWIJjv8YZ5PBLI0ekJKPC4U69oNdM1gz4barooBfC2zHYEgM3VvjyBd
	 kW0T9xfnX9rVG2APAwNBvYtY8EcgUz/9RxeRkmklP9Sot7Tylfe51OYBTR9+mBKTY/1oH
	 J4CBgL4lmpOMiUyMSH248G+WOyFrvpqXrjd8kyD5Yj2lxJVqAAOEQEHRHpvVWN/aqu7up
	 90g80MS6tzFNi0toWqqksy4TM3P7Zu3WuGl5mjFVAM4bYQB8mHuUI+dHXCakQGgPYvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779130;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=fLrO95tD1sW2L4bPMYbiHkDyCDT3vkz9QNbKAybaJ40=;
	b=Zxb3qHVruCvrYYWH5MuD1jX6U6X/IfiBbXiAVR6No2EZkkQFPidmXeDKpy7u8ouZST1M
	 OqSZJKdc6PXVLtADTKcu/PZVUY220xnWSR4KxrmxkJKPAMKrek4yvTy21aA61z28sFh+7
	 lUIDcBChgMUghMntXSEX2Q5BnAXWVdoci59dV1B2E9pAf3ayA2gGaMRPXGawHghwOTAXQ
	 K9l0FV6h8814Fbe5LfGujTeifLZEV5pCBz+l1vsYM3eJ9qg61JC64H8L7hoL4viqcRrEE
	 aSR5w3ywY4bUUiinVUxCAsZpoi0OSRNvj6tc1/7xRGaBWBt9Wqs3GWcGIXtA4XuIa9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=tn1egj6r;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F330F606A323;
	Fri, 27 Nov 2026 11:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F330F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=tn1egj6r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=fLrO95tD1sW2L4bPMYbiHkDyCDT3vkz9QN
	bKAybaJ40=; b=tn1egj6rNU4nuNx0CYv/4qvVqwzuKMjO3UEbjV7ez7B6jHvKTJ
	rMUhRQUyi4Z14+eDaNT73H6leP9iPN3siFjUv9aoAmtSXr4QyA7Jdv3cl1qOEzsX
	oMufjM92OLyQEmb+OuhD+3LIse/ZCeeOmyIkjH9r5N7lsLbKJQqx7klGU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3cDUvaglr7nICAQ--.938S3;
	Fri, 27 Nov 2026 19:32:00 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow the AMBA periphid
Date: Fri, 27 Nov 2026 19:31:57 +0800
Message-ID: <20261127113158.932414-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgD3cDUvaglr7nICAQ--.938S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWxWF4DKF4kuF45WFWruFg_yoW8Xw4fpF
	4DGr1DGFW8KF1fZ3y7trW093yjqw1vqa1aqF1kJF1UWan8XFySvF1Ykw1YgFnrCFW8AFWa
	qFWUWr1rt348CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jncTPUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAQsl

TNOC is an AMBA device, so its node may need "arm,primecell-periphid"
when the ID read back by the AMBA core does not match what the driver
expects (SM8750 reads 0x00000000).  The binding sets
additionalProperties: false without pulling in the PrimeCell schema, so
the property is rejected by dtbs_check.

Reference /schemas/arm/primecell.yaml# like the other CoreSight AMBA
bindings and switch the root to unevaluatedProperties: false so the
referenced properties are accepted while unknown ones are still
rejected.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran dt_binding_check and dtbs_check.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e5..279ce384caa57 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -32,6 +32,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
@@ -78,7 +81,7 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

