Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184200;
	b=lcS7RUrW0Fom8xUlV2PvAcYCsMrodc0VjikIPezqyHTWKFQ/7YBHbYb4vMazcMDpf0nz
	 odhmZUEZmeLG5m8Cx/gIDz2S9tS+M6a/vi0erY3i0l/w4M5eovoa4oUQ2KvF2sVnUEEsa
	 g1Ew67V1yWhnIa1pSfGj6k/oP7aSDloFJx/fqnYUuaE5kyk2Bvgwaw54uASDnOTaK7dl6
	 sa+AfVaKBXlM/5xsiK70Hslq0Bgy0xH8fmmB+ee74kNjTO56oAhW9lA0RbKyKGj36pM++
	 /3pjreFTw7x3RWnzega/sOXoDDXpoOCjmS/Agt/Et3uWsRhZQvoSABHOrgh+v1vycUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
	b=t97tR69e2f2FVwwnTjt374Cdg1pHnZ6zeXqbFlXvbLBZIBQTFcgQvS/tLHy0Zcv5d8sb
	 CMIi+zwiSLjaNYSjxdrTlO396B/na4N3Xiy/yBU2HNq6mhsmeE2fqAXl4iIF7fr+amunW
	 eKBZyjPst4hkpHWgTngMOnHR+UcfNoLZ9X0fpzSgixdGczc4yVHWW7nMcU/RinaZxKDYK
	 9tbDEvvqzotaHlSjZBrON4SI2m4GTdDCI1M4+UEoAmzFquLnBbc5Y8I299XEYIvQ2Mx9r
	 YN/kTUima+qiCSU3sihxmrYamE91AixEp+u349fJcqDkHbLvc3AIQjvYOztqtnLj55A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ify8EiE5;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7B606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA7B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ify8EiE5
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so308804f8f.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184198; x=1794788998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
        b=ify8EiE5p+68P5QNKi+l3dMtkPP16GvbYO6rdEREedQp2Y9270NLejDTyHFsqU2gen
         7vTLOi3RvBgCiN8Mf9HuHJVOnuPBWHxNakhf/9Iu89b7iFMixvQ54a6T+s0nmCq9NoTB
         kRLzVRg1hSJ+jE+kmackVFXicz/DARG4u0+D2piKXAQ2ukbejN2x93kygJJQ8b8bKznV
         C4j5/4V51GG1dOawM1kfnCb3gADE8wbzZE1pn5BzgxeGtd8cbZhF2hsv4CoXz/f57CkJ
         K7tvV3a41LnN+CYcEDupNFekHD5GjCH17lZ+Jy5CrljHBxUOPn1CFS/eRagGFmkEAyIt
         MSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184198; x=1794788998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
        b=AcdbF7VutMXc7sdTky1Akw5PRBuANHF16EQkEU96PCGiwdMiw8eNIAl2MS6jVMwojP
         Zf1C0d9WcOzfmxGnwLp3msVXWPxp6dlkETueA8ofoKJ27R4evSedE9uYiiDSGHta1eor
         rpgl7ZTSVHuGtgN9ltS59NBP/gaxe00Q4a64aLE5M8kDERTKujF6grJehWWEbEff9Ap8
         j9KfN4BVatgPBc694msgj4MrJkQrG4trXjmy+ez6jtZibTghjeZ9Cdo6/arqR/Ta9sUf
         23CMubRBiwFLURqzu8AnOR4xDeE77FuP0DWD7g3QmjYiDIvzeYigd8XZwO2/isOCignA
         e2Rg==
X-Forwarded-Encrypted: i=1; AL+hErEpyV1pNMxSafcnaqi8u0oqNFYuCstKVKE+4TOCRTRU2y5Kh93KVyxil/oC4pVVoobc3c3On7XK5qjC@vger.kernel.org
X-Gm-Message-State: APuU4Z9NkP6xI7PGWXaPF765ac3UHhRJAYOlrToWQM6tQfofJyqEI+d8
	PbV34t+IqL8q/RK2Hrj3npXrlhVaa1tCiK3XdT9X4miOXYQE3jSE6glWm3WTnSK2NDw=
X-Gm-Gg: AYBFou1P9vUJjTqfQj7qYK2EzcHHECeABvJrbw8y8jokUKh4M2yUkuc3rUZTOynZ2nj
	EoZHlFAL0TdgGgWUFSBF9Q8uAO5LZ2081LwsOFtIjQUgziXFcJWZEXYs+kPN9Vvj0/kGGpPqLTr
	Ar5quLTrI8bjy4+BdLvlPk2H/pZB0PjfGVAZoTDV9Pr5czWdL8KnfqzRgdyQiEFp3CWeK+rjVrD
	9PIR89fHxp8YbFbp+lj50qbPgMnh2R1YwIQKH1NEeD51GagnkRk4bjP6exa70lw97gnXqDAnFxz
	yxJsWnkDI92kUWDsdxlOM3zAdUGuwyMQtWLRWY4eLsAEQpE4czCSYZEOoBHKAUFKjP1OLyL7tLA
	qfmElspqOUar+ez4rJhqlkUunwu0497a/rV5BVtmuNI5BtbfyCSbqwJVc2JuBHcXJpiPkJTEZ+F
	qGw3m+ZR8j8Hj76e9Y7QdAJdsUAXNJAD5BsTWQ+Zyb9HvB9/n3psF88fzhI0/Ku2yAEwd7Pf+2+
	KkZJcfaQf7fDcUvpf3YrdfO7Cl/WJtaEwq9AUb4yEH3FnkY7bFezoUCk9op8RyEvWRwUD2Ffeua
	nBwxiPwyeuv3NSQgWOc46ZCELBDgethYhCi2QhBe
X-Received: by 2002:a05:6000:1a89:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-49585f85ae7mr6393858f8f.57.1794184198082;
        Sun, 08 Nov 2026 16:29:58 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm3479742f8f.9.2026.11.08.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add interconnect driver for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:52 +0000
Message-Id: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAU8WoC/yXMQQ5AMBBA0avIrDXRppVyFbGodjAiSIsQcXfF8
 i3+vyCgJwxQJhd43CnQPEXwNAHbm6lDRi4aRCZyzjPNejOO5MzJyFqWK6OkFA1qVUBMFo8tHd+
 uqn+HrRnQru8D7vsBiUZdo3AAAAA=
X-Change-ID: 20261108-halliday-icc-65a5442be859
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184195; l=1171;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=IRLmg/T4Ucg8fvDrl6bT8sXAYm2xObD8gKEFdhhsCHE=;
 b=lGzTTrqn4CIpaQ3yuUtw71gJGLHu95Xl3xghzfcX63IbzmYYaFNRze7fyq7lB969c/V+njIFx
 U3IaqwXIkvaD/gi7THqtoaOagrl45KEfyz/rxyv/2ExdFssL1eFvW9j
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document and add the interconnect driver for the Qualcomm Halliday SoC.
The display BCM voter is left out for now.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
      interconnect: qcom: Add Halliday interconnect provider driver

 .../bindings/interconnect/qcom,halliday-rpmh.yaml  |  131 ++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/halliday.c               | 1909 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,halliday-rpmh.h  |  158 ++
 5 files changed, 2213 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-icc-65a5442be859

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

