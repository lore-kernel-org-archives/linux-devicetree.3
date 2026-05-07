Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0033D524C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194253; cv=none; b=O80wJ3cirdnCdkTkJQ8dyij3e4AEmtDp7mlzpIaPCRs9Z06r3uLnJK3Qn8j8WGndZOb+Bn97b2icMvgATxTYtye5/LwjFBUvswsxSiUjEhl3oqVN9hgpFtZPMXvmk/7frbd+2Kw/ZhcvOvtEIbLVaiW5Iypyei+vzb9RbAd1sBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194253; c=relaxed/simple;
	bh=R+kSDRMSN9/B8tlN2xVgcRcrO+d5Ja9eWUBrLluzDIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpDThlzedh550VijN3trYU2iFTm98ia4fCdPHFeys2loKrNfwswOhUxozuDb668wR5/MAtqNxui+Kx6OzHITz39E0x426YNDxEi7IuyvPj4ALJ2wSVXNnLKz/XfPQjQvzMElRrmewXBjxy+Wb/KC/vEgRqmrAB11WZ5RyMW2vBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoKIWwbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IE+eDP90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PoKIWwbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IE+eDP90"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JD3ah2182874
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jAc7c3OjUWNzZpEVKTXCzAfrbPiTEQqMeY2cMkUfy/8=; b=PoKIWwbucm1ZDyCU
	XoeQpipv44QEblbsICOAPOcNZHSVxPt9EWv1ouUa2JqTVnbiY6pARFkL0yXIwpRg
	7q6Rk+hRYVDpfTP3ipZI7/optFd1N8ZqysfnVHJXh/h3PNvy2e9p/4FAM+iZLQU/
	MxeGx+kQqJioqnvNgHvM0tKouYVK2lCJFN3qoaZStAjWpd4izZgL8mk6INVjGSxz
	pOy6qdbFVQsjRTZq5oNVMzakw/yNLPW+InDJM6ppC3KabF86I/ovzfYzFDhEcIWq
	0fJmukSBH1c6zAv7GnBxHVJV6MHsuGBHspjoENQKxOYk3DA4tnP2cPPUpXijoLzQ
	14hL1g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10py8m7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9569b029e1cso1629670241.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194250; x=1778799050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAc7c3OjUWNzZpEVKTXCzAfrbPiTEQqMeY2cMkUfy/8=;
        b=IE+eDP90p4As+Ce89K02Mo3qlnn2BP+bh1PeetbwTOG6EXh5xeWog5342QW0jd6GIx
         LbeUlnGLl0UkXYm16SzIxWsAjYjQSA2/Mw39OxGXkfdMyL+XFUE7G8lbQW0a4pZCJxI6
         5NTtzTVqQk4gIlQ9Zy+ZFiI4FSkQZGWzDkEBYWpq6FtXctq1kylOf6BdglvFrt7fZ/mu
         JN+NccmFInrsjrmSb/pb364XaSUt5wTrcjZ61tnTk7kVwttHccp1lVkTlBVw962arce0
         hRsJoVhpmby9X/vLFOQ+LRkChEug5FEdL1XIr+qRPr32ieFwL3Sq9G0Oe6BYXO05alhv
         cDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194250; x=1778799050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAc7c3OjUWNzZpEVKTXCzAfrbPiTEQqMeY2cMkUfy/8=;
        b=sU7SwelCFaFYdV/mTZInaBgm8E4eq6dRk3kWi0coXsqN6VNX/xsAbxQYbKUMokyLh0
         ZSfpq5udF18W0SBnlaE4V8hV7RRvf6UZQ+bAD0XHA8iGMqAlGLhEgvjWICc/NJWH6zwA
         cQJcIIwQmkgpvsTD0iOogFxAyFAHVY+s78vd2M+Uc889qNIfosWK2Fg+yMbU7eQi04wo
         n3vY2StuYr3b4nYfQ+GW8IXkh6PwRmcrAAFjdnYJpStgRBKFtwSMKqSPUBkb9SWuRwAX
         erXd9qX7n1PpZ9D0hN0jA46v8hSwqkP6V+5gPo/cp8807Ln5yyAAFMuHuteMDJxEKCHi
         5b8w==
X-Forwarded-Encrypted: i=1; AFNElJ/ExkWE6T6vU+WE42QHH3zPAfEZjxVP89Y7nGZr2RmbpqKG04g8pDD5PwDCOK28sKNZtV4YOBfz1iPR@vger.kernel.org
X-Gm-Message-State: AOJu0YwopfLbntOYXzOBvhHHwMW7TkZcMlzgDE6h7Z9ZXV3yef+YzWPm
	Pk21ysRN+mE23wf4CEg86938y1aDomD2lHHwGc0arun35FcF+sg1nosqVe73cT9GNARMrlFYHCp
	eEBxR6HbW/H6oiT5KCMh/cRpfJCrwf1D23YrzdwGwdS4AFahB7tYR4u3mvTvXhLcI
X-Gm-Gg: AeBDiev455X+ty+pwq3JxpBM7RTq35UXASsbfAQ1xS3RV48GbXaWIs56Mw1viap0Iy/
	q+K65rXdRr1lb5U0XPCjRW6eYMW24wJFA/JMwKBH20AcSgK4mU+UKmpLOi0xVCH6wLhpWql3opl
	XolCNGrCAvQeO/Y/8sxDG3Yz+d6CJVNv2GuBXZLEjb2NElpazo2P8ihh+sbxlRRjx2yc1RIa/9F
	JKIpTDSqcFM9+DwXX08fivuy1Ad3JQ06fnQEu4H/SfXf5nhlxeOiUDEQlIPzjp5VGJbf1owbUD/
	uq+8CzSVHVPybylRFceBDNNVvDNGE/l6sIrH3XAPJXjmPK0fJKPl86NrZb8lw3HdNRW31HUkVg5
	YJq0HM1lPczeon6KDFvReddUTpaJ+GnWvVC1Zt59G80yXj1e9HsRO+mpnXQkh2KJjJo+saCh4+V
	agdESuIMDgn9/se9f4
X-Received: by 2002:a05:6102:5983:b0:62f:33f9:37f7 with SMTP id ada2fe7eead31-630f8ec5f1bmr5882008137.10.1778194249865;
        Thu, 07 May 2026 15:50:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5983:b0:62f:33f9:37f7 with SMTP id ada2fe7eead31-630f8ec5f1bmr5881988137.10.1778194249350;
        Thu, 07 May 2026 15:50:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:30 +0200
Subject: [PATCH v3 15/15] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-15-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fd174a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=qQ54gDEPcyxammeZ:21 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 6DCW88TmpI6lt5hNJlxncPFt5zJCjHfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX/5gj7yYYZukj
 Qp4726sKvZwYqXUty6ZI1OM0MjE9fwqh7DrSZO5uT0jfqS3KtUYh9Kcuzz5FGN2dnYzHvTfB2RU
 +oCQGo0MFi+XSY6jp0EODguUCjSvSRE2VZVIbFgInpowyIYqd74nHE2oOa0NaXrnf+7DZfIAfQS
 uPGG29uSZeEqOlaToNesV1313/QlUBi783+hlNQ9pgYllBXJhSFJKXtta/cDpWkXy6q1Y1Rdtcm
 0x0UI9etGQ2akjKDln4pwXyYGUpgR9yV49pUn26FRqgpCRbD6ReX2HTXzN0k/pxK8NK5J1o7/oa
 X8Mcim6sq0e2vEMpxuaFJJ2EBOpdr8gGM3IN90hvB4U2FVP9GbkXY4Z1+lbLVW+YqQTEfhhpf/E
 HTk/DZUCFULqV9zI2oH+PX4peokzpJa7emU1S7oOUEqL4Hs5OLfTtUouXmDooDbSSM2DLteFaWd
 tPqLQddQNb/wmc3XXQQ==
X-Proofpoint-ORIG-GUID: 6DCW88TmpI6lt5hNJlxncPFt5zJCjHfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 6a6ab3f15c49eb1e8150f57198ffe2515fa9ae52..e93da2c64044d1f0d49b3ea41faa39cda42e86d4 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1921,6 +1921,10 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 
 			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			ports {
@@ -1935,6 +1939,73 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+			camss_ope: isp@5c42400 {
+				compatible = "qcom,qcm2290-camss-ope";
+
+				reg = <0x0 0x5c42400 0x0 0x200>,
+				      <0x0 0x5c42600 0x0 0x200>,
+				      <0x0 0x5c42800 0x0 0x4400>,
+				      <0x0 0x5c46c00 0x0 0x190>,
+				      <0x0 0x5c46d90 0x0 0xa00>;
+				reg-names = "top",
+					    "qos",
+					    "pipeline",
+					    "bus_read",
+					    "bus_write";
+
+				clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+					 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+					 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+				clock-names = "core",
+					      "iface",
+					      "data";
+
+				interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+				interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+						&config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+						<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+						&bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+				interconnect-names = "config",
+						     "data";
+
+				iommus = <&apps_smmu 0x820 0x0>,
+					 <&apps_smmu 0x840 0x0>;
+
+				operating-points-v2 = <&ope_opp_table>;
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+
+				ope_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-266600000 {
+						opp-hz = /bits/ 64 <266600000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-465000000 {
+						opp-hz = /bits/ 64 <465000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+
+					opp-580000000 {
+						opp-hz = /bits/ 64 <580000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+						turbo-mode;
+					};
+				};
+			};
 		};
 
 		mdss: display-subsystem@5e00000 {

-- 
2.34.1

