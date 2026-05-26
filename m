Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564FA3FF892
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806548; cv=none; b=ikkgUqSbZ/J8NdEVmFbKGiu24Vs+gjEtUrRlHTnAUCIYWePeF4oPjmqJgy2mbUKucPB6Am5ZiQ87/h3dyxyQLS/5odWKpgfjwuyS0/gwsJnqXiGuzKy2AhUInJI0JO0scUkRORVT8ydcZ5jFWTl0RcGlzju9LhURkFIZBzzQs8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806548; c=relaxed/simple;
	bh=PUiL1di5z0y6rI3EPmKa71j71HOBjYrvAPS2lyn5wcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxuEf+ZyrXJS+oJbQpV2F4M0+SDpGcCJqoynfX9FSRSQ1hscvEp0wrFFObBEDxcqYq1wQt7MKtv4w3e7ybbp9tVfqdE0eqL2ODVp5PH6hSQQnJo2BEk8E7T5FQLjB2tAnlviSt92pV8eZOJ0Lwxjb39AfGJ1bZ9U/L9mHah3KMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow2REcvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irdf+mFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow2REcvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irdf+mFQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVnu2882485
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=; b=Ow2REcvVjz6jJYV0
	+/mToHCztuG2rvHawhNLJKSbRd6Ky0UQiP9f9cau83gCW4ILJS3JERFThYAYxvdw
	+o+xs6UNuixwE7fyC4kGaIA7eFmKV+kLRCDdMJa245Hdifn5JaSHwZAK1E8gpPuy
	Jsv7QeI8XAhBLZ9FGY6EYttPm+7kw6UAOKsaERbbLSKp1senvUjDSpEfF5NFYJMm
	NKbIyxhbPB0U7pps9EQO5vE7uKLZE4wLKzJJPIZ5Jp0dsS4/szXX5KHjvTuRLF27
	4B/XkjOFDA1/qJgYH3zlz9gxUtD4i3uoigJ2dI++hTRvGfrh2B+T3Y2LQR9I7g8T
	1B6wPg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudcqcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8279604464so13460109a12.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806545; x=1780411345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=;
        b=irdf+mFQ4eV9WigaW5foZw1IpkKWt5ibrkVHim8b5SDI9e/ovJGC3l+mBaUA+fZ40b
         EufxUP9GjIeYT5PE9mflJ5ryunJ30Dl52FJvaJaTdOana7dq6towr4RP34uvzvTpSY5Q
         YuhbbNBkuiVT+q5Lw4496WHQ/0sk0oM8/bqnHEl133E2fIJxenWERwFEdZ4zJfmiO4wB
         bqInjY5ZtSnoViUBR2eGCxWVwHenoS6zKYMpf3v4H3Com5HbdW+uMpceMd+B2cU7xCRV
         xp/knmlVie+t1ZDA2Gbns7qBiDRgAzq9N9x9R00V8RRq75vvHxxJdCF9Te45N9ZBua78
         jn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806545; x=1780411345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=;
        b=GsbaTQCNrmCjM0XXKEXZ7fwZ8EHKHf4Tgx+FS7o3wYjkcan3Z38spEN0J4cmV84LaZ
         jXxTGcCnFrBAfHVrhkviMWAMHDw5nxVl0JzvTG7j3F2ELQlTV9wXfPkfwWap7dhpl+mv
         +javMQQDohw+00kXVMjL5hvSPlQN4XDoMWt3q+nYTOa8OzgWxFx0xf7stXeb45W9rOav
         c8YDFJiC6Q+jwzGhG0mw7QZLLDTtb67+C3g7kbtNPRU0gecuR42HPWg2hjtsQEUjoOP+
         6bBPlESAnfMLlQx8YP20g0ldBGjOjj30uCfH0XrsTjVFJYUhJJ6K4FP64I/jeRJbtZVf
         o9rw==
X-Forwarded-Encrypted: i=1; AFNElJ8uIzOMPuxUhOakLP7bujrKQ2hNC90DpJ8gXvOB3T4Wo69CdjXdY7FWHz+WNhBC7bh2bhpQreuCeKy4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OXmKD3wHmhQzyGl1ywkSMHuMqgGePT2t1+UsdF7GCqKph4Lz
	gMnx7XMhjfiJQ0M76mk1rZlPFHYdp10CmPjGEaIrdEd9XEu54Dj5fetcoQ9PUpbIqZYwUOdKdta
	Au5HHvK3aAinF6tru7BGJ9DIjCqy5xiA6qd8veeHBaC3aRJEYrmy/6ZX29nVKQ3OW
X-Gm-Gg: Acq92OGzpP9+dEFiH2llUheWJMs4jgwIeDyincu+SGz14lwxqE2JaomH2S42QQAFDzp
	2L5VGQFaiyVWj/bhWLSvu2AaSxEUhhbYgL6SV6xv0wgDkzMNlTvo7AOPvPCoXmcHXgN/Jt7luI3
	1sNW6GE25KwB0EVsS8/6kChfB1GZ4G1dXbZMm86UllS4yWF2+GcWuC+XxJWBDHprEuducaiVazr
	FabH5TH+eVT2Yc/kSdeVoczWQA/s0rVvFw1Cu48CPknA8iwhjkdyT1TxmeQ59/zKR1sCkB+2onQ
	Wp8A4WS6kxzjWjquJH/RepKOJzXo9DTso9MDpRNH78TSLA4nipmLdiDpvon0eBNikcy6cDrrRaV
	zNhFFQMbQwuppRinxD1fmRa1/Kv0ygHCNOlLB1thuUClMhULeHfrN
X-Received: by 2002:a05:6a00:1f11:b0:841:58b0:82c7 with SMTP id d2e1a72fcca58-8415f0efd10mr18388705b3a.8.1779806545489;
        Tue, 26 May 2026 07:42:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f11:b0:841:58b0:82c7 with SMTP id d2e1a72fcca58-8415f0efd10mr18388677b3a.8.1779806544992;
        Tue, 26 May 2026 07:42:24 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:24 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:04 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=PUiL1di5z0y6rI3EPmKa71j71HOBjYrvAPS2lyn5wcU=;
 b=qwyYNob3QeroNmM+O1jx6rx5POgtChtC5hM3Hm5uGPCBB2RsdsoypthoZmgjsMf2N3zHCsl/e
 Oftw2IUs38qBTANvoudZtqGM2uTv4xEXg5SKwkblpLX5wNzNwyE1z/g
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-ORIG-GUID: f95nV-dEBd_gp9mOEhB1l3e-vuCyGKiy
X-Proofpoint-GUID: f95nV-dEBd_gp9mOEhB1l3e-vuCyGKiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX/6w0DUz+yfpF
 TL6L4iUsvhu8Nw8V46V0F/RHEQ1YASx9Jl4QPChsMPityLzao9fSOxBZgjLj3R7d5qa9Ffb6LZ4
 T/5K106J3egSC/n3YYwANMI1wOlb81Sp9iH7QSPF3l4IPivLvLylEZNSxVmM9bBFOMxXbYyeAZT
 euiE4CiH5Fb8jNJEhlF45vpTJW4kyNvs9LunJJpsROl4ADny2ZGBo7pTmpCKyKlzywzGbs7tL7q
 5bcLb/6LMf/ZkG1mKypCRcc2AgyiCp1PcZa0lfL0w9uU3ICtSBwarMuorIiDlzuzz6VkyE6S0D0
 NBt78UEQCpuyXNhTC/QxbozgEUZGAdXUY9+rKJLx8z+W4dst6Qd1+HHmvXhLgTBuCYvxWu6y9Gn
 gzdG85zGVYty+wkVDFy6OQd6WIf92r97L6Drgl881NqzI6u86MMyqZfLYg7PzUo1K98Ebf+5UfF
 yJuLqnIxcL8nAK7p8Aw==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a15b152 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1

