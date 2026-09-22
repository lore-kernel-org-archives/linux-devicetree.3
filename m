Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05814EB85E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115131; cv=none; b=DUDIkcgAbRp6yeGz+vwkTk3UzJQICshHhkMys8Xoue2eFxOoy2+5fSFuXy9IO3ECq8v3V3GxO7ORTAI06LKRjqHz6PZX+SNgv+Fe6s7L+Hs6q8v8x27wT5a9IaIkAGNRTIBkLZ2BGWVkPk2RxEIh7ZTJg8KCG4SB8VPq9aQBsqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115131; c=relaxed/simple;
	bh=Twip/C3mRSt6gu4wo7catfd1T62ZT3Ril7C7SiKejnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzwUQ1sSEe7akRXjYSIpL6Tp6XVKlOmc8oI0Vmtdri6VFGTAlxCQXg54VXpHJ+S6uCenszsHDt23a1kx/4QxKPH5nAA9zsGB7tWXinHM+G5reaTa1AJl0n2bdDV4ESRw1cFn1oPhY0Nfv0SSdPsfDA2enwkAUGEJvKOnBjDTEMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlm+c5HG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbcIqhk4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlm+c5HG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbcIqhk4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CeL368055
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/MVYf1j9dZY
	8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=; b=nlm+c5HGgVtlqUDEzS7QRvCf7rV
	N5JF6GEcx+jQYz9jry9x+tLIb6oJ1gkuiEEuOdlW/3NcVZtVaIR2I4XqIbK6aHdu
	sO29dwbVBry8WuERuZEnmKYEc24xkMDf4V0/Yjz+XVt8t+6GlfTyc17jvr8NM3ZQ
	sz7sayOUCAe4U/XJ3Itfe9y/xumdwn+005W7dg4LN6+afUfPdJzch7vqoBbXEMk+
	dURvoSKWSeYFZeafBIxAJRVydhCffXynVgidlwZ+sc57zaEs/hTWdThOYlj7nuqy
	OC/nU1VT0unOtPSNAVETr2eS5oRu9ERm9Kmmj4Cww82twxn5lXNwMfIBG2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntb7f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e80ce3597so8228466d6.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115114; x=1790719914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MVYf1j9dZY8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=;
        b=cbcIqhk4KPdiexXGtMy4Ts/L3HaElytrWSdR1dnRbYUE+4G4QpzUE1ECnnhEkBo+p9
         FQb+D5zEgW12sw844p/3YSnPF7ipy5cMp47kxJOE7qU/VHgbVrtbTrq6KCP1i+99tmkd
         mSxsCTY/0uhqDGNYFV9tO/G9lXQlHV3FnZ0RT2WA5nT7KNG/tNARB+M+O7jnhwcyJT7d
         gxcTp44KUwHblatS14Z2ES1VaLPllsYFkoZgR0zXZnuPYEzOyx6WM9piDGWUfDf8E4a/
         uiRRBhRE4B1xAUF99eO/2J0IqVnnqqZBLrBDAsyuU1lmyNG78fCCXzY7SEoduzIJHkgt
         sFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115114; x=1790719914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MVYf1j9dZY8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=;
        b=XXMQaq0HVMh87U9F/W1Dg85DSJVnvIeeSORTg2LWd0UFIb9Aa0rmXhaY8ckcjiARqU
         1rQMC6Egha0pnYeLgealnSKHPueaKQYI/8gKcILkp7FzyxqDWJE+vbezXkK5NOcwd84w
         xgRj7X0ahtiP5IsWu9kLP0RD9Do/DhR9KBSyTt26LzLT3yDC+4bpXtRPSZOYxTFsKgSA
         5+HfbEfbzKTC5WtULSEoIeD02uAWEgrVwa+DFkNt3E+zzZIRyK2F99Oo9xyqhjGiQskC
         gKjJdY2kXArdgTbnjyH7F9NO142wZcEXjEGL6BQJwnf7RlYRQnnXf5iIp490sMzfMCkH
         WUGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtKRNX7oi8CVAAs2F3bpIHhyPL8lfWa40mUhQ8NK0diY3surVNoCBLvixEm11DpqupFZZHQN9sM8T0@vger.kernel.org
X-Gm-Message-State: AFuF++l4XUIIAFZ18KwMHPnxiobbeyQNZaI6mZnhGJZsMk/sT7f0Y8Ef
	4EiXJ/SJXcTJACZDWdI8gyfC7dliGCqgDdz5FyP+wcrLl6FM6Xy825RQGBiJ3Wntxz8rllhctv7
	QUGuxheuP+xeAf4VIqsovSvRWaVSWQtFnDGf6DO0XqFvtFfLg84zZd9pc7hazYqjs
X-Gm-Gg: AYBFou05/XGm6an6l/jGcgqOmmlsNZSp5GFOC4x1op32MV1ekpthAOLFDHqeareHs2b
	/QZ5YpPsk7oqOi0ibTY1EEm1xqT6Ty2ZCFm2toFVPx6g/B+gDks35SJiZ0R69waZR+JRUceIcqk
	ShRgc3l5Qw05TIzuX+VIcBXw7bK0Pg38Ry9W1dQXYfQNYI7hOHwct3QjdgeAeJ5E88ebJrapJCR
	0Sk2EMCQaNoHcqQ0D27vEtMNKIi4QjwSxIxIqxGBGZIq9zmkVM49ebWfpS42L/Ne0hXzu0Gn/8K
	IlQQVdwTczKyF15kTTDpEPeX2QcejsO6UYfSwCVhPurUo7VG1IW+HTF5tGcgSII91cYc3IgoZWL
	bTMgorzR5ORJbds0DXBxW1WkxjLegzFCbQ8RE71wfgK9ycBX3ocH1EF97t70fG3KZ
X-Received: by 2002:a05:620a:19a7:b0:939:feee:630 with SMTP id af79cd13be357-93c25103981mr127196285a.30.1790115113777;
        Tue, 22 Sep 2026 15:11:53 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:939:feee:630 with SMTP id af79cd13be357-93c25103981mr127192685a.30.1790115113428;
        Tue, 22 Sep 2026 15:11:53 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ
Date: Tue, 22 Sep 2026 23:11:27 +0100
Message-ID: <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YYrP8EMIaTJ1gUz1gSLVjrMdAPp7-IWF
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2fd2a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX6sACXl0teceP
 tBuEPzyXsRCIq014CWcP+u7WqxcJQWh7ICVLGoxi6FIiT2kmUuMCjcathJyXQRyA1mffUTzWk1z
 3CBgGzYR5/7m0kxe1mgLlp6sfGnzh+amIhwnTNJUMt8NJeZD811/rvZTSsbXOnyxUmPE5H+WP6B
 d6/RNOJn7hVZpTMQv/MmlXWwd7fW634jsJp1aF0vGcQImDm2qIGRJwHpYqAOiM6T4EP6sAUVDJp
 PWKyDDCvkQkQ/+rO/h7IB53YlaPCCACUf7l6Fp4vhLL+agDc69I/IFJ06UkuCCmvpMiDGds9Do1
 eHre9QpYsGiswFXkCOt6/rOn35W04JwjNCiMu41egXjiaINlphXzLWWCna7jsxUnihNLiXZ0TqU
 Kd+HrS6NvUJSzen4TEJluqCgpVVN4OqrHEPtpKmJR9NuVKvS5Q5kJWpbuxCNhG3lIkAC/PURdNI
 rdXnaVR5cMkBJC5cBgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXxw2Zjtn8FvDU
 H0DAyxK2P2rmYtK6DmjYAPteJf3d7oBF26OwihHCm0DT2/rv5IlpgIBsepLbQ80XmRHNcTTRbHq
 mE3WZkJRG8XsTCMD2jI0RxHT+4ZCXbY=
X-Proofpoint-GUID: YYrP8EMIaTJ1gUz1gSLVjrMdAPp7-IWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

Enable reset controller and pm4125 audio codec driver that are required
to enable audio support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb6..f734c413dba5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1168,6 +1168,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1586,6 +1587,7 @@ CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_GPUCC_8750=m
+CONFIG_SM_LPASSCC_6115=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
-- 
2.53.0

