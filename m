Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BDC394498
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293469; cv=none; b=bsTDwsGqNJW/TqvHbhr5OhgxLMgRRvbmpOKXVsQV97RBSK7EPyxEO1VzyqH4FbzI+K6kTvJ/Mt0dOLhMkck7yXVnKb3eMeHFlH5DZbbgDOcXqpj8blgvN2xvhwhiHCE+WnMy4VHpItNRgdvW3IHu72UBeWNx0KAuc2xkGEqV6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293469; c=relaxed/simple;
	bh=aUUiq+Iduw1k27qHCGXJ7Idq+dfJ3/r0NyLUI6TSCPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QCb24iVMnO9RZK2oltPKj41VJ9k/CwgAmNm+g/CwWdMQym9fLyskO6yfg6VsPguPAJ49Exjoh3TgdWYGtX7iXldtR3lG7Xa15rY2vKpNbXuLTjpmvkpwd+EzheSxhTjuFvTt8nb7e5a5lciE74L4YooPjrUYCw9GNjh1KES9DFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKH1+Z/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwW7wPLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKH1+Z/4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwW7wPLs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSccA4112987
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EB02umt05Y6
	14wpjp/AnU++dEKKady3nd9BX0XrwaCU=; b=eKH1+Z/4b/kBmG58mdpHBiUxNgO
	ypg3BfPj3TcTytK5Oq4RzrDW3NfvLu0eZ4LiwfJjuZSdJsp7EOBrpTPz5r9RHH/T
	uKK48YRRdOedctB/Uxb54jcX6RifdI9c9yeWjFPTF01e0IdS8iZe/Grk+fGUzaRu
	oL2qEgGicYuGfVGhDbFqaYMbJcQl5zD0etli0pCpWnVAvjcTLlri5RE6MV08dp58
	udoEsoNt0J99TPBtu/wuHgYdMKqN3HWgUltz41Ye+q0vaoUODWsG9kd2oEShiet6
	pmRaWd9zVy2ZdsQkCvqR3SZs7tydfY49rJodycrY9jAkhjLHAcdn9h9Ng5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ctkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f453a27so197199585a.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293466; x=1781898266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB02umt05Y614wpjp/AnU++dEKKady3nd9BX0XrwaCU=;
        b=ZwW7wPLsgfH+8h6poYqgxiur/wLCg/2eLhspUzxWJaA6JYB5SEuFJIweJEwwd7tk1h
         0tHVdCBgKlbQSHXDiuzudUF4VLJaoTSx+ZgQPTMjva8LrVjoB7v7wdKrbOlj6Xrtmkw0
         KcAWiPu8D95BG0bxMtihqBH7iasse/7aeYLV3wX4hmMsVFy/GhHY2DE7fYnOJ4ZlprvM
         MwgGoNGUKsnSm3prVvb+Guh+TPkiILSJcur8v5IRreU0J+O0kvhjd9wTz0cinURaQKwI
         2g3ro6kggrx7BWPOIJsrz2VLjxxpRHfxewxl9cYAc2KbXNuu2rpZ8vIJ1BnFniOrI4ro
         gMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293466; x=1781898266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EB02umt05Y614wpjp/AnU++dEKKady3nd9BX0XrwaCU=;
        b=Qbp2aXwPVmsigr49XiDtTRBhSl7F0dSGA38EvXKpLqnPXKXo55nb/ugxZOXzFbHuNp
         MWmOLKi/vn1R1CCfS4Wx5pC3QptmoZekgvAfL6r/eunnYpuWj6u3ew/xg1ngr4j4TzG5
         YjkRvZNwSG7e0Y1KCA8KNk39II0IPAZPPRSTR5EHOJMJ2xjGTAupdL4dKVN/+FF7tykf
         SFCYLO2OKBIHnom49+zM8Au17xDeAoihg/aNkI+3gc8NRaPyA6XJOsQPkpN+/zUHAiLn
         YDmwavN4QrRA+7wae1oSKJZwoYZJnigKq0UhY93VZh0QSs3SkzcHV9PJfg1sfZjmcLHC
         s9KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PwCjWVgUQYGjIVvvBGrVHy/1iidusArXoTbuqODXDGHRJ/n9APqliYypfrry0T4tEpRoFH+lDYY2G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Uk48nBwxeKKAfjlq6j5eOBi0YNs5CMuZxI/VSfmhD16/Z4su
	9UWAU+/PmfSlSOglbtkXP2PWnjlaDszlME34AM8nEBCZc+whXOa197q3FOthRwQKQtxOZrVeM+s
	shPBHGYdGOGc+xhsbD7qL+HuTlezF5qOHI9PJvnNHvL/RNG+I2Fo41lbq834+G+3l
X-Gm-Gg: Acq92OErV28r5dYHNfy5bcF5K1mpP7ocwDJy4oYFTAlrAdHkQ6CNsUw8PFMozojnecX
	wlG6ujv3cEmD5J2fK/2MTrjiUnQpMKWPcPralAxqJQwAgoWarDEytw+viBJBvTHh1wtkGNylylh
	BXwG4Da1TOxDrIOPo/5edn10PgMvigMdyiB3vlEhcUwIVr+QLZpjds4oNWs1a5axDXHvvZYDqiz
	Xy1xlzzYUT2AjRbzrEqxmCBrn+PqvuwYLeJD0rwcmr7qLLoyTbsRFLg4ULtZ8qPfk4YXnw2RKmK
	mAbwJg5/ODGJFfCe1KgpMYtHzPMGPpygQxmFoz9mpwpDQBllcWWwSqLmpYRo0GTs0zXDXLVVK2w
	pXyGBqQpunKN1iniNrqpljWJMWqQciDYsGhYhZlaATFhtOw==
X-Received: by 2002:a05:620a:6409:b0:8cd:9033:1724 with SMTP id af79cd13be357-9161bc20a3cmr601090785a.9.1781293466377;
        Fri, 12 Jun 2026 12:44:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:8cd:9033:1724 with SMTP id af79cd13be357-9161bc20a3cmr601086485a.9.1781293465965;
        Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Fri, 12 Jun 2026 22:44:16 +0300
Message-Id: <20260612194417.1737009-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX3luVr1OaxfoI
 LL4/xqzctTbYBD+lbjtgKBlQZDJ9c4I2ZQbTtNnrzbx0RiDBh06uA092OBso0yZsPfBd8tAn0j/
 k5au7vLaURmHgPFfE3f9HWRc06Zlc6iH+Qscwxg9CM3LbTC1NKczJFSnngkm5agtcSA3OaL4bSC
 G/B4Jy2cEt5/x2dFIsioaeisJRu72NB2Aad4myI/dXg0oKgzbaLtdR6c7cv7qvMaWiVtreqtRU+
 i6F4+HNzVGNW38Vl4BJQZlsl0G7/vtAGACuFQT4p6H1XBR/IqGm1X4WwhQCUcogklaaT8o73j5H
 GCjrtz1RaLZjYhS6vV9lC8rTgsGAflmST3rWP/1APDlqRUcWSJaBsjT3tEw38JTYMyLXvonI5Vd
 h4l3J5UkLOI47ADQoflwk3TXOYVB1zBVffrIud0MAkybur0nZS+A5v45Ri63qOU0UhhwyDLo+SC
 ry9ib2GIVnA+Y97jvFg==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2c619b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YfY1aoyU_xzM63z2oOkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -E56iVFXHgiK5F8rdcdZdu2I52wkegJU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX1/f0b7Etgr0x
 L1JvB0aXJpH77YwXRfMSwWHQty9MNp6+46KUXwWtZM5fztFa+u8kzY+TY92zE2FjK6rbz2QZG14
 e1aGuQwReWCvWlWwt4tjb7LPfYQXJwk=
X-Proofpoint-GUID: -E56iVFXHgiK5F8rdcdZdu2I52wkegJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120186

Add the missing JPEG encoder hardware node in SM8250 DTS so the
new qcom-jpeg V4L2 encoder driver can bind and operate on this
platform.

The node wires the resources expected by the binding and driver,
including clocks, power domain, IOMMUs and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..081f172018ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4469,6 +4469,41 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jenc";
+
+			reg = <0 0xac53000 0 0x1000>;
+			reg-names = "jpeg";
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "gcc_hf_axi",
+				      "gcc_sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "camnoc_axi",
+				      "jpeg";
+			iommus = <&apps_smmu 0x2040 0x400>,
+				 <&apps_smmu 0x2440 0x400>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

