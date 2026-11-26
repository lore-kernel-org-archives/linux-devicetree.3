Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652536;
	b=PNr4JNloik632bcHtTndwx2uSPNuoiGIA7ng3VN0wpDCLUjvkUfW3cJz7P3cH1/Y3Hn0
	 B2g7MsxCyk+T66FpmTPKwl7DyC/yknG20dhsQOPeANMJ2xgWCA9nWls6FNCwZyksmqd1h
	 St8O6lEY6dTv03JGMdhX7h3+Y8ZmpZSafZsEBLg1VjgsdChts1XIzdU2q5HnWIgQF6vdI
	 QzMTQL5jWiXy4N2dSRCxkDDNkcrC4I/gv5WlsrH/VUZaiibGt4uM5YGq0xi+iGwDgODdC
	 B5UemnS5Y1+rBrEu8+JY844Ce1jkfdRdnJvDrxMufCyEmIlP3gqiwGJlu9xTblwSMAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652536;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XvExC2+tWx5r3ogFdwkXOxMCwzM9eqisKqe+kdKim/4=;
	b=K3vkOB6jPJPAhWKmT9duzoeINOv+QysVLTCc3mt1Bh7tjjec/yKFf8PQax/PKKUQ5aO2
	 Y2ckmez0oRysHcEv+iYxRSSK8nf2qX6EAO9T+4okzOihyL2DxnU4k4LbVBwWK08IaJ9mt
	 Szi1tJufwNLVLz2slQ71ztnAM0HIPZ8hfmIrxk45JQHPlVx/+DH46pQxsjcQBc8ykXOhy
	 0YAxA0gVoUy6ZA20bL+1GWe0cNyCtFmrnoxvDu9u+4nha3HQpgAFHqHlVV34HWeUYORjR
	 RGWMiHkHYctw/6QgeNqElzn0HD/9i3OlFC86B/Q2B2Q/vrr8HgSZ78u3jnWVrDopiIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iX4LbI4u;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1513606A321;
	Thu, 26 Nov 2026 00:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1513606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iX4LbI4u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=XvExC2+tWx5r3ogFdwkXOxMCwzM9eqisKq
	e+kdKim/4=; b=iX4LbI4ujWm/bmOcd1QtAFfjcTvtoGo+7wOayOA82WcKfvAxF3
	RYy1DPwgZO3nhfHPTkiTcNqrcCUXKJZuH1Q1nstL6e1L/GaqAZ8tZSJdDv3E5NpT
	J4ZmBGQEp9qPWHX1hfsoZiPkWsQtlTjKqRlphdO4+ymbHc0OSHakuC2L8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.181.84])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnnzOmewdrvLr5AA--.1516S3;
	Thu, 26 Nov 2026 08:22:04 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
Date: Thu, 26 Nov 2026 08:21:56 +0800
Message-ID: <20261126002157.1954799-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAnnzOmewdrvLr5AA--.1516S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1kAr18uFW5JrWxZw13Arb_yoW3XrgEya
	1xX3Wvgrs5AF1Fgrs0yws5t3W5Jws7Wrs7Awn0qFn2y3sFy398KFWkt34xAFy7ur47ur1f
	uF48Wr9IyanrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9xYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6w1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUxH7KDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQA1sI

The Lenovo Legion Y700 Gen4 is an SM8750 tablet that ships with the
lenovo,elden board compatible. Add it to the SM8750 section of the
Qualcomm board binding.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..a32cfb30a1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1220,6 +1220,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
-- 
2.53.0

