Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232C03BB104
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230347; cv=none; b=FdBsxmBKIA+I3fjBPYDbbQWmfEjJsmllYe0t0un5s1S/C8MYK++bAfMar/g6DX0+izf1QD3Gw2lPDv7aGmPuYp1BaP996nBF4CXmWKJo0GJalbbl4SKYlYB+OoU7P8j6xAO8Ixue5jHumDvyMo0fZACReza2xARStzzity25R5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230347; c=relaxed/simple;
	bh=WVSHBlAoKrJDFHjSHgKUOHwT3ILmdd9Bv1++uwfX2CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/p2ez7/jqc9e5eGXe/eTvtDalcn0yQLaH3iO3W7UzTBSE5x7hMVEm0X+ZMwXhhphPk8TSxoWO9CY306jbfduJ+2d/FOonWKvpHWha3omuqq3s7TPbeaF93w7nmz8hK+YFkMPwDqKgvEWhBMCADGoEtSstmMZkewLZhgMSPoWvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=is91o+ea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgGFWfrg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="is91o+ea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgGFWfrg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2Od046924
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=; b=is91o+eakQSvu+YA
	41mkYzQVs3UllcmUPE4QHpGVa5esOKREV7CLOZPkeeChuCtbLE3qqAg3Yu687bac
	UWV9ZbyDMMVKkI7z37vW94ZYuDCqc2v5jDC8bb40/DUXa0wSfc5P49314X0T1Bl4
	I/kvJppeQ/ic+wEFefBC2//GJVsmQDvgjTvyYJAUWSw0AbhqqGgZfAPCn1AcrsoF
	dXsmUYW6/E7AMC3K/ha9dzBgsBSwSYrzJYnXnwfuPctCyRKlWEI7yWw49JjRoyGp
	1sQDttekEU8l9euXMadYPIE+17QXZ530cnEfC2CioXnpcgqty00HN+dzq9pK20Zi
	KgY2nA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bggqd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:45:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so2688081c88.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230344; x=1792835144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=;
        b=RgGFWfrgIZjlrHhsZmaTCX5NDiJxmQb34abYSEpRI7U2y1k0Q2RcxUY8nJyAzjA19c
         yM3QA+nzzborSTV3m/LNynOycRatGwrzFmcJfpwguiNMKAg9y0OZ+JyV4XvDAACr24iQ
         nMvYAEhRziH2SnYXOHGBu3CAt2GogfTQig6WD7Wh1qYZE6gvVed8Xgo7I2bHhf/jv20z
         MSZ//XtaGfhP0bToke/0bu0/pfSFCT0rmCOEH0xhdtKqL3koTBQ8hTgvChlupNxbjAmG
         Yo5BgY7aBg8AU5x8VVutklilSfl3+zqyAnMcz4sBLqcHehGu5ckWuk7CySOZV7LnHHy/
         RPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230344; x=1792835144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=;
        b=XuYh/I6gqw8QOSNY9H4uslCrr2Dy19vBBYR2d8kozLj1OZ8GrvetLRcNeulFXhuze8
         /AFj6GyRBWigNeINRy7vmxUb+I6xFLmyro9lwdqxHQgjFaX0hxT0XvEGOqGwD2YxDeYF
         Tj3QHVGECgR1ABoN6ZalmL3taa/7/yPU1UEF7hNEUNI/p7Mq4rGGhDmzw9TsC40d/RHe
         yk6Vgwg4JDKNILjL0N/QASxyoDPJlwx5I4iVaTu5LhWn2TskWUjk1Gf2OhR/bb3YUBNg
         olH3QY2+hMagd9aVdcDCPogX94gPDP1JYqsXBvcaFcf9mSC9XP7Jfv0fwrVRnxibPVPg
         PhYg==
X-Forwarded-Encrypted: i=1; AKwUvBw7c6h+ArbVGTVn4k4Y2opEoBRehkZ+gooFITI1sKbh3sFCSluIchVsFFt8ae458ZWtYaHjvOwVg/aq@vger.kernel.org
X-Gm-Message-State: AFq9FYIryEzO03NShC6LoBBvaGl1jSRkn8C5vEQwCQXUTPHUvJfUzXgx
	bdYi4dwt6hRJkM0zK8GVGD4eVZmKifagBXExgnTo1p3Ukdw73OmVpfwUb32gAM8EbOAL5GvgfxN
	lB8wyrW92vGXFUdImTncKnoAxY0H3KYPXqZhIqFIlNSov0WPvkPPrr5QG4DadJaoW
X-Gm-Gg: AYBFou0tSGeoai3BmpuS4V4aRDAC7jBTSiQPnMl+tWnOjevqejbGrjsLSQecFNbEMeG
	i7ywIdKTkM5WHXqQAly8s8HanTMWZhG2OEdLFy90sMIO/O2lLP68whWlVYfDBoOB2/EIEMBPIyZ
	AO/YnKFMBODS84MgxL2KerVJ9YdsOUPrlcyEmhfHbbsoovWG0SlYZTwOxG0z3vpb+nI1n8o8fmC
	kt93I//yr4Q+9n6gwCwiscc/s7jUIldSMmToBl2XOfdD/DglHfOfmSssmIhvYKy/kBI/gFi6BOo
	sYYktKkn41H/e6UTKKHBjylNw/LNUXA3cCZfHLxARCeuqvtoUqqriMbewjqJXQOC1Gl40iq9jWV
	xKcDDT7dZVNT7KjfPxLSfRwUV9VDurw==
X-Received: by 2002:a05:701b:204a:20b0:14e:cc3a:9f32 with SMTP id a92af1059eb24-18511ad88f3mr3460861c88.7.1792230343717;
        Sat, 17 Oct 2026 02:45:43 -0700 (PDT)
X-Received: by 2002:a05:701b:204a:20b0:14e:cc3a:9f32 with SMTP id a92af1059eb24-18511ad88f3mr3460812c88.7.1792230343061;
        Sat, 17 Oct 2026 02:45:43 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:45:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:12 +0530
Subject: [PATCH net-next v3 1/9] net: phy: dp83867: add regulator supply
 management
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-1-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=2447;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=WVSHBlAoKrJDFHjSHgKUOHwT3ILmdd9Bv1++uwfX2CM=;
 b=UQBsoFxKJfv5tbLctgXh4QAgGFocXPnjAeq6p48mkcMMGBNr5pjE5YFrDHwIxZnoEKYFdwpl/
 C2zcyKxXDyeC2ggJgEVgQUe783OQ7JesLTnG1GO4YI46rkrkIm9ShMT
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX9QPFH2TXIvg8
 QyY+FtChre4y90urY09XmFede119yloahZI5CetstNy8KsNq/AmH7TN26PjO0tGZ5ovUIshQGE5
 i/A/eWbAHHXf1wEow0agmq+ycp/giak=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad343c8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX0TNSfQ1C5RKV
 WJF8ZGFirD/kE1lxlRlBE34YKnuXuhdhvoGriijH9UJNwIjGisBEgjeH6ZDuHs22D3VxzeHWP7h
 hess1JIQ2Grwikw4KU6n4VuSxRGBSmyb+kVuYeLni4sLsXF0RAu9S19RjohN4pA6yBy0E+kyE2F
 BlFyMvj/RXIw7vcy5LN9HJ8x+1M61H1yQlRgl4f+X5wevoqUSsfAkdnawBfZ4xC7RTf3uW2MgbV
 VNA6WMOL1jFZB7W/Oxdt1QE+yLNv1NxH9vSNm6QV0XN80OuS9uiU6KFaPmPqpX8ql/EsZBUPacR
 Y7r/hH8VSISeQ5eGbSq24Y6saOGTkn6BTvuTFsq0lzM3wIj1/ofY5s1uuzZhq5H6/kXIWeEw3N8
 5cdD2YfYqPnsrSOKZOg7Ib+jnbTKayrhV0QH5mkdOnq3JHIKYdl59jrGYasDtvAetyeSduniGVr
 WJu1sV1evcd8PDRG4jg==
X-Proofpoint-ORIG-GUID: eSo0sspHkEWukm2LYeA4_3bTaLVVNouR
X-Proofpoint-GUID: eSo0sspHkEWukm2LYeA4_3bTaLVVNouR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
I have kept the Acked-by's since the overall premise of the change
remains the same between v2 and v3, please let me know if you would like
me to remove them.
---
 drivers/net/phy/dp83867.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index a3cd5cb11ea0ac108219e05d990b378483b67d7a..092bc68bb9bc6561e2457f596206453dd84e56fc 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -16,6 +16,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -730,11 +731,42 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	bool supplies_enabled = false;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (ret == -ENODEV)
+			continue;
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+		supplies_enabled = true;
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (supplies_enabled)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
 	int ret;
 
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
+
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);
 	if (!dp83867)

-- 
2.34.1

