Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FD3CC32B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226369; cv=none; b=ou3D/11qNoQWIZR1uk39o134kYKTXbhxnLrwP0bWAgPnL7T5qZesMigjRr1orpvyGvas1oxoaOql1+z72uJBi6LVB7JWSQEsIQ+wV3oCJIVMcxrwZboeyT1SpluPosR4/Y7ZIetRsL2q/AbhfGCbWig7jOnsK0dYI4TAXnItng0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226369; c=relaxed/simple;
	bh=ZInW5BeuvtKt7WQjVviDvn0AZGfWJ5zHlxLDGSfpHNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fr6FmIK87GL4EW0O70Va1xW+CeASE70VfHDrEnov0/+HRGg/dJ3L4NJjlrwaMR9STaf8Dy3pz3yKeyCgThLC3NRO8MdYOxE7bbqI9HHKYevK8ik2SkeXHkzVf9AA5UCgax7MMTzd96xjoEdGt0LRwQNvTmMTBTDEfuU7OgNCHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9s4bgpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA0dzL9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9s4bgpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA0dzL9D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NDFqeR271015
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z/hxETDnXsC
	raHrXPssAhfCHbQlGbo8HPXOtzZsYNVQ=; b=W9s4bgpbLDsFB3yz0AYq4TU2AEV
	XhrGPGaKIOEhxj/XhfZ0L7CxS4gfx20iYodnmRt9WKHe8hp8UFfcEx4VbNb9GO/Y
	2z7PH9WAuvN2Ac8NbNzRZJU9w2gRHveHX9LI1OqsoPyFT3FqVRDW2MqBXM3Rrntw
	hYDvi1ofVjyKx94pa0btKCDv+1mJEE+YJ1iePOiqNn4oVgY5rd65fGNETAua7t+w
	TSrKrZ28SxVBvWAzbrXH9AFugfxwYRTPpOv1Yeso12o2G4+N/acMHxhnkppErKG0
	ZITjy2i677Dv7f5AiZaV9RGtfit5OIwgVdcdbJkjuLAKK3UuLeSjuPmo8/w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh0f8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966cf5e2a48so2794450241.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226367; x=1782831167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/hxETDnXsCraHrXPssAhfCHbQlGbo8HPXOtzZsYNVQ=;
        b=PA0dzL9DgJnUvGnTRkez/oj8oJ4n+xi4xvkBz2WiX59976p3UeLOCDUpjquUNIhccp
         140dNENRcRDkBNIjr5OUR4sC9FPNiAV+WffJwpRuOV7DUjtZc5beNG2S5qn1YBciIlhS
         z51gbPZFTMIRgCi9ORRbma7RAJRCFgUt0e3lbwxdjTgxCnQWk7twcxW/kpZ/umjnEqiH
         kf83q3xsch9SLRE5lM0C3ozBgFhCmbWQBxu+Q0gII/uGaKYPY028ZtkpC0PPUOrbI4DE
         SdCOUl4GP8ksB8hEt5+9OzTEaXMbg/K9SSjT7qtymXq1XR9XEE0yt0TBFVwKOTw3V7zP
         /+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226367; x=1782831167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/hxETDnXsCraHrXPssAhfCHbQlGbo8HPXOtzZsYNVQ=;
        b=pNYFGYlINzyIxvbkSPvHVtQ6dPDaGXfZzifjAAEiwzrZdPplRrXe+fZlMmR32koret
         suy/V6nJwCxn9DkeRxHYkc71+JJ/SWQn9c9g8iX321+OrCFSY0cXeicvj9Y7eOOXQSxm
         WKRSADzUajdosrOlq4GiKVI9wGj3Kx4IWdDnbl6Ay0RB/wNZdlWMn7WTonwwr6xNYTqw
         1PpZGWbycM+RmxlOP20++/jipIgGZ2cRX1PaLo86Z1/RAinqBpngr5/9upBCSI4sLvmg
         szCb3wkdiBB/QEtNwxSlPeLEfkqGXFLTuBRCWrsi8KdAhs5ZBCIjtbrd9RoEWSdE7fXv
         z81w==
X-Forwarded-Encrypted: i=1; AFNElJ+nwizwsyvj13p/k8LyNm3YrprqCopLdXFaTy53jyfF1FwfWFW9eSSKGm9bHDspwcwzQqQOe9Z11VSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KCHVvKMph1H2M4nCpQQvuSi+g+aqdLT3Eul76xAfcyEjuV9e
	WZzcR8j1KKCnVcktZ+kallg+RFtIs7TdwiWI9qahR2gJbKfvTUwvaG5Yx3943zaeofOv+dAZl85
	MkGgn45UQMhB9GGP1+wSTyhaWKhWkcRjVIezXqr91IwrhneJRF6sO0kVleXdEEkI3W0K6Sujg
X-Gm-Gg: AfdE7cmQDsl+IWVkXN/hPCtckHgek3u9DPuGQJj6H74IrrwrvrxAN7FOQZqUspxCr8R
	iMEE9UO/IVXqHlKJaUVa5B7bmW7iMYgFMxL7GgIBPDPoVGs8o6hU3W4pR2L4ClCmIzdsI9EKPsY
	kpXFzhl/wF/kQDdGv47/o2m+R67j/lA/lfIgyc9+GX4OdXnmMiqdiiNcGEe3vfkh/ei96wYW2Mh
	tn3ZrYnsmxM57/sUvgVZDDBC+8xQgN7PrHRMtsX/TFsf4grZhSgVHTx0qpodAZxWEgNh5l5LojF
	y9EpNpEHkCyy2svIxhSO0cyVExAJeQPWHDcB3nZssGQQcqfIIwUKsUpDKlPaDcPK21Wq5klmApU
	SYya391kQPdhqHPADEdQw48rgu1d6asEbZ6/F7Oot3nOBgD5N6z44JtpzDP3l5rvbKzolueYn77
	HbPH+MGfuuxqpIA59liUYbQ04nVg==
X-Received: by 2002:a05:6102:956:b0:650:94b2:3839 with SMTP id ada2fe7eead31-72ff476b12fmr1406006137.7.1782226362491;
        Tue, 23 Jun 2026 07:52:42 -0700 (PDT)
X-Received: by 2002:a05:6102:956:b0:650:94b2:3839 with SMTP id ada2fe7eead31-72ff476b12fmr1405980137.7.1782226361847;
        Tue, 23 Jun 2026 07:52:41 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:39 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 07/12] ACPI: Make device_match_acpi_handle() also check the secondary fwnode
Date: Tue, 23 Jun 2026 16:52:20 +0200
Message-ID: <20260623145225.143218-8-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX3itvGcS6UNN/
 PIklI6JVRV5GIt3mA32EOmtLARzuQ3E+usylw6Ul3AlToOOofolWMMXDpoOD6W0xVsnRXDsOo1W
 ZAuGURZsd78KaJQY313DjFqDqzpdzzVhZhfz6m0evDKsmV8uBM4UWsKYNy5J74Gqsy1v/kvywXI
 7C8o0hzYfAu418cJeoAMwAVzTPIiOM7LN0PuyY0DFLtafjr+4REiIBtFcK+XVj1eOEFNo8ur1yl
 u3fJ1dgMnjHYa0HjsbM/i9OzQ+7CDSTl3PX4j64gT2/OZPZytEBsj20B+ghGTLUi5PtVkQiMlF2
 q+yr0s+MQC7N+pHTS0abXNS+dZIessvg5eCBnFCiJqdIIEDFeH4DHc/eUsaok1HTKRNFrPwy2YU
 b6UALttV9J6glUVzaTTQZq+sDCUg15VhgHqAt/tZ6T+AHtC9g68XZr+k56na0ePVyBCcxOi/w5l
 BMFdxsaFMxsXZlPcdcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX7lGRjbNrLWNB
 4OC2yTCELshI58EOm40rAjEZyxG9dvjKB2xzBDhxx53Dm4fAhpRC3xKb42ITcgD/ptwyUHoj7Aq
 Duu5kdhF3YH0mIZr9fkMcLQjG+58KTw=
X-Proofpoint-GUID: 4-fMgND-A3OtDBREdZznwHmqeyZLilPy
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3a9dbf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Z_5jWvXtYKhrpjqL7kIA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 4-fMgND-A3OtDBREdZznwHmqeyZLilPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122

In DT-ACPI hybrid mode the secondary fwnode of a device may point to
an ACPI fwnode instead of the primary.

device_match_acpi_handle() is used to find parent GPIO/I2C/SPI controllers
when resolving ACPI device resources from (_CRS) in this case we always
want to also check the secondary fwnode to help find the parent.

Modify the existing device_match_acpi_handle() function to also check
the secondary fwnode.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/base/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bd2ddf2aab50..2573253f5815 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5357,7 +5357,9 @@ EXPORT_SYMBOL(device_match_acpi_dev);
 
 int device_match_acpi_handle(struct device *dev, const void *handle)
 {
-	return handle && ACPI_HANDLE(dev) == handle;
+	struct acpi_device *adev = to_acpi_device_node_any(dev->fwnode);
+
+	return handle && adev && adev->handle == handle;
 }
 EXPORT_SYMBOL(device_match_acpi_handle);
 
-- 
2.54.0

