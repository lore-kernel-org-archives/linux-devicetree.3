Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD93CB8E9
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618161; cv=none; b=BjU+QOPzl+lHjz9BNoeOxYJcCxunwhrrixwfmE7SB4HIxyZbKl59rjeb7lLSSiY2WmMnwQkyCD54nHf/B+XNmbyk70+VtNjPkj7E/TBuDWKVdYS5gX10ctaC5K1zFFvCBpkRo17HQOVY64N1rw92GYoNfYpgYC7ziyUfH3Ue7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618161; c=relaxed/simple;
	bh=o1wXDvo30FMDIMPKFAH3bsRXsfW4L+mbYBBq4b+PK1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyY++hTaA+3cDSsEvTEXUxJvbtFZjYoRPPZIL1amWXvOlYhZvvUVrATp5bkV3fzQp7HxM0zTbueqRFhf9/teIqwN2XtrlilJQx84LW+BLfaUqgm1gPWMsxPtlB64dV8q9wpy36FV4Fu9ugQTltTLCFO/fU7q3PCPH4QwVRjC2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcOnXD0a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHPKb/6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcOnXD0a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHPKb/6J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0Eh83739305
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6
	swns0hMo=; b=XcOnXD0aWE+U2m8h96uJdzQgZsoQ34jeelAsgamdHqjo5HXNWyI
	We3O81eZilEYJRq4tcDTqzUCeEBsfVaUEoCosoIqekJc8dBMMHNYytQddYhnSGq7
	Ighg6aGwACCd1owRBXdKmQ/Z6Q4ejAFQkMaq7MJBUts5yz0bhzLHEd3nHut5gvZP
	xC1IgVOIOP4V4ZCABoAyfCyeDL6t9Z/SZDC+4HDWJnXydXZWLPCmVZ+8rbg6dBop
	Ce4eCBNR8PxSdN5UuYbhUpsx8zqMhZ4mf8ECqzTkPaLjrsKQkvT4dENAnIrtdNZE
	5BSlrE7XWNhLcq7XrtlX1hy9ScHeFpe6JsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u99psk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:02:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so16323041cf.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618159; x=1786222959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=;
        b=JHPKb/6JGEvqJT2T3FkNS9FaveYDbO3qfentcOJ8SVi/Wf+U+lWmo0OjtX621HzaB7
         k+YHNVDEsaH4cYVOIGbEOS9kZnJUof6YKPpWir/b0/7G3M3nDHEagIuJE4fsjc7dHg0P
         iscKxvNbf0Iol5gaEzGBQfSdVHn8qh9P8R78V/5VS45lTDCbUwQ0MVAry8Bfgws3NcG9
         UEDThEv2WAcDeDv8RkkIay1iL5ZHwpTHpacxCAYvgVPaBySRXr4/brnCwWqecneU24Wc
         Y0QEZQhMJDPFdbwGPXOqHNDVVDFR9lRcVRB5sJ98bW2XUBeF07RcDW89obiIURMr1Ye8
         GO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618159; x=1786222959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=;
        b=a1jgis0zr+X8ZIlSKD5JB1dsMtqcRBw67p3+4YN8vlbAW/RicEMHfT+xwYWe+VD1tm
         21bUewfTCqBIFSzw6N6kqrxc41J5s3pD2NjGe1odXGD5+UOFxmswU5kzrkIe7yf3xNQK
         8Zjja5a+Lhx3iYYAnaOkn4RPupC2JVg/KnaM2w4/9qaMmpaG2AGnAfn+/Z+UmLufUDqO
         CirSF01LhyHI+XExBH7DNsL6I0OgNPr+VmARkkJ+1cV9yP7MhiunPz7hzQbkkynDBUDs
         65ld2X5035BL83uVHzuIKndLsiVQE26ntsWToYoTYZzQo4k2I9KTTqgGe8daGJnxBRVV
         n45w==
X-Forwarded-Encrypted: i=1; AHgh+RpyB8vRszCeoxZz0ZvkcNghT+La+BQV21oz9OIN7jPu81wcUec8q6wAc6wwKyFYtVuru7/jrmxTJa6q@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbE16BsYDzBGoT2eMD3NpKr0GTNdGhP+D9p7lALJ9Cec3U4gn
	5OKIGIp+JSdVS3PYVFxpCO4OD9GGGHbN1ETHwhYDp3e5nKFgcXoJVXk2zJVaW+0a5AgAaoHE7sK
	NTN76it3MWxv4xiNeCJLzdKuPCCiPzYuEugFIWlYIGOYRLydKnWiapuhnkS83THpj
X-Gm-Gg: AR+sD12IaKgQKM1ME4poZfUavsVZDfyDblgbyfWbSBxXepKvsBvxRYRGf/YZkSdo9Yl
	ATtjomLAEB2aFdYEbsopi1D0LwuWr66pI9fCcOkPt7jfO0ErW0JSpiFjsq3vX085u27/5WorvR4
	Wh3G2cRAOT7PE5gUc7AiYYif83hfNM01oqtMwBBNXb6gTx320+J50HjPCDTavNDRjNvGxfB8YPw
	/vZ/02AJ/2KuV4s+JDMvBdZtn8LU6WPPBX19mQ8Lcu2v32CZwxjgDfrp9lM1d9oLkQqud34xZrY
	qL/s7Tb7/ft/1/Rf1XB4QWJ/ZHzBKhvqZFKuS2lK86qavwo6oS5yODS6QOXBCzRLfSUyM7pQyin
	975s5EHhmqSrzVrXh
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr99692421cf.24.1785618158785;
        Sat, 01 Aug 2026 14:02:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr99692161cf.24.1785618158390;
        Sat, 01 Aug 2026 14:02:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b84fb2sm49521155e9.1.2026.08.01.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: mediatek: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:31 +0200
Message-ID: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=o1wXDvo30FMDIMPKFAH3bsRXsfW4L+mbYBBq4b+PK1Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7mYZf6UZdVCaz/eSojXugBcHrSXjG3JTpHk
 exuNJGcn/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e5gAKCRDBN2bmhouD
 1/o6EACJ+qN/cwYVo9+E0SjCZfzo5XaJLke9pVQV204hf2VmfGNPeJz1dzkFBE+QJ6GvLZtAF+l
 pHDyNX2QzpDjgr7yUj+x2cFpGuarWwyM3ljcRpA2gvJ8owPxAQfEGJI97TiDoK+2yYfNxwNkqEE
 EciQnaW6yFeQs5FP8qVMO4kWQyQe2uFYL0buF+96Gbf1xE1eAZEC3DZXMOOzHnN8nFFHH1tIL2b
 j+AB5IoKy8dcrrzQAEvtpl6niljpg0/iGu1HfAM2ayuOur2gUgGyip3reyUAw30Zx1WEOtBsJef
 l5iBwFshLGv8ji9lzJ2fCVJNza9uBK30tpxZX2enL27ZssJH9k8v7mEhnfzZvl+/5vk7uiS+vPj
 tde7cj7kgY+ezYs2WTQwVI6pgXCUbq0MHrKTsPfHt2m2GRYVlU2xJ9roB7UA3uzLcVre73hUqXD
 /urJ2lsIycgTE7ZR8zXKjzs7weDXpOi91UK4cosYA2M+0Z+B4WP/UznfP+j3hZKdIAW3z7m84Kb
 PNV2RW8Db1pWtUGtSSzPz4O99Kl3YYKQnjAFjlDp5d05idlYK0czjWUvy6fY14tUTrgR02r40ib
 XXkjidRrLzjdcQycfcphIkOdPdm1/4GNTVkiZEc7441Yek8WZOVeJpxbBtz4tzXPSTO+fA/iToq Lh4O+0cPxavM1oA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _bctE7jrukEimPeKUrm01w9IqwRiQR9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXwVVaN6d6lFbr
 i319Zxmk6RueNkPl/SU197KEBO3wJ5DscIbEv+/4xPCGP2aZcTKmFNY1TDYefafPqPYT5VsVOm3
 YH3SQD9wS/j4QCO/BCb2crPBzBtf0uJcnQ3ZX+nQxD/WusY0GBC5B0EryWt10pd1qCxNmV2NppU
 PtPrwNsCxUzxVYc0NH0MluaXFFDkFJx+wnEgsLbsJZI8SKY7dFJCiXKovzhEmOoXgHCan6wkdfN
 mTiqEll3ynGTU2HCgr6c79J0VNctrRFFsDbhLKhQMyrr7N6rc61xejWt8u3rfHgHwA88V1N88kx
 JY/EYRdBr9qfl6/KSU5sqaSdSP8GnOMNAjuhAxAR+mnB4pRbyBZOlx993vBVzQnodTcQ3Tj+bwq
 gl+gyt+e+du1gXp1gJdeYt4MjaQQKPaaJ4MshCXCM6yUFJ+aM1n6fApjnRXUg/pKPBw1JDXvLJR
 gDesOlzubxZR+PIvhGw==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e5eef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wb8IN-ZjwPUj9z7I0xAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXxqvapFXgVhl2
 kmf2HOigwUvSKh5xjv4JcXLXHz+O5ntbR2HT+qKfnNBL63tf/7cWL7vUI9UDCQ853GjkzZXDdLp
 ZX4ovZsnqOoS/VxJpnI4mDv5+DmU5Dg=
X-Proofpoint-ORIG-GUID: _bctE7jrukEimPeKUrm01w9IqwRiQR9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like redundant space before final ';',
which will be flagged by dt-check-style ("redundant-whitespace"
warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi    | 2 +-
 arch/arm/boot/dts/mediatek/mt7629-rfb.dts | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index aa42377b47da..6e9ff0add169 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -1091,7 +1091,7 @@ pins-i2s1 {
 	key_pins_a: keys-alt-pins {
 		pins-keys {
 			pinmux = <MT7623_PIN_256_GPIO256_FUNC_GPIO256>,
-				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257> ;
+				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257>;
 			input-enable;
 		};
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
index f24ebc20732a..71a8e8fe28c0 100644
--- a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
@@ -220,21 +220,21 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_txd_rxd" ;
+			groups = "uart0_txd_rxd";
 		};
 	};
 
 	uart1_pins: uart1-pins {
 		mux {
 			function = "uart";
-			groups = "uart1_0_tx_rx" ;
+			groups = "uart1_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_0_txd_rxd" ;
+			groups = "uart2_0_txd_rxd";
 		};
 	};
 
-- 
2.53.0

