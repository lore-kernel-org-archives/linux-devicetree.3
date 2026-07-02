Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A809F3C2BBA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989743; cv=none; b=iLNgj5E2rqD0N+Wtq9ei1eoCMT5R9JiOtK++1Utj0EDYln24ow/0puOzA8d4EByTFAY1Wll0TpXxWn0sSZDS/d18cBUstE7WnF2pwLjg8i9qo/SLqBzDZ89xBDkr8Wk/Qn6Dm2S9pGLSHpyC5X/4faSyI0lAeiyV8rX3T2gRW6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989743; c=relaxed/simple;
	bh=qkawMr8/MmU3oMMEzEEVlcijAhnSqcI0l2JKK2tRDtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rGkw8UYfucAZFWCq1durOGNeVwTIja5Tb1PQPwj5+goUnvwAB5Mt+RDt3BDqLiBTdwGlVwkeViygB1m0PVeRrTbx4+tFS+Kv+RmYrqyuSPTxe57kp22tYm6d2eCLYGvD59ZxDIcDNHE7BWIVSCKKHtTFGk/QAk7oOxn/kml9n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4Cveg5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGiMGdmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4Cveg5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGiMGdmv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628WQJk3052381
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sn9xvt1KhD7
	Ajj+DR0s0lrMn/sMU9I+kltfIT2sKm+U=; b=c4Cveg5LEUeateSmfvvEzMf2IXu
	WOkEyDMuHFTLchbJ+oUUrYFXk+wSm8WEZtwaEEExQtkvTlgwiaM46Nt18aBO9ako
	c8Mci34LPINCcY8/W9awYRx531lNzrCSiyWwK2x23vnx3VnbvTtdjXfKJEpX5SiZ
	L4ByIiqsb6hiYAAbjuItL6MoL4zXZZl4vJoHFFoN9Gihd7UoEAFz4d79WnD9qMPV
	2SjFOhXa9pFQNqpXe/IWd9pWtyvPSgUNkitVulMKpRylVgwdc4VnCeRDxKlssxYr
	5FDzF8qZ5hQIpgiOoVl1iJHYJ6cB1lV1TdHNGyrkMv5jI6pDAePj0qXDIMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vaht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:55:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so1750246a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989739; x=1783594539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn9xvt1KhD7Ajj+DR0s0lrMn/sMU9I+kltfIT2sKm+U=;
        b=aGiMGdmvfqwEs3jXdxrFhYzjOiBh+az0eFxmdRKWjziQ55yA1qlaE6eSnpQ0yrRpXP
         akdouSTYA7sIYgbi1ZxFsLeDWwgyUexarSUDc8IL0wPslXpavwu7/iCF7TzWoHpJo08n
         e367BlC0tEzNPWq0REXiQc1m1xOg0sNZre7Mts1CLY+AtAoRGcYeFUU7b9G+IIVelB/g
         C0NUwCeSHGQY1M13fPQL7Mgu0dF6kwxUrXWLMfEf1gx0naOFTrwxwCJp4Iz4cooowXWq
         +Um1ntIxywVGXDeEy1AU59qaSWff62x6l9xukehZsz+sJErh6oFgO7pLqzMPWmjAzZFy
         ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989739; x=1783594539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sn9xvt1KhD7Ajj+DR0s0lrMn/sMU9I+kltfIT2sKm+U=;
        b=mNg16hPJAoJ3e1QUYWDMqkY4CsETG54fC7cOyJceQ7SaUb3gYE2fdp+NvX7cBvZBKv
         uj8B559Dg+vp6urdy8f91qBwSyJFq/i6qMUPIR5M+c8JknoMnDrugO1DfS0SDWQasQPY
         ktGnlcEVmpFnv8hxoU20SJKDy5wMfDlNgoYWaON8Qifcd95Bw6RxEZAhz0IxKzorJhFW
         lRh4rthJtIY8Si/GhLl0O04Pv1Ij9hvl46ALkINM/l6ObTtGK0NiNrqO8NmGNUveEbY0
         vWMWgPwoGImceTRH8WOfKG/EdXxKHtDgfJiuHGywHb3nPiXGFycBTXB+6tbBlgtstluQ
         INKA==
X-Forwarded-Encrypted: i=1; AFNElJ+qMRFvFCW4Qhk378WConU7m3N8lzR6qHZHisuGZ2DcWAZnhCjtEJU6+xYOu8yuvN1yY3+9Q5/VfLa6@vger.kernel.org
X-Gm-Message-State: AOJu0YxmwlGeIFC+7//wmLjEGAi9Qxl/dOnESaKhQ1qifmn5zYWMQAb5
	RwPniOT9NP8FY0bPrpDIuzp0Zz/qJmJbADahDkFh2QWC62jy92Xnr4xXRWA2nGN/s7o+xtu9Tih
	GRiZDQ9eN4grYm63UqsNUWhgNg76gNCIvt4w2MCCzE8qsYP4aCXy+/c/CXBcCALCXtbpxaN4Z
X-Gm-Gg: AfdE7cn7mkJvNC1griXHXzSTrTL2jzvlmifWsDJ5WGl/ts39bVVjhid2TJUdWokkKUU
	JL+aCoTxg8aKGmO7PpY8iOzfyYcnMFdqWdOQLlAmoAV5NPh+Hbd4mC2BVGCYIBAJlPwxCpNLYo9
	6exxQzi+dsW5a2SurLvZCLTFAwXjBP1tlQ0Aw2dca+RrB6t7cAgCHgCgP0HxocvZMjI+amoJ+Be
	8isWTQTFXpSg7hLqy+GMuoKLogD6kIM/YQUVxMkUcIrbKV9ReOxxFPziSata9c724FxjDSQ8clw
	AMU5gVhHMPqy9bxPGSzBiefqNjKXReWF7gc0k2Uj1OReCww/c3uakDSntnbKEaNn5l5w5pbmLo5
	JLZN4nkzehUOHRic6ZfkKAVz3jqgKk6K0qP5Z53HJQXhr
X-Received: by 2002:a05:6a20:a107:b0:3bf:6c08:fb9e with SMTP id adf61e73a8af0-3bfed5a7961mr5952175637.50.1782989738619;
        Thu, 02 Jul 2026 03:55:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:a107:b0:3bf:6c08:fb9e with SMTP id adf61e73a8af0-3bfed5a7961mr5952152637.50.1782989738199;
        Thu, 02 Jul 2026 03:55:38 -0700 (PDT)
Received: from hu-sarata-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc38e5fsm7903148eec.29.2026.07.02.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:55:37 -0700 (PDT)
From: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Date: Thu,  2 Jul 2026 16:25:09 +0530
Message-Id: <20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
References: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZKv-7m63zJcESvArAznHk2QRpGjL1C3F
X-Proofpoint-ORIG-GUID: ZKv-7m63zJcESvArAznHk2QRpGjL1C3F
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a4643ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4Ty5MVTmxNGtU14xyboA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX4box3rXiyNw4
 Mey9slrhxi9IhTh0BTeBqWiEJisNEdF917XpAhbEoB3tqq7USyYB96FOaIUdfMyf7f49HrurYdS
 DUJ1tyy7thWX1BUja9U4FuXLXhIqyY4ooT3xCVarMBUIsGMfEhv5aPA9X4zsSlIsxK0sDouBX8r
 TCQqAJreyZUgWWd3BPMXQvxRBJmtEhJ/MB4uTcjHR1FoLkVR7SiBEzKal37l2GQHO/9SGUaNY/T
 BfKRU5OSarNXDJTCOiEvr5cKxq2J3/sbaF+HKZEVoeLLs3C688mt18K4GiP9K0KXS6it+qE4XDJ
 EEKJMHTHTFFCUHUzLcqutiLPuFROawnx/6ORieK3imCbUtHzrdSSHXX2iRPGn8OdChzDw/a9WVp
 wSp550zs6I5ygbE6Yv7dR/itzvN+4TJzQVtjIkGY8YfIoWUq62tBj6F2loVJb5RKIl2cVOotSrY
 ktVbj4NE0cnnw14q2ZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfXxTsLj2rxBWl9
 OXzwJqk4xvZ/UegxfcfHfDbuEWWsWfkAUSxjJrrx5c5gvjhhIYzR0sody69/VQhubVMbgfD/g/8
 I8nefO593aREFtrqHmD0IjMSghMOKMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113

Add IPA nodes for Qualcomm qcm6490 board.

The qcom,gsi-loader and memory-region properties are provided by
kodiak.dtsi as part of the IPA property consolidation work, so only
the board-specific firmware-name and status properties need to be set.

Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..d4f96bdd3a90 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,11 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
