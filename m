Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED39E3EE1D4
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425468; cv=none; b=Ukv5wHim+3ASVpi9811Yu822bD8NbfvLToBWTdbUN9Dab78UTKQd1rJfO4KLceC9U9idhF7ZAWQ5KCvIz+7jgS4gMvI2HNsjc33azK7GYZCaecVonqln2Joau/Ngi+KvrAalS1UpY5q6CnG9gQzbIAU+6m7lcFuOfS13eLYM/j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425468; c=relaxed/simple;
	bh=kzaphFFUobmSgrEhjROTSnnHhHp0e4xJhaI3eW9w61s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uImcvT2FEI87omdl2vbOJSmfKXJgNX/R4WHX6eK+GY52BfEoYWJ3F/TaEOHgL/G1xEsYe3rBTCKM66FymiMZJvXvdxA8qlwH5/99d/UL45tiWHAGXKzNyFoynnpsfUSZdXyshk6nDo6OXQyZn5o2oiIJZUcQtu1qmA3W7dOeaIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAnidjtNJlqIyYHAA--.14117S3;
	Thu, 03 Sep 2026 16:50:57 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 16:50:50 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v2-1-fbe7c04472a7@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=kzaphFFUobmSgrEhjROTSnnHhHp0e4xJhaI3eW9w61s=;
 b=kA0DAAoBmg1yW7Ei1QcByyZiAGqZNO6gJz/JY/POz059805jrtcen7WCAOTKCta3osXylagHm
 YkCMwQAAQoAHRYhBMN3TZ6CMXAWWB8MPZoNcluxItUHBQJqmTTuAAoJEJoNcluxItUHnYcQAIdM
 jnI9RbS9tytptq/ehL8AQsP1F1JTI9p1W3IKdpXzyv4CEugbQc0ONhzWJ5u3HgrtXkjwnvga9+i
 /ysQrBHV4Tr1qK8V39/8W4Mg1o/xtMCYWUgnuVhPA5wnq4zx2ATH+qN+pcFTc/XL0CR3z17JBgY
 sg7hwbvNjCrntpn5V9bmcNG3dikECcfove8JEmKnez4V9QDgL+nzJ0jk4kNfo2LJFN+q+t6vUQq
 3P0SvmnTz5yeW2AB283j4VNYQ/88oA8NsRO+5C8GBVsSzEE38/tQlB7j6WBCP1CeK4hFpFk4INW
 UY9oo36TGTle4w3YU6pYgYSGCp6cm1eYzeKzORxN2qHG8LIqkweB2Ri42lf4WEH0NYnxoyqgcNr
 1JGoAndc8p8Z0NTRNtoFTSGBsMnKxZucg6yMQN60oGz0NWMkrIk4tmX4aQZNmkj8suPTd7b87F3
 x0olYt1Q4lFQFTqegdJecZL8J87QPELRqxwb93VXMHQ9iviELfZugo9jvzcPpiqG7MfKMokQAbN
 Pofv21S5DjllEcJd4DEXdxn4Ire9gPIi1r7tH1GdcZleK1hlKxlN26BgKjnP3VAAqN9sk5xHuCf
 QpULsMyYaztsB7NbbLLhtkGmBTIGw8lNsylcui2T+5ULWnA2XCkwFxiPL2mWFN6T/CXTVqLZoVN
 R/XoA
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID:C_Ai0gAnidjtNJlqIyYHAA--.14117S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GryUurykCr1rXry5Jw1fZwb_yoW3JFc_Ga
	yxAa1DuF95tF9YgrZ8ZrZ3KFy5Ja13Crn7Zwn8tFn5A342vrZ8WFZ7K3y3A34xua17u3W8
	uF4xGryqg3Z7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUs2-5UUUUU=
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAADsE

Add the Xiaomi Mi Box 4 (MDZ-21-AA), based on the Amlogic S905L
SoC, to the list of supported Amlogic boards.

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054fb2..96e207572d98 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -120,6 +120,7 @@ properties:
         items:
           - enum:
               - amlogic,p271
+              - xiaomi,mibox4
           - const: amlogic,s905l
           - const: amlogic,meson-gxlx
 

-- 
2.53.0

