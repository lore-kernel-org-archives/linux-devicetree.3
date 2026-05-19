Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3A39DBF5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184883; cv=none; b=Uc2rd7IO2fURa9XtOr4ayEc2n1tj6Htt9NDdGUxWFKJ7hIAi66/hDENzAI4PJ8G70SH/a/CXexdlF3Kf8LB5ErpDkBMloPySbZEcXb6ZpokakFuzjIgHGJEjbBd3n9gcoSGed0FeftNMSQboPTe9SR4lTNIdiX+JxEbJTJp6UwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184883; c=relaxed/simple;
	bh=lWVTpz/kqKcY4/UPeWm0qkYby9NGoWOGYeSZguwOyIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1xMDfOFbrZRQWc+8PdcPwvlUPJUU8Qn82vSwF79E1feJZ5EAk6rCEEOWoXkAEITTz8XrMGOLLe0MQM/4G3cIfnf8bNj7ViyO2Zl5f+E8G/XG1KYFVtusxDj9HPoIg7fa2HUMSMcptCPporHQUhntM6UfeWjPvtLcTWq+r/2nnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhxY9+z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9wx59dk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhxY9+z3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9wx59dk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5aHC9867200
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qwsco92XKy/
	c8TjFQLr3JV1bIXoXKOJTtm1UZjJY3mA=; b=RhxY9+z3lf1xiVJE1uNuPG60l1N
	FDjDMUPn7ler7sFOv2MQ02kQr5dOXBsaBQq9jVGbp46KbxxY4XXYzf6OUF+inm0h
	pl6sq8n8A1I7H1noFV69jL62OE/2V12N55V+TeGeYzu5sDQm4KLDkL091aXCFkdK
	MufN7J2g+ucOXpoRiLu/NyDd5SvwWU0vmGud8qNuBNwtkccCunCrpowXmaCqqkJY
	jM5TdX9lm532CWTbfB11HT1WQs9xWroRzCFi2TN9UEpLz12tM9lr+bncD7p/zC8I
	5bxJiYkOMUzGtuz9TRX3pIzV8anUlCCge+vLU/6y/bEW+TRwA6EzaCHe/wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1h4u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:01:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so78873171cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779184881; x=1779789681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qwsco92XKy/c8TjFQLr3JV1bIXoXKOJTtm1UZjJY3mA=;
        b=j9wx59dk0Mt/1klXpkfH0rlhUhuKIIDMllLbPUQjYt1pnIBO2B5fLMlPiow8D+awCG
         do1TyIwudF5m3quAOfdSvDEo7v+4/HBHnGaO6DLLPl22b3FJNVUP2q4yqAVHY5fVNPLi
         /QObewUsThkWzeH1xPj/Es4WXqMLuE0HRtQfkQZoZBJZsVjva6ZvgD0eCjqrYoKif5iX
         qS9JeW/NdWvanCrnedWzKrB5CIQB9UVBinXbVCgpS7aPVdAkw2FDFaK5bt7qDN7t6JLx
         2iMN7lzB5ZaGTv0OFcqTHDiPpDaokUnR7VF3hzMpVxlJzIOmmLNe/LO9rIR5hAdf3rFe
         WCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184881; x=1779789681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qwsco92XKy/c8TjFQLr3JV1bIXoXKOJTtm1UZjJY3mA=;
        b=kSHfbNvVlZBB1gjrSpu2+wo5NNKzhzDjnN9dWQOCuuIfxDTmsZkLx7uQ+NcXtA+O4m
         5azlDdKcrYoLrllsSGSywpqyQsHAHsWZqHutM+2/oL246E9XA2jrlf23S/o/5vNpaMj1
         1sMtY/vz6R1hhJ6vjkjWYX3wzwRHohDNr4bursOOo4sS5tQ46eCOaROgIqNs4sSyQmcO
         5BmC/A3vOuqjjZiqLd2fjB21K63vjUdVJMejUC/iuuMUAwPAD76+D1+tTqboLXHJdJWu
         LkQl9lo9w18QP6CIaktw7tG5LLBU6THzMmuAqHOO7MO/2RJMblVvkzrQFsWlFSDqCa83
         MW0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IZEbsFpH9iiXrWRq6svcuYapBInMvQYoCxfrKDJ3FuZgxuFpYXJEHt4C+7AAag3poYBHVDsOBrVvu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6w2wnQ111kUTFgTT4YXwqo5pzhWt2yUjV98BN/pc5hYqoLXPp
	/fOh1U48WIiyTySJVvBJXvow7HZV39lwxj6xEAmqD1Rbijl8G4vZkCtdH5XRMkuKBY6K1JH+EB2
	Jb/IxoV5KwbrhleRqRKTkjb6ZrxjcC1Z81ueA8nksXcf1dj16Z29188gYZw9PP8qM
X-Gm-Gg: Acq92OGPm7Rp9VDTJbxI6TUN1qerOFQYYJYNk9h2Z1nhxiSty+vnaG3j/VaH+hjT69/
	j+SicNNtJflPObLLi575f7QnZyHkBX7FmBf4EL8Dr4XZoLsX7bpWv1HkXLe7EtgGxyzZoColWoC
	WewChl543jYPszx1EtXioY1m7+Q3dy3KiJzEGv/S3/qvFzHWmZKWCFjlKKgARRADHUGiR+SdaBS
	ERpn51ct9Ry4M3QTt3fZ6/9jEjcmBGBJOBYDDIlIEmtVvS0o9N4CJpk/1z5pdx3MH1o0ia8NTLd
	iEu2TN87rlETYlXiNN2AblY9lewbyKoCCVXKrh2uStXNDTulSLsVaaFWQpQVOuuyAPq0qBIsReg
	x4jCFv9mv/PutWbUciEBeeHx9Y2XlxPUT0and
X-Received: by 2002:ac8:5a53:0:b0:516:5019:d28a with SMTP id d75a77b69052e-5165a2037a1mr266075171cf.44.1779184845733;
        Tue, 19 May 2026 03:00:45 -0700 (PDT)
X-Received: by 2002:ac8:5a53:0:b0:516:5019:d28a with SMTP id d75a77b69052e-5165a2037a1mr266043091cf.44.1779184829684;
        Tue, 19 May 2026 03:00:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm44266388f8f.37.2026.05.19.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header includes
Date: Tue, 19 May 2026 12:00:16 +0200
Message-ID: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lWVTpz/kqKcY4/UPeWm0qkYby9NGoWOGYeSZguwOyIw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDDSvRj3rDpkI2MQFwfKt1ibfRNW7VtgVnFnbt
 nO4IBOi+mGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagw0rwAKCRDBN2bmhouD
 1850EACL7wIJGpPaaqpUhNUT+WuK9Y/IW5sHfdEGyaqznwt6caAtiglmgQGbhfX860Blu5Z6UMd
 u9SsnCzdhKto1L8R+lS/qWpRlTpXPbo88LT0k0nQ6Q1+k/jWSHrUPP9qn/hF5knsX6BObtkwhNm
 bLia0t0lI3LsZ2t9TlrC1hXQLbFsAN7Pvfnl0q3NpZZA71aAvZ6uJd07YI7jpUGyuwRKCbS5ytX
 jBjtCITxSTzxWP1gt9Fx184pMXn7lR+ca7hWk2heAV/bxN9PT6m80qqw30+YkVqxM+lxf+GDeve
 o/0SpY43IuMh/L1EWzsrqR+D7kxrLQkxVdgH+IGq+e5SFNavBj1oFCkLuNFhDXpeF8gA1XNSjk4
 SWZxzibXwpzfr0N9yCV/EXKaI/rsBWE3gFQwiwW+JIiaX7CWJb/IHskCuQDIVYGBA7/dZEPXrBo
 ma5YPayq32E+9cQltvyAP1h8ofOnsiGIfUMg4XDzBpOb+cRyamb3eP85E+1AFvZop8Y3ICf853Y
 Xa1/mUs+p1PwF07xk2uAtzmx0N86oUfI96SWsVdfgLIfnxzu+kQ/cqqOG6gRG0msq4M7GqJ0C2p
 mQ1RM96ZfYJn5J5kWgj7Q5W8i6soTX9zUcL3wSM792QWyqxtRjudX1pjMyAYEzsBCifQd5hTWTv DRZrD4BwKeq3OzQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5OSBTYWx0ZWRfX1AQ+E8BmO435
 yJWWTF6w8uepiBsRuQRUL8uJz7QJp8KRLcnMR0PX1OWOeRPl4Ur5LlAFVR5F3eiQ0XK3mYPqvcN
 wt5zt92DmVuy47v8Yh0EyevVGqjVeAAf+WD/H8JKw/lwdrrJSVUefjxbfsQMIKUcCbNxm1zm2AQ
 0/CHcOCyh5yuOsC4rf3CJVu3E10/+nnv9olnYlhvvKB/O8j/gUQugNzVlY4Ad4OBeXzOoI7YiBX
 YvZXN6R4KG+Y/f73WHY5K3AdJX2JBKtG7uYno9kdAiodkHzCMkjFjrz3r4KVYhEn5rhnohUyAuJ
 JJq3XHsLzD6LJAs6viekUyb6H6T1YGb6km/rNdvK//4W84PqjxQ3HY8uYmCz6ZkQbQaNEES6P6j
 AiVxWfrS/aEXDnNZc225y1vxqfDDOcbFskPrLXY/Sg/73TqCyj+0qh7d0JMeVEn7WtEBhr1nYwn
 DrcLgJUoq6GZiMYrCBQ==
X-Proofpoint-GUID: A3pZU0P1bc2yOzBaf2ZBPWnuN5Gnio9h
X-Proofpoint-ORIG-GUID: A3pZU0P1bc2yOzBaf2ZBPWnuN5Gnio9h
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c34f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OFmlXADJgatc2Wn79boA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190099

Unlike other units in this module, this one does not request interrupts
or regulator supplies.  It does not use OF graph, USB role switching or
TypeC muxing APIs.  Drop redundant header includes to speed up
preprocessor.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 3766790c1548..35320f89dad2 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -4,19 +4,14 @@
  */
 
 #include <linux/err.h>
-#include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <linux/usb/role.h>
 #include <linux/usb/tcpm.h>
-#include <linux/usb/typec_mux.h>
 
 #include <drm/bridge/aux-bridge.h>
 
-- 
2.51.0

