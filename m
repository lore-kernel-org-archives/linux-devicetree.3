Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922737;
	b=kf1pVrT3xM2Q8FdEByIAQqjfO9gK7KZ6h8m4w7sDP8F5mv2XhUb93Gq3u4bPnB5XwJ4p
	 q4ZXTQnkxaIhEyMwKCEMnF8Y9SbVpmw0ZJa1DEAw4qnBfxDbXI+st7AOAo+5qq1ZQZ1yO
	 DB/yT0BvPsBjtk9U/Rwov4lAT7FXdDFgQ5YKF5uEtMKqB7yBJbAe0LJrj2yx0b1M8gLPa
	 NcGJs1j8IVym441iy45ZSlRuJ86tfbicEW70yXB6nT7g8Hk6HYxXFyS1ifgFUv1zycbWS
	 jt95mHGjPyZEbuWWV8yfkbEgasFkSi+5W1H91yn98r0GEA9/w3sbNjcFe5yH1ZkQLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
	b=Q5/PT1Umbug8vT8GcghmFSyoi20N7TXvUE2zZBxJFG5GGESA1KCjVV71v71Uy2y4v5ti
	 /sa54krmFx9oaK0awKXLl4XIRX9Lc/+Mf5Do3+9HbkPid8RqN8cRN1IGiFo6kNX2k+Hme
	 zzFzSu1d/k98iLbqVBu0jT/I00km20wWVWRK+1t3HfSANY7x/GKajiKl2S/3NtCtz+JRx
	 5K2kksENBeLEZ2/8y7I8K7yp/k3F0FeDxBu3KmZspDlWBmSVuI8tcev4izL7Vkw5IF9fQ
	 I5QKblY3mpoIBV9Pc1NnnN6gxB1iM9z6WMPTMeUrbeiwsNMfZSoqL41i/YsCjX8w4Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IIs/8KKm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B51606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B51606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIs/8KKm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0jE41457245
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=paAaVYHLFrA
	+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=; b=nhXQjsl8FjZYXud61fLT6Mshb8U
	Z8t+fMsevFc/Tl1Opma/c7OXs0Q3HkS9p9g8RFSSu3Oe/pj4OqFU1hxNEIXE1V5w
	ZVtRWKo6EdEEdRyydPvpJn6XsG9xlwyb5a9k2lQXz2oC4ZAo2EyBlbG13Y5eiuTb
	MJIfWstq56H6cFSSHjpgDnaGduLPeIyetmBLB3HyLfWCCCHuSb4xziw0xPAFswtM
	Of/PzEWomB01n6ZoBiXMaEyMImBNsRzw4WEHRtADt90sRFiNioudBuGdDsf+2X+W
	5uxwUNGxu8TyM2S7D0sL5vNXxEofPT4MesjQ1h+6d763/zlMTWLEzSrV0BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc80pxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:38:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso812343685a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922736; x=1795527536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=IIs/8KKmxVUsDgEeGx22I+gxEhLpO3Zorqu+dOT9Iws3z67U2MF2nzcrNXzkSEaEFv
         O2isXAZ38dpA+WjY/2GenB7soND0BR1f7oHky0oZx/h2UOEkZlqQqE0gBIBDRzU8MZa/
         fym4h9ZF1JphFO5WSaT0T6KSjNDiqx4S1Wi6J3rvSzX2YUU9+WcV+gYiqIjbvTG371AK
         7is/5COHwEkVi4ytL9IGmfQbwPp6Xd4ZxP8/tJsem0KPkJbaGF91xyB4/a4duvmp6CSx
         MAIcZ5OFogrLwCRUMhhtgDv69Rup+QTQRuMAN7yTPMUvm/YmGhleapGtL8U5hvf/DI6c
         SQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922736; x=1795527536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=TKF7t6QnedxkqlPcxfifj4xNzGbamBcB9qY1JiibYVqvb/XaaWx0ZGhN8RRGF5z6Qm
         lmkqxXpwQwx34RoibnCyWogwbUeEzWvdX9UK6BgWn4XX9VaegHgwboaG162AMKHC4f/t
         8oY61bE2mPW+2Y8qVNoYCYNy1NO0Btf9Qk/qhi59gKV7rGQQFl7NJ/RV+M17yhA07Q3J
         2v2ufGmNDNdzioKmHiECRf3I9ixJRo8I8sKfWJD2YUg3m+9k/gT4iYnZfpMedPuaQGdn
         0wuucbL6nD9JwEzlWznOdxaQO2t+B7ipmQshpwMfWczc3BHGBbDdgftirVXYxeOg3Z+G
         Tvsg==
X-Forwarded-Encrypted: i=1; AL+hErFgKEFKRJYRYd7q9iEl3piE2MjqExp02cULUh9e3da0KqQYLxurmSTJNpLImAUmVQg4GzPMQNzZM8iF@vger.kernel.org
X-Gm-Message-State: APuU4Z9CQf9mYjVEWyvMXD948aIcWCuO9jdlrJAnw4KEfFyTWf5UAoGv
	zl/6JVEW19Uw0bxfwjWm+CXmVESr0cRfRrD/vJfZhqiaKwj7ZKKPXktPfT7NIuF6jHqMwZDdnW7
	YUMQ0K8jSTaUC05KoW+661QKzQ4x/R8grPK6zqzyk6Z9fJfYps0c6wOnFXcZZf6kx0NdsuLQl
X-Gm-Gg: AYBFou1pdSkYCrKf7WEKlCDceEDI9lZ0UoiuBd1l/sBvLyoh6Zjp0rgaxl+pp1GBnC/
	vHlDF7EnrBaxkf/g0ylZLRUqx+mHTQjMlpIVSpEe1F7tbMIyAr8qBZLV5mE+HO5vMTLv/iVx8gn
	hjFiSG5dyGq+5yTpYq5NJHOZsqKVnuYYhmGzVoja6P/1bIL1mZp85285sVlX0uhoQoMEzz7NpGf
	4Ejhqo+Rj/5JH0EV+b9g8zrDw9+qtX+X497eHDdobi8JN1tgC7jyDuaViyXbG1f4HUsVayCpgFo
	IsS9sMWgNoBoGt1rrAJCDGD+NW1NJTl2sP6u2kGn208ZEIMh3MxCHfw/HHOzaKQc9eGsMpNUrYN
	Wek2ZQrQxmONjIR14BYwoS7jwbn7lJdPa920FdhMmp8WK7UKS0Kb+EklirkbfIg==
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121289285a.1.1794922735569;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121285785a.1.1794922735149;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:44 +0100
Message-ID: <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JeiN87X/rish5mj+l3Crpb2AauVxvJ/WY/Ci16QM4HM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjjEkg6Na1/foI5YSMp5p9UhUDig2YlQw9xp
 vUEnFRSVwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4wAKCRDBN2bmhouD
 15rXD/9MxJ30eyPs75n8xdTYAn7I3NcEN5UEhdv+I0gAg80tgBOUr+MQi83c66n9apvVaONT043
 emhah3MuQ5A4QyA5LX/NnGbU9bvH2aNkw56RbHtIHeN1rTz3jopykskPSGJ8G/xMhxI/aWljQ+V
 j9Ib3ZMcGqaSgvaIoHDj3ITViJypxbWzk9sX81qucr+OD/7uSJahsmOcbCFBrEcx2FZDSSxgX7U
 iRiB+OqYKRSIRx9Hg0Hf8CKz552A0Dxt3GUio9njPEMAbgxPLpndiL8LbNVJyTSVc2UVpbUtOxm
 SUg9Q8e1ndUkjhEu4eDp4+aoc5ZyQOfvoMbzjGdnwEBdAwEGv1sY6LPA3AP0KU0Qu8sVyVYWRNO
 wG497ztclVJSENcQSZ6aK30B5o1hJm48lGynDAoF9/WiYka8XISkrYervUU0kXrFUV3nMpJfoBU
 RSp5aFppqdP1FxTM3YJ3vuH+4MeK3Z+e/q6g6wWGqUIS2c1nt9QmVOeJuDDjnO+QnEsq9jJMCNj
 Q5DlAQmcX/aip5onLVyiWznY77Blei8124tCLQqn6EPKuouuruS3knrCO0jwn1AOLW5PE4/VHVt
 XFaDJ+V+G2ophCoRtJY7uu//+/GvEXOTawW/5ZwcKWG+wpRUXlPJJSlWVCGFIDEKyOxJxoU9ySY IIkFguXhdIIJhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc58f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uBP-owwiYe2Lw3drMN4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX7/Q0KX85vJMq
 2bMGE42ShPR0xCXHRBIMGBDovZRDbhiLWb7MtsHjo+HCFoNq6S/KocjT1iYIOJAgEVAHlU/oP3S
 vtMR6E4uwVfLyWM/Fojd3ersG6+j3no=
X-Proofpoint-GUID: HC27YJLWhtAJV7a-NGgredV286A6pm1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX2GckhbLawL4p
 KLjvZREG2XgQBBU0hVnOoP7Azb4+aMcDHWecp8esuNFDuArX1xfYcZ+RWMNZD0NmfNBAXN0LTAr
 xTx3l6CjLBsXYoXgbD62M1EiRGC0/Z4lmYFwke7m5mtTK++O858lExp+PO9IQy8VudxLmf5yxgT
 CGhzuM+qnAZPNltVD679+H1DegrNRlbjEgujo8JMpNTXnPINC8YU/9DqQL1dkzV0L4BAaUq41Cu
 VFAoBpVobAbJYBRIuDuV48VNGRxm7/ep1cKGYRK12QRvUQdhX8xHOZ7Hn0jHs1ARgVhrT9B6Ae/
 nYCKlze6oBTm9pgHTll5z0vT0xawcZNBfUKhZR3fX0vVGJu7m7TkxXG+NoHSLoQBsJJrSeFMiWr
 ohz2xxeQyamSClao4iTvbQ8TGKhise1uHwnqfzUA73QzSTj11hRChHjbDTN7KJz6GzHZxczwHsZ
 Anl3ciwJ99MxzY8MfPw==
X-Proofpoint-ORIG-GUID: HC27YJLWhtAJV7a-NGgredV286A6pm1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The vpu-core aliases were never approved by Devicetree maintainers,
because they were never documented as actual ABI.  Drop them, because no
new custom aliases are allowed for years now.

Important: this will break users of this undocumented ABI, so these
should be updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 9f9b34153ad5..f9d1c166bfcc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -29,9 +29,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
-		vpu-core2 = &vpu_core2;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 7c4a50e0ec9e..82f640efc74e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -50,8 +50,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
 	};
 
 	cpus {
-- 
2.53.0

