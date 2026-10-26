Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029272;
	b=kMRFaWip7yJQM8J3DxA4c8Yt5Tyu7oap7WT05jSRRFkqxPUGSEPJASUr+SRtUqQtTcZU
	 ne/ETMgPhsYRiFF16uvbKEUmSsnleEBeOkn4FLukVFB5ahjIDxqKMMwI3ZfmGZttRRBzr
	 Nrehn/rmFMVM4mgwo3u8+TwAjXmvhjblJoc2RjpzxD1yJj/s4qg7kYh4qIi6Q9NXnEjXC
	 cpobKAk56S8npPDjLTEpe1Svh1T0bG/gQM3rR+8IADxXSNRuOlwWcymvXIZa4PzTsPFnC
	 5a6M2sujj3Jg7wi+hfK/hGlCskOA8H7iyXWCcCXOwSSvdgOagmT5eUkyXP3udx8HHBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
	b=kURrupklxDkK1D0M7wvDIWN1lQcdZe04kSWVDesl0STdhzSIFmRiTx3UralP8qYd01dk
	 3ddQxeB8XXaniM9ah4fWVzqFRnguV0sprFgSkUcp/DImjVu+OTNIdsYHhxzCwGwSULcGv
	 n9LVrhuW55Vt6QHa4jpu6RCnrPofUyFe0azbb0um1YluN2RvEdEbnDXXPgg3J2q8pG6G3
	 aH5Z/KcVZfk95SvkBFJccpAHRHpXOKhyd60Ob8srvIEmFqzj7clvdHgJEY0CxmRvTgQCM
	 Te4K0BzbMRJzFnfOc6/q4djYpILENATNnMDd+3crOOai8bePx7qIHWrJKjXTLZfYelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHSv23ao;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23084606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23084606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHSv23ao
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-55650fe1f0dso1721805b6e.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029271; x=1793634071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
        b=cHSv23aoKBvmNZzrwMqxEQ8owFyPvY3MMf6al0nBxabp4LETXHemewHKhv7Q6xdcAl
         PP/BiYXMxGMdvPNh9Jm99FqfF1st2GyowVSbDLa2gaQrPEeClPc03oCijVPXssWs3ThN
         t5y8eV8XylNDdIX7Ar/4U3adMFLuWENGGr771idWkJx/FRH1q+DOcnKoCV/pnu+zyTrQ
         ZvnCif6tg1QJH8KlBjDJ1LCSWPqSquzsPzb02HFJbUYBJrCiWsKOnNVL6bgx8rtLrzvR
         utd60SPwNoJnG0zwcSxlX4PJ0H9zHCnCPPlVq5pZZ9yK4tr6dRnnOcnxAjEt3Yszd6X1
         9Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029271; x=1793634071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
        b=ibx5VO7zXH/Y/F/rRHz503kUj/H+6+D9U+jtCLbXY9Z9DhmM1LvBmo55OgSVZVWQNk
         nrnUCMzuybTB7m/LB2Sdot9UFxxJqkgsHkLHVhYHNSzRVCL3qFzGkiVG1iVeHRKVxZUS
         ddG6O0vpdxz+S+Z9ZzVZ7hFKpkCLxWm5gMj1X2/vUHkzzl/iXmSGiQp1ip6R1r0/0Scz
         s12oKgrjkdxCZBR+5CrHHVOeP9LsLUgpba6V54ozfWkKZ4AhdpxynYqLFaajgUIYzVby
         0jvPRdM8Awxaxr0QTxh7G/mo/f8Jg8fPpPagN8b5CDXiERFRomB39bByGoV52k6Jv30r
         MSFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKFuAZvf5hgtegjSY6sGi5ksCRCt+JmwAaDdi8Q9hKOB4rzBo5jt5poCu/r+QWWwPEh6bLyL1YgzvX@vger.kernel.org
X-Gm-Message-State: AFq9FYI/Nd3VgZzwc4QYEbVJS3mFd5EocR/hL8S4qdIEFXsZHyHPb0K2
	MuEE0wiji9VG2XaJIXvsFlcGx8S7fsqEM1fIITKDADsEYfD2bV43iStm
X-Gm-Gg: AYBFou3ESHJX+sQ3IFZMYC7mYdL+U4kpgD7hw16CvAud7CSyI+vB8b2DyQ9g+8GPfiA
	knUSv9CcvCnEc2tjsk7JMqayXC922KMsj5QXPFGEvMQkP/ZFLMGZ8RP1m32F8ohQGXG0S4yQ5zc
	M3A8RFqfEjqp5s/TtbSDqVtoBaqP5n6Gvos/a96TrK9nQGcG5UJ0TMr5pzmd2n+0vPqej6dZVXW
	3RE0fDsZEaWb94NFicgBU94wvrs9lEfj207U5h883daOEM3aX5X8QHGiwRGF1vGXXUnuIE4xSqG
	xIa9Azww6hus/lt85P4zn3MW1ft1CU6OmMmdLb2LwQRxZaZdThByGhmqlxWVrLOaQYNfniTs2pA
	Bd8pXW1ZO9rYeBZi9mxSht6ZMKuiVXZb65J/X6iW8PfHKjY7p7OEXIFyFYBmrzg+rQSH0EUJjhw
	QAeG1eFa2gKq4YrJpBP83MSFMaXRUGj9ZDEBO8MnOGd4yB1XWN+9IXoMjcz4EaOt7z19isgPFlS
	eQM+8s5OG+5rKdN1CB6zFgXc8KoIfzR66GcmRRQfabBAn73ASYdj4r2HSeWk/IXtITBkvnZoe/K
	qZRFJI2QYg==
X-Received: by 2002:a05:6808:1202:b0:4d6:90d3:e185 with SMTP id 5614622812f47-55c002f9613mr4694800b6e.46.1793029270943;
        Mon, 26 Oct 2026 08:41:10 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:a95b:f8ab:d834:50c9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c0c9sm4746441fac.7.2026.10.26.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:10 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Mon, 26 Oct 2026 10:40:00 -0500
Message-ID: <20261026154001.9323-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026154001.9323-1-jeff.roach0@gmail.com>
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

