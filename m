Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CFF3A7837
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657570; cv=none; b=oUuOpTx4qe4VuEKD+VlWSjOxuXBeo9XQAwRXLHUfvAUVLkP2OEBg3K+Se0E79WiC/WMlRNeRg5WiCyfmOZb9Pl6XpZKuaSoXiEaUAb0gNf4sUTpTzdjAEWtpiTto1KeFBpOOqIyxc106XFR34YKo6BVzjMmvl+hvPzogPmeWN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657570; c=relaxed/simple;
	bh=pQgU2QaXkdIwBkCDq52VnyGH8FRn7TE/3ABrJD9FCLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pCD1ua4Y5YVqjZItNNTgaBJqQUFw0/GIBVUUopZYfSExb8/P6u+XU4vVQ0JuGqbgp+BblaeNWgcwxveDMKQNOIyyLFXiwiAozIhZWFNEdrFHG+kFWmJ/uTqmA0vFm2+g3HYGHBiGRKaa70QQDq9ovto3Qo2NnE/0Q3KWJfRvxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcFh27Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uncjfpli; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcFh27Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uncjfpli"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9IJ2343978
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bt2Zs/rfUd1yin6uGJnZlg
	C47x1PEKUQc5qaZ41AcQM=; b=fcFh27SgdkzknXKv6j2hqH2Om6RiHnkguZzWCW
	91yotlBTXCkJtes8gfeK2Q/llkXnbDkvg/ujG4MlbUN76ijp9vs/8qj2vqLV3c55
	UziSCXNsCaTzdkgDRXsYCqBVX8CftxY3BdkI94DJFcEVOAPW483bboMkfAC0/B24
	wjuQKfn33raP6bDmR2hhvSkxpEjLvoq5cIb96MT14ix20QJ80VjHexbyMePc79Ml
	O7kHY0u9W3GWj8KemdQADC3/bBuyo8Ld9JPJglkbopB9l20wVywUpXw9Y1whtkB8
	bkKtNf0N1pYM8Nn5rwUqo7lkXZhrFpDBVqKr2TwGevshsYOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn3v53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:32:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so5495048a91.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778657567; x=1779262367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt2Zs/rfUd1yin6uGJnZlgC47x1PEKUQc5qaZ41AcQM=;
        b=UncjfpliARL8ObkxMJsjt9+JiaRqMbd0+qv+B81smh6szRzsEqDGBaE6LjLp3ouOm2
         MamDK1/L00uOOzBGmnZNGrpst9hiAIGNUth3XI04+EaFdK83KhnU+XHTNMnq5OkDIav5
         csniceV4ca3Znx23UsML4mL033oWsDbfcuFSHC9ZCoY/TLt+od+gh7mFidraYJk2kx/C
         s955L2Yz/lDWtrwjT8/lqf3PQSRhcNYgNeuf5TVaLx49dLzUp6au/1UiSNuoYvTKmRG4
         NklgF8ALkJFlivY/T/jV6GV5gaKiDplsPy5FriAzmRMjsgJwMXC6BvvQGJApWsX5NBt0
         CUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657567; x=1779262367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt2Zs/rfUd1yin6uGJnZlgC47x1PEKUQc5qaZ41AcQM=;
        b=feLk0xAy1u/h2Nb91ai81cKvsXdeVTYqif+9ZhJoqiMIeW350TlawvbkerzKGn6RfZ
         NOfIOCrAoZTVbrMioqcQY+xuPAa8a9ws8UebheBnhdMEV4s/sUAPAhqKNEh+BuY90/jk
         7jubV0kqhboj3/vXUXdoAAMVvCS7sWWQpjlD8KEiHeQ+Lh6VSs4PA7kQdV7OTGWn8huV
         iWAvu8e4Xm6OtkIXZlwB2VoDGMUk86siWfrzk7yQQAvQo8It3P04vvLnR7UrAUXbhw14
         51HO87ykO9yK/J84GkzTYd6VMnbBVSwKjCALa3tw8loSCOlOvhPP8wme7f3FGlgfnJGE
         si7g==
X-Forwarded-Encrypted: i=1; AFNElJ/sglq+IqHLJc+hwekqg1T/D9uqqSOZaso3looXG3CvVCE/kjcQ5xvAq7KdarjVdg6bxdHR3gzne7gY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8IX5iGy2MnrYeHPNJSWu1sKE9Fi9Pk3viignPLHy6/ELCTryB
	HcMVYR0yJQ6q+ViyFXy6257InnwsMbrwRratrRwXt0B+U0aoB/yYNaDZgw4fG34yVhZ/yom9If0
	7Gi3Xm79iEUVmVb1l9wQgxNseuUerjWvI6eOvNQ1hyqSU0795J8Pq/J/dDPHPjuX4
X-Gm-Gg: Acq92OHIlMRB+Y2UaQwsdNLLm+U3UnzLL7cj6cYh9MAm3BmPUBUyymlpexzeJxPLqzL
	GzpvIf/Ql8s31z8DIclNqsmZlHD1QucQ5jjzDVgoXl2DptsSzQYaAIivXCwBnLHnITVTzkwzvg3
	Xh8TeiFUSBE1p6V49oDAwI1IPly+jDbsE5vgLJDOvbrXCRtDdKI3I3WIGifD1WXvYpmOYGoyMud
	0uhzqMdMoRS/Atraq03j7KA4isOzTdslRzlnLjLZaNzE/jCB0uJD8Y5VLwbdzmmWpcKmWrQfong
	ABJFNrEoxdFl3dHyUekq74OhEszIypoRayL8OHsFjiU7E+3M7j4jvFtRmH+m6M/VQw7fT7aO+7d
	Q+F+IMnpCYdZUdleUTzsqTxEqrCrXEvIMHYurBitVyDBC3oMM3Ro=
X-Received: by 2002:a17:90a:dfc4:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-368f3ab22cdmr2570548a91.9.1778657567205;
        Wed, 13 May 2026 00:32:47 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc4:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-368f3ab22cdmr2570509a91.9.1778657566715;
        Wed, 13 May 2026 00:32:46 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf90fbfsm2607593a91.15.2026.05.13.00.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:32:46 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Wed, 13 May 2026 13:00:58 +0530
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Shikra
 Temperature Sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALEoBGoC/x3MQQqAIBBA0avErBPUMqirRITmVLOZwokIpLsnL
 d/i/wyCiVBgqDIkvEno4AJTV7DsnjdUFIvBattpZ6y6BFnmQByJN9X7VWuHbWgsQmnOhCs9/2+
 c3vcDGEv5mF8AAAA=
X-Change-ID: 20260512-tsens_binding-9af005e4b32e
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778657562; l=993;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=pQgU2QaXkdIwBkCDq52VnyGH8FRn7TE/3ABrJD9FCLs=;
 b=ehkaQAWg+f+hsPihEsHpu2HbcnWnsz6CDtGPXUH3dexDiW2aNTepnWEolarGnoT5ZfPV3bpLY
 e1I0b39kCYaDm2GVpbj3CvYjte9MCTTtsw2Q+P9ky1QWX3N1mINslxe
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: a3IF3opSdwLw651LVoaVnKk2eGqAMRO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NiBTYWx0ZWRfX46TWvB12E0zJ
 hp+qrXp4p+COm3E2KVKAbcQqBdm+mTE5OAec8GUsviVu6rGhKvBBMCKcgXhJGHoPwWuJ3KWnkrx
 J71o0zXPmguItrVZYEUn3BGAjnb/IJGYyRu7d6ScsW9TeR+J/WowXdXLY5zDKTeTFmNVWgE2i41
 iOqtveidVMnUqSHfmvDRpS7p6rav0V58NfiGegAUo81iWUiZk7a6cpmNPFJDsl4cSnQtfny/9jI
 zyWVerNvoaBqsgAUZLSjqZpUGqY8BRgur70mWFS0qmNPit+xzizhU91smc8uHnp260ruI6RXyjV
 U7dwfXiyxr5n04MCRuhKDpxQUvhAJOB/7PITjn1m+SY6Kr9ctCcuZaqhHHDsMmGA4iktTXvdsbf
 uH9VEXRaN5KSjCyUBhX+x8dZY4F3jNTWgQ6feGxJd/Ak2rWPjDjnp2A4FopyxjPHroZxMHZDyqF
 5ZS8zCtxuPjPoH3kWQw==
X-Proofpoint-GUID: a3IF3opSdwLw651LVoaVnKk2eGqAMRO0
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a04291f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FISNJrs5UlbpyYEJD7IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130076

Document the Temperature Sensor (TSENS) on the Shikra SoC.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..a986fdccd52e 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -74,6 +74,7 @@ properties:
               - qcom,sdm630-tsens
               - qcom,sdm670-tsens
               - qcom,sdm845-tsens
+              - qcom,shikra-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
               - qcom,sm6375-tsens

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-tsens_binding-9af005e4b32e

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

