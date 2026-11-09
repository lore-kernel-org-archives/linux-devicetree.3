Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184451;
	b=C8pTvLLu+uBwFsENQzMpn4goBH0h1GGL3P419m0Shk9e4mjf9DFiyyPwiMqO5rlZX4C2
	 i5l5X7trZDc2ClDeUrV/sC732f1jHiJPraU6T+qogMtFtx0ZLp1qL4476Ycum2noDHmd6
	 VV6piQrw0b+5VHZpLLZh/b9SJFuFf78TYcyU8ORUHB9/2mFdMHj+sattzYccCj/k8bdfp
	 iJhXV3KfJth2Kii2IOGQyjbc0q3R9lOKL1JJhVH0KWeebor6ZKdEMkCdOLdSBrzDhfraV
	 CjW7NIKEZAfTcUMxTB1Q/hb5QPx72SaddYq7WdPKfvt0cvhDIPHSjAmfGB6wJOfhRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=fJVLzIIZBDKogZAj6zGFoHYtdV8Cg1KKkxnLfXxB2EnoO4O+xq3Tx8JTr/Lpf011fiAY
	 DkqxyYCEBVIFrsCR+TcJmKigRN8qAGQkM5DLq30BMMAjVLvyKZzR48jQgpxNvbqBxCN8H
	 d/uN5Kx6NChiObyDH1DlEe07+IifmExYbuh7ZYx/TANJhHYqamTaretXptLGd4G+Fus3e
	 yGwuqzseSEYJnZBpY4PUWWMz1BjQSA8slxf42v1CDWiGTVNEwV2V4lnLSIN8P+VIOamZm
	 Z6OSmSrWo1JuvCjtu+DauwAAwEqSl0An03xrQ4goGjV15eZ1o0WI6M5YDF/l7P+a+XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCFD606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFCFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso224055f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184430; x=1794789230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=mqATGSDgOcyspCGm0r88zz2LKvOBuTSrflTy4G3x+OmZ3/e6m92wx8lwDFbkWU/2r7
         wF4RvcborS48J1HQFsH7E7pQgiQNwsPdfK59/AT1PhF1G8mvFKr+CfuUUZqZjulYaEup
         ouJz/e8/k/DLsRowKga8BFqAZDnPgMt29Cmqfeh1kSkF5wRiiYm0/AlufG1QlkuycLwj
         rEpBeHEkXJziqZintgY94/c64b0LNVR31luc5/F2R95zuMihuSOw0tSRvV08J2itGF5Q
         e6yNkFjWR7cidQVwBnB5dheZp9Tw2HuJb8BECeTsjwwMmrbGM5Ib9dRsZdyiCb151RhX
         5M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184430; x=1794789230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=JWI4n89M/gZRraSoIOHp6nATsIE94ECeQAyHTO5CQB8s8mq4sLrxfqv3Y2QFo8jY3l
         RDkSbf7augUVeM9zPaQTju9/AKFgWrzgAYCA66IfjxdikUVk4Qu1YX9KZiM2e1zcSvXo
         DlzP6tkeHNrWS40zb6Anf5kw4RW/fYjB3MQ9iFpHI5Wq1ekd+gd4QjfMgaMNQhQF3PRG
         2e4wSbjUUEWsYtFBUy2XJd9Im2oH88biWSWiYXbM1kPEAw6sQa/9Alv9x9+eHvxBeK1f
         W6AwjTj4tJSEpNzPp7Ii+gPjdP8AV+rqqr73lcx3SmHBavjZQ7oXiCLYgedGAFej5O/m
         g4hA==
X-Forwarded-Encrypted: i=1; AL+hErFL0ht8j2Y72oOOPYtrmk4UpMgrPsQvcRd+2yGWPHXtXrrnSrwHV7ZuyoUsEt6XebKPe7K3G0SH7v8u@vger.kernel.org
X-Gm-Message-State: APuU4Z8BmDkPd9V+sslHG20i1iKU0vkqDrc2FyYmHYW5nMC+VrlmYh9/
	Qer5EONOMpUQS7PWD9/5w8X9wPF1KfDumYongcN0/aWcJYxyENNs4bk2
X-Gm-Gg: AYBFou38UZEZwO21YaRqpfdjf39t3sDZXSf3+Z2hhoZvglSx3+gw6LI/hh5FdxLn9r0
	PjFTp1VwUbGz84Rn+WYXbygNeaE4AnFQ+CZKfiVzr2SuxtTl7uRGT2mn8OiX4IcA1ZLjtj3pB7r
	GWdEs8khtke9iwZk91ns92ETvmCTk6Dhj5KqS8AQb6cTv6co2R2Aqs6bWnOb3WKpkb4vlPSgE6T
	qsW+j98QI3Ph2CcF64HQ36PTeMz1I06hgv5nS7GIEHBLeQXZEqnXVinUORs8cjJgOKA4lwkw9AQ
	YXK2z0bNMkF86eciPOagG1OgluSnBRwKMKy2ZdN+PO91IECA50muRovyR1Irfg7CbvSJ6TR2eGG
	IYvMm0V+g+VE2qEfpsYeL5TSE+MJiafaIKqa35ORZ7Orb0+wxZ12sGK+vrNs1/L5iBSSBLlqD9c
	rNveSoSBvV/n0v71iXMn4BpkJiRZORZ/Y9aww/ktqbjO6MfSwQE2rFhUlh+egU+Y+eYkvPzLyzt
	bSgOK+YaIcf+NOqgMrz0NV9KhXI8Hv+UM7r8m1b48OlNmQTFML1TRsC5NgmLhF4vUG3jpoKVYPE
	KelFwbi6D7dXSz1M1BVRZpHQplOdoB5F+nPyeIcS
X-Received: by 2002:a7b:c34c:0:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4b8205a7b74mr74612065e9.18.1794184430004;
        Sun, 08 Nov 2026 16:33:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:17 +0000
Subject: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=uUjeKsqz31kCcfPZSa8Z47M4B7r1CADYAoSad8joeZDRvAbLwLDkhf9ZDymLvxVoerAVE+UqI
 g/farVtv7C7AYkuFx6U6v9lz+2+4yx0RS/OmA8jjU0ljraJ4I1qJLhy
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

