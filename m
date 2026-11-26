Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691156;
	b=IngrYjUGU5qDTsfoWWT6rN2Xs/xei2b6CyAAbFpHRRmKTfcyN2pW/GtELpSm6jwO9ixJ
	 FA6W2Hc0VxuCvdu4gl1LbjqGCCH1hGJmYylNHLO69sHrXwRR9xg5DLxBsegqDvIPbcaMR
	 WvRYz8D56VMa/WhljGqn2NGPfqD9A8PLTEa+G6CCJfkQHmQn6wQvvcafg9I4yKysEdJCR
	 upBVSo4ESzptyRsGEHzIONG42VXSnmcAUS/xxz+b0euPNf5YjUq/6MQdAuITXxw8XAH9S
	 oquva3Bdj5WmsUa3z5GmitXGHU+qcM9qV5Z35F7tAfYdoRTSgPqJUU7Zj4vGf+KT2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MaYKdfdsxCzGOlEyu6PwzaVrn/czpCrdjc/Q2aza4iE=;
	b=FGTeCFErgk5Wlu/1m14jTNgrt32yrfbeeF61V9usO9vOdj3vKkv/BqvPJC4sRYbaC0Zw
	 Ce1bQOR10nlJlsIFJe9LnZqFYzKOy0Y/7ktQRvwVIA0waHKU47od8VvdUX7um6xdJK+vy
	 lRFQE9R7zkClfn3RhGc8a0OhBhRG6PaEXUR9WzgO+ufLhr/Gh8+QBELuumaKb5dg6I0xc
	 9ftLjAxkyFsELX12/O/w7M/5dC0wZdQWF673uaXm/LaegvePugUAdb21jm+Olh+XY/R1i
	 47QB4p7ukA02LS/yJK7+9bChEZZo+qp7qn8+Ly6bcDg6iR0P8yM97/YQ6bSot4uIzuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVQFuBpJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bloe09Mk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4878606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4878606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVQFuBpJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bloe09Mk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXE7s2136123
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MaYKdfdsxCzGOlEyu6Pwza
	Vrn/czpCrdjc/Q2aza4iE=; b=JVQFuBpJEAka3eDZtxIFMgv6Ha8CXLdbCo5mDw
	9OSBGBE2OSo/Yc1Vr4fIIClhpNQzingA5BGKV30YEC7o4ATxXhOSi+PKKIUR0YK3
	YedbHGcL25qkVrq3+51fskru3eSq8bIP2AObsVG3b+O2eUVQJVNPbe4vhbYt5N+i
	X/zn34mWeu3WCDAMbQm0pCivZxjvWEpfG6Rr17C+GqkWE74toZQ2IxDEJBcyqXT2
	uJWRc5w9VIHGQGjRyQjYpo5tg4UiFA8dfs57r33svDC6TMfPhvbHaXn90waOmt6B
	Cf3atwk9WM2BrVEjxyyMU71aYcXr4Zk5aHHct00N0vCZOwOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aektq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:05:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so5931192a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691154; x=1796295954; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MaYKdfdsxCzGOlEyu6PwzaVrn/czpCrdjc/Q2aza4iE=;
        b=bloe09Mk79icEfP9kw4kF+X7fEHneZsiQx3GuqVpaSGAwWK+hJTrUbOybr1d8P803n
         gfjbj13qajsM5L1i0QzfoG/qx8w0a8C+h7nvblkJ7K3n9tuThHyKhIZvPt1PRBJ1vuAk
         ZxxwjfTUlrg4D8GNMK1lvt0V0M4Ho5OENlZBHIbuLcXCTDp2Uu9fVIWrTJai6dvwoKQO
         tVtkmhHsMUUy7oKZaNhNeiVIUYohIJ16dDTCK8bj7CRDaTbZAtfb9dSbIPpxPQoSjrBZ
         bDyk/fOENxwp6rwnzm8BzKK8HmfFVs4yadc/O0S4t4CE/i6MRdXIpeDufANfkCYMmoE1
         yWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691154; x=1796295954;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MaYKdfdsxCzGOlEyu6PwzaVrn/czpCrdjc/Q2aza4iE=;
        b=tIQmLZ4wfgf037cS7YQkj9lgZc4flY7ZELw6X9VY4Sunsxi8CAOQFeRb+kw/s8/tAZ
         uyNvu0oIvIdxvJ0N8sOaRiKWNpgXKZBonjO1tosthjEWdXVVv7PYbViEIzochQeHJEhL
         krdPi8lwJQ8bXS78Jm0JsJmZRPfst4CLm+zmtnVtsf43clA/mA02pfsnlmTyIQlOyNs1
         YvwFWy2OtMnAoSEHOCcWyU3DZV+24RBUIC+iohja/ZFcphOOtLYNYmboFpd2Fx3XsG84
         vgHtVs0Qj/oyN9IV7LuYbVPYshLXg/uM8JwhiAkv5NX0y2/4EiASn1YZRxrRfchQ9j8L
         S8oQ==
X-Forwarded-Encrypted: i=1; AL+hErEocK5fG3Lo7HClRPyUf5XC56r+60HfEvhPXS1LXGySTFOyT3CkjCb1lz2Zk5ml+T+zoiLW0kyJHcAK@vger.kernel.org
X-Gm-Message-State: APuU4Z8SxyT25qMfy6a+NP05X71dZ5ph5sfriXQzCt24j8lB6sLgQZB8
	E9sm1IjdGCoGbqBwPDCYnoBQUeLesGa/EfP4GoBFKs2urSPG+9LyK0KGZXSsyOPXBwqg2evCsog
	jZHQKV5oaJbEBZdmd1ClAL4MM3Jz2wxtSm+C7eH+KdWBMXVOMq76atSwhsUH2k919
X-Gm-Gg: AZFdTZeQLlL10cFCgTOg+hB3rHu5PvOMoWko058yLFqlysQKBc/8+YKe7aYnfUoVmM8
	ueLa16TwhXGTb5JCXYv+b36oKedxRkDi7bYBw7cwR1l8m/h0JpkFUOsV8W+Vjucs0MKATfB+2z5
	B1pnzzNOgJwg9czYeDXl9G82VpMbGertH1888Qxx0h3ZFCyNf5exUuRpto7vleuw8buSnbzxI+w
	BQ/FsBp3Kv87/kfhWi72+9n531ZwCZmRMo130YgKZzzsLnDow0kokQPO0ZDUDjFl5oZhQNCR+UI
	r2SnrOtXcZUMemYUKSErA0HOheyKEkpz54l7HzfIgfvyNzwiZPRVl4LtKjPMCZaxcNvq6HuNO1Z
	QdQTU+MjBzoamTkRK8qnYJFgkNJRpo8i2MMw1gZECchtdR/lphBogR/cCklhuNH0DZKnCKTbXEt
	g=
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr19711245a91.14.1795691154273;
        Thu, 26 Nov 2026 03:05:54 -0800 (PST)
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr19711212a91.14.1795691153803;
        Thu, 26 Nov 2026 03:05:53 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm35522909a91.2.2026.11.26.03.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:05:53 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:35:47 +0530
Subject: [PATCH] arm64: dts: qcom: Add PM4125 charger node and shikra HS
 phy bridge
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-smblite-dt-v1-1-0f4f4401db3b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIoSCGsC/yWNywrCMBBFf6XM2kCaVx+/Il1kmokO2FaTKELpv
 xvs8hy45+6QKTFlGJsdEn0487ZWaC8NzHe/3khwqAxKKte2yoi84IMLiVAEBozoAlLvEOrgmSj
 y9x+7Ticner1rs5wS0GcS87YsXMZmMLqTxg1Wo4qoMVqL2tleGSvJ178uxF75Dqbj+AGbnZ0Aq
 AAAAA==
X-Change-ID: 20261124-smblite-dt-bdbfb6dbe86b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691150; l=5593;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=CWIhwRJKjxCTg/qyIa0SdjTfpOVxU35BqlbkyxiiRVM=;
 b=5cx+sZwVh6geE7aQgIsrmeUB/hcAQivieQ1iOLFec7IhzC79ZoS41+vlKifaMRJ3D90N45HKQ
 xu0ulAxrk22DlUfXaf+VzqTKvM3l0RZhU64ODPaY6SK6OcAbLrec9+C
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX0nMah8z4Myu2
 xoUspBFSHtmZ4hHxJQN7RX4Bx0u+0oBRa28UA+JVlUWFjL+ebGpCHN1di5zENLjd6vtDG5h80qh
 /BPTCazLJFpuDMlrxI10Iat81LMERLxxgKBOdOKUbHv8GgpXoFOQgabSuFoOJk9e8wZPKMASx8D
 ZrlhB1cOY2XJEz218kG4kq2LZwNVMLE9MZLute3EoCMGq2FeF78hI5wboalPVzj4xRY/7B/OLTW
 qlZvQ3VyXyJ8CIApO5L6GLE/uVqdlXgsim/M+cPmCxAZIy4NYsUYfdZeGK4AjJAaPkiblYAB87y
 UJbr48PcFvbrEU5ZFiLcggolHSIbYhqZ9ynrEp6YpwRdBA30x1lysNqsbddou9uVg2Q+n17qwmK
 zyopIjyzIABGU5l79g4aB+xe/o6gwqB2GilOU3eIphPchLAbX7utVfYNwtu2ttRsf3JsrSazmfQ
 mxdtp3NgeJ4SXHz0ksA==
X-Proofpoint-GUID: vSj8J52HrQNUior20aJdoI2MYcxXhGPD
X-Proofpoint-ORIG-GUID: vSj8J52HrQNUior20aJdoI2MYcxXhGPD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfXy3XarVEtJ124
 7WVQBitEQyNRquQjNsxzzYzPRAxm8NI9F5BJj2Hp/zsr5HIFw5ul1he0838v07ymFUBNfwhxoh5
 TIze2D66SycBXIvPkyITQD1nkaYskCs=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081293 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tcFNqxxWQAkJszAi3tMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

PM4125 integrates an SMBLite switch-mode battery charger. Add its
charger node to the PM4125 device tree and enable it on the Shikra
CQM SOM.

Shikra's primary HS phy endpoint was wired directly to the dwc3
controller, leaving no place to switch the USB role at runtime.
Route it through an intermediate connector/controller port pair and
mark the phy usb-role-switch capable, needed by the upcoming QUSB2
charger-detection work.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
This DT patch require driver and binding changes for SMBLite extension
and charger type detection to work which are already posted.
- Depends-on:
  https://lore.kernel.org/all/20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com/
- Depends-on:
  https://lore.kernel.org/all/20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 12 +++++++-----
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 10 ++++++----
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 21 +++++++++++++++++++++
 5 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index e5797aa5a538..3512f84b2feb 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -65,6 +65,26 @@ pm4125_resin: resin {
 			};
 		};
 
+		pm4125_charger: charger@1000 {
+			compatible = "qcom,pm4125-charger";
+			reg = <0x1000>;
+
+			interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-plugin",
+					  "bat-ov",
+					  "wdog-bark",
+					  "usbin-icl-change";
+			io-channels = <&pm4125_adc ADC5_USB_IN_V_16>;
+			io-channel-names = "usbin_v";
+			qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+			qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT */
+
+			status = "disabled";
+		};
+
 		pm4125_vbus: usb-vbus-regulator@1100 {
 			compatible = "qcom,pm4125-vbus-reg";
 			reg = <0x1100>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..22a8edb5438a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -30,7 +30,7 @@ &audiocorecc {
 };
 
 &pm4125_hs_in {
-	remote-endpoint = <&usb_1_dwc3_hs>;
+	remote-endpoint = <&usb_1_hsphy_connector>;
 };
 
 &pm4125_ss_in {
@@ -83,15 +83,13 @@ &usb_1 {
 	dr_mode = "otg";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pm4125_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
 	vdda-phy-dpdm-supply = <&pm4125_l21>;
 
+	usb-role-switch;
+
 	status = "okay";
 };
 
@@ -102,6 +100,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_1_hsphy_connector {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..4feabdc34c3c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -177,6 +177,10 @@ channel@55 {
 	};
 };
 
+&pm4125_charger {
+	status = "okay";
+};
+
 &pm4125_gpios {
 	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
 		pins = "gpio5";
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 2ded25c4304e..808f07218841 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -26,7 +26,7 @@ chosen {
 };
 
 &pm4125_hs_in {
-	remote-endpoint = <&usb_1_dwc3_hs>;
+	remote-endpoint = <&usb_1_hsphy_connector>;
 };
 
 &pm4125_ss_in {
@@ -77,10 +77,8 @@ &sdhc_2 {
 
 &usb_1 {
 	dr_mode = "otg";
-};
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pm4125_hs_in>;
+	status = "okay";
 };
 
 &usb_1_hsphy {
@@ -98,6 +96,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_1_hsphy_connector {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d533eb6e774d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1083,6 +1083,26 @@ usb_1_hsphy: phy@1613000 {
 			#phy-cells = <0>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_hsphy_connector: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_hsphy_controller: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+			};
 		};
 
 		usb_qmpphy: phy@1615000 {
@@ -2596,6 +2616,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&usb_1_hsphy_controller>;
 					};
 				};
 

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261124-smblite-dt-bdbfb6dbe86b

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

