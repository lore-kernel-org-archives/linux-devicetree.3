Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DA02E62A9
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064201; cv=none; b=hE5xA6MRPo6B6bLF5wDqxLaOJv8UoC4261iC1D+PYHDHXdCPcPMhMo2bHbb9AIiIe2woe9YkSJWlEj7uitLcpuPATxpEFR7UhHNk4MkOh5ZSlMFPUftPa2XkJK8s4GGhx9YIusMuqu6rTuOA5WQKrP/yMNEVjx21c2LFgc2xeZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064201; c=relaxed/simple;
	bh=BWHukXQjKynnopMPlegvsfqp5eow4oLsQIgGce+X4tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7l/xzyl3kAf6LejAE023UO1UBxtd/dyzkv5KS32AhWGIxeKFUVpqp2FDHJRW50l6cXnmezkHBDwdr+tcM7LjHTvyBE2hbrkGKifaiME6FUD38aZO1DeKJ19biiDNb4HKNRmWtaVjS7EtI4f/XGKEahgba672AKT96L24hLmYXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI9FtEll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fcr7l2bj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI9FtEll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fcr7l2bj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2RQ8A412365
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P+4mGrJHOJd
	Bku7fOdSzsvStS94jL+X9eo5Q2CiezAk=; b=oI9FtEllYvo0kn9cLMVtMBxWLMT
	Z+MpH+lWUThTpUgTYCtrlH15j/lHE3B82quoCthj9Hjy8PZEFDFZwmdDY5xOeRgR
	O4eCSl80L9k7vMoocrjpUGe1uopBKUJmYbGQe0wWXL4SS8gMKvO9f2Y/vGaYm2Cd
	eYvWVKnSMQiBPxzGIRDlWT/9yZbdgp2EXx/+CyuaehbMC2s28hLnyjmK91OsQ/0A
	G7TnUWLggOUDq6kteenXc/A5ciQCB4ryux+JYWabxaKsqAtcgIMgQt1eJB32ZnoW
	IsvH2UQLwTRoMwW5c9F9VkE3+O+R7f5N/j37pT+d6O/2lwKN/LZHH/rIgYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmtb07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:29:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6063421a91.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 21:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064198; x=1788668998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+4mGrJHOJdBku7fOdSzsvStS94jL+X9eo5Q2CiezAk=;
        b=Fcr7l2bjQaBnJUjJ3J2Gho6BanpXCP9XXrwT/O59KZ2ZX/Q5GOPGJvoAvF/wg1IfcM
         OUUCBtIxveQiBcWXCkMjQ+7iKUul49H98ivH7XbX7pDTAudnmGYuzBJkJhAdwechaZMU
         dSYiLZRChxKOIIyomgMtLOr5Cq61HUFkKp8zkoU9LAopUDKEy5+CxrQx6U3foo8sYTjK
         ToT456irVFPMdLB6aa+/+/oeObNO8bzxMpynJpiX4OPHRGCQUMNj24LEcl/cPVtB+sPw
         TjdzOyaJY8GqMoWUkX+rA9GC0JrT+hVxsrX3/m1o33s5g5xoJlVyNSi9OzZkpvRaDBVJ
         Wvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064198; x=1788668998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+4mGrJHOJdBku7fOdSzsvStS94jL+X9eo5Q2CiezAk=;
        b=PNFzLXvSkMxJwnuyvZzPc6gEEbCgr6ZNJtRHdJHY7BKoAQ11yCE6URsCmmSvzS/m86
         esOAcY5t024yWuOn1+DXojPhyrRLWWPJ8RycX+k5gBLtkH6MCRbfWKzoNoVeU3eks+jw
         Hu3ERHjvve6PuYciOD7hsjC3iXtoaKR6ZM3i94bcwP2OMnlBBrZzF4GuqMQjeqIY/8aE
         X9946LTDeCDjx5X3jaDxUfzjVn087Uzm97L8SC82icC1y8QzPN4aE7702nsGSdZolSen
         KOf9w3MkRyimXfhw05TZz0LV0pvXH8PLTmf2ZdWTsxGYRJ8mJJIkOZ6LLcCKmY5lqwGb
         0hSQ==
X-Forwarded-Encrypted: i=1; AKwUvBycqS4Nde87AzVDgNSegqeKrXwMKKgD5tjQmYy9AZ/9V63iMK4JC5dQiOjIRLrlNMxUfIJVyCMp/oCt@vger.kernel.org
X-Gm-Message-State: AFuF++k0e6opJvva55FLsdHe1+rucv7DMSl4vCi8qmO+fX3aONeCxpfz
	vWCeAjZpIDGyLUlnYwFSjUfAuMX71lIpADmEmjXITM8uR3YXcH7aLopPONTmDDhlMQ2kOBponvm
	4eGFqKaOw7WrkBnaPaKDZpkFR3tLSDpyURPSsFXesHRvHNJreyOsyO6yLgG0sJdG6
X-Gm-Gg: AYBFou1RsysM69SD5jOfni9g4rra2m7FLD+S6i64dRt8IcAdKbp85iWTi1vhKzunPRb
	2yrff5FGKVL+JEIvFQpcB5Dmyw9FFzgKaPH+o9eYi2/gbmAY0xN2E/9AtiVF2QluhGhfK/jyCKa
	V6ptw9MLGOMGYjowx7DVbGnCG52ravBLh3hagFjzYu3ak9lGV8H9HHld93IlaJhLZtfD9fMLMY/
	YO+8c8pXHfYAZjK9wKy/jb6QfzSsvn+KrhlQQ+wyASjuiKPscx5QNbHgOm6+VaflfujNzuzmuyj
	fnyksUo6VnzzZXkxqy4ZII/iMLgBxvhoES1t18eJBWfmG6wVBlE1DZZu7haMxTuPWa6U4IonP7E
	qVBZ+KzVke5zqinU8AixwbxJstjyd7aiqvN6xO5CQCGNVZ87s19n7+bSGBn4u
X-Received: by 2002:a17:90b:5410:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-398bdb0ae0bmr8439685a91.16.1788064198195;
        Sat, 29 Aug 2026 21:29:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5410:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-398bdb0ae0bmr8439634a91.16.1788064197751;
        Sat, 29 Aug 2026 21:29:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:38 +0800
Message-ID: <20260830042939.144376-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX71FPQ1KdaVqK
 GHCcVj7Xtz7lD5jRNycAVwUqTu8EwOFhaNCOzD85qURBQ9z3vH8eCqxqnc2C5xvH6+i5E3B/tN5
 fZ7XtHX3fiMpgv3EPjh5JC5Wr8Q4mwggQtD+CIKxflhNZJ8M1uZwxLOIpz6YKF/Wo5jhZT2nahd
 qnf9X/4pzXYgHqM8186Y7qUSRaPNJvGKpA0cU2RXWksJjyFQnfxtf6VFE2AcWNEW9+Rhbg3KAK/
 VSNd+4/xnUydCJzuu6r3jpydLGyidJI+8Hcy8POc0rC1d6OvPkyzsDdKqyrAVZHlbz0jq7j+iDm
 VLIL96gdPHvKwK/FJoAYbcfkX+u6qrPJmC8uZmJmZbX4O2rXxwwA70SQOa1u8idJrd6zMVAzZZY
 qksbFlWSrgTVbvdof08G01yEFI16vsZwl093EBH4Ugn0T6NRKhCFGN7MO+PWI2HqEK0/m+wrqn4
 j7uv9lcw1awd1KxNViA==
X-Proofpoint-ORIG-GUID: ikf_RN20NqA_-VXeegTpPB_97w9DuIp2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX51iq4e9ZKp13
 1A24LLiNpGKbLSLlhWoTbP3LauY2ytW0QlaxkG2+RtzO9y00n72rIGJFNKT1iVplVbgoJCqkNCQ
 oRMwKHXG1f44qNQNpbiD9MrWi5Ec/K0=
X-Proofpoint-GUID: ikf_RN20NqA_-VXeegTpPB_97w9DuIp2
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a93b1c6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VvPZ0_ZCf5A27y1iVX0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300035

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add compatible string for the PMAU0102 PMIC GPIO block, which has 12
GPIOs, used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index c27e24cb206f..77be0690c751 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,pm8994-gpio
           - qcom,pm8998-gpio
           - qcom,pma8084-gpio
+          - qcom,pmau0102-gpio
           - qcom,pmc8180-gpio
           - qcom,pmc8180c-gpio
           - qcom,pmc8380-gpio
@@ -281,6 +282,7 @@ allOf:
               - qcom,pm8150l-gpio
               - qcom,pm8550-gpio
               - qcom,pm8550b-gpio
+              - qcom,pmau0102-gpio
               - qcom,pmc8180c-gpio
               - qcom,pmp8074-gpio
               - qcom,pms405-gpio
@@ -496,6 +498,7 @@ $defs:
                  - gpio1-gpio22 for pm8994
                  - gpio1-gpio26 for pm8998
                  - gpio1-gpio22 for pma8084
+                 - gpio1-gpio12 for pmau0102
                  - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
                  - gpio1-gpio4 for pmg1110
-- 
2.43.0

