Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CF4AA57E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392371; cv=none; b=AuCWM11ucAMKj49MOQK1J89NHadDNpLPXWWxm5m3bConjhZNx46S/HYXTqgNwkmm3bn4QN5dXNRFYHJYrh7DsUCCaAPlZhQ6i5Yee8fekBGfdubVE8ryKiwpPZl/e0/KOFs3dP2uovduh5ij7UlZJ1tNaS6hdAwukuvL/s+HyVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392371; c=relaxed/simple;
	bh=3Y4nSIKQIMHtksHP4TKmqeOEV26YVlYf6CD4ZN6MqNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZUEIj3UZyXmMCuCh0KD/SpEHNntNjrjAse+kpr9XFjtLVr3bjMowL//aeK4cjBuFA76y5sDErytbagpR8JGcHlXpbt8Ap4DlgjZ6esM0dib7HsAJkWumr6dc7H3Jnpd2jzkgvxSlDag0eYGqOrBCXaFroahHTvw8i1uV1Ug4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su3V+hY7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su3V+hY7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a01933b584so18849515e9.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392368; x=1791997168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY0HKhs5xhI+kbPGubJTNM/4f9SJfPTvcRyxFTTWKz4=;
        b=Su3V+hY7eIMTDQR/2oJKBjKRSXm4kMCBMF0VnZgiUj0QnDjPur6Hpbe23flDbx/9lz
         pUz000smWFW1rf8Si3X5A8LJUqzMqcrsPohmsDCT1dvND/taGhqMgqck5BZmCb25SigL
         oZSQPny9f0Z8oJjZSpetKNsT1SJWfMcIEv3JG8CXVOaArTIRlJ1tkYnB03GpMQokEK47
         JWjal6yabomkOlqtfTGhXndRcZpwLoVC87ojH9aYG9HMx4jfdcBovTyCAT0iJCrWShiS
         di2ON1jiBgru9KoMQidtbbAa9ecHI0/0Xd9Vvp8ZVG2x0M+GdVQvNX2zlMxreDc6Y3uF
         J8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392368; x=1791997168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY0HKhs5xhI+kbPGubJTNM/4f9SJfPTvcRyxFTTWKz4=;
        b=pHl5+boq2jPYVauv0xXgJJys+mG7FUw3G3zhk72hAyXyRiFO+CsnCHriVs7+bOVhn5
         MjVj3lz4CrpUJGQosK65XFrWR1d3kBmtI61YjMIpc6tsiHeMwDVUh1Qtg6FciYdn0znl
         zKBzdfd1SOUSq3bw8xT9vo02sddYA06tHqLOh/Q824VxyoesZBh99HdPiSZBKYkywtGX
         qCuentENfex5EqAquJ5o27Gbe5DbscwlIJpMT3L4Umq0t0n/8k1dja2C/Msj3p/gjGDH
         Kua2ajly6UZFfInY4tFCn8s9G80uKrgv4cuY7dkPVS3Rg7Qu/URb0UGcVm22HmyWsngx
         XUHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/koLU+yw0PbDCcXSjET6zX7/JLw0SxDAgVongs77w5Qx+H1DdE7SHnt8aEpfjbvygO6pDEh/K0DFe@vger.kernel.org
X-Gm-Message-State: AFuF++nuXNP850drC703ReWtVX+qKAObOEevUEroohdNxgiXRxnc+V62
	qwiAait3nzTizNx1bGZaOeU9PHrxSeIF+1f1nK2b3gHdzQ5gO4+ewMjJ
X-Gm-Gg: AYBFou36tbSlugrMXPncpJT/nnS4jutCCvPwBsWnALuKvrQVNoee70ZUBmCbbYIpBwQ
	PedT5mkWKLkGsflnKeFFpNx/KSect6RHLQl9VP0JPRr2LxLZ9sChpXWrdsM3aTDVVBwNmqKGj0d
	Z1OuPlUGBUmAVYgsGkxvRiJZTzAdteRFD1DsFvVn0XqC2g5w1/c8AjMw6PNhzFMEqi4+i7RZG4q
	JmW1qZS6Och0Yznyekj23gplsl6F2rWqYw0BUext3DBasHZRHG7KW3aFIl84QeeYZ3O1ISzLhtH
	4kD4Er3PZERHcUz4f3eXc0ryXG554951yKAaZTI4DXCYmaUasTSFrJYDM3GOgemFgF5GekuD/PN
	+7TnYKKcgLAFWtRh7RCZszlXv463WKP5UEculvAIjX+LA51RP14XFEC/MsO0xZ3L9HgZGOzgDIy
	Mhq8/+kW5qtJWgq+uUePNrTvADZkz9gxJ/mWEWNV/GYuxZD+/kK8vB6287L/XJLG/sZQT8eZ76H
	X3E+IU/UIhllL/nzOTn5PEbYKE=
X-Received: by 2002:a05:600c:8b54:b0:4a1:7d3d:10a4 with SMTP id 5b1f17b1804b1-4a18042a44dmr46613435e9.17.1791392368350;
        Wed, 07 Oct 2026 09:59:28 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:20 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add 'qcom,ipq0518' compatible
 for TP-Link Archer AX55 v1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-1-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
new 'qcom,ipq0518' compatible string for that.

Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
compatible string as a fallback.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..2a8af3402814 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,12 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - tplink,archer-ax55-v1
+          - const: qcom,ipq0518
+          - const: qcom,ipq5018
+
       - items:
           - enum:
               - 8dev,jalapeno
@@ -112,7 +118,6 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-rdp432-c2
-              - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
       - items:

-- 
2.55.0

