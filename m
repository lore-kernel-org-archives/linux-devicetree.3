Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC16039150E
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660363; cv=none; b=iEPj2UHt7oUu7E7qf0ZSvuY/en8xykSl0uTV3/I7MgjG7PoqIO5g7pphqKN2DVYy/BlM3M6U3j/7u4XLuWMHaGDbs8mcONiS0NFuJbbq06/SV5Z+vdQ/AkQYeiZ5SnzPUarYz3SkrRozyZyUXAfFhmOg+sKIDQXSoqpZdvyTyJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660363; c=relaxed/simple;
	bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJY9THWBsLW7diBznytF/JtbOavQNwfBxaBly3UO5xDJLgL28KNeb9UCI78imfGDM93na/jG7L1PtM1oc67yCWvhK0w7btjEktwGORqjTxIEnzgXpQAcZbIdThMc2JDYpjpk4CPRIVuxgMXU2g7Lz+5xKJLz0QKqYDgu4mu/OJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNgNc5En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAYS76xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNgNc5En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAYS76xc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727lcCe1198879
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=; b=iNgNc5EnwGNVB5Wo
	jpzYDT1c4q93M2GP69xckixhd0xWzflUEHk46ucTp+WKQxDcV5HteU3K/kn+6PZG
	TDKqhY/F4HlKtUb5KFwPiPBfQUGomgNKyQSYxkn+Eqt2Hl+aPOqiJ8JMOQDB0yNJ
	Hk50J/N1Vlzytrq9Qm2KAuvyr6VhWOsRNo/nSndKUNMEceAf6S4bg/H9LsBsEO83
	+cUW+/di+e7Yr6pvymWjKK5m7AqxEsJq/QchP2D8hp8MGTgo4b8FgMlBcyvKe5ib
	H3ZIocakgGkkRsebPG6EpkAlFfUFL8nPYWos/DmpYgEjG9zuxOxGyLeSQd3pHIeY
	uuv02w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtakr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:46:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283df62d68so22088381cf.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660360; x=1786265160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=jAYS76xce5jNhogwU3lfZtpaoHXXWCsz0qEn2WVl0q94awxnI+8VNf4mDzct5kJGC2
         kzcJjZxFF+cqx3ruVTJWOc4WTp8jdyVlIjHHz6ciK5o3ITZQ3w6rpTseKrC/BCoixfJe
         Ag2uKH/9HsYhEKdedE3XJaBwrtxh1eX0K+w9eT+gHAxQdOumsRTsus8J9ItXZf4OEmNG
         HFEftaciOHvEOwynyCKXy+MoVMPHwNGu8KiSP3mGw8nnPGOtJ3RvGVr2ye+QjI37ADnU
         QrdFkELiwAdR1VvQ/TZp8nJQUMTIulUWUg9D9UkRjuiDoEC+2y47cSEh6Bqx4cm+0SUi
         PcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660360; x=1786265160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=IcquiZbspVMi8EEyyBmDCDvbApU9Okb+CMW7jP6z6zCFKGhm+bwgKC/zX9/FxRjuqW
         OqYg7U9kCVv1fztuQvzEe1AC+nJu/T439qa8/3Fl6cDTGCYdhnLcXobm4ROCtIxmuk7D
         RuMJpqf7qFJ/pzzqn9xYmWIQuLxdfSeqnIZhh4gQ8vllebIhcRtByfTHaTsrjU0cmWTC
         Y08nPjKy0bUXJbOSnUupq2Y7wtnYfs288JspYRUxbgI2h0EddPalhCyeBxLi+9y7KsBq
         nV8ha+qozdfT1GjqaTph1ictWf+/lEAugJE+ul2pYvwmna9nElfwR7HXReypCfr43bQX
         EKwA==
X-Gm-Message-State: AOJu0YweGxW88ULzg5TuBXtRMofqMSbT6Rt6kTGvaIqs0hX6x9BlSWSZ
	T1n28G/cH97wonVLbx/E6ldpLBlmx0hI1CS8exJe6Ai4N8K8zCNdct66nMsy4QBE6qetRMgYv4T
	QYKAEri/AI3aYbrxbSCe6oiD6gOM7JYVv8qHWdmb22JtZNQy0qDB8YWNrQEEgWYwo
X-Gm-Gg: AR+sD12tqVoF7hJplSfrTsh10wvRmlrSILJRMDZ6NTBX2jyVeHMrby8Mff3L7Ux7uxy
	KDDrkbIc26AW2B+OzMpoSgRrOZruij1jCNMxWStTnIB8R+3hxP+PgkuVXR1iLkUZKAuT55Jr9+r
	VJi2GLSksGRxNHzThghPWx2DKwE/IBy5Y/+NwbK7gbzRBauJAxpigEf75itetNGu94snsUnAPDL
	+vAiT5M5tnjcT+4rqMQlriJEVaEvCQ8zrgPXWcmYT4cD5aoReoQto0K2W51zaxNddlQkt8a98B4
	wLooUt0As9+z3NkqRRxzKv/pq6w7PC0nFKA2G78GaLBfgHgPMkgJo8krJ1xoSobKmJbHHNmRt+u
	tL60LHiIBiEn6+Xo5reYjIBGV
X-Received: by 2002:ac8:58cc:0:b0:517:580c:bcd3 with SMTP id d75a77b69052e-52b5674a16bmr114841781cf.19.1785660360030;
        Sun, 02 Aug 2026 01:46:00 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:517:580c:bcd3 with SMTP id d75a77b69052e-52b5674a16bmr114841591cf.19.1785660359578;
        Sun, 02 Aug 2026 01:45:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:31 +0200
Subject: [PATCH v2 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-9-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOyMg1zVETwQYLryySo0xTh7lZSmGS/mAiYf
 9iMcGeNaLaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DsgAKCRDBN2bmhouD
 16EtD/44lrulxJuRUp3wjdKxhqJWtYQcANXZUvdPEwWpNyF+fnTjVDNvjKoEU8PQmBcbGuL0+yR
 yleC7zTlOYAUEkXIB1CEsbqC69mF4AeyZ9TkqKKfV9ShYA94n+GIWlqJzJvwLuFKpzUQeAz3uhc
 dfKd+acJDop0kROjpGwZMRsXBSY3u9hBdL4ZHTouznqZ5WfIbI/RKO//3Q2WtZ18blFwzVe+c3u
 IwBoTxGA3ryg4MTjqI/rKVWwxNnZrMDLpE4CfcYf8cmyryeoKH6Z9KeplXmN4IPPx6IrvNweqnb
 tt4XjlI4pF78s8s1YbJEgCb2FZl9ehvXBu8RiR689wluC8Spqe7GmrM+ohfzVVRBoYSqisvKvny
 9VB3DguhDxn2BS40P8oxnnFFeZBEwVKXtH/KLQGegwcLNWk9hsIy08CI9YNDgrFxoNjxKOYRaH8
 Ef/v+QUaxvg4RlTeUEmAoxxJoLhJwBz77/+bod9jlRrw5QOdmrxaYT5lsFJTIbuV+gOCvUeWIun
 no8nycfyCpdCX7rYwkurEjr/SZWaNRlibNoW1QHALzCMSo9opt3qxKZVtt0vJjOxmG+B1uRRcT2
 cD/UGYXWCNvZBhtd+k/R9Rn6lkEriPyRKiq6tTKxM25b9QNp/STqJg776ZmiIgDYsJ0PDzANkRs
 APWFX44igIKO/yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXywDGW/xUGPCr
 u63R/n21l3g8uuFy/T/rMMaRI5/9+cLcKOy29lUSmVUfrCZ/DyQUXwJz458jPaxhvYn3eTHYNlS
 Pd1wVyqjwc866I3ygUNP1MqFQsqtDiM=
X-Proofpoint-ORIG-GUID: Ti5YT-G6iT06SpWKQGtMYnG9KuE-pSU7
X-Proofpoint-GUID: Ti5YT-G6iT06SpWKQGtMYnG9KuE-pSU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX3T0G874YmH9F
 boeUxGO0eVwT0F35mzlvbFnT876AjwBkfd0JEKQo2ZNxOyI4AT+12f7gAORceDHN/FjQOlnaSrw
 Ss/udZNQOS6IgOJE2MNae5UJwO58OvkcIymk8Y+/3dTBwGkmNRBk+NUBEy3OpA7wM9PxwiOjnN1
 B5mdF+/rT+a+TuyF1rT5laru8D6dhQmX1Uu8MW5rtS7vmTDL49O6qvQF87OUsoVKG3XsTwifTkv
 TuT9WT7RxfE+7dEK2x7w6yxpZ7jRZN4CUMTmtS5qofsr11iCSXAcoLXX33e9KSCHx4KuEtDsbLq
 O8rcMuzS57yC64kBmkdM4ufvcsiQHRf6RpxeB19S4/CbV4Of1v9DFNp62r4cDF3zuYjDbB6lcU+
 VxqwO1RvgwgJFEkt0cAW5i8g/zZIcJKzCI5W/R/Cehh6pRdkMrVpxWPhePaad0T37SLFH5R/4FU
 RKofTBG889E8tDvMwtg==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6f03c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZteHwOODggqzs_94cHsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020072

Add unit tests for expected warnings for trailing white-spaces in DTS
(there is only one for YAML files).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          | 8 ++++++++
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
new file mode 100644
index 000000000000..1eb24d91c640
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";  
+	#address-cells = <1>;
+	#size-cells = <1>;
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
new file mode 100644
index 000000000000..94d9ae9d616c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace

-- 
2.53.0

