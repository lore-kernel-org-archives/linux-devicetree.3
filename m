Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0FB42377A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330485; cv=none; b=e95SBXCca2cttAbF5kgRTJw5a+CpaemOM7slATuuEWPNN+hXKs2l6JzfXlFndQMzhmoPjR6R85AOZKpeqKIQWNV37crAaHPR2d/rDhGevPwOGvV6H6k+A9yaHI18vWMH/m6wFG+DguJYArCm5tkYaE1LtfSAb5mKyJD/QjvVON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330485; c=relaxed/simple;
	bh=IeKRZg74QyhRVwu+kGBUQl8HO8WW7FxL2jQ3rUJ6AMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4hjfj3vRrCMOhIkQaRRLeBFdjWC4kzTeS4YISRycK9kI1aQN7zvl4OjlUYqCq8WC9U/LriSGwGDzWqpe9FR2zY6rvjU/BrqEC6t4GwpN23jKrjyxVgVJiAcfZlqVlBVuWmY/cRRZblC19FsUKihDnjTnuMBgIVkPQqbiE74gi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFLCOJfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcFSwgkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFLCOJfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcFSwgkO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694GLq142690
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lVYzWkq8RkW
	eG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=; b=NFLCOJfCuBezPKIGjoBd5fMS4T9
	sm2LSF1ro6b05Lcd+AdtG7GcKw3uPxZByAgcNdB/7fYvFLl5TTY1BGrKHoQmD7MS
	5zCMG+5P7X1nqMqXlow2WrKKPdbg8tYOrY46DZ9Fe++7FXz1gj3Ocrh6GkvICS8G
	ziwj9SbQP+wadn7aCxuNydqD7WrZonxAjmpA8mCYaycPXDWn7vHPU995SgfhVxh+
	MT9LfEs49dbYxctwLr+NEL+eHLb1fMwfWzefZWHc/ina7NERql3Y1eFGDFqiNB/m
	+B1xqYE8/Yjl2PXP7PMGa22Ga5MywjmVPP0JQzqHBfoPABnR/jLWv7JoTqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swp7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:34:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66f9e2baso266157685a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330479; x=1783935279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=;
        b=hcFSwgkOnlJ1RK4n1PSddASSvU1Iw8oCROfaixAKQOqBG4vTnSNAqki6347bRNOSh5
         OmlvxVG9rHmZse/7MdL5FXZ+DA3M0R/gFkkcJrPcWg/s4R2nFn/bE8LS/AS1G54qUaRJ
         hi9wKLdjrdyx1xrR5heEUBoOpulGCWAjW6oLqeaSXZ+yxTz3O+7sxd/mP2emxcyGzyof
         U2ljBmxcMQ5YS5LebEOaAs+/s899eRdZt9Fz1vKvBspZXT5JM1Z5iSa7qQpMcpKiSKM8
         1YeC/YAl5ruHOUmT67uThju4vYvrWBTljQ8uNhKI2Ok5rdjfp8UuqqCsilDntrhXCYHq
         1orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330479; x=1783935279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=;
        b=hM0v+hT+1bnJjVbZM2ApPGzfG50KvFQxmhpaQoNErkSvQYlTVORZkvJrOk+l+pkYG6
         V4M2UCaHtlBku0txRjTtDQUiLz4Mi9PZ85FVvzy1rKE+rUXii7J2hvWhUiAGVX0Dd1jk
         5kFMw/Qie48bQ5/q5AtYxHDENyTdeXsdHme4nfRjC1AQs9dTgjYZevPKQW4EQ5+7rnjg
         xkAdYQ8YgnOPQ5HmGHvEFfAtrGD9sN7IpwTGmAwQ6+GVDK6d6WvB9smFsXyPp41VOv9F
         6vo+BFHLvvkzMWLArJzFsWcVD08ucgzcEiyb94c3b/yH6QLkLwRvlzTQJQZ7mHv66Q5A
         dkIA==
X-Forwarded-Encrypted: i=1; AHgh+RreDay/IQqxCn0Op5xwc8yM5XsgTX2gJOzf6lgnJzZ3DddKkOuJ2+TJnyJFom/Sgxjj42aRuUf72//R@vger.kernel.org
X-Gm-Message-State: AOJu0YydYo0sC46ci3KrB07EI2mTDRdZOlDyAKejKZ7E+vGUSUzjaUn7
	f35NYVVby4r2BoIUJPX5ChS0YYzOFHmQTIrFIdOl1PlYmSAAbjmdRQUuJLD9Y4T+QPKNI0Hc6sr
	qehcaJlNil0wUNjeTEl00TfJngl/NK1WxsyueVeuuhxJOkwRZGaE2xYL/MTx/PrIt
X-Gm-Gg: AfdE7ckxA4C8/ZLOr5htkXtle9ljGNersaZnwaE7KCSbYqZO88GBPPS9Y3+c1gGXHRQ
	pKpOurNc59tZ0mOWJBiYIWEA2gopTScRZ+vE5zoacn2AjzdK5ejPooLtdyUkNFd5cUJjUQ06ULT
	iK9cxYsIiNVblTOnDKReCZa5hqy+BVH89nQC1AybtUzeELCzg7QPYyaIY3MpbrE7mFumzPP17FY
	19BwzMv4QS4+nlx+USEC+9zlEjNUL9umx1/R9hbvO4qmmBkKxKXIhWYoIvDj2T10yrlJIqO/U0x
	DRl6dpNc1uZeFZgOsMF440Y+bm/StCn+8v7FAoV39CezACE64om4i6bBvFB3URwpXs65gUKrfTq
	K+lDSg5ET9yl+NPfstpW3crFNuIQ=
X-Received: by 2002:a05:620a:4609:b0:926:16a9:cf08 with SMTP id af79cd13be357-92e9a4d1e57mr1259051585a.51.1783330479291;
        Mon, 06 Jul 2026 02:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:926:16a9:cf08 with SMTP id af79cd13be357-92e9a4d1e57mr1259048385a.51.1783330478878;
        Mon, 06 Jul 2026 02:34:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm23938339f8f.16.2026.07.06.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: s32g3: Correct indentation
Date: Mon,  6 Jul 2026 11:34:32 +0200
Message-ID: <20260706093430.273703-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2184; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IeKRZg74QyhRVwu+kGBUQl8HO8WW7FxL2jQ3rUJ6AMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3anbJNEPvKPAm/1YFLMfNg3gBUMSn0Tm6Py9
 TsPqF6qYdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2pwAKCRDBN2bmhouD
 12thD/9fnkq5jQJ4WKHrWWltGuRyHhe+UQRj9VLv5VK1BmER8T8CowIHvmUX0XO8r/vTsWLjmKt
 WXB7pc+QQw2B5KYr2GO3YVt4aoyuO9eclCQuyOb2bQ+Watye2rgVgm+0dtiDDPPPhpPZQk/uIdg
 5o0HtXrtOEV2D4uBNK2JJhZIu+OoCgl2XS8n/OCGs00jegKKIB+dVgRw10pgYsYIsjf3BEjLVxk
 86QbzmKKFf5KNjxbIVSzMWLWqBcblJNJpQvBT97dq+lwS3EaFIye6V/g4ZPwcT29Bd2w5SeuD5H
 pDbC/ipEC8l3U1aEGJoYIDBgEAdmmKe884gec8VkclFcQ5W4e81SFFNxsoRRgCkNik1G8JO7CH8
 QhhRYbga3H7QavEhjpGUaYV+yts0PdjoftKWbDpDuQ4/4+zrcalBxpcI0ih1aR+IkNEdDxL5Qm1
 O+LoGdfiL63YjVzEeht0XAivyr1jiFj6sAy4JK/nNPubnjUkFSbSiSbU+iw2trjDdi8qV3r8vjv
 23syf0qvADAsLkFIEWgOoQxSbUXA5or/Ja7BeuQQZw+0QWGohLf6rS6F4F3fLZAxM2qBGblInCo
 Tbw4GL+l7Sn5jD5YegF4e2KxlWBZWBFVPKWxDG7bglqF6qHvNRIdO748vYqI/knGdanS4SRv3lh pQ5guXLIWUA0weQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX3kfB+tWzNw6p
 j1JD5H/LR2R3QdV5jY0KobLhmjY+95gIIa9QIrbP6KOXUzYwZJyFNcPJuWwB4fW+NiJoD4tRM2N
 JiT126iNQzsZL21Zl3JLQK2VBPlfxtM=
X-Proofpoint-ORIG-GUID: haCI-8K28ZSWcIt3e8rSBQYGLWPrFoaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX5tujtzWocMFf
 npnT1fcU9lDbh7FKm5gTRQDlKCGHLzn99LnLVyHheK14YkHG4aIJcQ72ruzn44DxKz8jMC/Y+sP
 jaDqU8PHUjjSUDgmZGtSlfW5P5HVO/GAjpx2eq4NoVxEr8Knu6y40evH0Fp1uAY42Q0pjzIwEV+
 9LE+xArXtgOUSyeK14M6/3p0TIvcKRJyzKyIQvEBLjo4I50+uDLRrTj7ZH8mzNJ73ppRpwGLhFl
 ZXklyaADin9qRK7+UIidHXN2WW9uViHD8Kol40R0Tpqy1WcK23WEDgr3QVOu289hzS68R3cUdll
 PW/S0U7PoVHbqIXMGoYzGD1ArlYM+Zg4+VNGQvDTK82SeBGKvH7ycKKFMXdAzrOMRWxshy6Gg25
 lJimQ9uPGONfogkcy1P+9v2W6Pd1bkfi1lxfN2DnWxJEKl8uQSOl7eX+Z6+Rwyj55XlsUZax9RX
 zDIdOXDOYnD2M9uJs2w==
X-Proofpoint-GUID: haCI-8K28ZSWcIt3e8rSBQYGLWPrFoaM
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b76b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yCPzjt8dSLUH7PgGldcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c..6eafa9139557 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -534,22 +534,22 @@ usbmisc: usbmisc@44064200 {
 			reg = <0x44064200 0x200>;
 		};
 
-                usbotg: usb@44064000 {
-                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
-                        reg = <0x44064000 0x200>;
-                        interrupt-parent = <&gic>;
-                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
-                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
-                        clocks = <&clks 94>, <&clks 95>;
-                        fsl,usbmisc = <&usbmisc 0>;
-                        ahb-burst-config = <0x3>;
-                        tx-burst-size-dword = <0x10>;
-                        rx-burst-size-dword = <0x10>;
-                        phy_type = "ulpi";
-                        dr_mode = "host";
-                        maximum-speed = "high-speed";
-                        status = "disabled";
-                };
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
 
 		spi0: spi@401d4000 {
 			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
-- 
2.53.0

