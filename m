Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239415;
	b=wk9lFTWBrpXsdHZ/6XmwToEGpHUskjhDFG35IOWX6SNiPgGLrJLJgynjCZ29yVtU9Ep+
	 wkxPrt3O+GpFB+oFYAgkWsuq6bgaYDTCKV7FgQLOg9QDXRGIrzCSsKsQHvUYuwZz7EACz
	 x49+G39eKQtpG6ulBaWCLktTwjcJ2DPCOMQhuPz3USi+U5/uMuTe/y5qlG7KWGmrLelSy
	 Z23ym7Ft7yfKeCRpZ1g8yVhnaEgm+bKOkK2LRa0//iRohqH1o69nybNPV/ENdF+6gTBeH
	 yqBalC8o0NF1pYXMsqzzVk0e9wT0p1Dl/fKAypWhjoo5BolI5/nWHA03LAVNDNdIAuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
	b=0QAHWWRzJQdc/8LVwCBQ1a68Tn20vdcCH0t29H+YkV428ufePnvswzR0Yx3xlQany2BC
	 iYF4khckgTgUfVDqD5vKksusFCprShkSaZ1wn5uMzm8A3J73GAJpru0yQAkRvslM//WJZ
	 yEK0jIqXQiNBbETXxjwagjwiyhJf1bX/jJ/X9IKcacWHvOxG0BHALqh7FPSAoPbXBT5OJ
	 jHX+bcCKrJAg4OlOh1a42bqabgNJ13gps0zcDRg1KYjrku2+/aReZPlWdK2s+Sac2vLXw
	 UP09XhLJDf3c/hyIkS3j8EPMGc92m0U/saPZEOgeiSjQD1xD6QnSEjBKoL2Qiq1EnQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiBHYSRA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9RzUS7x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A75D606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A75D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiBHYSRA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9RzUS7x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF4On2928779
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4jQWTo3nRKkcSlk9T3WMIv
	pYTuhafOQ8QTSmy5ZtKmU=; b=fiBHYSRAUqHqzge0errBxZkH5J2FZRwrZA+kXZ
	7MEWH+uaprKtNat2yFPqQbZ7RmSkP8xQNE8jL2lMfpLZDBhP00ROyrYJzgr1ZkWs
	u2+LUzpPE3f/podj8GDwC/ax7enK0IjpstR7CmsGpN1Q6eQVTwH0cLsqF4z1LJ3B
	hPd7nWDBb0tqsIbxY6QJfaLeCtKKhGOyzFr2Gp4tuTVj+/9VLhYNMLnbwecDALzB
	+ovdGi1PMYEI5fM/7HhicYfbpz9BGTTGjj/AWwHDODFe96k7236CU4U4t9/Pjuv1
	tb1Wk8LFsfKKLYNHbKxXSN2aqu+Y24goq20vKSAHM9SHu2cA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8s881-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:50:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so3774382c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239413; x=1794844213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
        b=L9RzUS7xHbdCYbVoBZY2OFsix/5+z6CXimKIQjms88jA5VaSPACVRC34nK/b38X5v/
         VBAzMV3TvHDs98ISzchd4MkabjoHbfOgMQKo74mWQwlBsZnwST/MnqIW2bwCBSI8vOKm
         PCZhoJEJukZzWuTSrRlF/vghz1TgjOZl01ogQ2uTqqXokJzEOTZg6xxEAMAsfhEWc+C6
         lF6mq39EFdgqTMJoPnHC16wuLU8UauBstKj8NlRytKmkZcKW0btYRAkBzHwz4X6PenYC
         vDxWd7x5ZGNrWBViEg8kIOBYohPJgZxMqszQQEkNFlQe3PPZ62RH85FlivArHfxY59rB
         jT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239413; x=1794844213;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
        b=mqMidH5GeM706Llr3M/uJeB0kIBc3aEQMifPkW66n2qC93dqAu1xHU9bhvFv+FyZum
         0nBTQD1FD4TLByoT+W3aVbxWofdbK3rLuqnk6a+z7sgHXoZZn5jQBiPeIbABDRozwdQs
         fk8eOppHlIklHIub1UpEhWg+CdKzYtwbtCU6K8SPV+8gBVijSbYHqAstovRzi/SBPl8b
         mdzyymxQ0Uk3ZvrUmsYI7+D8sWgIo/AJLgKdWA6J7y+6rlwmbaaRS9ieWX8Kt2+/+aP7
         2mZH/m+iKu/Ls6dxclnw5Rdm4dj8qKusbl/dERky+k0VFwmMKiNmGy85aH3S2cUmiECi
         2pBw==
X-Forwarded-Encrypted: i=1; AL+hErEjpis+1fDUAqwl0TFJX3w/sgmPxSbjdXbSOKB4fksOzDR0mBEYnBvULmxFZMiqleP0W+oq98v7ekcT@vger.kernel.org
X-Gm-Message-State: APuU4Z8HyWbNkN4kw6mJHzi3v+zwfWhGXH7TsmjjwjNCZWyiXD8eoO8u
	ufAoNbfLIPaHyZnuwMo1HEyQzbV6S31tJdDOOsz5OYCiMlFF8ofUMDhd3V8XEMxOYZw7T9DMPji
	uznDeN9m4Nwh3pvCXVUnjqeDnqEI4Bpq9HX9c1GuwuxDO2YNyTycFeA/crpqNsKKu
X-Gm-Gg: AYBFou0CMv83129azvIsd2ZOt/Qqvkgsr1rEKgiKcXzfHn+qIH3jSTaQ7SD+wKdsuU3
	qY5hQQYrEdBJbdCIcSvuTRdeTecT5eyvPtITGTiyauX/fp+tdheSnFULXRRkXhf84IrFm0+qCkC
	mRF+P748nZ8vyQaSqu3JJMnzDdYZTv4FvC07Mo/tHq49LZ/FfGUxkVRxNY+Te7ai+KjkDZut7xL
	Tsk20bqpVrk4wurS92yz6qCCrpk4F7wqpDS5mNjF2A+5L5fDybdxM4QI9zUtEXDJiDXipnxGDnG
	Xf0248yTj3J6OfuhpIbFHe86z6ls9nuLm6mmJa8lq+oWzirpU46RDmDnl3D7Fg4745D42hn9/0z
	f19X8Aywkflq7VtXevndbYqCmjKwIZo22Go+CSEO8vuaZy/Iinr07jhSRipfo9mn0oW5LiJX+ha
	w=
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6515731c88.0.1794239412860;
        Mon, 09 Nov 2026 07:50:12 -0800 (PST)
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6515697c88.0.1794239412259;
        Mon, 09 Nov 2026 07:50:12 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm17671616c88.10.2026.11.09.07.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:50:11 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 21:20:00 +0530
Subject: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
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
Message-Id: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKfr8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dzEjNJE3ZQC3ZQ0I1MTQwtjc0MjcyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQD8k6LhbAAAAA==
X-Change-ID: 20261104-mahua-dp-df2541837127
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794239408; l=1452;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6wTZWwjBv+FV3Yma8YzEqzHEMN6HBhvGW1YgkJm2hn8=;
 b=MDINQfvs9RKhx6vTAoAB2HsxZpqwNiEwO0IZFbr428ixPLDDQ0NgDBhL/+cv/jbHj0wSBSSpw
 qmU1PJSH0y7D1LExap/2BrYyqAIJKr2EYiGEiZwvE/QY/fU0tfKeoab
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX2OgRdUubjCcA
 gzfyQ2015xnW8SBI1M/X1VkDY1ZdzjTkwtxEs0eHPA++Rde1H7eg/JgPDo2whoZQGdFIeNe+HeL
 7PzlWkuHQWCPURGwVbLlMoAuZZpj8VEDbsjtodwXDnM9cc45S8Qa1vfxQtQx+mxnc4tIufbWy8G
 ye2RfazOsos1Nwmqy0tPdxyOlqBXrTkIW+Ufm/phHILTB4pqli1GY5Mrhvdi0UhDkynM0P7S4y2
 m6KCwxt3a0ZDmi8184n519FfObhKHUrCk8qacHR7E/WtRyXsH16T3JryapAD/fww/57GGBDIRIQ
 9gGD4pctUazKsucIyYFRX5A/MJd99roKDOQFhLTR7Vu1u3gXtlE17IrstQRjRmJOysuvTTsRW/z
 P06LKXV6KZeLrl05PPZslTMJlrBCTitrqIXrDbPnt01WyegiNg1Yf+vKlS3OtidXKg7Dt6QDBSL
 Ao2NY1tT6VDjOaW1Ciw==
X-Proofpoint-GUID: PYcDUFdrAA-mou1svfOX1OhgBOhILFtG
X-Proofpoint-ORIG-GUID: PYcDUFdrAA-mou1svfOX1OhgBOhILFtG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX1J5V5cfXCsdR
 c9ks78ocko4UUZlt8bQxmGQDBsEVudhdMMdK4CeG+CBJApaZWkVwlhDbSX/tBlf1ELAFgThb29l
 bT1Lb1grnObbC/jh7TZWhVvkQZWiiNo=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1ebb5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLMusFW7oPKACw3lbBYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090063

Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
Enable the two DisplayPort controllers associated with the
Type-C ports and define the supported link frequencies for
their outputs.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
This patch enables the DisplayPort support in Mahua CRD.

Functional operation depends on following PHY PLL series:
https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..2605c0e70c88 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,22 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;

---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-mahua-dp-df2541837127

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

