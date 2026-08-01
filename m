Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245533AD82
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578429; cv=none; b=hbyNZiVPjDHdruUsrE1Ob2P74SE3gdAq2RpWIZ6X7tYSwNI1p3QUzvce99SWEoDD+qfgEnKhOIC3Xqku6DUOfI8flroVC8HgaQQhov4KARf4ZcFG5aO0/4qvVqMYF+1ZvIW6cAnVmUhfNKPyuIsIkBW04Xd+8xTZDrJLqANWn7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578429; c=relaxed/simple;
	bh=tr1/rrPuToYOiHp20eKjGiOpkdJxsv+d81Zrhl1QRVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDZq4Y9bYsX3Z8cESWoUmG6NN5DwD+u21dWvWyK1muILdZqyHtWLgjO9lKaDwUkMmfKTwFPeyd1nvqmrmhHjk7ST1+1NEbQGjLVWypJvOnbM5DbLC6pfxqomVk8lf//gJfugsJQVvWfZbYQpLEMdo2NkHGE4Z079YEmxFJproRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVY/Sj0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0BU/ImA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVY/Sj0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0BU/ImA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713FtfO1759694
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj4SukU+GaTCl3tOuDXM73gHhX0/PDOwEF8tpva10fY=; b=ZVY/Sj0Ky6gaD8JX
	/t0aYrB0q+Xy6qrqWaIIfwL0jd7bE/fL4D6/YHt2ZH6jcN6iJoKX2Wsj5lk1Hq9g
	X7H0Dn5ukBYHSryiY3TdcgaibJoi4ssu6hQN61A246py102ZmCRdzBgzNOEuC6HK
	s1u0Njgkyc2pzVYtJuN32wBUx87EkoLQOOBAb5198i22s8b/SFg7V7/oORWqb3wW
	Bd9QSf5sKnsYyY7kIaWbJbqj1uk8jW6+IqlyuVsaE3BWUXzrOd3DEPr6biYPwXMc
	iu1xltr923nwVp78yUn/iP+gg4yCKHvX3AOkj0Cm+BDtAfX8YMQiqnfk42GIQAtm
	EWCe0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6gq55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:00:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so38255955ad.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578425; x=1786183225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cj4SukU+GaTCl3tOuDXM73gHhX0/PDOwEF8tpva10fY=;
        b=H0BU/ImA33eTpZDJuRmhBuc3eXDU+YNTf7FEFcneJwSGetlL5x56IvrVMfzuIlgsca
         mAegQz/AHXfvEAdAy1BOGvXFfiePKBDeZBHGtqFOZkf0InfQ948E9+bNMHitl5qdgpid
         yvkxw9Mo5q9gtcmzS6bV5WBQYN0suvn1iHBI9tR9nJYFgqWWVMG74fv/DK/jwrugNSv0
         JynOD+5CbFnRJ+/m0RgSDqNr2cnX2rma6sCAMz7yVna8IdlXwGTYdzhg8eNhIFIYuDby
         fN1269+1ybgqzBLPANhwmyY+xo7a2fvI+Q0ucQVde9haTgzKNnoew7al+/IKz5P/pux1
         B6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578425; x=1786183225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj4SukU+GaTCl3tOuDXM73gHhX0/PDOwEF8tpva10fY=;
        b=BERsg/fFa5lrqDHwTeoicHnW+X3QUibp/jv4srG5TbFbThXwK0oPdDOUM1DlkrR4up
         3Z4WdpcbDtvfL60nFVNw0NEcHuBUMmgNUQQYfvIL3SZDfdDRdSE1/EnvKeDJI3PCJY/U
         tcGYwFooRX7wyWjQ2g8KGXb06qDc2ltDkE+52a2kJdWCSOAviOX4OFd+If79Pf4m/4D1
         yKmZmTQdTw8K5l+IExA23OlxOZFUNZKiGFdzo4mc4Ccc3g14WVTTMpx0iymO12uAHXH/
         QP9YLGXdwrDxu5Ldcf02xvI3fLgG/5H8B1QszomYLsJE3/duc2q7Wslerse6UTns0SsV
         nLGA==
X-Forwarded-Encrypted: i=1; AHgh+RpVwAtN1xNzGfiWXLyVD2Kiht6TEvdD7tzl45bTtYwHx1xrdkAGcxBquYkyXeCVEfa4HTz5H6s69rsG@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/Dj+ykFHVz9LfKsBhv/rRw0nuQwkRUtzJ9w5Z0s8vFecp9QE
	23J1etkFay9FA5jq3JsrgrDB8Nuik2sukksjVhaQMI6Lmrb6sdr5sO6RtLfzjwcuplmj+XcPlF8
	+Yc3SwI1iRgVjoWT+DpgEl7yKG0+Skoy3NqMh30pJ6Hv92q2Jmi3bwgPqU0KsoO+d
X-Gm-Gg: AR+sD122Tf8wlrNwF/j43VPTbJf2L051mnEfhzzeKD5R6CR9ehKKBZbUWvIbVH1Ef3R
	NLcAngdRVLQ5e1ZDU2vRwZB5G8h/Oxvj6rYChL1errlnxL/+TTXVE56DpnQloOIe7JsqQDGGUhM
	4ZUj1vCWMwTjTD3kdI12fNCI6RoDmBmkCmjuDT30HBX+0e85akdeNeBa62y4dGOaqbTAOClkH0I
	3/bZdZb1pLGnqKDOln0gaiK1bTtk1/g0jEdpCWyRwz/SIg4wBvaWCSYFC9HLV6BOkhd0ORX+DkR
	R3S1s+Rc2PKnIgpHZwTl++o6LcF+L6XAFiljIjeYcBB8udNhhtfcWnL3mki5fQW0/jmDI/rZWib
	0w0GEJwjEu9v7zpsJAAGeXsiT39OPszukDQ0N/C9GGzjDQ50NowwkE1zx6ibqPhVf
X-Received: by 2002:a05:6a21:2c15:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c92a8a5adcmr3086539637.43.1785578424038;
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c15:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c92a8a5adcmr3086393637.43.1785578422962;
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:18 -0700
Subject: [PATCH v5 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-3-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=2027;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=tr1/rrPuToYOiHp20eKjGiOpkdJxsv+d81Zrhl1QRVc=;
 b=3OMNedAmwur6SyqAypAZusqUyWte/0wXfmZdNjUL2Dn9dftRqzX+d/kUcu4fEG88bg1EdhRAu
 nOY39THowcjDY8Jm0J2YO6CiDOKCsTpdcPFyWyHe2r8vL2fDuciZ2Vm
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX2Btz9WrqmmrO
 DAZlc/tQ9E+wUJkQUOFOIvvT5FFptlwv/CwV+LOe9ElfNxFCfm5gYT3ZAny4YEMSmltL/mcyERY
 SfKiB2wPQmgYnv7bfoyNDJRHfd5/4uE=
X-Proofpoint-GUID: CEjZKjjXuGO6RFbV4IXgOr3LAN2_2fA4
X-Proofpoint-ORIG-GUID: CEjZKjjXuGO6RFbV4IXgOr3LAN2_2fA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfXwW3OyIFO/IxC
 TCXQA/HvhhpdS8Oq6PW2vlJIfJO9sGdMppQvB00HfPvx8cWJOR1AkMsxrhU5/TK9S95bRGZQep/
 8nawgTrwG8aIskrP5cRIzV6Bx9aKmV443GBdKII1pYSExQXhZsS6FXJuSRsC4G1tDLHJ3wFkvzW
 UMsTKblJE4TQrYAaRGnmZAnyfhm/RLjaSIgrXbuCIboy10SVTbsij3TTKfUrw46w45v2U2QTEkL
 jpTDObJAoiVnDsnsDFCvHsBzFDLKcaSqKRMPnnjNA9tpP9HXa16JTq9rZjXpj4Y4L026gkbIj+z
 MDOixEawSTcP8bmHM24qPf8HJoWBrTEORT2bnBk0Q07VH6PGtT1ozHwknD+dZ24ogo6EpS+YOi5
 p/RiNG0JBLtd1iscEmbVy5P5k0tIDc6IxtJ9OoS+VGEk36HwxrpqTjIoXVVzv+hJw0+2oaN2hyW
 3UfAqd3+EviVAjOfnJQ==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6dc3b9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GrrsNloRtQgQSSuI728A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010075

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..0ea4d6696aee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..b4441807f460
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};

-- 
2.34.1

