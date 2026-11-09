Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184436;
	b=pZdtBlyDI30D4IFxBtXu9jUZ1l4qA3Xj8ohdge3r8yR/UNicCNFV0RGci3U/7WG5yR//
	 ebH8ZrSnQjoibmp/GcKrd1Y6PI/ku+hUW+ckw54CIXvwbUO87mSzFq7SRBpg4fyqae6fT
	 ERnIERELLb4ET2Qi2oELa20HyAjabydT3BlRyUP6ERiS8bojXacZ/OhGW0On0W/QKjo0w
	 fL0g2IBthyKlvFf8++uY//VlWLjgym3fvDJ+3NjpZkvpQW/Eg94ewHRFX9Tgs/WQE1cjF
	 Y5SMpxi5Mz8GDvKjfo+Ad3VQuMeQdj58BydIOPA19xeic93kryOXbXdzkmoF7upXjBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
	b=LrDqV5k2EMf17tJp8+OoniBoq0rU6vZ1ofaQMhUnAeKQi1NzEDCR6JEfejh2ByG6isao
	 D2yYZYfL1K8nnz0z0kc4ZSBTVDjMrV28+q9BC1erj80bClwL/7OFQSPhLeXC63xYLciZE
	 Gkh2PzRDVGye9r6rSZ2Ua6r8vMx7dEW0DJuL7rpABtq8UEAu40G/SZpMDByGm37rpEZoW
	 D4pdKV4qC77U1QRgeblbz/W/rqqlfIpnXYpO/EYh6VfD5VF4HNYCC/YWlMT8yHdfPBulF
	 eEC8S+QWedQW8EUoYeZRwZ1jZIcCTQDWkQp59HyxDBFtjPiwKt7pNpevUlCNZ3N9xAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjJzEiWq;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAD606D80C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CAD606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjJzEiWq
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so204918f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184434; x=1794789234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=EjJzEiWqX7bP8p2RpKx0A8Mw4VIgcyhMxrNGNGYks9jT5K7ErZactzYCM9t6cwd4kq
         HaawBIqhzJIoLY4VKt7M7axDUH3ltzAQECL2DA4uwdXfdrRmzhjFbqCwUEKRsgMmA3OT
         yUx4/q4gfrM7qxWKUVkUiMy+1fv7O8bhhnA2B0BUCSLouXNRGcMKyshx7XYeRBPj5cMQ
         wqd9SPL1tAWpz/KhUuAGxUxS4NdfwwA1C8dkrWO405Sx1TUg/iTb9/AsEtLF0Uiqhn/2
         2FoNSTstnuusd6jY9eQoW6qa0bQaccSOIzfX/PXknfF9DEqb996bbOcC6TQtKxYLJM+a
         m8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184434; x=1794789234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=Wf95zxNWCgik77azIcmHEZD0vn+ZJHzUqKLGnuRsvXReFGua/yZRalpv8IPyDeqGRF
         F8zIt3P/Nnse7BB17l8/IUp5H6ZF6GX1xwPqtYeLUYdhDcWFpvvf8tfq/ZDhbSvetTkk
         /8NduMkn0AnTCZLRuyjh3gsTNYLRyZ1/1M1KV1p6zdD0ATZLEpNg9i2i/H3tvNXvQk2E
         ZPKSQnKsHSU3kNadqr7UUgfqC2LuvIa/BGRtXsxTWG8i5+BJUsqFMgupCNhIwA8/zLbu
         U2ApOO7WbpNkZaQ0aXcJCHKvmr+tj9aCBfkGmaQo/OZpWU8Gk7cJGiZsezmaR0n9TpFu
         0jLg==
X-Forwarded-Encrypted: i=1; AL+hErGDoNA+MkMa65tKfoGMX/omFdy2Acvttzq1ik99daEO1ksZTUMHqy6ByQ4qHPWDjx4t9ub+Zu1TO0NE@vger.kernel.org
X-Gm-Message-State: APuU4Z9rWeApwFWrrt7LFsbN4vXTAf70Odw3qFAt7l8+E6TTuDbxBPEQ
	WlgvQ6uCw9B9O8RzVKMeX0YZElJp7p9JJ/TMTKfAGbL5vi+6qYI709SUy+VTF9+T4Fg=
X-Gm-Gg: AYBFou3K4igA18QgmSQbVITBkiAVoH+NfCIXWmbXwvml3rkF9FcW1T64EmCoJGw+uGq
	K0f9tDQeRaADeVsrWDxRduWZi4zVnWvIxIy72MeJRhBbNgOhUsq3MbLA1RKiw+xvpEYQYS53naV
	ZVBEjO+GM3m83ke8iTH2d/LzsGQ6VNzsO1W/U/NWWBVeutZJwAyswANl+ssBuOilcqFkT/80nvd
	8fMWUfZxXrl0TIYV/wveXn7vcfoisVxBYUjEGy1Bx4KKksYyEuosGqkNWXuBBqVgEaE/hZIH9hu
	QCsjGmTUu1PagLP/JDRwoJ2WbveAPsWqwsAqbyw0EQRRdFtSzkYhUkXtpZ2ACkJsMS5UnqKtOHW
	EVzKRXh1rTqlrEggBq9HqldfC4CJZrqd2BivgUPW9N4GowPXhnEInOhRf3Gtc+VYRBlFzZzvsg5
	g00xBkkLDiI3mgxt21hZXNLOKwFMOn5NT96xuPtZCKDEKtS7sz0sKqve2gIXjj1n2DqJrfXfEot
	rh0Wxn3dYqNWh6D7mKWn7di7v+6uPmElV6oOxWPKCX66xudHJEq0pD/r4Ez5Xna1zgqBfOKXQJS
	OvplTy/qWKFuaK6KqU0qC7Agh8F93LrMqn9NwedTkw==
X-Received: by 2002:a05:6000:186c:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-495856e15f7mr5379354f8f.41.1794184434351;
        Sun, 08 Nov 2026 16:33:54 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:18 +0000
Subject: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1112;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ePrzoruUVeLDRq3OCS+DiCl1d/Uk3kZuK6w1BATsFKY=;
 b=pH81WehGSEFzi7T7LS+ShwXYAfu5lsev7imaA1JaeNifItRSFvMkK3a/y3Fr2K8IwuXgQfeAv
 1F1xnpR5tNxDdiiDmSxt0TVIqWh9HxtwfbMTz8uhxpsozlK3LlCAs7D
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

