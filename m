Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DA47B438
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627646; cv=none; b=S7EpmJIkmKAxZrnUkmRAK+oTInjQxqIjlBQPXDR1tE5wdc6KlkUVz34bqVg20h22Rqrru/3t1VebtEYcB1RuaXIKDO6RCAXFrb2KDUC4wzhNj5luQYfhbpgjiNeUHsFGurZUHCH7Ug94h9cnbW9r7OFThA830fiIIFpxOAptmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627646; c=relaxed/simple;
	bh=QFwK9dR3l4MZJTeo16I2DiIYt9mGiy0INjCVfvXuIXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGQNSoVk3iL2lOziss9rZKSf+vFY5y+RlmqokTPnq3ZoqiemgpkTSaKQAAYtNeKyR3GxeEK6acxp71vqjg4kHkpoqM9nwvIor4T+VGPZUwY+EeHiMP3j5XOJpFZ/O2i9bqPCrVChkDfNARN5hydjBXzXKcX+O3LUexJSBSViYUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuIv6kHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQ5C3R0r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuIv6kHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQ5C3R0r"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6bwu73978338
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	My6U+9cg+nneN1dwgVF+a6eedZ98VU3u2VUI77G+2jk=; b=WuIv6kHQxBZHdQoL
	gg0eba3yy7jYWrENdcX9HxAoMUkFOImdVk0WrhLtuvQS0cMNVM0XuoQHx5srJvcv
	SKDZydIh9hw2lYrMoJiJC0Y4ZWrNXd3T57s+sSa7RC4YOVh3cSL6GLmW+Gx0M1EJ
	uM/7gHIkiYf7Nl3OXBQSdjDCAk0wuAR9H/PzHi4vvq/bZmxQC7gvnkAQShkFLgH/
	ubXcmvgro5bOcDPM9t5Vo1+Iv8UTxU99/j6eS/rxSGGEzxN7VFjE6Op8HIGS+30i
	T4yvOSmmx7EfwktOxBRhQEVW1VuSIVwzlvbn2vXnSqlEBlJsdfXwRWGDLvH/Xrqv
	BTW0hw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43tta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so195381525ad.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627642; x=1785232442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My6U+9cg+nneN1dwgVF+a6eedZ98VU3u2VUI77G+2jk=;
        b=VQ5C3R0rW3M9fzjKLD4dpHz+F5k74jIiJEGFE2wfwQ/RZuSNH2pbk9lbCa4HRtdHLC
         zWmVBDIunuXXdzJzIepFAJauTxGN1ZDAr0XKldVbh137/Elo0H1t2N2QlmED2DFkcVk7
         1OmmXr5XVImbdunA5xBbkvTCdjPnuNq/TPQBUOoV+8+LCzZT9mzrbBmeiC9hs6tbrMwY
         5YmztZV6jDbz794Fu3O/srQ/jFB9sfPQrHXRzkfatKrC8BtZULxcLyCf20Jq8Z5L0NBy
         pV9bWDe3qtFuCZ37HCNHzMr2vS+RXGVfB0+IZo28kxjcHOBVJBL6Ie19gau9Y66kVkGR
         5etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627642; x=1785232442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My6U+9cg+nneN1dwgVF+a6eedZ98VU3u2VUI77G+2jk=;
        b=Z5MP7/yR36Vtka7JcX7wlUUtu1max7FtCGCfOzaxAHT1/BfazJaGZinBrVLsj9vh35
         2ACTCu33nqZpNiqUcF2Yd3olg248TYUqPYid/dbt/D3RAiDMmNE5LAFxdwRwq/840KK0
         UIvLJk+GJr0Y/PjPAW9pMD1Lb4A1TxLzuWDM6oPEQAHnMUfN0GyjWAuKGSVLqd0MR6GI
         FWJulK9Utx14hri5Hh4x5KLY29GqOz6xyAJfSW1hJ6qqYLaEnroVw9nQp3j+uEUCtOVO
         zYsV+yoZvSwZA5d1BV+ZH+0Q9BnnLLkJDVUfVO5llHzLsL9tvmGL6SrG7QoyjKNZuhGl
         BWmA==
X-Forwarded-Encrypted: i=1; AHgh+RpMrY9VzDs7WoLErB50O4VywvnjWN0yFp9U1okqa58eVXdXF3eiE8x779FYZ87DgqxIG2J9Rnl4FQLT@vger.kernel.org
X-Gm-Message-State: AOJu0YyplZGPopHomUY0ONXITrYoBGHT+fxo8SWVfbPmbJCgoOi8P6yA
	+kbepBvIwHYynJlj0ArVGcco/6Z1Vj8gmvb1azBfrAxuSq//B2VFT+ySnGuX3buSOrSjVeebs6N
	8pccpNxRD7sMI9Zk0QH72S/9KZPM8ic4z7TIHPlZybnmj/QO8jXc0ZaIM+edaGwa7
X-Gm-Gg: AR+sD13j7W7XjfzEdHhbRWIsqlTE74vgc7pLBgMDIf1Wb4WRitfWA1++AbCtQqOP3yV
	NBcPenRZvZvhN+U98N95IsMBUOmZ5gsHi2U5sf9niKqUTOxMyD6oXONr9rppI0PbMeRYoxWvCLL
	rIN+3bfqcRptXte9Bxj2+cSo/5MbVKbkVJa8+kBd8I790WTHavrV0M6576p2Nc4osMgY4kTo/MK
	b+24jxpA+9ZHe36L/YWnNXePvjt661xP4aqjvzv+7uPWywDiFS8uYEVWZpMPpuDnz1ifCroOVvq
	DCevoQ1P6P/Q8d9K5dw4DBVQWHN2T+9brQhUvzLztwf2wZDY/UvwjVKlEPoTts1a7dlPDl6aF1S
	7gst0gHdcHjG2tyN5ZVSEiuiPg9uRU5Nrnd2fK22z328AiuKFvNIkzeiFTphA2ji+t5Ao0w==
X-Received: by 2002:a17:903:8d0:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2cf34a0a6aamr196672405ad.23.1784627642482;
        Tue, 21 Jul 2026 02:54:02 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2cf34a0a6aamr196672065ad.23.1784627642111;
        Tue, 21 Jul 2026 02:54:02 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:54:01 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:46 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=1150;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=QFwK9dR3l4MZJTeo16I2DiIYt9mGiy0INjCVfvXuIXw=;
 b=v1wldBoeLh1HugKm1m7FDJfMKu/SvaLJNQM3kXSVf0Q6WRv9HNx1cnweKZhwnlSWCMuyePixX
 YjXYG/VgShBCfYYwsu04E7RxdH0OYIxpYkQAazswClOg29QQLC465/w
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: UazJWY5qGqkqJ5AyI9ByO7YolmlkNydE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX0GRDh01AEfNN
 qxVz9rHhm/PcaoRDZftpUCbWMH1Md9q1LJyuYko1866ZHN1PbhSy6510z5nUu2xNAJbSxjXdLtm
 149XgmIDnKLRE3A9BOjL462p7Z3QPFjCLJR94WfH7ojOfPumlsQGyRn1ExfEHy9MeMfxzMkZqpF
 UCkOPHwmlXST5jL0BtKyrCcS57I8L2gsbJoi4DUct5Tlx0Sof9ufN3vOSgeMzNLqDkg1Wuj5Ruh
 DkRrgHMJhKuYPukdU3WMKjGJHczJz2xTcexzpufjg6z5jsSz4a23Aq504n3NYEB2Fn1LB+IioKc
 QsC2tFD0DB4HlXhZNTI+4gYuqYL68NDQPi6Vl04E1MYkL4rU+WKdNuBCquyQHPecFQGHO5TYwBI
 ecHhbt75jV7DOaRUDn9tk1FP3FWd8O9invoPtXSvN3N/IToDYqo8ZTzhld6xomt4b6amXjIywXq
 Rjd6XW//1r/75AxjiVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXzqMYGZYt1XK+
 /Q4wql76Otc6yIfns/g2MoWoOtF6uS3tE/1/2t9GL7vOlQi1FpwOCo5xmMcQilYTCmiF6SXdIZX
 eCMFIuw9nJGGrdcUUGn8kuN9qlGce3U=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f41bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Yg6OHkP5e8T9rwZF6soA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: UazJWY5qGqkqJ5AyI9ByO7YolmlkNydE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

Enable both USB controllers in device mode on Shikra CQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..006e24a62f5c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
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
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
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
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};

-- 
2.34.1

