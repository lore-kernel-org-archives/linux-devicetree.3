Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6773AA4F2
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725916; cv=none; b=fzJWKvTiCO+Nl0oRWqhClRF2JvmP5xBOuPiLVH6ySC+EOwCWTFkVFgTgrpAV65ZRENDBToT/yP95n7+zmtCaRQotOcBE0l6a91PnQ3v7p/dEbt/EKXYxa1Tb+nXUVR5TNSJBlFnPiLdibetIhbTg5oAga3k00/OsLpq/ijwRP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725916; c=relaxed/simple;
	bh=qPUTshov07k/lbxm/T6PG6DAKvQamQk4TOLHjx7qqUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXq3+noMnq3YlrILDbBMIfCw02lWeex3NLU0kt6O9I+rLsPyb1ZanylPeDyyPsNqkKl/eZeJD3PVyNjOm3HdJuc/3omtLmb41v+fojgC7haxPVKItmJM7Q1ICaqwUg5G0raRUCozk95iCWf2cu49sXA3xYyl9H1q9fnHd1wQQ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXp4xk98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1q3laSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXp4xk98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1q3laSz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kSTg1613649
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qHpe0KIy+zS
	dDhQ85kEJZ7WSydqJVoSsCMAF5mksiQk=; b=CXp4xk98dN9zuCslAFROIcmvGre
	1/wxFDiMbaWLYEDFD2feOW8PymfMBE+k30tRgXh9r27K60QAagnU0qJSUcyvlgmf
	fMEcKj38vXALZX1ce4BdIlO1KA7G8jWFeD8/lrZUpKIpZtWx2iBuj1x1my+2vfSU
	kZpD4pYSUKdy7wHic5kajWOQXvRzfzpJCwYi8iV+VuxjyY6coCSCcDR2GbHpl6ds
	Z/de8qGzorNiidrkHqf5JJX/GdgvH5yfFQxmwJsQGtGGIS44r8tm49gNf4n8xubR
	bn3bvqIT3dzbQVpyFEwBOY1XYzz0lsl+ciSanxYu+8i8xCIt24iMq9E2ufg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v8q9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:11:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d054421d19so1863262eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725912; x=1776330712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHpe0KIy+zSdDhQ85kEJZ7WSydqJVoSsCMAF5mksiQk=;
        b=E1q3laSzDAgRRIqgSLRtJxcwJw7eNb53XNJQd7O6j1XQFhwjGgm2aCh7ehejeuTkN8
         X9fyQt/pB21Vyxpj7+zyxYU339FmiZt6fwHO/Q1I4Xmu5Dsr7Apd9ATyHQrZRiX+LfXJ
         0X+FWf6ROoN6O5IO52P/8gkMPn260p3krRZpnfWWqxpiSgnUckxZOCmGXdRZ2xA8EGCp
         4LvQyXhI4ou72KOgp3RFdfTWuo88McwhatPC2am26DP27m1XLtG+2vOUeinazUGqwr8c
         liBt+unN0NZ68wrlDd2tAyctJqvaj94Tb02d8bbB8tdurL5HL9vjLfIdf0TMXXdfPEbK
         JM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725912; x=1776330712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHpe0KIy+zSdDhQ85kEJZ7WSydqJVoSsCMAF5mksiQk=;
        b=L54VJ4GV0WsGCAL9gA7xVJQGYeijO0ekPU9N2Ip9cOSINZDKqXO1tvobIjcKS69xfk
         8kBpJkQ6ngbB+fr4wNruIxi3/U01n1hfV9wuia6q928p2EQNcVToeNE9flxmebi3Sg0w
         A+PrTkyHx5v+l1nQPTUTU0vKkyiPTgivbvbhAl3cS5y5uk5d1DR5oCRSKEqAi9/mjbrQ
         myT3ZSMecM0lIkX36SmyZEKhw9IY/QoSh44uGEBRVdipUGWkxxev4VmeCk9OnrcWW3gY
         iz/v6k2J410M30a0wANhjIUEU9t9NsWeZR6fv9FkXPScSfpnd9MGFYz0JV1fVnUdRURg
         tF9g==
X-Forwarded-Encrypted: i=1; AJvYcCWw0ySFEaGlh1Y5AOfpeawbkwcdBkwvvy6ZsItvwHEh0Tf5CCnEtdx6dDYG6cd0u+bg+PVeDjn+tQcy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd1W+6BgNpqKSO8xXsJ4PbwxEpJ2MjkOXgl3P9qoIwbQUgjw99
	euBghdVC7x5xdz76hysgR0xYkZVd5NlataPlap+/8p9DqgzDQcFAzHN2wepI8yRvRC+990kp5Xz
	HXq+aj8WtVfsrxb9kClLoi8+MHy7OaFYZAi4vKDGRvUzV8+Ei2TOZNJzg944FqZ+r
X-Gm-Gg: AeBDiesXCv6nQqwZiX/klvrZTnrRk5xvbMQbPGwQ06SWs4nucn6DKI54LbVsZdp/dHY
	w14hFafCChNupX1YlL1AhlAE01So5GlDJChw3SKSz6+eRGPXrucJuLy/erxl7rVyPfTR0JJ7uxn
	I5aqLjJFPpBsC40mVVlDIisw5gijTfcWzH+L8YGQbDD7hgUxU9QzPNmuWReDkU03ZMUBP/fOoCM
	ilWMr8xDiZbgzrQLWvJ/8/38lD8Z8wJlBNrvh0SYi2LEetVg2pyJHohHH+Cj31MV6zMjYYEMRR7
	8d21GzteuNusz1NPD3B0vzgLpowCu4EjpVtXETYTUxqsF1U6Ao8KwtlG20Wuiqbv017jTMuEHJ4
	MqYwg6YrWoXS4+dIFPT9T/LKJAOOFIHkVBqW0DvxyEN7dEFh681axnNTXE7XhdVW9UCnmOWZtAK
	B+yx2Aiw==
X-Received: by 2002:a05:7300:a10b:b0:2d1:d434:d005 with SMTP id 5a478bee46e88-2d1d434d88dmr5799254eec.20.1775725911536;
        Thu, 09 Apr 2026 02:11:51 -0700 (PDT)
X-Received: by 2002:a05:7300:a10b:b0:2d1:d434:d005 with SMTP id 5a478bee46e88-2d1d434d88dmr5799233eec.20.1775725911028;
        Thu, 09 Apr 2026 02:11:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:50 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/8] arm64: dts: qcom: Rename lemans-auto.dtsi to lemans-sa8775p.dtsi
Date: Thu,  9 Apr 2026 17:10:54 +0800
Message-ID: <20260409091100.474358-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: x2AcHDafESoEaZ_B_gVX_McEcm-XNFqa
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d76d58 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qgi84oEYZtV-hQa44IwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: x2AcHDafESoEaZ_B_gVX_McEcm-XNFqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX3B/j3o2uuASG
 VWumnP3xSg/lSo8fHMxOTUiXN5EKlltb4xWTYWtB9y+aPzz2jNdyNeiQZVtZvupo6/7sDBs6tBc
 Jpqw3DlIZTVuFsAIIk/zP3rBt3u1pepJ1Xcqqy3MN1KSULdGc1W3ZuwdNCknuES0Dy/x3R4xRmg
 pEINroyqeROmwv23U1b0iG5IcITF4WHZOQ8HlLSjWi06jDv+p0Qly5HX3hADztbe1BlcSRNvQpJ
 7ZY+CDyNVZgDzmAAUrnBVZ7LsDWqU0iGVpbdZzDP229WoSAfpa5lVKj8/iQ94qXQSaBxJOTSQF6
 yxD8H1QEIu47ADO6GqRaqDysxRbrp4fH4MAJ+2uyb7lmOghZ1qS1DxfwvhYhUPudGVgmi1SEQ3s
 cLPENu+MHC5N7SSn9wxq8ccMxlLBAsWqsKSbSWUy7bYa5+nXBRR+VsgpLP3trtA+0bWohEP7CHX
 9I6suLjBn9X9/3J1JhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081

SA8775P is highly compatible with IQ9 with only some reserved memory
differences that are currently accommodated by lemans-auto.dtsi.  Rename
lemans-auto.dtsi to lemans-sa8775p.dtsi to make it clear this is SA8775P
specific rather than something common to all Lemans based AUTO SoCs.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/{lemans-auto.dtsi => lemans-sa8775p.dtsi}     | 0
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts                       | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/qcom/{lemans-auto.dtsi => lemans-sa8775p.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi b/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/lemans-auto.dtsi
rename to arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index b25f0b2c9410..7a33fa72af98 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans-sa8775p.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 2d9028cd60be..436b0b1f3a63 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans-sa8775p.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

