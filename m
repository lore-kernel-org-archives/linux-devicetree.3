Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BE3AA4E0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748689; cv=none; b=bMq6E0EzXDO3cNEDOO2Xyddjy5WDGxsK6/GFj5XlqIRoHKTyFy5LwagJ27rT9cmOKRmFt+xv+I92p90t6JU8fa+/kFoo7ch+/IyFU0h21RM8mT5+oN7vOxjX7O46SKExeVeppH7pZimjps9v3xeQk0cTr7yVPke1DHU4aKgI7N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748689; c=relaxed/simple;
	bh=P8OINev2x93ZuUDzUinVac3n/NjJyFH7KJtHlqbL0PI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gtDaO+NdQQPmmTjvug0wViZcZ1V2CJtIN1o8GG63q4xOpRc9bkGBrmKds27ZVoC8AMDPLJSTbCVeuvhKXmRJYlrFIIG7c6umAQlaS/qupL2k7czW0rBYFKuZOGMNTPnli2AKoe91y28S6LLH20MWGnPjTXxrtla5fhLGOMG82z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRJmEnvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRF819EW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRJmEnvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRF819EW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SGP8250822
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bBiNC8k29fjjbs5/Yt5fv8Jv1zOY92MhFQm
	QovIyUHc=; b=mRJmEnvxTV2z1HBN07Iw1y/LYwAqIjuDL+K748e39kU6D2+XBoX
	QL/fgDKbS2bfR5Fm074bEHhBtAqqLitoob5YoBzPOUnPCaqVeTrShrAA1hpzizI9
	FqdAf5+owe5KYMcSZg5wYVu1gZECKjNOFqdUdEEEfamid8juMs4GqO8JGMjwVehP
	Zpln4Hf1g+4eLiNTrBd6l2dtt+O7srf1byWXh1lIDX8k0qqwG0MQ9+8MrmRWoUmu
	Xzr3syMBj97UjboIIZ6ZG9Cb/2aHeeRo/zwOprRas2weHLplGBtIiqNT4eCmdqHu
	FY2H0ZjjpU9F2tHveOvGpHjmBih/zM5TzeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd8r89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:18:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso30944091cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748686; x=1786353486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBiNC8k29fjjbs5/Yt5fv8Jv1zOY92MhFQmQovIyUHc=;
        b=iRF819EWc+b0eQCWuiMehbj7VYCqmtQrRzqqt7nkjCzLwFWljwXhr/jX219bkDAOe6
         I7eDHruXTHIDfDE1K8lnRVK8sLLyp6wsL4Ui7G95mCOwkTPsiphdSSk6pIugHaG3/kza
         j0SIKzAx0GSA/BxEte2YYfJiEnfEAITP9J/sJUJGCx7Fu5jKpKpzNmirpXEuti9HYA2X
         QGPpooRjzgrOJ1+5MnpTRh/XACaXbU5J+Q1+Akgy9szRfI4F/J7h46jAmsfa3vGtT+Jh
         DcSWjLKx/w2Wh7ouTvpNxnwWDNpZ+Bhb9dYav1T/sForOD7+T/ESK79+LuoVnjAjazvL
         BcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748686; x=1786353486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBiNC8k29fjjbs5/Yt5fv8Jv1zOY92MhFQmQovIyUHc=;
        b=Xck5xDkjPSQRztzPloSoyuEGdxOdFfKDJ2SLIxKYJPa99vNweeripI5ZzWf4DO5X5A
         tFv44u19tQo3YE4K+7a4rrYBIknN1qmh5tdJc5ZtWjvwd2ViaMjlftYCjlj9wJDCwpYd
         ylR1ucuuIa4RGoyPwm6MhA/Dip+5lomIQ+koffskyINWjUBlI5KZ6bG7aa+qdy/f3CSQ
         DEPCl0n2/YITACLkoq2p8wjLkwcZfdSpGJbtgZ1j3tN7K6tpq32Ns80U8MBbuheM7R3Y
         SIIuUvQ3pmGBoKFPaDkaZzIPgx/Jx/Ol17/1jp5d8rVbp95rgvpHWNU/GYQABQSBzRS8
         No1A==
X-Forwarded-Encrypted: i=1; AHgh+RroM575keAtD09mi140lRkfOa8q/qbLtW+FRquZt4Yd9l4hJmv1C//ZTHDRPlTzn/HzqxCccJahiaAf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sc3SbmnOYuK+edNP2jV9kFOj/Rnzsab7QzJU8kp7UZ8El8Gh
	Op+QxqYUoWlXuK5kh0IIog/60wv17XwssktOeTX8c1qwLGMVrPffx0YiqvdwyDRq/O3fpRbZovV
	8hm027P9A3ycZciQV7WkUK3vQO/AonBFgU8WLnlP9aEhhi37Ce5jTe4Ns6LF2Sek5
X-Gm-Gg: AR+sD11/J+WUVhxtAHzgnBNCAUuQAoPn7Ci2yyrNN+plh1d7TBp/EwI6Kw3HK/Vu1g0
	x/KhyH0DlDl02MJzcapeGziynkL8/IjZcEdO8zf40ukq16jRcB7k+6cufZICRBsvpiJILPVvwL8
	x7WMeZWZc2AANdk/LVMYlEM783R7fM0OoCAp3KDipU2+rIn6j92XD9h+k/JVpBNXbWRmNkFp7eA
	Pbl3W0ajcBVgBdK6/HuiDlg7Fe7Sy4xLXLPoWYumMl9k3MeK56GofdOTXitDJ8pvjnWwkzVvuY8
	Vqw26EvmD16wGLof0owBrDgsHACMCbAQUgWIGwXPP2zFYUg/618cm8vFeTu1gPxMEMa0xfDL6o6
	PVc6qxxTjK0PIMwwf
X-Received: by 2002:a05:622a:181c:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52b566f6f4emr173101151cf.5.1785748686112;
        Mon, 03 Aug 2026 02:18:06 -0700 (PDT)
X-Received: by 2002:a05:622a:181c:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52b566f6f4emr173100821cf.5.1785748685624;
        Mon, 03 Aug 2026 02:18:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm30006184f8f.34.2026.08.03.02.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: dt: submitting-patches: Mention expectation about dt-check-style
Date: Mon,  3 Aug 2026 11:17:59 +0200
Message-ID: <20260803091758.232633-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=P8OINev2x93ZuUDzUinVac3n/NjJyFH7KJtHlqbL0PI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFzGhJ9QcglcleCQba8FLPhUYFguihqBZkDEe
 FCXNXFx++6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBcxgAKCRDBN2bmhouD
 19A2D/9USbvsfVMuzeHuAQr7Kxa9nejRlmvbCDp67OiSsQxrt3S5jRwppd/30LdXVASAlGvn+J7
 gTnfs4H/HlS2XZBnnJu0AJ/r5UeAYnsLVKohui96qngCtSlNTVfGrUvHtJRLPP6nEUKLBhQ9l9e
 qnRt8q+/rWJk/B74JuILPI9S5jx/sQyzpvosWpqOWno8BGRhZGfHg70fYosm5D5J5XnG2rxnnA5
 i1DUwb+VjHrNpTX4wQlI0yBMbhdTXlZApkzpi3lh+xRHLdTv9EySlcRo5RfBQCrVCV/8aMxcPcZ
 OZEvyVTE57GWNRdJqu2hgpX0EL8ewDhV/mBSTE+VcsTdiAsu8F5q+2y159x76fZFf2w4JciDGXL
 DN+3s/HJiBvkUpPOsXpeehkjNVcv60O9jf2GR6jY33R1Hq6I9JasN3wonDk5GgDTMqI4XkcYJdh
 fyI82FRomcBgRKUQsLnxmzY2b02hVrPrO+wVDhyqPOMWeUMp7TlnyOKz+D/GBwcbSjQT6M263Qg
 AyM9ZdLATOnRhqZvV1plDzYyyRvbloNe4/CIhfn6SDQ3KUxaczTlwbYeME2kUL0J0HT1IWDnUBr
 ON4hkUrxXaCs5hDUwmt/DLbkSTJycq1Jj+pPhC/psnaQcaUPUthEHoCwGAW4JRQSlTfAWtKxwYE h/PT+nKpA030xkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX/QwCNs9hTvY3
 h4m9l04YLogf1pxvk7/BrC4xw/72RnWv0rA1vb7WZW5ZJ/8T6UYLdxkONOxgYhaPavU2ylAmLZF
 jzMcNA+MkYHpQbEukxZVoZchhVeTw3Y=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a705ccf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zQ-OSjbE3niI0by5iAQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NF8UPn2bx1RHBGYQ7LGjPHx7GSYm7SgJ
X-Proofpoint-ORIG-GUID: NF8UPn2bx1RHBGYQ7LGjPHx7GSYm7SgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX0KhOU3GecH1+
 jrN7RG/52x75phDGga9RpO/1/fjVlFm3B2Dnt+Q9IPubmvUreJXFUuFN1zspO7hJJ0gpfWSL7To
 8f3XbVSoHbJeyFjZg+w6vQjrbiA/Ht4U1NWG4MxxRxSl0Fn3JKPz+DaESpgbzN9/cJApuqpbyXf
 WERsEFuhy8b/JFFSlmpk6xVfHBuoIYwUWQCWY4o8jQbHhzNkbHJkLCr0pMcayfUAhpJoAWwYnbv
 Im/5Rn6XV5nQIcLb32+B79/RWygVHedroz3SPyWm6U8v97twu0vL5m0fwiGxHX8MhtRIUNSIpl8
 kWyXs5z2oHTPhHJW5FuarZ6vFtzOwlESqyoxZPt8BqTO/OPlmLCg+Z14TIvSqms1AEQUWlofglA
 d8UzB5PlKHKfQ9IOmkuy0fTaL5MGb4yD3YGWza0TjhCNP5e3n9HQ7oPbUojAhpEgdWa4OQb8K5y
 1CBSCjULHCZeOSQqRaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030082

Any new DTS example in the binding should pass dt-check-style 'strict'
mode without warnings, although scripts does report some false positives.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/submitting-patches.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
index 2a5533f68830..6b1c064d4966 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -41,6 +41,9 @@ I. For patch submitters
      See Documentation/devicetree/bindings/writing-schema.rst for more details
      about schema and tools setup.
 
+     The example DTS in new bindings should pass scripts/dtc/dt-check-style in
+     'strict' mode without warnings.
+
   3) DT binding files should be dual licensed. The preferred license tag is
      (GPL-2.0-only OR BSD-2-Clause).
 
-- 
2.53.0

