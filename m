Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BA449EDD
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913370; cv=none; b=G+7H749LwjP2sAFV9G+4jBlb4CfWsbRwL/aaATyBMsAa4CxsKbJl0WEUFb9EDSAkBhqt40sM8lPGuwaiT1qsITn8fWnOvW1WEGKzFuFOMAcBZtHM6DT0VgbhvCNf9G5nALl2iwTVHaQoVIikL4fds1QcpvtZGAzLoOCXQ3G89mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913370; c=relaxed/simple;
	bh=O7qiwaryPlXurWIjq/udwHQ+dZxQnDOzL079xltsr/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lml3yvzCs5bZZkIBNuWxB1uEsqgbujmVXrBSLL4uknjzgdsbIUErpZ/TnRAtIlBG9p8UzpnyXAeImvZNMAbryTbLseM6DLuLVMulNZW0zsH9cILIHAQk3AOPcLAcglAhNhE0vyBQC7bE7GUu2DnsEv7z3A5tC7QWOQR8rWGFHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KV/J8ps0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErVY3YTn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KV/J8ps0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErVY3YTn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqciE3537469
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=; b=KV/J8ps0zO4pQmgP
	zk23a7TOxo7tmzkoDTg1/val0c7mix7xoUD2t7dn3h6YH1as4RTWYxw+zABJ4c16
	Vb6rBmEazzxVnylduC3Gx0bLGRdUitIcOcopvNrGTLNRl7utw84IdXwraZOShobq
	OJPAOAbTNxXCzIJLSQDQauuWwF622rN40JgcGP13XZGA6cIGbzuRNiD+YVZatl90
	lYZK0P1HiqL0QceF7+8MACeQnrSxJaqEuxlQ178Fjp2FZZkCK0Te+SkQdU2pq2Ck
	Sf+pGSvW3+Vw1pJCpyFA3rFQMeoe2iaGfEFJMDS/AOAZCyHHWVTABMllXmTNC5Lp
	QBKuSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggyg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1322388a91.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784913368; x=1785518168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=;
        b=ErVY3YTneQqXyRRfadDnrKHoZSNyflGrGseBn7x9S3OGHLRO16xirZWDCXEoF18HHc
         mtsWKMh3l5UoyUK7J7n8Jw8Lhvdx1OjWNeOSDqGy7vUFsHMJBCjae/Kl79PyjACaI8Qs
         LZkeaOhV6qwKK/r4w1603LzipyKJ3NeDJ6WHdXH3JEqU5xXqMHYbtc+aTFHQPhUUYaLg
         0P4XeZTdyWLylm9ZDpw9D+dIImQAD1kDrJqZnRhLZhCSa6zqM1eDs9yTWDb6ToX81Zj+
         PnXAN+Vgm9W1qQAM54NUO3ftbqWc/tHMltw0zuoRsCaENveOjOqE6L0qb5ou6YUr9/hM
         L2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913368; x=1785518168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=;
        b=DU1EkBOlO79qxJAHeHJq/Jvn/l//rov/uNSDbcfLPx/Mp3pVlDd1yPOTJ29D/sfDOr
         cHEK2Ou1vRYeDTLwlKG8JE1QSPSTjcKMgtrEv2CsYXF9agtGNoWXI9gd2apLpj6T1tnb
         UKwM4FzYW1n8F0oZRfDgetS1RHp2G21x+gBmUC/DfyHk0YpBNG34QvSJV3AGgf92yVO0
         15TCtUo8D4KBiZ6B5Lxik75WE1MfqBjMHeRrp6WF9USfsLI/Xtrmug7UvuxLgmLN2Heh
         syoEoFRFHpT4pULJ6c1CEhqTKQZ77oppK+09+tH9oqrI5cMZhaQQUxqvvY5dUzFAyOlh
         dKMA==
X-Forwarded-Encrypted: i=1; AHgh+RrPs6P39mgjCORn2oUZVdFmzDQ0G+WNLb9scCCHwKQiFOET38YhFU68+3LoEk1uXehZkcTyfmDw24Xk@vger.kernel.org
X-Gm-Message-State: AOJu0YxUDW3iS4U/6Hizmw7+ODdbocNMr/2vGI/c9mlDufVwjksBqifz
	lWuiPcVYBMhTIYfXu53LqTDSC4+Ujm0vJxsQ+gVbXrqhatAol2Ko/1zx2vWyjG/qroBlhYvMeHo
	D6XsJZKzbkuJQaNQYSZx9sLeuXzKYRek1aa7yk2x72F5m53vYnZ+7pWRqNij7WH45
X-Gm-Gg: AR+sD13q5c90fUOSaHu7I2Qli0y2dVkyM2ZWS4aB1RLFWem+vDLHKBkyCqqCs5jrb6s
	tmlpxDby0JMK/nBsneVtdSrQcQ3eNCVcokgR6mQ+YLUU3Ziyv0ljkyJZCN3LI4ZXrarNJHtFzGB
	ImMOvdhZYRn10zh1huLIBIhs2UYaxq85OSfX9Pz9EOy17VzG3XxH438py454T0fs2BhVvYJ5b97
	2EGuqAzUVpD2qkPf0Ld4b4z7OExyJBwTK1lelhENgWemA2RH6gm9DopSmI1WG+mFsrjnGFL8W/E
	n+R3J92LQXm4LEaP+S1fXf245Zpx0YtxhO8Iu4w8tQZtnRysf+GDp7bO3zHNraIB4OlsUT3qpbs
	zIajViZJGvvxIZs8FhkUYbpKJjPZIyvo=
X-Received: by 2002:a17:90b:3f48:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38ec6877190mr8420964a91.31.1784913366981;
        Fri, 24 Jul 2026 10:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3f48:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38ec6877190mr8420909a91.31.1784913366470;
        Fri, 24 Jul 2026 10:16:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm8400892c88.3.2026.07.24.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:16:05 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 22:45:34 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-shikra-audiocorecc-v4-3-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
In-Reply-To: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX/A7d31FDo5Cw
 s+++zmcv9WIn+OPMkAjY52wOHMYACkxbgBC5oL0ERuE7hdZ08TF0Yd2o8v2t9T5g8HOJAQXzD1g
 w4q3nmCPTDzQyJd5R/moZe2//RBpwRbZTQDUx5POLtLqgLvaodtSldgDpo8tuTSuimDbe3w+cWz
 3petgPdta+Y6dQq8O9JpmwJ8XocOf0PFmQwHXes+BCXummvdfxlLC54d7blJdQ9mwqvhK7wobZc
 lCD47dcquPdjOslh8ANU554gGeUjaG6no3grvAEria61BtsRZmrMZohgSuDqlc7e2XMW93t0fqZ
 3stedBqMST/K9iw4mmzhn8m6GFZacPlFqeV4ABqd+2VmdzQTMzw7E8DN2f96TYAlTTmvhU7hqmt
 5/MFYtbn7tH0784+CtePs+ncAwlnFNVeZZMJO1nymC2PhEMWoX8pJlDFpLz9dUoUDV7gCVnDPpd
 B9XFhUAd54hDU/M7Fuw==
X-Proofpoint-GUID: _0jY59y4_j41W95_O3oR2acogiutoZpE
X-Proofpoint-ORIG-GUID: _0jY59y4_j41W95_O3oR2acogiutoZpE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfXyB0Ox0VJEmP+
 duW/IURLbVDIQrcOim4/nZO6Pfs+jjt4AlgOuCs8UfNOaz3FQUXylKJC/oUab+ZjK1htzBsKJ5Z
 YtQt81TSd/BwBDxjATqgNjxyGUIJlWQ=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a639dd8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240155

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b744534572d63349c4274ffbe5cacbb8fdb4197d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,22 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "reserved"; /* Owned by Modem firmware */
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

