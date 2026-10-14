Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84C46D547
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960079; cv=none; b=aUYQ0y0L+6A/rg39LHswvagFKWRZ4BDYOYpNQM0rB649fgGscWU7WNM3IpZxgCYhwdqbEeRmbLrjHEU4trrXRIdmikMeBz1gdPt7a1aPRu9rqCeOhnyHUGDmySUgEyg//Uk+2qpma3FodfnjSnUw582zUW+rR9rXMSH4IBRv9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960079; c=relaxed/simple;
	bh=JEjls+AUhDEBzSl1ZPW4WOgZahhSkF3N27UnRS9UlAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKyA6dDX5yz+62+MftsHYoJJnFYII2n6+2YFtvdN5xWM0nNYt3c1+x8ExrWaZySTd6UwwMaSs1kWs+VoxCWHPVYVmVb8XlQMtZiLI4YQesWB7PvLxuYsQHPi5/DPtZk8wcuY00u6m5KcDzWIeXht4Q9PPiw89MryiDN77ZorCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvDyXmu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWbfHBKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvDyXmu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWbfHBKr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1Ippc3017705
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xwb4/DRPYW+
	UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=; b=BvDyXmu6DqKr7z3izPuxoJAp/tS
	zJcl+6ODjahf6UxsBFJGeMSL0xRIM/8EX/+yOrkpjSFcMngpIqmRPNzuYqGsZ0oi
	FImenWl+w0sgQqkNEjl1LbUlQMp+PcLjfOnhSvSGnnj5iV6z6y4fXg26InMPxtBd
	l8DmHU4wbqE+ZjpURmoE54RyB9KfT+bZyKv/3Ff/wp8JktgNc2w5Ld1Oxiiye0K/
	UiIMzhL+UcbpUdzxOe1NybTe0k2A5wLjpHftdKs1QD5/oSmhrkJ3cFoKwE++5kkb
	3Cli7E25KDVwjS0dOov2SchVrcDr5R7iAusFIS0EDXJNZeYejWKE9PWhLYQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2ucm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so5292670b3a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960077; x=1792564877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwb4/DRPYW+UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=;
        b=UWbfHBKrH9WONMvovHR0+aBk/FVmMm0GGIsagKob6vdS4MIc90wCrcs1xVbJ1jGJu3
         IWAz2ZZgmGztsI+gXTUu2CYzE2KaEVHsxzRdynw5qdxVWanvJfV1ns2KpP9PtaY5z7EE
         vGnpidzWn/G/YF2EUfLYKVGRVnC9kd1b4f+sfaIOWrrSawTjKtaDtxegCD1GFc6jLkaG
         3XGSTSUjpAKCrU9rCk+IFOLIiSnWQDI+uAp8xLUiTDCSsgzQN3fF8MRE2W795yurEzGT
         9ymYYZaWKEstoTazy25t/VEKQ98GqsBDJRYImnlzXshkrzt2UtZSXGgo3hsJY5dhBafQ
         sxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960077; x=1792564877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwb4/DRPYW+UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=;
        b=U9NbgNPhl/Ja8DGUFQiiOJZRIjNWtD3kdtmjUKQCm/Ncz67T1Tvn8SA4d9xI0/SJR3
         rzkmGXJh/jvalpMHFFZUD+I6xeVtPc8bqrLHwbIaAlPml6xvKgkhUw+et/GxySBI/pDd
         fxsG/iUCvQr+kmAY9FvAqQH/k8NK2aghMz0m06AZm01PyHP0xtzkjwnu+7abW8pqcfTH
         mokGAWOlpNMtWnSt0X/FY2rbh8bB2WDjqUmilIfH2eOcP862ph3fCy17mHaJVgm27wMQ
         kM+YS4wrUBnwVtlo460Vi3qRVyLrQJbAeKZIUv5pjLmqaMaRK3hq0Blao4oMOolGYopE
         e+aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL9tEfSJWZePgRnqiAFnQDbKHpR7DZSzqiK6kVxtsQLBx6fL56/IjH6AxF4uWOZCxAVXL4mqNXdcEx@vger.kernel.org
X-Gm-Message-State: AFq9FYKelaj9PC1fl75ZWDXoIXn8AfMnSv0vNb1AVx8t3Ff+kam5xT48
	axWZ2dFWoArYu/DBc2L2AohKctC30bcme7G1KaU76YeWVYyIOrIju+fYvS2H3KF5hB5iuhx6l2t
	u6Ff7HzMfhOkTgukLX5bgHjC9Fbe3ey7s/U4KGnPGhm+XXE+J7ifEuKKfcTcRGhTD
X-Gm-Gg: AYBFou1ZkbKWLcLWhdvfcCGv0iAzAlyD3PwzYM2ieTJQ59II27uQaxk7f90OtYnYBzd
	fArif/YtJmTHRvbL3Tn5l57UvUfMfPqQRIbKCEtZ+eXP9M83FS4tffCbLXYjQJ6asibJDzyDDQw
	SV5+2K8LcvzaBWZw03QkYUepWYbWkk20N7qwfMHcv8311UfDEmqXANi+5CA6KybENxks3lZ9cYx
	xmt/Jd9KWkN/xCbUNr5b5QiJXS/t9gk3PrQjG0WY4K4VwlwwA9cel4zR2skplQ0Xrx2+AjqX1bB
	TtmqXAgqnR1tzQbQ04YCXk0JmhxiRY3CsJkyVq9qUtbK7ZtwXWwqDVI1f9EZH43hKIMQ9BGTMTY
	R84sHahRF8di9PHexGZAiWzjC+PZPDns4Ej7vK7Jhd6xsDOg/EENjaIM6h8I=
X-Received: by 2002:a05:6a00:7442:b0:880:8fe8:a3f5 with SMTP id d2e1a72fcca58-89695dc56camr7771640b3a.22.1791960076790;
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:7442:b0:880:8fe8:a3f5 with SMTP id d2e1a72fcca58-89695dc56camr7771625b3a.22.1791960076334;
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Wed, 14 Oct 2026 14:39:48 +0800
Message-ID: <20261014063953.549379-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf240d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QMtlPPnfQmPOGJbtzYwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: TecP7LQCVqibStbD9jds3st34osx_x_Y
X-Proofpoint-ORIG-GUID: TecP7LQCVqibStbD9jds3st34osx_x_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX8pGaMHgC2gMu
 iFOxqfOHcQrJcHpmhYeoAkBZR3Xp3V1pSRGA1nEfW6M6d4GaIr/Qc+Xm9H/mMANndbqGPxQ2wOM
 wz8tN9/Wk5kjWeH/41Ijw9xEs4C2es5E8crp3FFn1+HzgbS/u26dCUVo0S8ydAem59putP6YpA7
 JVWMc/R2wQgG+QyGypr5aVBrAypdlyCq3t+BssfpEqsi7WRnwiIfydKo+Wi34VshFh7r3zZVvNb
 s2B2a2LU/Uez5IWarz35nmFiBfAxqvxafaiigOZ+BObSa7durM7Dgv/Nb1YkVEYmB04mRsYacau
 zD3bW/h3wyhJs/Goa7v9KgkKdcRroKwNjZHm9dE6fuPZF7FEXJL5mTE8ot285aO6Zq9sBtYDnD4
 WuaWJOcc0bi53Uq4Hi8L8cTVDL6voa2nspCE7ylDAo3G/g9tIVQolDa33A4Id2g4GzMREN0KcuS
 XtQiSrJfpT7yJVmm6kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX2TO00Z9XBwee
 ekMCvWNoRJl77lewU6bVEJ7LZ9UHsDw6lFobHaFNWUgmsbh6dw1XJATguhONBX9RdTiUoLUufpG
 wiDyi4dsh9l20OZk86+kajRhh8gfwAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140026

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..0b0acd33a2e1 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

