Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A132B4189DE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379674; cv=none; b=HQmIognBzR1LczLNAfxbl9t0BjxVEilpOuHMd7R7W3HZufGAHUg4rDbRbNZ0/DB8KGnM+d0TmTNtDOcdd4qdW5HL2zw9tfIMSU3UBhcfusyyHFH+EfpyDc6hhmQTHfVjNiJuNO2pVgXw2hODWuW538m9uRBMitwuRuCQgOF9yx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379674; c=relaxed/simple;
	bh=V5CJpCM0XrV3ogUCuYsGqhnvSdSEBR8TeXV13tX2vic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPfZFTgMjTJsoFL/K9FUsqafk3SSM/rgNek0GMyPyAJbdjXj9Uy+L2RsB4dL7a0v/JMzup5XfEhMh78bWr9phNRsYN9rwVgD7oMsqWZyktBmh4+BDTLfmk6X5APbVyQAESWZROWQcOEEE2xV77COEnTleyP5FinD8KKUkknAXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnedIvQR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URUoJB+7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnedIvQR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URUoJB+7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nJA6247357
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7lAxPENrSys7DUlwTxwzPs
	GcblJmJaA2c7mPu6JomFk=; b=RnedIvQR48xXIPETkH5LTHGf6xKBwgIp/rNR28
	spFCYgTYju/N+IBQoFWMtcTO46eNLzegAUu4kgEPcb6H7gH5l9lfhXd2slD8tytN
	bVksekcTIgJ3lkcUMjxWXdYzec+9/nZYUpTzpiUTgPIRuLiUNNNlE6HpNyapIliv
	sHq4qNyucYzWfXtl/VRroxMcEIPhHTCytYAOkHnkxB/5iMYXMkbEmBYBkxkd5SuN
	dC/fWevnDVXwQ6CoQoX4elJF+2FSOb94eNTb5htiM3ZsrvRgUmzLDY5QWUtsfZvZ
	kEH2CoBTjPxmloMAqJCyzjy6lT/c0jwj9xEeTRTn6H/AgXcg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs82cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so7303177a91.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379671; x=1789984471; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7lAxPENrSys7DUlwTxwzPsGcblJmJaA2c7mPu6JomFk=;
        b=URUoJB+7eixSqlemS3rJa5zvZvWvHK6qsrQa9jfSiPmDfT/S0LIrYyzEPmhaRC3Ogv
         UFDD0PlQDqPRqv/KpHJM229FghxIc5KRl1xOZrhHlotCsP89am2T8/FcCHoTcEIwSueP
         UOyxBHouZHWDNyMeYpQHJzWVCn8+z+RYtOH50Oe4OhpQPeMbgFo3bTOdQDKemCEOGgoC
         ZVNvOCk1euxXF4P6EVFRfBXNPzneHLCVSINagAHsRiUuuKPreIQo4o7MApAtqLG2s/q7
         OcYKlcmqw+mi2IppWgGenFVoKqPuqD0vHiItvvzkQZKj0jhckhBAreRmJ1mU7Xcmw1UC
         AhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379671; x=1789984471;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7lAxPENrSys7DUlwTxwzPsGcblJmJaA2c7mPu6JomFk=;
        b=h+J6RKu50FS6BVMG7QRS3pGvdL8YIwXOr7JhbQIXhdYPx3xueCemeq+rLV8K0mFGCq
         go1vhuGHFi9AleO8MF1mi0I+oUIPzkBQf5Y+F9oZQ5U4zIZZRDuXMxDN/j+Z+oPFez75
         nI4zXAck0wxrT+kCxhUO1PeOaFrg2cviznJglmoNWH4r1Xt3NoVAeRLVoDCqc+YqFbKt
         eUJERsFnrQDk8xgDZHLsnks5tg8ka9TzmbO6SeqgT6DylmLoCcZwJzJP9XdlSVBOrSiQ
         9PKYvH03pp5hDBslY3XLCCvFy4scQ/jIIE6wKBtbwwGNwx+Ikp9QPSKT9ZTmU90HdQsF
         fm/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHwIab2WhSyDejiTWrIiEQ10+gUM1cy9lpz/c/tfhnqBx+VnUOwGDgMAPy3aJ34S22vHLv9TBd8+3E@vger.kernel.org
X-Gm-Message-State: AFuF++kq/FX1wVOqaWBP/pqQYdPQyBfx/aHnaytmX0qWX4EDxct3mgoY
	qutVZ8Jii3mN/OVcablgyeXDAmBYxEoxOVz2Pxj7HhMZA85K7a57UPMj1K8bu/ekkVrwbVJUCeI
	N3lEjQvL7nyxwH0lHBnu5mKuPQ83kLKcZDOTW27JTKe9YjfT28t6ARhoxeYCC4i4z
X-Gm-Gg: AYBFou2diEOEkVYffSTjwYKPgWdseC2xNwWtnMvmbLYn+7qdOY2H0mEhc2mra9TffGf
	qCzWWtjh7o7isER+PFTbI0A9AjEs/FD5Gh87OCvAfyQtRnkaKjToEvpknshQxwK/qK28o13g564
	V6o9aUBm+8mCnHLy32nIvApi/48fAsGEVKPIgsh69vG23EfkqE+grKfOaPEV4NdTG/dGlDSk/Jj
	h3hRZOkWnzOkvMplSO2M1RZWe/7aySn4Kr7z4QLy5qULlguOgOuLahjYg9nH7Rv/nIXp4SZhW9P
	z5lLO9/6QL9k1AhKIyux8gAED8GxBq6qS0F82aO+lSTPT5ucyr5xywhuqbwPthIstVlF7fxMyqC
	T/EWOTmwChFLpK4fArdnR6gXnxCgf4Zh+kFycdRFY4vNmfRwh+HixJVRakkOBoOanYFYiUl5I6s
	Q=
X-Received: by 2002:a17:90b:498c:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39df1148fcemr1935596a91.3.1789379671078;
        Mon, 14 Sep 2026 02:54:31 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39df1148fcemr1935553a91.3.1789379670674;
        Mon, 14 Sep 2026 02:54:30 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:30 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/4] media: iris: Enable Iris video codec on Eliza
Date: Mon, 14 Sep 2026 17:54:22 +0800
Message-Id: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7Ep2oC/z2O3YrDIBCFXyV4vZYxEa252vdYioxRuwP5aZ0ml
 Ja++5oW9ubAN3C+OU/BqVBi0TdPUdJGTMtcQX01YvjF+ZwkxcqihdaAU1pijJ4Ksc9L8WmkB8o
 ho+6gc+isEbV4KSnT/S39OX24pOta3bfPUQTkJIdlmujWN+aodJvd0eQMOrTBQuhUDADZKheyc
 ZCNRoe7ekrM+B7VN/+Ttsvqqcr23NDX2XGk+Sw3LUG64MBqtN2g1ffCfLiuOO6vDzXE6fX6A0B
 V4UUDAQAA
X-Change-ID: 20260914-add_iris_for_eliza-cfa43039a976
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=2318;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=V5CJpCM0XrV3ogUCuYsGqhnvSdSEBR8TeXV13tX2vic=;
 b=bhO+mbEGmJxqYK2VUjCFEqyAUvWBQtngqlAzEZN/hQX+swSGhVaF6idZmEyiIlWmFQLeCMSEu
 DsheER+coCbDbDrftpinlDVijgR1xOW/IHUojRyc7AH9qySUqezNWGp
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX+qiJ079k5+X8
 kCfxDAgaaVAHE05ZgNGvBqBjgEvev8maAu4z4ZPbo7rmZmgbXorMiCR1llydbST6Yt7sjXabl57
 6rUGg7CacpWEgm9lk9E8P1hhz0sP8nY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX53SghxkQYzuI
 XiEwnSQaHwT25sxmqRn21waZSAD+CLvba13nGMP6SB5rZIbfgwyh1TwN93RlGlbfp/yfjAfhkOS
 zhL3JNnaadmG/Ztx7CgdehoU/Lvnw5RN7uYDS28wWRGSWkMxQd8tv6U9UvlexCe7jr1d47I+Xd5
 BBUHkhFt8sCMd54ja163ss0dBnNDABPm1oKgPBzSSoKRA+PctDZLMV/DRl4ilad2Bm6xh6XuTMj
 SRkjkGlnoMMvy7QxL44NCXAVGmgPMNnVGcc8J157+Ue0wlAj6khhRAMmBYXNdJSBlDC1Es4xmiQ
 57BPVbU/Ilk8kuzni6Ibzr7K78jBJmoXAaLZfij1KEbSV4PHLj11WPHoT74OptQ7lP83kfdL51V
 aPsyxinYTtLsRGrfWBf5WvSDWtJfNurb5fZFgEqHxEWp/dq0M48umDfL8Z2ccT7jSP4uLs1608O
 6IF8n5c7IQ+LD0KtOLA==
X-Proofpoint-GUID: dh_jInS-wP3S1BqndBR3SjWylDwQEBRH
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7c457 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N-TFuj4FxbnEaaYKstYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dh_jInS-wP3S1BqndBR3SjWylDwQEBRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140141

This series enables the Iris video codec on Eliza, allowing Eliza to
use hardware-accelerated video encoding and decoding.

The Iris codec on Eliza is based on the VPU3.3 hardware, sharing the
Compared to SM8650, Eliza has:
- 2 VPP pipes instead of 4, limiting the maximum supported resolution
  to 4K.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 225/305 tests successfully

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (4):
      dt-bindings: media: qcom,sm8550-iris: Document Eliza IRIS accelerator
      media: iris: Add support for Eliza
      arm64: dts: qcom: eliza: Add iris video codec node
      arm64: dts: qcom: eliza-mtp: Enable iris video codec

 .../bindings/media/qcom,sm8550-iris.yaml           |  2 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  4 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 98 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 6 files changed, 154 insertions(+)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-add_iris_for_eliza-cfa43039a976
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

