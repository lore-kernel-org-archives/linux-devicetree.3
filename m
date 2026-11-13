Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596016;
	b=a4GhLw24fdU+Vd+qVHVFtVG5h3Eu5slKCLfDaUlb3IRpu4bbyypw1w5OTUk6Rc3QGYKp
	 uIlDnlrGwNorOBfBdcp9RUvW0Oyr4WL/aywPORenwZ3AeYdEm6B8lsOmg46mNvqYLiaA+
	 Saii5BfvhUa1+jjoHi6sk0XDxxybAmp4XUMbnP6UHW8q5Xn3M+L28GGUFcP9gLeTh8Vme
	 nXHrEuU3S7hmrtRM/3AR1JuvAJLXOD2pbF/cTIBfpBgTt/rb1PxcDIRy4VLe+p/aqr3Py
	 vy3+6d/f/cJr7XjPp2O7cspY7SRJ5pSq5TDwJVVqFsdNw7iE0mK0pq0FB1LSG/qY2cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
	b=mUO0KfQ58DnkA/dI+pKEINILK7XtstaNwuJ0EAk2HdYVq4qBYhzbJAZKAm8u1x8FwE4f
	 hwoedeQ8i0hp2BQb2svZaeS7zsTL2Rsy4AXsJNI8TterfgwFb7b2I70EpzLW7zVDm3CjZ
	 i8xGNiSiGWDg1VZ3FoveJ5oPqrjkuYWaCXIq3hjrzlBRA15U4935Mb6ShR9gkys1dg5SI
	 IS1HSUyJC9JP1nvDeLhdhLybj5ef4OpPe7/bMXG93AEx7Amu/358ARRSNWR3lmqjFkiN3
	 0WPxZllXr9kQEZDK+vysoLr/1VXWZ4deb3beFMEWYnb7MzN182Z815qZnzLIsooSJwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eGOJF/KC";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37148606A89C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37148606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eGOJF/KC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXJpt2808699
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0Yc
	AmiGkyHs=; b=KX3Su90H6zNk/whbgSOKrnl9q9niXstvLfV+dkJIx2xWM+EnwAx
	G1fTGg+o+T+jz7kUWrtAvMX6Z/kd1Oon5TbYSlQnjQgbkB+huAQjiTZLV0smTTEs
	m3K5v2PX0Llu0qRr/DkLPWWff2H3FBHAcHgm4U1AeiTRQ1971M76ZAa5y6GTrP+w
	k6cnFcJaZoqmC8iERmkz8xvA/UzC15aN80Y0D7X4oaksuAzf2edKgONva5tBqlv3
	iPGlYfzPp1u6z+YYkxFUUC2E1z7TQ5hFCEjsF1AkGNXu9tzjr00G0lzGnmlukpx/
	S9auHcz7LkkVgxUVCLfr7Lowcl/AdJBbMuQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662rgeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d65ae19133so585415137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596014; x=1795200814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=eGOJF/KCacnuYbEXUrwJFnBjeWb0INh3a3BGPSo9r3DUT8B55HMI+ZgAFYKMppyRhw
         pyIhYrZ/qLM6klKqerGvgf8vLy3Qco3fo6A2gP29F+IKVQMZAvTZw3CmAPI0R6B9yd6k
         e8mvIG41XidiF0nuo1he/2G+H51Yu81DygvDarwXe7Rz8it9pv79FPliya/e8FnI7oRH
         ydJ4oqzjRNsDv6nm0QpHlSgmdkmhwahiIXf6b+Dh9Q30nclxInysxe/tFQ/PmuLk7bYO
         zIteEeSVUavGayT5KK3RMNIOOKzpaQwzpxSLu7zilE5P9kYJkWjm1lvXDW01joCjJlz2
         zCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596014; x=1795200814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=ZOcSU9br7+bJaGy4wm5wbJzF6XLFicdBq6dnTJ7Aom7tr8FOZ/FKptbibgLh1kW2JF
         /xA6aw9iBzbZIJuu02SpnNyVnPah2DpiprbCgzcu7smdLHD1uIzeepOiGpn2O0zOolRu
         4alE3tKHNsW1gTnI8A9lvx4CaNR9e5Z46PDUhxMfFmemub12PwA5asVpLpLci2kTTK0z
         0gPJqQVlpFWpZk9Vdc1OjY+MbWNnOBnI71c6A/B90VOv1KJDgWCEs70g71txdc/sGMp2
         GBv1mT9UesFKgWv/czRu4/qVDlxI8fxFBJbzFcLjVYv1HK+e6bs2wjpew5BbTunxclo3
         gUuQ==
X-Forwarded-Encrypted: i=1; AL+hErGb1XaXags+gHjs8uEA7oSj1Lf2nSYSKwPRih0SVXxvK4yqhHJ1/dm7cY405Gh2xBw08tgYXuQDE4Ip@vger.kernel.org
X-Gm-Message-State: APuU4Z9AlB17c/nFfJojUO9ayikMmEKVWosXSHGI2hXS9vqetDOz4yKE
	KxvEQfDSZdbSIyZ0RdWijvXerFtwzho7P6upnQJ238Sl7PDv1UV3IGRrm9fuhtMf11UZUjXL1Vf
	6wh6tLi4FGdilwwhOSVEGvhLYY9lwGd18eb0igfe1e5i0+uidV6NffzCrA4AKeyCD
X-Gm-Gg: AYBFou3QSAyHhDJ1gy1+S3Zebuwznmz1uBBRy6T8PvPLd8NJlg9yGY+IdbJoAfAdQPg
	fXvJ8x4DVVhI92xEsG8iTrK1OuWjrmablD6V4p5yQyFjGjemNypcYn9pLL1GPHw66qnBX03xwC7
	iVhnzbzI9SSK0mYGmMbVGo5sG3vvMuZSDvFuKZiq9gOXvHjK/dK17kA5UZq4Jj2Hn5xyj2elP5K
	PcHuMusJoMgRuhVrqbBlH1yXnAyYjjZN1Y8K4JhXi7FnGqLE2XOrRlRxiLFLwpvjh6LVWBSQQZt
	hHpxG0K59TQz5rTfjm3mzeXURGa5JtMC8fXYY4Oh5UEbb6Ksz29kb2A7rBu4WBmsvJbLPRMsZjO
	Gc8DKa/grXLgiKRQcCUz2MEtRxXdgo2D99pFDc7j9ldyIXXbldU4U1Zjdeu4kGg==
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455768137.17.1794596014398;
        Fri, 13 Nov 2026 10:53:34 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455751137.17.1794596013869;
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm172988585e9.15.2026.11.13.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-bsp@toradex.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: freescale: Correct white-space style
Date: Fri, 13 Nov 2026 19:53:30 +0100
Message-ID: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4167; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Akuw++ZUVXXh5XdKDs7G2azKQzusj232NcYmjWrfWVQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91ypbZ7kYSkueWNwNYWavUzn8QEvcbWxnBjIM
 PjQ4q2VSx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcqQAKCRDBN2bmhouD
 1+YaD/wNQzJZ+dGmeqnE4K90ELgmA3GZPhP/jaw9F7jiIWd6nQucoDoP5I/P/OspFqkS3CG5tGf
 Fc3ZKVGzeTkZTdPNLFWldGWHCQJ8Jf5Spvg8YDirEXxdBWtlppBvvzW8242+mWoMzngjDb+9qhs
 LyWAKYjCs9IJINN49eICXgO7GAVu2s3lEYayCD/V+WZZsugZbnrT7pxlyR83LMGnnE0f5B4meKe
 Q+8bpJ1KuMq8r5Az9FasyFKHkNcbdc4znilhNKZuGFEtFeQLK/NZDXZ7vZS4RY2mWSrxkVtaF2Y
 ds05QNLoZikZSqrmbyTOtwxYhF6Blyw1b/TIHeI+HzIpYvafaUc6QqJ9uyENv+nzCze2j8Qz3sl
 e3LLxJPnNh7lLhoeLo7YRFDCMdyc2JkDZtDV4/wmaKX3UJXcUmMloroC9k/vMjeRFpu3iCOkfVJ
 PH46vtrfajc+05XBxxpOGFcsge3r6qDNnQ6KmIVCafrnWLX2jvQCvShNWVAzfwXOUa+SIb9dRcg
 JptOyT/LJ4cWrtbFKso1oQNzcqNE3BUaFhpFWTS/FoT3hOARCil+GJ6WnykjmH491T2GpYTT+sO
 +V/N6ZRmroFt5+Ex7hMXwyAefBi4L8+ouY4M43+Kh4HcNHHXKlESrGjZbDYFGY2bDC65Q8E7sm1 rRwIdMJTfbNaCSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PVxhuYBOBsanIEJFjeDo7J1yxTOAu_ou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyB5l+sExz4C1
 DjGcshpiaqWlMk48lPeIKqY8Nxrz881FpMNb21qmOkzEhBd8ZUb+ab5G9Koedj8XroM7y6iytVs
 daSkN3gZrXe9InlE6f/D/XaUjpUhJNak9MAVLHJCKQ1um73vc7x5cxLarGvqYR7LRVHqa47KwgE
 xcgEnv2kgTkKkIdk8o8U8skS2hzf6LV8IGASykflGCKoKGBPd9u+nCmk25m9W5C8/wS3UekociU
 P2zPpQPDfBou2ufWDYUGgniaAHRx1Os2h7m/n7btXafalS7+B5d3gpsq7guWEg45ZmAUOMYRJTn
 xL5NRSvfG4AedG+qA3bqonj8fQXyo6A1ukQRBMOxAogTq4en5DCKp30Bq7RKHn9cOVGNUhCtjHF
 W/gYF3+ABfyPeWCSc4g9Sw7s+cRcCvgERuv9345epXDG5YdGdJnBMi642xJAGIEy0aX+JNg99gZ
 US8YbYreoK5Qs2w1gfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzEM6QYlyiV3F
 qGNIOQJCmuOAv58/gXbTRKWGrGjEz3xv8RUEfwILKCKS2UYAFo6MBWtGbg54fbEJrxt4CdfwZUW
 yG+WrzbVtpmMj7m6rg2uLzuv03p45Is=
X-Proofpoint-GUID: PVxhuYBOBsanIEJFjeDo7J1yxTOAu_ou
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af75caf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cbNUTa_LnN-H9OvA4PwA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket or colon) to fix dt-style-check
warnings like:

  imx91-toradex-osm.dtsi:75: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi    | 2 +-
 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx952-evk.dts         | 4 ++--
 arch/arm64/boot/dts/freescale/imx952.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
index a44351133428..666c0cbac94e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -163,7 +163,7 @@ &acm {
 };
 
 &asrc0 {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
index 9d990937fd8d..ee89e96ce1ba 100644
--- a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
@@ -72,7 +72,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX91_PAD_GPIO_IO00__GPIO2_IO0	0x139e>; /* OSM D17 */
 	};
 
@@ -122,7 +122,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX91_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
index ea5e6055e3f5..1fb49e06d2c8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
@@ -126,7 +126,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX93_PAD_GPIO_IO00__GPIO2_IO00	0x139e>; /* OSM D17 */
 	};
 
@@ -176,7 +176,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX93_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 047dfde20718..d98dc1358fd3 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -303,7 +303,7 @@ &asrc1 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
@@ -317,7 +317,7 @@ &asrc2 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 4930e09e0206..4a737d2620a2 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -904,7 +904,7 @@ asrc1: asrc@43000000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
@@ -945,7 +945,7 @@ asrc2: asrc@430f0000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
-- 
2.53.0

