Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6FC496D5A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988344; cv=none; b=lwK2O7vTP6ha1oWAIPXSvNsrJTOEso0BF8edvGBuHQ6y2s82HcCEngTtFW3jKlePqldRF45cWzOZq47KJenChFrkZnEQyYjDSB9jxgbmUtsMgGobUqwW7rL04OamdTpAkE7rH4m1mdFAstZjQBRvt7XepWA2AGmX0KBQjWeejzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988344; c=relaxed/simple;
	bh=WbRARIO1/TWwRAYkZ98IWSIfbhjomj6AvqrXUdfyKts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qf/wf0LNjq+6aMD88JdyXyv4HBcp+MzruizOVNhZNZ48W6mnS3s0zeijUEnaNApmiI8tctkpZQuhDcn+ghLoHpbS/5kpDLo7vlWJFh6WDOUwSlPWnRyzlmHmGzzSSY4tRPRLiskW6uh3wlrARKgJ012yahdrmJ3bdorfLvl08us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFlx1ty8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPiL+23S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFlx1ty8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPiL+23S"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxK91563458
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGAVhDoa+/o8/9WqrqkGlwFP2r5vvltUvLwZDgbxems=; b=oFlx1ty852IYEhOI
	BSfnRhvKHbTQHhpCH3rL+1egLetGNfkrS81jGEVqr05xQe6qqCEH6fq/gIyFk/nz
	1MVjwSIKP9FqYrNXGmpq9olqSraP+y98aNzzALlBuhT9JS+M48RGW1JT0iNvdike
	lykq6JqPfjecxOCHudOtAT/D0gVXL8bnwZrJBEGIluk5s/8WAfAXSsJb0At6RARH
	GxM6+GUSVnrYYg3g1zM4RFI++X+qZT6ZnHvz673NzDHcuHbV3ylNImPzq7/65dQi
	TJ5ZAlBViyT69VfjxFcon4jHEQHfAgDEWvGMLFxIb34xWvXfxuAW012KqxAfxzUT
	BmCrwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0x6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:59:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so4365197a91.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988341; x=1790593141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGAVhDoa+/o8/9WqrqkGlwFP2r5vvltUvLwZDgbxems=;
        b=fPiL+23SqLrqJpX7wwxcEyneVHFAqQQfAKLji7hegkxMpjtt5LoR4fH198FskeMjBR
         BGIskjJbs47mZtmsI5/0oFQ7560cXc4cN9I83W0cMAd7A6XX2pczhfkdd7O8wKkT1ucH
         JzeVF38fXlfCi/pBL48xFdtJKjndHCR8/tYvpFSVhdUuatoR29V/4dMI+DsABSJVwyTr
         /NgkfUTudmOviu4D1S/J540B5bHXhokWRiy5b3/LXqV24XTZ3id96LyBZRRWJTP0bQZw
         1Rtkrvj+VMD9e6t4sAf6Uc9ayIhprI2GRFFgtut8Q1KGwXHoforVU1kLrbMonGPf/LZ3
         ELVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988341; x=1790593141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGAVhDoa+/o8/9WqrqkGlwFP2r5vvltUvLwZDgbxems=;
        b=ykDpV2AGWGKI7jjwpL5UbNIw35AVXhUAzVzzvz7DZohDqHdN0iF/VOyR5xGXcH8yv0
         3LhMlGMZCu3IqIWGVnE+us+pvyPudn7S5hwPpR0yGbaHG5pSx3xRsZNxyP/qpZMn4vTK
         euAxa4u32jFD+R6NYvEKv9b9IvRSC1s95PKybiCTJOSyqljURBV+19RQ3Gq4GCaWXfO6
         +Z1T/NcmJq7L7vttk4bVwd6QUQhUHSfyl+1VVBG2vC+IpW49qVYXfyC5U6HqwuRrniQU
         KLB5M1j6wnrfF/0kYFDGrLvrfPL0uSqezVyGDN/7bGQ+owk4UMLeDVoHHZGZgkyo/uPh
         lmDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQUzOqlBivc7UeckZasPxP7imfKNFN9d7hJ5EdO9/o2lEyF2A7dK8HSl0fJv/84IL7qONp847YL+zA@vger.kernel.org
X-Gm-Message-State: AFuF++k3yH6SqOP2apZ8wiULKDLFu30BFtNVC7cg4GGxpnhoRv1mOwU9
	sPNLX/j9XpEuG+S+GwT2NUkLXNyy57u0VwJB0WoESwzjilPaOAxdssVXg4ITCqiYDxEwD3tEtAC
	AFb1y8Ot2HDZyLtjA7g5qbb5nZY9pjXB21eN8n0y1takzBi4DMVU+hQ3qy58lTOL8
X-Gm-Gg: AYBFou2U4f9byPQ9+hq1y37uh1Va3pn6nDFRAZz0est6W//yTO9yYHkY7fx2A5tnvVF
	dGoV/vVWacU7re2gRF1/MHehRZxVKmx14Avje7q+h2eAFpOuzWFlBjRkDFcIgcOlaHhdrdpZ7kG
	YEG7NaDU3EiQdkwB4KZAbY4KB4BdbxHraiqRDEkatlTeIwgq+4mHRUcr1bXxs71IOS9hmhjtwmH
	v+Ro0cIYrkAoKH7VaEdsfzqnd8y3H0RUxBrFHURaRTC1okNrQ+qPqxh9IQPtn4KUWc+0bDpdIes
	AWW3jBMUxgIlU8wpr56+4TfuvjlFpuLyRYwqxESqNUkNphxqbiQM9gsVH89zI8lUsagNxCPHW03
	3Qy7In4FUlk3E0u5NH9vFpkjvuio50C/Ptw==
X-Received: by 2002:a17:90b:1347:b0:39e:6c68:fd8e with SMTP id 98e67ed59e1d1-39e6c68ff44mr6442022a91.35.1789988341066;
        Mon, 21 Sep 2026 03:59:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1347:b0:39e:6c68:fd8e with SMTP id 98e67ed59e1d1-39e6c68ff44mr6441993a91.35.1789988340585;
        Mon, 21 Sep 2026 03:59:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:59:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:16 +0530
Subject: [PATCH 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to list
 qcs8300 first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=1098;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WbRARIO1/TWwRAYkZ98IWSIfbhjomj6AvqrXUdfyKts=;
 b=EQq+urTQpBW0hMMCDp1Dku9OvNG2uaQYe18LjursrmvHtoLDUxaDE7QKX952o2fYut7NZXn6n
 sU6PgULGsKbA994AEH50YhlNqkJ2k2wqTzLWaNSQxbexbmcUHSvW0bl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX4uukhxfeANrW
 5ijcTJjhntnYfQQjH5/l4Us3hM9EOwn0YwbJGUEGMYoMic8vGVPiTj4TbwBO3QEoalSa2SSrDjc
 ms1HKSfu308Z53/Yw8pFt13KnlV4kAwhFZz/RRS5Na68TXoaMC0lac4GgJ5oIAr3iKgJavBQtM7
 4+Kgy7rxpPVq9uaMRMByYvZNYo67CAXKqi2T5/Ohfpgd9DYtxesmFM4D1JVbQsPMIFkfxERo2mI
 eaadewN/f4c69lSST8e0PFcTPT+p84R1kG2QUTV5P/U0nIjoLPsGf7zZygYmdH3LVl8WORbSlWw
 68Cyk+AaCMm3KFGBwn+I5QjaWgHVCyN5h0WQ6q8sBdDdwcSSG3SCLqNN/i8ZNAxKznjFXRYfBz1
 vfM4ezoUfGfNdNTzKr/hKXahjhN06lhwQ76ynxX2y0JCmnrW9dZ7Y1216eJ8LEVT7zqXHcsqh+A
 CYAXnduHuV73Le617Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfXzRyy9exjkZlo
 irkFWpNP2rf2MKAItbTE+Iumz8KY2p9OA2EqVGvOtLsRn6QWg7Va6ScN0d+HMxLbFr8jmJIpPa7
 B7Xm1G7Ukw0t1GxjhRzSu4QgtwxWHU4=
X-Proofpoint-ORIG-GUID: 0wp8q2_oRGpUAS-NgYDycFmhIFVZ3Ifg
X-Proofpoint-GUID: 0wp8q2_oRGpUAS-NgYDycFmhIFVZ3Ifg
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab10df5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210157

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..d7d135e87a8c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2597,7 +2597,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

