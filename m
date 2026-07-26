Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1113D7D87
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087848; cv=none; b=PhxZYrKVxhWIcU4dmzBQSnT1rxlXml5aPCZeWEsSYiMKme40l0rowKQb181p6hQcen3Hd6+uKuwuCRIbhcNRoDt5y3643gEl2qfAkgah01l+JVQMTrcMV7G6B8i2oqCBH4f1VvVhxXdbIqcNR5NdSOFyN+tR+mOpwhg74512FFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087848; c=relaxed/simple;
	bh=81h/NpUY+BAhMT5VzRUpG+usgEMwA+SqQU5HHEqWTV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/18zq0jxIkLtxuZQq308G1gLVA+hqxrmLZ5lRcTUA0FXap/FWbkMquNg5gA1oXlFxsXNKtQn0/WHUJ/E1ylYMWGqb2S8lI3L6IBlDSfRNolD372ERacDM0WEP1vw1vbUN1mcFoi7cQXl41O70fWNv1WqcmWM25DElYgcXof5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLqXBKXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fj+SKuGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLqXBKXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fj+SKuGn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6lqf1522977
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=; b=kLqXBKXnn2+ou4ss
	MpFEW4ut119gpthBedri4Wil63UmJ8FLNYkj/v6HgfVjhb8veTqbFHsqvRjbVsNo
	anv5TDcEd4Tb3S1A+qn51LS5lOAuRVlZkMnWltAH3YkTJ730orNWbpFyyIaWyQJs
	4ZxFyxL6LRMiuvG8RFIIutJTr2O9BU1HiDRG9AVE5lzUxf9zbLSgOFai5eW4rFK1
	uOoTWLeTu0z+U5E5l8YjLMx0OUyrm8B/hYw7hW0lYXep6q5fC05XtudDJs+owh8v
	RMtNmrqoED0HAINFKoB5DGj+jFbAGtSehdcedRjPXxUNkDcJO1pGl/tys9y/U27C
	1EceBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbh48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:44:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so25766431cf.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 10:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087844; x=1785692644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=;
        b=Fj+SKuGnkjs5fKJVmFw8z+EuMpLlr5X3gacZ1SVTYlEgxeRaHef1WjoKgd2KI0BEXZ
         8Yf/SqNe3aZEL/bySgZlCeCOMAjUPuxdE86F+RAAsvmC4kNLkmhsk1rNp9RvaQGN76WT
         3WNnoQoacr1nB2nKggrzCEBK65LjsC5GD/tLmyuv61bn3ghBhHXW71ZK9prHmLPNXeQj
         CxdzzN8klQ2pWG2i5kzS4/WFDEADeMymHWfhbwoKBLD8TplWAbxG638w99ow/UcS2cwl
         iRwJAUf8Ma1Ur4pFGno+/L0cFWJprxK3ZgoYj+e4lAHr+PJpJ/YKj6dsc7BcYOHBEhWZ
         ViBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087844; x=1785692644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=;
        b=U6+esJyjg2IMcizJPFnpUwdHUrvc+BptSjod/mzRr4h6zzh5OikQOcMpcXF6ZApKur
         8z56DV+sQFNA9JYknl3MbMvvupVfXHsDJj+85H4iJKgJjc6QmvV0vsaVTktxNkv+XzKV
         K7hnXj85PsRYr04ES08/y+GpgKRj8OYdmq/RjGCk37gQ0s0iRnBwp41JuX6l04VTuQ15
         qVGsff/Be2aCV6JcOCHhrxq5EoQGCalOcrJb5s57z57q3vKPSYlcCLlHf4+da6jOi7Lh
         hwcZ9Xv1+TOCxLY7mYXveUNB+VXyAi5b4iK+p2jKXYYe3+sRk6AA983xGRh+UYnKnEMv
         fEZg==
X-Forwarded-Encrypted: i=1; AHgh+RoM+8BfzaXlcJaJ8uNlMeuYKiY0xuDNRMZk6FLM+Ct2fYXBWbmN/9zhoWbGynsEULqtcdqhqKgW6uZP@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfIcMRqaXw3lHiG6WAXCZYkbAWTnHeNmPbD0XIkGOgqiEPe2Q
	Mj2LBvRo5zQrRNafTO7l2WL7dRVbL9YnJ00d4mJ+VEtfffnSstbB74d/cIsMkRmK+3vfNSFy7Kv
	pUSXWBZv1hmHd4q3DwN3Q0vAmjwOYi9QGvlKI/I5hqincVqjKkwLl4oWKthQO+cUR
X-Gm-Gg: AR+sD13cCDqa7WbqnPHCMcH9ccpQMy4APB7vqmCGF7a2ejqck9XEpm9MGW5jDDYiD3C
	Z/AnEJESMZUuz/Ivf/D8p02UGZPLRCkxoB0xhCyoftMCBFxiMw594Fuf3iweoMMUOioZ2H1N7eb
	VSghh4B4fjtWhTk5Edyip4+2L6vJizXFvi504V9oWVevAx1izqWYVErMDHHpkf5GN0lNpXjAUYK
	KMrEukrOW/63QjZV/gWbQEGsNyqz+pDW7KUztRjO7QyZB4XHP36nF2+f39EhnuO7oxSQihhoCKO
	BglO6A8gQ2jmthjRjjH6NHDVLhvm/hmzG3zREa6Ah/aW1mhUv0wL9h9KcZ8434xAvhI7Hsz2TTv
	KbcYMTThot/xieykq/8VC9WiK
X-Received: by 2002:ac8:5e52:0:b0:51a:8c9b:649d with SMTP id d75a77b69052e-529a86be9d0mr62633931cf.65.1785087844507;
        Sun, 26 Jul 2026 10:44:04 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51a:8c9b:649d with SMTP id d75a77b69052e-529a86be9d0mr62633601cf.65.1785087844051;
        Sun, 26 Jul 2026 10:44:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:39 +0200
Subject: [PATCH 6/8] arm64: dts: google: Align continued properties and add
 missing blank lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81h/NpUY+BAhMT5VzRUpG+usgEMwA+SqQU5HHEqWTV0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdNe3cbFFnuh9igHgMRwU8Ngk7wB+urqIPjd
 mIyohZOq66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTQAKCRDBN2bmhouD
 1+aiD/9Tg/88WLCYO9A7ibUJm0PLjbDYxkvxurEbuAFIbh3DpgIGFHKG3G8ZXtdU+338g6lkkaI
 NQWxiRtqwjpY8t2VnBNIob85dDh5+zAasCnkcfm97U2uwNSMRs1lKissKQzQVuM3/bOa4nlAO0Z
 2d7nU/KXqre0MvJQv8gLcyNpI5KFKONXEzd5S6D0vWSHQ4WZx6jaDLqlfvI/661HPTnoZ0QELuA
 Brh+TDkftis177bQeU8UyeV+F/vTcPV1rhtCz1L82/WNheyCOaDllhNOmuxC39Qr0p6AOVxatEu
 /5yZbAjC7FRAhLbNOhJVEu2IAmfzg6DMLaoYHFgMNefdFMnviw/CCLq1Kc8uNRWGN7/2k9F7P0v
 SL67GIN293GCbOIK2jAQXYljh0pRlE9v2skv4MdSkyaHUTGp1eZVITMsKP+lGwgJlWjHbPFSCGB
 /Ge2b9IvFxL+bjMtf2bKxpDkbPV5vQSUY9uWLAarChbhHpyuOJcxo5BmyuxwnMDm7UIF13FAtcS
 uPeVjnI6hWXy3nPFAvRHsoeZQlz/NM6x+Ve42QDXjIMqns5Rk+q49QjaCw9Brdgv0jYX3nlrk44
 vAw+OgXpWNd7dgVf+kmRNUaJ4VXjrHP72O7KREcLuAiqx/AXmukRI4QRzLwQP80pfw/zUxh+Boj
 ahqjD0hwRxBIJUA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX41LaGfzHzTcU
 Ib0D2fDO990uy55nkWV06mUa/8HF5NxRVPL/su7Ykf7BNMGyerBn3dWD6mTcwjigEJvZ/GPsiDa
 1yzPvCKLN3CD7FWzkKcKcwt+XffQA68ZLPWb7kjmXitnO6yz57hBMt1Jg3hb5LdAZpR/6aYn1zK
 zquqH5t44ILYNw2FSE6dvukhB8TKEsGL2l2pk9lADIdeP2rxefLNTxc2l7giq+ze0CNukjZvqRf
 +DY2WwL4l6kGPuNNbRXUeTfh7sD8+7AyXBqERuYjce2CXd9Na4P0SvXu+W6tJdJej8xH0c1ar7C
 XmxlsGNhVCz5edRBkLTejL7XGLemq57EpFgmt9mWDHryEwqStGJ+6Z2EqkN2wNkcT7tmH8XX32p
 x3fIGshOIvmZhvpKeVxCIvL6FnJOR9Uep8q71Tg5SLH+eA0hSv0yc2knBJdgE4PPUuPkZZqZKCQ
 8wj34caKIRmfUUQXrTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfXxXynYX9H9AX0
 gLHnNoAzCPX84Ugx7lvGNay+cQsADHY4xHGluzxZG0as9yi6qgzztfJ8n/DFUJDje/ubfYSUIUj
 F2PMSi1mLgZ0AxmQ2IhkFlqJPKSc0uc=
X-Proofpoint-ORIG-GUID: jXS8iTTIA_464J5oH9kfXDRVX9zPr9cF
X-Proofpoint-GUID: jXS8iTTIA_464J5oH9kfXDRVX9zPr9cF
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a664765 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JN4siRDuy4uOFAZNwAMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index edc38f2d1183..bfceea5486f4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -39,12 +39,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
+
 				core1 {
 					cpu = <&cpu1>;
 				};
+
 				core2 {
 					cpu = <&cpu2>;
 				};
+
 				core3 {
 					cpu = <&cpu3>;
 				};
@@ -54,6 +57,7 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
@@ -63,6 +67,7 @@ cluster2 {
 				core0 {
 					cpu = <&cpu6>;
 				};
+
 				core1 {
 					cpu = <&cpu7>;
 				};
@@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
 			compatible = "google,gs101-dwusb3";
 			ranges = <0x0 0x11110000 0x10000>;
 			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
 			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0

