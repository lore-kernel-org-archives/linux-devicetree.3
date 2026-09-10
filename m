Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C52493651
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046969; cv=none; b=S1czXj7/E8zn/oVU5V8J4sdKhs6mSEk1jpopA2kuysBjE/ToF0bJfdhRS+PvOW101lSHOG8NQYzIEOciPaUgfpTe0ohGy6botZPvQ+UzKJBijwT/rgvS9a/YI+k81Spbf9qQ8SElePptVOnjqt1Cr45Bj7VPjwBnYSkOfGARmko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046969; c=relaxed/simple;
	bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrG4GuP7NolI36pxqXSeFFB6PhazGYGhVa166asKQHkfM+EC3lxGx5Kt1PZUETUQIws6LOVGvrM6DMHeh18V/J/3P67PZRiul4ngqbDqT+S/H8c6B7DxBKrg9HiI6kUq0wab7Kcqc4FZTeKJ7yNZ8J0824/BKjABcN+DZr6TPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTrXKFJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bd7TtZxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTrXKFJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bd7TtZxv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7r5M1087172
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=; b=hTrXKFJ+UqnQ+F07
	BscKjQTqrSIDbkEF++cMJ57reszx5WYgKzTfbsPEqNfemBqvCEakF9IYURgzLIau
	7/Uv4odKI/w02cdObwUeZXC93wruCD+JYFmfTaULwhQSiJLhL5fNcN7wpNNd72Zx
	AQdQUQRctTaYN/aDeuJxOp3QGRsZgcdrvQDkyNVHrCTtdMDPA3HFx33FXDMmkwYC
	Pfn4l9zY8kQK2DjpHDr/cRQd/oorFo1/Hr41wmk6zDvxpyaJrf7u1i03YN85IjT4
	4aRIK4Tt8MFkDguE7xK74nboS75UtIoAXGPG/odCson/vvrhCvYZdrPPsMWcDzKQ
	Iq/sKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg43ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so531410a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046967; x=1789651767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=Bd7TtZxvwDn36vXsRzKDQclAJMW2OCgAtIB618vWuDNITsb7ZLGKNVJdxxlC3+kTvQ
         yZY3NpnpiF3TtAipnUhRIMN/dn+vVcXUI2/vhNLUZh+umojAKUIoxuggk9of0L8JtUVG
         T0Jn+E2nQq5SfrRzUvGURXL1c4UK64KXaVrKoVHNRfqgHM1KRZktNz73dIZA6B+eDksc
         tIPGOOUQEj0MSuq4Mixpl3lHj09Avtls2Lif2+y9kWspq6kVtzGyAPIBery3nMy/Y1j4
         OVu6+IR6temb6lP7Xn/54/XdgzRMbKgY6Slt/VDDLMdrx29EtKCQdAdd+bvGxgFdFqgF
         PXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046967; x=1789651767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=b9csxDb2fNkfkgj/PEaUcZRWtrLjAGjSYpzvHC9ho68sN2/MZFy05TO0QemHR+xsZc
         mpgzI0AQUue+JY/xMh1mCN8NFSDsUD1Aimd/8lcCSOJ57Fhfi3hgfa4LOGy2R2vCJmku
         dtEHuUGoIgwYywx+AId1DH/mmDu8dh44DM4O2WV5go0baMnhyGwauCGWLB9wHNlKwHut
         Llhkvmm64llltDxg8UftSbHoVvS4Fx6+AYKe1ItkWSM75X/ccJP3wDVTC9Od8DLzliMZ
         tSNJT6/hfNELytW/2rC9hmL2ZdQyVHHFKDotxNGC4mOH4k8oqbjQdOs7hL+pGRDXqbCI
         k2DA==
X-Forwarded-Encrypted: i=1; AKwUvBxl5WVmNkjvicuyA5hzBhO5T7CkatEfXyVa4xhz8K9uS13N2daJjhnuX2Hz3gvIRBU9w7FYwF8CTNqg@vger.kernel.org
X-Gm-Message-State: AFuF++nxXS9tPfanQ6jaN0sZCZ17DOhTvntodT5+Mj8lZc+Ul+grcuGr
	yHEjRRnxfkZwHPerUhSuSyd0cfshF1CFYrCVb2K3Q0exPZolc9Ckw/Im8UuXoxcDSQnjBtJ6d9X
	dSCrOr3951c4596CVH6UkzdG3CNaYDCnMR046kL8R7lSpLKfF5U9ddtf6+yu5mU1F
X-Gm-Gg: AYBFou3PYoQLGa/WNhXnh5LfM2LPQlaAwU1TVGMhbhh7T6w12Nm7mZeqAbHbjO0C9y1
	A1x+ztoZMxkiD8pTEs6cCcIg2MRKmfnKI6WBac+mD17Hxsbgsk3nUjHYpoicPtFg4znpcNl9jfN
	ziFjVclxzgOLX3ab6/LOfN+Gj2ysvGNl/NY1kfSRrMt7KzT7j86KPF1HssnpBXvZF7FExiuftfR
	qBkBLcOuaFauaL1l8lmmQCicGKj76dvuv8oOlPkFEobr5F7PleTfDDI6fpGUJDVWD1FfHcjNCdv
	HnXdlMbKBChEzTlKOp1ACKF8S12CPlD1C5kFpgIJYCBnlVVTMK3kGKvwNfxMPT1cneIqBXu7wge
	RDpnZE+97v47loX/huP7I75oyA5HTZtI0IqU=
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr59649129a91.18.1789046966534;
        Thu, 10 Sep 2026 06:29:26 -0700 (PDT)
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr59649058a91.18.1789046965999;
        Thu, 10 Sep 2026 06:29:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:53 +0530
Subject: [PATCH 04/34] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-4-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
 b=AmsbPYu+6kJVO3uHmK4dYGfOXYNWc9LtdIMyQTfDXH+S0zYXtWGwLmZS7Mze5ZW3qi5/rzqd5
 j3MGYTCYIpQDtTKuMb4h44cCq1Q/rQl+VIenTE1ZvN/v/GKQcYKXMd3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2b0b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: gEqyRAHduIy6OMf7Ho3cO3OH2R_PgOgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX1zP+IMN+Kdwj
 xBGBjuyhBw+xXpLB3LCLpJjM+FuSKeLf8aqkZGrWBjSmlV8VO/oHcng9HvO1ezMHBtHzBVvFKx0
 hYC8GB6EG7OGo00fQQTjzKJsTJylvDfQQ+ZM2iCMII3h/PgVbaB2yiXJUhSTsy3o6OBPYzjfA4T
 1I0W2d+xQyuvTdoHFmbEYV+bUeKQnY768ktrtIguzwfRjOH07/U+Llt2EOi0eZ8feBtKUbu5hSZ
 u6YVI5WHM0GmAJK/zSiQRWqN03UWToggh1Xy6MyiKK5kwgvIf5PZ0n/APj8oKtS9ZSRGdn+ljp/
 4kYGc6f7wpJynl/2iwdiQKQtVvJCc2B8ZA3NsdE83WLL9quRu+2yAsLQuyZBf/HNFwdHQU6XEZa
 X4MYKnQ1Jk5iKMk2zlCg/qCOye1D5TnQ7sD+1n9MyMy8JW3DoxG5PKjxWx3DoMfLrOHl/sWe0zj
 GEYY8k2wwVC5koBaTXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfXzjVzm9A5izwi
 fnQneabqqBET3+dyv/73FaIMualOLxhrw82C93okLdutnsf9Ny85uZN0E+U/z60hCClcD7dOW08
 H3GsYBswCyJIVibpr02AZnnK7Z9GpsQ=
X-Proofpoint-ORIG-GUID: gEqyRAHduIy6OMf7Ho3cO3OH2R_PgOgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100160

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 565e5a9979b1..e6ab523d249e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -492,7 +492,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index c10a936b320a..327dba55a5ec 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -593,7 +593,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1

