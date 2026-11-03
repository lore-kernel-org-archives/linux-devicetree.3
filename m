Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713865;
	b=SOCK9yTdi+8jNSrWyhwkhQ/DOCL0VF/5++CHuUOdCyfxtgp3cvyZO+X38pAY3mwvqTF1
	 wY1GFt2z0r+J924gmfrDJ0jzJLxnM8fe7fLZbsoZMh90rCvehA7migZmGXu08+PILHAut
	 xctIaGhsW1ND7XPX9eOXbIk83xPXWzkXLxkUC4oKjkP7Fnbh1Q0x5uBigQonoWUnYSWJz
	 fyPFdhKllJVrxdU6s9eC4Cz6nXOvMgtKjTSqiQxqg4Ng6pSGlZhTWP8FdiTooTuGbp0X6
	 Vss+OvMKf+PbxWIrw6jOtbLMlSveatn4YYXQfAgdYvskqcFCajVMxJ/KXUEwV8Ecr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
	b=1o59uqtejHL4e3lHcslB5SUkLiOtRpgZog/+Cy8r5U8CzyopOLyNoU92htWElISMPSG5
	 v3R+CSCYmX/3hvyz2v9B9VXcYyfBTVYJfY+ICkv2KtJ4BkfwirmtoK7aUd0LP9gXCntFi
	 jQAIttilqV6loI2KL2WgkCsXn+XUNhnIFk4SoSXybQtN7RctGWGzoHE5rgnpJQGbTJAVg
	 IkvqfiHUqG7xI/lmBGlCHXYTKoVWTwnX0H4+dVTeBV10cMG9RSNRqlJyLNgg8MPpKoja/
	 gmMlIMohx5OyvW85Kt78onJhqq9vn/7AjAP1h8uS4pmaDhZQ+tEIvXa3R1w61JraWyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fADzAqWq;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87796082BE3
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87796082BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fADzAqWq
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4267206c88.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713864; x=1794318664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
        b=fADzAqWqD4zUvJ80U2YuUArvszc6Y70kh+DWT3mFXa3hrhEkMQOpubbBpOKwPrn5P7
         DA36qLlzDfzi/UHQ985HwJcY5au+auPiL9oDfjSeo0ewNaraYF+liP9l4jbTAZQ/AsCW
         PTkoauBP3Zaiki9lnphrvAnF6dHWbYWfDF3zhOQfaR+WvbbvdmU9i8hsmnvIb/UhrTRq
         qwTM6KpwmAtK8KRtnB1Psj+EelNSsSPCAzGIFhVz1aG4aEm1qr8AyjEdjGnhR9esjNK5
         zVd0wKhj8Lke7L6v0D0ajWnD5fJZU3h81NP7YDUG+1IRQ4NF7sJi0lWJ+ZSfCe9QxmUV
         2ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713864; x=1794318664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
        b=B9z0kOx/MrIOK/xw1fiOlr0/1abtVX6EsYqEPk8PB0bluVs41eYCPXB/0xIphZQbxE
         nh3GCRNMvDtX3SykspClDE39bhqddxPLZFFdFOLsa14QUsUU7pqjNFARoPtQ4Q8qud6h
         v5jR4M4WEo7ufa4BjHXwEoVJJWJLG9Kcu6LFsSn3GayvW0Y07iPaUsldB6BtD9NTB+YR
         lWsjUARUbBlVB9HnzjLDFvtVziniJ+eKQMnjjS6M911aE4u5IwFpg5XSYkbs8Jr3xe30
         r41NQI7M6F2Zg+2JuDCluQDnDwLiOKMxICk8pjtcEbVjGS9n7MF1Nm2EBvS3KF8Q9oxS
         egkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1HM7fJlWlS6iOtkFHMsgULDsz1Rrns+RMzZqDxuLZCtiWAwElmSTmmNcSurLiABEgqiozJmNNaQ46@vger.kernel.org
X-Gm-Message-State: APuU4Z/lqfG1W3pjazKKarpFdZMa1BNjuNSdYVomoENMsM38gMusJtf1
	9B1iQ/FwrwlqWMnTAzmypbII4ybSTgM4XGXOzURXVPFlYcE9PHum3WFC
X-Gm-Gg: AYBFou0j0kHX/sm/FcpQtGwN8txnrCN2i4Ab+6dy1+hFJ03O/8fG6Si4rBtr2KzZyEi
	inFY8LOqfKi2ZABP/wvlcVyArRlP5wSTdrqNX4GAkYtvM/ubvX611Urw8+vfLpgLAE7RDMV3Xb8
	awIEpn81wSLmKIkyFU7K0bUTf2xWesj/MiTbIZQPTtNLLXRunSlMUTJ5udjbYEM7o8VAUt/3VIJ
	egXBWyrsV/BZhFewTj6okslxCteVnxRlyE57lEJuXHHwse7HIvGeqIgRRXERC8nzNweFshUNPrl
	fV6vtal97uqCDFTri1C7PhGkSFruRi93HQMkr84X8hmtWJPNX2ofmCzWI5sJrmHYfEDDxesL2Qr
	Z25k0SF8GePV1VXmUNRINjPCWu52AErKdSQIfWNoffT/4yG6gZAZjvhc1lSqoVC7VOsVB6T+rHs
	Zq7SHLBHmnI4FjXq3/HuZ8D/l08DvWlZ2sldmqTIN/7ZWMTHxxQjjRYSyAIOxqUohijXhoAAkBN
	szz+A6j6apTNmxdSX39hi8pmKM2jkr4zo5hMmSauL1ka0ZW/zfK/j4vguh+T/fuNTE7dAgbXXza
	D+z8oM9M95eYZ6CHIKZQ0PUTuF9kbc/3vdL+hIWte0L8
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b23b5bb847mr4423650c88.8.1793713863810;
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 22:50:55 +0900
Message-ID: <20261103135057.1682-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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
has to move to the UTMI clock before that happens, so it needs the
Type-C mux state as well. fwnode_typec_mux_get() only matches graph
nodes that have the "mode-switch" property, so allow it on the
controller node.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..14fc7e4ebc80 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,8 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch: true
+
   wakeup-source: true
 
 required:
@@ -170,6 +172,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.43.0

