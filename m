Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5511A3ACF02
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618183; cv=none; b=dvoxznn6mmMadU1wmKJMmm1IHRcWspkXB7TEY+0gV28ylTbNb5GdYY1A/YVIx5sRFo5rRkvf1dP21cFQ1EJh+zlHpWeC5ba2WbOMzji5DL3OzYrxdqZ2ONz6REr/YkveyBboOMqVR/LlI3Mu+7iXgLyPK6tjL6k2uqOk1BGQcvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618183; c=relaxed/simple;
	bh=aFfUnKCMsaF6tMos1gT9OAGmHN3kY/TQHmkiRmzGUwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulpZYksl+O6HD5kq4pfHKMpPE2vh4bZv/MBv7kTqreiNx1pnYk1J3xbmUWKphE0SH/sm8evSJc17UQ8k4mIrr0uvMLlHKPMNuFIRGALI8qYAwP+Nw9FB+UBvuaL0TZJOsdQAUlTX3ZKes1lxEy9eekXYEulmV51Yop5ytAaTz4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4WAUAgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJRXvE+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4WAUAgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJRXvE+x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxYlB713570
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3+4p/BPtvf8
	MlHftL7UlQ6otWoYTySkIKv9dedYNSsE=; b=c4WAUAgWOBb6i3yJOWnRXeJ/EAK
	9rPbTGF5nq4VT46vRSRbBFiiN8WkOBcQ8TEVVQSK8EXGyWVR9hcoAaK5VSnJqzIv
	1b7wzDY4CpE41pT3OHxls+RpVEcMPvgwIPcwc1gfLoGKdvxzUj8pCEHWnczercPO
	MaZRdFx1uLtDQDlOEDDY3CYBqNBqlNR8kHoJngpg56XZZWmKwjB2TMnZPxdWV4tU
	Cm11f6cP9YGeOGw3cXehKWfN2afM/JmOiAfkTBaxLBeZ8e2szoGfyFQpGz+JQeMp
	Sib7Fd+rhsHyk34HWulGjY/Rvm9ehyLm7xdwdjs8uFok3krqekAItlj9mjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg1nbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:03:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eac2620cb0so21459476d6.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618180; x=1786222980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+4p/BPtvf8MlHftL7UlQ6otWoYTySkIKv9dedYNSsE=;
        b=EJRXvE+x++GITGTQq8SQ7qQCZOjj57y6JEMMMfjk+bBNyrmVohiHOTqb2nbKCWdoJu
         p6Nhoc7z2XVmI+bKRdTa89dYnMcPwttAJeBtQN4hhMFA7SRY2I+pThjYPD5N150QRAuI
         rUZ2modyyIaOiMP88qfivxuha6uaURgGMG9I8gXD4Lgyrg357MRYrTez1tC79gQkm50n
         MCe6TICELBMlBs3Itoy6ve4M3L9hE6Kgumo9BCc7aFAZdN9YiILA6EY7VxVUI/dN8WaE
         8u9IzagYCsbkSEPL0ch4Vz0KbYPO+dx3P7gG6d2y6OqUm3oy04hYakTdKwDQA+7d4aH3
         ze5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618180; x=1786222980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+4p/BPtvf8MlHftL7UlQ6otWoYTySkIKv9dedYNSsE=;
        b=g4FNSDZ1H5zvwP815NQsa9s3hj/7uMKB56klisx3dyCOKigA8P9gP3uUEwplaWSSTA
         s4D4VSz5W/vaHI/eFVvFstcpNYumvEno2zMrY36uNi4wMVDB1xLkdJmDjr49SiDv0GQ/
         nRh/DOug0M8C9WuFoThElK2qae0j04UXjfJg3isrL16sVMpzQICpY2e7wHqImlAMLSgf
         Y8pvJwYnPlM8Z3NCVkSkyO9g9Ax5ssydd0m+C4eFyjT3m2x2RRaYj8HpxKSRUxuuq1b4
         fLM6Dr0KW5FV+iyfpIDYWbjbDjZXgpZVN8VbZFI8GHgpFEhw7AHurP763zjFG2Gem9O+
         VVLw==
X-Forwarded-Encrypted: i=1; AHgh+RqwAJFpzfxqryj2U2PuJp0Igo8uh/oNY05i1VQeSDKGxRwU5lODlXnycmPtm9BIssUHiuJkqaplasy6@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwLYhZx++ot6bEEaSN/f/yeqxqZ+aHXq7+P48V8NV8OV3j5KT
	gcrOXwk2L7LODoZeZigN3dpuQ7KcEDkzbDO8HfbbOBAEUnnkhpZKS9Ci01rVqdinYMH7mJ+KK0m
	/s0aVQCpl/GQAOx2LOF4MRqgvP4PhM9ugfiFsl2ymiJ416e43PP172voiwPoge4NB
X-Gm-Gg: AR+sD12/2aH5gSAktNtFjLbZj++0cl/JFhtL7yvyou27duBtr2Y7olQdcEAv95FEhrr
	+zpaZ5NPVy81OS2+4j7hcHVPeq9gw82koe4zXqWMmykiB5WKmv0/5BW/0cNFQ3BdOXY4EEOC3ej
	Pze3RBcubGKphQydeEpwhsjwnbfAz7pa9jlzsxOqgUkRF93jVHJY5hg7G21Cx59rgtg0zxR/1Oh
	+xCx4N9HT+b8GMN4XHmeVnAFDXIMbdgcnkzXhaK2Zj01T1YgYNIzmPaAZVV+IkcExINbnbQMlTp
	lLGJdIZNYEzS50Rzxyjir8PIVBF1KssduMngpT1oRl4cnXLZBLxymJ0i3bE/CnO+kcCN7Z6WvPO
	fRvCv79V8vYXupKMc
X-Received: by 2002:a05:622a:2618:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52b566b184dmr104068151cf.16.1785618180451;
        Sat, 01 Aug 2026 14:03:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2618:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52b566b184dmr104067671cf.16.1785618180027;
        Sat, 01 Aug 2026 14:03:00 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba8032sm66078785e9.15.2026.08.01.14.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:49 +0200
Message-ID: <20260801210247.383632-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aFfUnKCMsaF6tMos1gT9OAGmHN3kY/TQHmkiRmzGUwI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl74CI6AUsA/V93KkMhdGpAnnVf3RadeXNPS6
 FPrsETyD+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e+AAKCRDBN2bmhouD
 18S7EACT6L5MvTRrjsEmXg6XcREO6KBEzGw9quje6eYgE49HFxNq0k7NyoM5mMkfHzs/q24Sndz
 IJ0FdWjMPolTBCw7aRdi+cNxXf/t6jFDwYaxCIFrPAVh1PsUPSGsycdeeqMKKNU6JTiCSEunnWb
 tb78i9dnw2ZYes60Ne9k2OSvPvXUzU5T2cjQgp40liK9aPbX3HBJKuLX3E599COvUc7IkypWvQt
 X7ngYmpII1jf9dJ75nENiyHurJMOQR0MSV2a44uwn/aN27sWReJYiayGS48x1LsHx+kxM3nrV75
 gDN0TiVp40KLsS1+OrWnOyK8IA7sLCTaYHmpwG9f0oHBIjUWDRcxryD0LuK4MptnNzq37kQRKKc
 osoQRWTvONi2EKNGwA6y74gCn4eifXULmMC4fsNTBOwoc6Ucq2Yn1DAN7bqDvd0uUxADd6QPzy3
 XOL09OmSraGadaKUGsQuJYq+fqF5wNV9BSlBHkIbTK3V+Tvq1tBzuXvFdzwyZuadA6w01ehzFfy
 N1asnDM0hcmcTiqQYB7PGMyRaKThmTouJweqyvRTJT7ibqCsUALRgMspEFw3skd1B+zkt8FJVer
 78EF/n8mC1ZBdTN46SG+bTAdvCb+zpiMHKn1z1otgaQDJtGRVzLoNvDTcXIJY37QAxiIv3541sE qKz8rQi5D8QOqBA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VBXc8LKzITN8SPSHY-gvM8rlbUzQZSkY
X-Proofpoint-ORIG-GUID: VBXc8LKzITN8SPSHY-gvM8rlbUzQZSkY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX+IyIo3/CuySi
 OT3cM5dLsPNcLC1DMrL1gTbCgOvB9KSZCbpTGFZlZUuSrkdHDwbIsvEbW7LFCvtrBUSvvwcbXB/
 PNCWaydGNT6K8LcQj+BvO3Hz+xWLuh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX0zUHVgFwUmdo
 a4b9iaScjHvul6JvVZsgA5iv0Cr2glXbGP/ujB05BmC0BqLOJ5Qcj7PFYV9ScTR3LrgjEnwNS0W
 50urviII62JWp0YTu03Ubf3W8NOwKSv1TlnBgZRirxy/Pg/1F41A0cRrYttOeeLMJdpYHjPNIdb
 mDkqEF/1Y6c8apvOGr+gjfWbPMCXOMamTUih2nvXUrQmyZD534bGG0rPbwzi4pMfgD6Lud4YhtW
 bE5ZBZHlYV0GCbCL/A4Yy2j+qXsPzOjpYDDyxKoJGpIGg8BHpvHBwIji8d3wTvu3ra8Q5PD2hh2
 GcBu42lk87HbFpJiWmLc9RiOjTL1lvDrq3FhcaaZnqgoMi0bu/hoUMThtwcDbabfiRXftkzuoBX
 nWbPQQeahGlbhckjQlq0bw2MKy1xGjJsiyihI3n2798XneRuLV9AHt2knZr54Vy9Nbmktq7xKy+
 p/+Gr9/Rt5x8my+bDlw==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6e5f05 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WAwJ1FRNEprDOCzB6JEA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts             | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts
index 5e7181948992..74be8bcad7a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts
@@ -156,7 +156,7 @@ &pinctrl {
 	pinctrl-0 = <&rtc_32k>;
 
 	ir-receiver {
-		ir_recv_pin: ir-recv-pin  {
+		ir_recv_pin: ir-recv-pin {
 			rockchip,pins = <0 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 70979079923c..60ea9ff7fd75 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -85,7 +85,7 @@ simple-audio-card,cpu {
 		};
 	};
 
-	sgtl5000_clk: sgtl5000-oscillator  {
+	sgtl5000_clk: sgtl5000-oscillator {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <24576000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts
index b57bf7bf10f5..b17c7a43d54d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts
@@ -310,7 +310,7 @@ &usb_host1_ohci {
 	status = "okay";
 };
 
-&usb_host1_xhci  {
+&usb_host1_xhci {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 873fbeb8daa1..935c40c5a9ba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -90,7 +90,7 @@ simple-audio-card,cpu {
 		};
 	};
 
-	sgtl5000_clk: sgtl5000-oscillator  {
+	sgtl5000_clk: sgtl5000-oscillator {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24576000>;
-- 
2.53.0

