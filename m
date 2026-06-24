Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D933BBD9
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328146; cv=none; b=RGDADoVBC7hBj9MErPdiSyImN8QzAd5OLRPJSlNNFad2tjGLTKnhg42NcLVTV/opS/D8+WHSEyj/YCxcltggsV6RWK5qkqRqt57k+zI/2PkKTuCMZC+vpAVNWarLNn8JDIgZJ7CjtWJmC/CLGB25aun2e5gkIyw3NxyTOdao8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328146; c=relaxed/simple;
	bh=+r3KysheekadIOuDCr6W7bpqF34OIalE2onNcaSIjX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cf1rAuYdW3pk/ZE5SpXNrkx/UiMt50XA3InZMG6seOM6o9AllP0WaCXX/Eea1TES6mKs35d/leXxatAc6tbzp2PRt3Nu9qPbriL0jRUJnbZAdmlRHDf+/zEVELO3WPqMCGkIMlTByMnaZg3ehIdCO7A/iACGQMAHUGF19dhYcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2RFJptY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f02I5PFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2RFJptY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f02I5PFV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OITCLt3666234
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0z5HCobbwhs
	exx/3HNV8KkALT1HgOJGEJMf4RmetQVs=; b=V2RFJptYHNnusJcunO3meqoJpNM
	cB/0iJB66yw8mkZex72Sqk61zTzC7TzSIeJ1gSLuCQOHcmkEdvFTGhwiVVGRRDcM
	idcH37Am3rZLuzb/TVDapSyzJXHzatSKsvp37vFhr9IeJX3TJoHF96QGM3J6U57m
	diKv1+1rDqEPRwdji3l8KWeACq4vMNstIWYmfiDUEQdWk9HIz1z6Et7cMQnaw6Fv
	dDpKCDuklHF/lFMWOrN2Lx502V5PpQ8ItgiABIqyof9YMedcN6OmQRdyTB2p8oeS
	ZKSW8RoWcXSjMhQoWygpSJN+3Svlu0SyjmVa5YA4/D5VZrRvm3HmOkOLW7g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr539-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428384f31fso1064469b3a.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328145; x=1782932945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z5HCobbwhsexx/3HNV8KkALT1HgOJGEJMf4RmetQVs=;
        b=f02I5PFVGIHOz3eJIXgBt4peaFBvlamZHQHXncxwqHD8Rkr0Ihc7gpM2PdZsXgcxMh
         MXBUF3Due+ATQB48i7M2qmBVUb0ewSHvfznGiroEtU5APaTHeK42mB7JsNQw07qImLNA
         2oC/mT2swZDtlojVmJiyUdS4wQOHT3zXnDWHrv01FK/VXsaGtGjwwbJhecBA1u+T7vYf
         pPX62WMHIq/ETHDONrNbTVA4RWKauAIycTRUKImiVYlkYlupYpUhZenyEKHaU5ZtEdTv
         hvGDzbt63338h7nKLKVhaBF1mw12durM7ovtxvNV+DWsyTuHSMHvtfyxrFoR2I6YTnRD
         lmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328145; x=1782932945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0z5HCobbwhsexx/3HNV8KkALT1HgOJGEJMf4RmetQVs=;
        b=ALLDa4jVlvonqdJ+9X0drhp4TSJy5wNKTc6gz3t3c+HoOOV6gnRocGQi1O+4n0L8O3
         qpCs+HF4xJSbZVeN1yrR3q+KMEsbjmNU1dqKI4yOxcR9y3x2MzNb3H9uN7BJWtBMU1kn
         vWJWo/FGSNmbTVT356IP1ms6xkQPYhkZxAq1PpvR79cP00slU0Q1wcDhYEO8qVb+jPrg
         LoZl9vqQKjwgVpQUn1ZZ8gevVAa9dTsMZHPvpt8mhsbshQu+NjkSer0okkqTmPX2qiDk
         7IoO3NcJwg6MVrfwvXyMVTKe0/G3/9jGdG/ZFw0T/SnStuviLe49rmZLIDat97kbTkr6
         5VxA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3k9gijf8DdFCOgMttQjOTZsvYnASu2EzMhuOjrqCDlRGkxplrNYRewWgi5bxq3trmJv+YI3UGgIda@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXO7NG/42RZeLnQCvDB3SxaACwagtN83odr5XIz2vaxUepiEc
	DgsHpzJVPOBqso1IQCTlFv6hUORmNDlUgEVLQ+1gs3vWmzwQk13yHAt1h+lhhUFNPBm9dVfMJiS
	VOGZOqLmmZMHfplMcEqjuRbFMiWAPRGV47KT5OqHB1Bk7/wkamHBixS2nxxTICW6h
X-Gm-Gg: AfdE7cnZqdfnPZCrNqys0/8C6zmRGwtOCETutaLNFE0ELmrxXaeZuPiJulVrliFLhQt
	5vUsJAHIFSHov6sGjbPviJuw2Dss6v5LIA09U916KkhczD9aVvZNok9Len978cXTV5VEzf5hEIk
	mBcJDX8NsYX6MeGKE5DgRJevUdn+v6/JIsTulf7+jDf9mc4Nof0bhxg1XkPG+8JzyYi+EGUEF3t
	RZdCVmrY9exb4iWA766nFOMEAdTXfIxDlD+4Kpk/e7oXYXex4NY8iMlQIU2A8vld5Ii5V0ag4hG
	wMG1IDmj/A25iXz7F7pnzJi9fdhQo5YXFOH6b+8pIl6j/82kMFbLDSt7zIhRbHeolnHOHT+c490
	yUQM2O6tdzyNIkf3DxAhwy+s+fNHGy+x+f0edWg==
X-Received: by 2002:a05:6a00:bc10:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-845a2abdademr6793012b3a.11.1782328144524;
        Wed, 24 Jun 2026 12:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc10:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-845a2abdademr6792965b3a.11.1782328143992;
        Wed, 24 Jun 2026 12:09:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:03 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 06/19] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:17 +0530
Message-ID: <20260624190830.3131112-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXwgE33XVdI25B
 ycsj0VItFmhneVMuKTXi5W9xZ70RnwNBp17rXa55H8mXLmdQuRqebrNOYCmeLsR3psY1QuQwtdg
 jIRFDT0H18+LJOl2GwUR+FQ7j/gbJWI=
X-Proofpoint-ORIG-GUID: _bFE0W_yp06cB4HLcpHiQUyxLp0VmfBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7Oq6LLxlPdMp
 hJfVN39QQYHwBd8Dcwq6zQEieNBHvjMdksBmK1lC/iclB+qXOgGBA00bXSciHD7QDqZdF1sdkDd
 Jx35Jpkxh/ZpUfjdhd+akDOmwrOJZJshk/iti9Ia2Survrl673k3g9RdqtgMA9Ux4u1+nkEcYhd
 aHUuLl2v6iqszOQtdMXVySvLAQcGCHH8MTv65axJte3eGGW/ygSE/4Jtcbo2P2IQQJfTzQ0tDPk
 /Ru2z+Qw2OMuJOUHnAIzufPIjEsl3bjc1bnbMgKoavbxf4wqXa8sulZe9pDvXE5u43fpgsORiC3
 S6U0xpKNDN1NbnDihPs6HUS6npg84LfLbNP7Otl6gbQ6EV4Juy7nt4SnlF1K6jDTIY8P2ZIxTTh
 gHqqbhqh/ajTqYE8YrTZ6mURaIJPmISBvmGN7Bk5yWV58AozUnTYMxQNgu01wuNw4+qq4b4Lh5J
 YmYRu9CdOUdblvnS6pA==
X-Proofpoint-GUID: _bFE0W_yp06cB4HLcpHiQUyxLp0VmfBc
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b51 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..0342fd28f9b9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 
 		scmi: scmi {
@@ -5452,6 +5453,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

