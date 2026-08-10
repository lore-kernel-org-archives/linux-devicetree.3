Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5695357702;
	Mon, 10 Aug 2026 05:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338803; cv=none; b=WvBASBCH6ZP/iX030E/MTgFoAUU7OT2r10fI+9o7KJCcE8EPrJUScB/1Og8SFDTLopLxCD0delVqiU5NsoljbK723iLJ1qQpAWp8sKxwFDzMvBixW0tzP32CvpO5d0a2DUZReCgJtu36iZKIvRvamnqinMM+whLsll4ejBgDEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338803; c=relaxed/simple;
	bh=RRfj1yg0sdKrwe/fUtuQiOfUxdbPQlt7piJHg9Ed1a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A7zCwLsxd1/FymgQ92tPWJxqHo03ZSpWsie9XU5mqjq7WkOKV9oQdmljVN2kiKO5YJ9Ky1t71TbaFmB7+JnYHhl6rxaFNsid3R2WgZB+QjH/gRcbt3BsrCWsmzfIAYcQytAVNa/Fkandt/tPavVi+Gn8+IOLGekxBy6Y6LMeVao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZ83X/gb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZ83X/gb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L8msM3732947;
	Mon, 10 Aug 2026 05:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2yxhK1H4zjR0tN9/wIi0oV
	YWPH2Uzza7GJ3Tk+I0omk=; b=JZ83X/gbYKDLIHuEemLzBXprwYTGKk0dBBEZ8n
	4fAQfPFoFqQ358Jc//T/GWIqKYoyKGOZiCwNkwd/PnOOa3dsl0oRek/4SnvqbT8X
	p9mzBoSZaQdCsboKS+pZCzNL7d0UaTeEilryCtywLo5w5vN+jtvHyfJyVDs/YOMb
	lkO3w38x/DqpOxhSV5Q0lOCg82ZaOa/jQpdPGzHT5UvNeGw3wjMV3VuXLuC8btCL
	65OXYwFQ4Iq6OSTHzz+HbyPEWdNde3agAGQU18nRgVE7e94zh8a8/R9CoGpGSFZw
	ebbAvCoWibt0DG1dZ1+AeCW9yTTU5OrdNqq8erWq1j2yiGzw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush4gx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:13:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67A5DGtx024330;
	Mon, 10 Aug 2026 05:13:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fwwhht3qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:13:16 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67A5DGim024323;
	Mon, 10 Aug 2026 05:13:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67A5DGX0024322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:13:16 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id C07803CE;
	Mon, 10 Aug 2026 10:43:15 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:43:08 +0530
Subject: [PATCH] arm64: dts: qcom: pm8005: Add pmic cooling maps
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAORdeWoC/y2NUWrDMBBEr2L0XQVJtizZlNJ7hBBWq3UjUseO1
 g6BkLtXcfoz8AbmzUMw5UQs+uohMt0Sp+lSQH9UAk9w+SGZYmFhlGmVV53kUzpnkPOYUMZEElp
 oatIOdUBRVnOmId034/7w5kzXtYiXdylGYoZN3Fefm9dp++89QsQjr/M85UXeGqmkJeVCG41uT
 Pc9Me+uK/ziNI67El+vxwBM8tWkpa8QTbBDaxx5xACktfc0mOgD1dRYHd3Q1TVYcXg+/wBVXiN
 n/QAAAA==
X-Change-ID: 20260809-shikra-pmic-die-a6a43e17c1bc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786338795; l=1850;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=RRfj1yg0sdKrwe/fUtuQiOfUxdbPQlt7piJHg9Ed1a4=;
 b=5uPdIMWJpwVlBmVdUk2CAbEyEec+EoYx+ACPHLc3YzgS+U3cA4ynMnoVV7JIXxaFCcYAR1PDW
 8rQbRU/cTjWAtjogYKDRIZiolrZJHzGz+Rv5GIb5UbUk9pwSdYkw77S
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Np9UXStGWlZJWnASJWrAjaq2Cudv7Vg4
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a795def cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-pQxdz_zyCOcJ5ZbxqQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Np9UXStGWlZJWnASJWrAjaq2Cudv7Vg4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0MSBTYWx0ZWRfX5FnubgY9wAnn
 74hzvZctHhPdHZN8c2pszDqqlpN3/w5QYV9yx+8n5RjMpOuVyR5puqV9kn4642fnmqaJrqIuqKE
 RJHxicjQPj3Hbx8wxZ2xPlf/Qm4YIL5tQS7iqh5MfqRkKrWYuumKsAcYU8CiB4vv4wASTv7e+xy
 /PTWQrOhT4nrg33OwOpKK8EESJvOZzlf2jVi4rkhwP//T5rUZb4uIuBsEWVv39crkoPDoGvBauX
 IytocO4fhtvVBUMneqTSfaxNr7crpbJjc2u0f80gu4+ZVCqNBfSvPcqNNX4wLVOgmIWihPmONqj
 +NjGvnqNLT9Bapbqu7eEV37mMKU0NTbzQoOZ2QL9EAMsYkJRSbEIhoehLBecs3vuaPbiW4WsMX5
 lj/kMmdQjsZt1IgUX444Mvl+K61eHXnzXWYPyytabPYsF75SbVaIVOnPmMOzzMk4yxxBX2Hd8sV
 rDbqRHJNGfxpE4YeAXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA0MSBTYWx0ZWRfX5o1HK8qAHAjY
 GmoXzWX13OInfYLUZIZZoRk/prRtV6IWi03hjReDrTpx0oowA9WK36dCZqcu66APRNjSsv71GOb
 ESe/7vyF2E3mS7QeMzOXBb/liwUWaMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100041

Add CPU mitigation cooling maps for pm8005 PMIC die temperature.
Throttle LITTLE (cpu0) and big (cpu3) clusters at 105°C and 125°C
trip points.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index ce31a8545020..820d213b1cb2 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -3,10 +3,12 @@
 
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	thermal-zones {
 		pm8005-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&pm8005_tz>;
 
 			trips {
@@ -28,6 +30,20 @@ pm8005_trip2: trip2 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&pm8005_trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&pm8005_trip1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };

---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260809-shikra-pmic-die-a6a43e17c1bc
prerequisite-message-id: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
prerequisite-patch-id: aebf50762e984054665421a5a962e919947b16f7
prerequisite-patch-id: 6f74cc35e7368d525d7f7ebe6342f5d3c82f9d0f

Best regards,
-- 
Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

