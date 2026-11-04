Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801057;
	b=Rmy3AjQuUSxwg5oqwPRTYMXBhM93G747yvV0IBrDf9t+zStaUViytIudOdIVzZXJO04k
	 IL6S6+zWENa0m+WExaffQbcKmb8Zh8KiSXpBZUoPFu1OUsm8b1AhKCHXod8G4n+KIYNbU
	 DpMxawZTCi431TYH03RgoKNl3m7QoJO6yF5lZI9+UNFKcLU4pbLw1LJv8w/jUYIO+L4fW
	 ncBPsYUqr3Y8PuqCMK6HeM6n3srfnBBtaV9eKnGrciXGuOr6u37bzJ+SLX0d2j8hBsRlE
	 nqy5sGBPNCgq4kmsqfuTRaFgJDeC2tBVxnk50y+jP9FZ77vV1owYPo0roe0Pl72Y4Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
	b=ixImCYEUTHFHGUSTACetSjBvg/40FoMyuzvOxQ1xEMUEUSwKEThAVv1gxcAwXeoTeo5o
	 EchXSjNV+EW7TopEqTyAyYnbSuhY7AUmA0dTpaQUxDAxgM5CulHebKsZBBNr3/oUX0z+2
	 ofBoxlchBwFdGaCPDNFaeEFevrUC1n8ulFmHxMhB+gIB4FYqLW808eYhPa11P2tpSbBjg
	 ORyR+zcspoyXWBYu6LymhvfJg3JMR1AY4OVK4sqC2glnCc5+3sCOCsoY4zJ+ARPO5EKd+
	 GNOGtfFZXt21r/qvJ0bNdmMFqlLsaG2xJWByFjooJPYEnaVYHXDOqUlcL3/FhVtSdbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW7tXMvC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJs4qf8C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103A606A337
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D103A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW7tXMvC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJs4qf8C
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba1OC2667852
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=; b=hW7tXMvCQpuSSKtN
	ZFd63aatRREqxNb/XXFLE6kATLNEDiKcpvjMvAjmx39RMsGxDeRD5HsnP5epFx8i
	C7VX5AhR/CS7+Kz+Hc8bHQYjGtRDRzcKW0AJMtomtI04C6denBUTQlrW+cOE61g3
	wcFoo+1OtUxgc/Axpl6QascgzF2dWBsFgQCota6CxqKob/Xfr3m5lC3OG7Nzrq8X
	shy8CFc6gBQWyiQCU/8XeClybsI7Vc4YNFyP1eWoxBFkS7sfb7Abq7mUlfTd66lr
	j0MZJpxFrVVyvYsF5pOhzRxflj+eWAlkT4oLT0C/uLmh68Re2kCZr6Ma65mnPw4U
	ez8wLw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmedx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec3e1921ecso606985e0c.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801055; x=1794405855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
        b=OJs4qf8C2UkhuuP7ZEbLVGpACKHKALOZhpMwx3Vyb1zRw2SkWVVIbzt7LfurMIJqb8
         IraYE5wPHd8K+DPdAAtovzrEoE53gLn7tWRSFrzITPewgAsV00P4wZCrTBiFNhAu99Cj
         IXM/0gWCVMSFie8fktM8l0pya1GHagLk4ktvx3G4eoqR8e/sXqbEtsy3rbWIkAPLYYjV
         8p++aQoITlIM+U/5mUiBLHIooBeBvvRyI8GfN81vFaCSQOYI9wEd1eOvQ1AoSxwl4ZDv
         TfRKsdDfNBDRmIFt4UhkeW+H5e7uCQ5A3pNmB9Xvw3w3A71UNc8E4fBroRw4002uPIe3
         3XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801055; x=1794405855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
        b=kOf0yQuPYd+/V8DM8T0duESYhrHASaMoHHKREH3x8oi/dROqvNdKOU1Gs47WA4wMwq
         EWGCL1CaG4ljeAjjKyo30JsCYICb6yCQ2m6+y175oBwbTRk9AsyB1HFL2jOjj/nw6Uo5
         ckdw7CjuBg9pWTlIZJl8yoBPPV05DVXjG8blTKVODzrMZdq3I5i46iAHNHA7Q+lAnALs
         BPd7A6gClDnrcwcpW30MXBhIH412l6IEf+d8NqB/Gh7TRl+jqhYO9ZDOZpW5L/ROhmLz
         DOgkW8QvioBB3XlP5cvzNp/GgEaDPIpI5fwFF//yNbtf8gPg1W+RcREaiGKDAmvdNI+U
         JEmQ==
X-Forwarded-Encrypted: i=1; AKwUvByrqojBFNT+WHaLBZv9UJxx3HFlC7CCH0Wqg0e59l9QXBQmRDe9DGVEg9QXrBgubtE2A4SyIJt2DcsW@vger.kernel.org
X-Gm-Message-State: APuU4Z8eaCHXylbq0PZRyDg2W0y7FxnyQCE6EoIMNgso8RrERzwc7S4J
	mh3zITVlrpKVbA398gXKW5IR+rvQtfkzQPlXPY65repvnj+AowogqA2x8egXeLkDe6uS8/pSSYv
	TZaQphlgwwzWl/3vcp7ZbSJy/irbqXRtLY+7aFbTAbJzxyvEWF78QUwlUVT19fwUK
X-Gm-Gg: AYBFou2WJvaHHnxNOZMb/fug5TGIW5iov6B37qG6lh/+IKvACyctasRLFwDS0q4cDbl
	uKPxt1C4QUZ4FKBvs4vYQ5h8GsNr1NRaawTBO53yxA2Lud4oyiO8PdSE+icvGURfFgNBNLPO0C1
	m7Fqt5hn58a+9xsnqvl1iGWpkW0fifRO2U0XrdxzOLR/1rO+sPasoknGI44cUaJq9afqs79Sk8J
	C/HN8Le6MaXoWIzgsR83R8grCDEsZOMTslcEIbyygb2CsBqRaXqFsC6En8wh7JxYRU5IWESTv83
	CPxQIQCRkLLZTKRXJVfXJRxuePQZauoxksAZvEdN/iBpLEBQhRnfVJChAknYrkS5SclyF5CoMBs
	seYPcMVcq0lcVhf3x7atPrDOICa9CcHjVDiezbgKiCSuoprzYk6Vq04gxYFUHozwoMNWm76PZLM
	zDGw==
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4305618e0c.15.1793801055058;
        Wed, 04 Nov 2026 06:04:15 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4305566e0c.15.1793801054567;
        Wed, 04 Nov 2026 06:04:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:44 +0100
Subject: [PATCH 2/9] lib: string_helpers: implement a CLASS() for string
 arrays
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
Message-Id: <20261104-fwnode-for-each-prop-v1-2-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X4m+GBtBmyDIIU2ymTvn7JPXMmdv3wdDg2SwxtGCMic=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSySWtk1BlVtDvFLGvG8VThjJrWy5dSYUhX
 +WkF61XXdeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w6+4D/4j7k8c1zrVHvsP7FPnP0L/Otl5Fq+MKofbzA4D0w0BETcvM58YVvJIHn0rRzBRYjXgFv0
 9qXudM0FtJwygIzyfZIzLte56iIzSHDvMIEkS4RdkjvSfn/EImsCZvUHuLS1FwGEHAY/L8mjvAZ
 7qADB4uj85+JnI3rgvVNZO30GttbJaZv7hUd/IgsvP4X+WqtexFh+HDOGUoca8rX+2K2RRlXDmB
 xXan6FU77l2TRtc+/356EJklrHHYMCS/bcWARKNjk9scpRFZY4j1z5ihdJBNcXdo5hZQfPu7iC2
 /92H9utwbeeMTc7+9VMLVIp5BTnmA+3t5Uy9tm1H0qA678k2SpLmAjHjIqTDEnvJcuTMZZzhECm
 3zQbX1fOX28Kk82WsaTU5j4Q8h74/YWhmpbsNgmOKrVhOoeDPKs4PqPqb168OwbQBGQ2/8cnefn
 lmQ/Hk111jcr4umGsCttNdWUsG7GaK9fzEnkisIUJAzZz1DFKUL76R/H8Ldg3V/6YsMf6Sho37w
 VJp5EAu7XJcDdQ1cyN29EDRHxXg5953KclxYnuuRSHcuJPQ7qUgmfwG1Fp8I/T1hbw5meMS7Uul
 RdJgx9RGQanZK2xKrKQ7BjUaUOAUmSHM596KQlL7gscczn/73v0KSu8d/plig2FW1xjmIPHujHp
 MVDUJD3sOPzk3cA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX2iVdvLBSCn46
 Kbg1LSY5ZFcHkqyk3MqMffuNykOp1scSad4c0i2VwkmNYd+/Jt66FmBqV47hleaoAOZe/ZQYReN
 POAsgJEZzFrFXeiTkLcI4kuY1CQd5YBKts1L7lFYlVUhUP/C0ixJ2CbSZ61K3nu+mgoX8nkI15X
 OWr5ATIYO1BypsGwhedPr9xGEjhkzF9Zyz8Q43LLpaQ2ZZQOZJswh3achoUEr+YeBnyldF+GKvA
 Urhs8lk64QmXn8TG5BsSs4k0+6BwgViTLIv5+kBq4s9pgQgqczbIYjN40fiN/EuZcFb9PCjKR6P
 8JN98rSK0EddHJntwfb5bsPPWF3HQQWa9uYK5ewCcs5aN6Cs11czznjhjvxCqEmm8V9UDPDtwFT
 CewkDitmAgbyPr1ef7A7j6SO+K3a9RnqSaztuNJQpleDjQH42N6W67WsR2uO2O1AQBNVXhO3IE2
 3KLNMs/Ec4eC/hPv+Gw==
X-Proofpoint-GUID: WePTmhXQtaj42qjHM137egHdNWuDELu3
X-Proofpoint-ORIG-GUID: WePTmhXQtaj42qjHM137egHdNWuDELu3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXyo4GE+1jpBPu
 iffUfz5KFnRC4WJZG0p8J9Ogj1jw6OvJ8JKGkBSQLErRDe4EW6O0qj/Wlny69rKQz+j6RBdxFJe
 UFiNTPUJJk3mNaGAl+8moNV5QL92u4c=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb3b60 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..3122be1359a36272190264d1c3e4c84dce785e6e 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -119,6 +120,17 @@ char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+struct kstrarray {
+	char **array;
+	size_t size;
+};
+
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.size),
+	     ((struct kstrarray){ .array = array, .size = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

