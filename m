Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0373401A23
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804550; cv=none; b=XFwkNqHPVT/XEcCmu+Fic12u+Q/H+aDIVs48tXWlqUarSmi8OwpR+NCI6ZPm2fVCM74ELWWDAs+SCAE/RKGFl8U95ZLfALZQCPM3dT3MwbwFi72cB7v58sw+0b50I6utjyhF+vFfEyH6i/ZcJexJEf35sMn1bGAh2DXRyUpoVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804550; c=relaxed/simple;
	bh=vNBmXUp+qr7T1swL568nvBKihzEO7mn9iQtvdZQjD38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWIL8X9XOXrotI624vaGQ0DQew+5pgSJlIMHFNOcVvoqZvF2PyiQtc+QRv3q4gMzFTdY8gEmM9oUPYmQuxauE6QRy0Rd8ZxbEB2TmGdx2yZvodmON1ZQbshPJtbHSFo+l9KgU44HtGcypc9EvHcEglYaXZzCBBx7+FFEJU6FrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhqakRQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMr6blFe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhqakRQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMr6blFe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsWWu2882509
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sRAimFW15YZ
	LFDJYTwa3t/Vg46FcoMMGZciPbr7L3vY=; b=ZhqakRQhVJzpZHKGl6hRcCdCBN4
	jqN9bDL532gO/es5ZfJqGbpVfTTQ11+up4rZ3QUcxWrbMQRm+oP2adaWfOwjwoaD
	LlP+havwX7NM3R94LEqx2h56XjCN9PVzrWQ2uNf+4i62SUvIfbqK0CiG3Bh2orRZ
	4mDDMtGngcPflpTVT3xJJz3QRil+FIYwIJiKDCvn+dRFKGV5SKqUWtHQodOOiCTa
	tKuVIolTsofahIxiR3E8RX6UwMzZP2E2PA+ToaUIQJgcGEv3dUz70z/7Jp2N3U4+
	HPZYaQ4VmF4tMmy1F0GswyQZlvHUA2VxzeS8fdD7Kbpc4MU/knT1pZPrt9g==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudck33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:09:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d94704126so3643650eaf.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804545; x=1780409345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRAimFW15YZLFDJYTwa3t/Vg46FcoMMGZciPbr7L3vY=;
        b=eMr6blFes1UPoIeZSNWD13Hc+MXmtJGTYsXXm1g42Nzrlxe1D9BZzhkgpXqztcXio/
         un32IQdLl3/tbtr6KffI2TDTCKQVZL9aqOKjb9FSccCxBvL/y9AZPIKiXQ+EBCTUYmLz
         Z16smRJTqV52Xf4gFzeAgTSt2e+2aWNrq1dDvI/ld+nBkecJQeycNKaizEtJx/48/1x6
         u8jHpgFeJSJ8PXmG4yUWDvHhE1feqnc0+iHCyYxB7xQYsVPurkoR11SV32I4G32dOha0
         3V59uV4q25ogSk9TVuBlDJCIcoS5XCc8ILcdOTwQGoY/sya3CO45//NymGdXsa7O8/bq
         +++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804545; x=1780409345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRAimFW15YZLFDJYTwa3t/Vg46FcoMMGZciPbr7L3vY=;
        b=QcBd65Y2Ww14Ohfd257gDIIZSPjULC1AOO153Y8o3KkJ2VkMiaIWvN38Ku28z4B9gv
         IS7ga02gSDn6P1ucXFSFh/w7D9UjH0HjkANKYtMfKwk3ilQQemliYB5vszXBqb0wQ4Of
         yhUj/GWAHCkQb2gvqwjpmnJPucj5ghGpUie7WNJ1ji58nnVsxqPu4mEQ4G5jZLp3NLCM
         zMGallG7D5fFpje9OtZI8Eb+RsTne3K3OGlgCP7VaLQ+lqAIo/Yc9GHHkpG5IWv43lnk
         l320VWVHo7JiwlF4Nkal1AfrTNhqPnv45ibkNyUHbK4fj2KwlUn40qJdu0+DgYNFRQ2H
         g4ug==
X-Forwarded-Encrypted: i=1; AFNElJ/AgQ0fBfcoXrE/b6jKJbJfMER4Fz17yPFLwgHevtcvgz2xrgV8QlR5OEKH69Zfub2xqsBKNW32B4Yj@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPuSaJ1FoGQ5rX1JzrVihXSzv3aI2xSrY7jHCCdQYZvPss27C
	UY0nykv8Z2A7O1OwAXUIspGC2d7DuZ+tp1njFgkQr7YqYKWqDW3UpxKhhZwGdFkiQk/1yLPePfB
	o3m6rXfOQ5xQS0LnrATSoap4IEgxvfLL/yz6ETMUS18yGSt8UF9eOqZ7DTFgS0Gb6
X-Gm-Gg: Acq92OECcziR/NfpQPpB8wiG560idlUGI5jNG3X9GNchaUcTck9KWNrMk+SjMQkUn/e
	jPJ5nMPyinNfW6LsFt4K+AkkWi1/F9nN4r0M/w7ttYN+BcA4KhX+kZEs3A/N+CrUkZ7G3kgRmZQ
	U9TGfi7belqzm+6p65CMipFeUppHkiEZlUqH6k6Br8tBUrCvEi3aPziTufoAG9ID4v2dHFiM0Mv
	aPAB29g7dc0D3SZ6hoKtPxJxtOUY4xEfIUPKGj9q43+3k3m4XZrwhYsXVn7l3AIRbPlBwEz3NSG
	9wOqxzcfbvAwC68YfAapQdbaaJow2zw6tFT1dF6iSHIW0Ooz2bOSB/EOlCrKTTbipUttuV99Odg
	2NMs3t0XrBou39zo9K+kjlSe+IDCRZWm/1GA/SDlqojr5mGtB
X-Received: by 2002:a4a:ec4c:0:b0:69d:7a88:9cde with SMTP id 006d021491bc7-69d7ebd2540mr9712971eaf.26.1779804545056;
        Tue, 26 May 2026 07:09:05 -0700 (PDT)
X-Received: by 2002:a4a:ec4c:0:b0:69d:7a88:9cde with SMTP id 006d021491bc7-69d7ebd2540mr9712950eaf.26.1779804544565;
        Tue, 26 May 2026 07:09:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:09:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v4 10/10] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Tue, 26 May 2026 16:08:11 +0200
Message-ID: <20260526140802.1059293-22-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=5i35tXeB+dh8TrJjTALfDVhxhzQaJ333X0Wv22iwE5E=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalU2waeZFc+uXORaM2nz9oOnxTnFcm8cpWx3 s2FzLBGue2JATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpVAAKCRCoMiOKKk/o T5NlB/9QnwbtJvG9goEnxhkDoppxiDPtuCMvxHYkSwAc6LoSwaUAHyacygDloVTTtlYpqGKzaqa /GcKZkZq5pt9AxdsqmYnzP9lj2PMAwiExJuQlFef2O5c54WlnVHLoz/MX+2IrazFsJIui5cVLzD Srr29R4eg5f9IOItjOljWua5gVW5uMxV9NmKNAMt/9sbG9BnW+OixxEiXACIAda9LcAyC1IZqPy VjkIv4vdO7MyYSEBED9wNBF0rcYWoHcrYBZl+EDpC8V9o7Ne34lGP4iC33a1l5Jd3kWPDNfm/8/ TYN+POK8V+qJdA6BNYAXAh/3sq/J0yNtJo+uF5WdN+2gJ18W
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Zo-g7x8_KFyQPx1-CQWzSfTMH7bPOqcq
X-Proofpoint-GUID: Zo-g7x8_KFyQPx1-CQWzSfTMH7bPOqcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfXzModKs51W6wI
 xaDSGGwivpbKLqoTD0o3iMWgRHEEhcwRaX8l+X2pSpty75HAVJhX4mcP2/gTyw3Qy7praZ/vTM5
 1xnYInATzjSvuDI3a1z5Ju3PZ/eAUClbtKBSngL8yH9A0FuCKEU4ULDoY2StJhUMvDyneZnmIEk
 mMiqm9Pt6vMvJi7zsuvVgrDpcteMlyn7DtQW6i1urahjPbNySdbhpzDiF1TUlj7sBfYxYMMsUT1
 IReuEagF86OJPIX5Ee771ih+Am625cKKATuTXPOFL0XiTo7Rcn+Udsg4dwcA3yD2UWLrMAyQ2fr
 oIrEQNHCE9cRiI2sE6+rKlBN+y3L5X9rULNe4ObwMiymKfIW9l5csKVzUNcXseSkjTALkLUjnX8
 HKB+k19yvvW8IqTIu5XkRZuchRu/jY4ToPEMfYWF3uwWJVav2uttIl2Q1nBvWMWkxmSA0iEw2ud
 bsYoiIKf3Dn98GsdesQ==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a15a981 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=WD-cMf_r4H3F8z8mj00A:9
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260121

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Extend the thermal cooling device binding to support a 3 cells specifier
along with the 2 cells format.

Update #cooling-cells property to enum to support both 2 and 3 arguments.

Fix pwm-fan.yaml to restrict the number of cells to 'const: 2'

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml      | 3 ++-
 .../bindings/thermal/thermal-cooling-devices.yaml         | 8 ++++++--
 .../devicetree/bindings/thermal/thermal-zones.yaml        | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index a84cc3a4cfdc..6a24851fd80d 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -63,7 +63,8 @@ properties:
     description: The PWM that is used to control the fan.
     maxItems: 1
 
-  "#cooling-cells": true
+  "#cooling-cells":
+    const: 2
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
index b9022f1613d8..28f5818f1e60 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
@@ -44,10 +44,14 @@ select: true
 properties:
   "#cooling-cells":
     description:
-      Must be 2, in order to specify minimum and maximum cooling state used in
+      Must be 2 or 3. If 2, specifies minimum and maximum cooling state used in
       the cooling-maps reference. The first cell is the minimum cooling state
       and the second cell is the maximum cooling state requested.
-    const: 2
+      If 3, the first cell specifies the thermal mitigation device specifier
+      index for devices that support multiple thermal mitigation mechanisms.
+      The two other cells are respectively the minimum cooling state and the
+      maximum cooling state.
+    enum: [2, 3]
 
 additionalProperties: true
 
diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 07d9f576ffe7..999ad40a20d5 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -211,7 +211,8 @@ patternProperties:
                   device. Using the THERMAL_NO_LIMIT (-1UL) constant in the
                   cooling-device phandle limit specifier lets the framework
                   use the minimum and maximum cooling state for that cooling
-                  device automatically.
+                  device automatically. If three arguments are specified,
+                  the first argument is the cooling device specifier.
 
               contribution:
                 $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0

