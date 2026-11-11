Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383518;
	b=NdyUu/75UjNGc6GgnqDb1zCHVq6xM/P8eluI7xbu83eSS8Xo8mtC1Q2TQeMBKbcN896J
	 ELXwUeernNuYibfpqwh6X2WuZTvk45U4xcGXBZ8chER5aTK+m6U2YkDTMv4cPagbWrss1
	 krMmvaPtWFYd6UDVajWZikkJ7R0dYtTLx3fsbXbW1bNTpurGWlTUUYQDsu5MB0/m2ARLQ
	 z3MmQBvuiFjXkE93UNUao1ur5P7Z5DvjiI3zHul43ny0gNibd6JlsxjksV2k3uw0ONRRe
	 KMsIwxw7oYwE1tznWDczY9mehdfqWeaTVO1K5uXOeOWl66P64KBH54us1l5voiTK3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
	b=3nQRsxLk1R9IGzInGp84Y5mQjRfFWM3+LXY+ikkCCBQQm8ohbowyAI1IKp+JlQ9z+t8j
	 N9Amp+NBp7reExGWPyVDrMdG678wfPWhuqbDgFVKtzV7F8jqwtMMP6Nree51mcMBn5/r7
	 HTTWZdCkAvJeU+3w2cjYN+3lR6JBgxFVno9TrF2yIwT5WgpdiCavfZmSUgu1Qr8IzFNlT
	 CO0EFR5CAX42u5TJuoYjxl/PzdyA6AvDqwzXOAFU/XT7e0EF/PWvslhZR5NCxy3KaI+1D
	 l1Slk1OG+cG5tqqG57LJQ4nAe3JIR4SG7JCrCwcw5JA45hCfMirLm4bwBEJti4zbHWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g6jN2/TJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUiS4jGn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AB2606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29AB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6jN2/TJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUiS4jGn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KNP63958987
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT
	7+r0GLOc=; b=g6jN2/TJnKQlQ3LWHBIjulmA/nJ3InBGL9LDv2WANCxjJytwuSd
	Z2LY3dz+FlvWmP2i/illxSJ/WOKeLRvPzVxINF7/OEWKaclEFIl8/jhcg+qpBGZk
	k24ELdPMONKhUao54VpiZ5C3UlrnmWC538ym+hRimmqJ1OIitPMso6fHmB6M71xb
	qNjL/mNJzOWz1hJ+RbPpjdj03hOrU1I1LoCaaE3UNLXoD9X3prurDD4QsukDzhNv
	HcZjADIs3Ertr6jUvcH6+v5gxYmbUZDH4wHqV+5Ij2TZoN2rv1+UA9X8Oa12XIp6
	VTy2ySgG3gYj9SNcl8IDM1OXotcH/H/AVDQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32gy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:51:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so5125678eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383516; x=1794988316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
        b=OUiS4jGntIyYXlQjqMPJhzw6tsu/PFTY/xjB1dJzeGrvNqvXlWRQ48vTKY7m9j0jXl
         HCetrbuAoKibgAXIiU+T7OSSNVjCfGkdxnEMSs7Nxht/57+AgUTxm0ciVWDSebABh422
         Ip6p9wWf8+kOpJEoEY0DrF4WMgy0O0UdNaOAZ5pgDfvUmqBgk8U4RIrU95vFiaPJeFCy
         /eHSAO5+a1O2d6XWTfg+YKbqpVDrksDEi5z8Hd8q2tTSxYxIX6OYyZ1q2H8QEBE0Q9SQ
         YsNZ6a3RRgClyI4nqQyUp70RACdpmRDrG6uqy6GPGAYu3a9JGmUe76DDZ/tnop2Zzz6z
         u90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383516; x=1794988316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
        b=idYQN4vFKKhMbPaVWXwiyUkSxqEiiR6nlfE/kO69wS1XarpKh+lau9qFUTj49F2rEV
         qiajkStwVCBGQhoKijouJ+bQ4luIVL9vRSLiv+9DMqXR0gogBYQJpc6Js2U9qY9IHf1v
         Db5Spar8MxlE2rM6FpZiyzYsKsu1wK/aOl/VUovfQAS8yW6ckPpy0OBThBzPbTp0VnO1
         GH0RfLMneCpNMeUHZU39iN4wgUW18yWQwTlzVe95AIkgmfByTVXZiAAOo3mTNjUm4FnD
         OR2mRXGK9u6HlWuHGbYPfZGcdl5tqGL4bwvOY45LJpDvN9OstGS1oVnzoYzl3H2WMeUo
         txMw==
X-Forwarded-Encrypted: i=1; AL+hErElaavK3+273BshAI8lIWnFUddvyFt0h+5kz2OUMeFxfe24hao0LWdDW3knyDsYxBX1dOHNe9esOuAd@vger.kernel.org
X-Gm-Message-State: APuU4Z+U52Nxa4FG1l6nBJiGqW7Z7uRKuEpTTVafzh+TyC6OCHBzR0qA
	woDpaXXpj+xJAM/dUOLpRg8+cHkXxUxyzC0RzDN/nc3DUsso70OHZibpStUZKNMERhCQ6/3u/Xw
	pWISHzPjh29IEB+5xmZ5vtxw6BtF10mJNV4Qh/UF75nniBEDCfXKrJeFhu/62htnw
X-Gm-Gg: AYBFou1RArhf1HMEKOtTX3OgdMsSiFusq2HqlK1N5B7knH8S5Qpf6FW2koWq/PQXrKH
	4GtRDSeO70HEms5kGdAGVRF1q6sgdFnDEYV7C5Su2gtsS+WuNK6nrgNm8ea8mEw+9s+Htn9D3IT
	yEpgxMYhCxXc1KMPlOn1lfAUnxKXNSBnhpgGjVxGM09DWlfHHGcT7NI+uUUDmJvnbGcfnpfd3OI
	3vWXVGHRo7Kt9/S7S+lie/8NsGry1gbdLBCVsXe2TKTwmayiwazTO6kM4pIWgb1a8wDaopQDzqY
	CmWKp6WBpPonY/43jxj2lhv+W0jZysLjj88MWNC3Tp7ruADRyjC/aOTzXwnSpw0bo0O6I9HVllq
	Ul0WKPv7s6WSk+H9QkPQ0MZ1TSXSvsfBqYYgyMfiTIljOBoFO7Jq5PdHbhYag3hz8aTjRmJ9z5V
	61GTkUGwEIuSN638VhBODMq9e8DU3dP3DR
X-Received: by 2002:a05:7022:b90c:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3c02f09efmr1648447c88.7.1794383516482;
        Tue, 10 Nov 2026 23:51:56 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3c02f09efmr1648419c88.7.1794383515897;
        Tue, 10 Nov 2026 23:51:55 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:51:55 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Wed, 11 Nov 2026 15:51:34 +0800
Message-ID: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af41e9d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U0NwJVSz-9pN22jjyd8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXyJAZQxiaEyrX
 2RNJiv53Xcht2R7sP6hGV4un+7zkFvC2y1cKzw7H5NbUXl3Rp6lVxcxaB7fD00E5iwXcMPz0E8a
 2eJ+kBTN52y6uVVfOnKWbYAjnQUTFLy6zrHHsEN6yUyNW8S/Znu6AaQTPe00DEl//wGNEPQhxVb
 lVkTowM18o0iqqXgNLz2/fR/DQQpLf+duLgHKnqarccnpv72+adbmKS9DeYf1e2uUtKPCu+IJNr
 TJOy8mnb/DzxIvRsPDhduAcDO8tBUHyqW2JXJGovTaeQkyv2o1AYvb2HHsf+XNE7vRELhMzWupB
 ggKvtXaiBbxQ6KHBmwKDToOxcqVqWuNuxXHFvJ/e4pSRenCJwaDwhVW3uCFdvALPMD/a/cAufa0
 pdcVZppeAOyXxKSAeLHpSdOrh/dl1C/8fdOz7uY1WTyV2enqgyO4ZVByKUnUynqMjGqBfaX9qZ3
 +sRMUP6KMaxjiW7cGAw==
X-Proofpoint-GUID: _zLH0GhYyncvTJt281tqKZpNMB5C7iyZ
X-Proofpoint-ORIG-GUID: _zLH0GhYyncvTJt281tqKZpNMB5C7iyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXzdGjDInuWwh0
 kTCXVz0N0VbMOHFAaBF69PbWNaIesG/vV07L2HEb3KAQCFNP2AwwErGdo+rUIxa9Op/Vg5Cf+jh
 WxjMtLgj7UCrlDmJ9Rrpdl9sFqcGy68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride and RRD board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Changes for v5:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- Link to v4: https://lore.kernel.org/all/20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Correct pcie_phy vdda-pll b/c/d supply: vreg_l1e_0p9 -> vreg_l2e_0p9
- New patches for RRD WLAN/BT support as RRD boards with WLAN/BT module
  become available in lab for testing
- Link to v3: https://lore.kernel.org/all/20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
  arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 179 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1577 insertions(+), 4 deletions(-)

-- 
2.43.0

