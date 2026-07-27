Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF0400996
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156714; cv=none; b=Zkqp9EBegvMXHX+RgWNZ8ZX1QN0B1vG1FQ9mCyuoHcN2kfzsTojvLaHafx4uU3hssl/wl1PGVm59VematGe0wboRR1S7xe45FLvBj1+tyMLu19iDEWClU4IpXDCgGg22HSjV2t1n99YlvRb5Yx5c1r0LdfDYyUBzr9SZfIob7ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156714; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9XZn8giWyHu+4VAZZlSr8iuGiaHoZ27DMCzU9qQsPds84FDcHBTL3qCwtCJBlJYDWDjd4nTOuSBbNCjviB0/Hn3LtutsnK49BrDH8y6jM428GZLMJ0gSTzt0IP0U33rVzRsEhuWKXKFgHtNA8w5FXBKYZ3HMXSwO2erRjtulRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJAwV6RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRZ9qqHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJAwV6RS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRZ9qqHb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RALwFx3570816
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=fJAwV6RSV8EeEAzN
	9IWcw9eIsZY7NbvVesrucEjuTJps/pjJhDAvR9NIlxveEZBcZkYt69qmqrKFAPq6
	hG0s9r7h+BDWFQrjG2zvLVJwjemBwRl9/Ud4WmvgufW6qIjFKhS2FXMEN+S+6Ax4
	F+2eW8au2lGzqik6KdRqM3wFEdthPMWFonpCM1OToDyoW1M6pQE2m6NidS/K3BNW
	eTOiAkQF8GaUlc3J5XD0QoMvhHKd0s48v3dtkmgioYRiG15D1SXevoHOfy62ohcq
	jXeoD1wkRFGPRd9c2AQ8qijzJ4qCcEWUssncl/5uTWFdYKMqI4kDh3AlVfD4EhrL
	j3R6DA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g18r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so4423998a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156711; x=1785761511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=SRZ9qqHbhYtJuXkK6ziPHkio6mlVIld5JcJM0tESHYzsiSoHmpG61LTdoz42qX0HGM
         9ANcnbGgQ62zwIE/yimIoGeag8/CAuyMhHpJX7WC8Ekw03gjb75Lzje+CQnTuZK04wqV
         vmLv+mvhTGqAGlEL9TuVQmCqvvFAkRyq14lRUKkx8H+xJn1F24EaJ7PtLhg6YDuArP2e
         YgtcUBzONLHDIhiPdwEhYkUO5gHlPnewqW/hshMfzHncbASZj/44nirtftjJAKKgHhGE
         ULs0j2kQIRiDhq+73nNa1Mc8M8I3wwo0zu1nbZHcCZd2q02jD4WNwpQ+xUdNgrWGW7h/
         2WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156711; x=1785761511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=nMqUK5Xqzohi4bvaSJtJbhwmKHGEIQ62xIqW/SeWaLjlu6YdUsMKFlOSFJBQj9lqLR
         AyateGoESycu7hsEZV1xf8S5gf5RE8AL73d49O2+TUfZMsr1wcQ2X6PZ1mM8sGSZmMOL
         rCv7VvCk3tteh2MOudmh8ZzEDiUm4PTRpxBqkP1IKPMpf1ZLply+c4f4GTSOzn6fbrvJ
         18ay+IWY+yaAgwY1dAAslPiofP1+0okNpeCu4L8KJuNMGVlwIzmd0/riQuQt2wMFwsKD
         XKXxjAK+kgw27mzP+DvBRXWAafjDZf/2+BWbzS9WbL58Q4W0pKeeM+jK8XADYpwjhSAU
         aFDg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/NgX1VyNbpqrq9rKNTAKXD0ZwWM0TNAvC44gcVZR4rlAiSWTC0928c9qshsFFxwUc6boInLz1EUwt@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEq/sqGkYZP3rc+9Jn4oJVziphucTmucVgH6JZ7fRQ1OmnVEL
	X8tfVHWqeUkPeXYzURNF2+25onI4Wze0HW12tXxBciceCdiWVbjnw+SBYs86TPa3/qUAjVGZmky
	dnEq2t3dy3cDqcWk1yJJ0YPC1sXEgqYqUgMAvN/8/5EnJWIggAGVykw9KZxuSfCP2
X-Gm-Gg: AR+sD11jKXRe9bTkQwALWsmt8nD09YO55HAMYLeOYbtvh49RkLn0gWT8WJKkaNpdKfV
	8BQo6HdRmMXlIp0UJ0tgPrjkmM/9gs29/DuVMBO6pF4UOPGtPfn+ININH56n51zFTjs+hiDTsIX
	htU23FSrN9JVT+fpBQnpVNbinFZWYoGNZ8G47AeQ+/kdLmFjLPtTN07u7K5F4rsomcmF1o5K1fZ
	EOtitOk32fJidsSHx7sJIt3a2rwkiiuRVTTKm/O1ytbrnDKqHRqsyfPBkdaRPaLugP8F9+riDaB
	2P9pSJpwbWspCgaRvORlyIhkNHCtmgEAIhzVsk2gW0Fdxq+gMA/sm84hsL6DWsE4Lb0m9zyANSO
	7FS4SCNIwox9tGeC0vD1ytPGtapPxDE6IoIRpHLyFusBAAUJ+VGJEoS+VtO8HRaiL
X-Received: by 2002:a05:6a21:778f:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c67e061f5emr5314477637.46.1785156710635;
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:778f:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c67e061f5emr5314424637.46.1785156710003;
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:48 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:38 -0700
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-1-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=hXf7SCu94IW+Tm+OSM+S4JIL4mqdMWZszyzVXI285NrheBevq4yegB0zuFIBzjP3vy54TYhy2
 cMKN5ETAtZhDfRx28PCFMZeNv9FjXaG80ABYEUxPZsemlqTYIYn2x91
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a675467 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX0cvqSiCvIbxh
 ZGYU8jN3yQjjDr7ZAltryL5U84CRwqbCazanKvd5UhqGcKb9O1YgOftQ+RnZfsRZJZQpA/f8Gsg
 3BXaSFDxXneRdOdUR8+eLWASHp7ChOM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX51Rwrj1kxOFM
 lWizCtOFABXLhPuwKT66mEYXb6+hlqaA0LJsdeQ5ID0LL4fpkUDspS7cdEj2LmphJr0g24e8E54
 Mw0XiXxzpW2WrHUKGV6osbp+tcMlquSLMlxQInHoICW9utiu30WfRKLkIk/QQfBq5Wv6WP/GcIZ
 avikJ038QjcRHJOKtdjZgIcPIADMbTFIGgXaqI/H7QxGDw3ZTR6zkjdTl6o7qzefYltQnqtSD9t
 cKOpDVm2+efxC2eUzvrd/1eUW/wleB7CS6i5By00Lhu681EikI24lQFZP7gAzj/XzpH4ncqiXqk
 0TD0VHKg9Ol20VLDYKt6X7y+StEEi64YoFnUcFZyZt53Kzyw7V3MEZ+kRo9ECiyUNk0m4C6R5Oz
 BaHxe17MGdASqfFUSkX7pq09BuEY8AA+DmT14mvM+hATJicK8JkoiAzf/HDiXszgnkpy7Y33KlD
 VKbMt77a9DgrZfAtFQA==
X-Proofpoint-GUID: Vs7D2KTRGTgAQ9gKqe8tAMnBwbpX-jEE
X-Proofpoint-ORIG-GUID: Vs7D2KTRGTgAQ9gKqe8tAMnBwbpX-jEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

