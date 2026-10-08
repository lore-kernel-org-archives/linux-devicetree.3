Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81434C98C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442105; cv=none; b=aSJVChfsS15jjTiaQYaJD9uXfUwYGDmjhH5blq3xW24phYWJLE9BWYbXkWPAIKR/I8JPIVoZLI0sxtd96RMeqprlNA75g5MnD/KapLt7RUSKLoWWE5XORgMV+FL2aK7jVwdN5pn5xT0Vup7NUEMZhSBrORTu2P9kMjDrj27cpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442105; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqaeJ11DKnIZz9gm7H6pm/egoLBGUEWvtfDcp3f0lpgbDQzE/in4wjbVeZmBJrwfrwoV8LJ0Si5fRqpHlIRaL2ILnu38JFsQcAJ1KpbiZBKpwUjlmlLBzayt2OQ1ch6vqqyzCVcPpyFlorx8TqydzPgxqeUseMa7xtcp3vxXdY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkJ22DvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hId1DPhh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkJ22DvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hId1DPhh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bj061654523
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=JkJ22DvO8oYEI9db
	0B+z8dGhLGpInzRKRkSHIF3hcNwLqKjhtfCw0Gwqv/4bnorvEkS5gWqqjNOKXeAD
	MredqkqKwcSXc1hmp2jqMTkRRB8WQkw4a4S5RgUY4M14LTqXBzvh3m1eUiKNIO5r
	hkR51OaFpAq9qp8x1pHtcIG+Ovl5mKpyyUllWCLvkQoHtAWihXTBh2AvaChmBjDx
	p2tj4mrZ+n5p9eHgtk+dtFhTa1F4rQ4johJyQPKrkcw6TAPBKsXgmbWJGvw0b24n
	fQw/FZm4WTb6Owbdr+wXkdSFGY67GNwih5WGiumbkPjynC0ALe8Z+XFVzf9WPlcO
	uhslNQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hhdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:48:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0869f3578so1423920a12.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442101; x=1792046901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=hId1DPhh2bcOvwEN5crABCmvmyt3lUbh8OiPtSo1qFwdWJO7Cl6orrXSLfr5pwa51x
         03vOajI4LsMLsHswpLI2LITUYVdhdaOotbUeqJ3Yxs5TVuhTtcD0xFifJgjL3DM46Kbw
         sPaAO8+XGgA1xx1Uwl1rSXptXwrq6w53dkfLHf9VDcIJTRIWkWIwZC7aUoRQtmhkwDJ8
         8ufxa752xjmAGmjnw5TDRLk9YD6JFFiTHk/P61J9iAYGuT007obug4FV42mi3exFpbOt
         3Eoo6dzC/Y9CRS0PgFV97h15ig0iSrlGEAYfcruV/xJFMlLiIH8RcS3W295OWPAy/lca
         sYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442101; x=1792046901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=Dc1sBiJLUf3laH/pj76vjOXayY1OIYZWJ5RFhrEptNhu8PTL4gQTqqQKf4iAmUVSbh
         yKDS6rNChM7OpYxTkprv0OBy2oBqnxtnu+tVgVGHvKHL/eBsfhbFvRIs1uv1rf+NCABi
         HqzURj9brN8jx4wucdTK89gmjhn868zD/KR4t1X9k6RFF/q7xL49i00MBMUbQlGlSEJy
         3gLk5DPNr191SwTMZmfY9e3qDj649XqlLkB2dsjAitbGAOok1gOzQZbTuILEt6sKcdj0
         aI4P8eAl56eT2XldtlmI5c0HBs0H37mbztA2dHbwRkVr7AYhcD+GEc7xiAe7A/ICwox0
         HYyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB+sakUkabzFn3Cmi1rG+OUgo36CFXyTRiTymRBGHh6ru07olHZm3YTqYw6z/VgySksWDesdF7i8gl@vger.kernel.org
X-Gm-Message-State: AFq9FYLHhNMemIQIVcKpKeDkrmPkJ2hDVT4yTVAfoRtB1m6okg76j+TD
	Lqiz9UVFFHLeIWg2X2M5jXE5yf5D08TE5hXc+cFuOsSG88SQVrWhIqtndePgwuc1KxU9GG0D6aB
	sAjOwzUknYdpCTR1D28C2SyBQPtBZs1g6/eGC0Lzv2tar8oyQraxXtQA1cZ8H6O8l
X-Gm-Gg: AYBFou2SktsfM1nabwCwl/l+YGZ6NeJzqscqAki+yRFJgvxPSKN1z7sN8Td1M8QiMrV
	HP1HWsmNCloR/kaQeOAsPJ82O+FDYbKSM8uVuWk6DfZZ4YD3BPIP2qY1q1xlieJCnuPRtq+Amea
	EkmgReRdJOJNioAibAT4pN5HivcuZjOKAk75Q31Tt2koKfEw8dBXHq3BQ6QCBLId1CZPAeWUKHw
	zzRh1zi4s45coue849lCbgWZeClTXUwhz83d6PZEhh/4jr8xD1duByh/BwvySZdWrqqxquDzAjx
	ujmuWCEooqcBBzgy19gSWEMOHaAvFy/VU+FigP0fn68zi44YPf+GANs/y31+z0V1d0pzrKzVtt5
	BYyLIiGaSNbXyVOtcxcgBgNsLX20+FXFzHqlFdKvNVtdeB5SsbU84V0w=
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612836a91.49.1791442101182;
        Wed, 07 Oct 2026 23:48:21 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612810a91.49.1791442100559;
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:17 +0800
Subject: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442027; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=jIgf60idSKurGrTwCMA9BKGAUgriAqwNO8PbOAveqoTDDZq6G4MsKu4HZfnyczcUiu9e6p/BR
 wz4yxrP/o4uAotz7CeHcNhJZpBpJj0web8KHZ7xhaaTIlilAP1GYCON
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac73cb6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX8QI3YgmppGmi
 Y5R+GP/E9E7S4f41OZIZxfYqxIKzwR6374mw8LMUoR2+IpXqRmz7Xb0Hang/Yum0CFYBs+yk3Jk
 62lLKcrv3Ojtr1DdzSscir+AJ1TlWec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX80eKuY7Yxf6U
 QsARuHTnOVHj3p0u3JbFxtJUS8j4b1wbxFNkmHdOr6Yb0RDYf1ZnlIOcvZi6hjp4x3J0oN5X9Re
 1cWe8kTp0SSINmK+PPs6dSiorHlHyaKHbp+Q2m6QcH0kV3dDji6s/iPYHtPceZwZe8z9/RKlKFL
 MJO3/v8DBKd0EudqV4aHxxwIB4oS6ktxaaUJpRO0n7FE2aAC9hDytPodsMwX8PasfQJs/bmPJN7
 qtw8boHv4KUaFwv/poaWnpVLO8ZS7uYeidADSqAUmMRNHzMpUD/Upb7aFNftP8mE9raQfyUSlem
 4W0KpCMr+BXbs6+RPR90+46la57NZmj4cUZfdMT0v3r5YapLuPDVswcn/22Iy//Z1tIfzPbFIxa
 moNgQO35CBzEgi0F9qmma3LhJnoFoeu+Dbvm9fXhVgrVdYTPePlYmuuwuV5+ouhcyULIJT0xftX
 JNJQUaFQ5JcxSos5tFg==
X-Proofpoint-ORIG-GUID: M1JlSkFIL20SIHAtBa_MJbaNdnZzIbVF
X-Proofpoint-GUID: M1JlSkFIL20SIHAtBa_MJbaNdnZzIbVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

