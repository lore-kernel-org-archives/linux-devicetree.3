Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7073B42EA
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022181; cv=none; b=PRg+CpDJv4KdA0PbK2QSvcTVSyNOoekuEgpoacdnl4AEgMxwJ0U9dxGii7iGeIQfVe7tlccIncehdOoPCAzCyYzuYLxkOdWMhq/Fd9JLB0j46iI0TkuyU1hGKMWByCpBNeuGyo56h+8ZYHajpvJynBaS7i3WFVKbVlWcXy13Idc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022181; c=relaxed/simple;
	bh=EixlG3+pSd1+umoQcq597TULbcew8judyFI9QjElm5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUqbs2qiYg3vwxX0yooQ3a0F9EuXCjVxA6M8wvuVbY/5KjMby5ahEiUEZp+AznyeH3dEUAs53yF/TumjBv8JdgI1qq3s64XNmkSopa14cUudg1YK5F7CjNyt7egD18J4SSp9oIAmhJRsHvKY4dwseP4BT6H+jYrJXm11xMP5z8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7IqhGFj; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7IqhGFj"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-91550dda53cso678586385a.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022179; x=1781626979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H6CVxdwvbBnHBwu5wTdK915OM3mOvFPgDPWam3xl2Q=;
        b=o7IqhGFjshO4GfpWCc5WtIsUhEdrWQuu99r4h8PUVp4b3K3NXD6xT3xYVPZ8xCDNg7
         fZQG+VZNOt5zDoUCzFUa/sDTCdfwTEi8+/UpxDdJ7bWTJpUWxaDBTIKNl/8zs32VmT2X
         VzU4WYXHAOJeEMryHzeDcfo4594/Zz4w2h9wr2iT46jZUUSqbzsJnIFGUyCbxwIDcZnJ
         ixmaalT+baYSOh9zirSDAN/6V2Kfy3ktLX5OwIVJs0sQdHpVuehcyITqL4AxFqBqlgAD
         EIyF8IhNUH3IW2JiTHknYcS8HbGIoV6JfX9OEtESfedV+d2b+Q8jAxckOtoYLCVhapBx
         oXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022179; x=1781626979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7H6CVxdwvbBnHBwu5wTdK915OM3mOvFPgDPWam3xl2Q=;
        b=DtIbC69uBzvIdpNGHEnfndRPzDUcw9eL1TCZn+EsCNpZPdw11ZDLJJyrCZrQZftGPH
         1FGVnsadNDtgWjKdKjJyqsFajGIZHu/1p7G5EUrTCKeRCHEW+kwyx4Q5jL0YuakvgqrA
         htlNSeWggG8e+SoNhiFTOOpjh81pJkm/dE1uZyA1jy2pGaT0MHc6SNzW6BCC3+9bTwj9
         4CInOny7rh+Ekcnb7nwLFjvMm5ljhsgloirRBcKx6q3kHCtdiU/6s6EtIjd5ShCpHbas
         /aS/cXo1UOZmkqZhYTK/c5fhWOB3u5lankdXxIrD2PQHn1j9J/2CNBj+YMUPdl7e8j3r
         ol/A==
X-Forwarded-Encrypted: i=1; AFNElJ9rZjqoixp8XKl8OPaNkmViMbTlm30ICgAz6PDQKt9qQO/zTvIkFl13+pfHkLHnCpuF5sH6clFAxv/B@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSgvEC3h0OWLHzSmbq3MgHmLDK/SifpIV3qvHno/aFtQGbO5a
	mDpNmuUSM5t2jPay1xHqU+OsailcuhY7YE3C0iIHp7H0ivXjIy4eTG5k
X-Gm-Gg: Acq92OEnUKKCnjYxGEBqjLQsRqQ6jyNiNeDmA+GhKk+RKpYbqSayI83b46/9O9T+7m9
	0ulzx+/vpahMCcbkv2m6F8iIoJEmkqLtxZSIEhzEMGOXDfN3wfC3K23knC/D0wPmN5TN6zdhp2e
	5hMtSWXr3K+J+kIalwxNguWj7Xdh1ebuHScHBQIdYEkoeTPmcLve3nNOukGBD3q1qLK7EybVR6l
	kA85+zvWAteyeQlX982xnUXTOZSKAR4+smumffO7FNAzRGZyj9H1qPuwqQL9MInqUv78ZBfUu/e
	GXvhpkPYpTmlpi9CtO889u1bpmB9COr3bnSBvSiXbSC0n+GV9diu3CcvYHSvdariCSPOZI0PQIr
	4LmaasMA95inZyIv65cqb/7x3NKGVLWVf9YcbSCA5xyF5R9tgxMlxi2k8tUFWx8PLjyOZQUxAvJ
	C5wRaSXwJ6XfWWisMPrxg6grcdBGK1p9EP0wTHdA==
X-Received: by 2002:a05:620a:3723:b0:915:c7ad:8bd2 with SMTP id af79cd13be357-915c7ad8e62mr1920782085a.30.1781022179141;
        Tue, 09 Jun 2026 09:22:59 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d3a0esm2184525585a.40.2026.06.09.09.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:22:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Tue,  9 Jun 2026 12:22:41 -0400
Message-ID: <20260609162255.31074-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.54.0

