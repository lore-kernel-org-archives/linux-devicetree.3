Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864447;
	b=dP+ELvcvw0Q5yKWxxnhLudX3FU8lSW4rBHmhsUVOCJzj7zfdTJouPbhZwlSOMSZtNrjY
	 uEinQWyb+9PI0HrtzC4EGh4kn2q+tdW74hUoIoUx3GbQ+uVawCFy8xsdpdikT+C+oGElu
	 QHyK35Gm9vQzdMtSgstgKDWff9Ou0NlNEIDzi4KwsOWBk1rgMAegWmLzKwTEaBii87G+R
	 rJkxJ/Kmqe/x9g1FIlj6gey023Z+KR9P3hNqXbAcU0xfJ87XAXRopYI82LB7GskbnYfmy
	 oOe0bBR01WrcrZh8TCByv7Ck43dzgjKMJ+JpOJB8u+5lOQY9VF3g4UvC2domvsbfogg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
	b=mgiHukExkbD/qWgZCrM+k1au8st36FbqDUmXBi8WYZ4sV0AyzzNQ1xWtV0U8NPslTgeh
	 JmaEDbkN2hLA2jB0gmxoHe3ycn/45aSiFqaCdT7Un7Nc2Jm1hQ9PC4l9E72XJCaH7eNmg
	 NdcJIVA71QmWc4MEY2jyHiuiclBXqB8KEodNzlQ5ju9VEtI3lO09VV44959u/qyJfVkKa
	 FSvLPyrfpY4oe+en/HbXjZ8TSq9x5VcsB1medz6wnlEoPUEx2ph3+vNKyMjrJfJKTBRYu
	 FyOOUV60KEJpvhBmSahT2tt+YlUsfdX1o4fFf3hvVjdpdoU1k1wpPY9rp6KXiTdbOOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWmpHX9v;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F1606A335
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5F1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWmpHX9v
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21062295e9.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864445; x=1795469245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=iWmpHX9vy8zy4+SpuLwYiHLB3ln3/7sZipWq17iQxZemFskLqrf+5u0LQFERvFgOg0
         YGm75sawrb5dvvPHQL1E3tnBDx/3Lj9iGKAvXpNm6bZ7XZPo570BE2i9caMiY5IKS48b
         yiBmD1KuJl1DrDWRRsqVTXAG16CMeW5eB5GXQT6VgA4c1+z5l6oZ5HSKUqabtHjZShkT
         48NHibHjglieodvDk4cQu2TecbGkn+qDMwsDpIC4OxFmZTkuOj8+6GxuMUQCtCSsIVCD
         HuGkdrxWUd2eVnv/PV05xdTNl8Q6L1L49LNERTuDgEIO5Ltu94W6gpd+G19oZ0m2OntX
         /SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864445; x=1795469245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=weV5qfiVR6wzCPOmQ1eQxjFxfFrbRRz7bbp9txozUgeSeobGgd8UD7zvl7fEM8Uf2y
         5xFPE46RFQe5qsLtYEOVCYUW8Rxl/mLtGh8trWpTUV4Z67Xczctx8KNWvSuFmtT6A9DU
         4S12+/vMXMoMYxXiPteiO9i+R0A0PnH38Ly45+vSeAZWTkLQopWP1fx0jRFqDdmf5Cxh
         qK6MFns4EvfDWQy+6Veg2lGP44FeKNM6vhlhf2zkTxxI7Zkui3KolPI/Wq+jR6zdzyYL
         +trwEURWQhcza7ixklhd2sGkb3QgvKLbOH0vXbI64UqCEFaYslX1+3GZmR8ufxTgo3U2
         rRtw==
X-Forwarded-Encrypted: i=1; AL+hErE9j1410WoLq6aw5//J6ETX7gSlJCE6q63rue572T6gUenzdqn0Zz1jM/MvuEknpEx4XWi+zkwNNQ5F@vger.kernel.org
X-Gm-Message-State: APuU4Z+RPvnpAjghix24Z2KLSIEQCeuDzodUGKWCb58Huq76BS8uRomZ
	uMtGkZdCz9CL5KiI0umwcfK/9ujRH0ynCpQHKyj5bLRZPcwjW8ggob2f
X-Gm-Gg: AYBFou1EcSYl4ravTorCW6ic7YlA5MwdJLHDUsOIUG+wZtDBu+p7avuRuZK8moO4gzD
	lJJes4rmghjue8NLz5RAgieJkT/qmxEXXL/i8ck4WSFvooQrMHPh3Ki/MUde1xFvqyeigMAHFon
	TK/PRALakjkqzVcY1lldmt61V/lbqp6WH2vaOJwA2akmSp5nsfR8XXAyE26Jh2prnCuRsXGbW4R
	dKWZVIEpxKIVXXd0LW0fT0ciKHukmP+5ryhHSlI+dDn5mdnd78/JLb2vFZilZiHD4UxBJPcBf0u
	OuAQ0Vyg0uiSLDxAJvJpUk/AM3hda/Z4gO9mi7kbYrjSK5FZLmGyBu60zrtM4mW8Cx34mhffSxG
	T5PD7ZNZftQETqUXeQBq4LXTgR5QmCPGavDZdkKZ2zetq93uIx1nM72wLU+gzPhef9qDfuX58QW
	UlXsFQEJAKqwrxfFsaCjAkgE4kitGL/3EJw1uXlJ3zT0f3YUspqFbRjrO2i917EgDI0r5VYPRR6
	EMBSRBJ9HKKVop9wUjEOhrgJqjd/yoD43GuQqwHP7ZoEvg+6sicVHYP3aED0N5X447MzvrMcTQX
	vMyPRT50F7ViDVQQsE4yABGVlPWgY2eJOtuj8TAj
X-Received: by 2002:a05:600c:6548:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4bb55a8d621mr184234605e9.30.1794864444941;
        Mon, 16 Nov 2026 13:27:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:24 +0000
Subject: [PATCH v2 08/16] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261116-halliday-dts-v2-8-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1028;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=e5+pG0dDXEqC2bp77Ez+oDydvwUzWtL2BPwcLeGQJvE=;
 b=gD8xOm5xZ9FtfmXv7b9AItlwRATNEZobnHQBfav0fJLpw18USQbXaJrBNVYJ8htSmcNjmMoiY
 oIwuZK62UjeA39gKapnqrq7NNerfrM+Hz5ecpQBWUPf7UaNqv3Q7sGR
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

