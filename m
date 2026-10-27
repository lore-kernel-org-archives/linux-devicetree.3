Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134367;
	b=exXnezp7FVgg67AJ85YnavqA1IANgmn4ZWRjHPMUkYhJ9o5ZZeWj/s9oe4GeVfhpw5eL
	 g9YaRYhCjn3DizG1M3vtt4W0Ubih8pdFsmreBxUmGN3vubUHiXE4pBR1i3cwKJzW4Z2Q5
	 ehWGZ+DKPYBqENewuECJ5rJeD9QVnnS3u/HiGcM8M8yW6EfGL8iMVnNXkf6eUsVqoYXLM
	 8Z5vypacwrAoXLPiULvLDXpfVsnmqJuVKJ1STFMqb6nv11xH6o3qifh62oXB1DpGU7bnY
	 hMzKvXm6JqCjW/xmXhZspUAOCtheNoQ9BRzBLle3TwTxAUmHzesTV/4aLulxGMVIMTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
	b=ZHIzs9lepKCv/VLrKMtf4FgOTjsQ9NgYNXmYjckJ4kLjB8eqMdUWnrKebjzNd/l/oZM+
	 Vd3LGAOHC6fmrX1ojPzwEYBnPQpPRSEd77oVgTWFRk5sKFwoq0Z1Efmax0ilcOLu/MRMI
	 MbQlfA6WWfUcIEzARo9/W+FSFCB6O7OURIkUcrqNEeF9vkxoufOgzGxkaYpem9pD+6OVo
	 UazhxSwo5eFs+PrcTgnfjrEs3DvvRMCulH5HhjWXa9ZzD0al4mfhwFZfNkEyDv7BhcbWT
	 zFj01bRZcQTS3JY+Uwk8DYu6m7/3v6o37otDVpn5veFfFNB8fcxjpkD9J80/aKat/zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlSdKImz;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0224606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 20:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0224606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlSdKImz
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so250587a91.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134366; x=1793739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=HlSdKImzgk2WYlBDUrX54M9HeRYTZ1bWEqP3eecZml5jDi+o3r/1CVeSCrqOsN73cX
         uljc8zWNVW4z6CdvOkNgflBltbJ+Cj7ZZFWeoC1dl0U6pUat3okGPtO/K4CtLxHv78MT
         hCI05ESMJDIuZPaUx0FGRDs5ikhkt6rSUR0DsRVLwQgivSQGa02wzeoOxw/qQ3m8PFCf
         KrMkCNZscnGz3+4208YcWJ6ga63Fa30abhgnzrAaSXkPtzew3pROSDwpR0bk62jTEVZS
         JtvVNBeSGjF2xFiRKVU58Foa5xhJS8atjbLcaX229j3AQVrDeWLYYDSXC6RhjARsgE0D
         0t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134366; x=1793739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=syTEg+QU9CgFDodUpk1qR4L5gEKioWpIdqx2BXoQ8VPVJx27j7I8K2io119zMONHVl
         wIDbyRGsQWeV0m35FfcKbnF8amp2BInj6t67poselI3O5z2tL9KtBN2FPR2I85e4bebx
         wOoALfoTKd6FRTK9c/jTNVScKWS5P78far0StKOU4XQli0ZKhrVMpq9rrlPdCB5QicyC
         UB5Uj9uBwoVubFWunsKFaSoCfxuOmD+U2JaVKJZxCkuHdCw6yWTmiqhQ8VdF/i3Bjzx5
         ApjcrDLForAJ1mOJbCBZavvxaHT3rvkvii8l+P9+9I/W4pSjcI5WVdUYhYH3XdCrEcr8
         CR4A==
X-Forwarded-Encrypted: i=1; AKwUvBwgRvIN9CsFM9MDVcowAqJphZ+uZlMVZjWguCJdSZGuLbNbC3I0/KVtz7QqDGCHo8a/NB/hVGPNQrRI@vger.kernel.org
X-Gm-Message-State: AFq9FYIAKRTvA36TjRiUyBAGMQQqPOFygQ/dp+tfAI5gvX/mCOEB4E/P
	fspL5goTSosmy6iN0JrKiqLMxdD3R7aEpxZqIHuwEky/g8bTIuZrqRxC
X-Gm-Gg: AYBFou3QSI2EM4EejGEXcf/u1YHIy0bVG3noBZU7pMC036RThQCvCrm2eVqNZbn7SXM
	Nu5Urtf+HoV9Yc0vEZplyiZDT441WaNpiA0HcElP1+ibHfh1ufeyCC3jj5zBK29mULshRF7g8ln
	BMstbL6FpLPA2vrNOf9vmLHem4K3/59STkOzPLDIejGBHcdjk5YpnFGhoKTzbrZez6Lkq0pnp5g
	8rrYFtswu541WeaFPwJlqjt3ifq/QZTizGSRFQbd1osYwqAZ8CxEv7yJiMRp8ia8qGOLAgGt3Fh
	sasqX0vgLh2kQyBLqiUMS4VqaTUokTzS5LhHq/1sv7fDa6hOzHdRThIv3NihkJc5hIO93A35EYZ
	yq3lB/tM8UBR/BEBw8SB/IiItwQjEQxHmKjO/fM8qYhyq4tEcfTc63spRKikZrANRo8BacjnRD1
	9r+xazrAE/v6QwIHlYHFlaTPmCWQd3eY96yClrVaStNxROqcVc//XhoQgV3c5oXZfb08o6mbKJE
	RmMrTRGMT9qKKqx4hNOklsE4JR09hlKwqYjUu5H3wQxC/Pk61obT1nkmaJInO3cISdPWQj2LTHg
	CJx0AmIp+khutJ2Dl8F4aaW6Mc5Amku0vreng8kkX7a+5bzYTyzDQA==
X-Received: by 2002:a17:90b:2543:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ae581b5095mr169710a91.18.1793134366005;
        Tue, 27 Oct 2026 13:52:46 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:45 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Wed, 28 Oct 2026 03:51:45 +0700
Message-ID: <20261027205146.16384-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027205146.16384-1-killdeath104@gmail.com>
References: <20261027205146.16384-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..8d2e4f0e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

