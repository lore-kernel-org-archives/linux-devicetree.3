Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178837;
	b=BavOD/NmljAORVi5lckiXdi5xSROcmzLLCHMjgUgDRol6joJxHfIX/Nkfpccto35rspx
	 JKl7aDGrX4Oc0a7rMe7AhuKM5d30cMY8RMyp1+kQZCdT390b9SUPzYr9sax7f4nA0JFrx
	 4NtafeIVYtRdwdea1iZr3EiZ6tLN5wJKyFFeYVVSy7BQGK3oqbIdKRgCjGTS6Vq8DOlWD
	 LE1sW99k/UZzwvvCmP9zZoawCuLoqn7TxDu0RflK5MjCYaHP4XinDAiY6eaOq3T4Kf73g
	 /n2DyoJrc2DiZQo1xd1LW942VXmwnB9o4VdSC3rFXrblzaWgiqQ4xS1FyerBD1JbBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
	b=qOJXKLQx3IBmChgJwdQv2+WHQbUk1OIbU0pP89JfZ6FvbiWqTw3hMW4Fslkc7E62ufN9
	 cI5rwgx+SZhBnV6IekHZTedyLacVLncYmERJYtAqpGqdwi27g4E2v1sXPZq/OOIb1MPrp
	 ni8NcoN3UDvQZ2pPxJk4yCJuTtexeSotEL5Or8qqHNG7v460Qc9+cB7Kg/ZuZz8QQrQf9
	 aNsFGedA/Pzi+rqtcIuUX8s1IV3pYPmQzuwVmLNTq81UlEld5TkAjtteBBJIbOhkTuQ1L
	 qUADgD/0uG13dj8ti5qIPsadf7DHhBMs/dVLdYoz9+sTxs86mJBnGqY/y424AxOR79Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiJ2rWbA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4E260A5BE5
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4E260A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiJ2rWbA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwOl1168946
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=; b=oRZVYadQvCYWx+Q6
	Y2FThl0ba8JhSx7ZZ01sfsZ15h0Z5wT1EcyXAp7GAgEGAx9eRti+oc5Oqlcm+xto
	zajaeD1uOMFymuGWBRC/C1Oe7x4Gq465BUxjtsGFfF2tn1ZIw3rwoyF1OaMJD/24
	zeW0jgAVRzLmoHn0Y05pFlhEcdn/IgIZiPk6pLHQSyUTLNTQJI19Q4kSTS4qWxvB
	rC9Y6xOz5XT5Uvpp0k0+/5wayztUdGnKX0HdSuBM15gBUI7rRSraJrP+ZfWAM8P4
	kVo9hLo4o3T/j0LgUDtonVYTnrQrs6OpFYk1+SD2O7CkVyytegXedpcAlDSMKKy0
	iL+cgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5usg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so191747985a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178835; x=1795783635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=UiJ2rWbA9l5L1Ar0gbWRDFhQMr89/+wYL+8a5o3Cp9ZBpFFI71e/AupmpM+fR2sjed
         ULIJfRQ1FOyWe7FLa0Hs3QDvbfYCWHG+zmrG1bZAwxwl6ut97J5sUPMlniMtVuSae068
         HZ8CchgMWOPTwCYWFmusL/a90eO6KtFTqc51an1bUqmSLRSls79HbVZ5KNFV2kivXLh2
         Hw5c/diNSekHiMDnR5/v/BHW6Gfu8/mEb6N46B5kBnveYQS4MLR+Y8tkqCDJTkdOG1v0
         KZzTUSxrKRzfPYT2hCASnSWdg+06yHMY3npsckFVnTrkyDp1tRjnoYQ12/BHmEHZR9vL
         Yibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178835; x=1795783635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=jX+esvYrGb8FEwsJXM6Os3ieIHeNyOp3maA6FK3abzqBpIaVR25arylDWXe3ZfnUct
         k7Y4YvXomOAkP3Okol6qZBkinbCcEs7nc4Koa0v83pZUPuu/xLnT9P8tH0e/bNDpVdq6
         aFse18wzZW0hPeEjxBQOGkimFPyCNkjgsWB94LJ13I+Poh1RsuwnktVrLQ++FBT1SDE+
         tNMB56hPeKCEU/VIEtjolY8yBpwFxCyvpMEkCf3nnD/w9b1gsWZnTfgu2BwmBzdnI4GW
         a+0R8JupAJVndu1Lsy/FIlq8d9M+uSfoWDvRdJXtOpwCfddBf5waHqqHgYqx6qwThsoI
         fG0w==
X-Forwarded-Encrypted: i=1; AL+hErHy/nmqo+EOXO6NNzCLXIEOBuuu4TOM/2sFNr8fE+YAYhNqwV43VNqONJzUpz0nJWSLffuBNH108b6y@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Loeg1KtetvMgQN2XvvcAdjbua3Gdz85HTx1EPrLX20z2dJL8
	3qxbWVnhvk7fHX31t2RReeJUjJcezicnXALX0SMMIAQyx/f3dDNuxuEP3ozbxzReTRARtMDWuyD
	7drOs/YmBXvtIorGjSWb3KroZfIzN4m0Bbd1EVJC287c7hB0tqEQ9sk5cl659+69m
X-Gm-Gg: AYBFou0juUPeAzokhFELwGHwSjIoCph+rsQbaR8nMzSWuPcdzcFViotXz6wWELKRtnX
	Lu9uvjD4ekW7F6kVhYIil3Ls7dBwgqTT2u6vstEp30Z92ZcLXZe0wbrCrpb6rzn/ntISnp06tPp
	KJpfOFxrn4Z0UGqXYAaSd/oR1Z2hPbxc9E13pDL+nc2PvASl94SVGvBRtnoK/7HP53HepREuiAP
	KMHCQ/WeBhCiZB6r4d56DeWLOKcuooKSM9rX8C3nShqKxgjUnek1dVIkPTutXyn0HFCU4EZjhgh
	2OZR1lUdIvHQ4ixALhySCvqM1ehBERpKJ7cKG9U8rwIavL3LRe07qTwket6Ayk0vVn/xTwr6qDd
	blHTPwF4nkFp+82DMujsEbXlQ7/lkOjsYpT5g4/rOqOV7C1tslEcxbc8roHXEr6j26GLJ8dVkwm
	M=
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485702885a.21.1795178835192;
        Fri, 20 Nov 2026 04:47:15 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485697685a.21.1795178834684;
        Fri, 20 Nov 2026 04:47:14 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:46 +0100
Subject: [PATCH v3 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
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
Message-Id: <20261120-fwnode-for-each-prop-v3-9-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LlJfTzXZqPhPYiFBMDDbJUjl6+Z2YhN3yTlXo0CvUjo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4fvRJL+ZveX5BmMRTVI0xMZXr6Ij03Kqcz
 jdiUFtIQN+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w6TaD/9Scfa0Lmv3m8Q4KKZfDFfFDgXcmFCrRT3z4OcdVe8A+4n8W/PM7KmtlLSNvizw33X9lbk
 mW/EaCE5U96E/gUBeaJahtpbIA06luLpOEFoJbJfBvfVjUf8bnfdqxobohQPdIH/q7bvW2mctJo
 LrjxB4o0+fyOYN/Gg10IsxUdPRIZ9sJamZKv7FEjpp1pAf0nXqcxkgHKr9GbRdoF9X/BRGqpdWa
 7hANJwMpl0EWcrnNXtLmuCGMRkNMaLMMAN53S2dd1jj32u1f2/od0+6wDeaQSo+92qT8Kuhqcsb
 IGFYcjC5vmM5QpEYJXYLJTrC2LmyTMD8DR9u2uMLAKRzLsIzoGJTERPugK5GXLwlKxy9C/1cbaL
 z0FEBUgnCNNwvpx7kKOPrrjx9qFZxitecrMayh0j6zjvdCjA708U4+g2Q4vSFirHZW9cV9ZAyN6
 Mc5TQJIk7SssKkq/WqApM71Qxai10+7XrESJqpuo1+SgpbrOFQKt9Hm+v5mkbTpiNOJEYYJyw5W
 bNM+gNibRYcy5Yn/xByAholEFTCaUM2wW4B5ALp77np0orZoIM1+IpHNHgowTnvPoIJ9Jsx4mGU
 cGVDNZ7ME3DcWYzrDdY6G00mCyHww+XJXkAX9lELkyhz+9YAU9z583D1exdDcNZ1gNXZ4OwX/kS
 XykOGXolGEzkWbQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX141vmTWL9e5t
 V6Fn2gyuhM8FATcrj/q+r/yGUaXy3pb/8l0+WW8J+tquiY9SKFcoi4JCTS0DcSgLsQ/brTq5WlB
 97E5x+gLWucQcEXHlIbGdYRavwoaufA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX21QYidi0TyhJ
 Kn29UJaFWlUr6F9Ag1KOWqXre3vaOFfT7kpXTYtCBwuclDbxApGZ6/UMOr+tFXSNeJxEB/0W1h8
 SUjG98W37g3dewZDgbuiXaf54pkXB3LqrzoyMrycURnShvcPqnwwpVbE2+VgztrFTMgdTw+bsQT
 JqHmKaAELFvfXkjCHiE2OgG72mZiW5zyrwNGjvIQ7Lb1NZJx8pBp/Y/JvbZPLEd28LHCZ0OR7IQ
 nOrlE9np7lJajebvrmiJopOBCLvqdIpUo4EhQ0NNzGxEh0/aPGz40QLniN37ZlrBiOjzccf2j/v
 muDWsEv7n6GMVSoRjAxuazwakGopE0XBHGkpy5aPHzv3Hf5kt2jelnhdnHT39IEO+toDUAxeQfK
 5p1UNsco5I4DaWbqEZzMahtJjfs7nNCic/+onKlKT1dtscg523bBpsDobV2W5jXucWPM/hiwdby
 npZykuBnH2raRd++v1A==
X-Proofpoint-GUID: zZQ3FD3MyPWVjS-2sH5hqm1_i9yig6GG
X-Proofpoint-ORIG-GUID: zZQ3FD3MyPWVjS-2sH5hqm1_i9yig6GG
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004153 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index f0e3edf07cf1a677a58022f8d76cdd6babf1c655..fbabc1ee489f881084033f7b92b42397455f5811 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

