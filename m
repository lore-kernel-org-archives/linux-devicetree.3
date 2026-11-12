Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487913;
	b=VyoMt6jolPveGoGobCCD/CY5vdG5+4s5AXjZDBHzWO2iS5GFRUbkVCsbnB3/SU7xug/B
	 T3gOB8dWDG1yNUuHQnelkMooDdK4iai2v5hsU3Srbuwos98b+UTm/f67nAHQ4HDcD0w9v
	 fDGjZvEGRpXj18X6V2cffUYClUySgITf/0pJ9m+4ObFCSunr2XURvdxYWnlDOKB3nEixv
	 83e/oH/2EF4aRm8fPSYvGwrrYinyJvsjuF+pfrgsdwO8eJqNv2DmpvQFxZQF4Hc7u9Gv+
	 xFivRKomQyA44E8nbSkBFPjI3d0+EShHowa9V82kEPLvc+ook1llxN+YEpXWqHucDWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=;
	b=QEK4YdFmlMgcq0rBwBlD+G1mRTpD41a6SWUznkEUDbnrJoqrsp80dtE2HFl2J/8FGZD4
	 DcEpFCgwF8KWvT3v/XeASx+UnQ1B5E8KCPEYfKK+47sEYWbCikb5QP3pOXTolO7pYjjnL
	 nGGHgDCjX7MAa0ngFWuaejb6QBcBDIuMKAZ7RT/eB3agifkSOZnd7Dnbu65Gzdj9lui2m
	 0a4/aB54rNfxCbetSw4Ke+65ceQm6ahCr3shm2+hE7t2m8zGCawEQYNRyOElmOWkJa/eP
	 0J9tfMnYHYPKXe59qFBLs1jG5imdFU2rYb4OOMFUywZe3/j033Vba35nTfSr1qor6iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VbRs5i+1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmFryWxt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A6A606A331
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A6A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VbRs5i+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmFryWxt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iqN7125791
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=; b=VbRs5i+1+/PtZ9UA
	E4uuAhmEG7XRPSBXVxphmO9LZEF86BXyAACeumnvnU+2S47/gjdwPTaTI7ohSV+A
	5OAXUJmog0c+ULJBs4SKDeyMuZFkZd+bwxtrgRFqIkXp7oZD7wPCUrOw3136k2gS
	mdN4Qa5xvJZZgl/zFOZ+X1FdK37wh812F2JK8JIgUSLPsimpcOHzUBZgJPLou0lg
	Bf65oSOEkEp9QgH9SEN6mm8qutVbW3yU28b8jimwtVErGmJdugurqcHAAOfdezxj
	JOH4bhADL9e2gDRLh5cqXMPF4nqsgCTSIjWnku9OExQvCK0I8Z8T9jBav6TIXJYG
	HbU28A==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a092fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-843cf077bf7so5180621a34.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487911; x=1795092711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=;
        b=KmFryWxt0ppgR9ha5R9psCo19GZT94mu1GCpaRj+YrbWVazIvU+M+KSyXeUKiNko1W
         wejQtE4bC4Rlpr5zhG1UI2heEP7Hgh8HFFFdEu4qsM51soaDGwUgPjsXfvJQ0zDyRLCl
         ZwkNEuOT25HuPAQAYsFiRf2R4knq5ceSF8QyRvLvp715jjABjBWd6BbFzzoUCAALHYB3
         F/StiNWj7vlh03WlPRu3cAjA1LuK1aMGenAaM3vzZxsen0HOOQyNtS8OfJ/bbs3LJEuE
         /ENcsmF5qDKzUKCEKIesrZBEtLJo3SbpqVp/oz8S3GxrKqIreYeVZoI6CbMUCCt9abye
         Romw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487911; x=1795092711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=;
        b=n7swJQKnyjUBUzZ4x8bGbQzllBhFwABJZTPRyiTDIPQRCSqUX+2psbuxLyTDFNnc4S
         k5hGi93yKKSlo2dyUENzcJccdaZCiY3DNFmf+i815jP0kdwyHCwkrcz6B/aHEdHHkNlw
         Hp9KhLMe+ul7Pd9TMRch/2u7VJmeMSgkNo8N3mntvmuXG7wM5NR97A44OqF3/zUoqHY2
         E+4ohPwDWQYTYqQ+n/7D7EWaaSZhz2O/0hRlwoj7N6ZmkCO8hzaN/hXs7AdrVUYApGX0
         JryAZ1YcZ+VsliJmYE2d1VU7ZzBUXPBGBpBICB13+oxBdQ/5gseEfmTbuTbRmWXicTq+
         8NtA==
X-Forwarded-Encrypted: i=1; AL+hErEevCrUwh6MAvI2lR1rXauqLAhuhC7zyfHTTK5dqc1t7Po7v/spHSIbsgzptFvfrnSkrXnugaa2wAws@vger.kernel.org
X-Gm-Message-State: APuU4Z8gwhEDm1aI9NEEUY0vmpAYdMxcvivISLnhO3DPSMOMUXOlmrN2
	RzmJ7skG+MspDdvKAiZoC/ew1Y2+GnkDUNsM6AO0OEIgSHEOsolhCborvizqIy5a9lfwkQAoLOB
	51QZ66bcgfJnEzwdHNNwU8EtDlpTwpYvSeeIbEqLOY0SUSfF3FtB5tAkS2UioyU6g
X-Gm-Gg: AYBFou3IOe8MVXkmfmn3DUI8ML8V5Ju61xLUim5C65vHoi6LAfF79D1kgPOitLLzkuL
	QNxlh7gkAOLZgmBnnh2Dyma4EbLFCmkulQ2v3PCypVa8kfTQCsOw805bCcRYDrWPflZA50dw+Ce
	nVu6p5xOQjVRl4skMQ3shbV4s4WFAs/O8aZoY8vNDWVFlOIHNKSmCV3Xynti0AxgLBdF8tIgZeW
	thAuZJGnFOKuQlJxCbjaz+rNSHn3oZnm3vS89FpdIuR0SobLVcEjjZ5gj7wFlF+Tbjo1s9HBuQR
	1r7utk+iRolrK5M6ZNVgIXCi+iWONAt01jf/CLoCwUeIrGMpjTD9TuHsIkQ3mr7W8ZWrvNwhcvh
	CJlWYAOHfcaRWT+c+L0OuvvJggVYfHzf3SDyxpRRToDKlCOpACmXiKJvaCpvDu5xfyKs88yqz4Q
	0mjHYkfw==
X-Received: by 2002:a05:6830:906:b0:80c:d34f:5f5e with SMTP id 46e09a7af769-860f292723cmr7032490a34.23.1794487910663;
        Thu, 12 Nov 2026 04:51:50 -0800 (PST)
X-Received: by 2002:a05:6830:906:b0:80c:d34f:5f5e with SMTP id 46e09a7af769-860f292723cmr7032459a34.23.1794487910241;
        Thu, 12 Nov 2026 04:51:50 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:49 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:21:08 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-shikra_qce_fix-v2-2-2ce112cc2ccf@oss.qualcomm.com>
References: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
In-Reply-To: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: e_gfcEeamejkFt4hKgOS3-WLhKreUbL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX+hGzrZkCnwT6
 LlmZSOK17OrCCLcNzLkLSzfQJlKDurCD3UfvldQN+Y9xy+rCkaRFEhoewzsX44y7rWvbA+RR6y2
 GdejuBvc641strwotfWM/8PGQZUkcmk4JN8MdFvUyJgO8smwfye/8Zjqqp8Qh6j3r4BhFu2ZNX7
 0rTcNToMNHzWW+ldvDJBWpB1ty78qlNVB5QYjPczuqSvHJJHJTbAzVNBI7vJhCRei9731QMDjCT
 4j9tCmNhQnLzmDBtUPwyqleVmkNHXrF0Ce9iAxGc5Rq/cDTjTGYbjvNlLJAJuYYOe3yTgTMvTxm
 jmYnzNjxnVRDqCjt7EfpJ11grATybpTPOOj/fC+mu4znae01DUtCTOaqnMNUSdz6DWqfgS93zUS
 /ihx+b4mIkKTpiVBXQ9Bd/mitVBK4uGeR98gX3vUy2LEHVBRtOZp0RblvImm492Z03VT1uuuMaa
 8r4tFOHXKnfymUZVtaA==
X-Proofpoint-ORIG-GUID: e_gfcEeamejkFt4hKgOS3-WLhKreUbL7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX2hMmlPXVhrbU
 0cNMcV3I3yXryAqIAupbZlIqhXQD2v5T2ORRlX4y0Tw0Xd3sHfRubItcKF06z8mHJ3xp+hnUUBV
 SYrV3MQuYgIDqEFL5KEkNucesQC7NH4=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5b667 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nsAWE0-7qdAvx2JcIW4A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Add core clock and adjust fallback compatible to
match updated binding description.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d5f0ef863173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1219,9 +1219,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

