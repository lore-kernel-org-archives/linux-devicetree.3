Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178818;
	b=V4RTwpwhvGifWD0yFczJFLX+YNKaN0s8BiR6z3XWGlkDTfqKmwlZegY8AmU1JAR8CvJD
	 +ot9E6v9g6xpxImIG8m09z3LQxr1GgjVPyhp6p3fjlqTtTWSqQpf3DapfUCl2GLkT/jzx
	 uLMmDqD3gz2Q9ze/UdCZAo2lS431BjxUlbhBRu1p1pWO9G87ONMvuiLor5RpMnLtIcuo0
	 fZLq2CkXjWkI0eNnCihUgWP47WegX2KNiuLSX3e7TJxbYmax8OjYHEkSsl81/tSkfg8FT
	 iH8PB4sIoFkdujdNsEWLsoIPERVyI3rJRjPGcmQR0b3/CvplU+npMIu5hWVTXctEz7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=YgVymKysUm5LkUTHU7Zl0vpM4Zp/dPa4AB30CRZm76m6A6iNvmaviYXAyfrEePE2hJwB
	 jcMHTA/h6ldQjogk2bKhpnyiGFkUqSnuOtMWmlkS93EuhKNw+uwF4PYDHw3Yde0OOIY1j
	 s55hpO9BK7dcZvn7w1iHqzTu/9WggZGy3weuvMXEDp+fOOvSpSCOeiQRhA/3TZiYnzEtt
	 MtItj7rb3woHB2YBGXj9TpBenygFoLQO7ZhC4yodD5lQZkrFZM1Uo+KpJomluOvR0nWfQ
	 eumhwRV7qpHYyVddN1SGftgu8LVAeLa4fotjRXpywciAI/yWpb2hgH+ynFVFiAN/feA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fN8sYdq+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B10606A334
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B10606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fN8sYdq+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkf9L3107595
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=OL7mQEHYCSQc+cj3
	MZmSyugOTRomMWlrOXLRTXLiwpIxJDgG/m7xi4pfX7AnWWlTSLYM+oLaQLDqZvAz
	j4yfa8Z/zA619xCf2Pk6aHff9oCsH1NN8zOOuqOSsR7xjMk7/8XFA7Uunl8n9oWD
	C+QCD6TQ835NRVubbiiE3sDruxE0ENoF8reK0pwiR3R2+9Zy8h7wzK9qXiDIxKoy
	zrEwv+/In7+AY6UeVDEY/2xiGRHaVZioqOBqn9JB9ELncCBjS/V4seeTnAbYvy89
	VVDZCWkTMhHODFhx5sC6jPH2KJDq3fICfE1sFC3QfTNyjyJzrb42MVAVXY805RxC
	92lkrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3rat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so232890085a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178816; x=1795783616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=fN8sYdq+EKflVYz0UK7UfzO9F/QWxGcXj72hVKgD8S00jtQ3Mmz9PurVsthbNiKri6
         iGe6WdiOiD6UQdLCPEGXhejvubNbHYzY4r2vZb8W02tIAQp1F48P7W4Q1fXBtwLfMyyC
         /cBMSe3DpncOgp3BZjD/FbvUq82iqt77LG4w6dM+6+UnCxyXYHTd5oaa17LaNymUMTCs
         wjoGNeY0WS0SfrPPhpRTokpaeQ9GnswVzlx+nKbw/ULlam8ocZXmTe0CcR++yFOjtecE
         ODlmWUbN6rpD4lArqxxegzAYKPpaj4m3xX89B+aItZPFsxkDMJmN2KORWANR7Sd/gpTe
         2A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178816; x=1795783616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=kK7/hVsG4qDk83vvucfKuyeBCtRJ+Gpdi1OpFTQeHBJfJKroiEL9MXMtbFmvZq60yW
         /cVhGK3IGvceWzEPA+rnJfzDw2QaTA9ClTmb+8xicpjNapb17o8OS1EPrgbgVavUwaoF
         AI5d6Jw6W8Gy6QxJ/TYjZ9JDMHOWyZsM8ABNEDJ2RhoEkcmiUYFyxLhILnxj820oRrwA
         t8iOIA6FeDDIOxng9nGuNz7jHS5+ZD+Vd2HaqUphtj2W+ou3rWVE8V7eWsrntXTWKwFZ
         LrAG0tBxbKYxHMCAEm12HuojjtoKxugQsHGHxGEHZ7Qtc3Y10rw90zitPw7uxOjDHarH
         3ihA==
X-Forwarded-Encrypted: i=1; AL+hErEMicNhoRyVWu0+CK/2WHTWNKxVS83XELp3EFwG9TLPWFmJE9TpiGNk1zkDlUUZ9TSZs/4Zl+NJoz3j@vger.kernel.org
X-Gm-Message-State: APuU4Z9MuEpBdmNVD6Wje8iWwGESoeVnuZ5unItWPgaQZwdqom6a5ZvN
	SrA3e4Ddffg8poHLp0Ki7bj0xgDZgSVyWXZ9gLEMzGt+KU81/bTCgDH6oRINISmJ+tzx2/lERxW
	5erDWVWBu/C/YAZkUKjWgRpR+R29J5o8/60tLHibRTpMKJpx39O4zKF1rln9CXvxb
X-Gm-Gg: AYBFou3PlcJhz5n3s8nE4RJ0LeBWki1phVweuX93ZWp5fmQFapvHgbfq9EBqeXHMHtF
	9tn6kS2y2LCJw/54WToBZlWWGD8qD5mMMlwleNvv5REpEarFvt551bIHyqYorIgK0TB/+ITWxNh
	JMvySLqYZ90pZ1bc8ksDXhAi9DVII5++r34V/hRAi1ScMcJ2+YiiI5fJcWh0OnYpJBJ9bHDolEs
	Sgsr4CMiO/nSVmLF6ghQjsAqKCQrrhFe/86ogPgA7PGkXo6r48pN+lIlL9hXxVlZJ4Nsu79b88G
	saWKYmnp7NxRp1OobeQbW4qfZODUuy9y6BBs05QnS6emazI1uWrzPCCdB7DSC48ngkP0723ktEs
	MdjKZ3WKUEJCDizcS99X7nU0GBK3nRkw4eqrB4w6gstdDSoxvGrTP9L8v8yq2T7rgpyIJjk1igm
	4=
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464267685a.30.1795178816332;
        Fri, 20 Nov 2026 04:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464265285a.30.1795178815926;
        Fri, 20 Nov 2026 04:46:55 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:39 +0100
Subject: [PATCH v3 02/10] lib: string_helpers: implement a CLASS() for
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
Message-Id: <20261120-fwnode-for-each-prop-v3-2-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgjwkDVUHWhy6uin4cUa0Wd2V5XuhJ8xnn7npsp7KAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2jLXmZl1uQUBpEf+eKw/T3UBW/o8UeMEbm
 +gQPCy9bhCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w6OaEACp2HMa3L5w/tLsNIekUn6RV5BW14T495b4IkQjhG9/ndutwkWQh8k7Rk+kY8zCzHvUpY/
 I7kDBzNwwAbAaBNTpYUI2PHBTLTM5NxV/844KBjNOzxvdZib+uxEvQfVpb1z4COHby0Ps4GVQ6V
 qo9cCpLSdcK4x+eTOMDrdsUaLphAdS59/wpD2hdOq4wB3IG227nQOGq8yPhk1vyZ5Y+5QDYy+n9
 Ww8fY3dO6oB7iw299+WB9Uf7WZLuxGdmHYawNxGJBCankEqZB6mm6Pg+7TV5iWPxwP1aYXoAMJi
 MXpThnPqR649IK7QcXRNUYuw6PiIMjc02SJ6KvC8UdhsppqFvMwxjvt52+hjFRWIUC11NzGLln6
 YmzwEEUBhcwSAN4YQCjRhZeGs8Pmu0MwY1Oj269YCXhCMTNSZ/4bEU9uUVXXWAPBAAhFSsrPP8y
 dTbqURJ9+Y1c4cy8JvwQVDm4P6Pb0tN1QBSgnbIZLiFNJQ0ueotPvAGLiSwwe5wb3ojn5oAMu57
 8cj5qte0LROY6R/2pWim0uiI17A/m4pERPD7VtHgmUDbxJx5E7x1HuT1i4ajcaq5rLyF4/uEXnX
 t+7cb3wTQUvva43F8nb+7gz+jraQSNDhscRkDj1Tk1rEUGgn1O1voxd9k6uTTiqqKt3Qru9aXbD
 LBGS8/MxI5yk/IQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX3aj4ojdsse6u
 KyRxVkkMbLGu+6vmtG3EQebCwMr419A8gVKAQ15XO6IDtjMb0mgEVEyfpnOmLi0LJQiKGNuR7/m
 16Snw/J94qKxPX9GI0RPjswRs/2APhV2Vb88wURUVKTaH/pFiGqg4rY7e3xQ5kZkuIDnzzttVWd
 Q+MiMfYkvZUKpAOuMDFOz2dnDJjw8ssAaGuwBo12RjGAiE7I3zsnAtvguhPU2910j6eO1uI1Mwk
 MmEuHzpIE6vcE2j4Zaf+nCD2rD5aHSr/xwX+c/Qvp29vduNlUiXVnM9NYspH6qERHUwUK/CKprU
 8BMA4511J70G0S1LN8N4kk7X9VUfZdkw8ftgvZUX15rWGJuZR/c8Q1+zXo5bwRYZs8OCzEpN5Xl
 AF02j0hcsP8G3lWiA6YCnsIkA03139KFaWlbYVZh8GCYvosaL0Na1gmeseLcGWNOmK24F2Sso+j
 Se3t31F5Nn15PnLR4iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX19y/bofTuMYl
 3IGjRDV/Uj1bOay3QCTCJX2pKh5dpMpW328eEvty+Ej5an0FEuMSfPO/5hT7QRhfeHr01SCafXp
 Q0nqXakk8V/g0homkUiVwnCmHa0P63o=
X-Proofpoint-ORIG-GUID: VT0AI3dLVM8ZBtCj2Jq8cTcgmuDUx7Ly
X-Proofpoint-GUID: VT0AI3dLVM8ZBtCj2Jq8cTcgmuDUx7Ly
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004141 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

