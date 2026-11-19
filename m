Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092368;
	b=DFQUx4bdqUpPndHpJbehBBDp5jonwYNhBQUE01t/BMtELHD6cxV8swH2ahTnUs2K8Nla
	 slWoiUKdNw1NYcQMytSa/eoJVO5Pz85Emepnnryz9RO4N6rHmB1HOf5OYQceyzMlBFZXc
	 BqbRDrMPLleQSlyzPIriDFf7HShEGesNeEkYMq0s0fOnsgmxJmEYM7SqMMG2xGX3LBh0d
	 8OVqs5mDYJOJ01/jVvLEHV/zy4WTwx8XtTWgQWy4feoS1wC4gsi/d+QFLWb4ssxRILrSW
	 xRRuQHYrd2Hs3GkjEz/06pVcyu+qa5ptx7mUtek2l6PIw5tFZh6AW+tzolJ70zW75gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
	b=X+bxNNr2p8gTJ+OwtDgKaOI/aWb+HQGUUjBq3bs6JHAUVARNStTm7qbiRihdDz3q+v2K
	 N9g3A+0zOt/4NxKEcwLVWV4Nn6kFtztX05vYfIxHg/fTteAakWMZNpwIq+YP/lPWNtWfL
	 MVgH+zD4T1fM3m0INGURvYn8Rb5u6mbBXV90wnKvniwI1Kmkche9sSGFwv6O3FZJqsqDb
	 ZbvKJ+cBrkDAY71ezEQiTc3NAQCp5eJg2ijHvhuBuPfh2ZcnGhYkIEFGF6kRm6i2MJqh5
	 wrTd42ytYNb2WxtQOi4dwRivvj6ERWhcnmYaVHDoNK2UXJlfcF9Zt+6lcOFFw3PDddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIXjKAUk;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2C606A337
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D2C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIXjKAUk
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso656065c88.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092367; x=1795697167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=EIXjKAUkoMLRsnfT7WizJMG0mA+Wf5/X3cgJHxZ+ZlrZcxurpiPY9qaBEXdjWbl6cl
         76dDqZArq6bITIt5kIWc+gi5VSpWv+khBf3rF+wY5sWAh/Bqb5aFX78HIPp8QsZEpRAM
         wUqUJ7QG8oHLJLbu4Xu5tUzi0gI9dFOEfOAYl7sidkYc/qTLLaTbmv4Cvi1zmtgnajb8
         vyhFExZwwiSOfTApDrqkzyQIt0MxUx0TSNr/yOH0/OdQ1CoraEtLoHpUNQwEO9gZXyvV
         KP3fwOSpfAkukc7oA/VNSUeuXK9Kn4BUdGVjN5j4eh/tPrG9QuPHsV10oakcZNd7+Jmb
         1dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092367; x=1795697167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=fVHz1baprE5Hmyvu5Vv92K6bt7GRS8VImNwIjLykLKyCRZqQD5Z3SS/hXLEx3mAc3+
         YJv9RdTVl2Z8yLt8Xlun42ncl6B2+xLQrShIT9oip0lEJB6IxAcst5AUHS7cn4SbGcQR
         Uf9KeDVT16aNXuJITdPhY3zjz1gPE+ajJCqHtfYGPg9c0eoRt2kGZhacQZqRFEvKdOL/
         cWr4zLcGbHDq8AezAwn+qUioiihxGQSGR9RhgyhZ0OV65QO5mmcWDPRCc37F5YNpUqK4
         qqzOGhkU13OLg6jF6kWiuWImQCgLClBa+Vvi/ZuZK8psaHV3FoMWNsM6Psevul9S6zGx
         YdRw==
X-Forwarded-Encrypted: i=1; AL+hErHKhGFRhat5rC/BSFY+oJUYlaYh8KfRcFd92up5gXZtezHQ2/0HKc+R1Ai/6hfNRsmgsArVRKfBWiv9@vger.kernel.org
X-Gm-Message-State: APuU4Z9sonXpL7kVlnQu2fp802FtvNGPvGml/MqCpAmY/sneJBc/X1vO
	ltE/dYQTsH4HFEoipN2kenRYKwCvElw3/OWHTfpUWuQRhGAekLXsNamU454D/GQyij8=
X-Gm-Gg: AYBFou1lSrzGz1+2QJDAjJL6SG3Sw9ws4BFb3MFSt8GOjQIpqE5Tq9cXO6v8u1gDYH+
	0uNZCecO1bV88NeCbxx02hkUKhzc+MrsDSNupdmymFL27x/OJvSU0kIyh0+GCJDBbar76tSOZTC
	gBRwARXJXdc/QO5FL1iYqGGVYTwFrGDh7j6JM2SxW7qUY3mAkiORCnT3I2E4LO/cDl1+UnIxlfx
	ixVPo/Y3eCu6dctYrvbNbdjMZUMVWXJ/oApyEFAEDUHX55SXrS/08eZ+ycPrS+HpZ24qQv6qGXu
	8OvhPPmAsq6/OH4DBuH+aM15UlAcLbo5xCNwUiK0ztBspYanf86FUBlHmSRwfbYERPafizI1CPT
	Yc8Tm/A9NWo6YGvMcmlBpXBn9Gkv8bd+E08xp7yIvXc1f40rpwTKmPMTKd/HvA1qvtLcTTmduP3
	+DIEpo6RJ2xm+coSzdJOmCrmfKFYKvFEfKtlHtXVgJzwu1uYHJI1nwxJ7nJd6xhpAoos+zNPzVn
	mw+dE9v2mDHGohJgOtmytfJG8O23FjPVBIPY+4BWt2lZOCXM/zEV+yAmqv6PhVUPJLj6OEl3JPy
	RfHTy10YckD9ARf2vKVXekSATx1lUUklRSM=
X-Received: by 2002:a05:701b:2810:b0:159:f192:5290 with SMTP id a92af1059eb24-1b5524b591cmr769675c88.13.1795092367360;
        Thu, 19 Nov 2026 04:46:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm22350329c88.9.2026.11.19.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 19 Nov 2026 21:45:57 +0900
Message-ID: <20261119124558.1548-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
References: <20261119124558.1548-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v4:
- Add Reviewed-by from Krzysztof
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64..fdc2bc8d3 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.53.0

