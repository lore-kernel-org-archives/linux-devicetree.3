Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7313546D8
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452156; cv=none; b=uqiijXrziGn4l78D2i2yReGgLFnN49FUB3p+usBwUa27i9ujO75EHdznyvqKG3AlT7XS0Ch6tqP21VRuB0S7ozyY0Ly1wMyjLi5x8xQnHlLjgtezssT1cRb5yiVRBU3MAuTdlXcsiqj0+mYvnb2UnHx2sAnKygqmSfa3rSCgUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452156; c=relaxed/simple;
	bh=1Fs8N6cwVTIWmqFAeyUCV1zMsM4ASCH5uF4rAKhciGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3oZdFYWRBID7NGtskYBzc64J6JTajVXlvtBz441hrSwgiNwmbTBpgRF/1ahCrZZPYSqtynVkz3ma3z281/AjSlR8o9l0WZKnIkMwE7h/bCdC5VUuQrxwTci0V6dD8ftn2AS/X67zYkSPAKhzs0k7WPn8W9PbxuPCnXtV6BKEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWLEYor4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhMaS6PC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWLEYor4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhMaS6PC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5diq491155
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l75MTQkX1SP
	NVbC3FrGgp64H9ib1BWH42DZHDWg2If8=; b=aWLEYor4HwInbMYms63/SrUsl7J
	evpOBhxgeGOmRLJ2H2oyR51YocdgARUxI0SEpYspZbM2xBOBnOu5EGB5O/+YMQz9
	tMiXTz4DWsd6k0VSoycA6Z7RKEWOvMgf7sIvUcgFpcJLjMFTGaapXCH2mKxDW1y0
	4JVTyHXJRThnA2gieFSKRVcpmMDP03+9Irgen17Bd38kNeyHalFufDXitw8ORvVg
	N2MDnD2cgLByI3eOuyfEXsm5FRRul2VihM5TdbODfBl7bGYzl9ApjydQyyTDti9P
	IMZhN4xnMW8ZzCYygJqr8221DmilU3UVqLmpzUM/13vEZ1Gbh3zlXsWqVqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9abb5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 19:22:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517e054fe07so84381951cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452153; x=1784056953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=UhMaS6PCwC2K0MXL0Ocu4GI45mwPqJQrGmGUAP51+irnHIzWZVrdXCpTUup6loQ2nx
         i1Ia+1cH6Ru4AdtUD8/Q2vLa4UXXbhG/MAqusPgYYUmEpva9A2VeqaHf91FfXPPTvgGr
         1eXN0G5JIgR+tQeov2JHpUDGWSYJArkMXK7ac6V9HCt0u/cLc/zNqXekZScXXIeYHBUr
         CRP6J43M3f1DdVlHU2LWzqo3BMwF0S8DVS6rhpV3TFK88AL360WVgx4PxxSGqiW4Jh2K
         XQj9Sy/ArGbmJtNzXYH97BHnw3DBeNfws9z1meswghfZ0trXGcXmHi0eORjrmFRnUANR
         ENLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452153; x=1784056953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=FS0zNPhtH/yjVDxs+wfwwLuH/xV4bigPUYPxft/+s755fQqIcuL+yYbdz0GDdS9HWJ
         TeCDcL747mKSVSMya9uS5dNlFkUsMFRqfpIf7Hu4aoAs8Y1FRbQQ/CEw5SfgR0RqcCV+
         l8kEpa3tziIbpVvwUu1koFSgqIVbcrBnpU9KQhWrOjv/+JFpTdYb48GkIXKC6oeoB4cX
         S3attSWSR4s3O5zv5SCoRAWz2E8Bh+z7pUuN39SybsQLnG0MTtyaEVWCO9ExZpoSuyFV
         PdT9W4uM+vEU1JSfavCNRFhhDIiwzIfP/G17kLCf5bfm48bLuNAR2LamnxaltjKaz23W
         pgOA==
X-Forwarded-Encrypted: i=1; AHgh+RoWLcdokJ6IiXKHkaArkpGDddq78oyTuCf4GXSOWHxuau0qzCMpKYIcg7zYWSb5KtcYMnW/f2Zo6Iut@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZfPc+1UwQblgu+LJacp7lc8E9c+MtpIjGnYGrHAxXl7JNNra
	uNLG7tI6+mL35g/r8Zuv/PJEDlza8B+w2db51TnY60wD2+286TOJyj98WyjWg3C45SwJpAAJOYX
	FZ3wFoG/xCTiN7hoPqhqLNxJ4J78myNSMkp5R3ICX2k88K7ImWN/wwH6B4gf9Y4Pi
X-Gm-Gg: AfdE7clZSEAlHNi8/7q2Ihibp8f0gVDZaXgsXG/36s/MBMGSdX240aiv/vkEuu7vmav
	EM8EJZrfy1mew5hhYr+X2PK5UaKx1WAKhksX7o7Bv1SAlufB6ldtpqRCnN8a5ORMBJi4fNmOpq9
	koM57vPp9Cf8LjrYMoLWnVuqY28Thq6WlxsVyaiJbW0y6GddVuYI32IJqPsakf/3dPf9ExwRj+6
	YtdTGL3ilhXVSfI7peKGM0l+RCDyWm90CofJ1E+JpaZKUNJaW62ycTnDEJV84SVw14Qq98wowa6
	jKCZDeVz771ShzW3zWIi/LlpBxlc45iju4iuyrZqHv8W6+nIBYya/8L/yppTWZstcGEPWoXIViC
	q/clZwqXxCJU5IqHdq347xDk74gL2flEXeWgGRucvsSg=
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72265071cf.62.1783452153219;
        Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72264601cf.62.1783452152846;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Tue,  7 Jul 2026 21:22:26 +0200
Message-ID: <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o40W-jrZS1YRYyl8avBBk3z3BUfJbaGR
X-Proofpoint-ORIG-GUID: o40W-jrZS1YRYyl8avBBk3z3BUfJbaGR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX5O4u20N5cOcc
 gL0sbeqm96uh9X6fGa+NoTiyjbVQRD6y1cn2LCyaWtJA+bvY4KPtjJIRvRFT0M3hxJRN/lVWVs6
 5u+i5E2F+BaYTVBGVh9xaZEbR/+69Zc=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d51f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX0GpLIRRxz24i
 +fIEjifV7IWd0HWzWz+93hGzMgUTi/d8ESnIRy7JovVZiZMoORkUTIoxLsB8IbXTjj8YSobmqMm
 qAFlKXIGKOsHUMKJ74a+u82yh2eFTV6wIRE098djudQRjtbcHHBzp7O9UGn7yCP0lDybMTLYX+v
 ENha3/Cz57oOTaEOPZXfcpX/NW7gep0uaXdR5DKrzAZroWj6CEry7PmGsz4OQFKWcYeAao7NO43
 g3ziwMCC24ZnBo2hxlicSysprgkPIG1AxLa+q1Q9yFjbyjaI1zu6Ey4ANGq9SEJPHR0SV4RtFkW
 UcQ9Qs2rIV5lioRd9a7HVizenjcxuHEAkFyx2FtdecdrMIGOeJolJX91IpEqLiy3agFxwmOoO47
 fpAWoioK20xgfc/YJqwmy3tTCPny0KsTmIqhl121L5EU5rxLF4gTYBxigZF5pnBYWS8NU+vQNfO
 aQiGPKZNSpVCvf71G6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..f677966b52a8 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,6 +26,9 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -45,6 +48,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0

