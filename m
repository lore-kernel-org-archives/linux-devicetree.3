Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA5402B8C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756435; cv=none; b=UguSYQIMib2hOrIyd4YTYsSjHkp6NjSUGiE/V3aD4rY9Q3ZfhTq3UA5IGk5ESliSw3PjM72EK9J1abocFAfgbpqo3zdgytBBAQ7fnSMEtTEd93Uq3HbeywbJCc3qvIMm98koaLDQgCEY/kVyk4AnHUC/iQejLS6/szLxuUyA7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756435; c=relaxed/simple;
	bh=MAGtAwoZZ9/KBD7dfnxmL/0ZbK1M297G9aRHzJ6B+1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7cAXKt4/b0TEzCdsqJ8XvHmgvTuUS9bRHQYOjNfNK3cBaWY8GXwltX53XQSN4PsSmQMIsexIcTKCxIJxElaGfg2O8etFNnkcdmrXI8ypZ+ZikpsLzbMUzP0QY/QPPU7OHsN+hkSOw87DUHjz12kfPRvifJu8lfPwMIp+2xyeDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ks1fbyx/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gp6+BtrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ks1fbyx/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gp6+BtrY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673ALcnH3883454
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 11:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0zi8v7YJXcqF3J00o+I1vc21/xnxZ/VIetcLEzZqpQ=; b=ks1fbyx/+dCzNfrE
	wsFmfE6uXVwhx15kn4tODQMaS0V4joN9f/0j4xYSZaQm7iNfxS3rvLahFv7KAMoN
	hZRmZ4TammC/x/fulF7d8PTddUnR5SqWJt2+BJljUu14UuQ1qCAEzC0LwyR+oQLe
	C+3UdKLKMm3axWPSYbdp7c4x8ObRe2cQfzQdbXuFqViXtXPvX7axMJC0c/zn9ION
	dkhKCBbZULAcQVS/fMw4ycAiGULdnpq6UYxj4PR3gaCMFdLzYOe5TEarIQ+pNvrU
	B7FBosvXPi9XKED2pZwGUGQHbV4b9xRZlv6Z1tSaYkJR8yJikcjKTQ5BHV4zA+Aq
	qYSHaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkha4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:27:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3801279a91.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756432; x=1786361232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0zi8v7YJXcqF3J00o+I1vc21/xnxZ/VIetcLEzZqpQ=;
        b=Gp6+BtrYA4roI3btDd3k5IW3L5FvKAgvep7keefLhFUA6pIvCWyr/Rn+7bvwS0q/yk
         PaT06f8cu3MCOaIB13rnBJjXKlr9T5e0d2Oo6WrKS7y9tvXgl+/WjT7Br60REN+jva/l
         jtgYZlZgQsBtpwY0LEPn2cQ91tnrB9ZVGV8RPD9SxDmbgwzvBYh2Ujtxi6OQNevoSYul
         9pKxsIu1HLxSyQ6CDRocOC6liBy1XmVT1+kKh1628vy2nMyuNgyhFATztOP13HMbnP8g
         Dbl1NKvb/LcrgkxbVk9rGa+qKKl6PtqvBJfzAwuBV5k0leL212CSOTLWvIq9pVZl6PDZ
         6aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756432; x=1786361232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0zi8v7YJXcqF3J00o+I1vc21/xnxZ/VIetcLEzZqpQ=;
        b=seg1AqaKUPX37T1D3DuiQ1Ww2Gz4t1uharxhCw55StUHsmZoS6O7lklH2aSZrELXnE
         bxsY2Keq0Vez75FfGHux2jrman0M+wwcqgwWXY7F0iyo5L3cPXf4T38iytuJHlbdAY9V
         Oprh7rNIkQNrfvxrInpg9mmZDSuODqpiI4MLijnqO4NeI1EnWYJc0JKh7TWVfDTNh+Yp
         MuWGLE9GDjBgtxoQ3wqh5qvV13RtiinsnrmkzquVooVGtqEekH+dl0EytmTEao0WNn3i
         mVWHK2ii0GSg+I8SrrT+2YHlVur5dDX2x9czv5hARA5dnp6xGnbQALS8JCE6CzncSuHj
         bmVg==
X-Forwarded-Encrypted: i=1; AHgh+Rppn6yGfMdoFtNMZC0G8MK+Z4DM2eeMvf1T4294FaHEb4jo+PcDdDoQoot/SQdyAT4GaO+SWaNYbWgc@vger.kernel.org
X-Gm-Message-State: AOJu0YzmAiUeUrRJpizAF2mC0DdKvfDq82agdgucHW4q2HmLt9hVzB3g
	ukcE0JPR8jnI73J8cjM3t+JhnoSs8NnbJLttjOd6AzJNWxJQGkWtTQyNMrMECITVls33l6kgwLs
	crF/B9sJsd8ic21TsAsucTwA0RxK9WBIkBVGBx3ammzU4R/6QKwq2id7gN7gk+hmu
X-Gm-Gg: AR+sD13Yu++MFYna/2Fdu9+NcNWWrGK7RJGLL51EvfoqY05bkRRFzgBf61CjXNFpSak
	p3rNbvCTCOjl++lYhCljyrFtB0kEWs4kQnnm54UtGOIW7NOwMUHMW4A50Y0jZKeC3pD+8z19tHY
	/E+aO6z8h80cLlsroV+fQNjfCtfjXSnlf5E76aVRtkSPSs/+CqCaV8krWu1m+hiYHCeCT7K3m6c
	f7zkv+q8MNe367Qh6pRg55TCsoQgLJh6pzGDScqiSW3d0of/gsXgmVEj8W2jlFiPv89qUTqpncl
	2OETn5cqlcBzrP79HUfpEFtbIwoCdyQXjdpt6VIYT/Q8crYDBse9GV5PORSEO5qj8FmNNxe2O8O
	0oNjPhB0JIfeC5qw=
X-Received: by 2002:a05:6a21:2983:b0:3c3:9746:1fcb with SMTP id adf61e73a8af0-3c92a9c6876mr8928811637.35.1785756431656;
        Mon, 03 Aug 2026 04:27:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:3c3:9746:1fcb with SMTP id adf61e73a8af0-3c92a9c6876mr8928785637.35.1785756431274;
        Mon, 03 Aug 2026 04:27:11 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:33 +0530
Subject: [PATCH RESEND v7 04/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-4-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=2339;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wsUZeqt951ofrDfp9W/f0uYqYOBAK+l5bMH2XcMmkiQ=;
 b=jSzOUUwI/NkoFp0af3SSttmsh2hIXluC6ewwA54KkTKhWrk6BHB93N6gpPzBuF66QNlm6zW1e
 KElyqPbO+lkCiRs7bXlZfip8PI9HyIrGIyV+4btvwzt9m3FyM+jm5h6
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: JMoF0sA7ystiatRKC8ULvyIg1nn3s3uv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX2eSnPpus4JA2
 pEo4zI6SddL1YRPkvaPwlHR38wovJG5ijix25CJ0nc9GdzuaCtFOb6QpzUv4X7Evu4piJoUFnyJ
 CdbNTVHxw1X1IVT7F3B8BY6QPi0r1VM4aTQrhRUcgDXcMlzeJ1d39223bIdvejBj1npzqyhpWNT
 mNX//QFFnifmDq9Se7DPeosXjs27r4eyeAU+GemtoQD/W27GYJHC2Ls1cla+xHR6+SyritZFWg8
 aTAjKUwtP4yOyCoqPpZQQXiE1LMOVFEIpWyHZUMW+PQuz+259inQ7HYbH1imiKW0ya328Pgsiqc
 GkcnMYVEQhZEPYZ0Z9ZD5DsfKVo41e5rYY1xrzIEhKznhOxxP3ahBO2eR7DunULzakGH2XFJA71
 BXCrHUGOnv8mawWvBQbXMnGww7xQqsVroNOoX/MdA+gtTlDj+D2wKdBoQBAXuVaW/t+Ls0Rg5kB
 6uFSzLz7BdTJHr2aYQA==
X-Proofpoint-ORIG-GUID: JMoF0sA7ystiatRKC8ULvyIg1nn3s3uv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX2AlBZcbVtGNP
 W2emPm6YuN1SXKL6EiCpJu0x6WKBX/lELW0wkOlTOtwvhdygwpBbn3NNxc92O3ps1Pl8Ktwa5wt
 PTM4ep9NM2fBStWPj22GqXtyaxXrUy4=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a707b10 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030102

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a01e26d9ee6d..42a17ffc040f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -428,6 +428,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

