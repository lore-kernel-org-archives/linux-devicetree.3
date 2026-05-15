Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E806188CC9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826219; cv=none; b=qVltLmX3Xl/7ETQOQqXnCgnynhLBTQoXK4jArxq3Ce/tyAH//vOvLttMe6lFobpHnoBw9bJqY30xeFohg3NSDIppL/RIwBqwME52zvZ9Argw+SYf5tfaqeKGP/LUTumsIonB1Swlnfkf+WXN8yhYyKmiOIWyiRJ9J8GnkCwiiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826219; c=relaxed/simple;
	bh=fF50PbMAR7BH/sgMSNtBTQE1n5ShaDM/5WLGANk+6jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n//TpyQ8OTxSHxR0cGGFTnhRwfQ+rGFaJX33G4Iy3fZqGBZLQj+iGZDGqiPooz3akNVnmXsbAejnDE60jZTRn7YLEWPMHtAua/yZ+ELwD+GXf8udthx+HDdhIZnckt+F4NO6+a6r9326od4SwwW30USdRuaz0XWsOVkclYhR1tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bm/+huig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAKsNJZ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bm/+huig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAKsNJZ4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4r0dL3200106
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lJqLL1IP9ziWaZjFZONg+8
	KPhw9McKxMX6fFKP1MWbQ=; b=bm/+huigDidGrXwDsectCtFv1bi3pkhx0kQmeB
	xhvXEdsW3wdvELId4FvssmEfwuGxjXoADjFWf6BMDgrnij0tgVnp+1aVwRt06dFo
	ORLRyYEnWw+KsJ5fValk/maHlQSP4ddLRwQtt5VMBLiokk6gzQ8SFgldGK3NvF9H
	SNnOZTvWpw8I0fFZr6FiVFYpyfI1m8+JSzf4Gj/sTQwEoz97tICju9qQqNGol2rm
	VHzi8s/vMfjdMwNKHf9arbD59aqJ5tdyFkb2SgKCx2eL+piqAifXzyFxoylmp54I
	imCNF7FhDYM9BPmCQddCX1Btn9FBCDBw6d6s59vc4o6/z9XQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qsusv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:23:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so8564554a91.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778826216; x=1779431016; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJqLL1IP9ziWaZjFZONg+8KPhw9McKxMX6fFKP1MWbQ=;
        b=LAKsNJZ4g2hzdlm+htjKfmJMhD2xh3U53psSdM14fzTDJEzlhPicahwahKUJm2LRMz
         9NOJ1JhqmfI9rgV44d8VObw9GqY7nVe1iiUNU4rfpsYaAr+oAUnvBCcwb29/VpDPNSxO
         dgeljLwV2RhkofCWDjKJyDxbIjJqqCbNLWTdqvbIZjTCw+i8q48e/wYjZneL+NU0Uk85
         YfOKI3MZ2BRLVedVKvP3JfADhQmpuWRcrNRt7lge84OiNvbHjBta7EIcRHFVKgwu9xyF
         3Q1HSoWJtk1kALFZWOCySdGxe/O1f+cmg4GMIYaqJubyvyGzAGKxudOXab28dETexcnE
         8G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826216; x=1779431016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJqLL1IP9ziWaZjFZONg+8KPhw9McKxMX6fFKP1MWbQ=;
        b=Ww61VgZsWG0teK7tIxPoX5zYoGoS2WMWq+N7TfM1YLvDKZZT6KHMqVUtgZ4Ssk9zAL
         Ggg+UZ6gmfBkeRubF5m8ixlQACWhmD7Wh9Kp359jpm3buRdSAnyL0weJfYILnMWOLNL4
         Q9VrI9u0cVrREWmj02oe6G6N82V2cLaesbYiHs3wyTE5dN8Iw31lGwyEjubpgkw8KqNV
         aANqbbQCehd+YUT7KZgVvsL+xKc8KR3nqSLM5M1csUB11u5GkyP+p9C7anAgFlmj2M3D
         EoZ/G3IIuaV/Gdth0AYuFgsUuWmSmdLcBbpNPl9GxD3PR8N1+tYULrb6rml9NxKTTKop
         a9/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+7hucru0+pKWPwmPxCaZ/1McTNAXBXXq2k1KnEYz2X13ZKyJD71IXRriF9hl69A+4kfUF/4F/TEhrB@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUH3+hbYSYQno3e6rCLpSZpKyTthpXgLf1j9KrobHa0Ne0cyh
	bymD0u7152CrfYjI34Dkuud22kroVrx3z4Jt4f2Zv1M07V7yuAHuhdxS9n5zgAEpP5cbuQMDPak
	beQMtGdJr0ldOhj7WgKj2sCH3LsrtxaoYW2fKtuxwrQt16T0Fxj+ihgy4gt2wmIU/
X-Gm-Gg: Acq92OEgHI85VULcLN98ReoRimPrhW/Oh8+W1Q6uzckyroYNeZDssC1jKHaaG+PuTb1
	+RfKrTZvvnNS/e/G2hkY2RU2eccA/xgx/tTBOQe3gPlWi6LFPYTeZgjuP3q0LKXmKvBvmWTaGs7
	gyBHJrgw/b/OWqH6X5AzyCMXkpp1doMYiwBgSVMUTFNzYzdA0F9oFMoMNSvAIEji6ppqSqiHl/k
	JyV1B/qG+r8IWNukppojx9tTUf1vr19+5fRMUpQv00EZats5zQEK1VRRzp0HAd7kha7R2vARaFs
	nydJ9LKeVsQx+rLc4TgVywC+WNHNQfsXzYWN0lFLr1BwKpURROo7xbGCrkTKTsKxitPICM+fPwc
	mEf0hylHCk4Zajm2v9QzAAim6bjm/Lw76sQ798auCh/p14+Iq0neOk8KiyQ==
X-Received: by 2002:a05:6a20:7294:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3b22ecf97ccmr2874923637.24.1778826216069;
        Thu, 14 May 2026 23:23:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:7294:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3b22ecf97ccmr2874885637.24.1778826215575;
        Thu, 14 May 2026 23:23:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4205178a12.21.2026.05.14.23.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 23:23:35 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:53:23 +0530
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-hamoa-spi-can-devicetree-v2-1-d0e922608065@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANu7BmoC/42NQQ6CMBBFr0K6dggtIODKexgW4zBKjVDsANEQ7
 m7BC7j5yUv++39Rwt6yqFO0KM+zFev6AOYQKWqxvzPYJrAyiTkmuU6hxc4hyGCBsIcmKMSjZ4a
 MqKia0lQpGhX0wfPNvvfpS/1jma4PpnHb2xqtldH5z/496633x82sQUOeZ3gsNKZFWZ2dSPya8
 Emu6+IQql7X9QuGsiCv2QAAAA==
X-Change-ID: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778826211; l=1804;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=fF50PbMAR7BH/sgMSNtBTQE1n5ShaDM/5WLGANk+6jY=;
 b=ORqoqZYefhQabTy9z8+Pu1RoT4EKjz32RuQcGQEtQIzGnThIvObd2KjSQdHqc8XkOGJp3NXf1
 UMNGyFtyQq4D86BkRoXw5aOBX7al+8r976LDKgacqQMggKXVfNdwL3W
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06bbe8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=A_lPNeO1_qHQTXRdlPgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CfXD9XjrWoZ5Bu_3TknK_mPop9pL34fO
X-Proofpoint-ORIG-GUID: CfXD9XjrWoZ5Bu_3TknK_mPop9pL34fO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2MSBTYWx0ZWRfXwKGNgMMhxefi
 aUY57z7FsetYsj9YfspCuaa4fwlRt2/xIVI343Mjkqleknvi8PXN95o9pkpOQB+bzPK2Zn1PNjg
 8S7+5Ewcc4dNL8+IgrkbxoZqiVgrdHrixxibRoLBdRNm2/pUHSUKLYLgwKx6WlPrph5UTEmhQym
 fX+MuXFKlTqEb+eELs+B7xATlrip4fMeROfHmID3GWDM0ZCj4RSWwNhqaFAxUKPopeC8YWPOiPu
 cyJeNCq+0pSB5h5R7HgDgrYE+/fKZDX3t7pys7k+cx1vL2jJDHzDehLpqpFhXkU9ot14+uBHkNi
 p/p1k8QzR9X2ujnBWxze2BzDRYfirRFqIQthFGn7F9rhrEGKXENAbE/s2yt+ClB+QpChJB66a6e
 MQMt/dGs67Tg22OwJaGgKk26UCV4Rr8xhXVaP5/rOz8dD0DDNWPWhatcddA8ZCt8dNqOHxpRRHV
 3xrYCsOIjYJNi9phztg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150061

Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
is connected via SPI18 and uses a 40 MHz oscillator.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rename the fixed-clock node from can-clk to clock-40000000 to follow the
  standard fixed-clock naming convention (clock-<frequency-in-Hz>).
- Link to v1: https://patch.msgid.link/20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..c7ba4b353ddd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -29,6 +29,14 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	clocks {
+		mcp2518fd_osc: clock-40000000 {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -1227,6 +1235,19 @@ tpm@0 {
 	};
 };
 
+&spi18 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 68 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <14000000>;
+		microchip,xstbyen;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

