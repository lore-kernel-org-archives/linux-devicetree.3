Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598000;
	b=B+P0w8GQjQE4caJHAqORpevD/gletmoEeWdC/p/NroNAjt3HEqjYvQn8yBys1Ld4XppL
	 TK+U84DNr/fdI5E81nsdwzK0QbuhI0smPL/j6tmOlaLVUBB9fqvgzAxbbcgBmo6f7oz1G
	 +eJYsDwbVMK0qVdlRgitHe5T//hC7hXg81+kIqsx6Y75KeN2KgI92ePgv0IIuBPFbGXpv
	 TJWJiAeediO2iEf4sc5BvTY5JAaaiB6e4tl7q/+SMaGfB6k5pcx5JKlVIqCuQBJvwU0QK
	 MCICMCvvaIlcQCGZddxBYYVG2fSJ4OZJOneMnd5GNJ3S1OkYx4riJQXEZNzgXwjaTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598000;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XvExC2+tWx5r3ogFdwkXOxMCwzM9eqisKqe+kdKim/4=;
	b=PoGUZ7E+BGi7SjjHtW6u8yciXx/lavIjQqU4v4+zoU9xClYwmVngeYcYCBrMY26Fg+Uq
	 H/osKYpT+abdlycB9JPlmZbJAMgDpJh3jDMPX5po55tCke92u8/JbZG9YcKk9oz3fMAnv
	 u2iC3RfA018p5VSTwHRbvufZBf6xi//4b2gQGHoxxFE4kqAonpktyvWhe6KI+qsgUoxtt
	 6vuLHVicWp3kYzeSJ9YM+79yjp4IAv4crgfR8lbrNj68+BkIH9Yp/FWOnuQVOfTua+/TL
	 P3u3Iwx2E/UpRAZhq+/7OFTDFbJsZ84oiimVN4m+Qbu18yyHTGdU6V/gpDLnWzq4fcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="X8fdb/em";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADB6606A329;
	Wed, 25 Nov 2026 09:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADB6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X8fdb/em
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=XvExC2+tWx5r3ogFdwkXOxMCwzM9eqisKq
	e+kdKim/4=; b=X8fdb/em1QITN2b+8DKsyEwkVHgQMz+6htVgfP/ge17jL96M3W
	eTtjxR49P+iaFKQqT2HN+BV1NH7vH5bB2eMs0cXdAw68dycfgeB+GUI8lNw1fGVm
	2O3gVhjlHKzHKz9UnCdK+v1nG2Jt7r2Bk/nUo9aRqdz3ErLf2WPhwiwPI=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHCT6lpgZrtr_2AA--.2407S3;
	Wed, 25 Nov 2026 17:13:15 +0800 (CST)
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
Subject: [PATCH v8 1/2] dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
Date: Wed, 25 Nov 2026 17:13:08 +0800
Message-ID: <20261125091309.124354-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCHCT6lpgZrtr_2AA--.2407S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1kAr18uFW5JrWxZw13Arb_yoW3XrgEya
	1xX3Wvgrs5AF1Fgrs0yws5t3W5Jws7Wrs7Awn0qFn2y3sFy398KFWkt34xAFy7ur47ur1f
	uF48Wr9IyanrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUby8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x07jeFALUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

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

