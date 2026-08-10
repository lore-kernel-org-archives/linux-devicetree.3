Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EE3BED5C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360114; cv=none; b=mnGKAFK1ZOq937GTZ9migoO4gPRAnxAotwhSv+EFS4RBHFZSMBjI+Oce+n8gAZcvH5yAiiKIyFuwqtPHayzQduxigd0i6hLXlf3CLBdPj69UqotZYo0GxdnB1RwgLvOsuiu2AbhgGKZhkbKRrxhGFMCHCu2RfLR7Ta7ogskoaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360114; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyG6FRcSja4a5U7GDXhA1jn0T9KWB1FJIZN/wnQDzHATyAJF2l6tAZMA3knLrDLSHc1Fc06UCwIP8mkx7dVl9wTDaNoIg/vygpmtcoUAT1nteO1IimEZjUazGIUaZ7nZ1QepnSDzX2LY2mEOrzc2Rvy2LILEd40bGhKOmWeInAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLHQD42I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaJAfy1d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLHQD42I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaJAfy1d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RxsS872408
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=SLHQD42IJjhJjrwrc1vUX/UrkAR
	PjP7jXeCU7Ov40Da2cHjhiWodrxWYXvX3EoNvqa62dIl0rh1gyCWzv5ttci462fU
	lmmAQQsiWKZNhv2+qvTMUZacgZRjJd/HAsjnJmuLgXa2NNtn/7xh8oeqN76zo90+
	fauXqL2mUuUMJxPB5MSky3wlFomO4k5XoFF+497WsYXSDwizoHSxQ2jMTvDACetA
	C+q2PLphQKhXECstujA9v4GeJQAbEGMi4lcjA5bd5Y6F5F6hI6AYqVlvHoAbmP14
	zOIQPy3V6sqNFoV310PnmoEeSFWvtWZcDlPCymsq9UF3FuVjS0ZkzPNu6jg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v594b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1462445a12.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786360111; x=1786964911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=IaJAfy1dTIbFHauYZSJFzbmEeUWgDQj4CNNGAAShGm+j/6+DGgvfz0lpo4XNKb58WB
         ftfeSDEXD6b3QbA/ESMvtc8kr8SkzIacq+bYD+wOpasUp4VH9kV644O5PLEDJZoHSMz2
         /hMygV2ZIWdDCEHCfmru3r3MoMxB7cDrhG2KNZQCGmnQBXGG42Euj9yr4eS5lQ719Pu7
         ZyhjmJQPCERmbc4zLo+j6brEtd+JwAX+FsZKgH2dSjzcZbViu/zueyWhDnlr83Sbky5q
         R7thxPrQLEASMuoqvKhyjkiqIorNUehkIBr+ZNJAC+VILMWB45DTeGR7AstLpheYR3/B
         2byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360111; x=1786964911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=AB5FMErrhyZtZzIfezdsA2kJSMEjLD5PZ4WfuPz89wQUuMCxmzcp+6fxDrsA5TGLTZ
         9W1Yd8MlyqUIdwQGfdm2g7hoDQV6qjB/WPD+H/dWHXGTVdrfNx1j9XRwI+VQEp3ATflV
         xnS5LriZkba2p4U+Wh5s38W5+/JLbs4cyl2u3OaQH5ywtrgL3E/nZ91BB/YgbQqaJqxV
         JaOHlesq/qUBM3/nPZZH6RAXtz75Muu6Gfh3MQgXzNIKeV1x8YZgH1GONk6dIJU/ndL0
         i77XDwqh4dY7ElNj+KfFQX09JUBhbXB63y7UnAuhuSGOznb9trCnoQfgPnCDulZd3so6
         klJg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8nw+IVmLNh4Tb+m76dSxfQQ5tADFRQCNUNx5wBoyyRp8XZyWGLnoXiikfBKM1HOlYasN7agEwvYtb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzis4RMWCXK1JuBGuO/7rvocAXNjdoEJyXopl+mc7vj74tsIGy
	XZbSczHUjvxmc5zQ52hO/sShIH4bdj3mkXFZlFMJ5ZOe7jdX26B3AeS+6+wQ982s1r5Rtqbj68S
	n3y8MVCjfa3LKUp0uIZv0erXPrQBwluV5GCKga/SCgWCn6MOi7Uj7z/ejrAANxtOW
X-Gm-Gg: AR+sD12Ad0sYbkE7xAat324oo+RSkZWpyxS16E1oaHfQKwu0SivSQ059K41Ipiagmqq
	XucdkZhPYmeK+SXhaby2bceHiIZdSKB4smKa+JPB2xUMs8rTSDrcFjtrXM1QR/JikbzGl8r7Ty4
	9XA79TA6pfD7BhN2iOwRvriFlCLklOmAjRkjKmRBmt/OINY/p/c71L07eMvUKWB0PGSQeROaxfn
	WkW79NLEX4q84TGcLn2E2wzW5IcuASUdjK2zPprURGNX2IvZKpzxGiewOyFr6LOH1Nsl5VNhXDd
	DdGuDPuKjWsP8pfli637Ekj2Yn0lrBjPTWPb5P1CzaDUMP3Hp98NtIPfEppdGeyNj7HhD9NduOw
	M7D6bv+jZUU9mmxrHjkKzLobn0s60k5bhOsJJZKZgSeeg2xEC27XHkfvct7nA
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr21462742637.13.1786360111034;
        Mon, 10 Aug 2026 04:08:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr21462676637.13.1786360110565;
        Mon, 10 Aug 2026 04:08:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm46520198eec.23.2026.08.10.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:08:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Mon, 10 Aug 2026 19:07:24 +0800
Message-ID: <20260810110726.775084-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfXxHk3fe6/gMQH
 gxsrCHy4e+FKEqByWl3B37ykEQZwpWaF1v5M14y/A10v4y+s0NrbiOvX0E9BNtvuXk4w4eXPq9k
 DMzFPzLmx/YQI23u6Pm9JAwYMO8ZKAI=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79b12f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: CCeayOiAgelhgGqS_zjydA4YaMEiTYNj
X-Proofpoint-ORIG-GUID: CCeayOiAgelhgGqS_zjydA4YaMEiTYNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX0DokteaTqnWD
 6RnMy3Lu4iwoYUj9MYhGfbo1hNmZCX2H+swMu4a6XacS11VsDupT22v1tI2vQvoMfp/wIQA0qGc
 NENgnM0gWLIr0fycsAX/HgxFqdrWeFD6TZnLHLp2KvBm6h7j8k3Fx9mlISYYww4FKk1A0NOq0VL
 G805+riOZmij/YqcE2faf4TegHS3LMsDY89/XvdWlbB7ItALKGhLwHCiTC3ppQWYSWvpt5mLV+O
 b2ZTIiEeRmM93nswxIwC9wcZ+vOnPoy22ZSHD2AsFYZNqMehACYO8kDNkECPLaDQ6ivlA6rB4gz
 lZMHixHB2diR8obU1QTnQI3gcdwDkqalUESqcEoHfK9vklBeuM8ls23g85MAQ3UaBSu9KN9MwWA
 W6Tbx5ljK9RQTE0YZ3Kt625X/xhiYjxbHAaKqpI9tK6RGi+UlcxaNFHt+2Nab1JonfVkgTppXol
 b+IT+ezOmgWh+RjIBLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100097

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

