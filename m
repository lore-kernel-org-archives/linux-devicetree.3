Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDC435ABF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330531; cv=none; b=gYkIcQOpSEGrAlSCjnvxbHBeIt89RoBUvnzfXI8PS4fHyBHII32efctg+awwL2mblzpBhH79zqtOkfXALVkeF7W0S4sYATqAVnuAqUD22UemFUqCtfds0kb5YMKwYqqM26MVnZ1teiw2fG65qL3dElUoTClfRhl6WZK8J+YSbeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330531; c=relaxed/simple;
	bh=Gu2Qec0Cn8DBi5/qAoJJnBoS4AYcVox7BuSwo0xqLZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaNMVe4FcdQ1YUIzURKSmEYlOVh+JzvCfZEgX/R8rtSx3Pp3xzSHmjj0P+67VACosXOReROegJ8HmIJrcfyiIXF4Fp0+MvAVD7qqLXQl2pDHUbMKbAWyGLNOyROyoYz1+nIyACWkKU2AmpF93jwHBkKzWbUX7poT5TVJf1H3daI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/fOS7Il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQHLwwKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/fOS7Il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQHLwwKW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694Ip44180053
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4
	GqYiBAHs=; b=I/fOS7IlgjnHg9OS4LvfruJbJyxMS48/9BfouuJaWp023okk2rr
	vFKA/8JPRnoG/SU55vl6u2fpzTZotJvyNoANmTG5Nwk05mnxgIuM1G5WEB0Ef78Y
	7r9v3z1yLg7o8uGKMDOdz4t6XI3bGVQFjHJ83ey0298FdLirVtljqpxxiS08l23h
	w4B41+m3ZcNc+zkFSL/dNMj9EzODPWhYMVneP3T5/Tnqn57tYx45oayo/U2hRMUr
	sOxcb/W0QwpoPYYfFiJg9YW5p4daF5kb3KvJMgYFD/0EVYWQUFAVuOAmphR1Fbzm
	XocodlUCiveYEvf/3Hn8d4zPhbGopJ/c1ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txendum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:35:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e606e8f3eso204330085a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330522; x=1783935322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=;
        b=aQHLwwKWsgFDnuCw7H3DWH6cXMHRhVHqSe6hbNTF+arqUICCTj2kevJRHIwSdDqNv8
         GCDBVVz3sWtQLD3G8dldWDsIW1IUEWGfMh7gAgMh97NKYigEKYS9V1DRyk5WjcVjoxFI
         dj8sol4jCCdjOKnrTftCeJXj1FquVWGPQUxwA2Z/CPmcWx/aiIn0q4lDf0jSUnKgVdXv
         7bqkQFax5uHbKdPAVamU7GexlENUoz8oTQ30Qd5fxJF3RW1pZpFATjbsDEYJ6xA/ugDN
         qkWzztRHKwpboVag/tAGA/tPoA6HGiZjpcOVAOKib2Y988Rb8+4Cd3G0GVctPf0nR6Pg
         bjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330522; x=1783935322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=;
        b=LRnW7B9mWWEv7nw/befbkaRjvhdJeMWNa2B3bdMr9D+jM9U9gGYrqDq1ZwKaY/6Zmm
         zfeeXmWO/45Iba8vFTE7J9VTBbb9Clr6F+nUw4Z18Hbrr9nLM1WW628txz/8GJZcF6bM
         w+pGh9Bi/Zc6NHjxYY/qLYDYT/nstuXbHT282U1/ynRwBUcNtBUQKJwWJ++/q9wDTB6o
         kzwcLTVO3zDq3TiwfuQh4Znpz5X15Ej1ftzbf3xvCrlsXil3HZNV1thp2LzVmfP+VAtd
         5434Ke14ZpPrzxumxyF9VTXnKrPdAQDHJngVEtyv8R/ffEP5VL9771uNXoEv+ZQ7HR1z
         Tstw==
X-Forwarded-Encrypted: i=1; AHgh+Rqzc45e2CI8kgMVTS6Os+qhPvmiFyNCYmHqO0UDm+Qe8xv3RKOEJoRHQGWLSHGVyE4QQMn/CQuipbaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6vwKZ7sJVc56G7EBQi1JfiOt0inR/E6Sp2UEswfAzurVIXK3
	SKZ9FHXWhxi6RYNmaPFLnViKM5Sv13vGx4KTvQyvROKHly9OJkjbQ8fgNjJJ4jlR8jzhy2Nf4d2
	2dOokcpJm7SXhckjQBdGpa7x6Q6ocJ2Nl+E4I2FOvK1plasrMvKAcg2bBbKEFijIZ
X-Gm-Gg: AfdE7cntBJf9gs3HVNQI8w979ARjqAmM6vfmRFfAIYmlmEhSEsR5dpOpeCy49d19Tpq
	cdaBYvZY+MqdRLMK72RJs5rzhsXDUMjlcLfozLGf2S0bmeGSpl8ls3VZrYa52tMqzuECSOrJiSD
	noWiaRBXemAJt51pzxVTCfT07sdurPLT5GV291JANawbLmmchLO2HmUuot9JxB/S0IwTfMchC7/
	aUkrpEGXH+TGEzjvGnerdpkgcvbmShThhI2AR3Yo8LUn/BdY14/aIP2Ror78RxNNbUD8O1veOOr
	OfzXTDB5N4PejD9Aydc/n8OAb+q80EpzYpU4BFAY4wcpFIpR38jQV2n/n2ncnQINu9/dYWwdnRs
	bkGG4/ylbapMm6hbt66/ht26ZqaU=
X-Received: by 2002:a05:620a:4147:b0:92e:61f7:5689 with SMTP id af79cd13be357-92e9a4cb130mr1279226185a.58.1783330522547;
        Mon, 06 Jul 2026 02:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:92e:61f7:5689 with SMTP id af79cd13be357-92e9a4cb130mr1279216085a.58.1783330520590;
        Mon, 06 Jul 2026 02:35:20 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22617247f8f.6.2026.07.06.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:35:16 +0200
Message-ID: <20260706093515.274013-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Gu2Qec0Cn8DBi5/qAoJJnBoS4AYcVox7BuSwo0xqLZM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bTE0sRZsosY8Pg+hWL2hzWUh4qO4z1kjx3N
 D63xTaeqJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt20wAKCRDBN2bmhouD
 12ldD/9XA8/SNVf77cSeM7jZjnFX+aZRuKcZO6CGCd12ecOe1wezd/sW96N0RLOJJqkukXApRr7
 GQ73TULuem21DP2O+ATMlWUOdAY+Hfc2qnRAPSdwa+TwzsTAlEHj4IWV3jcRbVIEsvc97uMykF8
 Y8jP2/YN+JSAGXeuNHyyvEVqjZJfviYah0ucfUGDN3DOtpmyCpSqee5yQad6mR9rM+snc1wweui
 iaaO9QFI7JaaGSyTKijb1G9OshV5wlaJE8Z7awW0M3xkJqV/WSOOq6M9z93LOfO+9coOBdGhbbx
 fgkWyEysWsFiqJVNNsLe0g5fCLyQiP1+bBxQkujVoT529SmtCqlYESRjzMgfcBqaT2WcpU4FD2K
 cvAjG3b+gVJD8bAxj6mMV+ywMfTFH310oQchxMz1KWiF/AdenKk1+b//bvAmA8hh8TiKInmqH2D
 BXB481uPSOVKDN/k+dwZnTwXk+lbgddmpmM1YXOVoyS9dMtGwSpt7Z6QqpE4azAe4wLOSHd1b2A
 /9/p8VmIhL5e0X1BR56quhzrUU3Qj2yuBqb1Qq+iW7NTrwFlDRr66AnQ0IT+098ifZwa2m4ZKPT
 afLkoPvMnwjaZmnNWWiYoxqFBuVSt04MSWbyPvBtkPDGVr3UbwKH9joBGigcUtwkXwc0UyGf9yS SCE+ACOybxX99Dg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXw+qY3Qynbek9
 RzdaMQ3NmqCLnAIAB+uLk5wMIB8iyMbS8EOWQi5pp17HtXGyel5frH3wTjr5XK/atQKhAN380l+
 dyDtw1wBqg4uSDM4GdiyJvnSkdXpwlw=
X-Proofpoint-GUID: L79DZeVqjvQI_-rAr2r-zwF0zFIFqUXJ
X-Proofpoint-ORIG-GUID: L79DZeVqjvQI_-rAr2r-zwF0zFIFqUXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXwDrdQ2jEwuwy
 hqGWgCNP3eJo4UCpg9pKasQYBuQE1XBptq0JbCdZ6NdltPFsxKVJ2dgxnoFiTiWvVko6PbCY9n6
 dDJS11o+v79jpq6VeWlDaXOmnuP8EssSZh6V32S6mk7vHeCGglsnlykV1rOyvDDnQ8vD6djNVBr
 +tXSOHZWYaW7LWYssA8Qg9XdJsxQdY7fktABw2GSeOuXM9ylAy8HS6I85XlpvLosObNZ6+wxlcq
 3fingJrDPduXW3BOXcjrPkUjNraA0gS+fTmiAciCbH8ulZU+zBiCRiC1PA5s0RO0ZFlckfOVlRg
 yqcjL3WmIE+GJLf453Za7zmyAdwpwEWbxXPNCxfA0QpuaRSifGb10UF64Y1JdWCHWx6xeDk3prM
 ozYraFv00JvYvkROQPk+6TWJIzMLNcyeG7LuqORkiiHe4MSHtTrFZVyYYy5wGbJQBfByZWxGkv2
 p3Kc5AB8LWv1N7r08zg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b76db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=xiN1gQym_Li_Z0aoeM4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi      | 6 +++---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index b702ff066636..b210845277e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -86,7 +86,7 @@ touchscreen: touchscreen@10 {
 };
 
 &i2c2 {
-        pinctrl-names = "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
@@ -101,7 +101,7 @@ eeprom@58 {
 };
 
 &i2c4 {
-        pinctrl-names = "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
@@ -381,5 +381,5 @@ &qca_wifi {
 };
 
 &i2c_tunnel {
-        google,remote-bus = <2>;
+	google,remote-bus = <2>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
index 095279e55d50..cc8c913d2763 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
@@ -19,6 +19,6 @@ / {
 };
 
 &panel {
-        status = "okay";
-        compatible = "boe,tv101wum-nl6";
+	status = "okay";
+	compatible = "boe,tv101wum-nl6";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..ce27f314d19d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -7,7 +7,7 @@
  *
  * Copyright (C) 2025 Collabora Ltd.
  *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
- *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>   
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include "mt6365.dtsi"
-- 
2.53.0

