Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EEE238D52
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877598; cv=none; b=bCHopGakqSxwP4cpzhcIBHl2p7beg441Bq5csECvK/AB0lHRjj+jVGi/N6bdLPAHPeJ8+ArMq0896TV5QcDDICLFyBQKe10Zkdn5ExSWSZS15aC77BmuFYUUbelUVCuA+wYUcOudYzJrsuiOFSeG/fhNaYtVflOjN68RsmcwV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877598; c=relaxed/simple;
	bh=ycsmfvlqxBke+6EPsPi1okcOI+xLUsBWzLMxClhNg9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUzSoA32C6/2o1kYMlSHpPPxnOyEuWyCgKkZ9IBiY913BtvhVsZ9jrIe3K/7RZqWpLZGsAfPbsVVd1VPDIcBINnaDoAtKJxbABviDBe9e8e0qi51FYUT7A+9sRuNnnkUozTedJJnuKvyZIxaRvmT6882qOwvKksGOFupfGpm0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibnSl3fQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCjK4vNq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibnSl3fQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCjK4vNq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4ljq73140400
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=; b=ibnSl3fQ7xJRrSyG
	YLY/8W30sAW0GSHBO5CozqId0PrY7Fc12xuu/pDxXf883QPibNCVAkcWIqAvehZS
	/pirbRllCg52XpYrpaimePc+7V8/yjFpOAw/LIe9iyNRawlE02fBBK2jnw4/ro8z
	vV5sptCBQsT4KOXgsxX0bhGHoK5SxMEzNi+aF2kk6KKQIJxsOCNsEZOwhFAVGZld
	OglNnU1akQlCYiYFvb61/CnStlljFkTjtJSqvMZhw/AJJYexbSQUG3uGbw8LZqGT
	oEzG+M1rY8+wuj5RLO3GqoDtEWBZ7DoQ/29d8sy20BCXS+JYLDPxv2TMgbbg8v+w
	kSEAgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a3b2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so3267925ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877595; x=1785482395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=;
        b=cCjK4vNqysEMUln/gC9gxIeLmXW8P4HCl+SKK+hpbMy0V80rjcG58Jp9fSuafFl8pv
         0KmgPmNN8aSx+CwJCAS8/uAwsAVzd+LZLqbe9rT4bw+MXG+pIgA49bd0PUbO4G7EytmO
         dJVWV9vGC5TkjrpCU9pek7T3W/ZWKFG0AbQTTEQgIlPUkpn7hUQ9WvC2tg+DsJWxB+nn
         NZBJfsYubOnucNqW7P4ujbroNq13J6l3S+pKNWp/APxODTfL97FqtE2XFWJjGNdV9tBg
         rWCJjJ0yTgTycA2R+Cqp5x9tkZ9DOt+CJXZC3Nyspb5KxAgNbN5A45x9egiAzthx6zD5
         NYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877595; x=1785482395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=;
        b=kzljQxJVardk9BKzLgEr/q3y2J5wUK0D5JJVFCS96456iaGNb8AO/mwlRURZvy9SEM
         OJEZVVerV48/iP2PfNZ1rdXO9/OEJHvticuqAMYGoIJS/oXveB96LOwOR0cWT2pbu1SF
         685FATyQQfoKYvYPZUGSZI736eO8ZZfZTIG4NHrTlnXT51H7YM8TovppG6sh8z170OHb
         zWRH+fJii8wJ2wA9FHoNSGUvfyaBGfRuHXhxHq5iubN8fzLYCFAszf+6HBW8Ga5ArOWI
         nlSrtEf1OkzkpGKg7hh1odM1eBzfnYWEM+ay112AmxH/fR8lGsy585ZgXUfGu1zYO9uk
         +Mpg==
X-Forwarded-Encrypted: i=1; AHgh+RqzGZkqVSDL4ozYOrgZJxaEk9FPQ1X84uWerT6yaWQtyaSYahChsmDXO+IFBjsgheF2jnnjhIXxOojZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyKj+8vYrQWg3PB6kNkZ2SqtRAErfj/X4AuiQwvM/19ehdQRYv/
	9a9jGSY62nkZuQvuR21ExX25LQLJm+xGB5gCVRce6zc7F89hRdt1H2H4O7qMKIdKn7u8axeD6Zu
	X15tvM31Mn4MvRNGGupn7u2NK53uklk8NZiPoJYBOy+8flwN8IX9FzflWxdjENQYP
X-Gm-Gg: AR+sD13Zy30CpGuTC6PI+XnC5UFg89eqwJNJMT0R6FbGX/0Z9YIh/jkqiPRPVWD3k01
	bAR1dyySwy2dTEVHBC8IY6bv6SeplEHiukQ/x0JPmoKJPjoMTSGhCOpWJNWMHygLjpPCVmMKxTX
	e5Dr/4+kyR/QgZxikHjbDxwYCA1feBXGzJRPkgX34E96ELISvyORysqI+bd/66O00DIngjy8mcC
	4oyrtMNVl3cIieB1y7OBvYpQOeu+OqZTh2cQbe32Iu8YqbKIOMX/DO/dFZse/ReK2jzE7yAEyWZ
	mqCJ2D7XNjM1nwQii2xrXRkcR/Dy24xbncMOOJbpO7KBPuXmsGq7na6E+wdJ7lGgI8XGB3Mn6q4
	WbXKcrttkAfr/Ehve02TaN9PJ2iBNULUo3JMVaO3Vf2bkGE0k4PK2LNICjF1Mt5U2ik/7DO9FgU
	Dij+GGwABRwk2EjFS7Q/CqEoXRTYM=
X-Received: by 2002:a17:903:1b10:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cfa7435a36mr71420905ad.14.1784877594721;
        Fri, 24 Jul 2026 00:19:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cfa7435a36mr71420595ad.14.1784877594276;
        Fri, 24 Jul 2026 00:19:54 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:54 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:15 +0530
Subject: [PATCH RFC 10/10] arm64: dts: qcom: kaanapali: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-10-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Jia Yang <jia.yang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2511;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=RRRnlY8bGZF+Ix/OI25BJOg4/PDL2F0fBt3FTJPUD4w=;
 b=Ot/2FakveQieb9FjNIaC8Eh8UzyqnPZIl04ZXlXEwPmL4WwfHv5BdmPf/4u/1sE4diECf+Fzi
 z+UeTkQi74gBMDWhyksq21XsTERa3lzeFSsIje9jS5gJrlPZEsxfqRp
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX5Jd1FELRhwSl
 SPllq6eDHat2Jn9463kZGwih3WaPVcpEIteDiYEYyd/IorKYmv+pzaGcqjs6NjtLwe0fracX7LX
 eZjiG1pxX/nbKpOMX0ZSMNzUg5m6/Af8G12T3u7iT3eAnrzeXv+CcB6jiQxi2eDYQvYoXZZIHf4
 h3dCr6VnfsQBuu5S2LwxKcArKkDKBJsF2sKt2rfVjOdG26LBQ79X6dqIoqtiwfm8tr0noU6gWFE
 R6gVgKpfsaCtB8Mf+PP+oCdjXlcP2wZqA3tZUq16Smtmkgo0ZB3C+ULdxzBI80pnmjvSwQfXUYa
 zfYm7qTafyLIeL4MofRTE3+TkEIIDCUsbmddGRkoHD6kc2d6lu6gzulyq8hXmrOnEDI03/xgHNY
 xVobmkypb17t9sSEEuZkYhFFjTrgsBp2buusYZmt8ZYA7w5kfSMqb77MCRqh+QN1WZq1/yWcSEe
 +gGlWHNnxLTAE6RwV+g==
X-Proofpoint-ORIG-GUID: L5O6Yd1hGPD7B1J5SHCtmUw_z3F1WUOz
X-Proofpoint-GUID: L5O6Yd1hGPD7B1J5SHCtmUw_z3F1WUOz
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a63121b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXwWQpWtl5gvES
 iHcwxPCBfF//gPjTrYBtEv4pcte5a7cmIY5a53IZPzaZ6aTajtUYAzYPPRiRywiwlTqPfxp8XMc
 tvFSiZXkOjbsmmLLwGsv+5zPVTCm+Kk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Jia Yang <jia.yang@oss.qualcomm.com>

On Qualcomm Kaanapali SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the CPUCP mailbox, the SCMI shared-memory regions and the
CPUCP SCMI instance (scmi-1) with the Qualcomm vendor protocol@80
required for the QCOM SCMI Generic Extension protocol to probe and get
functional bus DVFS on Kaanapali.

Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 74699bc3eadb..594fac6d27bc 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -240,6 +240,20 @@ scmi_perf: protocol@13 {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		cpucp_scmi: scmi-1 {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -5756,6 +5770,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,kaanapali-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0x0 0x8000>, <0x0 0x18830000 0x0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -5965,6 +5986,26 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		cpucp_sram: sram@1d838000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x1d838000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x1d838000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.34.1

