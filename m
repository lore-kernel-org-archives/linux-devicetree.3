Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F33D34B1
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237641; cv=none; b=mpfUs8Pe+zxPjdhhlvru+4f5DoWoOrszzhuK4qXpjJUo0VcQOTtl7QjRBLHkJU5oFhGcaOh3kQBXAF4+8kvcWfTX1GyzfXkZHuyJXpjQpwnYpoa5pRcdz8fX/Y6rh/tdktY3ZZvXh6QX0YKp2bnXmiMuKRtvRSwRFjW/yUsQqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237641; c=relaxed/simple;
	bh=4QSi4U79nO6Kuv75iJWSSw33Z4grlzD3UTlYLg1qQkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeievM1cCoAe+1PRGCXndNv3kJRHh4IMp7tJUovkJAy0seTqhjvAlp6CDCL431w0SZpBiYimJ2yhpFN2eqEF6rD11lN4vUcyouICbemKllMdKbqo6cIDw3Jc2nWtaoz04ZNXVSfFhg9cM2+EVyP8DalhC0zrjBYuW7bwtW3Dys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZEfTlaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEnyTl98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZEfTlaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEnyTl98"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BBo3U1562125
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 17:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=; b=aZEfTlaj1hsn+O3u
	8NFaxgxBssSSIgfmJGXdkmcSIP1+0WYi6Hi3fL0KK5W1FKpdXtnbc3KIAPaueurW
	HcbQys6NSgfYA7VSBSLS5qb90tfIiNbnJW5eBeLZYD7ZU5LZo+/ytXIAZZC24ZlV
	PDLPQlw5WLq7zjy2ZBitWZzQE4DTCQV1+MogRJRgsR1S2vMH+ycjDgqh5Sh2OlMa
	vH3btz4KuBwSb701RJitz66s+EyyGbWimjJ4Fu9YQU44sFUFYHVP1lTfIgOiVefg
	zOZzlAkA2jQi/yAU9BXflXTHSmNqNuC/qLzitcKGPl5K7ZmTmF1KiaQJhrZEG7la
	ESju+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um7470k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 17:33:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso1392673b3a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237638; x=1775842438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=;
        b=gEnyTl98ScjVTXoPMln7o5DU28DSHB2OCjUeogAcL2/MbJzH/zFd05UDYOHTbB31ZM
         nL1ZrYy4V7mr+p2uKWWCw6nFXhLGQQX/T/GYmC7RhhT9iT9pDJrYVAEby8Csnjukn+oN
         Qi53hbo7lj2UgZkZLbs/Y2AVufh4zP3ACd2loujcBPBeIRuvRDw2UTP/YHoxJzbhTn3M
         +9IoAyDG1zmSXjDSidUT4nGT69WE4M/RRRy/Crsc2+ONVtRQTQsoLpJLbJMZvWTI21MW
         q0TQ4gzb3TISVW5sQsltz2RzrW3VzuNObtvvoi3MMq/kxCe+Im/rT0pAvI/vEDh3ewBe
         47KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237638; x=1775842438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=;
        b=oYgeUBRKPrywLj3nIigMkBNJX9do24v0C7/QXyuyOP8xwop1yUjvtYEOGF7G9xJuOw
         uZ+z1HZbaVEmGqpRC//1FuyEYOumRm3Cnf7GMhi3rvZOGuwyJ5Wpxaga4M0BaVtFQMev
         8TuSNv76OK7nOPIJ+8+BybKwwC7BOg4rErhnhgA4uO/S6p+UhEe94f58U8SLYtcNFABl
         alWFj/Srq9ZKnDlYcGUVijP3PKt3M5jNDJScMGq4a/c7zhxzAzp4pZ///ICZ9UwZdL4P
         9bN1BPSGtCCkLrsDXcEFZG16Mn6sVO+9xsq3oayLjHkK0hY2FmK1Ieur8iqnwuSlvr3V
         0cfA==
X-Forwarded-Encrypted: i=1; AJvYcCUXb/aLPrmXBqDcE+UwdxcqNagu+E7Sj6zZg3Fdow2d95tu1u56DjlwYfaHe3NkKJvonRe95ajTVhnp@vger.kernel.org
X-Gm-Message-State: AOJu0YzXY9b0Ck7tC5mwUhqmsD3Py+G8DNYepGKxbagcCV/ZYLI5CUl5
	N++2L13f54BR4WRZI/u7IOU7M2mx0imQ034oyXTUKKAnDOMZomF6M5XY2ysNrtGrufWHNXVLGDn
	xGiWSQ9l4Idyapz5T9x6E9eWlBzfSyip8xG0XCk1eJttiG3YB/UydfMhw6JFmcTi6
X-Gm-Gg: ATEYQzx9TS+ZePtEeif4p7r7IHf4xbn2JJjIO9ksll6+fvYNVx+3ed7AleyJHDBdvyF
	41aaVJIckAk7+tgX4oB1jBhNi9auAmbFOQ2lNTeYVUZkivPmpyl8joGMhe7nGHniCzUuNrcygfc
	JAnFOTfF9G1woHaulYWdSljd22W1mBaBATbT+M3x6/MPwcS1ML/pnnB40Mdrdl8HCV3xI6LTH/S
	OZd0uf3Qx9Ac1op4M9CN9l1LRRK1lZqDytFwEQfnVf3xr6ps1BU8QIcrtCNVSHLmp6qKP3Ck6s0
	PWHk3L/R2X3tYhOXhiJzGjqXe6Q3K44k/63F1WLG7noIYHD6ygLUqE7YSSOR3BXZM6EJSpZUU0g
	E+OFbYeTqm//tGmXM1XA7Ee6LAYwtZEcO9cweWLp1XeolLvKfEyHOXAdJ
X-Received: by 2002:a05:6a00:3d4f:b0:82c:dc9c:e765 with SMTP id d2e1a72fcca58-82d0d749427mr3930153b3a.0.1775237638453;
        Fri, 03 Apr 2026 10:33:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4f:b0:82c:dc9c:e765 with SMTP id d2e1a72fcca58-82d0d749427mr3930115b3a.0.1775237637915;
        Fri, 03 Apr 2026 10:33:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:33:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 23:03:34 +0530
Subject: [PATCH v9 2/3] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-wakeirq_support-v9-2-1cbecf3b58d7@oss.qualcomm.com>
References: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
In-Reply-To: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=1418;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4QSi4U79nO6Kuv75iJWSSw33Z4grlzD3UTlYLg1qQkk=;
 b=S3BBZnE3MjxvBLw9tw9ecCrgVVwynC/kNl/NBJTEmrlZVZtP/c6mx9OmMyhsxVYd5XSpcq4h8
 ahd7a5OtAF8CGyTIaMGUzdN/cOHXYeBoxs6bvGKrSadbndkpQ7xGY2r
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cffa07 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 9cWD4prO8BoS8TtdTNgC0_5tuxUcwwB2
X-Proofpoint-ORIG-GUID: 9cWD4prO8BoS8TtdTNgC0_5tuxUcwwB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfX/BZO1VMtUnq8
 IoI8JhJb7+KsDyDtF/Ax/mAZbOy4Sl2vFeYWkdajPnVJ76zpE/wR1hKSqmYIxNeMc+WD4U0YCGt
 QEzrQrQZdy2EzJffScXWO+ltIJK/uFlm4Eoj+irQOcnEze8bgwarex6adCRmh08ztK9IKUGiYzJ
 XUSU9eddpzjBx0D05QeqHgy8oUfyvDWHAVqnWAkUw1NyzMF2zKjCFtq3JG+Id+YlP2Q7t0vbZr+
 WrqHqBgi5fypI05wgUJzpu2tgWeTIwUFfGuSFIXKFT8WZfDNvdznJzNx2OnGuUNzS+rgPwthl7w
 ZYzuw802wjg/AJplKm8McvfR37fRHdr6+Tzw5N+HXpg7drwOD7hNSGp+uD7Cxly/8S0nh/flalO
 ldP3khLgIYk+thbSMWyXfwlFvkCku7lvZJ5LyAiyuja3PCUVctcrz3sjwS/qI3bNSD9oxH5GJ3I
 r+mWtRVfjITK06hRm4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030156

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
 }
 #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
 
+static inline
+struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
+				   const char *con_id,
+				   enum gpiod_flags flags,
+				   const char *label)
+{
+	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,

-- 
2.34.1

