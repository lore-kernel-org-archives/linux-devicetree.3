Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33893CF05D
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717367; cv=none; b=B9xBw7M+e9nTrZFtsFYaHBsJvO65P3ZKh2wobDyV2/cryrK3l+o87bKe312W2KNpaPVv2p42NspvijEqGP5cARfk00eQIL+ESEsAc3QD2yzQBQmH1dBDBIdilLrhTfcxVjxcDInewK1+6cxQYKR1bhT4sLSFyENci197TjYqXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717367; c=relaxed/simple;
	bh=1iIMMHMsXAzUL84CKhJyMZ2CgHGf8u/3sHaJi6YI+JU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EhtSwvLfgs1Xa5se5iJMOfc1vyrH1ODKyEJIbsOop/FukX6KGcQzjHPwyaVpGbw1oIAEroe3fyTXh47Z4TiIN8RE9/A1ah+P47CaCLDtJ+y6T9WMx/uM5VbMlxgNO+bZeerk1siS2Jury0POZESFZhvUogsDwNcgIzVCKZAZ9FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hK86vzvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEfKJHft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hK86vzvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEfKJHft"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDwvHo2433034
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RDO/ZcufG8ThBucDxfrCcb
	9sWZ2G5gN/jVpu+8tQXyw=; b=hK86vzviUU5wXbq3mxaInyrvh9oH2c9lcCGQkQ
	GbZke60j1wnes9e6v3LukdJx36s6DIJpQq5f9FEKQ38LJqjZztDlznmGLn5nu6KT
	CILdRGYOozC0TtJTsIdFbJVOWnPo9sxdZ2NPt6GBzP+5+cBKjlFB7PkmuaI5GTaV
	Rw9RVBnz/x/xPHTYF9J1I4zHcyQ1RlVw4+nKL+EVlHJSy5H8m9mHXPDCAndJGQwc
	sjpYGFaLe1+948WuG+HBnyiZFdXyrjXhThYipT7iXZgxN2UTqE8IeZefNmWDq7TO
	tNbSKPN4aZwAGXeE1mtZaDtgQI/YNv2Ke54vSscw3yxKUHiw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1nuguh6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso660464a12.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786717348; x=1787322148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RDO/ZcufG8ThBucDxfrCcb9sWZ2G5gN/jVpu+8tQXyw=;
        b=CEfKJHftinhf3mzazSQX4jouglYwgM98K9wkH0bAN2Sd+8B/8c+wOz8tK3XsDMoDdc
         mIZRNQ0gG2rRKw0GOvmC6fJcH4O0ZDlxoeCwBDDjH5OOs5rYg/8+MxWRGLowXpv0Gk2y
         5VlQI746TlEe0jypcfMa438gqL5/he0476zP3j630OF8cPpBGi/IG6lfXJEp1sk4om0O
         dYSCmsKX3SU+PYDtS9S0TjW13Ny9zYQxAtSxb/4Gg/py60FTBQKSlFHjyebUKjElmO38
         DZdmZMjBcMBI1qTCQNnkoDzA2XhbVGow1iPpam/o0Sth6CrXNU3avIks0vozlgXlz8A+
         VLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717348; x=1787322148;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDO/ZcufG8ThBucDxfrCcb9sWZ2G5gN/jVpu+8tQXyw=;
        b=FidTg15WeTAy0xvsaWEDEh7gw1WyKawbIbIcpg9xamkZ6K3WC4k6YlRkIlVJfIy/3M
         8Gbj1qHVtVK+x9kfR1wDl0UgyI0pLJLse2cYRvKoWWxC+anZ1Ul0yt+hmKco9KGV013m
         OK8UI8sFXfCDUNotx60kn5pTJ3yj25/WXlcCoELhzmY6YC2oSyAmt0lNKoVj2G86I491
         3wNLGDnEHNdKwf7+nO8tj9vErEXUCzgXrF4xdV4MKSK+WDgBFnYD19jHzcTIacB3TM63
         InUzLt5ArBo2z2VK4JCPOayPke2GLbIFxWbpPG/vFVBW+SJEHZrVYXyjFD1O2LLXmnp4
         33xA==
X-Forwarded-Encrypted: i=1; AHgh+RqRKNPjC0m81mpCr2BdXliu4KRHpJfp2Z6UY0C8U2CGm/ezZ9wXmG+f2UjgncuFqbiSYO7efO8MkpQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwzfcRaypX6L/VaWMnIEQAI+w2OXZkqY67oriHmQmWpKpz0LaNN
	NUYnKNjZ+pB7wZ0HU1e3FrD92+PdtixjWi/e1VAnqVOpsEFnBI7QFZk6f7gmpJRoNgWEwmKGqL6
	usEbesxhiDZBoz7ya7s5+xOG1G9TZN9l+U/ABE6hyMXYB7v+/deTLn8yXsdLUSNEK
X-Gm-Gg: AR+sD11R16OLztEM31Lqgx2szMW1W9U2IsnqmsfKjI87A7hkrbctQRhMaxW00j/+WGA
	M+7uop6hgR/WZLBGmxx7mxSGDebm3xLpRAMzpvifeAoQPqOo5R2eTwNSsI5xhGYpJXthEg47tXp
	yGQOfH9PgNu3EL5bYRB/efUYJ0+u5IUhA8A+fuBM0SpCMqlb28ggvQUqxVm2v1I/t6bQzDTGsu+
	tCFmoftyR/o+oRziULVTsYG+hmAwR9vgPE5xyGLbvKsuoXscY7I15Z5IKlE1SlnRVy2NK9T3mob
	FEbZBwi4JxHydhPcc1OR8687uc7XpoAAPajm3moGnElsYDUpNR4xJOcLfsPr7hFHiTnK6MxVY1i
	c88T6fWGULBoRAdRfriD7MoI+qzeugva7jQIID15sUm4=
X-Received: by 2002:a05:6a21:7702:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3cc7196e821mr7898609637.8.1786717347561;
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7702:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3cc7196e821mr7898529637.8.1786717347062;
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4895520eec.31.2026.08.14.07.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:22:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: ipq5018: Add MDIO pinctrl and
 enable MDIO/PHY on RDP432-c2
Date: Fri, 14 Aug 2026 07:22:24 -0700
Message-Id: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAkf2oC/42N7wqCMBTFXyX2uck2y1yfeo8QWds1b6jTXZVCf
 PemvUAcOPCD82dhBAGB2PWwsAAzEvougjoemK1N9wSOLjJTQmUil5IP1rcl9sNZyLxsHfqyx86
 OoeGVhkxo0BebOhb7fYAK3/v2vfgxTY8X2HEb3BI10ujDZz+f5Zb752eWPOpkQDubKZNWN0+UD
 JNpYqVNorFiXdcvgSNRX9sAAAA=
X-Change-ID: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786717346; l=1816;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=1iIMMHMsXAzUL84CKhJyMZ2CgHGf8u/3sHaJi6YI+JU=;
 b=B/c/EoFUC8bdPBdCXuWw9K1+u1COARgLlt7E+/moTBDGr4TcIu287kJBP8Wx5ZWbakUoeR9iu
 sd/a/oFxl/YBVpiKpIOOuMcxALUMzY9fpr1icNm1gXn4aCxMESf8uWr
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX3PHQyBtGe6dz
 nZ4FIgYeuRhuF3E1rk47vTT96Y3Ac5nLG2cJDUOuvIR4l/VNuS93I47gR+2d78aH/KPbyti0jq8
 s5uKwjPJxr1LP2KoOhLwPz7xhqq0UCBUseyHTWtxy7UwHBGOnvmuYP+FxVu3NfbhQuOPc0C+uej
 2lPFlb1jOHXDkTEtDe5muPkCJgJdjs4qxtQARpjxc855kPU9fixRhiZzZiuypQfhWCaOd3B09gb
 0MMLK9z/nIFuI5JeG1ZELR3GDvX5iJHqGZ1P5HD0R4lEjytqdxIY2ezkIaOGjQexv4dkc1bwerA
 rYJOa7paY2mgENYCiTSZBw65JN2AHrR3swbdWdpV3xB/Yk7NNHFsFYjpfbS/K5YngOj9hEQgzmx
 aIIpWQ4QDBh6nj4elKR3n7qpovQZEeBkynehUMPxAfl0lr3V3dcgXddGCEJk7264GaI0qRxlpZu
 OxTqf283M0KZ3pRcPdw==
X-Authority-Analysis: v=2.4 cv=drfrzVg4 c=1 sm=1 tr=0 ts=6a7f24a4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_9f8UQ2UEQgcCYNCZg4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: uo8e-smryttZyMoPZNYFu9r2RBPeaPkO
X-Proofpoint-GUID: uo8e-smryttZyMoPZNYFu9r2RBPeaPkO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX0vw+D+XDRTyh
 65J0VSWjVFruSLAmof2qwgChUBgt/XirwLR61EeiECIUr1BLoaMPw4kGM4flECBElkJwU8zz9jW
 pP1zu/a2vNW4Lua0ieswvJuCZKS/WH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140109

This is v2 of the series enabling the two MDIO buses on the IPQ5018
platform. v1 (this series' patch 1) added TLMM pinctrl for the
external MDIO bus (mdio1) and is still under review upstream; it is
carried into this v2 with a clarified commit message noting that the
MDIO pin configuration is identical across all IPQ5018 RDP boards.

v2 adds a second patch that actually makes use of the MDIO buses on
the RDP432-c2 board: it enables mdio0, used by the SoC-integrated
EPHY, and mdio1, used by an external QCA8081 PHY, and describes the
QCA8081 PHY node on mdio1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Changes in v2:
- Patch 1 (pinctrl for MDIO bus): no functional change; commit message
  clarified to note the MDIO pin configuration is identical across all
  IPQ5018 RDP boards.
- Patch 2 (enable MDIO buses and add ethernet PHY) is new in v2.
- Link to v1: https://patch.msgid.link/20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Luo Jie (2):
      arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      arm64: dts: qcom: ipq5018: Enable MDIO buses and add ethernet PHY

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: 2697ef8943c9985c14708a6429e21812693857b2
change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

