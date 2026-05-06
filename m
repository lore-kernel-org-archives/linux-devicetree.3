Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1BF3DFC92
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057045; cv=none; b=pB4UNXyxtFIUpr/YGA4NR+bMBkYqc+G5yTRN36rHXSmvjICpDmZyrGoUyjCH9B0BStQrT1eX9mj0s/KtJCJEPA2T9//ByPPhjOnr8Bv4VKFbEYJu04ivTXdEdDeUlyypNwZ+ZoebHmo6GwPe53CG+pX0GQj/waMgi4B51w8VM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057045; c=relaxed/simple;
	bh=eqZNR351Vtb4Sw1T+jYuH9TRyuz4xIkqLpDDeaojG1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8k6D2Nt+80jg6MssGAxurz6BBfezdfFssyXHxYwBdl+mstI9kfgWtUriFL+rH8AS1np1YlgEGgEud6dQQFah6Z1DAyU9HZbZyEFDmYqcqvt8fqquFjuks7RX6JApPqdFfwswI3KYf1AUz8O1mMUvlBl2uihoLSePUHxwdxVIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cc/ytROm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGIK73ix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cc/ytROm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGIK73ix"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466FBEe3502578
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=; b=Cc/ytROmJe+3P8Af
	Wn/VDWnP3cTVGkouF5+Cs8uMtRFDakDI5gDe4d/x9BMki1+T4hCqyspNyxsXCTtq
	nnKYlAd7ZV8WvOvDtqONAFCAq+GMllxEhCaUZ78axxNXoHwhy2w3YwsrUuHNKljc
	N1zAKa10DaaoLNToUX2tN5FhPIVku5jpX6Mw1pYRgUQMi4JW/3Owy4XWxCoGzNh5
	nGFSG+jeqfqwR2WvIZY3GB+SJvcSVrI5YmAAQXoRV6FgBVRpfqrFX3pygU2KZamt
	mYwSdz4tUOr34SHuQNkeg4ufchuFxvuXgeSB3OIh/FFGnYfnPAwcehJpoEpS9IHI
	3j5aww==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqfc08t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:44:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dfe06b670so20822642c88.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057042; x=1778661842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=;
        b=ZGIK73ixDCna0VFVC685AM1x2vk1PHwPWzOlJwBOSxwmW3gEwqZiMufuFnixYd7d8t
         8MqOgnvF55L7VUGfkiHHRYXpxp5bJSqXt9K4e0rEOhi13IOtwgeGDoIm5uZJvvLF/DDB
         rDDdhFoeUBy31eZbEirrnMDGaDoQj0xpVNef++YUMGRCM67xN/1Z32BZ/fM2m1YDjB7i
         HaTpjT7Fu3HOnUaB9ylCgGLx6J1L8MQPX/QCLR1NcBd+oxIuq2JsmzC2KnrLRAU5EQuu
         X+xQs/AtuPWDJXWEJZpWtEezzrzWYX54q9Lhi/6pke7jAx/nvfna/ZmPKRAsV+hRA99Q
         vvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057042; x=1778661842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=;
        b=gIOnAB8HsnNcJL/Iv3zA4OQYYBh1PjATVuClI8/7sVAfHtXnKRbcSltpWYxsEeROPG
         GIln9c7960Rd+ZhtY2U7PDyTzw1MCUL7hL+Bt9EfSzBUodTb4yyfHiw58zWRGhMI+rSY
         OYo2EAPYhYJNRmb+dO8cA3Riri68AWeHtiQP0R5BPZ4MW8/fYlGb80+4IOHMT9sKMykq
         RrlLPUps6Vy4ta0Xdgl9QUKzgXPEySD+d4h/sIlytAnK3n4ArpZwbWv9up+rSQqPJkFQ
         w5x2T63YK7hq3W7MibffdDzr3Y88KfnAwJcAKnVV9h6NNpqbsb0MrBjRPWJzzeHZ46nt
         +LXA==
X-Forwarded-Encrypted: i=1; AFNElJ9G/mUn5qF4Zem2+vd6C3fLPBeTpfFZNLS4aECMH6bYpHEiWtA7bIC+aqxjdTIfbIBT0fOI3gWM/oNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwmNtDkrB/N8hAopR/iOCp4+ijl398/9KKOu6ZMI+QnnEuNLw
	OlS7zVuIGuU8oi8BpQnOaeGzR86SQtJTyaWeX0Lcy9knT23Js/BF1YrrwMHMfU0ZvPab8Q36V4o
	qJ5HtaI8jFAOVmAWGQwRJ2GQWcyWh00pLu/HHFh4mhkKTRgjgFgYS2GN+H/9NJQvB
X-Gm-Gg: AeBDiev38de4V5niYHB9aW0CCU0RE9R1NC3nNuXb5lSzAkJ2+7rqBpOH30LVlUL5vz+
	1bWSOJYXUHz7S3MMJZC9cT6fC80sacn5Za8trPLB5iCc2Vl3p6KAhNxaHIJT6LRnnuCFMvNJddk
	Sbs7TSr6/nljAj5W4cyHAFyRgpS2GNhwRz4RgjEJFGyjtIAVrrn236ARGWqebIEAkkTupVavx5/
	TdZl26zf/JCVkkPNxonLpFLR4P+6Tz1ZL4/1DrRmtTy0AtktMfz43QfQEqKCO0GrK32wynmTbig
	n5qzI9RTSS4xyT0LhXT5RtPZqiK+w+n7VzKHJhGlyXdHzMbzraWuTjTgop69YIiRCqNNUHGqCr8
	8nSeZY4OVaSYhMndDrU8dsY9V6ESkDGuPj/+MNw6QoHHZsTHBG37AsiNCqwKPCnSCdc9FpfoTaX
	DHyuk=
X-Received: by 2002:a05:7022:688d:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-1319cd26b6cmr1279968c88.24.1778057042374;
        Wed, 06 May 2026 01:44:02 -0700 (PDT)
X-Received: by 2002:a05:7022:688d:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-1319cd26b6cmr1279951c88.24.1778057041903;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:51 -0700
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=2788;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=eqZNR351Vtb4Sw1T+jYuH9TRyuz4xIkqLpDDeaojG1k=;
 b=VbrUi0OkuDq9hoaARgM6/TVTQaxY/TXly/WFEeJo9kHpiNb95b7xnO62/Uag96z+gR/kguLf5
 yGebgAyMbc5BmME9K5xPqRIyHCwUMTa/7/qGEAkJqd1IvZT6dua//is
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfXwOWzSVB4GKoM
 SvxwEEPCVLu2G6V/346tFLqv3P32+LxzRRP6g8Dtdu4P6EL47Qcyh4S/mSwxW8d/puRaN9SUcWk
 F893A5AxtpCaujpZT+lxwSuUOG6mpvPwiUM9bH+yTm1gkwPsY5mvHtIzxQoYgGUmuCoVtCNCSdx
 Wo1FPS1ROQPSvo/CHb9fr8PZtqKSAeeDbX+bAeeJtIiX+xt/0FJ4V1bbJDYNwh+aKQv8TUcsOsZ
 h7ximcIPrQglLZsnWH+XdC/gmHopJdqPtwBdWOYV6qyXdYrcP8aFlay1cgRML7YF9BGUgn9IkSw
 W9466sgCbqL+r5IzlEydKZxi51+vf1vflJhkxspNdRUfXJOfclKYqPfI+eXlcNRl1RI6sqOcROe
 GqA8w9xyYp+EWlCL1414rtkv02bVQWstX55xNVMwozXgq47dFYDGDfQWA+3nfc5UjB2N6IvUbp2
 0n43QLHcpMWfRn1zF8A==
X-Proofpoint-ORIG-GUID: 6vXZHxkOJdR4TD0bKBn5as4eTe6uhG6l
X-Proofpoint-GUID: 6vXZHxkOJdR4TD0bKBn5as4eTe6uhG6l
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69faff53 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2TsNLSZGWbgVkw9tuboA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060084

Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
required by clkref clocks.

The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
QREF TX/RPT/RX components, while SoC-specific topology and instance count
differ. Document them here for qcom,glymur-tcsr.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..57921cb63230 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -51,6 +51,63 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-refgen-0p9-supply: true
+  vdda-refgen-1p2-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-refgen-0p9-supply
+        - vdda-refgen-1p2-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+    else:
+      properties:
+        vdda-refgen-0p9-supply: false
+        vdda-refgen-1p2-supply: false
+        vdda-qrefrx0-0p9-supply: false
+        vdda-qrefrx1-0p9-supply: false
+        vdda-qrefrx2-0p9-supply: false
+        vdda-qrefrx4-0p9-supply: false
+        vdda-qrefrx5-0p9-supply: false
+        vdda-qreftx0-0p9-supply: false
+        vdda-qreftx0-1p2-supply: false
+        vdda-qreftx1-0p9-supply: false
+        vdda-qrefrpt0-0p9-supply: false
+        vdda-qrefrpt1-0p9-supply: false
+        vdda-qrefrpt2-0p9-supply: false
+        vdda-qrefrpt3-0p9-supply: false
+        vdda-qrefrpt4-0p9-supply: false
+
 required:
   - compatible
   - clocks

-- 
2.34.1

