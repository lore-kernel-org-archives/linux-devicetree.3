Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611A3033FD
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851381; cv=none; b=oZzzF1uKjxtV1qBaWDIfTVOMAN/IoL8OC/26fHfJBc2PAlHmNKclFx7Tq8tTAYPsIV8dQQPrgRuU74+/8/g/2g8s563qWAVc06O0H/xkTGZhc+ZLnnwXYvL0ZqNSNwUG04a5ayVj3/glIfNkFj/r5f9Uaf3Yl+/MOnB2e9U/RM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851381; c=relaxed/simple;
	bh=v1FN8my/Chpsrg8O/0nTjcL7rg5EKuTgvUxj3Iw/rKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiUg9VawfSG0lcghAsCuWcb9v8Plqs+N9FAXg3zz5+WjatRVTXAuviQ49/Rtd3E+YEWeBZZSDX2k7tz0k13KbGue/7J+I0iN65qAioxlDnCpVyAOJb0Q7HM8FOUqvXm2wC/yHpYQ68CGWF/66NexnnqTO28YZWAXSOxGiPwMbVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fc470HKp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVdbm0F6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fc470HKp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVdbm0F6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBI1O2655050
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7aQmI6x7+bJ0uT3pQZYcCLdFUUib2NWwwqjQvE1xrU=; b=fc470HKp+E/G7jB6
	MpBaj+wcYFIi/13CTXEU0UL4qbbXaGdNBF+b9XTC5x4W6BMHQxhsB1+MIojP133b
	uQUo0gk1WKdNzzYsKqAG/uwS2RkhMLv4LPGYno9CmhC37veMGyp0JBxntBGxFQ4i
	gj4BPcwSs8YTkjZ+nStzSaWBXriKH2i4DdTPVm79FWVoqgk4v7ja8eICtADWHMON
	MiAZYAU2sxG6vy3xV/cvFWJVzKG78sMKfRfzT/7bVVbe2JL07TXx8NimvBteDMOB
	ChdQwWZMbSxD6GB4UyVeNpUDK1vd5GNOH2uaAnM4/9/8lQgGLFWZy9JkA/JduTg2
	psA/og==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1puegq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:22:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6312aa1d7adso316073137.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851379; x=1779456179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7aQmI6x7+bJ0uT3pQZYcCLdFUUib2NWwwqjQvE1xrU=;
        b=FVdbm0F64VHDtlv0D/75M957lu6AtrInRvZrVfnWvkeI4vRowyiJ/Rh4OHYaQaRtli
         kU5rD8P5Lke/94x0PuWcDygTiCoQ/eMDS7BK5dDYgup8rAvzn8z9b/ZaLgrl5RpXwfAW
         0Orwh87FQpbH8Er6wQ5ffn5e6QUmCVHRP9hKrQDnL4J5rJ9kt7ssjmkUfGI3oynwFe1T
         EPd04sD6gUomMpPKmFCGyHEVxnJ+F7yg70VgPmzCzzNKmdOnbHcLUA+peqN0uQyf8U9s
         VnAkH8CUc3DP7gMBshCgpPEzjwK33On+9T75Eny0YsnIf56Cn+fnmA4n2ELyUZz6VUN3
         zDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851379; x=1779456179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i7aQmI6x7+bJ0uT3pQZYcCLdFUUib2NWwwqjQvE1xrU=;
        b=N+5ndK/mkmwZ7w6HIy2UayFCCF1ZuIjybTtMYUqPvPwBovfgPcDc6WiD7FvqO5EFSC
         hZUT0vxefNPB+n5lcVW3ISsWZ250c44pA+WvfrYsgBtsCvkw7J7K0AS8FWNteTC6cZ7a
         DaIzzu7bzPr1N3HRIWWfLLfI2u/IvtHkJmxj3npXulht4xVXlmYqANCNvNx60ZYzEQlN
         AYYg/yn52gsEMGvWSWFIY+ud66JWpWCrBbCBlpW3PNslqRL7aKVB2Nd7LQhWRCSDF3n7
         DTC+0ge3VGmoXapEDfDxoWL4DvcgEow1MTMB1cwkCMjfa8AQIBX5dSZS0wa1AmGkr2cv
         zuXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+16YTm+Nv1GnEMhXqDS865OF2ufzZxmEaQsrUXoknGbEENb50cOWGBgS1CIvza/b/mRqrpHyUyKNCa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9lBPTsREsd4qNl0c3HROvtH8WV/WNz5Kq78HvWQQ7Kd45hb0X
	DiTswicmgvoeWKPxzKVkmIMC6y7XQdoJCDcChNGCuWEgdFGwMaTli1e/tIDWtz6VwdLW3fxc395
	r57QheUHLxzW/v8rC0yNYj4GspbLK8/J0CpYz5v1xhvw8ufoDEZXjQXy03oJuWWVJ
X-Gm-Gg: Acq92OGXllJw4EW10G7xmSJ5v/YGHw+onoaJyd4EJKK9ZuI9hP+oTUn9GncPr+mcvt2
	5M+KgK3gbQKNb4XW4mRbpL01Ft/2Y8flzXC+axbp+LLtYz2ZuCbghNLUcxYztxtog+9zVVR4EMg
	MVROkdlrE1BRqaVOEWmFvv3OjU7eFumrCqZk6QoZA04DWHIW915J4LLXSzk8p+XcCs+8qxl4dv0
	FFOjLjq1E9DuOcGZkawb+EM+wJJNJ/iGJg4ojZT1lkrY+t7ExbcijqotRcMBVzXd4gxVL8Cvfhk
	h6aGmemSdDN/qI7jBwl28ojjXzto7oPXKuCizM5igHuzuf9iVEfvD4Un6wBlehPT915I4COhG3f
	xqAY1GmI+utSioofswCIodU1TttcS
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:701c with SMTP id ada2fe7eead31-63a408b9ac1mr2125162137.31.1778851378690;
        Fri, 15 May 2026 06:22:58 -0700 (PDT)
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:701c with SMTP id ada2fe7eead31-63a408b9ac1mr2125064137.31.1778851377937;
        Fri, 15 May 2026 06:22:57 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm17889505e9.9.2026.05.15.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:22:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:22:38 +0300
Subject: [PATCH v2 1/2] arm64: dts: qcom: eliza-mtp: Fix the debug UART
 index
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-1-5ad3da81b9d3@oss.qualcomm.com>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=v1FN8my/Chpsrg8O/0nTjcL7rg5EKuTgvUxj3Iw/rKc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBx4rPDlt7TV8kGYYeMqFOn9M0FVNSRu4b98sd
 NxVdFPnBgmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagceKwAKCRAbX0TJAJUV
 VhevD/9MfQ6OpW7veD2SHZddEj2OinukKXp42RN5Qf49Z8AyuKm8sK0zhnmaoDR9HxZomEsgZx1
 K+0noDQO3DMCRPhPIpRFs2ugB4Pd2qJXbOBGik2XnGJTB4kjkDGqAkhDgxDnv60fOKvcy/Me12a
 QhZ+VSxI1Ip15Qrxrx7WkI6upwYDlfuvokLX4d1CgbBf2tkoBTwVNu4SGWPt/aghcJ2xpwD9cb4
 8Fi+IMA9SSPBdELF/YSo9WlCSO1gJkCoiWtgi6wip4zvebdSNgDLEF0AlO9mYP9jnDhCj9BnQrj
 67/Ykyh8HR1jTP3n2J9cyDnv6t6uKkP/xdFw2GuGN9aqkF7tvPi9TrBIKDB2VhlYfEuMuNB70CV
 DrKerQOoTsV9X51kIWBdEW+WA7KBPYThP95xklYPso8vXtG+LyViCyGl3Ha7vkA+F894C0XOW4J
 sEscXffu2x3OzAsFXUM3hXLyYfxb0nybBb/Fo1+UgvASpfkfGZBr/V7n7Ct6/GGZHE15g95OuTg
 hGSNCEORD5IRJMvZ8QZ3iR+ZQ8oU4TftCLBxIU487eHU21zLdQGR/Y1O2RdpiolJn2VFsf6LWlR
 +ycc4AyTZk10bfrL8SVGKNqJ4iEfbdhWsNI8UzTF164f/oYS8N7wD/zbYR0G89GfualhOknVxaR
 S9GHMqbOwUY3StA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: PeMOS8rQaOBawLTXx2qoJGkiG5vZmGKG
X-Proofpoint-ORIG-GUID: PeMOS8rQaOBawLTXx2qoJGkiG5vZmGKG
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a071e33 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_2YC0VPWfGMhjcoLmTAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNiBTYWx0ZWRfXwCGhPsY0xMCO
 eg0HArxOB5jnh+Tcjua0SUEVFYQwPbnqp0mvIu+Y+yshHvJisXrmQEzz6hnBL2CHTkgZ5+dtQku
 nXQn+Uc/foLptF1xlNTV01RbAt/oMbBMTrrv/7892++kQkn1TtCflcrEqm/dvF3SHU0dAt0pr3l
 e5leomY+E4wmeR8hAGRI54t3Ki9nYdwUbRI0+Dz6JZSef2d3j5eCz5vG4w5ggfO7mHUsBp9HP0+
 BCGCICbd/4md30rGEslRR8jvJp/nip5VvHfSMyTPWWGkiF4gYQyKaVf5kJroneyPBY1SX8VIU3l
 uXtCD8tXxxfQEt9zAQGI/bMBFjIewQu/z8CUrGJv5fQkC+Zu94C2UgV0a8VFLTIKZ7oLcPzH9L1
 EhcP52/AC5KO1bfOTqdsLjHN9kCdXjxa0caqwJ2rzr+HkUF4sZP465sqfqzSZpaz5AVvnlsrXKm
 9FtP9z9tr0rs9voc1TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150136

The Eliza MTP debug UART is QUPv3 WRAP2 SE5. The existing DTS labels it
as uart14, but the serial-engine index for this block is actually 13.

Rename the SoC UART label and pinctrl state to uart13 and update the MTP
alias and node reference accordingly.

Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Fixes: 2a5d4fc6f3f7 ("arm64: dts: qcom: eliza: Enable Eliza MTP board support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++--
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 912cfbee552e..1374afd9d14e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -18,7 +18,7 @@ / {
 	chassis-type = "handset";
 
 	aliases {
-		serial0 = &uart14;
+		serial0 = &uart13;
 	};
 
 	chosen {
@@ -506,7 +506,7 @@ mdp_vsync: mdp-vsync-state {
 	};
 };
 
-&uart14 {
+&uart13 {
 	compatible = "qcom,geni-debug-uart";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 0fb153da4dc5..73211b4a17eb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -679,7 +679,7 @@ qupv3_2: geniqup@8c0000 {
 			#size-cells = <2>;
 			ranges;
 
-			uart14: serial@894000 {
+			uart13: serial@894000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00894000 0x0 0x4000>;
 
@@ -695,7 +695,7 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-0 = <&qup_uart13_default>;
 				pinctrl-names = "default";
 
 				status = "disabled";
@@ -2039,7 +2039,7 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 184>;
 			wakeup-parent = <&pdc>;
 
-			qup_uart14_default: qup-uart14-default-state {
+			qup_uart13_default: qup-uart13-default-state {
 				/* TX, RX */
 				pins = "gpio18", "gpio19";
 				function = "qup2_se5";

-- 
2.54.0

