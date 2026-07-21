Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6346AECC
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627656; cv=none; b=YMmcHj3UbXjSg2GzIstxQ6xTVNUieRBB0SQFVZJfUJ/1YX8Yl3fA/I0QZFqtRNbRRdjaeGvDpGWVNwMuAlcGGeKbKa3hBAwCZMEEm7Y68f8V/AWblhdnvqpCw42yqsSeQbUS9xney8svKbIUwIsLfPoHxwD5lO5uPCoirfEJrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627656; c=relaxed/simple;
	bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvdW4t1fKqilb3shTbbRyLonpuKG9rmji+FvbPIsHKjQUd6BtLZimmRl+KaM8ci5JVxdNeAFzQLNvpYOgSdpxpmTgiop/vxtUBWKyrv5IJpd/tiAqzuhBBZDPvKQcbwC7E0W4WMn3blFtU3htAkafrBlWgY2o2kY0n7lehp+F7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jU2Ry+L/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcFPwIqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jU2Ry+L/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcFPwIqI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6SeMh3978764
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=; b=jU2Ry+L/f/9/F6vT
	2pvWY281G1MsU7GactLR7BHxkROB/T88FYbdWmVeArDXfrFJYe+cBuQ5Gd4qjUqE
	VnW14/nFRjxw1mi86/n0L8o2uBGxcQj68UcJpylKa3J8aQC8FB3yuKX3T4ixUCwP
	y3PC4mzmm6a5ktkrslUhfPweYJREHHmes5Mp8yroqLEMPoXou/qdr6BO/Mpthdsb
	/l62it4s0GffxIyRUF0Y+9k/rkAAGkPWRAivCQgPsrth08SNLPEUgGaI+iwmx2Yx
	4I9ai/sS3OLDy5Ax0rfcnJFySvGZ6KoFu5akz5/oHyyX+ErvQL1inW+VoH4jkFc8
	rLN3Tg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43tu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so199174255ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627651; x=1785232451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=PcFPwIqInz60m4BN7IwU1RJYM47Bzam7bvsmSxH+omWME814aDO52QjhUo5BfX7m/w
         ae1icqnysphPgUtZneWmTmQSm3194UfI29Bix7TfvOwfRalQDAqqxS3bqYlx2EjOZm38
         XLG9PQa9rthoibsd+W6Xq+xig4zQOyCXtOcB/DzQ3Nd9xNddIneYRZjP2Tqq9IJ02nJt
         CQZZS2QBLWyyujFrADwMEOdzRSk4Nd7SDJ1+0dC1dX2KRC7v56gXCl5VwcHoKTZPZGJb
         +MGZaVa9tWUSRjccQSFuiMyxuhEtsJLXhSKIg3uUMS7OWYc44uRmxZ7rANfU09YRSw6o
         wc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627651; x=1785232451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=seig5EXeoHugd01KTcBT+VAFLb2sbmFWfQYjLY5k88N/fx3rK9cnDcvZD769/uAmXI
         p1zvo+8swTijsRrRKqCNMwrDmF2F+mmDa1Segdwrq3ULq4ZGCGXDZNN5S+NOcMKqnNLm
         SUns0ax8vVWqi8QnD+DkKhkbJJ4UpsK7JY5H+A6Q1kjUchFcQUVvlcVZ0wXuz/nBXNtp
         kZ2z6K5Gf4ZELmLzaO5k/MTaLz0Jksawe3yGGsczjcCRN7ULxj3T8tv1DEJlDc/9Mjdd
         AZTAGLeN5UUR2BIKMrebakpxeqcuBQBcBlN1WpKcN6owL0CRZIkh+JY6uZuwYOde/dHa
         9ZeA==
X-Forwarded-Encrypted: i=1; AHgh+RpphNnpRaSRghvUfgNzSOKm+3CHzY9JdtR3kS6cpIPz2EPHXIpGP56QcK+3PfeYj5bP6jxv/rHvZD7E@vger.kernel.org
X-Gm-Message-State: AOJu0YzqBa8/2vtorz6waN6+fTerxkGc0NWaLb7WcBGuQTZLwIxgCfP3
	rPO9VV7Ked5HnA4b27KS1fYdXizIH2P5OO+FjJl4vrQNdJPFbpgf+A2875NdmvYe9Z9/esjXsi/
	Oy04BiXguIRS57l4Qj8m146JFhFhoc9HJLpUBdfeAlTV9B3QpR8uVo+CH5Hw4U3bj
X-Gm-Gg: AR+sD10PI93igd1NTR/osT7oxdBLmVgF1Ha2iN1AppwdewmYTSWCJY8066NA9fvv+Vh
	ny76Puxy6RSeSGl81EmcmvzOpXxTCAeNnp+OmbHSy3MR8JWgV4tikvb0mAlsToellDu5m1MiO+8
	90coRRkF5dM+KPbDlg85qZsXL0l68rvgLrzEXaGfHG7KMMTwVJ813bAQa3hEaP434nHRbXAHo1p
	coxkReKlQGK9/DUCmDk7xYhegxWhyQqt5fpTvEfBSBXIURs6Z+SYzEL2tvRgMoI6FO+l4WqePmr
	ZEJm4psYa9z/MtzduWDnVazzejlXSEBQH5Jiz/XQUNkXJ4XwKtqHuBkehZ4DQ6I+zbegIyXAOu3
	0a/lIySrhxueJYVZFe9avgWrG14VPHpPDYU+nNO+5tY4mITLRUuDnKApZxWzNJEHHflwRlg==
X-Received: by 2002:a17:903:13c6:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2cf348686a0mr189047155ad.19.1784627651235;
        Tue, 21 Jul 2026 02:54:11 -0700 (PDT)
X-Received: by 2002:a17:903:13c6:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2cf348686a0mr189046975ad.19.1784627650811;
        Tue, 21 Jul 2026 02:54:10 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:54:09 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:48 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-4-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=1148;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
 b=nX0+oHRVOT/8hy2JeZqlgrRX+yNUpOOilCAnCFOqnVxG/qt+/MyMr8GD/uRYT8I+HIQeJWRGY
 eIHLL07yncnDepgCooWhcv1Zz2HnuthD/i8W+ZWxu6HCfOkdX5G/isE
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: GseN-2y0BI8UPoJFdWKNlHjh4rMutAgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXwdVfzaXrGlKC
 MO35a+CAJhabIBk4QLmslPq7fkqMr9JzmBLhTMqhJo5OsV66TeG6RIIto3eZyVJxZN/tu5lfGxz
 gHXvxCOTk1CsMuJZTj6wTJu8W9UVh61YkNXRoAyzAl3XU9Z94Q2jicwWnPqCdDo1S7Fi/0sLSUJ
 nnEjQMXtYEmcxQlL6NpELggFihh6VXIdYewNrgv5/PdctwtzaDkFnRvEwtxqJm5Jz+zgAsbejB6
 RujVaESuGhnVKnA3xJ6No5FvPIdRYGQwVhJDbgW5Bb6v8kgcPyqCx3LTl5Xy90A5o3T4fTrshRD
 Vi4fGpZoAB76J8UuU313vGrrJp2SqmS5qa6dd8rMYz3LgjeUCA97fBVtFxK/lVdzQsk+axrreep
 1JDs00VaH0pY6x1GGlM74Q/XBxPMqzgjZrrVuU7hA0feXnwiTQwTZnHzUGBcfyme6CYNvIwCdDa
 OOkUQooUo61AXQMNd0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX6mEhaSLZ7SHH
 m7agnLcjNqngUQ7jkRn4NnR9CSHbqpZtnbeDYJ2JVJwM11UQxRftM4O3ZDGlg9iRFpb21Zsilr3
 nuXfKcYLv6l4PuPQBqjafdFz9R6Wr3c=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f41c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bymAw6jGh9HDV1aGW0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: GseN-2y0BI8UPoJFdWKNlHjh4rMutAgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

Enable both usb controllers in device mode on Shikra IQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..2d4e34ec3b82 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

