Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685791;
	b=tnyfsUNEv79F1yQ2JOS9SlEq+jY9/xQvGYn+XKyK01YY4HrTLFgi6DxqFzR9EavylM+H
	 RhsQY/ZnrBr4L7DiQXBSw+6voreRAdJt/QHlTMNQbnw7lu0W5x6GXYCAWisOUAet8OG0A
	 ZS1ZPn3hohuSCRj/lMdR1MFZl1tXsXyoQwrplqR5n5w5kmG7Jl+VmmZ1IgIyhfGBcyXRJ
	 jOwuizRGqxVRXHna1vvjxHZLFC2WBaaKwaAplK0RODAg8Bg6Qkhi/lvSEpdhYWhKc+Rk0
	 TREbwNl9gkWHY/GMzJR1c4QHVfjI57ce1MpEbuTig5+umJ8jxQcHswF4+Qx1BK0+bOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=F2ML+CZvJk9Oa2KQra+ekMT26ZBTM6183miQ0QfA3vs/SnOPuNI45zg4cK/NZCAangYf
	 VXK4yMPi+lp+zQxszsesSXNmn1Vf3S6+1wBpOEd7euEi+yyh2fzuEWHqvFFHsLQVBvhNa
	 Nx3cqP/FjrwXDuGLt/4PLL4Ddz1KG28X6Gkwaf+2QXU0Ol+iqvm4cBJ40DHovqqNQ106d
	 z8p6nyp9PGhQJUtH81LORWZZcRHnpR/O2XtHWXAaU8iwhv67U7dmWPOV6EWbx4UWnuOtZ
	 pdvhOXOudI+VVn6F2TF12zgIvjUlLzeQp2Rz/WPJi13G7EtHX1GNNCkE50U14Rkx9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMZDCdq8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A035606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A035606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMZDCdq8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4ax2175797
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=HvTU+1Lr0+TayoIV
	jjYxb6eyo99o+UgT/AVaicpY6fcDbW1BMaAX0d223RgCG3hu7zG9AVl6pJuaUzfy
	Eks6iYYvykbAa2pKrAnT6sHg4oGwjRknvKzaDP8pNRX1tuNpAFRhcbcWwkBU6m5/
	wbncP+VOqEGGJcwgS7ZZFH6WAa401chJSCR/I4qf1TDjTT4xmNYPjFoVTAxnCyoX
	k3iAh1KQl0yjEWlKbBQpp75dMJQin2AIa3TVJv7H14t3+3icXGyUAEGtcSJm0pSX
	kQ0WWtPX+r+owfwkZwxH/uyHiZtARvdH8Trx+pPCSIzMCaa7KXk56rJEYFFgbXRl
	mixz2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahut09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:36:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso340645585a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685789; x=1796290589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=VMZDCdq8Jhiau+uf9VcKBg0uuapDL6IcC5y2d0p2II1nT0Lg1xcZwHL+Oe7E9++3Rx
         A1chdFopN+I0gOs1gbN20WdsHbR8Eu1IMmyrrZeH/IU925FxO4dMIYI9Z0bbqw6mAcCM
         EavIEhbs0qF5KgR0DuBdWxa+RWyJ7AQBcEF7MBHsG/rT6BTVV1w8p2s2COzSrOAFRLnd
         +rVMEnbgEiSRPbEyGwlEa0oR92ExmtXk8fABR64ZS2lidV4h0aB9hfWdKokQIvfi7ON2
         qzr9o7AubfEg/ndAqMf6p2M0BDs+D1wGjSQIM/xkEfQl5z8k8m6Mhi2WD9ZUlTo54ykT
         lpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685789; x=1796290589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=Gc+8THTr48cINzHkv3NOFUZ88K2xKnFo5b81l2xo2A766DESzeb6NhT2NMq5Dbttws
         TmAfEKN1pEvS0WYysGoPPspRsmrg/88Q6hm6L8DXlIxklpGYt/JhOXqaQQMhbSdGiPZs
         Wp4HSVHVdIABatUuLRAQULeHMNQAwW4Na6Wh+vEzxmrfed7fv+YN/GBxI48I8Ggih3yu
         VBHP+bCMEPJV6Pu+oqlfwHMRNFoUMm0PTj49DVbEUsoHNupXdHmmWw35sPU6Pc79tUv1
         AdcbWnmB5ZgaJBa1fZpNn2XFfhK6eMtsVHoLRcjLHT4qyPFZ4jhULvVHgrlET6lAck16
         TUBQ==
X-Forwarded-Encrypted: i=1; AL+hErEjXZ+hop1JDdT9jyN7Gp2gw9NCc5Ft5uY9H0AjZ6aAaOQSKYS3fJ3KxvVdepYfPj6Z6fitrKU6iMJ+@vger.kernel.org
X-Gm-Message-State: APuU4Z+5MxmjSDUiBa2y9k2E7kTgdpXNx9e6wyKPysmloB2wgPB4lL5M
	fxeFH0iLDiZ4n4/qmvrevQn9DieEwrVhGnXaVm8XDntvS12Hlxb13Zp4KG/6nZXic9mYS1VVYa4
	HQ5w8myTlb1W/YOCsH3orFi9p4Ky3Uh/B7MIMhxdHFAtHjZCa9UgE9gcpxNPV1jx2
X-Gm-Gg: AZFdTZfflWy7iqx0vhvs5wMacvYDgjx1QM3qAjegMVrxPaeIRbY957k0fhYs7DYwKMO
	NkbxTythOKNOaqDJa/u3n5r1AtBhDDQ99/igAHnuOKdepnTaQ2D/j/8IuBlOkh8tKYEtKEWlkb/
	UU69TZsHRrwYmniNWl1jHEDiqC4MarmMbi5XakpDS1CAHRSkVfVve+sDoS8pMiITVDnPypVQQfX
	6UOSj9r7CAemR9zWJ0DTih9MATeKM20d8uNbnOtMaCr+2g2DMbcg3lU+2/Vskl6EvhVtEiSm0vU
	gvGrZpJt5LEWJjWcbCDLz4475h3VJCO6X/UlSriNZSVhRoM/qkOspqSM9j0qvHr8bS+hBcpRLX+
	qW2++qCnmyoct6oztpmH3JI7YhshvMo6ZcXgZ+4fInizs6tlKhsQSGGoOYXDsyCdrdHfn/m8fL3
	d7Ew==
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832613785a.43.1795685788873;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832608285a.43.1795685788429;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:19 +0100
Subject: [PATCH v4 02/10] lib: string_helpers: implement a CLASS() for
 string arrays
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
Message-Id: <20261126-fwnode-for-each-prop-v4-2-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgjwkDVUHWhy6uin4cUa0Wd2V5XuhJ8xnn7npsp7KAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UmlNPXMYUFj1OkyjJlNtUg+TUKM1XF8Nu7
 d7XYDXF1R2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w8xCD/9IYhGx3cvDc9WQWKHuSblgrzMbds4fs/OJHOvppEcKmijm7eXlATdeZIwTvT3isiBUj4X
 vMkHZeEcEb3x5E6sPII4oL2sLrwLi6Sc0G687C90sYbHjuaF/cvPNwQ34R53OhVsSusUhpn8UHL
 ba9XnX808PqRAwtsHkPJei/FdYKzTAjyLVJTlIjXVh8ePI8zN6IjdXJRCSsPodY5I64A/swlRIx
 fpIfZWyra+oHPh/oY6PilA0cVcLLOLrKe/pvRKp6RxQaCenoPI3s+HYRsODp8vMD+YFabDJRoBF
 Ttfb9xQb8DiNf6sW9Vs6Hz4vwtoINt/h2jzIRwaRntNqP9wbgGcgdDZCMqoSXfX8XPLJ0eY401A
 SlgEgNSWLenIYKcrGhH25okc+JMMYO3oJ55c6yKNT4XbAxUTpMzsB7obKMj/c3dWzHJnQ9QoJ7h
 pqZ2qtHyWZ92+t7QLHW8TqRS7pvmu7vuvBeAJOSI4K3CkAzlm5XUE6Y6NOs72ti+GUvdN9Kj0KD
 DMwOqA0PUUR/Rz379B1UlFOzYoGhxCGxC7Kkwy90FcAsR9whZuHVEf6/oVrPLf6K244LKS7AlzP
 AC6jyUhZAuwrmwu0In9diKO6B6mIe7ozf7LbBcG5/Cl8f9QkcSYK6xla6At0MSFKKhgCB7waqvE
 xLx5I9axDKDlkjw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 2fzHOUdSqjnqcVfxHXmQMojdaMNOn-s1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX3syHnGglCOST
 pKqM0HEjH8ze1kS6k9KVfYRHwevnuFfKtnEhLz7mg3g+Kq3hbJSCA4IaHu/+N9QzrA96JNhefa5
 QKCC6ZOrikFCRbSaPQ2cuWhwxz+b77w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX9+NSIGtKkPKr
 Z0A5XJFrw+IsTOoU+zrF+ys6dQadWyB14wGgpCXXtqNwZ5Yu/075jYx3ZvRPs1AtwHCLkwR25jM
 slxATGYriwUN5IoAPILgbucPNkGCXU1voh/Dwn6l46wSobx9V8mDK+OqIodROzNkgRbveQFc/Yv
 JlBV9202tka1SN4VgLvZ/F/1Id2usLX1RDwG2dicImBgd7QUiC5ue4dzU98dJI+L/z5MzqyrtWq
 vs+jNNQZ2DspqDvrMtiX1pGPgi0lSEt7oaqIPqSlfxeOJsVF4qXNeJraNvYOVqWIDKlR+P87EjV
 y6OFw/LvcsotduTsbSfPXEfWsQCD3co7TsY3xPJVVxM5IKHdtJS0tV8BJxdrDQAeAijZpJSUAhO
 kW7AlCvVSzbyAJNcte7GgUDyuMwG0flbe+oco7D0OR5pj+dRI7A5hHE8NfQ+HAz8TszpmpB2TDz
 JJbaOz+DiKukl9kcTKA==
X-Proofpoint-ORIG-GUID: 2fzHOUdSqjnqcVfxHXmQMojdaMNOn-s1
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07fd9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c9f08066439bdd33cc26e2054dbe1ba2e867aee7..4db73bc7d4623cf45954cc8794c5baff6fb23241 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -124,6 +125,12 @@ struct kstrarray {
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.n),
+	     ((struct kstrarray){ .array = array, .n = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

