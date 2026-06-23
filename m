Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AB3D4130
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226359; cv=none; b=auwGECh/+zhcR3nHLtcV3QveCCrRo5bnhNf2Z3PQae+NoxQzQ1QXi/BBXy8CWAGfPHwQ7/3i7zNFFTLFuL78yL+iLLDExOwcxZO57nHCpNtGUBhnK3jWGS/QAmCGHB17mhGAkkZa91M1OwDLCc3grOKQ5DE165BxVkFvl+L6Daw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226359; c=relaxed/simple;
	bh=d3wRfKF28EPq+1ZOXUti8UPQystJWF5BefGu7E0Hn1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3SZbOVcd1gzXloJ4QLcM2LvIrXHkauuJZqbwDAOcxy0URDLpB4whjlAIKsyFYtXiaLgOOLk/YaTf/l/UVBgYnOfg49AMJWEDKTbHiB1rTBJcKjw+w55E8zU5+zbVqw3Eis7fckbZvAOf31V+CKkO/rtrTT5zbfn93cd5udVPBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXZGyW9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZIvvC94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXZGyW9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZIvvC94"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZMTW4017320
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1FY2EChGfq
	SXR78BU/386kT2GGSnyM0vTeoZn3970w=; b=DXZGyW9LGK4Bbq0ZYIXSXtGIeTV
	B1a93cX3A8EoZ48kiB2jGn3pwQkWsKZtiYncnYkbx6svY6FKgkAHGSsUaKf1sVGo
	jhvD7JeLrg63EOFGxFKqXY6SCfh77zPjx8wP26jEquWky51zimEZYP3lR3cVsoTf
	6lvMHnDreeC8SqDEWZ5iCNh3cHVWuUMGtAZIqjvoR25WXLlp7jBxXptb9hbhXldG
	Dg+ExgC3iK3aweBJgBWVi8lV2GPpE9aBgvmjN7lodOW9/j5OmFW7CnHDwWjQkw+S
	j9tIbu5nQlTOdUE6/dXeiCtyappMZxfO9jFzWKHp1MKpVcmOtysN/wRl0RQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjjw0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6798c46f723so3495384137.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226355; x=1782831155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1FY2EChGfqSXR78BU/386kT2GGSnyM0vTeoZn3970w=;
        b=CZIvvC94X0gxzeDhskopWhJ9Jab82lDhuKFtfc1zrSu9qeI5ZheRGDeWxX+nuBkMgW
         P9OkG22Hs0cmXbRr1EO0Of+8pmfNKgBVuYZhO0slpOuZ4UDwCn7jxuLNB901LZ4/pRsh
         4PCEkGWOvUhD2PNYJ4AOTIBriSfNVQU9Rd+zf7SnvxoQI4wQtWLc4oSb9uABY+FDjTOI
         LN2V5fKg2BpLTv1230+7Z8UCrazCSuzXtGMmfDLK736YytB5wD1om3fV43dShAKEKPmD
         zj9YIXg29Sd/HA+2XrcOnljtxI6nSityYyNBnECESmBj0El7vBpPqv5Ko1wWkvJYVTqj
         aA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226355; x=1782831155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C1FY2EChGfqSXR78BU/386kT2GGSnyM0vTeoZn3970w=;
        b=Rq3xU+Cf4XoJdH8SHLfi/xxbdFVEISjxQDkZ8Xm3k/y1VULjhhx7WH45H2lKYN6SL6
         BMFngwUM2q6TaqR9IXVqbjwvooVfHYRyTJXz5+C8awjDvrrdgUy8VCnBtFPT5kVj/2/+
         Wpqakj4bsQ6RNRhUJz4GETQ6wSb6KZv5/PV/dd0FN9ez6T/VKoYSiLoI358Obzu3jp9E
         qmK3dt3MSW9Gh/po+LcgT3ENGu9VNEuAqt7NZuKYAzB93vmFWMu9103P2P8UEHRaJC40
         ZUOTksSw4OXD2RanIFFBtK+ydnpWqjSyjb3jEdFZGmnQDKAkUe6S+pDolIYTQLpAIGXU
         x+WQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ux6zrPssl4q85mfh9Xoi2V0C1XHz0vVcVUUSzywOuFAJKmgUNUWT2ZEv5hwKMe9f/lKEi1sbqghZB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VPjBCGs2WttMuL254LVOWlQlAdJ8Vnjjsim68dFV+2Fs/aMM
	jze35MXqwph/tcr0CYMyOpyD1d1R1LetQAPg2OdOyozYxm7jIJqEsSiaosxRFIeCB7K9dIuHqWu
	g1ioo/qpvuSMJ9PiKRWBcwqheeVAd77DCruRuS+uHKs1UyCFA/Oze2qXtLS4RxBZ1
X-Gm-Gg: AfdE7cmfbEvbAchfnTPODC5ln1qXlBUNQrWp40MiJ7LLgDxJQrf+gLctSZJ0JzRGGzu
	PJ/Fm0/Oxoy2UX32mHN/kuj5rlNmRBww6DY8p95+mJJ8zcwTiCxxX7GucvxhYgjP2KVKKrh2xDn
	dBsrLxUPK385QsCi3BYvJo+dNRHfGM3LJHlr6ccVOu+5AYkPFq8QJfC89UWkTNomRJOT6KZ8lQA
	Gbndpr0A5XUh2scqH3RehWtzyFmu69i6G5OcoBrLix4J5Yti25s/0GSsb7y2Bg7/QMGLr7TSofq
	BTKz6I6g9SafgTWPifnwztrSLZgoebRrs+657UjgPRgCVWpxmKN3YbwWQHduEOKhdKaXZHR2Tv3
	zuS10/pLzT/2e6z+ZS36N/VPQFs+f38fIXZwBAO08Kb1nrtfQ3Hk/UTl3dNpQiRX/GAkiVsKUPE
	aZhql0vo3W6SQusTHqTK/Y7FLxvg==
X-Received: by 2002:a05:6102:3e09:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-72ff7195e5amr1586000137.26.1782226355382;
        Tue, 23 Jun 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-72ff7195e5amr1585976137.26.1782226354952;
        Tue, 23 Jun 2026 07:52:34 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:33 -0700 (PDT)
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
Subject: [RFC 04/12] ACPI: Add helpers for dealing with ACPI fwnode as secondary fwnode
Date: Tue, 23 Jun 2026 16:52:17 +0200
Message-ID: <20260623145225.143218-5-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX6tM8UAcD8Ts4
 sNZN4n2V3bs3Zd4n0A2uXgcsR2F+bIqbLrreFKTMEV5bit+OyZHlbQxilzIhGc4TzbqYd24S6Lu
 3YM3MT0SYtry7ZoebDzA+3s5eqcwG5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXwYSAfUoOiiAv
 xfoLYZ0lkDC2MXcX3RE8sEqfRnzpXE9EL1hy00d+SL1j6bewEbIGisC8vaB2zOJUDaDpUB0xn8P
 ggHGagh7uEajtcMCXqDVB5WN4IsQ0rFeoZ9KBcKGkbt8mCBCQZCM3H8IAyu2wv5rrEemECk3jL5
 XtGoZoJSCL0MY7JY9lT/aDM4PVA+CSwg7zerj6Lx7/Vej2beiWVuFCR73AqWo0aRsR1kQlhFi+y
 YYeytDcAhbLutHLX8z6O02erKT+AElq+GgLbGouz6jm0hwk7EVDB6o/fdQNztekZMBN6LmMCh+C
 PiFBRcwkKC64Z8Ebltyb77M0EYv2rtsqfvZ+aYh1zxJKZplKUg0Gix6R9LrxomsoE8bQKWBF9tu
 +mjvMlZ2eplNoa4L1An2Gr2D9RovTw==
X-Proofpoint-GUID: Z9OV8H-8fmwjAQKz6jb_4NWFQfXnTtFr
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a9db4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=9gDGnDraTdPISYb5DTAA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: Z9OV8H-8fmwjAQKz6jb_4NWFQfXnTtFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122

In DT-ACPI hybrid mode in some cases code calling is_acpi_device_node() or
to_acpi_device_node() may also want the secondary fwnode to be used.

DT-ACPI hybrid mode is something which subsystems / drivers should opt-in
to, so it is undesirable to make existing helpers use the secondary fwnode.

Add new is_acpi_device_node_any() and to_acpi_device_node_any() helpers
which also use the secondary fwnode.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/acpi/property.c | 13 +++++++++++++
 include/acpi/acpi_bus.h | 16 ++++++++++++++++
 include/linux/acpi.h    | 10 ++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb48..fb555e50ce83 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1775,6 +1775,19 @@ bool is_acpi_device_node(const struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL(is_acpi_device_node);
 
+/* Like is_acpi_device_node() but also check the secondary fwnode */
+bool is_acpi_device_node_any(const struct fwnode_handle *fwnode)
+{
+	if (IS_ERR_OR_NULL(fwnode))
+		return false;
+
+	if (fwnode->ops == &acpi_device_fwnode_ops)
+		return true;
+
+	return is_acpi_device_node(fwnode->secondary);
+}
+EXPORT_SYMBOL(is_acpi_device_node_any);
+
 bool is_acpi_data_node(const struct fwnode_handle *fwnode)
 {
 	return !IS_ERR_OR_NULL(fwnode) && fwnode->ops == &acpi_data_fwnode_ops;
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index c41d9a7565cf..bfc3883765f1 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -515,6 +515,7 @@ extern const struct fwnode_operations acpi_data_fwnode_ops;
 extern const struct fwnode_operations acpi_static_fwnode_ops;
 
 bool is_acpi_device_node(const struct fwnode_handle *fwnode);
+bool is_acpi_device_node_any(const struct fwnode_handle *fwnode);
 bool is_acpi_data_node(const struct fwnode_handle *fwnode);
 
 static inline bool is_acpi_node(const struct fwnode_handle *fwnode)
@@ -532,6 +533,21 @@ static inline bool is_acpi_node(const struct fwnode_handle *fwnode)
 			NULL;						\
 	})
 
+/* Like to_acpi_device_node() but also check the secondary fwnode */
+#define to_acpi_device_node_any(__fwnode)				\
+	({								\
+		typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
+									\
+		IS_ERR_OR_NULL(__to_acpi_device_node_fwnode) ? NULL :	\
+		is_acpi_device_node(__to_acpi_device_node_fwnode) ?	\
+			container_of(__to_acpi_device_node_fwnode,	\
+				     struct acpi_device, fwnode) :	\
+		is_acpi_device_node(__to_acpi_device_node_fwnode->secondary) ? \
+			container_of(__to_acpi_device_node_fwnode->secondary, \
+				     struct acpi_device, fwnode) :	\
+			NULL;						\
+	})
+
 #define to_acpi_data_node(__fwnode)					\
 	({								\
 		typeof(__fwnode) __to_acpi_data_node_fwnode = __fwnode;	\
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 67effb91fa98..bb84774f61df 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -865,11 +865,21 @@ static inline bool is_acpi_device_node(const struct fwnode_handle *fwnode)
 	return false;
 }
 
+static inline bool is_acpi_device_node_any(const struct fwnode_handle *fwnode)
+{
+	return false;
+}
+
 static inline struct acpi_device *to_acpi_device_node(const struct fwnode_handle *fwnode)
 {
 	return NULL;
 }
 
+static inline struct acpi_device *to_acpi_device_node_any(const struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
 static inline bool is_acpi_data_node(const struct fwnode_handle *fwnode)
 {
 	return false;
-- 
2.54.0

