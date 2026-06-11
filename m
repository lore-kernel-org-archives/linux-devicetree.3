Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498493655DA
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154010; cv=none; b=D7lTiMpA14EFuE4s4wSTsxWoWSPp9rzg6nCHT+2GnyHg6au3O7ps8h2lnEgduS60DlMY+rzzAAwgSPzy9nWEdnAJBUR+Oo5eO9MEyE/wDytgQye0zyXCKdW0dA2sSRgoTCzkR8HqmKcVJcx2OP0Nk5B3QXeFUOhKzzUy9w94gPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154010; c=relaxed/simple;
	bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/6Qgw7L34qi9Jq81z2/mjrLmBkP7ZiJ99pACy6qziuFlhAqhh8UTt5E9RtfCIAdg+HdwzpOa9TQSfX738byTFCuDX0ySFZ5uEGQCSnJtN0ZcehTReWnwnBtbfeVea1NDXOnlWBP1prH6mEIi/6l6Z5Va+TZsQ9gXxkzJIM2EK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5PpCGWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0vvu5pU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5PpCGWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0vvu5pU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NYXt3212528
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=; b=p5PpCGWAMzlK51sK
	FwvuXNFjaA1D5gKuOs35ui9qkLO+OVndgeTiP9LuHquvZkAEGftZALkqFJmBlEbb
	mrUFt7/BZ0kSNTfDriPNjNEZEYazDpOHM0hkEuI2q6PUcInmiMTlnTaaA8qiQC/B
	wsrdj2GUg3CVzx+PdZj5KJlKx0dSC3erOrM0MF23O31MtU2AYeLYhVP8/sGz/g6V
	N+V5FHEE7jYGWsSNmQBX5qtrH5GDDVE40DXbL26bWj2zR4uFQtg9duWQI9C0VhdB
	70qa87refKLPAsese2ESCPRpHNNuYE80wvM7XmiKZTZjnLXdkL7aD1Blx+OKMy+v
	fk9wDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701nbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo36765425ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153995; x=1781758795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=S0vvu5pULF1eYrf9oIUkakcqJ2rl29+ZiNtUgIIIlmtGUCPvUNcvpBOE8lIXVPtE+9
         7XwXXY52wQ7NJKY30I1XVxe3/IJFYTTsi7M7MxsFCNs22d+ZymcRWGjRjp5Sj4Iam4Zc
         bQxwek6ckktgEqa6cEwes1OuResnYu+vw4flAjCG95fSki/UkAP5LBN+eYyI/Nx2g+Sq
         4g6EHVTkYR+dpL7hYXLhnZa59c69uZRUPepWcuuHjC2fIEb+WlWDn8Fj53HKoSP12/S2
         65EF0G5Bo03uJssOi5q1F/urpC0hYhV2hQrN7U3QVmyxTVYVqLZ2MAh1NqaVRzslbNek
         cDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153995; x=1781758795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=CHQ2MFRocq4Se6oQ7iv4C4Or/l8jpiXhgUiZcAOADVhLWSQnm9z6hcvjtOPosL7tSN
         x/qMY5XrvtACd8B8nVEyadVsJMa+LfR2ud3nMH7RNAyiec9S8MoXp5n3B+6TWE94hy2X
         nf5ATSfCE36kuKHqGFb86dY6SKfo0ttXHknEfQyao/Z+TUawVfc6pdjna0CZFlupmYTg
         M5Sg/OCzTZ8fbbx5TC6WMHuUI8elv/VABYkIRr7ox/xMlXjo4UyNOqehRBq9AnAa2a9W
         hM3Wti5YW6XgyqL0kz/lFj7y1935N39JYhPPhQc078KugGfoRsmeGmTmSIqdLtHtnUxX
         wCuA==
X-Forwarded-Encrypted: i=1; AFNElJ+vnlK7Pw+SJBj/yGjj9Ounl2qIHfEI4Q/BW+cHFu+DQ59g866Fz2Geu6L1kiIMsN5yY+k0qHRMvSuc@vger.kernel.org
X-Gm-Message-State: AOJu0YzLL2mFMubM0fvySYR84m9cMdOuW2p2sF7h8sP2nS1wu6RmzGrR
	43JZqCKppb8FovHNmj8HsQf7VlZc5Bhisb4nEYESU6PWp33y6lMX3LJplVEwOeteYEPsdfiNfoO
	GposfrAwXzHqCUZpUgVmpV8LsW+4zxZtnM86A8TbSrZdRKzXF3MVVqEoLloNC+4fUtRzb0t2u
X-Gm-Gg: Acq92OFKBrwumUt2yWJaUns83E8k+I10Hx/9YsqGyNbTd1uvajlPj8qOg6FESAmbtX8
	y2ERf8Tqw+HZERa/+bMnCp7wj9Yp5h19lTrfKr9LcyET2V997i1SNaBGg3r0f/h6AICorea7PWr
	prLwWCLnBbHWxdRYkr7/s2ghwMZH48emRJRE8WmCRTiSFntZuB7Ch47zxuWtSOzNkbdne80TwAk
	6SPgLUjNIug7Q7uImacJF8T1apPHNf2o9w9r1mBmXheaWH5JtgSiRmlPQldbNhxWe8xbIoTbHD8
	LYPbO752PlC2oz428QRjCvDfNp0uviP3gkj07Jr5YwAVz2xl8gKnBR0aZAdkS7nd2eGeimVltYT
	tEkT7oqRVUBsf1J4CcP+m2iKaFmB98ii1vj9kYt5JNmtH9eiynUlzY26/KGbNw+2Jh/U=
X-Received: by 2002:a17:903:983:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2c2f23a7328mr15034395ad.9.1781153994668;
        Wed, 10 Jun 2026 21:59:54 -0700 (PDT)
X-Received: by 2002:a17:903:983:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2c2f23a7328mr15034135ad.9.1781153994198;
        Wed, 10 Jun 2026 21:59:54 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:51 +0530
Subject: [PATCH v2 15/37] arm64: dts: qcom: lemans: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-15-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
 b=LmgkTkzUvDAmQCQl1RiVbHEPvZUZ7pC+Cqu0xRCsZE/yiAnlwfaFnwRMehLwbnB4E0MdzCHD6
 OirR7//cSx9CCVRqtmLwS386uKnEjPzviyNGUCR6YdBmCvkU0rJdxHx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 0b511WOFFH_7-WtAKjLmU8XE7bRpI76s
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a40cb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX2HNSGkyPQ7o7
 c0J9tgdCVFXnWmjIt+qrl102ql1YbK1XMY1rIXY9nF97n8Xc4mvrukeisBo+71Z+hE/Zw67fTb5
 VlIy39MATzm3FW+PMwYGTOBlLH8oO2AnbEwNn52r07jintP/sA7CNKtGUeMafImKrH0Pvb++zmh
 U8RAyefgM9AzjemFlDCenG5zJC64xiAsHOxiM/t50ZV9y2Z+9ataIuiQKnAgBeNQtLiaYB0+vnG
 ZwhTlPUXcVjIeTVYIeaMR6KZqpHdPduagM9IeYIxecQ406G0/c914k7pOavsjA/H7RrEYLweMH9
 bWO232sCtCZ+bTb6woOHbwA0OMSB/xYWUgiZfzihyqLLi/Ji9utkfDOEM/+QzQk0dEe1FAX939m
 F3OUzGZU3+sX4cwHX/LQsMKBAOcbEjDv4+LvYTZ/LlhWV4FbD0wJ7KdvbtRLCpwB3Un4ariJhQ/
 nNO1StGcJzsCvOB4fwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX6xHKxWayhUZ6
 eHZHaJSkGrakwM0Uz5+thFNseVBH8LOf1kKssVnb5zCECB+hm+yGgO2Mf9rGXgym5ZyTiL0chIY
 x9c0t/WD/+c6Kj4JKiV8v1+RODfXIYE=
X-Proofpoint-ORIG-GUID: 0b511WOFFH_7-WtAKjLmU8XE7bRpI76s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..fe9a2cd325d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -703,7 +703,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -720,7 +720,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 31bd00546d55..3a6d73b485a9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -854,7 +854,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -864,7 +864,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

