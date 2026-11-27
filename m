Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757005;
	b=UJF4KYT5YkvdTaUPxZaYKnIchIbnexOk4uAuaCYpV3GzP1DTtNOKMJrDLGYYquYiIWcO
	 pPryjNMrjJ4ywnBv3xbUjIFQpA3nknNQnisZuScKU1pBkKhrpUXIVO30MJg/Duy88R4hR
	 PUYhxuVxoxdQuA0HgFa/LhrGm9MuRoHr993wQKRqkxdSD+j20uyKJfJKujfCghQXzOHtH
	 leSyIzcGLdZJKT/ylO0roB+QwH/xVbWtXJH15P4jAnhRBDv/XQJ5jVjXKx+2IrFntGl8B
	 Kj3M5AvBc4uvo+7otHagEeSo4rJy1Sagrpnwi0hav4NahE0aIDKE9nThh0kcP6l77Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
	b=oVLb9m6ei0CJObqfa23JVcvHiian41QKF8XoMoVYtXiRZfDc9VtfrvW37ebMEJwIpGoi
	 T49sHj9hIugceabwRuWFR8ZNDzEFnz2uY0v/6xNHtxPPYL1uH0gCmbUsA+IXCJhAKpq0y
	 fKpd6efcm5qFxuuiZ8gIVxHLCpi4WUyhZmCuMrb9a3cUCZBu1iDGB3fYafQNPuUbGxjau
	 FFEQQmGREcD2i1xoSHyWDhZv5qIcpdLRGXtwqZdRZfVDz3GS/j//adrzs9buHuI+enZdN
	 tGErgB1AF4Zn5VdhdFnBUR5YIfaNO2hBEELisaXtE66ydTa9bUBucf1d5k4u3YMxYTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSMywDds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0kQ+vFe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE2606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EE2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSMywDds;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0kQ+vFe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwJDp3340549
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=; b=fSMywDdsFqHHk+s+
	tW1dUgExFcdPWhGl3TOHnpiLiaJjXkMp+656MdMvikbgHq/Bs7aKdOicsTIOzoj9
	bSMcot11ua/l1kFR8YvTE2YlHQYm9ZZlEGwbLvcE6amK0IbKkLqNo16KEeqpdSme
	D+AcCApsLBLwgukcf1Pas/NdjWr8qakM16+R317dEaqKKDMgnfZxR4tG5XqV1QSO
	6M/IQq7rnJ9KU1nF4mp+fO37015edF0JO0zPivCKFBTI6HZSybfV7zoe0mCbHkBc
	bmbYkHwGKnrCGMAF8F8A80kkTjXXirmomJ82MNyUPURRaeR9qhBZJzgLX50Cuy85
	cHIDTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqja6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4cd0f130bso878771a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795757003; x=1796361803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
        b=M0kQ+vFeTyVuwua7aOkSlYjpufjk/6+XGlnV0mCfIqrpscl/lVpUC0i00+S3rBgco7
         NIQuuzubsInut627tkP9fHPzo0v6WvLcX678OTIG0ug70TYrsJryg47xO0H6QW6QXWvR
         xjOvTVTPfr9G9olAmPoo7GQkAjjpU28zkC0A+9DAJqR2BxoInsbteInr0lUMNsO4M7SX
         7ELXQHRl5fupeEM64tTz9Yq1RTh/H6KhRqbkAKoYuLWviVjYwcpwYAlLrkVOusA3EL5t
         3JWVVHCj4LfGV71M567uD9zxAKi2MgTKbievYJEnUUZr4GuRsIhfcIOkNt7fqEkdrXk+
         alTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757003; x=1796361803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
        b=Pybj1qj/7IburbnJvUJbkNL9ete7WekIAbbjkVdxkin9MVPackgL9nRDe0IoeGe+E6
         AyqUHPMZGhygtpHNOTjDfJWabxLNG3gP2V1n2mc/85rfAuthRtS88hzJ/2R8PH7CXE58
         F0SGZd+DMog5u4jNJWAQaOGicm9DaM2zHSd/PqKXryH1ImcMhR0MQv/6U1udY+rqlqHN
         OcbfWNmwxsawM7tl/Jc8pAF8+YjLV5nGEWrYbONtA107ftKONt4+RZMF8T/+1cOuxNhy
         /ZmioCfp35PBTbH7VWn3IYJvK8Ld9dvqb9X880NKMu0pv8e92oetIyRgCLjary2GBqYX
         VijA==
X-Forwarded-Encrypted: i=1; AL+hErG2l4iJm0kYXQ3V2NJsX14BwAG2XTlhPULRWMGnN2RtjVHaj2AEISgViSseNGjD6N/fPrZFWcXzZB7s@vger.kernel.org
X-Gm-Message-State: APuU4Z9xdWqIH8Xvq4XrjDU1LGHD6hrrCHFPonv8yxdR7bdO8tv7NqUe
	b2M5AczGWkGqjfanhk70CiYdONf+Ll6t14FPk13P7ISRN5J0f9SHWqvH3UfqwrkTjCfuAQIaoxy
	KQBYklkO501WRI9LSpEHNdOgOj056WczEMUt2XGGkmWxpYWKzjKTGL4DCNtX5be/5
X-Gm-Gg: AZFdTZet6J+K4v5v3607PQ14zrzt+FxlWqPhZNgdvRyY+L2w1ijfpqkx7LRezmqFJjn
	OqvnmK3kQqY/OmQB/AphCdh/PUfhOwIJNVQFspAUTKeylo5BuzLQ5avXFLp85wxEYszvF5L1OHW
	zeDr9qB1c+JOpgm7wdQAHnKamg1MM8uH8aezPWPhvl0Jgz1ZkgDbeWpVGoCAgN/O4Ecdo0b3Pgm
	f0DCoffKbtcCyvGglE0K/kL1AG/jGniZZFl0O3cuLpFvWip/p2YGgxZceIeyHOXyQYVN5ehlozR
	QTUhl7ica2bpfaeExXx9vAP0/i3hoGqsH9Q5BKnzvdakSomf+JCZi+Gg98o53JXQDwQMd4He6dP
	PoHMhYOLcTexY6fUEMbJNb5PsUNTo+00rofaHzpVtj8VgUJZ4Tw0EhSfY02sERLzTHeJj9j98pR
	6fLS7tb/Oj3LPniiQ/KcokMlpJj6yiR3mohUybIO42XFv0ggJORnVGJHBdiXxwB/HxGXATbpQFn
	k2nVQ7AKauG/nGlj/Fbo89M3n9t
X-Received: by 2002:a17:90b:39a3:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b41c91f7b1mr38330317a91.4.1795757002956;
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b41c91f7b1mr38330281a91.4.1795757002478;
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:53:01 +0530
Subject: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: Enable optional vcc
 supply
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
Message-Id: <20261127-eliza_evk_display-v2-2-e4223634aa2c@oss.qualcomm.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=1883;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TAGiU7OPP0DmiRW1r6NgAjRh9iFMp42fKygt8T8dPBo=;
 b=LGI/AGvn48gKNMsc6mTiekzKj+lOk6i5FrXL8+Y4t1yZ8r1j2EQIvZDZbDpr6FzaYY82U4pXy
 pUc/IjzEXkqDTXfqWRfEa2Wn/SpimdIF/T68TwksNH5el5ntZvdtZGR
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 4VGK6TkRaiTLsKaINMkOptVR9TqwDuQ1
X-Proofpoint-ORIG-GUID: 4VGK6TkRaiTLsKaINMkOptVR9TqwDuQ1
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0913cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8W6NrlJ52h3mw0VdyTcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX5rJ1C0fNBMI2
 KHDBf55DRDzdCuRZjE0HEOIb3CjQrsV7QAVJN7ZgUz/cqWs5byytuxEg2ukosm37kJbfF4Gl0v1
 ++lJtSqBAsNLc5KTc5UuiC1Rj4+EG4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfXx3cuBAncW3+k
 6KUHvu+gXGM7olgKA918E505/k1+FQv6dACOAwGLBxtyYXyxOiKfFsgNXehDWLbVMKu70TWLG0o
 UxjKKvEhWPPAtORcmTK5GJF4nQ7tMTKJKowOtAj+srfWoAx13ZnC9N4ht3k4lBNeIwTWmJCE9pb
 nrQUr/83mOgjhBQwKua5ZXH6RjuDV07L6owDoekLaf5ryybvy7Ubvys0eIirgdPASUV7t/nCHxt
 CxeYAoWctNsd0sWHFRKnTgpaco94Cblk/cKVpkbWOP+EnCrlB5ioN0QNPprjAvKIrJtS0tZitIO
 seZ3At8Vwzq5cToqGPM/M0+N3G99UbVMIYEp9lDjjtNw/AMm+S4DMpewlMCRmv9W2oU0TR3xIm3
 wTFIkGz3J+JFS0eF4lnwNixqgKawBEqqYOCu10wIoyI3E/qIwfT8b4clusKrsGVKYRrr1LtazSV
 mzwDrLevKHcTsozKOSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

Some GPIO-controlled SBU muxes need their supply to be enabled before
the AUX path can be switched reliably. One such platform is Qualcomm
Eliza EVK, which uses an onsemi FSUSB43L10X mux.

Enable an optional vcc regulator during probe so boards that describe a
vcc-supply can power the mux before registering the Type-C switch and
mux devices. Keep existing designs without a vcc-supply property working
by treating the missing optional supply as success.

Return probe errors other than the absent optional supply so deferred
probe and regulator failures are still reported.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 8a8aa7470df4..7aad3f738a5a 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -8,6 +8,7 @@
 #include <linux/mutex.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
@@ -104,6 +105,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 	struct typec_mux_desc mux_desc = { };
 	struct device *dev = &pdev->dev;
 	struct gpio_sbu_mux *sbu_mux;
+	int ret;
 
 	sbu_mux = devm_kzalloc_obj(dev, *sbu_mux);
 	if (!sbu_mux)
@@ -111,6 +113,10 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 
 	mutex_init(&sbu_mux->lock);
 
+	ret = devm_regulator_get_enable_optional(dev, "vcc");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable vcc supply\n");
+
 	sbu_mux->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						       GPIOD_OUT_LOW);
 	if (IS_ERR(sbu_mux->enable_gpio))

-- 
2.34.1

