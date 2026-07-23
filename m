Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D8437461
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800594; cv=none; b=Zu7ILms0wAQNLrfldDrVCWCtcrfSDn9+mm/6ZP9HpL16e4MXUKuAZQ0dlmy3mfb+s4f55ambQzmmMSOW6kNhnoIkZMk7msUkFXUyzZkc+gZ3HzEgH1DWiDdTm36bvtFW7jMEytR/mztWRpsTylqSNpC8EV9a+AU8GLcDufXkm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800594; c=relaxed/simple;
	bh=Z1YzPRkvSQgRUC5fEUq0+vq/ZZQtekWi6cALc5Fjcg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDK2Mm83uYqNYJZ0JorjCLfmiVuYEJ2bIqItspg6b1LqLd1s9lqAcvgOdRXcKDrrgWLlIynqEWZXJxqfeXyT8Db0mtmU+xaXplExgQquioH8g6sMi4HUCsaWojrotXxSmoQL+c4aezFJhxXoIPs3C+oREtRXirvhtk895sKbS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyG5giyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyOg5LR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyG5giyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyOg5LR+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9Dm3R3567745
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4WCdFFh1fv8TYtu8+Es8SvOK/GtY9pgiFRGkpwNGHL0=; b=jyG5giyqS0Iqhy1K
	K4evGV/rhv1MPJBfUN2r6cL42nIrpq5YZy3TzFfnrmIkrP+/aZVC1bICNbLqaSmS
	nokPeMrfhfDNzNbuPHE0FWuQAITtu1IIE4Sujk/Zx83G05r11axBe+QLvDoYrDdU
	54LXQwk1zyhlsUiQH4YAmmyAelBZotKO+a4hAtcfzZTvcte3AzdqTpdCu8j8mCdO
	fu2iTdXdl64TMETIM2dsKCKqpA+iDfX9zPuVPkNBHusca+oQUc3lO65g0p9o/Mqj
	DW4tohWqRHMJEfzXLXY5Oj/YSyQb3GEXHcx1hAmcTwtlPaLJ4ikvhrnGpfKZH0gq
	zL8hVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg5205cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf74ab63easo1925455ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800591; x=1785405391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WCdFFh1fv8TYtu8+Es8SvOK/GtY9pgiFRGkpwNGHL0=;
        b=HyOg5LR+tsmAqY9Q3HxVWIUbNgUrhGWKopjmlBEFKUJk6oVih6duErJdzw56KA000g
         yigUslLUSKp6oBX+Nj1uWnLMev4Usv8EGXXeXAmimnDQemuQNDbJelXT2Iyzylq8BBbf
         j4uAXK1zaaOxGyTVpLRWkpiWtHQh5NFCUWmVmoGsHCZdALLIxkvnooMD5ip0MMgNO0vf
         JcF+/4CvLs9RY1iI0E7z7Oaz3NUb6TER/ph9qfo4VoCV+c5coWZO3sZJRmZmO9vSyZLW
         ngDixzGnD/Mv2V9jAwR+krHzGJZ1W8henxxzR0jPEb+iTEmLyVLel6dmVgmq9zlQVBxk
         A0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800591; x=1785405391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WCdFFh1fv8TYtu8+Es8SvOK/GtY9pgiFRGkpwNGHL0=;
        b=E2VJoczAQ0sN228B0j9SnvQy4c7ipxZQoC2FWhPd9bXAvvSJ38oAhZURsgyJjb+EH2
         GObXsiClblY6CPAO8SAjbBQZjxrnBbStviUrSZ+ZkXwwJv59Y1MeSsdA26ev0hV0Wa7R
         WBABQv9OTEDqbv7E42g2e4YvMPRY015Tvdlwp9wPjRMytZTXWXk1LHM9TJqO2IevGLng
         txcEgVwglKq08LkMnK6yhYQ5KP6KYMpo0Mk1bMGl8XCBk5FAyeQM6GuTDNM+xtOYEd21
         SYU4vQ4wd6P3NQBb/yHv7Sf7SV2tGHEAkTr6/ju/HVXQO3J2krmf1IUNlJEscVXgjO4u
         RN5g==
X-Forwarded-Encrypted: i=1; AHgh+RpWtx4cu0qItxoUPg/WgyubamxKdrAH4ko10uZSr6gB59Jy1wAJq8AneNwXWrj7mJck/N/HNe6SEXnU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6s2HD2+UU/0lvpBYrmgDzewRUkWRUcJzEpBYSoLijzqmsxHHu
	yllgucHkgCTROtT/J3JxcNr1mx/rZcMWahfjiTNeZoH0eJ9wllaUXgNsWsUt+kNW3TlEGpt/zX1
	viBtr4EJPM0vkUmJ4K8AggmhjxazijH9G7hDnOmoc0tefNDa+La85Zx6e/AChbr2b
X-Gm-Gg: AR+sD10camt6r6sr5oewmBTxBq13cEycnibUkiuucDul9QbNCPf5QMw7F2MyxNv5Shg
	whtS77wI+QMxHzte1Ty0U2A4PdEKKylgteRkmPTt6E6PuzBdOGBs0in0JZwPIMplhw02hHC+OpD
	T6EuoEVrAg0oatZ+ZmRpqdtO8lNO7RqVR2pf95G+HC4fro9Ise5+ZiQYl2fkR0100XEbCbnmvWq
	/wxT3JhhLyGIl2Ob18YkL+VowpyxflaNh2WZ7jMbtDxiYAfgSvwSI0pnrB69Nv+RpMZ7G9AYDvO
	KQr/Y5mRmO7aEKqqPX5Sc7USpnxWbOjUce5fbsd3A5cyZ/jB0pVYjpFsuQSav5QR1dLXIU+dKd0
	ZAQu9uD6KsSB2trmOD6AIIcG856nlSXCiV9v/sEQvoX18M3hsfiE=
X-Received: by 2002:a17:903:3508:b0:2cc:df15:91e2 with SMTP id d9443c01a7336-2cfa70b551emr21886215ad.7.1784800591084;
        Thu, 23 Jul 2026 02:56:31 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2cc:df15:91e2 with SMTP id d9443c01a7336-2cfa70b551emr21885795ad.7.1784800590594;
        Thu, 23 Jul 2026 02:56:30 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:30 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:26:19 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port as
 port@0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61e550 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mnwuuUzsHNIKvK2uPlgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXwLxgo5srOt/E
 3A+X0s37oQ9efHx8o9uIOvj8fnXxE4R6+hDzzYHB2wbTgdyFaDbzi5bAAELp1Eavw8U5lkQvxzi
 K/aLiJkrUNRp99pAWSQk/Ikr6U57Jlw=
X-Proofpoint-GUID: h2o5CPG3FypF3WfT4C9TlYmTaEgKbaTn
X-Proofpoint-ORIG-GUID: h2o5CPG3FypF3WfT4C9TlYmTaEgKbaTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX9nKbXH3eZwCf
 KxeYbV65rhq7sYK8fEFtzt+RwLYACe1EBg8+wsMWE6NHJ+o26hmoai6m4VN6SaB5r+r/bB5amsL
 ITklQtDTvaEbhhrV6jpqQwq7RQkKUPIGIzjeiHMcU5ZM8zvYE1HHd+3P9Zoudz8X2C1kZZMlCr4
 ocntqKcGVmz+TQmA9x58BsjE/mbjJ8t7OwYdpZADxtErDnvHZf1s4uuckd/PFrep3ZIVwQx7cPz
 vAzM/KfNbIZxcxDYB/G2eLPjOSWee9Ql59Hyu1nXwAA67XFlUF6Ei3crxgXfOk70/GEsE+Sqcdf
 TwG+Wvj4wHCgP4G4LsrWYUctnfruEXe/BRPtx1MoBHLGmhKdPZ7RXbu8VWRiWWRZFIbP5LzZxD/
 phPVQEtK00prBSWBbbpdwOVD42xStqPOlNOtdre7r3T97vXRNAj8NaSCQ087Cf6ZRF3VQ51XXFf
 0UrQmJLipujXKsHkamQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

Assign a port number (reg = <0>) to the existing HS data bus port in
the usb_2 DWC3 controller, renaming it from the unnumbered 'port' to
'port@0'. This is consistent with the snps,dwc3 binding convention
where port@0 denotes the High-Speed data bus.

Adding a port number also reserves port@1 for USB root hub physical
port connections (e.g. an M.2 Key E USB BT slot) that can be described
in board device tree files.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..833810470c85 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5134,8 +5134,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			port {
-				usb_2_dwc3_hs: endpoint {
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* High-speed USB 2.0 data bus */
+				port@0 {
+					reg = <0>;
+
+					usb_2_dwc3_hs: endpoint {
+					};
 				};
 			};
 		};

-- 
2.34.1

