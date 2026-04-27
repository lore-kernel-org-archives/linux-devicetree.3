Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9571260580
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253576; cv=none; b=lvv7q4y1dhbF2jAkr94GfnupxvsluALY/4crxmpXHrP/Q8NCEUHHMc+Y0Zb9rixK7T5VJFJ9+3m23IsvyEFh43WaLmPKCyWHFfCSgHV2JEr+wmHHSt9OIkQqiO5udKrO7LjpROvWtidthKk8hRbq7yYI/gGVr1m4iFh2pOyyJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253576; c=relaxed/simple;
	bh=qdgOoJPrYwE3M6SbNj/xaSbJRAJU5RxLjx0JdrgyqQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BreaQHWg/N7iAUJbzdEXth9rkSWSqU5p+oKToVG8XEZk+a5O/vmlkqyrMQDc4t7BZldJz0R9FhpUNpRxrc1DwdU6/EIe38fMNPyAbMYIUIhftmWkPBHLyhqAU9Dy0/MaLu7gRnvOfMUFwL76vlj9RZCu+m1qsz0TbAryWuKA7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbY8eZuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxynlsb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbY8eZuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxynlsb0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMIHFZ2371295
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sOYlVc1RxI7zDZA7t4Xs+obBnFZx+Qhmg0M
	MpXOIeLg=; b=AbY8eZuHsV8aWF5/lnxGTV24OoslIEorh0myXDvEATwEM1I8Cav
	E7anwz28dGFPAHHzKRMYUEkP1gJWmfSglzn7/QvhTvrn3a2vlHPSiBIwkTsyYzbw
	qTeZ8Lugpfq1ETaOGbLsOa0J0xoQvcIIUBo31lxQfjKP/7cBi0Mc0f/o9RHz8FBu
	H0ydXhwIjAOZHoExjMtibe/93qlFUWDUjBYoS8qsjvmm1TYTAZnVZF8gDA8q2AC+
	13/B8RqdczheI/Gn51GerNt3FStxEvgEVeFYrvC4qvF1ninA5n6Tin2i/gwIvv1e
	UE/YNXoGr01cIQboFWZWHKz//itwjdt8eIg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr3wqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:32:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d9da2559aeso27192354eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253569; x=1777858369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOYlVc1RxI7zDZA7t4Xs+obBnFZx+Qhmg0MMpXOIeLg=;
        b=Bxynlsb0UiSxrrL7NLbEz3qSoytqs6v3nDnZ4YRIfWh3CvezCQr2kZ2zWp0NUyiH18
         5Ao9bjt0SrSq5wT4NYqPMZyqAP0MeO4ERQShA5jpPbN1Hz2dKBQJ7qD/0sNXCILdEJjX
         bmCHZx4a+mMIj2LgMI2bxWObos5BIaj2p9Wnhvo/7WxGBHjbWQNqIDiyE00m4DucHoTi
         +4zsfxCOF9XrzWRGfpUhgsbllfJYYLdc9fp7w2xQF4dMyKh7xV447OmlCOfIn7RuRZ1U
         m88Jg5tY/5vWzupp+x9GGNQ68uGiB0KNBuAse3W3dE/HfUVWstg5t1VVfbNABmWdgKJC
         pB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253569; x=1777858369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOYlVc1RxI7zDZA7t4Xs+obBnFZx+Qhmg0MMpXOIeLg=;
        b=ILLY3rodhwLYPbZY3SSVRAalLwjsC0sOHA1YEnaxl8AbMJ5/hJgyG9Kgx4k7MbHaHX
         +NScgEzkPuw3322m6ne1ZUOfHJbBdA61IxnANyWODmbhth/+J/I7BOWi9z8KQ//7r77O
         653IECykUmwkMeJNua6YzO4OOfZJFzbMmlMJdYHb7s+WbM1clmsvB5HSXXpN4yRjDMrV
         WoM9pon3MsnRZb6QP1CM9cFh7iz4AMynSysa2iuFkOyD4UbjebLKpEMiDHEyBIqp6CsC
         S+2Gd9EmmZl3/tC6AUC/qe+u+7GXd7BHmqm4KKV8r0q7Gpb0k8k6RF6vMnM2+JXzO5Bh
         W78Q==
X-Forwarded-Encrypted: i=1; AFNElJ+x76Dg6YlDfdZJBJBa87oXkQg0gKaRIK6Mq04kpGX0QOS2shFcU/Or92dudBSKldt1S7MMNGinUS9N@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUA3InWgovPYQ1bmuhb2rgALKUV7btoBm35zOlqndpE5EIGWq
	+K9bZnV0OjxGVVK1yL9xQpOE4Sg8GwYit6N1XWGK2LNXWq1cT5a+N4BOOnDargD0tZ/OxI2I4Z5
	xAJ7+ecLBEHJlDU9XiWqusIdWD0Sq0dS0Z3vJC3ZPU1M7ywpD23zulhqf+LdGIc4L
X-Gm-Gg: AeBDieuzqEJv3zd85s0A2Ga48uz3agztO4dqZJJmQw/4M8JzgwDj7jmgWyExitPmRUw
	uiXCruExZN0w4V0+aOZVBHzmrpBocVcsegch23b27oujMAVwZcikC+UtfbyTy69JmZAUHFdHtaI
	RTVFDa01GPHf7s4Rkt4zgpoFG2Wq1q+9N4exl/9QM7I6Jgr69rfxXKrHqNNNZC8bybuZ7AZiHvR
	I5hJ8cbaYboSm7QOLPu3aCPa2LfPxRRxEoFgf4DDJLj4UHM2ybtKZEMnTARNaCPnmec34aH/ozy
	wpk4tpdUtlb1/ZMhjYB70nSw+RWxXQMINiitBdwrXihLlMqzXBkvOpKQAaKYrlzW7PcjsC4uvAq
	xub1RIFZj0j3EcCrxRKMt8mjhZdNVJgY7zlMpJVPi2nEtaBGvq0lsEhGNUG2MmcQsu0oF0QIvpg
	qJSpeFTuP4BZNHa+xJ
X-Received: by 2002:a05:7301:5784:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-2e465293dfdmr21456634eec.4.1777253568729;
        Sun, 26 Apr 2026 18:32:48 -0700 (PDT)
X-Received: by 2002:a05:7301:5784:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-2e465293dfdmr21456609eec.4.1777253568236;
        Sun, 26 Apr 2026 18:32:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e79c2954f6sm47558002eec.30.2026.04.26.18.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:32:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Add compatible for Nord watchdog
Date: Mon, 27 Apr 2026 09:32:36 +0800
Message-ID: <20260427013236.231841-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69eebcc1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vLXAFcHGVjC68m0yDQIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xkweaqwy4_Hq8lbvMzPOfX8yQU9bbdBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfX5r+0bMsmkI6h
 YSeRCkhyDFZfrd9lSChZ98qdNDTQtroELzHFiiRHzNJdcj6AcYL4lA2cKJBKBEbujdWou1w8Lvm
 kHi4gVivxbW1cVyQ0Z7955CJLKJ6VaqaCPSSP/9jsH46BHB3YJpisOqfV12PaQyn/o8B9Y/XLjX
 ciIMwdHZvDBScbxpCRG5/U++yy2PA1P0j9RzA5IweNtwYtddtpg/7HlKyiYw3yld/5Kl2u+EgKJ
 lY7LUdPjFDRj8dVyjblFYqYv6KyGohq1+OnFgA4WP3ki+GQVLS5knm+2xsXzaw3ug6MOb+/xJKj
 7SUgQ68bbVsPVVVfI4i9eg0EvB0j7NdgYZrkTdCFrms3mESEo1RFcFjg0aoG2BH6nLF7wV4friQ
 QnDMrN+6cU8Lw2vbJG7ojDh1t+0EBCx14eWVNx/hN66b42S85YEx+zpTr7xNFuGCiROlmj683bV
 CdjqlExl88RqebODu5g==
X-Proofpoint-ORIG-GUID: xkweaqwy4_Hq8lbvMzPOfX8yQU9bbdBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Krait Processor Sub-system (KPSS) Watchdog timer on Nord SoC
which is compatible with 'qcom,kpss-wdt'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 = Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420114950.1253792-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..f2e6091902b1 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994
+              - qcom,apss-wdt-nord
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-qcs615
-- 
2.43.0

