Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F5403EBB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806561; cv=none; b=MTIQ0YOEJNBn8eHasNRIeRDIwP7lOWqiaXSekqNv6E5YCKS3zHdRmrfqNHIqh6EaZ0nDAlSOzu532uKjNetD6c5MheDixinmSdaSsziBqiMYMHJjnbDDL2FqVjYwPmNsUu3WfK8EJQuckWU9Z+yHN9Tq/FK81LjD8YGZe7Q0+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806561; c=relaxed/simple;
	bh=b9Rdi+IfVGJGVd0iCHEmLl2F9yeoA7YYGwM/7TZc/sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ke+k9iP0R3c6mBXoHUvOb7VV2/BtGeu6gwQr0YTu40WD2pd1AurlgTy5kfY+CyrVfa4mpVhbwfUGXUmfdgI8M+qvzveAVOY4B9uB2P00JomEc6BOP7Mn8tI2AappW5q9YAiYP2Wj55/ENBnm/ALPIQgla+iTHcWqsBYIB3bqJ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qayyh9Sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLSOck1V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qayyh9Sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLSOck1V"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsW322496588
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=; b=Qayyh9SnNbcVlqD4
	48hf350bK8RsqsDr4NQ0GNVo/s7hSkJZalrF35arJTah0tBe2W7pLXHpZkfQ2875
	LBBhAwETUVZ3b7bAcKC4mRRDSJx6jJ1LTEaFQtxzA+XUll8FglUHiQGONllLVYSm
	gG+j+NhEuqa7KdeQdz+sQx/CuURgX+nSWSFnrnqi3wi9kH/Rg+XE8fWBGr3B1Uyc
	TfRCGam9YacO9G+/kbwHIJPt3hSmnhLIOYQISqbiT6NcHeAQSd4X1oLDWBVVoyQT
	5PzYpYw/uJjSejAYzDgFH4lOtZjLanZpFq5WD6Zrto6n5wkI4maKSW2d5iZZ4Ni9
	eJp8Gg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmwfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353b042152so11948249b3a.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806559; x=1780411359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=;
        b=dLSOck1VJqwWn7QVo2s7VK6jMu73i6mkieh/kVlCBIhqtNQ2glgkim6vQhusRET0rl
         +DcVIIfMGQr9KwmypE94lArZRsIVsWKwIHATy5AzyOu3LksaS0ZGrFEeGA1IhFHSNoPs
         RS73n0ITiJKmYAFPMDSY7wkw3wIztAOlTEYSOkqeRgv8TroZd6AXJjyX0z9tfL764IEF
         FH7D+EOXR/SvGjx+fcg0V7u7bI+p6QJ6LhUdwWln7swAq651ALneb7RgFT45VQ91/0g0
         JZnXl2Pvb78CZ3U7JSL6Cq2Pv2oJU0raxnva156uY9YHZl+yIl3tfyluq90/2I4ve6bQ
         MQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806559; x=1780411359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=;
        b=lpfW1tr7DEPYvtCGFKuPFi5l1ldQBznps8VjQj1QFOL1dsjiqXcEbr9Yy2xtIGAtQR
         uGeGvV1Ni26Bj5W8zGHSgeb22rb8ulBltWtZGBMXOd8fipXCyvXTbvYVCNi1VnmK/cMV
         1FSAMKQUAkdLPmuuqutnksCX3uxedhL/yyaW+Cugm0BVjFO/bpWi4cKbAD05ngASPMQ/
         UywuvPI2KGdgwNjqRR4BQxWuMclRIrFWngk9OvGyVS8WMAA8HP03MzVf80x4a9imGCQB
         cbrdoQzrvKrXgBeAr0Iq/sQ/mvX8rz6tVoiR6DerviKh3fAUTnVpFkfafRy5mHzVtYcO
         kWuw==
X-Forwarded-Encrypted: i=1; AFNElJ8K3opoOZaKatFii+QbrxtJ2tTDCc6Yi/ykSkzC7bSlrS19CJfL3f1JFXaVtQDjMohEOHrS1zPpihUb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2LFgJ+AEfg++sxW9+Dped3CTVcZhtF51LgXqHNIlWZYhSwvFX
	TL5HBPjwng4Ni0Sq+3P2LDXc+ZgO4JXQG/uG/aml3s7G81ykEuQERVZHoa5iB6GSf5UmPvpO1xj
	HRWkEtxJ7I9lZxpjZOHwPtBkapDUVT+pjCo1m3Zy/dQOczhShUaDLhink12eT19MG
X-Gm-Gg: Acq92OE/RMMZwwWDOrVR841i6/K3kHvkUCdA/BOdt3hk3DmgiNEADF1UD/xPNr5OGG6
	mUStJoSxzJjY4R04VIJCDXqzTzEEZQ1N+cbYOds194yYlMPnWhC/SeJadyDGutcHrArVu+eHmti
	8T2/qsRo9kF1FIFkEagAhUqM+OmR5djnQmG0MDgPk2yB5YXiUEddmuayVK8sIJd9nQBu3y3Jsk4
	A8W5jJvvZ7VJ5XfU3LlkSHdDnJy3Xng5d8O76yZunTbX6e301sYLGKUDnaFa26b2Rd3Kw9vLJn1
	jbxO3w3m7/XnwC8d3KE71zb6mJvUHUrkk0/mBbBg5z+R+lGX4GvAR190CqR7bgb3zTBEVPfxEYc
	AOiJcitYYsKVcHtFseR+Uin01VcrPH/s00DaffAe9/0TWSuKXb7iv
X-Received: by 2002:aa7:9a85:0:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-8415f301995mr17730388b3a.32.1779806559087;
        Tue, 26 May 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:aa7:9a85:0:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-8415f301995mr17730340b3a.32.1779806558448;
        Tue, 26 May 2026 07:42:38 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:38 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:07 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-6-2a6d8ca30d63@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1048;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=b9Rdi+IfVGJGVd0iCHEmLl2F9yeoA7YYGwM/7TZc/sc=;
 b=fsVa27Uyywz9GSHvUf8xB88UX1ed1IqGjTVwOaAancFT19+AlIGoYxRrcONbOk+rVEKKqPWBt
 6fOQgHbCzBjBJxlRuYKC/eAdYk7fc38gv1W36Pb5JsyTAc5NJjajy43
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a15b15f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=55tFDwK73Rs-p4iooc0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NcsXbhRsJOjdZHq9mGBtTucY53IWbZOf
X-Proofpoint-ORIG-GUID: NcsXbhRsJOjdZHq9mGBtTucY53IWbZOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX3siDoqtJHa7/
 5To4bI1Lz2zLlIo035r0MIUEAw+xo1pEUezCfrI20+0el0evYlBReXImsu2nKdwBBxP/C+tKvkS
 oRxUwRHNCMGMT8FNz8iZ0C3BmDlE8dCkly38HknJ4p51w1WSfHVSfTAZkXdp4SG2NBWiEd2te9r
 nzFbg29oPr+WTG4lgZb4d8GO4G6EMgsmaV3jKbOBpDovrBJELZJB9B0xMGrwejZCuVWpsNa59iv
 VoBCuiEAzpBeEvLkdIwL3IuTm2NGk/Ppzgvk/PpUzNWbNvaJm5nbQz/jGItxvn5MxkI/QI2T+ys
 RjbNU80sK2jLhudZk70Dkxu9VZo7Xw9YF9HAY+s4UcX3FedmyNEezdle2SnaBJLIC+ljVsdqoeV
 MomcPNSA6Lc/Pa3c1TAEd2dVfQypdECUDl9f/EQr8VFZ9jybmjDPlPAE1qG4NT027qk5OoKv3sl
 wZbzSssJzm8i7neIV2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a45832568da26847312e00cae722a..74322507f4e8c796bf9529a9f0adcafbd725ac73 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2090,6 +2090,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

