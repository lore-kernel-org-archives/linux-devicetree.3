Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F483F39F6
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815841; cv=none; b=T9cf/ilFHZMtb7n+T+Kl11Qgp+7CdT2V28O7nHqsO8j86DouTkLCLvY1BUcoCtPqpqQLmGRktdu6j3R2XR+WSfhlqJnlMnH/g00k0E81g29ZYa+dBaEXxhb0dwXJOr8UP4fLK9noPdtLhgjgee0mbGL81ZsFNdOM5euqRi27DA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815841; c=relaxed/simple;
	bh=3fON6TjZ2nEd848+J/DYzHWC9pCmE8J5utGZa5iaXgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtVJUo+zirw8GdXma4pz/1bicNGWUrgzLsDj+cElzUZTXs0Oeno+aGyEMTuBFrcex16607UXMbOM15Way699wg64LvsYydMwv1gvpSBqF5xIDsgJIS5ZkXH3nwt5hL4UfiHQiRdlKV0SYAVyge0RegMLAbO5wk3umVWhwctQP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeRfrcS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXofhbYc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeRfrcS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXofhbYc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1us1573447
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=; b=MeRfrcS/dNGA9sWn
	k/QHc2h/4JrjGZZJoGVNg589P4iC+JbYaSHjf7KCrWpXMBd0tq8+eoUaqZTCgIXD
	ThA2MfhM7YCPS7LKgJtOtUrJmEU4r2cgRDCdQms2S3cT0ixReVlgSI+uraoMABUE
	SCzCBeJQFJ0gm0H3R7ZTR28rhlv+ISgo/J9IDLRQCKdl15MsDvFoU2FwJmUp98ba
	qRLcLf34sdNjHilntW4O2pTt/v5g+7bK0FTZgOyO+z3We+BRzwlujhRI/d8Z8/xQ
	JVdhSVYVr3DFUXSYF7TmPYVHxyITqhodcNGzkh705En8wReKCrFH6FT7dq46kung
	JVg5mQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861pyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84770f89b99so3431230b3a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815837; x=1783420637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=;
        b=UXofhbYcW8iojjfIC2cFD26ubFmeohT3A9mixrnbzg/cVn1dU8a9+JOBIHctWO7Ywy
         CYLYzW32jpAvAXANS8BCpNXDb43Iimg1smTxMieYNTTM1sp7eDmjgbjf5d9voPJ+f6PY
         IVcG4tYz/QFjCbcq40MehtJOhwshrUUQg3VgVXTNzF7TgNB/D9ZnbTHmgzdfFkreTXwc
         2ndmBIrYJjbZ9qNsql/gL2lWHzgn1qfZaHh3dnWC629gvizaBfwLlkibX1v0LwU/1TF3
         SYz5vnc5eRyNst5LmfvLDBHi3OuwLMk3e0CSAybIjLLy5qSC/kL1stMJd6g1IdYGNeez
         QprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815837; x=1783420637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=;
        b=imjh0uexc7UEt/WVmedI5undAuz+Tb0xxun9J8QvZBbH66NOEaQTKW10H1EiXR3V8D
         KQi92g/AzZmp2YowWNpIGMlCcLZVhx2Q6G++cZ3DAtf9/lT5/kuUdg6RV72OLhBBrDs+
         ACtk91ciqf24tZnsr7LnAtSKvHlrw7pudld8MQPVPWsGV7U4VoLyAwGQzPtvWrbxO9me
         +RWj1JW2J74OX1K4vM2n4WzZREOf/bHBxDp1xtu09gjurYLRplCb5C8J80wbtJJaBrqr
         OYBHGxcJhS5ECNoLJPlErxDMF4juNNTw4+5n1XfjE49WTEUe/1Kj3v5jJHTPNOJDjU5C
         0KjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdYcUWxFhg2xYeioLihtR21rGoZKzQrfjYEB7nUeESZRpIleaSc1XvICIGID2haNDJ6Setl7UmVBwq@vger.kernel.org
X-Gm-Message-State: AOJu0YyHenW5n1JD6jgEJjFffDKbhO3OR8W+/t9OC6mOpDqqRcGswcwb
	JYgZ7yDqTDMv0hw2PB6wJB5H7gRkaG2OhTRsZnIXJKkdULN9X3GuHqnR/h4EP+fB2tXkWQU6mpB
	QGh5fpmeN2n0iFFWVNYlPIuujHTqi8X5+o7W6bAAX0+vbQvxF1JqrPtdIY2w5sL+1
X-Gm-Gg: AfdE7cnhpgObsdA1oilvjF+o/cZeXwOHPVoL8QSMLBI1W70Rg8WLtjHC2bgss7GyTwL
	QauygEQnGijpqZNxfBBrINKW1yz957RDK6GDIM/k8cRbKyJdO6EwK/+3neAkGnt6xNqNLHf+oPz
	LjYGJeR7H2Dkqt3KGKKWpANexMcSOtMtGKm0p0oVe9eE58QAFiH0649+JK6n1m77eeSQJOWsYcU
	Ovbci5q6NUmJ2w/PQ9KfQgPn+yJwjq4i+cAyE+7Eqg8GOTGIRA/Qg4+Kd55GXrmnjfLsYIPvXWl
	j9WqDPVGzVsW6TnxmlpsMe1FHOawPclBCiavmtgUUDm26VE9ZUoPtViYleq/1uSq9JzeQ9g5aU/
	fvO8rs4GOF3D5YuJ4/NP9aU2z08RdKDnCQzAExBmNhQCPkH/XE5l+CHfHwIG8RuYLZsqVChD6vA
	==
X-Received: by 2002:aa7:9a83:0:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-8479f27b428mr2431824b3a.39.1782815837184;
        Tue, 30 Jun 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:aa7:9a83:0:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-8479f27b428mr2431790b3a.39.1782815836700;
        Tue, 30 Jun 2026 03:37:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:06 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-4-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=1196;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3fON6TjZ2nEd848+J/DYzHWC9pCmE8J5utGZa5iaXgA=;
 b=4PewfliGY+OR8SpxKIQ0Y/YO0KAfeJez+GHTWzwcVoY0cub9IKTIyM4LHizFRR/4xDjaWcJ58
 pRF0HxlyKaBA2apTuiu6HXxVKMT4U8ajQTCqmVTdV6aNi1+KZ+MQ8AT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: QgAJTpU1IRDUfc0db3uItwDCVT87gcqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX2jawxSVB0hIh
 pHiNii74qUoaWZQQ5sKrL3KQVKsE32aDKHVaPsAbX2XaYO0WMObcxdpkKv0ARK2p66iiZ265GgR
 RZxrGkGgr5Dis1c6tZietTyuvY6l/b6MhsqCs7byswwZS0YWI/2aUe2saHZdU71lcE7aa5fGN+C
 ctM+PU/MB54o/tcBFInbzRW+3fj+5TQ3WRLNAWe0QhxZuwRX3+IOhYBHEkIUk0amSRvMTtDZmn5
 IpC8q0sQZbojShZCzQ9W4kOva2fGPFYOO7zkisHb0PvenRyC8CKEUYa60jkmaixmmFwaVCLO7cv
 SRnemhfHn4i0+DL3R6d7qQABOe4NsQbIs3XnQqz2v4gqddB0CCykclzeAb1suKyFE+7zdDwpHZi
 yFD9vZjzTmuTGOEmBr71RcOPRUSMZNZx1ziUl34AG5+PL3+PQXSVUFiGkV67RbwMOKm2arK6xbj
 Rw9GqS5z03MtJ0YsxJQ==
X-Proofpoint-GUID: QgAJTpU1IRDUfc0db3uItwDCVT87gcqI
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a439c5e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9-n9NCBYjeJb_QXN7LkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX9Z0DZAmsEfOt
 mS0Qata9XCTinrTAZhbhXS5rCk3woRRapsJgG+GTkvSerkPVhKrTB5LiCgaDmS5CR8vZV0uvQD/
 +YlVn/1l3TuPwxFF5SP6RKraWDADbv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..d58483f9f93a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

