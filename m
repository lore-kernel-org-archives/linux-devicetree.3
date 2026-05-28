Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED94D2FE566
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935372; cv=none; b=K9jloT9flBcj8A/ypaRH+yFLeXyhQ4+FEwMgAHCTZyydWEVQYBO2tsHCzYwctsuZdEN6YImCgzYeOFi3se/BfPhdH40q3ObAJnZYQeDIPK1eAmqdi3kgT6sRi0Pnl/Ttc6gFjdIwYzEfXcU2S+EygISXYcmZ+w/419nK9odQgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935372; c=relaxed/simple;
	bh=KLhquYMQkAQ8A3wNcTBTQpFINKPhWmq+7HBhPnnQ+ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gy8HoDfVv2ehQXCMUvRltga9EIYx03t2JYt9VR+3pEj649jGeP6zCkAuD9GmIvAGyYIz64H6XbSDOxtYYc9QrWX/r5eWJuz07NqrHjEJKw9fGLionanj8y2tIBlvYSmL3Neg70TqOrCZ6BhXfhznGjE3cvil+i0QlW/fDRZIp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSN/fdek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xzvy42uX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSN/fdek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xzvy42uX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKmwIA3197818
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=; b=FSN/fdekEh1CeICV
	YTtcHvbdLzZ/kWwJrbwZogLzGwgdS6ZTYw7MFJ9Lh9Y/QxcCrT4+9EJgO9XgPdLP
	vuPLVgNdjdko9J/hlwEayqXVxCqZlKvIKxutEu5e3LbM7dy5KfH7DrfZALPS9OdK
	l7E7bCgVMK71PZgTREA0bOmFEzW8Zm6Ma3ILFwTBr4uuiJm47m2gGaygpqroObAK
	tycWwUoCcVJ/cZ/BREzg0BTKQ7EvagkaTgL+Oydt4zwnOdpDsU1WMSt5CXENW4UV
	BhhiXyVPRlI1xuHyuf0p6EmGRu2TjHJ2uKLxVC4+7zl1YUOvnBjvOzfgjKZnqi+0
	XR/uqA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngxyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304b8d0ee63so2176063eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935369; x=1780540169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=;
        b=Xzvy42uXQgCS2o2VpSiZRsd0H3BVh/We1LFMvwCM6VKyp2NzF6oXOesq8Tkn5gjNgt
         kEDc9nP/oKQEZVlpM3Vqm7mdCiNJsh+ly3IcNf4et98YPeL/Wjab4o2+wk23umCd+eZK
         rESqT7CXaXYqwlpaEm9SqDYLjluiHTrJTWlNZQjiOJfN1Uly8NSeeUEjCsAjhaTLj9F5
         pUyYhvbV60m/m4910DfzmBvMG4PxHxahxaGucwGWeHSNKDT6ZNEQ36/2eOGzUGRfOcTX
         j1HWFfvc+0oZhf2W76j5LY9bsKjyPevp5KU9BjAQZ2PJ0FBdFGW8TFCyADWILp4KQ7s6
         yOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935369; x=1780540169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=;
        b=PQyuq/PN2fsLq2SNM4MgBwZ4Q6l9rlAMiJzT8qJV9Lzqc9q7gZLjnwi30x6dc7Rwwk
         XiTpw7TblfBpRl3rKSbNaEuJLDVVv6pjDPHxkEL1+r/xVhikNTd9jnF17RNe4AJZpXNT
         OQkq7CKsrJpidCfxS9zNo6XA5PikY6mY3bhx50PCXFZ5MXrKW5Da+CMldYs1rol0E1hM
         FtqiHCBv9YD2k/aI66L8jzfli3o1HAqJmj7/8Zftytd0YAkQB526VPO9rG4I1tzTmMrs
         eziJeB1AL5oGAnh74On0zgmrOcXTPEONNqpbeaFr+XZxWQfrUKZPgj9FqapXRzxqtMpT
         hMqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/DLdT5jkdJIN3sfb+4PGAT5Jb1xLkoKkQEDyj5HbRRwJ+qQ2QIpYj/bk0T1+kAP7lV65KqEe7GZ1B@vger.kernel.org
X-Gm-Message-State: AOJu0YwdLrZTb6JfeFkPraVeJnPDiS+CB88Xmq9Cscc2+6AdjPNtHoip
	qT5gErBx5G13dcMci7874Nv7lU98XkHSxY8HAAdm++AGW1WjU/G3/8tWpdK2ct2Z6sFhbf1Zhqr
	uMEGF2nhts/Yd2ekj8LRCsIibGDeQoK2CO/OSNyKOlbzN7Sy+oSmcmaXD9aAniFMR
X-Gm-Gg: Acq92OHu0aduQNTrqqKNr8rWOLBbkrtzxrSquQ75F5FqUv92jQIFyuWmf1f4nBxRtK6
	pATnVIFTCXz/Bski5QP4TTsdkhLWNxCZZ9Nz1hXOLtc+B+u3O2dpbreqAzLMzNeHEoF+SOtZqN0
	UbihaK/QAwhUTdZwN2mXF7ehjtYSfxq1tDy/R24BO1aiMdTLjY7t5xiPVyHIxC0AcyfL6LPs+sC
	rcaXiHSnCAz7UOa9EUh0Ox4EeVGgaEgosV113qiUEJahFuknwLBc8kJTnTE+68w9S2BpdkUklY7
	B+qAo3RV7R59T53Nt4B4jC3FyCkmF6FDWPqnUO/L0IUINja3IZK1oM4SUIENJdQURyAL+VhmMy+
	/jiCBrs5iKo0icCFmjfZYh5t7L7XOKQjk2NRJq2qP6STHeVRHEZcTh5Ujje20V8RocdD4wr2ZMP
	f9BnQ=
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id 5a478bee46e88-30448d51723mr12215044eec.0.1779935369458;
        Wed, 27 May 2026 19:29:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id 5a478bee46e88-30448d51723mr12215035eec.0.1779935368983;
        Wed, 27 May 2026 19:29:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:28 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:16 -0700
Subject: [PATCH v4 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-5-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=1589;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KLhquYMQkAQ8A3wNcTBTQpFINKPhWmq+7HBhPnnQ+ak=;
 b=l4y5twY8oeGyvBZydsAuEFQe7hJ3FP/48U8j6FXs/nf473j9OaKVBzNEzPhnUHMnt1jAisqrw
 th8zo/7/mP8DLg+ldlW1xzoqbtJU3yTCyRjcHqwGoU1A9cmHKwrKV88
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: FwfZxRGziK8uWz8nmcSczraKrIjc9ui1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX9rfBH54B1wfw
 Mh6qXjTY2OKSa8Ly9OoXCx6Y4g4gMZnAfbqgQ6D+gHKPaPdR3nvKbSDOffSTU8ffIq4O2cv2Onr
 aiScd5w+DQMVV7LHqroG5D7jxdAsSU8VxDPtfgDxTXco1sAf7PRMrUcRP4n7Bdg6IuihmwloYCL
 90lUaZtLbaujmkKsEqg4LeU3Lbgy8sS3HbU09G98Bc/TmoBa9FbTFpdYIKkqHZa00gZyxhaKcax
 JgAJIBNtne5GddrsV+IYM9jkc4g8uSQAeM9o6yWnefNzDskagL0v20JVTsUcWbUk1bP678D5yXM
 n/x93breNCgYlcPnzODV7OsIvbHrLHngBzVRLJWF45U6RNUKUtthIivVnGc/zVyH/v+kPZWTlXy
 OYpHbKYIdgXtxCOK+EUgo5GI7/ae/5efbG2KyDupzG8/aADMynq89cqhO6Itjj8TKMDgEvj7Fmy
 OCw8MbQnLeF0Mm5ZB0w==
X-Proofpoint-ORIG-GUID: FwfZxRGziK8uWz8nmcSczraKrIjc9ui1
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a17a88a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..be8497ef0da3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -354,6 +354,26 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1

