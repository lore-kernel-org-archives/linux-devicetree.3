Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A73C5842
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512232; cv=none; b=scGDq8OhSyQFOolKHVUD6ntqZSzLc0gPwuO3SlPJM8HreY/qAo4c3RbWYqX9aEK0qw/Cwqwb3Skk0Kib3lMkgcmcYquTOowPVKmHHr7XguzEjNlBlsJvBMOr/Motk/et2lnyNSV7OXJ53xq+PdjA7g/QaMVaeNIaYpjNxM5Ep7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512232; c=relaxed/simple;
	bh=psRo9I9LgYzHuhS0Zxp6rEDZsCh2X6Q72/SFi+8RLY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JwRDNRNEjrkz/5FUlCFVG2EsAk1nIU/XZ4yrIU47PESDYcZFG8LNbtwMhe3NTqJsR6uK6sVCq9Vk8Z3fh9AMMA4qmyEyyuD0lbUGxTH43cNZbL2bFN8y4pTgUSnOrS+M7RnXSB0Wrr2lbneBGNdJe+z2RXbmavtEgmzwSNrjDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr5z36h3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLcNYjwD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr5z36h3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLcNYjwD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6L3Eu3888561
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F5N2j98u08uOVXZXP7ZVfr
	yLKThl9JN/WOEyxMeafXk=; b=hr5z36h3E5+yLOhiRUlpcU/3XQUWfGEHZYogG3
	/Wzgnq0J3ntzA8LO2kZbbBTwwJAJ1WAipYkeHN+lcDWuftUfbTmUbLJ4yXOM8VI6
	3V/7pGuWlfwmTRF7nCR9/dcdG6fd+b6+C97olHwRbacrh8oQ+7H/Lzxqqq5NDimu
	WrzbRPUZ8RRBRUv/g0GdKKJdPvq4VmcJEFklLd7Pv8JNu9rs4nPtUFYNw0zfq0Y6
	UwrD2wl5oQ7NE1EKa8qUMTf8jXbX91vDx8OQPhmRnlbASZfeSNkimsaV3l8HEQBf
	hqfWJ59v05mMOexJe2IBIu7zeagXKzZv7kK267iLC7HMjA2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxe2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84247fed609so1676773b3a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512229; x=1782117029; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5N2j98u08uOVXZXP7ZVfryLKThl9JN/WOEyxMeafXk=;
        b=HLcNYjwDMjuaStaPS6z+JmTdewYv8QLrz+/XtGMjoMewEJe27E0m9dSagfBWKbUl0D
         MsRuSnsU/rzYdtDs8D1bho2bAlXwdE6gu30cj/LLx5fCFhM+6aqyCojLdBxw9xF9RJsO
         vZROYb/abk6/kJ3x2xqGFclYjvB2gV/U04XsKXSEpOk+oy1aemh+oqetSOOmPvEa3+S+
         SoiIUxDTsOinYkvtQijiv7iakH8UpKvKMRyG5TZ6MuuO5EFy8PSwa+DhA8e10wf7F4eb
         1CySDFc5Sscwwo4FK4EtN/z6UM2IaovGYkq5jLBnetmaF9iGxi4jozwgIHGeeDZ/50ha
         egoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512229; x=1782117029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5N2j98u08uOVXZXP7ZVfryLKThl9JN/WOEyxMeafXk=;
        b=qJfsqzNvZshe/6qZfAWOMiCdr5SWgyCBwyONBiAlGuuEPa/9rMwOJfUOpB5RkyhgCA
         qXSisSJoiaa22kSTMcy5o5q7Klt44SnK2oRmaKJGn+geIETLgpZVotfid/jZ1j0NhsUl
         DnjK9hyTQKIv3R2CE3y7xeK40wdKvgXCtqlYvom5LBy9673HR6T6Dgg1iRdm5Z1gWfAi
         y7Q5rBzxxJL1uU9YUMDQ3RbOkhxzIWbCgfqSeU4YyJlVeG5kRp56H6qFV9XWun4EXoG+
         maLhR2+SfS9zFJ85ttq1BzyT6AmOzTlX5YJ5xJjlnFILHUU61Z4Jbu9994o1YOQanDSw
         Y5Hw==
X-Forwarded-Encrypted: i=1; AFNElJ8O+Oh/LIs7d9AF2dsb27PnsJSQIA7Ip+KN0X0ekFUuom0eumNlxrBarkvVSuZ9LAB84R96g7NK+NeS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8GL7DBK0X5fmAXDvkC8YV2sv5FNeFHM4T/Um9ZcrZY0fEVDc
	GVz+ueeRFBbiXWRgAuq/uutWoOJc7AP6aY48inm4Fu8ZMS5awB2knsIR9kz/dJWZOoDjPBb6Ohq
	vq+MX/HPeXc9Ib/iCRjpYkfJzSfM22cMJficsvTistcnV+kczXaQPYT/W/x0NfZgDo8jk4crynf
	Y=
X-Gm-Gg: Acq92OHs2GYKPYoSAPm+XjVpESs/qqBzcUdq2ACGy+l2AyHZbl2UGixyxtMzXoRpeJ0
	PptjLAj5a81y0zHbYeF34cW+54IPVp2a97t+/KSipkGCNTqj+LWerJy9UuD1wZJU1GAZxx2aEfV
	H5eh1yCduE0gmfIUUVXsZ2NdbGD8Ni0iRxwi3zw4dWClJjKbuPa9mK4ZR39ElPnefIGfiN9ceJ0
	Y133mmvY6NuV5JWjB4+RdmjSv6c7fm3539J+XRf3xD7wYV1wTy7kxH8vV6OYwZdTy9fi7jzVmNr
	m1udpFhXxik+o4FNOU5iJtOdUgaBXcRSEIqBKvcbwki9MCWswoGN5yMCSn0J4ONd3KsG2LGH59x
	ijZW6rIjKjYjg+PMymofB33fHMIAYB9MafycprhLEjuJtSQfVVkTCMlv0jOU4x55k5AVRuKk0m5
	TEyXlXmXurIYh9J9Y=
X-Received: by 2002:a05:6a00:22c8:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8434ce42094mr14205001b3a.24.1781512228591;
        Mon, 15 Jun 2026 01:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c8:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8434ce42094mr14204972b3a.24.1781512228128;
        Mon, 15 Jun 2026 01:30:28 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm10075239b3a.37.2026.06.15.01.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:30:27 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:30:21 +0800
Subject: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Qualcomm Maili ADSP and CDSP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512224; l=1901;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=psRo9I9LgYzHuhS0Zxp6rEDZsCh2X6Q72/SFi+8RLY8=;
 b=Rj65ynsu2FRjFpXQRmXgqWXaFD5ifNWAkaYnaY15Ueug8987ZtETacjkAjQ9TLfJHoV3n/baR
 YHGRA0GxedcDF3CJ2tbwfOJgTeiIG4KLnNXKCtBOYlLdhkYVKwWCSqF
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: F2rzHK_y18PALD1JVcGYrDvJM7aJj8Jf
X-Proofpoint-GUID: F2rzHK_y18PALD1JVcGYrDvJM7aJj8Jf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfXwGMGTrMe5Xqi
 ESQqjRHbR3u6DwvBNOSZ6gRmcfH28aLCaDlKHbCbC64naWt9Au6q7KaADg49w6yEWaKb6JfRBsW
 hGl/acNmShfLehzsj9LrbHwtpcXvVEs=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fb825 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NyR1cor_mINAUlzJR3sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX0mY/qxBOPGQ5
 uqF35N6REC7MVgLXAwwkVnu40nxCdxPkzVNXLajQRusUZNNMhNnczmP1PbULhMVRB74hIRjCWYH
 x91n9CybLsBP4sZfKDZhKPrzgVvWSXB/5F7LxgSg9Pk9VLFuhUx4voZbP9Jpu+PuXhve4zN51AS
 HZNl/P/K3EOY9nRudYbIHoeUrwow8gaSsuS0/F86T2xVTwRdTn/e8VGVhZbSldBHNcnvG2ifpku
 nAW2Nqa+itvBQhm+k7Tioz9r64k2RmnWb5XEWuoyp0oWAqmm4H3p8DWfDERk7oZ0S4sJMMVi40I
 3I0MwBiICxpj2t5VSiGA0+zGItgcofSBpz7IMj1h2hh9HpNCE7cvjA4zYalWi0MhXhYJFsrpsXj
 KW5hGC64vc/red91M6JZ34Mw2bQiztS8WIOO2i26MVTusp+ywWHUsqfnTFTQ7HIsU4SKZadGIOO
 lI9AKemd/sj/Td+ZRbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150088

Document compatible strings for the ADSP and CDSP Peripheral Authentication
Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
SM8550 PAS and can fallback to SM8550 except for one additional interrupt
("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
not managed by the kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..ead7a7d68f59 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -31,12 +31,14 @@ properties:
           - enum:
               - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
+              - qcom,maili-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -106,6 +108,8 @@ allOf:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-adsp-pas
+              - qcom,maili-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-remoteproc-9eca14b9a3ae

Best regards,
--
Yijie Yang <yijie.yang@oss.qualcomm.com>
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>

