Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670465;
	b=37VDy5wXh4ItsIq0p45Re7iV5L6OWiRkUYBD61quIMWL/OZG6FyFba3O563gW0epj9sk
	 jkxxSszbi9fDkddHKGnTgrYWCf4AGhvbwR8Umtg9q/QZsf15yi7cp9ZRpzr2oRhc/Q5qx
	 hHjAD1OzmbWHlbvFg5YX514DaxiQyS9VVxYuf0cd4pGJXrqHNuu5r9crHzoknXDLLmvNr
	 /KJNrI+7T9XLC7vQrS+X4IiMHkNhBhUzrKiWHPy87AY/Piy7na5tALNJFI6Imw3+ujCuD
	 zqEEl4cwyaB1aBH2dExI4H0UlBrUhB0Ne7HmwO/7gnQq22tAOdykpfovEWQRf5RXwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670465;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9IGvHQF73alEoj112r5lUUW1Yg+2wm87TDakeFNsZLA=;
	b=ZCYhy1JP6yT9OAbQc+/4nZKWGDyoAvYrhK84iubIbd6Y0qFZ6Tv+kKqg2PS8AZZlpeG9
	 VsY6eqhkQjlkx01HNuTWFOE3XjHWBcqxB2QES34OolP0q6ioh8Dytd4PZMiiaH/HCvmaE
	 MTyiBlcDLFlWM+ZcFbSp4IYvsS0x6HRuE7ae5PajWFFo0fe65Hi7yRrCxwKGJQmvN5lTW
	 tcR/rSqQdjQZES6KhQi67+WixQf+TLlJpn//iLmz2KRQZmvmaKuYrA7SK0LUxXF/mu2Oh
	 WHxmMf4xW8DA8+wmROcPrLnBDD+hW57N4as6Zik3UFLjPMTAYvdfV7t+YoGkanzcdkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dBxRt763;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6970606A31E;
	Thu, 26 Nov 2026 05:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6970606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dBxRt763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=9IGvHQF73alEoj112r5lUUW1Yg+2wm87TD
	akeFNsZLA=; b=dBxRt7632IMzXEYNZvZUhP5wxPE+8C0/cxNki/ny9KZ3GILhwl
	MvSlWxDfAZs8KyEo8nmCI5qiKcvnRYT8fDfFTQKPRWl/4DORv+Hf2qC+vgBUnz8z
	KwQGfmH4pynOMXkbFoVE337eLHtBGMfjuGiv0cRGA4w/KShyQp3nWg0N8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.120])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHNSq5wQdreQ77AA--.266S3;
	Thu, 26 Nov 2026 13:20:58 +0800 (CST)
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
Subject: [PATCH v10 1/2] dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
Date: Thu, 26 Nov 2026 13:20:56 +0800
Message-ID: <20261126052057.1544590-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126052057.1544590-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261126052057.1544590-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgDHNSq5wQdreQ77AA--.266S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1kAr18uFW5Jryftr18Zrb_yoWDGrcEya
	1xX3W0van3JFnYgrs8Zan3tF15Jw48Xr97Aw15tFn2y34qy398Caykt34xAryUur47ur1f
	uF48Gr9IkwsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9xYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxU2DDGUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQA8sB

The Lenovo Legion Y700 Gen4 is an SM8750 tablet that ships with the
lenovo,elden board compatible. Add it to the SM8750 section of the
Qualcomm board binding.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v10:
- Unchanged since v9.  Carry the Acked-by Krzysztof gave on v8 1/2
  (2026-11-25T12:04:02Z): v9 was posted after it but missed the tag.
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

