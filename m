Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF351A682C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657713; cv=none; b=nyHoi4l9+Do0u+b5jQm0WJtfaEnb3s7oA9C0ba8ukmlOTe9pn1WJJlYfIPX7Mjd+eaOtIL1ecxNVBj5LWwIW+fDwV1jJQ617TCimc0POAUIM/kzj0Lip6xDaHnQgB51AnPfewu7Kr9MbscHmyCJ5yOHDCYALv308wVbT6V4qHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657713; c=relaxed/simple;
	bh=n1XXq3Sj2kgWgkpZvXMGiXRLCpGWBn5viw8jwqinmSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLN6ZnaIMKoBv+fVLlve1lBfennaHSN2dBXg1nXreTzxqoM+HW2Ao3QZF49/aBrpQQ20i7tRHmu+of5YWh7R9xuJJ7pa+ECpDdHc/MksHxOJhh75YOprEggG/Tt+K9Mw//XxzTJS7eszGVfA3BaPli00UyoMMRygMsDoOplSqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMuM1Ti+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYLSHufY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMuM1Ti+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYLSHufY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JAQPnJ1414426
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kwj4SJqKW0R6yOI9gTikppMqyML4lTNSnA8
	BGGeKyrY=; b=WMuM1Ti+rLF7OdC8y+9xkS8CrVjJK9il8IYoqR/s2QRKX6EQYOz
	VjzMGdjhKkL6K3cW5fp8S1RxvDS2nbQSdCaquPoVI44WeLoNrHDyrHbKKI/2X2zj
	scEU6cuuZe5QNvPD2GPMxLSV6wnqiKK7qd3NIh0WELV/wNnbm8/nz+RUt9tEUKgw
	qROZBuk6DPiF6Km3zh+j0VfG2MvEJODqIw7Fy/R0YYllyxjzTjwzZT4JUiSzuNhn
	OkYUoWo/V87CfXgQzY72g6J4NcPwi8ABOiIqhlAWHp1h09bEaR78howJFFEIPyzX
	wHq+dxHziFBuYOP4fygo+eQk5/y2Kki91FA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y6425u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:01:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so3221409eec.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 21:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657710; x=1777262510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwj4SJqKW0R6yOI9gTikppMqyML4lTNSnA8BGGeKyrY=;
        b=KYLSHufYfwyHOc+/XH70H7rt1A8fkAFglnCxvNOd4+7xLeQu9A1KEaIc473UDqpPI2
         /2GW4TZU+OTd2AR7i4/wUdvqO+EpTMXv8ikoPTrSSk2gvruSemvNCe4uTuovib+5jy4s
         AmZrRWVhVdzxnYdOAaa3Q5lXvKnD1xa/ksJfsKpiOjWf1MqfM3pkNt33SvyqsCzQhnlR
         ja7YyLYOujofN8UqifMtcj4k1FmQGV+mBeWoWWzsqoBiOZGyWf5Iq7cJmsd/uYULP6W/
         FQpiJL5xr/o13UuslhH9TME6UbTl7Aje3uSM7dMG6PUIbYtqSXHTiz65uVWvVPG85RwD
         43Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657710; x=1777262510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwj4SJqKW0R6yOI9gTikppMqyML4lTNSnA8BGGeKyrY=;
        b=Ce+gAEKQhbZE4HaKfBphP6ltD1VwcjHFlIqxlZ1el3TTnREcz2K1xQQj97Jd1KqlCR
         wL0uyhZqcQSsze//wWC0sxxeiYVyoGyoOd/eWmDLaPEghF5L3K+pDpGQwd3C54f3wHCi
         7vxdR4gZvWuOGHk3U2FwxxKqtlqGZpk4TBcgLDnBsKaApyZzPVhahrlxD8d9qplvroUQ
         npcof9HMaSs2nPQ3ydLqjzi6BQng19VDj81QjYCLZK1gCzjpSopq6wjcUFRR1F4mdY0K
         TQMFx/iT5IVAPq9uJyiOKqqxyler1n7WowH3N8XIE9t/DEuMT+Cn7rX0/OeS8ndkCnp4
         RFEw==
X-Forwarded-Encrypted: i=1; AFNElJ9WCBlhQUJm8QT3dezR8SrEA5lx6FlUhFTaQ5fAXDv/jWzjh5BElgd7Int9VXCyhYMRav+A8ReNg0TF@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYzNaDYKrKRLtL3zKkakiaEKOzXS9K/pEzNqMlCJ7KyufIaaW
	bujcsGqxxD6JXQCpKdQTp0ZfGPq4YOP8IdU5MOdVGDVSKTCuAw4hPu6wUNSwg8thK3BYxz0PKeL
	KjwiYnBLNivz1KmbvOQtWBm/Q1eVrv1n4BjGUiMRMoKP2APE59FcgxltR4yjhAElp
X-Gm-Gg: AeBDieteXdExkxGr1AnC83kg935368lpHZg5+LW6qjXCXCqNxARHD+fLMP6YBId6KKq
	pqQJF/XOijAT+kbyNV8R3WAzcMJ/kC6JrdWvMAJ8qOie0XZY4QmpNFhs1Fq9+g0sWsSFUC35LRW
	+YklMSzUF71NG3c36foo7I3+cq23E2S6DI+P7jHgQVfRYigxZAcz9IhXqUMmo9n04DR0s0sZJR0
	7aN1vtKH+7uChZq23G2DAPYQ+Cc4sm+94/Yi+v5/3M3ufGPhwdUeGqDCM6qfQlyfj6CwI3x1uxQ
	O54rz0/9CO42iSMIi1nGLjWeKcp8uwk//FyGBacFQIWefTP7wjP3Fa/fTctAMCEK0+HpVCilvjn
	UeEGGyGvt0wdJran27DUuWHQv8qZwWvHUJ8XIUbiE2mlrQygzLCw/lN4JNnbp2zSPhN4lBdpXzq
	wGnKCP9sJB/s1c5B/F
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr5692622eec.16.1776657709972;
        Sun, 19 Apr 2026 21:01:49 -0700 (PDT)
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr5692603eec.16.1776657709422;
        Sun, 19 Apr 2026 21:01:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13067693eec.18.2026.04.19.21.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:01:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Date: Mon, 20 Apr 2026 12:01:41 +0800
Message-ID: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ynLd1k7-jXDcUgsaN3qYIlWECnuag8nT
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e5a52f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fGUInmM-9dm275hkU_IA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ynLd1k7-jXDcUgsaN3qYIlWECnuag8nT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzNCBTYWx0ZWRfXyzCzJ0fnNoed
 qEMJ832qq4S1sopLF7gEJhV05ySnga+DwMyKCwPnDMVw05w66WDz7I46F55qHYqItV3A15nYbQI
 pJNf0L3epnFIN+23d1OxaM+3aLxUlvY7mn5I7NV1zOz6V9aOLFneFbrDEyZ7V6LkD+VG+NIIxpa
 /AaZJPsQYnfGsLzGfg+LKoV3XQXq7P8x9nub1UHBB7RhO1xGCNGTjFF4P51v1nNHT1LfOlFk4Z7
 gVH8pH7wB/2+rcWFVwXwaBGnX9vk00vYWX+41cmhKLWaBEFFrZBCtXJAgKyInNkuoW2THDhT5ww
 Q0Pe8IWRILa2PAF5mWrkNnOA11WbYthsuB/Abh1OOzYlbAShCGIL9fL74yDxwYRQvweEnk8vsoL
 ldIsBmUv8kDaqPn/f3J5iH/4C/aJb8WJyYOxTrtKj5ot8Bsc5edo2nOXX6frRG3a3WYbnG2z91J
 94h/XkqkZXrTjaNPgcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200034

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Inter-Processor Communication Controller on Qualcomm Nord SoC
with a fallback on qcom,ipcc.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f5c584cf2146..0a86230a2b18 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc
+          - qcom,nord-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc
-- 
2.43.0

