Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578227;
	b=pP1O8X/eXxX1mIZdclkO8NYuF36DcfPyAtXV0tIIGZxszmAuUEH9N5xQEMCPTJpCFG7W
	 BPQSU2JkQvSp2mLNPUUvbJ0AmyUboydtws+uVmrUWyKm210AhTs5l458Bvi3RE4Sa/WvS
	 fnC8M5he6Z1USLLPmX6e4Bl1efOpF4SpZRiquA6m+NhbPMR9Op7EQYtcOsiJwK4V9SXd6
	 VEcMp28pgBLY+EWdMAIgsmP0Oq/KMdJ7UfC8bJv4zn3kmyBWbJu6ZifN0GY7fOg1o1mut
	 V9ZZaPBQZmL+Ww6DOtmaT7I1htMRQsldV/KTBLqZ/GGnQpHkIjVKCe22nMKiPmdyU9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
	b=FmudzqTROFKP3mokFqfM2Bh0J8VgB54K6ocGGkKhWgvcBKn33Z/c5iZY+HEUmcMjkve3
	 WsQDx8tGHiiqgkMX4nT/TUQ644Pu4k2sOrlZ6yGA0+bvSe/a7G1PaPFWccIA+tfu2ZdnB
	 /89A9G/mpOXSHJnnCC68Y6BFES3W/TfaLJVies0f1O04buZilg7AvJ2ql2Bmm5GUSsnc3
	 eFEuPwxxC4c/ceIMPmF4G9s91e3JDc3sCf9ioX5r3LuHbcg7FzxH+J2pMBrQ1alS3Db2T
	 fqvx0ygalrO4wMNal4Nkuc3qNrOx6ZYJUyqkZWmLkPTiKkDGQ6sMA7AEYoN2S75Qf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aAO2IER;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9EB606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9EB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aAO2IER
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb61185057so33999495e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578225; x=1796183025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=0aAO2IER8kB/PZ8lVTz4ay0gUM3UnHZ/vSUnCLSG1JyAoz5XBu+KK21LecUcxMVVPv
         jsWMrr2ej7wBkGLSf8knbqOSbMCkQdfrO2H4N9ahqoxf9PkhuCMk6yKJ7aDsuw1Sllog
         n2h6BpZ1eYdLP/1TkWg1m7+VsZgy8lsZOcBvobJ1rYYRa+rc165fSgbxd2iwaIWTmohp
         xI8SWD8A92goVkdIoTQEWJCO0+eeww55ZY12t5skqCSUwNhKBJmDg8DwQBPFg/USKm9z
         q3u4ku2M7AyMbCbVEsn4NWbOtiIroMB03dZehtwAeTejOqd33rkDhsXaDj0ZB3S0ZgJ1
         veug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578225; x=1796183025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=eyvXAL1upL3dhkP2yjXvqUDg1RTDGIENghByy69lTjDc7wxApg5+HdSyIjSx2a2FaQ
         ivD1/T2dEhuXAPMX6zX8KnastaV+y/RF7cnwqZgXpquB2+0uXQ3LwrMOmnFfYVIL+JCt
         saThWZbVOF1lqyrbLYyMVpzyU+pmZ7hTrnwhg+1Gfvr9f2AVLKmjBxn/t+z2BwH/FhjV
         GYaGI8wy4mTQbfcoL9fv7YHopgzjiVGSm6vm74CXECu2oTgIQZs91d3v5w9TZrVcauvk
         Rl+gnnHyvg1ieTTZva1jZLRGuQL5h4IhlR6f6d4mEBPJR6Qgq0nSYuIECcOda5+RC2Gz
         6oog==
X-Forwarded-Encrypted: i=1; AL+hErGQk4QvnPlIWYyB+IUocAZ/VIP+eqWVGdCIeCo8FGS0MR3sSNmyst2N4NtSKoHf7M4DZngk6OGeqbzd@vger.kernel.org
X-Gm-Message-State: APuU4Z++7CDv7oI6kZpe6suAse3yBBHCFtPZTnvt2hAiysMOyaybrCal
	/OP+Zb0DiFdPUd+rKvpEoU6EDhep1Hk/bY2bqutlWm8G4zVapfzk+WWV
X-Gm-Gg: AZFdTZdpBUIqrLqzRESazL1blDgntJquLTkdOD4D+oegrcyH/NyScXfqKgqcV8y6VTO
	q06B7BtMneOvPa8DQfX4HG+4T0+VNlU2OOwhjXPwCOLWtaZXU6CpzXUpYei2NbRvOXZ0Sb+gS+3
	u/dnzjX8wiH49GdLXEjMdfUX/m6tZKrZ7YAYSgPt6fKiRCHELtLfMoH7Nj+fG6W+Yl/zsUIkoTB
	ddbsGLbl+BBuDLR7eIygLGCndUzDHH08Kg5gS8BYpk0yUGO1a5szaBfTtrQKEYX9O1l5+1tfEXG
	Np6hTR3u1AsamE9xti/ZpsmOYBi4gBRfoInI+jy0uX90fyjCAh6d4acabvvO99DTiN897589O+D
	ZWefJubs9omksNl794v3Jd795IQ1fbpBOeifFDNuVpOmC57uAs7B5JUvjVjkMvMyyAFBGpLRXKG
	uRVHQQZ2lzqr4L6OPOJKL4SJElqI8Uxnb8uKcl3xVB7ykZUnlp9b4FKy8pxMCqP9a8c8+mcqFbt
	h/XgehV+uX+Ws1w9AO/8k51NO38lPU5SYlaEBEc58C+zd4j9qJTnckFXmOxriCaGwo7b3imyzyJ
	hv7i1NYIYMle4AaBwSMbDR4wCGNozKkDTi2N9A==
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr346060575e9.3.1795578225601;
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:59 +0000
Subject: [PATCH v3 03/14] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261125-halliday-dts-v3-3-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=xCVPapQpg3IOzKVtAOHGmXsvfGx4fLaMkQfgRrvbjtK325rtMzpV4avhI4qPqmiTdlTgkoLxC
 dBxQBhGhobHDwrnWCUlsJvGEoN9HKps7J2KipZyJFkE2yjFIhJECBv7
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

