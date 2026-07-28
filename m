Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1D40DB5E
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228041; cv=none; b=kj1+ZuZzpf4Gh+0mmHdnY+AOCqOcsXUCZYmaZ9lNIdNUIikckuHNUVfwbayE58u/KXdtRKm/rqpL8PN5UcJKU/gJqDQzIxZjoWp7+VLLW/+/h8uNCq+dR3ZTiPfU3fub1Vin0b4FMKH+JkA8SILHyX1lQRHqYhxDu2CbxQtdIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228041; c=relaxed/simple;
	bh=F7p32oB/ucOg3yOmJ4wpTVe7WX/11jrTNbDkE7eAZ0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhUuJEbStDFEKc98w6o09/RfHTh2eoFiHvl4gjeQVfHuzu2wuiRtMdLlz6iMexbHCFim7jIelTvKE71F/w/aHQhpQPdesC5I9BESiojE7/aEXShc9lwo7tVsCEFqMZzkoMGfJDdIbiKEs0WrPyq2LcBcYyrai1Ct0WwF6SfrlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO9hN1L5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbJpoRUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO9hN1L5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbJpoRUN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S823G01663741
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v9s9iq5JcdMGOz6OjYJ67D4UOGJu3ateBE0
	XCwoxSv8=; b=KO9hN1L5943Kd3zn+Vjd6GrUG83l1RCwc45Cb9EOjGV8LTQFRDB
	Krwy8V9KbpYuIhEtFt1HpnGSps4zG1iywaMZBRbP5BcKVLUzCifF1MnnEu7YZ0V+
	Xm1H2KnabhQ2szvQJiGSKnl4ZtKawMxGlPj/TRGowIonphbf9pHkeSExoqDPIg3p
	mEbpT9Iv+NvxqCeHz5jhst4TEICK/u+FZBe95zbiJFMgInpzcIzvoQA7yC90h7nA
	WlcXTBYkkz84YNE7nC1t9hbLmB9bZ1cMxm50xKMB7aawpyWI9owP8PR0WcADv6NP
	Wc2ToYvR2A2R823T1EV4A3VnjD/yavpXcig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrmka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3225952a91.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228038; x=1785832838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v9s9iq5JcdMGOz6OjYJ67D4UOGJu3ateBE0XCwoxSv8=;
        b=GbJpoRUNAIZg0Mz+b3OnCI4XvVA9BlWXOagSsPLP02Ie9P0D/R9lTIxuWzXS3Cy6IN
         jPWv7c4ADZE+E22XSGmK6xsNsRXbGEHzn8el7CqdIVi8swUOm7zQ/2dcndJx3KPe2nTN
         UO8kBEpuMBYIh5Ffb8YIgGveBs4GIgGW1iYNYdJZW8F8Vv8ufoVTESr+MRQieW+9tvN7
         FwEaRA1PcH3hSVvJQrNo2n6mF4x70bq/xnc/570jyFRX2uA0Qtq9gxWEJgaiV0sohH4W
         Luk2IeZHGlic1EOsWkylp/RK2n7uHgUW697SPgZYvbMUgD74HWT3mBQn2nWKnYCoajrA
         OVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228038; x=1785832838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9s9iq5JcdMGOz6OjYJ67D4UOGJu3ateBE0XCwoxSv8=;
        b=eQu23WnfWCPEaRkE9GijAkCvsOJqJhqdXTDUjFu63D6VDF+NDfzFARbcMPnf+YQYmV
         xu546QYapkGgV3PoBeFE+CZSaHnXOAKXENWBQfefI+6+cAjEfgza5pNPnwdYDO/SQGH5
         QMjOVHkJiuqe7sMLLnqDNsnptV6tfWXUbT2GJWsMUntMH6i4lfEaL9GEYBvBqkBIQsFd
         CCjHuOWQTSnr26VHE6SJK6oSu4qeBzYQ8UUqur1vtKB7CRAqtTS61xCGRo3TB+MGSxuz
         gPZC5f7tZSkogF00fO62tmzHgQV7z/8JiJlcDipDq5zha9YPpZ3FWOL27XHZOai0tOnI
         v2yg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6GMboQW/M6+Za+SlDmMhg/xIsgj0mubd5MnvxCZ1bHNvmlytAu+3XFWGMkSo4qUVUn9G3b1xfbB8o@vger.kernel.org
X-Gm-Message-State: AOJu0YyjDBsNLdMYEzQbhLRL1XNvoXRIaQtwhVeyjyeQKFsHRuU8uu3d
	QrOPwwl9kzTeeg95CmbWjmtBICb1FTa8WUh6bTjoj2aLQ0T/2xkFwOcrGa5Hk6LqxrpLbSdlReB
	zrZXaI02Hi6o5VNYDjzxKZ8NFjkkZoafsSH1L6tiFpFqdeRTtaynyqnu4I8cBFweII6YPPTL1
X-Gm-Gg: AR+sD13LbIUcc6Acdm3qMeohKAge9mlmQWtyOQ9r3LvA7wZI6djJk7y2ZEH+nXvGLkQ
	9qLyQL27N7DtRtIOjEL7SjPnZccf2vYWahstesMw9bF/f1dBNk5QDisjzqc9kbmSU+0B+JSgcpu
	FfNMpvr/lFyRE0bdQGqGl7q01vK33ZiNyWjozvqibTZIhLKAASbXfDwI6SMlveho+lfJkmFLVRB
	O7Ha4tMSDlWbxgp48WmJNvuCkF0/vQWz1NUghJ40wt1qiB9Q6AtL2CiH6LCnW1VgqD7B3/Yf/64
	oeJEGkYMNtA9E9MTbfDGR9RvXaiVCj8NQagOR7NruyEjkvbJLzBWw/PWEoA/nd1AP6RBZCsLOag
	jhqWlzh9otUUReyDpH6uR+akXDxsYnD1x2gzPxvVHZimRJQSWZsPARje9AhCJ
X-Received: by 2002:a17:90b:2d8d:b0:38e:cb1:8ec9 with SMTP id 98e67ed59e1d1-38f6a5d0c8amr1598501a91.42.1785228038300;
        Tue, 28 Jul 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8d:b0:38e:cb1:8ec9 with SMTP id 98e67ed59e1d1-38f6a5d0c8amr1598473a91.42.1785228037794;
        Tue, 28 Jul 2026 01:40:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm916277a91.10.2026.07.28.01.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:40:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add ADSP and CDSP support for Nord SoC
Date: Tue, 28 Jul 2026 16:40:09 +0800
Message-ID: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX00sOPBra2HxT
 +eAoWVpT5d0w2X6+tVzQSBfGdA5jnMzLEAxsXM/ej5G0AI445kC85PPyG5ycz0mE7hRWlxZuRfW
 KjQzoZEv3/hMOPgHyKBEOKIHrtGxOOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX4WjBmUIpTEkI
 cF9Lr5T+SzlOve8RnJxPcaoxVcaalKEhXavlCRpxA+NvqlgSzh/UpIq1t6p4Q+bw7h5vDfAI6ID
 r6w3fY53FGj4LEfu31x5wth88h1LMH49LQOTzgAR2pLHZt0Ulbu/9TcwnyIbIIjUpr7ta9mLBLR
 atBRXtKugpDsI1qW6pgiwdQNTL+HCvzabjLaWsjEShIeqnRaKNF2IrG071PeKB8rTZQx11Erh2W
 2WUg4mI5a/WJKDRQDoXIqtrsBHZiu4lWHVSj6vNJUOIYcbHC8vUYl68zDD32rqF64al+O7N5alZ
 KYN3G2ilbIOKNYxZPNQmQuSDfD2jN6ysPLoeBy+IwkTG5G6tjlDA0E0VqOr0sBf2NBFyb9KwZsJ
 MwDJJ2CJW86/xTXAtm6081Syf/V0k8/H5H7Fi3XEo4NwIN5d4RqiZkE6sDg47EZoZUjArfNCiBI
 E0Llmf4q9gvu6yXdlJQ==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a686b06 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Z2VSnZ_RAV7TFE63rgl92wevPQXZofWV
X-Proofpoint-ORIG-GUID: Z2VSnZ_RAV7TFE63rgl92wevPQXZofWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually has 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v4:
- Add Nord PAS entries to qcom_pas_of_match[] in alphabetical order
- Link to v3: https://lore.kernel.org/all/20260727074621.561661-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Fix qcom,nord-pas bindings to define "minItems: 3" for CDSPs with
  an else clause
- Link to v2: https://lore.kernel.org/all/20260724103848.233804-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 +++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

