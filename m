Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE823C344F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512136; cv=none; b=cQc1FTtOEm05SU77J+BEFFG9b9tivRdXvTWEGX//tvRDzxWkH7jO/jlz/sWsS1tSZQQ34Emds6+P+UU+NVj7rWP2VIlujzH9NhIgL68DiN9zL9aTsqt7c+Wtx1gI7IXguWNrrn5ddo3dA4pztZUGzQ7lTjyqcb2QbQg5iF35N9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512136; c=relaxed/simple;
	bh=57bB5l5OK8n6o1c5OWSoQFZ2wojidl/jLh0MiaeoEfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WWPsdUsVHSAhCp9cwDbe6bYvHQuiIBYUX2Z6mR51hZImDsnY4vXMz9jGNkuHi/a340nJ5oi6BY3dI+LQ4YqOMrEYcIC/WlPzJnDjxzhEo9eU66bmq6i+TgrtUGC8gD6VuaFkY5PY6OxA4jCEsBQkDKd9QpQrZ6U5HZMfPwDCbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLRo3ZIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKj7gori; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLRo3ZIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKj7gori"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1WC3327575
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2DPijjKVJJulhCP3CCPO4S
	e+11jw/WqYtbv3YoQLPXI=; b=YLRo3ZIlcHPvTqQEM3d1U1lfAj5XKIGCsTPuee
	mFce6iD4l7LGNhhnZCuzVcfsBDh+liM3fdAmTpMQLvOlOmA/TMGtO9xfbpE2jAk/
	3zn1QJIj+nZq5k8sAH0cOHC+1BEl3YKvZu5+6iufZr2kfgyOX721vAeVQfhqegPN
	pVHf+iHxgUm9mJ3iR8DqFv+UqcAPWapiUHzVQpxFXtPKv+M3OLMzhKrZhQKf2HNA
	s+SyqkdvunxT/QeGp3jaycecsQqF/ixqWP1Ksg+F4Nvd2dzru2l4/QzxFrw2ymL9
	Eg0hbmb3Ndy2yNLRzZu79MNN2XsFxdx7YACuFtO3C0t/8ApA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgp8x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:28:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso83882855ad.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512132; x=1782116932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DPijjKVJJulhCP3CCPO4Se+11jw/WqYtbv3YoQLPXI=;
        b=CKj7goriQsUpsyUv+HWjTH2o8ju2rMR37WY72+O1M26X30isAClkuRSzHBfDXAPPia
         n00F7j1RAY4kdMkPtgpEuaXAtNqvM1k0eT9x3Wo4T6XsTRUiOktFe8s9tuxEzlrTPzu1
         VHdOhiCXoi9C2OfJbV8MnGhgDDmJbriK7rOxwrAdj3ro48LjLjcPJM0oAszlrLKTtggY
         u6WFuHpvqacnyAaIxs8uS/f88DWbpgi8kNBloDgiTuSrZ9FEmHZyZvSimZQTPaeTd5/W
         zPBqc0NwweRbeqVMf3eiI/tWU9z3O/92i5uuU5O4LH2SogWTCfr4ja0yjiIyhgEYQ5hv
         tYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512132; x=1782116932;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DPijjKVJJulhCP3CCPO4Se+11jw/WqYtbv3YoQLPXI=;
        b=BEaGTp02ssYM1UKz4G+THEq3Y3VZOjWikXie245yT7WpoRdP/iwA1oMrHrERnuvbBg
         agcSEnJmjuJtjpU64zbj60w2bLWRdeyZESneIwWDAGzPpOdirNfkGxOCLu2Dlifo31x2
         m2SBV7EFqmqk+zOQAWvP3LeonyM8SO7NdvYX/xEBd/2LgKbGbeY99oVN4jCndV148VYk
         mCC+t74qB0a3rIrev9wfy6II6Kwx640Jgtnz01JbreK5aZwcbFl6jEcdrPQ7EWnqRE+J
         izVoC6ahfKTP+GofeqCe6doonwPmDN6uqM1Qqj/m9PZg6QcijRftcunPnjN/BuYCrufP
         bGUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CJG3cMFXs7ZqAIJtSzFkxfFiovGq97OeZAk4CCZEIHDaccuu+XNWnQZuUEDvhQJ4i57GvaO8pQ069@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTGSiybFCjlYyWGMtmqUHEZEs9uPY1iucFNMf7hPf3x2Pnjyu
	xul+6KczDyC1vWjLShw6h3Dgkq0zGJniRZg/mBq6qoKasMzG0ooUBhV2ep1vNPZtUr124Wucb4G
	PjuFlPt8p4vkGChY323uw2oUblzcYnEulAmW/o1/mr3m5mdxJFTuSG3rxc2XepV6t
X-Gm-Gg: Acq92OFjMJlvQ8SESLWXPA3gnI4tFf+7NvhnEer7qucra+aTaGkua0eWTHbLfdxE+3O
	sI3eapsrVEslaR2UwJAo4O2k9gGNf//OBAHKPEDUG49Wa12QUJZ7jqKQbdXGfqgDKAOowbdBOe0
	2wOQaoCb5hokibHFuarPZXELoPk4DH6AqSb6UX7pOt+Htf17qDZfT46nWDpRCKmqyO7VFCvwnk5
	TzPJo7zVa32ekixjzk2yGHjaJvy5AA5xoVK/rEAJoTlGaXMTh60oVYL0iWAHDeZlEEqRaG/M7DX
	h8YfE5yM+W9qGBEGeyY/7aB+pDdAp0ICvGKwtTXmaWrwMCZy3C0k/QD9u49/tdMF6tXEv3G2FCx
	EiXdzkRezgdB+GgXZeodh/4lcM3nrvByRG64FhqKM6bt5GOHiJnkovRexfCcMROnyJZjG9V6N12
	7a5RofSLJa1MrikbU=
X-Received: by 2002:a17:903:40ca:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c4109ed48bmr145622575ad.1.1781512131846;
        Mon, 15 Jun 2026 01:28:51 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c4109ed48bmr145622355ad.1.1781512131469;
        Mon, 15 Jun 2026 01:28:51 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5565sm93853825ad.1.2026.06.15.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:28:51 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:28:37 +0800
Subject: [PATCH RESEND] dt-bindings: interrupt-controller: qcom,pdc: Add
 Maili compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-maili-pdc-v1-1-add21e8eec3e@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512128; l=1087;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=57bB5l5OK8n6o1c5OWSoQFZ2wojidl/jLh0MiaeoEfs=;
 b=Im43CUcZ4qa0YLzPtSN8CUqPz5NL9iuaZiaWPYbQLNh/MbGXn0KUqz0LhmkfL7VyhThyAm4vh
 jQXJeYh8D2JDgFuA5zM90tbqV85Kn0/01EwGVK85ojEitMj53AHY5Ik
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: Rfe-Wg2-EvJjPTTeBr2dtzPvVDV2YR6-
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fb7c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0TWJLbmp6Z9Bekl7B0cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Rfe-Wg2-EvJjPTTeBr2dtzPvVDV2YR6-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfXxXwrEwngEMcL
 7vCPF2LEnmVYCFtbnfYMcIGY5/1Fh5oT8VO5AL254Oz7H00AkxELuNiaPbWlxxzSjTygv2oYHqQ
 pKVjQ8rSFoZlg39f3sUcXgqPiUvtCmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX16DAyjEOpoWw
 VZekvYbKJnUbIL/iyRr4UhqMpkZcyYJvKteio7sbIIsaSt6K34qMZ53wGAXuRbTTnBdZqUIRsOA
 wdy9dPaqiU7WScFOXHTj8G6Tl+9BGtdDk4YOip7rpU0gg1QlX0jdtt7Ti+S+3BnYaGOPuf3jJyQ
 XWSiRRfAeRYG4h0iXDj0gPZiXKi62AdcK441u2Y2Ps2aPp8o28LonMc3NmfN38KoBRyyx7NYOBl
 iJy7NficLeBW9i1YE6W7oVn0JOB40GdW+lLh+dPmaeSQPSSNpoPZ9bTeImJ6K69SLIf99eduWJ+
 Fjvblnc4BdnsVs2K6ZNaYNP1KvzVcLLtyavJTi6rI4annn+yxMplEIyrgvPnbxhaaj2ISibubKf
 sFNyWddOxVvBMdJrZtipgNZJq9OJFeaU6+Rk2FmY1Igb1T+/gFGXaqdqjvKJqjdr1i5ngfsspIK
 qz/Wn4pQN7sjGvdN2RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150088

Register qcom,maili-pdc as a supported compatible string for the
Qualcomm PDC interrupt controller binding.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..8162a49d49a6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260427-maili-pdc-71a488a96973

Best regards,
--
Yijie Yang <yijie.yang@oss.qualcomm.com>
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>

