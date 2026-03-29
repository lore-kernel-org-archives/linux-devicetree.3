Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC58386C0C
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806795; cv=none; b=VkR77AYt2+0+KLZnYHgllv3JSqMR7QDu25PB823vPGhf8oRPb9oHZCzJH15hAHKge143FJymez/2IDQURd5EiEQLVc4Kzi47oNq5DN/Q6t+2GMmUXBfmBjewIeJMwnTdou03Kc9Yeqftez0OJ1zWQSZtY3NvQvahKR8xnO7HpEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806795; c=relaxed/simple;
	bh=ODr+g8vdL7jPxZ/Q/ckZLQFp9txrNdD1+OU+x8VJWuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jNzI5rcNI5HO2vjeTFlB3mCKl8P9EeuVNeIpraEL5ouWgL645eITlAi8gwclkejDFeiK4T4DkSf10b5O4HORleAOM4e2qHTprwJr8D6Nd9GGxCBdMLG9ULzIS/YItPQX5z2mxG/B1X6K0c/ssmt1f0+QuJ5Xq7kkdWTkVNyATuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QuYmbRvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffCZpHo5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QuYmbRvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffCZpHo5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TFP7dJ2765461
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=irGbC8e67Jw
	K9xD36bR/61Sw8Ivxtt3zJDyD8gAuLM4=; b=QuYmbRvKz5MO7Fuc+a0NFS5DbEx
	KbqBDeW+rzDEZVXaPmXOrH5KKrxH/6wZqwEuCdg3Pf6EhxACzeByJqrNY+ub6HyC
	9pe2niCCIoaS+zEzTORS3q49T+hQrKPwflqu1VHDZaQthBCb3AIC5aWSxFgxTAkr
	FVKXDvpZRVy+xHuhLcuOlIMA1AT9kxDmqJiA8w6c9I4PUyyDg/aZyqbQMsmSOLst
	7GJKMtgZZ9KCbxLRY00rm5adhfYzBjvZ44nTl7ScTPewy1ewVAN4JO+TKUEGuqxN
	jHLftdCXMTNGcFo4ILw29S3sRqzx9qt3GuVFvbsGAWiVII1KjDqLVaFmmlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c18jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c74262a2988so6789172a12.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806792; x=1775411592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irGbC8e67JwK9xD36bR/61Sw8Ivxtt3zJDyD8gAuLM4=;
        b=ffCZpHo5SPTmW8hKI1AmJF2ocp2Vky0Kgj2nSsRxxR8GcvBmcnMM+TXBrc/OFY123s
         tLMaioAAH07gewNZ6mu81pq9yp3e+IHnIrjZVegtULKEtBuNGbtjlZc/hrGNtb7OXs4j
         MpdUlqdmbgIg6H8s5PvhOaz5Hiukq8QqP/jqZAju4/znGfNoHj5nLVolWw2ND1f7HhSH
         kf1LSM7kbSuQz3h+bZNr+NXvK1TYBmoyI1KNMMs8LH31jbOrI/tknm7ndY2ea3zYiqn6
         ImEyH/HWZx+yXmb5yDsKxNPBvFihr8L8eLGmRQoXksJNh7/BSK0SoVQrmfw0n2tVhPxQ
         QFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806792; x=1775411592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irGbC8e67JwK9xD36bR/61Sw8Ivxtt3zJDyD8gAuLM4=;
        b=fc+y8TQc9wVdnJwDdXAmSNQF0FS+Ach5HiLf6pRbh6KeTUFJ41XsupPnJECctkCId3
         LTPCJLD7jqHYQnD8M5Lxx4+un5/xJx+Nh1M5bvvFHvTKcAt6hcmrMT0KcYY83WPNz8MJ
         r1qKfnzVnURby0tiqN14+E7Vmn36veSCrvjWqNWiaGPbZrp1uMZB+xKEZ1+CFb+T3FOK
         4lg9XO42C7yHJOOjocv6KmcOBUMi5gZpPjGUAiJL95uWSNFVl5JWBSqjr0RvOI74yMQp
         v2WztTwilMnqflud7sXYSRFHs+hRunAG4MttPYBDbmdXmOIvNCYso+iIOJ8vPyEXDBTU
         MIXg==
X-Forwarded-Encrypted: i=1; AJvYcCUbFmigb9cq0LVrJl3a83+ZXqxHSqPs20fplxJsbW1ClKZQefFUX4ZHT5heUk8uCFinzFyGuDr9LYho@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwUNpLkpHN4DLdnG/p65vImSHa1nKiVHLz/9dh/YX6DMzU8GG
	Ic9Miu554vGdPHOffbpLF3rGh0okgtKwf8cPMT31oya3DWF3VOvgmaEm7ESmJNI1sr29uIll7ff
	vdP2mvUGDVakT00/8IJyz98SSiZB7kf3kLnf0gmMApePQqZqp1H3Z4ym2nmJfUTk9
X-Gm-Gg: ATEYQzzH7l6NoB7CNVvcbNe4q89k9Tp1rbLRm6k6fNrH+91aEfmOHj1wSQrd+cjScw8
	HqbDZ6Dy420I1FuMsgUiKW9JcMTZS3zB45/Wrz/Bgs5kerQu9q8o+QAyveCIsgwCRCkoaCyVt7I
	6w27fxBZZnouoFHJ2IKtqQCd69pgL2jHrnmXW8ZvF4XsguRuFpABiubQDVMitVRBYxeALt+qfmi
	RoXIQJrLH27N9vQVH+RoDG93CIOO44lbu+7tAZ6uRGp8e7binXYAfPyXqs9Zca/fdEcHZAKQgkj
	TW+d72+VXmWXyEOkdEoaXXtc7YCb09hBtCaDOntNySHPgTQ6Itans8+/dDoAn1iTtGeZ9E9AUEy
	HRYFOKFYszVqiUq3Oc9KgQeodx7/JqHGA763pjqZ7xLL6xOg1Ir2DzRSvc1s=
X-Received: by 2002:a05:6a20:914b:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-39c8787a81bmr10444196637.2.1774806792281;
        Sun, 29 Mar 2026 10:53:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:914b:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-39c8787a81bmr10444180637.2.1774806791818;
        Sun, 29 Mar 2026 10:53:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:53:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for QRD platform
Date: Sun, 29 Mar 2026 23:22:49 +0530
Message-Id: <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfXwzZOrNS9eDl/
 v3dHHn45w7+rO0aXKt99WH4sNCdc81vJoMv64DmkQKmU3bof511GG1Ed6+3SxvCjX+Pr/gwGiiP
 7z32AXOPLqWYM0jwZoZpGs5smIYU7PPiD1x9VtbF04pOLY1LoVKo/cHCzme1QVERKhH3nj/xOvv
 B73x/NB4PxPt1+mLt/pRSzVYpD/0hBZApvKoNYRBSXWniGp1+T7WB9/kODQ8mdEXnPueXyt+dXx
 LAs6diSOzdFcR0pZvgouBfU6sWVP6f5+jdhRYWnM8OxDJndFDty7nkNRgV3fodAvBrlWsViGoKO
 Cpu5Y10mqnXSlfMpf1Nm48jjplnX0KjpS/3Y9t/tJJqvhxw0FY1oTzck7eqPCdwPq2ETUtRm9Et
 n/m2wPcXIOBQbZMx8L592eAbKaJx4zm+cu0vx2bzzBd1OBoRGiUkXRvGS+ecFS/ytX5uUNNavbc
 BkMsALE+AzNgeOmRtYw==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c96709 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=xssyCF4TROwZkTjcOHoA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: zXDN585XOKxTTOgFAdZts-2wy4Y5DT-G
X-Proofpoint-ORIG-GUID: zXDN585XOKxTTOgFAdZts-2wy4Y5DT-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Enable USB support on Kaanapali QRD variant. Enable USB controller in
device mode till glink node is added.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 6a7eb7f4050a..1929ea273a4f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -80,6 +80,11 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	pmih0108_e1_eusb2_repeater {
+		vdd18-supply = <&vreg_l15b_1p8>;
+		vdd3-supply = <&vreg_l5b_3p1>;
+	};
 };
 
 &apps_rsc {
@@ -821,3 +826,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};
-- 
2.34.1

