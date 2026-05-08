Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D773384234
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229413; cv=none; b=ms9QEiQhGcaPQ9VVn0UpmF3veNnOB2+BDz1DebfSRGq9fo6pUqeXJdkt0iAMi7gwqGWsgl/L4+uemImQ9mHXnynDTcN5M8KFOx66I7HPTLIUe94A7DJ5GsmRIj94dXqtrvwxBxacUfMISofqZX1pYkjyErNryAd30meRHJkMHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229413; c=relaxed/simple;
	bh=wx/jnONfKO6bxVIAr9KzJFD+If/eHxWT4o8WYd5Uldk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rm2RK0izQrhs/P/n7okDySzuBPXA0t4kqr1HIVKdvXZRm0jadsxq1UPvqW6W59ob8pezpxrJo1VAuSekJk/hpFlbN1pgYtuRbX7BRFC8K6gVvN8GtO5ftHwIGLdWvxe4dQor505P9Rt4Uja3sdm5kGT0X5tr7XYEs8L2iJ1CuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzGXmzFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuYYGfZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzGXmzFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuYYGfZc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64855fwS2531224
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKaElLs92TbrRphRlbmQTzsP8ACzdFCzi6ucUcLlEoQ=; b=YzGXmzFZPE/JOhle
	NfPwyN7cK9nDtDoT2j1v6OPqAIpi1NGWaFtyRKuvxUu2RWczC4DPdNp5O9azf6n7
	5od/K8CWMTVMhMjL1OY2L4hlfB2x+6yjjwPgWYqtpRMVCNDlDeGq6iFVGZlpqIw/
	Pv+637W4Avx2zVyXPfO9hUVQbsujES7UvX4I4+8QVOFE/UUHo8Oj8NEzrcJ0K9KF
	8SPYyx0ajrLYlQ6399iVIqJRg3isdyLxP59Pjt3wgeFks2SwA1XBjaGUP9vsJSf+
	2nizERfQztOTbaXIHHXAuPLsWsScOYw1s/Q3bm1GWooKgOyItzblDIPXJNK9uIAp
	BNcrSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9tgwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:36:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so1100291eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229411; x=1778834211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKaElLs92TbrRphRlbmQTzsP8ACzdFCzi6ucUcLlEoQ=;
        b=EuYYGfZczeaFKnFIboeodsCFX5HzTjRgC0GLrmcEDjnipAd6gcUIq0xr6noppQO6RH
         0tllC+VfOuBfpaD94QLX8P6Q0V2lynonhoNbiPKyLncMxWAPCLF274FbE/KEbWCHJhXb
         Q9QboxHXw8VDox+FjZgRVmw7+TccsiVHivNF95LG4hw3kRe3UWaCasDQuVYphUSaZq+x
         bHzjLvUlqB8oXCJGohxf1cQMEOwe2s3Hk3+zSmfTzbs+S5tJ52wk1iA+Cn4ZsUa4XZPh
         mqr0TaTYNrChyMjzWzw293RGvKP+uRybk7Rrx4f6MNOtsivj5wmk5LRK0XKX5aVxS8Oa
         Q/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229411; x=1778834211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKaElLs92TbrRphRlbmQTzsP8ACzdFCzi6ucUcLlEoQ=;
        b=m0kFtGIEeSxPQIxrXbP1o64bUU82pfkcXDMIRfU1Sb8YzXO1at3axc6EWbmvsMpBLo
         rI3ePFHjGoaxcMvAUaMVH8A6Tuq6467Tk5BuiovilKo6F/KeeeRc6qZnohnLMvCD3wQw
         p9VclPOwckDHb08zhzaPN/oaGmiAYkJqmTRu1KI2dO8G+eeX0L2yA50uZoOJWwg6nxyT
         b0i44YP2ktlAzDbCbCAx8Jpv4/L5vGolGTDt9WTNGN4jussFY989+z3pdjHJSRT1ufcG
         8w+ZdT9jAVD/3NqlxN26unFVp8ai3iVK3lKmRr2hosQugWHwiLp1O4YVxBAZyfk8GTBB
         k5dw==
X-Forwarded-Encrypted: i=1; AFNElJ9eD9c9DFjZWnyuq9v9luKf5JOHUZuVQHJutc/Ja40m9IXQZsTdNv7xuEJPHCaPXkO4ZFewqoU7OBua@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMkNbjJQGoNcKEXUM2IAlEFgDv9oKKHewyzFesUTUfSNAWni7
	Jh5y+zOvnAOH2GsF+RPaH2sZb22l2BcX0dIWAgETebXM3epZrJKPHwM3g6kgQ/Rv7ux29k0KUuV
	C+sy0rNLnzBsP4s+h5I/+aCq/FCcMs1fIEmJrJtsIke2VQqXcEkO3BN1DbRuCkRbP
X-Gm-Gg: Acq92OE5ydOqTAaJVB/AwvE35JLOgojRqAELX0tfxPUWcNsoG0KSMhBFHhV0uI81znS
	5JnDuGJH8lGVJkQ5EzTOwgX7AkAmiOTuG06igCStPV36MW2thmpXEkao3zQScH9NRPty7kOsQiU
	fv0OkxXhWb0qOsw4Od8qCogBJREwExauYoP/uYCwjxMqcswI0LHFne8SztkEAl7gpqQgDCznAEQ
	yQeJfhfk97QUXbC7IS+HRAtBTNs5YFXNhP8ycGGuGYgS69BbCzzWpjqcAK6oJpySLJ7b1OSCqiA
	uHNWIfU4C/1gu20r9xkgefv5p9sheiUq0H6Rb2VFfn1vwdLS9m9xKY0AZd8pdtgVjjfbfEx+vYb
	oPUDeO4FYXNYNp/YtIXejAnapEpyC/lGXnoYMSbS9z4lIYFKS6BQP/vrOnhJOd7mjjJ4Xmm4P2x
	xE
X-Received: by 2002:a05:7301:2f8b:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-2f548895150mr5796604eec.1.1778229410972;
        Fri, 08 May 2026 01:36:50 -0700 (PDT)
X-Received: by 2002:a05:7301:2f8b:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-2f548895150mr5796585eec.1.1778229410347;
        Fri, 08 May 2026 01:36:50 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm1504922eec.23.2026.05.08.01.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:36:49 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:36:47 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
In-Reply-To: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: n9VUhn3-sel3qe07FR6G2qFi4HOIJS-t
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fda0a3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9_aMYF_q3wMrQPXvZMcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfX/FB/ebNBiH/h
 AGefghmxgZSn8DUJK2t15h3tf13Wa7tLPvzxy79poKIsi3UxNOrwWT9/oQdCUB3ndCm/GW0uadc
 WZK4I6z6KOBmc8Pr1xQ91jH3YYE0hjYQObnpRI6pvekzfiYbl8xQGeD0VYEtrgpr6AcrcQ0EHhq
 4opgShF663HkfooRLDCrisT31HcppHvUk0lq+2u6ddz9VnlCjysUTtazOrvuEFpI2u5S7zpXCuY
 7NGG6vN5zcjWSvh07l5Og9DeXTAw5XsxF7SuXgaFyIPMjyBignLtOWmYynAgPTAtIWSMF7faB9n
 9kVXz2qK4NVtY1UhfPUNSswGxDqcSpKitzP7eO/eEOR3pABKxTUEyp26n/orv+I71Rnh4tbXwyK
 mT+AqDm5VABnoNahwnzgOv5rBW4lbjdT6rpE78AULTaNPpSm3XVgMA2r9fpvnDsvewk8TbVYc2O
 37EwOHP9qIEuSt+ZWwg==
X-Proofpoint-ORIG-GUID: n9VUhn3-sel3qe07FR6G2qFi4HOIJS-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080087

Define pinctrl definitions to enable camera master clocks on Kaanapali.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ed7b7af6c43f..1b0ce1d29390 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3903,6 +3903,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio109";

-- 
2.34.1

