Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1905243B4A8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802859; cv=none; b=M8PXTmH1TOAR/sRFEYlTxccQzYVEgTE0XShqNupWjAhgMz7MxfQ9yQ02QOIonBevW2jtzXDXUkS3S17JJQ/6h1T40PvI1Va1RQfLx7VIozmYCQ745Kl4KQJEskP7ws1AGb5sIpwbA21N0qE7dwToz/TkuuGpzfvjxvLtDMqRVvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802859; c=relaxed/simple;
	bh=xLZ9TWW6MMQBSsF7j4wy/Z+2lMeLJqujJks5Zbt+zwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSXP39t/71sq+T4kH362Jo0kSLk1X6TFHwANQqlolsE1gPyr7cdgCgI7vss7cNNTMfWDIhdftJq/jIVS/hD1SI0ADU+BeHwZWS1C9sYZ0ocaImNURmRlXboeJtLLVbBe/INwebPLPWDkFF6YOf2JALdDrryR3+GIlx23SCAq2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNFLCanZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDMl7V7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNFLCanZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDMl7V7A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXls3648578
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKMLi0nVB7czOTCiwIlLyjNOiVt8O5c+I2yt+KJqUeo=; b=MNFLCanZnuFagL8Y
	jjYm1LEjpIvDvkPIzUlhLPMzz2HF1mddn02TOSMLqISHUyD8NxP6S9RKNZi8Jdsd
	JsRoFRlQaDHrsz+jrk+rICf1Olc7VsDC4HCzvThc42YJs0xn/kySrIvQHxBvoFMq
	CGL1JqY6e5iYtEY2ncnazs9RnSda271ss72H8hOW9UlU8k6RrP6dGOCtA32UkXku
	W5tBNNest80/nggoxkDcZvK6M8gifSdZ1SgwaeMSSYPZcjHOo9VqK+YYreJDuGmF
	AQS10dftRc4lECDkq+N7TYvUEnGVo5Gm5bsTeFAgfAhf7Q4cS0tOxiMp2ptON1S1
	KTB8dw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jj52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfafe8bc1eso7224395ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802857; x=1785407657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKMLi0nVB7czOTCiwIlLyjNOiVt8O5c+I2yt+KJqUeo=;
        b=XDMl7V7AJ0aI7QTGG0oBzzDDnnM7KMgKoG06xgY40UZrvb9DC18+Ig3NHTt3dhS3rX
         XAZniOTDU5nSgFivJCMk2vn+QvgfV9DIGwgyWcEW0WRyBHXnOBHLXPKpLJLn9fTNXB6r
         FT5gGXWA1t8J3UqgkOlzBNpqkImZdhSKK4GjZ0biiz8JMDBE2Yid0itDPJvEMZKvk9RH
         xEsalnDVgciY2ALNaqyX69UzEHiE/LvmS0ICKfnm3+BzJEtLWGKf8d3LindIe5POCAR5
         Z/h7ifzMI5jbgvL4r58BYx02TfLeovGQLJZm9gxLjI55GjMs/wMpUlXwk47xsc1HpmgV
         FRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802857; x=1785407657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKMLi0nVB7czOTCiwIlLyjNOiVt8O5c+I2yt+KJqUeo=;
        b=OfbPk5Faj33Zi9q83iDySLXxfJiNwRUxOwV/kRm7nh75E93qHzrX1d6ll7oxw8Fy8C
         bT0qSh0WbfWmhX58UC12qo/e7gxGAr9fsjCb+b8A64mNv0T2HzTs+t5HHTUfGfIjAMjq
         qBCDs/v4jE7h7sZfZ0qX4DTHi/u+UTQ8Begyz/gWqiAGQCnAf/6KyjsOwDtU3l7JQ69E
         5PlQrTL1POZU0TQF9oGl/rjqzbjLvQAdsa0l9D1ipHlO1udgLRUOIt97u7R9xzzOu/e1
         nEucUPhPiaZY9OlKPeAUc45GCXXHsYqFpTld9kyB4FABsJ3Yz2oCWPnjume1l2qiCs3/
         F6Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrWMmiCpKuyPV/Dmxl2EUaHdYOoicC4HF0bjsiVBoJpO41NmgjVFw57gpl9fgv4eM7SpARR7GeEGzRO@vger.kernel.org
X-Gm-Message-State: AOJu0YwXnYnlTd5tXVamnWAfAoQOSQbQKkPZZfMeKoBQ9kkXV2j0xgBl
	L/i+X5Yazfd5mfyYnMJ+6TjrLbyjnlb0aEAW6QqQNDHnCDuzniRNjdLBjCHTMeSuEswepbzLguY
	jM6cNGOadccSZWV1x9KqpPocH6pgtAiP1vg2EhqGfOBvucq6cEHPfRjxOwL8gb0kf
X-Gm-Gg: AR+sD11nMi0aGwtt29q9E2slmaNS7uUlvs69Z7Q+xnuXr+rw7P2LKVYkMIOVnWnj+nW
	jx49I0jwO6EYmT0vBzrymn0FCHVawiXMad6pyRjiaTdDW5B1P+URfmwR6Mjuf4FJV65ckP1o9CS
	9W2nvMgLwbWlYGRoaTIWL83B04s1jeIHRZnBEx7m29D5VSokJ7CR9+mtRn0Vklh3iub2j0yAFx9
	lF+Cf3P8K73IMXgLwAvOn7N7OVzKWCohTaqo6Ptth0v00e5dp3ashh8aVupfk61p89v05oh1fCL
	XAKvfJVaMsxscKEDiNJtaXbhsqMUyjJc/Cny0raP1nFhszjat15X47nX5a8xmUnoX2BpSUXT11C
	hy3KAoqKq/mTB1MPd0XLFMTiT3dBvKBUfEHW8y+dOhSOdUYHcMCcS4bFx5bxNm8RB7FekXw==
X-Received: by 2002:a17:902:e786:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2cfa71b75afmr31770195ad.6.1784802856850;
        Thu, 23 Jul 2026 03:34:16 -0700 (PDT)
X-Received: by 2002:a17:902:e786:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2cfa71b75afmr31769845ad.6.1784802856371;
        Thu, 23 Jul 2026 03:34:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:54 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-4-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=1277;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=xLZ9TWW6MMQBSsF7j4wy/Z+2lMeLJqujJks5Zbt+zwI=;
 b=I+nbYfmWX0cW3C3m7QLURFbBBQhShby+ipagnBurq8zD3+n2smINF0NQ6YgYlWfA8UkZC//o7
 vvc1AOqOou2CuNaMB4x1TkNTfnDm6q+Urc9ggXo1KhmomlOqcEj9zWB
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: wX4PwbWDAK1rRD1DlnzS5rdJKl_-WUMw
X-Proofpoint-ORIG-GUID: wX4PwbWDAK1rRD1DlnzS5rdJKl_-WUMw
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61ee29 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bymAw6jGh9HDV1aGW0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfXyr9ahV8XUWeo
 9MKa/8/5F2D5YGgFrU1N8C8mqPd+opysYg5lFUqU8NJSyINYto0+cqb2juJoFx5R9sJXYzLmEbT
 vc7g+NBsUgVFr/5QdaErcrvHSI4Jjxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX8qzOXcAhALWr
 9k5Bs49/1Mef78cq/w66Vri/uu5BBBVI/zK8OtvUnXM0z51fPZZg6yzD7AWfmseAhh19rfm/8lL
 JOrnaP2XW2X5RauuCehNDSkxlC/1S0zYEzS/92GoxgpOIcnNW8Q7N/nhyy26veA75iyVPlUFI/U
 5+6C7SJ+LKohO/dM/2FSY4ObxhtABMBoQnL6rJm5sRyBzXFQclLdxW+iWYIpepzZFLII561F3hM
 YuCnEcvRF406b8VTS1h0/qVrKyHlKM1VD7jtwLB6jQv/8Ts2VmCr94CJ+pWlp4fmaCHWaAMWm7a
 MJnFdB+WL8Fa4wCIvtUtfWV7DAn0ZQKAh3OwZQ4JqSP/1nFwgTuzIX3tNUWxWVmSRwzJZJaab1H
 JzFhPpXJuhpdNYRozMGtflM9tok1oOnzLTK7YiqbqwyhIojhbzTvbuctVu6Tnx+JSz5vuqqZuZK
 ewO0o50aDx070bfjpqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

On Shikra IQS platform, usb-role-switch is handled by Cypress PD
controller CYPD6129 on both Type-C ports. Since those changes are not yet
present, enabling both USB controllers in device mode.

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

