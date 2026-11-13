Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584831;
	b=JUhHsVc/hM9D/g/j+EZFWnmrZ3ZWMNppE+tihF8f+KnIijgG6UkK/Iu/5pczFVJzQer6
	 VmDbYtHQ14OEHgsDrW0sCzzeT97J5FlOukL+f6I/txA7LXglPekATAZTNjaBGxsLS5LtD
	 b/Oh6HT/ZAjutVGMv70C/DUR1CB+Sn5mWIeK666eAdf2LPmOp51BN/Wgxx6/MkbrgvCEG
	 TdM3LhS/aUgsVEusAVlrMfJndH+g0a03U54ENw8NxbV5IAfiY0qmzVugKGYk4Mwip5LO+
	 qDlentknIQDziR4BHbOxmcboRm9/AHAr4L4+fSpaBNx0ZHwHw5jiSfj/Ft0TxXAwZiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
	b=qTSBYjFFvsX2aImZ6bDW+Z+Yh/+yeqPTW1Gyxi7xVh2l+IJXsVrG1DuEe73aPVyEBbLs
	 XfpN96zQ28R4FM6bB8Vzsg5xlNIujU+yzfaaKtwXIYmJFArO9LQfymezhEOkjB2YVYSak
	 eyLQQlsSRMVv9PvbQJKm3x6iAN7Etwd8LibJxvzcDxSngkRBccqTeQM35+BmzYIPWvg3X
	 NbAQopnWed1eEprpyXa2O/7MVu62W/dc5OSc7qVamOV0SdQSjNiADk5QV/fsxD1dAEqRG
	 STbBJ5KIf8VdzS9B/gczjNj9rZjNMYyPRmCOaqE8iY13aNx50UIIZiuKoRvobIt+ucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fERmXGWD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF7606A334
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAF7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fERmXGWD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQtfl074761
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=; b=FeHmIXaBYieL6OxG
	t6WUzojIA0ZKYBDTI8hL2F5VD7PdZyQVhoF8QNKqrS4mA4n6iJaAoIlvnhonIEDA
	Lm+z6C80W/reB6J2KTaV9ql5SlXhPCIx0S/e1r30MiTWPHpbPPeAOveG50n09PLP
	RuEIPw3JoY4Snyp2Ot0CQeamBYdrL/vpaJhgvLr7vb1zRDmqN3+qLw5Qv2PHPH1t
	yxSb3kAX74B/PyMVEmo+5VPpHHmddiEpPW9fk8EJXJL1zCoVNbtxdD9EsGtunU6W
	u3bby84HVmXrzZcBZKmoCOZT82WZuuh5ycecA34oL+5vjPSErYRuu7pShRxq4WKK
	h4OyaA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mtdne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso125874241.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584829; x=1795189629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=fERmXGWDKC0DFc7eNl9p5nCD6MopVh5rz2Ybo37Tqlpo+aADJJOZv/f75BAZXxEWD9
         Ic/NY6NZhPDOS7h/eth5157Gqjpuxvexwa65cTrq33NLECDW/Tuf6TMC7x5rdqr1R/A6
         WuGxWPpE3IXnfP04pTEouMJUD3Jdh7aKuBy45zCVPr0bAFstXwVJ4Iuj59Q4kE8e+nuV
         Exht0CXXnyybMB9MFskXBGWVFZV53Kk2yQbB4rvEgflh0P3CS+a+pv/zc94KkPPuAuwp
         WNHRgCa/DtDFZEnZ1iU5XuNsV/5oSCJb24YbqJUZoMyvSvtNDG9CnPX/hKz2XcmGpdqT
         UmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584829; x=1795189629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=bqZi9z4elTKST+SiZZqjsbmb5ezmVsnULnHnPbz8LjIgehDM45eC7c1O86Flp4S4CE
         I86931HDf84mWFoJ5t4dTB77WS42iMq8YFJl4tcICtG29Fio91W34I4A46WrOyq0vlIO
         zorNeq/uJg/RE57cBLLYVdFsQ7BJOqUbnHbjkmXz2cuS5/TsXNvEJM95JOEAR5vByF+q
         6ZpCiotd5Ft5v1kK03llQvVqN2GZG0hsMl2c9l0Muo2RZ4pF5zGiJRKv1D+kKUVm0oW/
         Sc5Gt8c2wIy70YJY5JeHk7/0OWTpBpLpbpITeAJzQvNAhfaKA8XSDpHhZ700R/GtSi3R
         lTHA==
X-Forwarded-Encrypted: i=1; AL+hErG6GH8rmFUFa2spzlMdNB/AkpiU2UdQ0Qf46QfqzVeAmpSJXVgzP9+8Mbje0kIO4RZS6CrLQ9rlv3sC@vger.kernel.org
X-Gm-Message-State: APuU4Z/c3nps2gyAV904VBKBX/FSDDfp4ZXDhF2Up4/VdnRn0K/qeM0b
	Um5Rp6x4lxgvE/WFAWb07xtqEHrUhPIikYMOXU6Qr8GvrUkNLonfwp7/25UUVIsyqYT+L5fSbZC
	jULg0oz+P4eWV/6HCyk0NYe5YUKxqRfF5X6Bz3Pc9gHpsWps1pOks7mGr5EyfPRa3
X-Gm-Gg: AYBFou0ByynmhZjOoLXh8dtejNC+GXppGBM6sIJCvNrca6iJVBZgu6s/k3Q9f3k9drQ
	XgeXr+Yg9VO9b/hZ7azTlW0u3o2MA1wqdmPyRmEmD4ukwcWakIHz88IJCelsQIm+MKlyV2vbrS0
	KDQ//0fiiv5HiYKsQ0TOBcDESvScycbPNw1kEHcEpuDE+CZ6ZZvnuvetLQt8lPQuQCq9msXN0xt
	59hA3mmGF2yIeHQFUi0EL00mJMImMTi1lJHhgzHd75e/5nMXa7NK4xDBdSV9hWyUPVL32RTwzgt
	pmEU9e4C65VrIYxIZRytE/BqRHG7MrI+iLgrG0iSKBtwgvuQZmevz8Zk5EcEcubd3dMI2vqopWv
	Ms33VfzQau90F9+Zlc9NYWN+Dyu/xTJbCAbNDu9sPKZDo3yYoK84kEgTdn4/QXbmccRdd6WJh7P
	vYsg==
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691247137.37.1794584829258;
        Fri, 13 Nov 2026 07:47:09 -0800 (PST)
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691221137.37.1794584828711;
        Fri, 13 Nov 2026 07:47:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:01 +0100
Subject: [PATCH v2 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261113-fwnode-for-each-prop-v2-1-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m4NpZDP9wCk6X2lLRZntvYOO4JCGmA1kZu5D+y8yR/o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD34fNGOw3Us6Spsa8wQXUoWktbw9LNMm6id
 xSi/+Q9T62JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w4MUEACv2DIA4WBHencGWJ8xeH2XgSLKF7rWa1HACKBslDnGDYzgFtvP+WP0BINXGHsfU9nEWv2
 R0Zm5zbET8Gud9t2ocSRdp2QCz5PYjYlIyW0exI9eU6MQkoyCiNwN3PqBtAAeuQYsozHdBLGZiM
 DJXl8D2TQ4ZCFALyp4kaXFiFCY9CsM2DBK2FYee8jDAlx6slky2/X1htkINXkjpJhfpzrm5UIm5
 Hxzp1Wqr1jMO4g8ioJSpMqufUAeeyY/lFruejpTFY/HZtzc2jGoCVUMN4qf8hbuRGux+Q4GjO2/
 7E5wjbT/k1oSyCFHIYLZnNjdqSJ6xD7X2GOB1rE87UEqPdNY+si1LIjCgKT6WMTwJv6kP23Qnne
 2hLkvRYovnawknJkWeuffSgA+ZqI+FIYin9iG6P4ik7sHTUjsrIeNNmnbgELRdTbXQ5GmsAPDuc
 ROpFolb5danon5vtph7Z5zqjvc4ZJ27Qbifn0GTweLFQtiUDImuojNNiDaXTLLRcbQe6I5SAoNa
 gCSF69hau+bYvtD+vgR9qZVpo51TFSpCKyJYNJ8FYD++1VQGvW2v2yL4nFR822R8NOD3n1hjFtg
 cUZPDoLO6nxfU60mWZJvYgLDArvSgi8rkk/yu38ZYS5DdSNmCxcM/Fq7jv7wMlHdm5w0uTqK4Zv
 Cn/CsMAdImuO2kg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: RduBLv1QBh_M7TLbMP7mA6OwVjeyfXoD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX8dGd6dPqbLFR
 VrJisPLxoE0SAx/foEJl/Yv3brCol3Woos38scx+SI6tFNBWKf3mBCbHzCf7nxhTQ4dzOqZXoqM
 I4NjTUWmXPvjmVMLrxxFwbT63GCk1DJ1eDogS0Ri7TnRtvRZJ28ugyucv5ayHLnkVTQ1B53k/Al
 wz5ZuNnEaKCdqySqD8Hq3Lpt/3SP4HYFsOzkD+D2wNPK31KTjeai3P/HX39rPI0wrzp2HFTrDA6
 FtZpxdIXXgWmZmtI/ZWQEDT53aXn8eKl+rBrQy8QTN8BcXN0/EgmqHA0KITYZXi0autCsGmUbpK
 JZ4tsSh3l7gIBigShWo+uAEB7X8frDht85ROxgQ6vGWtTHirWYK20C2KTw7R6GlifMIkP6IX70l
 JBR+Vi1XXwez46skIhx0/h9EBt9LFm7HioVIHbaOwOXgkiQxUkH/gh+lebCmEyQyNXMCoMvJwxV
 q21U38WbxleQPAzTqzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX5htfpnh+NIt1
 6kdlJvn0rZls3ZOGMj38i9RaklGY9Kp0glBno5uck/KYUahfKGAUOhkHJRdwU5PcCn6F8dArvoW
 cMfNJkBsDvbVGVzmF3wbf8I6t3KCZ1Y=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af730fe cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: RduBLv1QBh_M7TLbMP7mA6OwVjeyfXoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

