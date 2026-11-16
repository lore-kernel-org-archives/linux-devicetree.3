Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864466;
	b=rMtcUBWwkt014kle2NgNwO27AmL45Yisb3uWT2tHbnt3IcVxL6STeLrQNsVYdMIvmgQt
	 i6WffEqNd60stBwQc2l2vtoZoGrxOfuIqX7w8t6t1qDMAuOHGnyekcyUbO6KcESUhkm1X
	 hP5j96Op3nCmNmi9dnnQbOdX8Pl54PqhMeKhUs9Ov5Fp12q3te0TwWTbrpaoXYiYkMIra
	 aKus4BkGi90w1m2ZaP4/KIDJFxrHkliLsTsiFyKkX1n2iGzkliMvxnA4ZPkCMPLsx5Jl5
	 GIMA+NhsFW0BnLKoj3maVze0iUdcbRNWGxXhixXxaU93XdSZGKVn1xbAxi+oi6aYMTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=ryPZHezAO3IpelR7qK45ZqfCiIVCbmph8aUCEYSygt+rpP6wMLdSCTiV1qqugbaNLaw3
	 Lje1HlGsHcjigM3ftqnMSdz1XgObyUuFpkjspqI2AFJAsSPsiwqZzf7TMu7xXTjy1Ib59
	 VB97MXgv4NPp/u9GRfYhSut5vQbWDII8aeYCmxY/iLTa7WYjjQUsNtg616MJ/OPzDakq5
	 5bCdRz23byWthNX6KDGsUxxEHg8X3PNETWLluPBzbWv6uL0XnIilQYntHL5cNuLado0wc
	 huYteyjgDdpSYYY0p0AnfmNybikg4K2EWL2xyBX8/5SwKEx4jzeldiGY7sew5MxMPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F308606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F308606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a358881793so194606f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864463; x=1795469263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=jfokKnjCoBhGXval+BtxxMIEBcJuEILgvyGX7VwyLu6Emt86PG0cHN8zHavEn/go1l
         JnXO60BdmcgsdTFaKXKwOqVgTgnKxvxwuDZdga2JS6GdbOlVDW2WSZOvNyIBuw0tf4Qv
         RAvGWInSs/2O0ObHsKhseNZU76QAiuroYJMR8Mfw6u/mKdWrlCyyVnQXsOqyb/6w+Z0i
         Yg0nO/MHmkz/gLvmULkydyzWvLIWSx2UfOxq9KIjYxFsMAxV32ihPcPbvWf7DuMidRCi
         vSW74NEJbetjLwGeeuNOhALF8E+VDVV0qaT8Cg41pI24K0Mkon/0zMakEo/amjlR1J/B
         S9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864463; x=1795469263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=UEpK4a0tqv+irmXq3K9A/DOyB6gBUajnrW5O9eV9LKc1YIEt0oK75uUjCU6HkW0hgm
         US64XDTADa9ujqfUB9CTtcFKykHrP5DYxQwvxjl9gCcqpzvRrK80TJmrFCQOmIUuSiQS
         +DT6e6QWlQbC3hCUd1fiQvercwTNwyBl31E4Oy35iKjAeKW6tdCvipGGvjUcuRH5tMU8
         SI8etusp14uZ9TlmS+sb47Yf8Jbo4fwUgSZqRl+qRENWGlTKHp64qHkj/jF924mZJE+W
         zT6xZWb2XVOinDsqhzcObBLYLgIQoIMi6jq1g8ub+0LHi/VuUVibmA6Cw3F6PbbmEy1F
         UwDQ==
X-Forwarded-Encrypted: i=1; AL+hErHxuarIUEpTnjGCmma3Vv5Bf/X6YpKBYjp5L5kXPc3WevA7gL4TUfj9MjzU1F2svc8+K4hrjyuD+gqc@vger.kernel.org
X-Gm-Message-State: APuU4Z9IgsFZ9CPITUtUqGgsjD/U+Bo+FYIKsBAhdQzPTpcOqFM6NVUd
	DACqpM00adJ0lShaIouWzlPprwdTI5omJ8dQqL6mZFXTZ7Wj9odUAMF9
X-Gm-Gg: AZFdTZchSDQlYIG5XWLeL7Z9KFGLgGw0GaUQgEB2QkgXRvg6DJqfEY1AUSUT2kbowPB
	FW7Y/P54Y5w/L/210iAJFUqbBV+c2j9zOTkNAcyzZsgzRxc+imoIMLsHCkG8eBMcgdOCtTQo965
	Dn1mGyhvqVe+bbi4HaZ9mCVYJy3AmJTASjyRiiI7sHqFqb7GpwOpM6freJnf0x2xAgP4/q7GJTB
	CjVEPrfRnpLp176j1iivEa5IXb2atLblYiwYa8XYXDnxmVh0ttwX9Y4efVJjC/hbGtJlS5qxRa2
	2gumrYqr6LZ15B0GEuOFvrX8yiyz1+VeoT5Aow5oP36lpIrj+yHonpMzmJ+f/lPDWBlOxawmXse
	erW9XunVkqF59vO7A0E4ztbatCkxBTOLOK0E+LGd2CI6e/pO/WaXuV4/R8fj2eMC2DGQNRANgM+
	h43P+8ysQKbz3cqvG1h8A5EGirJqpTwUtMq2wcxfEdStgNzMrDwdSwwfr7E/8OM915mlUdrZwGd
	a653gqrtRlluAOiC3BdTsPm7Xf8VEBGoGwYW18aRdbLXAewsPOHhEbQEB6d0B4pgtv2j1APfP45
	idyF3G+cFSUMvfRgNEtQUalOvDHqIC8GLbDQJgUA
X-Received: by 2002:a05:6000:438a:b0:491:36b3:22c with SMTP id ffacd0b85a97d-49c6e68dc41mr30686056f8f.1.1794864462819;
        Mon, 16 Nov 2026 13:27:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:27 +0000
Subject: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=lNijzEKQlyljkWzaxIS9zrys8uC5qiwJ2YpuyG3Kr+5tC+QMb+R4Db6kOwLBwj0GYnOv/QX+7
 5U/HlbRtrBQBhLGehnhSLzxDVWEhcpke2OLw7yIeYTlC6a6mrQFU5kI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

