Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37113905E4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415400; cv=none; b=L9cWgx+EglTylUpB+F9hyGR2wVveW3MBhLmVuXb4YLXvlY45rEbbPrAqBA9nwglWdzQ0CE/rcSLJCbjHrOmIWxEVsHVknyLGCBN6I+0h6HqIxIePJlcMr+xZPi1YeE0UJ4RUCYdVNknPN16Uwk/cjMWnhfYOSCRhzMdWMajeXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415400; c=relaxed/simple;
	bh=/Mt1ZVMxcVAHm03erAsxjaKR2bufRmN8oCEQ0sOATqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=if4ICk5cEDV5Gciay44umv0uoE+C9fAJRDyUdJFLsGOG659TBuujhD9tGz4cXntkzaZUKenxjLdtDTpA0JkY+QQqojD45wgbaP26+Iuox8rVu3YrJX7oWmMNgBwpOKsXpZdBaXaqKzdJSECwbE+8l5defT7YzsxlEOz9vStcaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYN0mCQ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b95CJ/aV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYN0mCQ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b95CJ/aV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dk103138642
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=; b=RYN0mCQ3Pb6m5jTw
	XDmivWKvVyy5pgTHzV+Sw5a3chhYQ+3N6g6kniK1U9zHZ7wYKY1PN6IiCU1ZYviS
	caa25KcRKwgjSWDss3cncH+40XvO+zuyxlF4ZLiLnCv0K0VaXbGErQzvx98gaijy
	JEFX8M03+qA2BZoKeCO7eFAEEqhQ1oFDXfk9faZkHR19pXoDJdAE7QFP//BvcTn2
	D0hLoIB+wse2iBywe1ntfOM18K/aV5rpuCv7+LTx6c3BZzU/t6P/g/+x30YJkUTE
	vlu0Kn7AAjJiN7Ypm5+6NK3TPhIHLu8s2a6JUHh2zFSDomB4PAksADqI69+kts3m
	oyIw4Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1595tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:09:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so4859326b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415397; x=1784020197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=;
        b=b95CJ/aVV2ZNesJA9wepojzFJgy3QuJjajg8KFgvf/7RwUvx/x2581ZVEnZCeWMt7U
         qb92FKuARLEGjzKNlsaUrhNCJO8ZRI2krpErSCbJ8Oz4GALcbBstM9u8Y2zcBIfkdpbw
         I5YDpHvW8XpReD9FFxgqrTZRuiCMg6zGbrHRXZC1AB3Ir4m9bPl7kUJnPfPDpUL1z+12
         VY+0UkmzNJmeCFHxxD9zhy+SM5vKo8Ww81A4JiUQdDMlefFBmvjaCFzvjem1DW4GEe/a
         pMBxQha5GXJHmPw/sHVd3FAwmUtlyxghdPKvV5mOFMvXfqImvFDsc40KYincnmv5AcM/
         XqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415397; x=1784020197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=;
        b=XszIqJKTkCe33gyQd4/YB8fmdL7wk2XKFp2tTOhtegWIENFK8ThxwtuM8DjrCzxywt
         sFJWpTUvdvEAKbIgl2sUyb1bkW96osUeUavlCBxMVHz8eCjycmvbdVm9BBVooEzkSwID
         QKaXt22ppsD440dmj8UpUrtKZvNEUqL6N/U1LgXBNzQQO07L4QLikgz+TPm8B4jAeGNT
         CJ5/fU5LPducHmLXDi2caaH/6VHvEbvncE886STqrzjsc2uY+FUgUZpl+4L97ZUN+jkf
         LxqTifVqLqT1BTTQx8IxZdbzTBo0e8H21ZyXI3GKZqrhHavhlUyzyg7QMhU+GZIyjNlz
         OiUA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr/3EmqPCXJES2M+4vmhLxQRP62DqPOzV1Qm7RDgxPOet/P4SrIJYGwV97VS/sTDsLzEI9f1UxJB7b@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/Uq2bnWUUwkNFgDOjR+3s2VWNtkmXHbSMDoCi53u6Bpw6WkK
	S5xEaCEEEQ+hha8udLKB/41ovgKA+nBWVH6v/ye8DP5WlHM2isrfEr9VfDVEr7A2UGLwyU9viHH
	0W1rMOHbcl56ChDEbDJ+4SUrGAru/BFKgLzI5StqUWHtoXJUHXQT2cYWXRqM6RCew
X-Gm-Gg: AfdE7cnPlZ53Rl80u1Whvur5ODcWGscgFWtPokkTa7b1iXeAj2cXdEgtwHKUEDj4PCV
	5OxhYMxn/SDsYy+op2cuA5kJVxGMC8rx6PBmHjBUnYm8AbQ6RXB8BZFqESetD+sJywHuE7m7QS4
	CjLow9770yMH39M+37iT8r5dzPmMp5gWQV6L2SfqaQmqGQXw1DShIfqJAWPOYQk0lGUu03qDmvr
	bF9RE7K86pNePBfUDWB75CXjddZlEchp+OSHJqlZekZwOxLCdugHADnJueSMEuf82559eUHxBkv
	F8dNguD/bw9x8WyQvIJn942H99uM5qTKNSVh4+aqZ+U2b7HSsJmTfnbfQqgTZwuCXNFg67eo6Dz
	ajGN6gLvaygU2fyRfNSBxSlN6ZmVcq8jINLmOwGnghoZTWgLQnuyhvYEuROrGWYClpIdoR4tggQ
	==
X-Received: by 2002:a05:6a00:1c93:b0:848:2f84:f42a with SMTP id d2e1a72fcca58-8482f85045fmr1704891b3a.67.1783415396618;
        Tue, 07 Jul 2026 02:09:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c93:b0:848:2f84:f42a with SMTP id d2e1a72fcca58-8482f85045fmr1704859b3a.67.1783415395991;
        Tue, 07 Jul 2026 02:09:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:51 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-3-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1610;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/Mt1ZVMxcVAHm03erAsxjaKR2bufRmN8oCEQ0sOATqA=;
 b=w1AYUlv0hOvAn87Dq+iBdIZwsf3tpRAjM3BSzLkQN4a+eqx/waUGj11eHa+2GHAgRA/i0PZO/
 7EhCux2xmOQAaDaiv4aij8yNz+nuBnEQNaKL1fmXJjMgNyBJ0SLR2y7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: nbQKDfakuPHDU5qoygdohGjWYVz7cd7p
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc265 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=06MyHLLTRG02JqLiNUUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: nbQKDfakuPHDU5qoygdohGjWYVz7cd7p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX8eyt/X5ppSVB
 CveE8wrjgnte0zQvklPygbaqCi4qUe9zg2kHF67KAn8zfXCwKF9AoWTGwnnXL/2nz53fdZP1P5q
 1p5x2zFJMJ4W9RRG8Un2lKuvBJR4X+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXy4jDV/+VUGoE
 mw5nPpUOZlpISqHA/2mxnl1PfqnhDwnYVYtk5C9jX8I/DsVP6j6VshaCFRVc6uHo9iF2oh8I/Id
 9h/96BPso3TRq58J700qJ5kExP3UJ3Imvnk5F2RrsnzyUbjcyA3h6QUYciiJ4cD/oqLUS9io9wJ
 dg7jlMgiiGSVQLiUPGWM+zk6eOI9pe7X49MLP/MnXhZ4qzjQGK4IRuHBYYTMTuZDnpfJh1PY+wl
 LSCS9MVKjJFU3svqsuN9v33WiLCEO0oVuw2gy8jmaUjHmrmX2prxP+aA9TBWOEmv7MdDJvkjOPw
 FEMir3IL5im/DceKl9tszGl1IrDuN/mPLCfdGOgb8IxUAxyP/fJVjPJWByLx0N1HYyqrH/Hf6/F
 7kQMF46WPeHQvfg5IBbRlw0olWLKmojZcLpCWcpQ56rOhYItZyGk9EP9H6CYqAMpnxjhbbCLl97
 45jLTs85KblfN2qH0lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone
"qcom,coresight-tnoc" compatible, which binds via the platform driver by
compatible string and does not rely on reading the primecell ID register
at all. This lets the device probe on hardware that does not expose a
readable CID, while remaining an Aggregator TNOC that retains ATID
functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..5d0e7e8c2e58 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

