Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184487;
	b=azqEvdL1SxKVc17lsKwt+TPT26Q6+/soDCmQ0ZpP7n0qbPYYmDZJxhS+cSC/d9mgzDNM
	 BlEOR0QIeUFUTJQ21kae3cG6zDoj12TkIOk4S3X7Qc0HrWbLnABb7WUseOR8V6Lo3JGQP
	 lGtJ0zaQsYISxXgHj7O8aN7zOlAhHYpkHU84ju3tvNFGAnUiQZw8+WVj+YVChy1L8v/7g
	 9aXENVmibb3qItZ1bI0OPFogTrpkK+YimE6WT2NIhMRAllRn4NEvGoPdO/Z39kYP+NbFA
	 f7h+LsJCWOxfpOvsZ37VQIbwPxWSax3gX9+jD5CcGn8Tq7e/D7ju0yLP69q0pJOOOyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
	b=Yn0REO4ZdOMeC4Jj4snn3yBkrv1kJu9B6+9hfyEeyrwGgMcaTw3Zm20M5I6Mm7jhiXOM
	 qOvXaaSQq6pGFRoawvoejMLcC2mpXTrJ3ZVemtiBuun67+J0Zz4nEgKCQcCLa3OBH0Icz
	 XZ/596+KDconMTopb4HREHI0gXCy8eHom6AJU8pWpAKqVQFunAgfIB/Veu+b6yFpjNV0e
	 sqng8V3DVYMcjJVRqO8rykERI1Us9bOvuHUqxcSXD30pbHZn+X+SOGW3diZ3TQcT2eyYL
	 3A/QLumtmyW5Eqy9uWTXCpodvG2BmX6i8+e6cf1BnRMGnN9QV6ll8VmYD5X1+vFM8TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ar0o+lOa;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E69606EE8E
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E69606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ar0o+lOa
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so184584f8f.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184485; x=1794789285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=Ar0o+lOaLQ36hMaSQhz240QICDkzMHtmQDPTHSSCzgvKoRRu6+3NEyf5r8UGihmdVO
         YbL8kGYlIwYFzt0m+P3LcvsNsXWFp1DnoXb2XeAAeHKjD0e3mSdbFDeNhE2C064eHQKn
         FBw+L6yYJJRGThN5FTZYemlT04n3GfqgGq87rIHUjOJoGNcaF4/DfTtKARyZDeZ/xjrR
         b2ektKO2o/QtZcCAYpaDtUDybpL+f8B/n0nKzY3lo3ZuY+C94fC/nTZn1362e+1nZpVD
         khlpFRfxsUKvqLFNzImO1bvZjdT7ysUCEMcuRxy31zGl1OqROACCKC3fKd/G1KVQ4t4X
         QYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184485; x=1794789285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=Ue1L71hw7qgUSLJvfasI5zDsT9wH/aJqpYffr8juZj0O6lMt4hPCstSGLZI4Cs+SvY
         acb0krUgwscyjQQdPo0C8j0EZCvKPILRrSnT6YiXnGUrV5BBV+iCe2gcgp7weWQ9GmAF
         gKgjio3HwO2Y4kFrVIvllYs51Es5XyR+h+YUyGoPBlpcNak62ho1pTvEfEvuEu4luKIJ
         ZLpGOJIdnt1tlUsLBytgBiJqSUVX7sndEh2e0NRQe7xpdyGU2A18Na4FSoLqefT7zZ26
         8aYJo0eskG6r5S7mBU6Dx0Qqpw04dEet+wlYJo7li9uR0XNMsnShypOFcefmM/f8FrXL
         BgMA==
X-Forwarded-Encrypted: i=1; AL+hErEYF8WgQ/tyjDz49X+zTkW466YvU6eJxsx0qzmGy/n1U8CwZBLv98eMBR6iA31kENNaUdWUmMay7Ala@vger.kernel.org
X-Gm-Message-State: APuU4Z+RBZ0OqZbyfRsqVdO8Cf7YsAZFNJVHO+ct427pQOefORUmUdph
	8LIND/4lNgWZOSiEgXcjdvx05TJRxrgZh3+FajjRhw5EECNLV0INE/3T
X-Gm-Gg: AYBFou0DMkbVIghtCiUX8E9R1In+TJdjn5bIfnUWgGl2aZIlXG2RRR0L2eAVvCgBuFp
	KA/9hpwtexeS3zyGwsLdqdQciDUxyh5WpfBcX/hWQMSC5fZhTFeaQl66lyQJDB6PbISKgnYKu5f
	jdZ63BPTbSU4GiFnbnpf3SDOxZRRSqy17l9fXZWxcxkbCNTJ9iQsyAaqCj0bgGpJBSqtcf4bX5l
	PxDZHEKRNhovot7jWUcL6/Lxg3WPIVWllwWm2KcNlz+vErLQExGr69TaTpMGxIrysqYVADhiLCO
	u1QPLDDkjouC3bUmJaNK3eFDbz7KzPAXUGIVZPhcAiBgYY/XlEY3Px/DcWgMxBdyXxtphJB7WW1
	TuwmPEOslXIMi2hP87dxKdX7f19DO5bg4D+DLnCb4rPaQdXzbELqK0zcmLYe3WbfAywFCuH0PmB
	VBGPZ3Dhj1eluURAYXDLwpiV2Zl4OzngJm+at5kPGPkSXNB7OQ6LD+5t+X4h1jzvxhvxDSPHQss
	6n/kTY+w18YFETaFD1vFDEDAzxfUFpCgxfY9fawoCFMbQlu1eIg2DNoRXexTPf7Hv/irErAS55S
	Ua2Nbv1FMrVfL+8P79FPMMTL4AByy1JA1Xida6Fo
X-Received: by 2002:a05:6000:481a:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49584690551mr4596063f8f.49.1794184484831;
        Sun, 08 Nov 2026 16:34:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:26 +0000
Subject: [PATCH 14/17] dt-bindings: interconnect: OSM L3: Add Halliday EPSS
 L3 compatible
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
Message-Id: <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=844;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gWRtexQl3K6zrJ8s8OX25X6Fe6c5gXvBp3k5tSGU4UU=;
 b=pnbK9TbDaJw63lMsp+XBx3cpAT1m6LlRO8M5pm7At3undTaYtmQjFmjLHcmBIU0XLq40cIoX8
 jdWhe4OxgWuCqPNlp+TJGp7ld3LSdzNJFNkDbr6brDzv5M8VXRxZg8B
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

