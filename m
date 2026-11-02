Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656287;
	b=Stp5SYjkDO8X6wYrh3xDmFyy8EncaLBpJNZHH1FlT3UU659j3/H3ZK1GDwao0qdgGLyK
	 Qd3gsE695C2zUTbinDhcanGguAdJ398+ijfqL7HL0VAZR3HCzj+BnMY4EUSZ5hd8gXzpA
	 746OaMcSNEP0YXWv4xhb6m7rsjSo24RasChCdYvj5L6bMNRFULtUqlIzJrSyybmFuB+yn
	 So/U3qqtvEhnmuQoHSOjN+GAgRTnHwB7NTts8XEBWOvLs8bfSE9XItOres7MWh/0FW1Hx
	 b0aQRUR+TLna6zqAzHnqPkT9+dYpUt8o50rrUv2cT+7bZEp+iad8QYcuVyDm1nw5z9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
	b=BBz5pzFBy1Kw4DSP1r7MGJG+B1kZkEcTGihDPLGxTG8H4LOCADrQ3BN7+2b6k0r7uwMG
	 OB+ucU6/14sj8iBpBvTYOKS6/+FJr+grYbVoV7C14AtK03xa/b2vf9B3+n6xqJYelIU2y
	 hGgGtnYIYH2D014YGrw3T5YEUkrYhii4T4qJmDQSKbJydLbQIkEyhGzv7EjIeqYT+CjOv
	 eXuIidd9iaex42R7k1MiGLCRI+Z/ETfJsdmsMSSsNcjowZwoqqDZu4pLk005ff4lNqnlM
	 77njrsk1/7ffy2kIl9LVIuWN1DFBdGUjt5KDmioWfkA1PuzSvCT1BFD5c0442nA6+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8C606D812
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 21:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A8C606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so4838061eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656286; x=1794261086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=jSFiY5V4htQFuOq1u08r6Qy/G9vfmFL+gWNi9Zov/cX0AtuxOSHykXbgpWUR8GBw+F
         vligPDvpGOytNAl+tBbiN1gtljoS+qjtWY/zqgsd78fH1CJsUmQBtmrUDj52ieCDsmDb
         0+jTbCn+BED+Hm9gUyz1IqdbOe1qK2Jt9lx26SOaL1gglKupCNwhVQ/5bOcIXBYf3ygP
         aOBT/NoW4Jeo+oAIvW7CuKq08AWQhf293gqnRFwbQWqifgMnP+EXtnwzqfvonjJtZRYf
         ULQ9V3f3CKOhUfROm0MxFAl1JDMvmLdAJHjM164mZu2RegECHqeKeadRcBJ3QQTzoYED
         rKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656286; x=1794261086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=TsqGcbJOKRd1hZTfpmajPvlxYz0lco+EPbNJ1F6NCWNgSZr/tKrZjryKSSvZKiDye4
         xMatFXElk9asZiWFRAVncdHj3MMcckwuDEcdA8/1bwYyv5EuKFGVKQrdS1NpMZTvbGUg
         tPO8VPI9QVRJpNqvR56+NazOseogwnG9kiZkQva63hTbu8UNrnVIrEu8CB53KhgVCETb
         3E8L+ANCgLtXOICbrlJXnhcNbyWxrYVNAGkVJ3pjzrrU7Wy3RzHLOL5MlgfRcvNbDhMw
         OqWzwE7dK3pkGzDEV8fAJ7gf6dkLWVzn5VaM6fphd/+kHUVKCd5SGPc3NsA/vUdv1YUM
         0uYw==
X-Forwarded-Encrypted: i=1; AKwUvBzBWWE0gPIZ+7YDY6Y4WgShmBRNi1vqIl1WeAf3BFaW+i5WvNsrgtzQfiKdXVBNygzqICSPTmji8QO7@vger.kernel.org
X-Gm-Message-State: APuU4Z8qf1aUxKs9vTSp0SZu8zr+iQPD57gSlm4a2LMsdAlRenw3X8Am
	vrHiQRUBIKMOqR6d226VdQVq1/rUmqOUZyr1uhsZwgsr4NMqPsWrRgwn
X-Gm-Gg: AYBFou0zI4Dby6cSTW5xS9ThR7v5jdYv+XQZ/pYQcg+IecFU4aLScoEAdr6u9/fj5UL
	dZTnD//W0e+drxlClbxZNVDNBq0x1GyG45H6AmhCqGDy+vHxMxyl7pnOVIL/fizQDnGhQV5yjWM
	nEiDYp4lZBbrvOlheuaxgXHmnFTJPS7wjnwSRrN3+hCr9OEcR5k78Eaj6Q3kTiJg6qBAmB1bb9G
	IWjTxlEYPi1vUCLl8ZPk4R9gOBL0wbMAeh2UaM7/wZvWgPj6FNjtZNfAbJD4uiV+Vr/VbhQTBRz
	uwgDcD48iARDOuIqxUAA4LeY2piD+s4R5pWibca1TdAl3gD77cro0XG70LrNihqvbNKO62d1NMN
	ye4zPHpkzYUIP3uo5+sEXgP54bfyFCD1drC41Q0qtyDyxozpC38VVdBfnp25h4jDvMO3OomQgWk
	mgel1DukNfrsyO7SxPCeHsQRTLw6rfj9XqUW1khc1z2Lsqcu8adLYfFaUQy47XZoi3o8QJ9+X/n
	DAMd3u3DxCE/KLHDcfuWmlZ8Ff6uSJvVLktdOhkdxGmAcuZt3TFMLzhdCtx2PDStJWhfKi47bV5
	GZLJbqVZTtwOQPJZB/5iuRjFYmGP8LwvXe26KC+O7vzt
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr17096566eec.17.1793656286305;
        Mon, 02 Nov 2026 13:51:26 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:25 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
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
Subject: [PATCH 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 06:51:18 +0900
Message-ID: <20261102215121.738-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..1380b769c73c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch:
+    description:
+      Flag the controller as a USB Type-C mode switch, so it is notified
+      of altmode changes. In pin assignments that give all SuperSpeed
+      lanes to DisplayPort the USB3 PHY stops its PIPE clock.
+    type: boolean
+
   wakeup-source: true
 
 required:
-- 
2.43.0

