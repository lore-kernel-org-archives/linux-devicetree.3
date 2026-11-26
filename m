Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674679;
	b=EOmyHyzqq+vrbAk7t3LZ82vfwVEAoHdTcwFP6NE4XqjxVSD+YOA4Uyqq9+ziD6uj9OHN
	 F3G6CZyroXIcdOHenxgD8jtKpCFl+MdcLozTjpcT+k2Ln4squ261nPDuE41+DyXX9/5x3
	 AkPphZm8sX68wX92pL16sLYUp10C6/IrlDjCBO/p/+D7Gfh4zpvXqnCSaEJMDHcKGY/Qi
	 qQWo+yVnzmfDJJ9p1PL94PWysMaRYsLot+vCkptCvgfH9XLCcOGWS7mwGfKaN/cpoVIA+
	 +OzJl70mqS/aEiM84dxN5xbwu7NKU1ANHgO6GVtkH4RiEcw1fUmwHLlNekCWDVwGsBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+eLYgfBAkjmFmmcTVzRQujd4paseXj2/5uFjWz/lHZA=;
	b=Vje3ciEvY5TxZC7GozJvIoJclQjPE+iWB+r+tCwvh79mp0wlWfCAcAAAjPJLG5huf4Db
	 1VOJG03BlpmFuZT8yc9E34fQPFocwGAWoVl3JoEqIWftlHzdD80BIVbbedQc+j49XLax3
	 FgzbZnYi1v6FZ9kuzmhVJUEO1itIOcU3HuXrV1EG0rB84dZRGmFO7Ax8LRJNyEk3t4UBQ
	 R/98y8TNXSoM6gGFjA8JLCZ1icuLUq3tNIBZql+l1vpD6K52fdWHtMbyM4juGon9BbGK1
	 uqq0wUEuHBKkPmtyq1rn2Gz1j/hp9TuIiboG4/Vn/8D6w7HgrT/MDfClgpwPZRdIbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxSq6isw;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F98606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxSq6isw
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so766211a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674678; x=1796279478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eLYgfBAkjmFmmcTVzRQujd4paseXj2/5uFjWz/lHZA=;
        b=WxSq6iswh4gERHnq7KF3yzR1kEsSgP25oEG2Y52ZCyDkgFbEYivNnqmaGegP9AYgGV
         5/mEujXOjNv0LG0pskaseJsRoFtxoHRpuza1loGsgTEVyig9o3MFGPKycc86OSa1JjXp
         wMPLBwJELutmPtFnm7tR/QzdKrBes2tetHbsBpA5ZkSXwxdOjIMccbqdXszJdrZeh+ql
         TC5osXtML3kqt/a082hddVPQ3rLWg8S0qIA0MS9I4Q/zUluvnOLHgfsOhA3QbQYsxb9C
         T87TwheaZbpXQo2iS5s6CemobHuNDDDdY8Ws12aD92O1TCf+fZF7ZF3tfzBRAHjvH59E
         ieEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674678; x=1796279478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+eLYgfBAkjmFmmcTVzRQujd4paseXj2/5uFjWz/lHZA=;
        b=VcVjpL/2dq1d3qMPIyzhY3D1169Bgus+hCMDkaf0FZ/9XG5FyhVxlRJWcRYPnWN6N4
         LKbs3bOxIDJqrsAW8qePuc8NoLfg0whWK3R+NbV1klnSuiaPCYIpGTnBigYdUbC0rp77
         giTjGOAV7aVnxAN45GCKuR51MPAWwxUxCQqu101BRfp26bKhvczQwL33GnqlzlRhFJlw
         RKYSIjP2lxwY0j9PH8UtIwbZgtmU9SJR9f+6UvMbN65AaSrsEhHyy/msMCl8AoYkU02c
         EdGvkmI7LOPJOeF12MXWSRvTM0u5FFFYnEGJalcAqLpwk/uHWK3bdNv3+83ik/YXluSD
         cI4Q==
X-Gm-Message-State: APuU4Z9f8JAjhfNnpjmAnAS5LUB0wx4IIsdK10zI8i6TH5hN2D++aMTf
	pb8q+FuAGEJeBHsk92C7ZUt8FoAMloVy79r5gAvgOCRO4ihXsRe+Mtcfvvo4D7DT
X-Gm-Gg: AZFdTZfdIH9UFF95ajk8/epBrpJkqPdvIya0vJu3K1IAGZzrioDGuOcKmE0xSCOtTeU
	/gk0VPM/zPsukIdXDazyMolfE86SddrVv4gR7yYqCeDa+vLe1mn7+RD4++Szk+vZSn+ZDxerVud
	UQmbKFOWuOcKXo9fb6egpF+o1lTesA1f69bXiymWcrjb8AxglHsJsp4sOTL/6jLwiqdA1Loy5bx
	nSz0SNrZEVRDBb9V32g6oc75SVU2T0AH2M4KriS3RG3TdaYr2fkrsEWUYicNG3zG3EV1nPtFe4D
	3EfCVA1GVYvZbD9rC4OpWYiQP2DIxGF87Vgx2Vt8eFl8Iyw1TKONanhAJE/wcgfSm6yX418gULb
	5Qnp2/hQ0b/Jy+QkwMGNA9wH2Hca0zR9w9Z2dfTB4gNl+dmuXdeFL52s+agPJTBe2PBniJsSECZ
	yvjN3mxowCQpJzr3jbpb2xhFQqwfg1q4YyA0sLg5FxxSKDitU3AODqfNQmm66+WMOqMFQZYZdrM
	mmmfLBGdMRyYMM68QSQ1C1Bjv1WwHFc2gpnDe6w95rQIPNq8wOnyjWMox8qfVz3sLMBkGUfjXFy
	KrQnB5s6J1J2BL4pmQvKTRtZW37DqZihAiqSO1DJsYpHv4fw1+kaxA==
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr31782071a91.2.1795674678516;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm7906328a12.27.2026.11.25.22.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: sm8250-elish: Distinguish display panel variants
Date: Thu, 26 Nov 2026 14:30:34 +0800
Message-ID: <20261126063056.2276703-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
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

The BOE and CSOT variants of the Xiaomi Mi Pad 5 Pro have separate device
trees, but both advertise the same root compatible list. Firmware using
that list to select a DTB, such as Stubble, cannot distinguish them and
may select the device tree for the wrong panel.

Prepend a panel-specific board compatible to each variant's root node.
Retain xiaomi,elish and qcom,sm8250 as fallbacks for existing users of the
generic board and SoC compatibles.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
index de6101ddebe7d..4838f3950124c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (BOE)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-boe", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
index 4cffe9c703df8..0ad0a76ee9d04 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (CSOT)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-csot", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
-- 
2.47.3

