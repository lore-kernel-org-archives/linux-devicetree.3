Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0143DEB8
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789808; cv=none; b=F5Pq/f22g2D4Rww+XSVImeCqR/4oYS7SOW3eF4geqvQTaiz3EW/G1UmM/Zdz9XQro7A9QWTYXVcieobX/2u+fsj98yfGxSJh99XFYYvtFor8UwV1xHDSd4RNY1dH9/QLNTXGxS6OR9y2DMUZL47hsFLVAuNZyVrUHDxIUAUOsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789808; c=relaxed/simple;
	bh=89XqZmmeHIBQ6O48rlUdLOKDfG0n8CNGRqUs41V+46g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+65l7xkGmiruqxeVAdvJkzJokPf5sXy6Ze/t2DfFdrutmf6hN7D1EmPq7X6MItaVLwVC3XWYB/IErJC/spUkZ+gZgJh0Cvev7mjXP4rj/abnn+/e9u2JrnoJOA7jMHMwowH2yPoSaYWRhyoLQzR5/PDRvY7mj5LwIxBvUsdeiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd4kK3SO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrENKXko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd4kK3SO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrENKXko"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PcAc1787075
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=; b=kd4kK3SOMLygiOGw
	cLG51Ovg93NsHHb0i1bAyOTcwvv/hBfMKc0Y+UKi1OtQKZxO7+DEV+AGMMR9zOXu
	7mDwo4hsZoiHETPoZPgF/DLBsk5CNNw2GOr/9tBgMaA+jEI6Q32+qDtHHLdwvmxq
	DSrhcMDhAKTh14MC5rKZ1afitjR3sUNn67chltbiFw7gRVtClSX6FEzw1qoZ8YBr
	qs6QZDr7+2fkMnyqf3HkHLae8QYy7RRaD6Qxl77VXAZ8rVjyI+PnF1kIFkosonSx
	DNmC0eyO7+Mp1uPZfLQFn51AU+7De45z29t3tIMRzPpswLBQ4ipKdvpS3Naqyu80
	tGOS8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rgh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so1889780eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789805; x=1792394605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=;
        b=UrENKXko8OYBqQ80xdsfkLZw7vefQJ5ewAN5CHWgg61Px9eElY6zmU/fOT8Vc2zLMS
         fp9untovb46zgVStPhI8wZ5eFuEB3rq36gxpO88jhgW3JKuGaDwqjTp5mAO6UxfN+/Zy
         5bjIaBJcqeF8GIQ6T3Y4QxqNSC9rG3fOoEEDy4MRiUI8AP3goeRyL6pAJjowttBZ8f2D
         IOJ4Nqbc/CWbxKWzHcZ5PMMSAqg3tmn+nOzktvchdwBoYYlW0TWlEEqIoF18VRqZ8Gv1
         z+QMpgWA2EoQVDZWzgcfzWfaW6sJqA1ypJ8dVLaWHUA6wR/VpOMBEzrC5lOMcRk6ddUN
         KNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789805; x=1792394605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=;
        b=XB9sFfCe15C4tN4knf/5IMps/9VaZSKtwIM1QjmAZssgiKN2cTGM4jIAmNftI3Ff3h
         L3dCWseII3BysDdHWjQThEqJ3I8HHr44V0rqG9nxTtID695lOlzSJO6W7Aj04tKWzRfp
         8V3IbOH1sAAlkq4OQ//vIJGum98RXXup0LeE8rl88HO4kUEKUAfBfwPAYIuJDXRYaEd/
         qyLtQS3fSBGOCXdrwZY7iakMjBlp+45/cPVo5a3KZ0fCTdC8iu/F1jwZylD575KXLhUx
         W+rq4T5BzMLIf/VW26r9k207tNIblgdIc8aFK5Pp7SD0Ebd5XZok7aSEyKSWgYNROPsr
         m0GA==
X-Forwarded-Encrypted: i=1; AKwUvBwsXDy1oIe42f0cDjFJFHip1WDHzngC3/5ZzFicdhL5nhkxQHBwHk0ANSHcH+g2CChNQOsYldMKtUoS@vger.kernel.org
X-Gm-Message-State: AFq9FYKV9FJlHcjXDjZb51Qr0qRvOeST6zbTrFaSWVOE8crIpL0I7b6K
	8kdjj+Kwqut3gwKdSpaMg5DNv+RGn+sAydDhFoq8TpaImTCnLNxJ6b9NbmdvGcyVum3MSCbSdEY
	fJ6ML417eINXkhlkyTsgsDiFCt3j1zyjwFeSx70a1T13V4olZw0c1eCGTqfd2/vcL
X-Gm-Gg: AYBFou0AAdP7gesHtvQdtu1qXvBtvVlHDxe0+am/egt5LDgzqekwLqnNUm3f4nsddl7
	9glt5NWFdREVRjCeba2y+8PGzYCg/rdoMlXdslprpxaAOsxygYr5ASiFVHSVq+/zV3MUlwB6B9/
	wR0AD3K9tYX1pQ7BkgC+ZT6altPTdbXiXJ6Cr0aiYPCJkKQyzu0O2lz0zVjvrWgRlk7L4Gvf0gq
	oPF73mBQDHayrPyaWjzQ3U32IOnCIUvMfcckzLXGw6k7j9Yyn5nyWMvep33YanmxY3BMhh3nNMX
	zOOXme5UuygzNgkadWy4psCtCXFCef8jrzB9dBiZqX2nq+BVU1y0iTu5YTHEwXY0p4o8OjAIP66
	fW+7rq4cGh3NphmlJi3IGVmGIBZntKIOBe1eBLFsTK7pTq4KEjAQOaa8EEIo7lo6obwns1CF9Mp
	R5lFUqrNpNNgs+nuE3AWCzeyQan/YG
X-Received: by 2002:a05:7022:1588:b0:14d:ef19:246f with SMTP id a92af1059eb24-16e9ed23af9mr7690136c88.45.1791789805350;
        Mon, 12 Oct 2026 00:23:25 -0700 (PDT)
X-Received: by 2002:a05:7022:1588:b0:14d:ef19:246f with SMTP id a92af1059eb24-16e9ed23af9mr7690103c88.45.1791789804761;
        Mon, 12 Oct 2026 00:23:24 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:24 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:04 +0530
Subject: [PATCH v7 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Ly1fnJ6SrekKjGtcPtVLHSSRAYbxSo7d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXx0r4PUf8Ul69
 goSW9QMfmTJZ3nqUfJPelX5AhjQOSXb8cILonF9kG0w9jFCzKtbAsxhenpLYv95KvCKpmuVLDeB
 wZyZqtCgYJC3jdsL/lsQtCng43NDOYE=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc8aee cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Ly1fnJ6SrekKjGtcPtVLHSSRAYbxSo7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXyUgNlt8xKHgX
 oUqOAhY+bQAVo15flx8y6zmLjwlsFiLg0VrmgTrWuiPPgrKmUgRXoqWBKHEywkopS8OGYvIaZY+
 z8D+vIBrJPEPAwTkLRt5DECO4UxSMCwF7ob2ptBPWuYqGRW5AeGpsO2P3vBw99OpTmZ/id2nQEP
 vTrJW0VUVmGqfsEDMl7jnhATEYxFiSR9l2jBqUE7Z1SMBwbBH9RB6iahaCSpHf4sbzS4JeO9Eqg
 wteCUz2TYoiR7/Iv+FNaTSWHZSh6aNFV3iRQmUddRgw46cYNyy2PFHPLZVqybzoyyLt3xhek4j2
 t0Kd6KgZhNL2wNBdPRkd5epckvM6Lof+4AOnoSoiB7SSFtrBdRxtJg7qs6EbyrjRvQ06ZSoU8g8
 UIH81CKgGHHtAX1vH3g5cq3ozxCJ/7FwxAkg93Ikv2IpomnTZ/bAGbXGEkAtbsafjRLD2FSAduV
 62w+68deyacEChYsBbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 67f62c1acddb..7f90a2632b07 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -125,6 +139,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

