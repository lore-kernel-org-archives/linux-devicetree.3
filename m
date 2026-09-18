Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3052435EEA
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725511; cv=none; b=DSCfynOIrUpT2y87JHg0zJxRN3S8J7DRqQRX0j8FaD5NiKxCJ1UzO7pye50azd4df5GN2ng8TZpnEPOT4flGcgOfTJcl8M5yXOj693esfIg7+dw3zLNMnPZarMOP2ZEyOFLoo1B2e0LXPE1MPEeYZt5bWIJIYtSLLVA0EBtBhQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725511; c=relaxed/simple;
	bh=thg+8b9iV4ShIOJd22mpbdVCfQsSk4c1tf9LZk+8W80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RhDka25owKzs81O70iB39gpuPqipF+durlpTJk/tOCdLJYdVDe9hj3EiJ9jbZdMptJnrfNb0h2zjyZDNxvoiLKL34jBPjDymaQmtsOS/b4RV9ThZIiVniuBDEEsRePXhm4VUU1lp27UWnch9txw70RTDHEuEEEIf7FRC43CiLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SapI4cAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTFzR5AL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SapI4cAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTFzR5AL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9diKR3153787
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MPqb3+URtlx
	zlWmzoe0vwUAXTbEeEEshu1TFHhySW1w=; b=SapI4cAbRRsm187yTYFDRzsGCC5
	0qNsF786NSovxp89rbrNOnYpeUriIATkQ2S54bXNk1g09hgfJOnGZA1zQ3ZBwd2p
	jwI+Lfj8i26DA6c6z6kc3Wn+GeBcU9P2cUWIfsIdvsNihrimyzjGEQY2v6jsUjyp
	EXWO0thLV5Ih7TgVF77dT1e3QzvoRyFq6haXSPDJjS3UUYtn7OY0FbQ8bhXrI5jN
	0XVRWw/qXndOuLk4wtigzF9im6AplgfC8YHeOLSpHvleRHRJVFbagZ4/JF+uR17A
	CMO30r1bLrhyZ6KIl42Yo8dR5hzpqoHK6GcL0ZgExCaA8qqzy8PvvqRD1Ug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttv9y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:58:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e2c22bd0eso169566a91.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725508; x=1790330308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPqb3+URtlxzlWmzoe0vwUAXTbEeEEshu1TFHhySW1w=;
        b=JTFzR5ALJsUd9aJ9lgEy951DrwXTZt3z8d2TzzBPP7KJA2CBt5ldrji3sbLmo9y7I3
         seK55UVlRlqBxChnZLrLGFia2uJmph9t8UKNoXWhXnRErveKrzsz1G/nBvxbCaJ5+uE9
         87F0eOGHhlzUC3LjiAzptSQWbG/f5FzhAf8V+vdplqs8k0ppAsFSMLNvnpc5gUA0Kcui
         bVSLR/3VBkUbI2NOqYMG2SuMF70cuvDu6uzEmjuH0tZZPS2whiIEdvK/eQouwiX7myy2
         hFMAfQD7kLIzozNUYDgAQWP5w1Qs+FIRXOmalAvEA/LkXzdSmkBO7/qVOlkgjQgwFghU
         pP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725508; x=1790330308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPqb3+URtlxzlWmzoe0vwUAXTbEeEEshu1TFHhySW1w=;
        b=MmcuDJg9VOpuMHjn4VPI/kVa4uzj4RgGauX9DCOxA9oT8EuR8cYsQbqide5t5j/LoE
         kJWZCafzphW7ipbfIXYb6QwVtmE6R60/ptJQWB0S5tcHmtFDqUZIXTKb/sPxbvRgBDir
         ZnUgU4UBuYskU0tlMNnakhiYMU6tWYZWeeUEAXeb0XsP9Ls7yIEYCl5hJpHPKhU4XQSq
         BGuQLZYQQfj9naxbH6kw/HpfGmC+KtcpPxcVz7C2h+M1YO7l7bYRtLXqaPESKpUG67tw
         dDRHn/ui0SgGAJ0Foj3jUxCkxjVAch0xRB3HWjjb1vMRsgB3cgZo1WygYdJ3rJZ3B7Hw
         cPEA==
X-Forwarded-Encrypted: i=1; AKwUvBwY33PdcBVfgKe+1IIgfxVoGFKUlCE6ZIA61b0M5W/1RmTGdE3x4/yggaWhwCHDZNbr4Kv2lVqfmT2L@vger.kernel.org
X-Gm-Message-State: AFuF++l4KlJw2ygpAj4ghdYNXxZTJqM+e30R7rI2ye3yHGIC2V4fvofX
	R7hA1CRbECT5wDUZ9i+VXIlJPGJwDDlH5AFXdu9zsaPZ6V+tUZGb5E2Nfn3kU+g6p/Zplqq0lUy
	Wi534VjGFvWlFEkI/9kYQQ87DRdvgEZqmItwoikY4ikgeV8HPCxDW9GCoFzldZq1w
X-Gm-Gg: AYBFou2ri6/n67aloCroflXgPJdvRjWyk6t7sYOFBhv0uNmUz/hEwbpF80IlnL7Lk3w
	PrH1vwKJjkqUFHEMR5jyZA2tyLi3T2Kuwa05s5LcEkdc5aP3QYZwLhLpdkUb4uTFNFZbf5fPc+D
	5qNa7BEknQqRIB3NEwsrm8dS8fEvZdDJiQ0axmzVB9KleQtCjMCThgynwTuhtL48R9XQfltVWZQ
	1Mu66wcIlQlB/05BjxlcoRSt8iCj3Y2Cof/0zTBCCcv921uC9xiALP+hR2oLu96MZkYPN72g1x7
	I1J4tMhWPWvm1X4wvd7gfQcyXf9g81FtEWgCcVK+QowM8tD/6BzT4VC6fUpsqgM+MCX/Mas7tSs
	2v5rzh3l/evFvMOmuJi5cUOmnz6AV8Ps=
X-Received: by 2002:a17:90b:54c4:b0:39d:f72e:e8df with SMTP id 98e67ed59e1d1-39e550bf2d4mr3674179a91.5.1789725508484;
        Fri, 18 Sep 2026 02:58:28 -0700 (PDT)
X-Received: by 2002:a17:90b:54c4:b0:39d:f72e:e8df with SMTP id 98e67ed59e1d1-39e550bf2d4mr3674146a91.5.1789725508030;
        Fri, 18 Sep 2026 02:58:28 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:27 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 4/5] arm64: dts: qcom: lemans: add RAS error source nodes
Date: Fri, 18 Sep 2026 15:27:45 +0530
Message-Id: <20260918095746.3347893-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
References: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfXwTTdQuTGXJ0H
 t1eTcadesR7U66zhlfhR5GtkGbWiyopyHlQ0ZnZSmlmJkDwWF0LiPxDZSnAc9iNzOgoD2mJE4OQ
 5hbcTtIGRD6DscROfrTmzFCIWQR5ncnHEYmTjij+uT3bxIVOMKjzaSD6BWAxjMt+Xc94+faUCYa
 f2qzsJjzjXojmyAmDn5CEWgneQwHxhwIBkNnLJgrf336XkXPgj826vK5Hky8qSJqfAf+5ToPL0c
 a6OiGsEgCiuNu5uQemNpzp1IZXiqqQNhw2nWQ/WIp1MOQlQ+068knyBk7Ue+AfxhQbzqkpQ7xHW
 VrbRCDLqBjrDm3+w7XAoUFTdH9C8hUaR9OckWlup1CuUr/zragrMI+xNJhlinUYHuxnAhESLrMV
 8V33PKv4aF3Gsr2uQ0FokMo6j/ac5BsvnuKrUvETqCWk86UlNMv2NkB+kteOyl98R5x10K6ejVe
 Zq4IkNWQ1E+eXbfUOag==
X-Proofpoint-ORIG-GUID: M7Moi9McBsS3kmrnuvHsArpQJ1BZjYT7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfXyR4jKS8kuYVi
 wqMAricTQYR1WtGI9SqlSqmYMbyyO9uIP2Rvn8J/0SBbcLncVhpFVmkFGbQp3iwEypzsP6EqNex
 QGnvMFsnPDuIJis6aLoLF2gMnvpgI3Y=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aad0b45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mXUMc8l5Aljk2L-ovw4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: M7Moi9McBsS3kmrnuvHsArpQJ1BZjYT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180137

ARM Reliability, Availability and Serviceability (RAS) enables
processor components(for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Lemans CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..dc4cbb6e3496 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,36 @@ clk_virt: interconnect-clk-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};

+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster0-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster1-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	mc_virt: interconnect-mc-virt {
 		compatible = "qcom,sa8775p-mc-virt";
 		#interconnect-cells = <2>;
--
2.34.1

