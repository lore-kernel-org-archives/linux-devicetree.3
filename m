Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905176;
	b=4E7ekf2D0HvldxkzVzU2Zcanf9AxDxh+z+FROOczQaoOINGesxpclqQY9HG5b7c/thKG
	 1TCOAmYNfNzCnQK3lLAKrD0LsjrfRksKJ82Q2HJxYX5rZFiUOKKq3voplAOsFwkR8k5Bl
	 K82Gx8bgT6tPODmKyoiq1AjLXrM/RQp/RvgiafuJUSwKtuLNbIAqcASsrhRjjEAuxhMJY
	 4JwwnseeDPGVabVH+z7gt5GUzniC78EEy7/jVavYy5+WeBAtf3FAtLzo2UNvp69W1goKw
	 ddKwspxyTsuaHaHGal/oFcMUOnJY536SR7AKReG4ha4PB1o4XIiZ7NJrsO8vIS5D2hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
	b=Aj1TYPiIsycKGlm/CeVQkUuB+KUI5GWCgBZZduiV0LI43EhUcvhE0pdkyp8wPQW179Mv
	 dIpIaYB+sEVvv2yLucfTYiE2EZAevkFQa3x4bbYcSqVHjlwjVnwa9QIiq7rvaVjPM/Mmm
	 JmNsoTZA2sZwuavcQdzvyXZzStbI4UY0k6YbQa8sTNZGmimh9240wvp+GV9lssbvqVXjq
	 OLNOsJPouLRfa4y6H4fqc76H+5kUiWwKxJJ2u2pmfWfQWfL3gS+IACX18jAw6pIbb/5R7
	 +Q1iOm73hsDBUdXFhHe+k5f3X3OEHOlsML2B03XMhC6eZWV74XqciJtFqqB8AYXmM0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLMZ+iF5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D61606A88C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D61606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLMZ+iF5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aPHp844324
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=; b=M18rxBSSsEMhIqJr
	PXBfchimancq+y9b5XcD7PidRhr3x16OH5bDcp/ELGm9t6bM80gRzc2BdxEcQI6n
	pB+jLk7DbkclTK2SbrvG3/BYEq6w6H3lvbSlfCV8JvixxJ9h6ZZCIPAjgcZpycX1
	265BAY30empgxsZiZnud3g8EEBQVkSPVHs3xs/XYOyuaK4hp71FscYseeD52IfFu
	o6+mxmm/UDL8P0YkMuU0Hyu8Cks2shSchWkwhRGIs+krgO6fPieRm/swGK6sVBHM
	cDfSNj4ZmMa9vaewQmHwNerPHqP3Nt7m8z8pC4vp0ePkQ3FXnzkSPhfldn4lph0f
	G3Iisw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1mfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso3419648a91.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905171; x=1795509971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=YLMZ+iF5FndT7Qs8sovBrfwOQMh7jRsYghGLfxl8N+Wzao5os1W/kP2hvCKvchkvg2
         zUUK8FuuSo31p/BrS96dhf8xjxGqE4uFgckSsFtFfLHBGjuugu0Rg+Bd1w+olriTRN7r
         W9nJ6varzeDQ5DzZ/IHVUQ6NyNKL7kO5ugnLgfMK5xMuDhb+/bHLN9H5ySy4T9YvK4iS
         K4tx4vc5HG1UxfgDnOS969ObIQu4CL32dZ7uOemIacQya0soFlscWPZbZzxfTc8AQSEb
         BCVZK2DGTgFy1AtMeXKdMuor2Bjz3JeTGvKcQvz2cuMMgKgx9NyS5jKtCk4Njo2qKCFv
         1kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905171; x=1795509971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=hMIfyi5Wb6P1W8CIWb2ExJYnB/ZtzSraGJJ+mSNPnr1/ElICiWA/JSyJMd8HDoXXw5
         qZj5i4VF7ZxiyM1Yk9WEEwzDzf9clmDIjBiZ855mXbRyjZhEYHbnlhQHwZD/ICKR8paA
         R/dAMoQirAAerhvHBbHXQ7ZHViJdYqnnJMFLIlkSe/ceE2eKomfaninKdogCvdMixzsy
         oBa+RWXx4lxqB/GZZHLxKlLBS9GFYISYd+nzp+kPujkNkjDMjtzr0A+zwtSBnIm+PkH8
         gJGFCe0QDqqs+zzM36u2nuJAeCTX4khHWqc+n4Opku/dX/uHnQfEtSPkXOcDXe01xbSX
         Iirg==
X-Forwarded-Encrypted: i=1; AL+hErG7cRHu33SnUDdoTtiByv+n1UMzQ1O+U2TUTIfpeyVUW78HLUbbGFmfSNHaSbYjCYgcb+B6gJjYLKaV@vger.kernel.org
X-Gm-Message-State: APuU4Z+hGhHHLU1jfeilpa+193QVT3NLD+bbO5+me/zjGJ02m4xFN+Qk
	9Ui8VZ/ZBR5zhrkE025caHd9CxANUHBUm7SvnLFnJHZzhS72RmdnvfKY9VfvKl1AEFywT9GPVBC
	DVXXNyPMufnEqrPa97XC5A8SuPfkJoB2lKcD7lE/REbo6X1pzbwcr/aZWqKws7JwY
X-Gm-Gg: AZFdTZfLNY0mxPj/O6z8VJF86vJpFOcQQ1XNxZdzKlcQYzANWV1pJpz6LDmA5HX58CK
	/YweWND7sc/hIwOs+u8Z9DkBLkaIYAXs/E8JRCi5CN/X9R+FeTkByIw95xPZGd7gfPL+z2KqS/u
	dJ0YAT8RdXIsCn7xoa4xhUFkAt+Jh3ULt9e+l7RRZlv5AE6MD5HVViwcXUhwXjmr2mmdzZWNAnD
	uJJ/Z9lGBhKJybNYckKz4w8msjzho1erMNvEgkx8huxg35And1DAlMkvo8y5hMODuJgprMphJcK
	/uZQlvSMGi+muXiHUyN0IGPdoBaNaMwG+QH+d2TZb+W8FbbEnmxvKT6G0tuURzkh0wWETqUgmRx
	S8wTvBlvna8JVAqV1YfzADckem+LG+eWHFCKwXJr4k0cKQoZsw+rrDAJn6+cz0nFv8I5ptD8dyd
	V0ww==
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688256a91.14.1794905171014;
        Tue, 17 Nov 2026 00:46:11 -0800 (PST)
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688235a91.14.1794905170522;
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:22 +0530
Subject: [PATCH net-next v4 02/10] net: phy: dp83867: add regulator supply
 management
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
Message-Id: <20261117-shikra_ethernet-v4-2-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2626;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YMQ5tDefjahp4F278sVpJOmFjvs9217PzQ14SbOl828=;
 b=9DYxR2LtiyVkshLd2XOkW8YZL+bGdidE43jGBndpxcLF7Y2Yr0ul8pgYXZ21EzTlUrEcetxJD
 sfHhXFgqkVMDGoUQqCaDh5KFdnJser9ZSG4dFXK3H3x6st2IkhTedBJ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 9ZXHuQ1iEiU58dZmGKu00X6SKojpDS-X
X-Proofpoint-ORIG-GUID: 9ZXHuQ1iEiU58dZmGKu00X6SKojpDS-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX8iGCOnQirpm2
 6a2N3yn3ZbnCIs9HMd+8W1FLQ5Ne4F+AqjFUVDiz6fP4f9OqE4YHI/JIM1zjsgAuH6HS7RkLqAr
 d831Z9AGVT6A/Cs+2wDdxc/DuQkDFYWHSlf8XiklXiLFXjqfduucmAnd+H1R4Mi1ySkqnzhE4oH
 0MjprJIEyd9yQ7cSbm1/YKA0uufLRg/v4jMvlsvOvH0JYFR+Udare5bETJkKBaRsvNIH3t7oo/x
 22zM+BHRD2rYsvFVAx2LDaYuxkhxdflIqSHReL2cLMnLR6fBlbbwiJZl0YbwILAW1JbEWCulZAl
 usgll3e7qUyz9NJKgO0DbVzfInh5wIMRw/i3mGRkAfI3MyOZ7vy/3bVFu16NQFJYtL+Wt3CcMZQ
 3doS3VbBPZ+eN4t+B9IeyaykHLqBcgXtD/yixwZvk/Mzb8wXlSh0gU7tbQ/2TArRbvb/IvxT+AL
 SDrn7l+050WSJouEyCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX/0vkDJmXsDDy
 KqtlOoWWyMDz3XpOqPNmFn8mDI+Vh7H5Qqe8ga+tiEEGsZlYnK3525PbKayBzCH4ZWNgyf5H3UB
 n7qOlCFocwa0Yexw9h8Ytg2J/BjgFlI=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc1454 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning. This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: Sashiko suggested adding a check to skip dp83867_power_on if
CONFIG_REGULATOR was not enabled, to avoid unintentional delay due to
its code stub.
I have kept the Acked- and Reviewed-by tags since it's a small if check
requested by the AI review. I can drop them if required, please let me
know.
---
 drivers/net/phy/dp83867.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index b4b4931c6f8c..ed8b3089e8e0 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -16,6 +16,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -730,11 +731,45 @@ static int dp83867_resume(struct phy_device *phydev)
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
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return 0;
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
 	dp83867 = devm_kzalloc_obj(&phydev->mdio.dev, *dp83867);
 	if (!dp83867)
 		return -ENOMEM;

-- 
2.34.1

