Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF1441020
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203050; cv=none; b=Wkzt7a3u7wPeJhGzZnalooH8KZetE2aW7rtLpu2Rp3FKEMHIKS8Ywzrmx80f4ksxnZJrNQ8yL5lT84zGq/g9ROQhh7iT0W5+Jl8oYnyXju4o2pCDIYjYEKg+lTDQhM3mfdCkJDh+6NSotEQ+J9qHidf3/TvI69Hrmx5NkrimPh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203050; c=relaxed/simple;
	bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZSrHFxPhdAHosArRBKi/JXyAlORLp1UU+0h6TdC3C4X5Kv6dkVcWUibLgVg1cOrxqgXlRBqa1pt7O4gy7ZWcD4xF/62v9iEzlFRyKBnoW+tMQIIySFUnX1T8cdoyaFscNrFh7jUibPxeEkxpu7yZMcn9Y+DoKTRkfdWH4aVgEGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myaG+0Qd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIm97A0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myaG+0Qd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIm97A0W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIRou51433771
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=myaG+0QdAH82aYHA
	T5bzdiBz1N4/ZDU9K56o31TCPDJW2W2jDAyu14JVpgUhN47kE2/SBmuWvcfQ0++c
	Qy2VFuWc44xxX82ZYWraTV/silo5ycrPtjoGXzf+V+MhArRjVA3+dyc/K1uv2ZBn
	80pjbr8Im4NMVrgWQysarliG8Ss462jGwj61LHgm3Am4lFgqZSioS96vd5ZvrYPf
	lgTZYlVkI/0PaUMCJgGhLYFQAhi+VCUSjwofLEtJJAU6fHkq8zGXwBRQsmvSJFgX
	5lJgNrNTcjOZWucIA862/rGuDHVCq/Vr2rCYrRi/4OzioIMx109+gvLiBjI9U+T1
	cKiHug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5jda0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240b58211so124123b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203047; x=1781807847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=FIm97A0WqXD9bkbJ3gUV/sffkJ9Sfip7kYqQCUV0xZ+HoT+8mY1mqFB1ioRvWuqTHf
         1rYAqrrQKXCb9fnAzubMSEwJmkK6LTMDUKkOgt2OjP6CxR3fYpeGtAD8qco9Zfk/gGcM
         fx7uoFUA2oiZxQDJTqtG6Luk9ZuhdEOKLK0GSvN3onOlFAgggYOMF/8VizjgdRQYYDYj
         v57ffRMSAcXmQG1UTS2P86TsBqJCEXcUzl0Z2Ngpw8LBWcGEuGatYvawDvlBkaT1DPHX
         UAHwIm2brRHvS31CYJwjE7nn61C7+YLuDoJLxHuzQc+IfMeX5NqLJzHjqXMCWJWnmlYh
         UvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203047; x=1781807847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=gtLKHZyIGEWtOYCWcgKjLUg4RNoCUJwLbiA9cmTieLkKEXfJjjma96a5YKvsuiTL03
         VLhvOl6ZxRZCYw4yTcbOpCBWj6m1TPWpK4D4ZQaKXFdkw3NpGYCPaxFxv62DeMyMn8j8
         sLbWZN023PD+xrutjco/6d9jp1PR4ZEKU/L44C19gaOZwyityLgh6hRoxE+ZhECQqfj7
         rV8tyEJj6mU2/OdIzIb7ut5cn7wX/wnmToCly6Fh9W02WYIYqosTThvK47heqYuLXqLe
         jBocbJcnW/aSJxktrrtkOYMLKcYqFDk/3RzSq7vgXREqhvm4OsU9CSsGl0PR41NMF1Lh
         r/gw==
X-Forwarded-Encrypted: i=1; AFNElJ/1MW8PJ74O5XwfpIDIkXcBWbGxwXiO0cpYVSqY8/FCb9nWAijkb8cXiKjgY5EJZ851e6ojyQAvUF8g@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6v/9+LPfk8bpi7yUjpjkDXWm8bpqW8XhsrrLiplv0gm4Eh6R
	LsGcjIwD6tea3LMqusR5ZXzqluOSWy8ZXN73n12O5xHaDwQNjdHU9aU69GSZgAyISdkfmr05WvX
	1XFdP0etl4lzystD2ZnB6iXkzvNvzbtZsAzjk+kaRq4n736x4opGDzwbx4DXO+Sis
X-Gm-Gg: Acq92OGrS8ds3rwIpv46RYC5O2Kex2Er0DscnYV78nFBzcbvKpb5JWi1uYYfOI3NJid
	QvNCg8q9S4Y2JWIFysPtgQ3OK6f3j9jj2PuTCpMzYqYXQvAK6FHwgQujefGhSwkRCl+tGBCQepj
	nu8FpCM+ivfuphveaQ3/1xgow47TInEeG7l2N39a7+5TzRpUh17lBjkG1XOX3JRPKW3bJrw/be2
	ETX+FAOCVMDPxvcZXKNJZHwMHgfh9cKOu67PbIlPOgYFy64k3b70z1TO2GW4DHhGJNCEpznTKxS
	sBWYNhgEbDK56evWqDUVC3IJPNNTtBgjThYQjEDmIiDiLl3+8O/Jvo7c25z5fsxP7r2vzCA/vCs
	bqBDte+A5cLLZazO5WMZKCvnve6AxhV4V8KNN/D43vrBsm4Cv898=
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id d2e1a72fcca58-84337076084mr4736789b3a.21.1781203047541;
        Thu, 11 Jun 2026 11:37:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id d2e1a72fcca58-84337076084mr4736731b3a.21.1781203046852;
        Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:58 +0530
Subject: [PATCH RFC 2/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-2-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=1852;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
 b=+3Ngf+LV00R14UIA4JhwZPvyrrFmhJx5fnVfVR/0VJFRrLoTMWjRw63LOhmMfCcRp1SypJ3B3
 GPEOoANmNeuDfd0CuXaKLK5vO4xXckMQdUVk/n+kSbWk0jfFTEb6Ddr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXzxx7a1zICcbH
 A9bd58PJ5hRcTK48lbpvmhMtNQjsr+8OvZ7XgzWH6c+krbDN/xebpqG+YbBBNqhbc7N5sqp7kt2
 CDUcbitlyUqTScNpA6O6/EAawbMHhS3crj+6euS1Hlh5C8QrgC7c/0ZNb15nQvo9WTqkRbyGWct
 2b+h8U630QL6t0+WS9/QbrNtM8u4kdUlp1Lsb5UOqHrtT6JUnxMyVYkX2Uau8KT/6Pgy88+zQv4
 nX4OytRUltSK99CApJsYtfaPwpMZzaX5hLWEJtgD3jsDsqRr5JB0ZUwFMPYaCxpjQTIcxfSVi5S
 EDljJZRPQHSYzskyUljAQb6IB9Uku4rGtOxioWEnihwTgJMP4O6aQ5ylZHIpBZAhVFvZp7hx777
 z30B51LDxGRt1HK2KhT84ByuTGh3RqJV7vH+mLPM+v1kHhnv/w01Bj+gwr4Mm8D/sBSO36duRbG
 mB9U9R0pK2owAbtceuw==
X-Proofpoint-ORIG-GUID: Dx6eTH5Oo9S9IYhWISft-_CdT26WOTHz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXw1ZNTwZJnQYa
 KvchvxWG7oBdizdJL9iNmP6jDwDzatr3Ulm6KSbK1YA15Cxeiy5fLVWIT7pRAXScbWGMQf2BMLQ
 hD/THFDgc+jZsr0gtrkhBaZXoTDmXbA=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2b0068 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K6GgjFCvg-rKmMkbl2QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Dx6eTH5Oo9S9IYhWISft-_CdT26WOTHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1

