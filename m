Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C43EF66B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832736; cv=none; b=tE4k1jaoggz1RE1TYN9zBJdFsN0UDMFC4naI7vcqcbzUOj+yrvjvzhjsahbicSRYjG+d6DkcZUf42gaX1MKHOGXF+8f4moFNea9NmiIXMGlmhiF2qNSrk1PMPLBZAIvVMiRQ+Y5hdxSuCR5+vhoCjYwCZivvcZifL/eYY2IiYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832736; c=relaxed/simple;
	bh=+US5GK2zSF29/9R04DPrQPBV72Xr1zYTDbnKgIy+dJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jeKGxOwSLIJv6BrpNbJD1y3S6JqeekakWFi5omjYeoHMZuPJo3aB2ozSmeqyhbD6s+opJ38/bBa32X++T3UGgaiFs2K7fORvzCOSg1WbghT36vXUfu8WCgbothpb08ULUmvbUWKgfWKqtG4wB+NfhmFCmsE43/bekroCdcbPe20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIcPoBfn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpvldsBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIcPoBfn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpvldsBc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Us773197968
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NWmR1ihHtf/aJcBELQ6OIJ
	uvdv2Ggc25GY7ZTsa/Pug=; b=BIcPoBfnWDL1wZe616xKlFIJXN98TxEeOPfNyI
	+6Vv4I4pLIrj3yduI+Geh/P27k6KZjmZS35LdNJHBqiUbELRNKU5yGX/IZv/pLYy
	TY0m5Xd456D61+jPWFRyL90QjGzp9L5P+qAbJWBOcRG/T1Uxh7U2md+Htc/Q1i1H
	t0LPikRfxGFxOm47iccFG8vviskQpa38gs2pbC3WCkbwX02x+6EUc7yw4WdrdcV8
	s94BWN8tJcFlQAJvAbZ9WZJih2CkO9mhQspjrs+Ku/6ofvEzOm08TYLSb42latxM
	4o/wnm3a9fSW5btfcvZYlSDrHqFLynb0E1RbT0ePegbrKSsw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qaa3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:12:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8397b14a689so5606967b3a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778832732; x=1779437532; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWmR1ihHtf/aJcBELQ6OIJuvdv2Ggc25GY7ZTsa/Pug=;
        b=gpvldsBc/Kua70UoyQJbJSeQpJFjBnbTqKS+SIGbCYdJehTawN/+OhNlzjQG8Wqowv
         Vygcf4+DJZvNb5uyh1IUVeCiMFpuxTyZG/mFBz/ke8WaT7AQo5UzuitcH9GbXhvj5pqY
         Z0YF5ebxKIvD8N5LEKRzo+LcIwqoFsL6hPpgpV+OcQD7rfmz4WzrwRv6UexOIPzT4N9a
         36Ss7pHiG5/IPf/vyXih2zV9Nmv4d13EuuZqBTDdrovREVItqbAoh+vQeCvISm3npRd8
         eU7UbgUio2O0oNAuyCb51yVXGPdoJrGfCx1/a94ibzCmHS+N0JnelL+ynk2X7Si6I9F0
         9GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832732; x=1779437532;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWmR1ihHtf/aJcBELQ6OIJuvdv2Ggc25GY7ZTsa/Pug=;
        b=ZJTN25EBtc5pT2P2vdhZcyw2nZg+bfsRD2lHldoSMFqpE8iaaxFMVdqcaJWXvpBVPV
         AZ0lc5xNApOwu5v4XF+tE4mc2cHe6srrcsnT8ZnxqixaDPsFkg0sOC4IlaGbXJ8mjk6l
         0+TEXPMK1fy0doBiPR65CZPVSW5wj13E1ixkgTltm1n78VhyrYiLY+KlZkNgDkO63j8v
         U6ivljBXEirqXWL4i5BIhhDITBVorX8NczEH5pwnc2pcsQISADvwrBh9EiBPBGabQPJw
         TWkgCeoQxDQTTTiMreNz6oMpsRKdWpt9voezX+PxFCq+eqs6e4Sfptf5zY2QpI70biFk
         L8Jg==
X-Forwarded-Encrypted: i=1; AFNElJ8ychbQmQgH027eagbpjkE87yeOY1alnU/t8jY/ALh7Mu7NL98Jbfpm37eP5G/TYBspFovYQPPqUeOj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3TZXZrszBv9lRBMBWohmqGN+3MW2cp/mBEq/Q03NxB/hRkjeC
	wPG/LefoHjkqA9Yfr0KDpEvGMP92SFlhPP9h7C2N260lpvPwDkYvQAbHI9TwXvzr4gWK6PAl8xu
	lE+3BE2TIyFt2jquecOXOE8EjqVusjn/Uw9M8ZC36E3n0eZo1HTrKfNt5Owk3plY7
X-Gm-Gg: Acq92OGUdc6Hv3KO2MOQPUnw5EQi4mWBBBmKLixl3aUGHnktnIPfnol1gKCoHQ9VkVU
	bUF7C4tN5JqcrppOFrM7JrM86QxywWSPIclCYJE9M9xCyeUzdwe0Vb+U8acVxUYtwZysDj6BVoF
	M3mtPpoIQHM0EjMQGB8Ahz6uIT3hcRRIlLfMZaRZRryomIUHR3Qyc44oQZhfAUfuEuNhXiy8JIK
	pEVS4cm6nPWBBe3iQFY1jSILJ5sdNZ4za/unY4ifMDL9RYLrHvBTBAPnKy02fJwm+ezujccG8D7
	aPGUpDTI1zy98tG3OVR6faoM/IuLSj2r91GH5defb5uModhgY/ABErMSjth4ZPuc6i+wHPlM0Zq
	TC5Yu/vEBsA7I38Vsi/idg0pXuoThkNolFODG5SZhIl/DkANa6MR7tttQTdmT/Q1rAlmpOKgyLm
	6IbciYYPAF
X-Received: by 2002:a05:6a00:4fc8:b0:82f:48e:241c with SMTP id d2e1a72fcca58-83f33d8ba87mr3232423b3a.23.1778832732176;
        Fri, 15 May 2026 01:12:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc8:b0:82f:48e:241c with SMTP id d2e1a72fcca58-83f33d8ba87mr3232381b3a.23.1778832731457;
        Fri, 15 May 2026 01:12:11 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm6140924b3a.36.2026.05.15.01.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:12:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:11:56 +0800
Subject: [PATCH v3] arm64: dts: qcom: glymur: add coresight nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-add-coresight-nodes-for-glymur-v3-1-83ab39db275d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE3VBmoC/x3NQQrCMBBG4auUWTsQayPWq4iL0PmbDmgiMypK6
 d0NLr/Neys5TOF07lYyvNW1lobDrqNpSSWDVZqpD/0xxH3kJMJTNbjm5cmlCpznapxv3/vLeBj
 DEFMaIThRizwMs37+g8t12370p4EtcAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778832728; l=23494;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+US5GK2zSF29/9R04DPrQPBV72Xr1zYTDbnKgIy+dJ4=;
 b=L/LaUuK14hmaxX6uE0aBg/Jo5841cY8mk/XmKAq+lOy9376dGjfPTcIkTc6zzfJiFKArzwLz+
 Pso1yMQ8JJTAK/ur6L5IcIgfBRAzNxD/FllYO1plYAy9bofm3rW5wds
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: qtU0tSEfd4lDmyYSgITWs_-2SaJozoux
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06d55d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ym7NTek2rUbMElXwnXkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4MSBTYWx0ZWRfXxXKASSBl5gKn
 +aBNBBVTdlQHaIWaVB+a5ttf8qGq0gQPvI9HtcZIVXn6U7Cvw+QOERiSak6om2VSKHQ1It49RGl
 JjkAI4KHbBGCoy8uA5mkdKKB0L6h8Q2/fgShz4RUFNUgWI0PKb7EFvu0FNvjC94sboyg0eEBw71
 UPE4U85pv+UF9mDMgaKjjsxcKxnHnkgDMLaRqbccPN3QIsK3dfL8Sal28V2Pxqo0dKfxWAXzRJP
 evJIn8jZ6hqZ1mkHnOjPmv3z34MeJnr9MmsVtqq6SD2CyVGghPWLEEPMU9Jyg7nmyDveNEzoyVj
 0xG/KFddq/qAvgsvqQUrUhnfsiScfgJ94KQgglUhe7RkEdgo9QvbdmE0QYYORWIRccAAErUZVEE
 EvQBY6OViNrn22osixipD6qOge5MP7/qmEHV9ZVoWmcArs6ImmRglRz0n65fzHm00wGwatA44Yv
 ZbjpTES4y3u7nfVTX4g==
X-Proofpoint-ORIG-GUID: qtU0tSEfd4lDmyYSgITWs_-2SaJozoux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150081

Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
some small subsystems, such as GCC, IPCC, PMU and so on.

Delete cti_wpss DT node on Mahua since this device will cause NoC issue
on Mahua device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in V3:
1. Delete cti_wpss node in Mahua to prevent crash issue
Link to V2 - https://lore.kernel.org/all/20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com/

Changes in V2:
1. removed two cti devices due to GFX block is down
   - cti@11c42000
   - cti@11c4b000
2. changes two TPDM devices to static:
   - tpdm-cdsp-cmsr
   - tpdm-cdsp-cmsr2
Link to v1 - https://lore.kernel.org/all/20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1097 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi  |    1 +
 2 files changed, 1098 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..c7851f8d5483 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -341,6 +341,18 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	dummy-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&swao_rep_out1>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-glymur", "qcom,scm";
@@ -5501,6 +5513,1035 @@ rx-pins {
 			};
 		};
 
+		stm: stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					qdss_tpda_in1: endpoint {
+						remote-endpoint = <&spdm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					spdm_tpdm_out: endpoint {
+						remote-endpoint = <&qdss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel0_in6: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1102c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1102c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					gcc_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in36>;
+					};
+				};
+			};
+		};
+
+		tpdm@11180000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11180000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11185000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11185000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_dpm1_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11186000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11186000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_dpm2_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in6>;
+					};
+				};
+			};
+		};
+
+		tpda@11188000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11188000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					cdsp_tpda_in0: endpoint {
+						remote-endpoint = <&cdsp_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					cdsp_tpda_in1: endpoint {
+						remote-endpoint = <&cdsp_llm_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					cdsp_tpda_in2: endpoint {
+						remote-endpoint = <&cdsp_llm2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					cdsp_tpda_in3: endpoint {
+						remote-endpoint = <&cdsp_cmsr_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					cdsp_tpda_in4: endpoint {
+						remote-endpoint = <&cdsp_cmsr2_tpdm_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					cdsp_tpda_in5: endpoint {
+						remote-endpoint = <&cdsp_dpm1_tpdm_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					cdsp_tpda_in6: endpoint {
+						remote-endpoint = <&cdsp_dpm2_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					cdsp_tpda_out: endpoint {
+						remote-endpoint = <&cdsp_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11189000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11189000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					cdsp_funnel_in0: endpoint {
+						remote-endpoint = <&cdsp_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					cdsp_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in53>;
+					};
+				};
+			};
+		};
+
+		cti@11193000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x11193000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti_wpss: cti@111ab000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x111ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@111d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qm_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in35>;
+					};
+				};
+			};
+		};
+
+		tn@11200000  {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x11200000 0x0 0x4200>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					tn_ag_in6: endpoint {
+						remote-endpoint = <&mm_dsb_tpdm_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					tn_ag_in16: endpoint {
+						remote-endpoint = <&east_dsb_tpdm_out>;
+					};
+				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&west_dsb_tpdm_out>;
+					};
+				};
+
+				port@23 {
+					reg = <0x23>;
+
+					tn_ag_in35: endpoint {
+						remote-endpoint = <&qm_tpdm_out>;
+					};
+				};
+
+				port@24 {
+					reg = <0x24>;
+
+					tn_ag_in36: endpoint {
+						remote-endpoint = <&gcc_tpdm_out>;
+					};
+				};
+
+				port@32 {
+					reg = <0x32>;
+
+					tn_ag_in50: endpoint {
+						remote-endpoint = <&pcie_rscc_tpda_out>;
+					};
+				};
+
+				port@35 {
+					reg = <0x35>;
+
+					tn_ag_in53: endpoint {
+						remote-endpoint = <&cdsp_funnel_out>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					tn_ag_in63: endpoint {
+						remote-endpoint = <&center_dsb_tpdm_out>;
+					};
+				};
+
+				port@40 {
+					reg = <0x40>;
+
+					tn_ag_in64: endpoint {
+						remote-endpoint = <&ipcc_cmb_tpdm_out>;
+					};
+				};
+
+				port@41 {
+					reg = <0x41>;
+
+					tn_ag_in65: endpoint {
+						remote-endpoint = <&qrng_tpdm_out>;
+					};
+				};
+
+				port@42 {
+					reg = <0x42>;
+
+					tn_ag_in66: endpoint {
+						remote-endpoint = <&pmu_tpdm_out>;
+					};
+				};
+
+				port@43 {
+					reg = <0x43>;
+
+					tn_ag_in67: endpoint {
+						remote-endpoint = <&rdpm_west_cmb0_tpdm_out>;
+					};
+				};
+
+				port@44 {
+					reg = <0x44>;
+
+					tn_ag_in68: endpoint {
+						remote-endpoint = <&rdpm_west_cmb1_tpdm_out>;
+					};
+				};
+
+				port@45 {
+					reg = <0x45>;
+
+					tn_ag_in69: endpoint {
+						remote-endpoint = <&rdpm_west_cmb2_tpdm_out>;
+					};
+				};
+
+				port@4b {
+					reg = <0x4b>;
+
+					tn_ag_in75: endpoint {
+						remote-endpoint = <&south_dsb2_tpdm_out>;
+					};
+				};
+
+				port@52 {
+					reg = <0x52>;
+
+					tn_ag_in82: endpoint {
+						remote-endpoint = <&south_dsb_tpdm_out>;
+					};
+				};
+
+				port@53 {
+					reg = <0x53>;
+
+					tn_ag_in83: endpoint {
+						remote-endpoint = <&center_dsb1_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11207000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11207000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mm_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1120b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1120b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					east_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@11213000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11213000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					west_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in33>;
+					};
+				};
+			};
+		};
+
+		tpdm@11219000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11219000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					center_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in63>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ipcc_cmb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in64>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qrng_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in65>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					pmu_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in66>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb0_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in67>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb1_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in68>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb2_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in69>;
+					};
+				};
+			};
+		};
+
+		tpdm@11220000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11220000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					center_dsb1_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in83>;
+					};
+				};
+			};
+		};
+
+		tpdm@11224000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11224000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					south_dsb2_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in75>;
+					};
+				};
+			};
+		};
+
+		tpdm@11228000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11228000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					south_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in82>;
+					};
+				};
+			};
+		};
+
+		tpdm@11470000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11470000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					pcie_rscc_tpdm_out: endpoint {
+						remote-endpoint = <&pcie_rscc_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@11471000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11471000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					pcie_rscc_tpda_in0: endpoint {
+						remote-endpoint = <&pcie_rscc_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					pcie_rscc_tpda_out: endpoint {
+						remote-endpoint = <&tn_ag_in50>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c03000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio4_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@11c04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11c04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					aoss_funnel_in5: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					aoss_funnel_in6: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_funnel_out: endpoint {
+						remote-endpoint = <&etf0_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etf: tmc@11c05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x11c05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etf0_in: endpoint {
+						remote-endpoint = <&aoss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etf0_out: endpoint {
+						remote-endpoint = <&swao_rep_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11c06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11c06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint = <&etf0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					swao_rep_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpda@11c08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11c08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&swao_prio0_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&swao_prio1_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&swao_prio2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&swao_prio3_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&swao_prio4_tpdm_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					aoss_tpda_in5: endpoint {
+						remote-endpoint = <&swao_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio0_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio1_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio2_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio3_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in5>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",
@@ -7132,4 +8173,60 @@ gpuss-1-critical {
 			};
 		};
 	};
+
+	tpdm-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_llm_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_llm2_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in2>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-cmsr {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_cmsr_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in3>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-cmsr2 {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_cmsr2_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in4>;
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 990a02c6afc1..22822b6b2e8b 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd15;
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
+/delete-node/ &cti_wpss;
 /delete-node/ &thermal_aoss_6;
 /delete-node/ &thermal_aoss_7;
 /delete-node/ &thermal_cpu_2_0_0;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-add-coresight-nodes-for-glymur-49045aa9ede8

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

