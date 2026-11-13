Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562738;
	b=lrCLQBNpnmEZiSb6zdPtsR6KjXOPSulDCxZK/xBMqlkLuHxG9Rd+0uieVkdIqCE1b9DJ
	 uQ0Mb9mwrxccOS+YoSaG8zndEkxv163uxEDzs/GRnMnrd9FQHXPplfwrV7UQHQEBX8AFO
	 sHUDCm/SWo1P3CvbekB3ZzksU+6JbYIlb9bsc8MvTmo2miHLeYAkvA2SGnSz4qvh3QlO9
	 JHKB8jw8bOVd5UB+y/6NcVBa4K5ks7QnXg7X7wYRdAvYROfGsnOUtw6xAJwMxI1xkmPB/
	 elXVo8OtZTRkqvmoiUR3zga85yYL0Txfy1mTsU/YhFo/d4vR6gGJwODiDH4gaRYjyyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/2CD5CnPsaLL+yBtlQB+u8ew/k1kPy2X/2oUo5W+Z4c=;
	b=05yGxUMZ5uVoSNCUUcvQZLR4Ze1Q8JzXJn5O0tpZIH5X8DwnNGPEPxekkMREof1ktGt8
	 u735lH7BjUDwpswsDF1efWsRfhOHVu53BVQx42TB8cST5N1xBRa7s16LWkfFrd696UQ1K
	 mG6/Adg0powJxuA/ir1q9JQGjpfnxtb6MMx2Gov7HROcPpzprv1bWEJB2PzYcuBFub/ky
	 mhiWZjYEwylqLGYCbbcVkA3yW0i4D5Qe/uQqct0rOq2TdFBuG3ya87ORek541i/PyxEY5
	 +kY1+dl5xhI6YBz8Bgn96JtogWbBFIf8M4FGeDLDPpeAdsWjAo2KxRmUq3LQC1/RFkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACn007Ug;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqdAoSWP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD684606A89B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD684606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACn007Ug;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqdAoSWP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V07p4101624
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2CD5CnPsaLL+yBtlQB+u8ew/k1kPy2X/2oUo5W+Z4c=; b=ACn007UgaIN9BkyS
	MR0uwwyd2eHeSPRXHBjz1aRPd28dG45zZMs+XODC/psVKqFuX03a9/GnBtBvFMqP
	wW/zOz1et7OfDJqcHGpdmTQ7O8hgwrxoMs7mGfUhKlE8mCp5vOmIb7vxFBN9RtXU
	pu869TGS7/ilh5IAZZx+UKDAk1q8wdwFEX6/g5t5BB9YZu3JOGzYIggZ0ofIqBpM
	GZDPcath/FDIzhjrzZ1ljjoTmB4UvD1mgIaniN6Nrv0NkwUHuhJd5TlZEEUKi9sd
	dnjna39pRUezOiJ22oijdraP9ILIgOn47jZTthOEDioaZrqGphkWfBTLAsZ8X2Fv
	mwYlDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjjth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:38:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f1b3070f2so15645056d6.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562736; x=1795167536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2CD5CnPsaLL+yBtlQB+u8ew/k1kPy2X/2oUo5W+Z4c=;
        b=ZqdAoSWPlANPvZ7dSPwP7c7D82LqQcaTde5i8guPfkhsVSoxDAo6hG/8R7n5oyxW2L
         AHci1cuYoO8BTGU5I+E4MQQp+DfY6dOpHmCoYtsS+4+VDuA2fD5SY+0OJGtJaB/CZ8f1
         VubyvV8J2zHX8OrzYbX1SiVFJ4PbzRRYStSkWKnymyMHhGnB/Rqm1pncx6zS4R8VBKFT
         m/GKCLh3TQvamT3+WEbMEE18R8VrCPXydLfabBPLIiHc7ZnwDr7EAXtSyL7fndg2qapG
         9h0O6NREq6v3acapqBc8CovQ0jSQxSkB3eclqpzGwl1b5244D35/B8IbDd9V9CxT4aVb
         J6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562736; x=1795167536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2CD5CnPsaLL+yBtlQB+u8ew/k1kPy2X/2oUo5W+Z4c=;
        b=XtvjXQq3wg2W4I0OQeEmPsGaLH8ZIdYNmoFz9ktqJ2brXBWC0d71vw4NB8olhlNLvP
         fwX/VZqw4UdJpH82xhkaeJ9+MtNT3fdI/RKOCJl2KtuljJB0YaTUFIMFYWPyDrHTF7qF
         PW/kxyt7C9BdDmJ5rFlsYbtUfDFNKzNDYsxiIAkbEF77BTP+6m8zfhX7LKeQpdGcrtx6
         kNEE4Q7IMaSswAXv2KdJ+NOsSR8vC2uNwFauTiyBhKBQ8cPMwtWDvXCZ8FLjgtVncPcY
         YpbXCTABKh2XoQYr0pi+JX4OxF6THbtcxU3Z+g3kU8gxX6Sw0KtAHI+c+F2KWSN0dWU7
         2JLQ==
X-Forwarded-Encrypted: i=1; AL+hErGmuWeswjKB0Y9flPJHpgpyrpy7yDV+zTLiZpW6hoD/aC2+SV3K7oNym+l67wB0o4xDz4uE8xS6swLZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/DdSrbH0+ktaWq0+0RJgJri++VJeltkkivHkhWEnMgjLZUXtSs
	bwPQQ5N97FQyTBtD0gVWJLBDxpIMFkdZdR/U64HLQqnHQoc+QBM7a2uChYM0vw6quj34zBZcZtG
	epyFD+TucTmDvrDR5VIV6nI8zCl0kLLD+r1l/uGAW0zC6J3huf+KbXgaiyK63Joag
X-Gm-Gg: AYBFou1OJYdjmKQuKLLrFpGdmVg0aki+Oa0L+pHpQoJeUMzNgoLLWUGwOX68VM6sQ2Z
	oQEfhKeQlcrA/dCfM3Mjew3KrFmqHA5uLikfRYJWUd4S2jwn8Sz7BZudUXi4z7uvzYAAtcqMJ0n
	sLq6pGQOH4p/DbRODWLC1tjnpKHbmczQUlTiVjoIHhbs4gDR7s/5NbDBMiqH1Ac+QyWp3Wem+wx
	REIjjuNwthaFNXDTJbr6gG2oi+9c5HiQ1XQ2U8Z/yAGhHW22cLG9izS/gWp8RkMCy1ny35Conbi
	GnESGa9l0l5AQ5j1G1+GVxmhiq2SIZTil2EEWlZpQXnMYkVF9D7lMyynO48OlCt8i9oTrp+mDY+
	3GwcbA2WRLL0Xa19Pp8Rg6kW+hN9DyX4EyvFZB6b8nuaaauPulaYt8I5au9ZYJhPdkZVOIsLdaM
	Hh65fQ9QU7ZohmVv7KRw3Eua/58OO3Jg7geX7X421tYkI91ANBFZxRApaoCEdo3E4=
X-Received: by 2002:a05:620a:6293:b0:949:4a96:aec7 with SMTP id af79cd13be357-9494ba7e004mr308883185a.28.1794562736164;
        Fri, 13 Nov 2026 01:38:56 -0800 (PST)
X-Received: by 2002:a05:620a:6293:b0:949:4a96:aec7 with SMTP id af79cd13be357-9494ba7e004mr308880385a.28.1794562735655;
        Fri, 13 Nov 2026 01:38:55 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm46458455e9.13.2026.11.13.01.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:38:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:38:48 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-nord-gpi-dts-v4-1-e4a1510687c0@oss.qualcomm.com>
References: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
In-Reply-To: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JJ79s2mI1OBMH1yxzmLIpz+Tg3hCk5ZcHqeEsYxKNec=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9tqrGsgk6BJwyUYPN9ZMi8M0A2NFGa2oJYGuY
 w6QrtFhfq2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavbaqwAKCRAFnS7L/zaE
 w0MQD/4g/0YzhSCMBOEmqThoWGm9ta/58VprE//LkGzj0FR5XYm8sTB7kkXDQtHSeRE+Dq/qJ51
 SfMIS9NiIePPOxGW7hs8iTWggHa71mpq2pllvAWvUSyLqNMAUZN7uc7PQwyvsSq2X6N8ThLG97C
 Z90A9O8X65BlDeoRAeHfsDZrk+rcYf/zdnJm1EripgOvWNhk0CDMPv53ZmH2qfqz6ksuf14N4uj
 np8VlnKwNY+FYSc9Ve8xYO99eLzWgda65IUNDC7D3rkpAhH0d0/YHNmReR48byuiiKtPSC7kquY
 BSaiGHDcPDfAf4klKF6KaGQSON3iorr+iZ7NraemNgcUFlXg71cIVTjSVc019PTKaSJ22lZgM/S
 s5I9b3diWmuGGHgnHz71NOyqZxn5Nxb3oFpknB+K3uvcX2xLn0v67Q0fhYtgwjDy1MaxBldIaVY
 vWRZpe/lvj/oDLkUgiImzmHGd3QkvFT19RNv46dL2ak4ECKmcGs7ND6FeBnlrkQzEywiguae+z1
 mVUR3N4mmpcUspB7Chs3ssY3zA+0CEhXWiYXECdNfDpHlkTFIE9QbjTV0bvrAuO3I5atDshn2fU
 BaRjLLs1lcn7/ALXyLZLpy+kALVZ2AgcIquO+GCaoAIBAIe5P5hNab/TIkOV1f319A1v9CYnt7O
 bn5Dl+UjP4lYAjw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX1XA4JT5uqHrO
 C9fO7sBERcSKORd4MeEJj9D8mO+ahqMwug2XTPS0jNvkHmDlvoKpscRDqlBGjHBPbdT4jKvPI59
 kwZLnWByRGPU/OR4KKkocqDlJGkeWYo=
X-Proofpoint-ORIG-GUID: Hj5ziV2z2lvMdldp5SHKvM_hWi2C2yzT
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6dab1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=azItv3At2fTKBVyvZDgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX8R0e970atDG5
 AUzb+2CTyMtuVnwXgn7IUpLyz/TTKR6IwHBKd+gzz7uFhraFZUWko6iLGIToFBaaTrWaFqKGtH0
 X9r9hFd3b4Ga4hsEaBHMurezKezV/z5AxhVUkIgV7lxzxiJ7mQFYJ1GdZfnHMBScQpSsJoxh7J8
 5SQkPmJ0eOu285Wpk1nw4xVlDcwWnizchp02G5+CH9brrApZnC/cW13FwSNVz0pwqIBoinX5azK
 PKdgoUWroKJkCY7p+4J7MkQ9VjLWhKtzr78TnXv11SAXWH9/e9Zmt3Kxq70cPIszFt5m0Hho+ec
 ow/fxV/AvwSr+QdNXW9A2RhbDNRs5F1kswpBN8+RUA/cP8XgFXlSGIT0dDYzOrEharViijFNCXH
 zKpVeMlNl0kYjTvxoLePJbHkhq9gHFO2HRveuhME+IIPqFqvR3LQ/0X78acNsxTROa85TW+TQ1s
 DdWq6yv8eUoJNEeV3xw==
X-Proofpoint-GUID: Hj5ziV2z2lvMdldp5SHKvM_hWi2C2yzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

Add GPI DMA controller nodes for all three QUPv3 engines.

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4d8a5c4f0ec7a024378bb38d5e252..68787db708f613d61c4b88762bc31259304e7f71 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -1036,6 +1037,27 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_0 0x15b6 0x0>;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -1234,6 +1256,27 @@ uart20: serial@898000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@900000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00900000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1016 0x0>;
+		};
+
 		qupv3_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x009c0000 0x0 0x2000>;
@@ -1405,6 +1448,27 @@ uart5: serial@994000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1056 0x0>;
+		};
+
 		qupv3_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x2000>;

-- 
2.47.3

