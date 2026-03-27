Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83D3BC681
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620876; cv=none; b=a7K05YM3uxvbdXUnUYkOAX7e/7ce41T/YipwvKEhs0tIHEELhAciIuBUk1d2dqagZSoVKdY0YQb+eEii7U3FKktpsL/vSFwL3/cxI7yL8NnCrHlzlY0+jahMEzUQDe47RYl1syXiZ90jNoOrj89NkBVtpsEh7Z1NIJje8k/uWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620876; c=relaxed/simple;
	bh=FffQtVemK4+GxuPiabXgNhdawSo6PkG5NaSQJbKynBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LMJIr09gyG/ommFkBgvH4Plx4gtkRRPwVUQAh/yX9ld8w+SCKExws2JyuLAYUFocdA6h9ZMB90rHmUgVZIfXMprpU87h2QCKsIGm0iALGgtSXOg4xK+fW18pEwyMG0wehaJpOzA4DUz2N5FgqS4fhHP0tZM8sCLG4sWfMhpUJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3Ca4B8g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KovpBJme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3Ca4B8g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KovpBJme"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHif3084672
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CBGpQvmwcGg1GnuKnAy2UQ
	+REwprmWMOKeO8PWhJsYM=; b=K3Ca4B8gLDQfSTmf4Y4jx1pI5Ljlz3vazQf7tz
	9ZR+lT7qaNLMBDDTkBlEO8vNKfXgDVeCi7ZG7jU5vgo4oJRRjp9qdzoAcZbmNISR
	Lm9p6hrzJAKaWWMG+yz//rSmXKvFmTTtDmDQMlaUgr+MOjYEWzeR3/pXNbANRaB8
	oBjz9cI29YMYrn6g4vFSPCWUboFNIu7EXzjcpUYrq3VjoFHy3esqBd+vauSfUAu+
	tR5F50deSzxYr87Mxb0eSsrD9FFNyUVC+C8IdVREYhOtDUzwXXaT7XRLtqDCFgA3
	65+gcXSrSZWV+wRuY8VKmVDJeLN1+m04PfmyIlRXj42C9Dag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn11nru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:14:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso61498891cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774620873; x=1775225673; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBGpQvmwcGg1GnuKnAy2UQ+REwprmWMOKeO8PWhJsYM=;
        b=KovpBJmeSbHKJ9D0TVhXrh07J727zuTqL/XnwvU4qqz2r54TweVhAigUJKKbRCchcE
         4OZ8FcTetZr90I6nwixmiSC2SSowDiWqNOhAYxqE9cG2j9M0G6mE+v/4qXtiXe3sekZW
         nxpCjC193tLG+bfQ8wwAbGi5YBBdDhlfCy0dXyGnpTtk1Rfn2BwDgUuq4sTwrkilZORE
         6uFHTPk4DjnIcIjQE9lSoDfz7BRCWdoTzPFBXObig+p41OcRxmVz38sCCcsVfYjGOJCz
         DOL46Qg18GnMz9ZPIhClol1bLrnABBiGBgg5bn2NcD0MWftAnm1vlkihVQyRUdWiBco7
         z3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620873; x=1775225673;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBGpQvmwcGg1GnuKnAy2UQ+REwprmWMOKeO8PWhJsYM=;
        b=iV+y9Xct5phNWG6P11SDr8SF9ePWZTKU0A1sNWp+VPQIruD1jZLw56IdoQmgG9CPAi
         EyacJBHk7N+wxQLLSByLCAV2lB3f37RrsUKQS+yl4ew6NN9SQJgGDH/vtT6sqmXgAM1K
         iUwSpiC9zaEse5i8Iz/NwvLhlZ1ee3e/j4K4jfvSyPscgbXi4ExLuM8sfo4IbAKc6j2G
         kko7tc+ZIdAdhBcbUMrEl5T+ze/fbIPLz8ruQ9ZIoLifD5uQ9slumRsqi0MRF4bNKEMo
         Wigx3g3I3cIYSFAVtHcEH/Fx7JtSbEb1QinTXSe38bZVq03QILYnpDiwB2hVbmgbWKby
         VksA==
X-Forwarded-Encrypted: i=1; AJvYcCWiQDa3YZlgnlLjWKwH1RQv/zvj5v1RSigI+8Yx33mOcVvKQJOSUwrpOFSjzwammnNuIhyo/1BICNny@vger.kernel.org
X-Gm-Message-State: AOJu0YxEp7MviMLJOIGpfdKmr0F5VTUkW2MyS1d4bczJr1WQ3CMKrDjG
	cuMD4eKsElaOfK48XNl7EEE7h9Oxssiph6MDX33Hhuq9oo/wWxIluQau+dLYG/rxWZeWPft9+Sj
	VUb794zcdfbGzVFh5F8Ahyqz1KLtRoenL97fNeHF3ZQCASwL5A/9u/sHXPqgSqRwT
X-Gm-Gg: ATEYQzyTP/TFiOlX5xA0QbQa1yvVWcfDO+HKv3jopRc66DWJ7etSWH0K/wLknh0idPT
	JvbLEbkuY+elKvr/X92BdWWlbJMXtQDWpTkTCPyuz0btoiXsCvUNbcdkM7N80tPjM2WM5H1S4k2
	bRUEiGxH2gdHnyxyA7kJkTdhkwp+EK3Fa5tIh60ckM/Uoj60CY+WTsY4YulE3SbyHKAp0dnD2zh
	Pmc3BMHYVL2VeEB0B2B1cNb585hdNIs1a0kH/n2dIEVfkYy4FDsT+vRkoPGGlEuaiVqUG0eWUoa
	DbZUErhMjx6NvjjcBDIQ0ZYpO9xWLZPfauRf1MZHCSJV0Ga2NOe50oI16c8w0COrvmiFwd/6kQ2
	IvkOVUaJfwYlAbadqh6CxJgeVZEg=
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr35435221cf.53.1774620873255;
        Fri, 27 Mar 2026 07:14:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr35434531cf.53.1774620872644;
        Fri, 27 Mar 2026 07:14:32 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm191174815e9.9.2026.03.27.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:14:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 16:14:27 +0200
Subject: [PATCH] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMKQxmkC/yXMQQqDMBBA0avIrDsQx6DQq5QuTDLqSEklU0tVv
 LupLt/i/w2Uk7DCvdgg8VdU3jGjvBXghzb2jBKygQzVpqIG+SVri05ikNgrTsOCPKsjdN6GQKa
 01nrI+ZS4k9+5fjwv6+xG9p//D/b9AALQRfF8AAAA
X-Change-ID: 20260327-eliza-bindings-phy-eusb2-bc4dd201444c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FffQtVemK4+GxuPiabXgNhdawSo6PkG5NaSQJbKynBc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxpDEtPdOv6+1gfvxnDu3hoLjI7ccgr+y31kGJ
 D7ZEunASWqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacaQxAAKCRAbX0TJAJUV
 VhZ+EADGaluTf35ZyOzsEvgpReELDDJiewkNTKYwIAaEUFTKndlR/GDYRSgeLt5aXnnLEHHgfID
 T5RC6z8gidB10d9GI1nKg8hIjxwu8iU1ZE0/7PwPpDXkiC8xBESBjf3Z/4iAy6kfLdyeouEjI5a
 kM59d2GnPFZC4VOlVoZl02kAoFlopPHzqMa+MwQ1rpXmcQQ+H9vYBNbL2laeRT84FYEV7n0GTPs
 NVAoUovd8oMb6xB8YYF1BWyYUDW2Odf0qUgVNJ3tEN7c6M0yYPfjHYhgqUDdnN0eaA0K3YzBt2G
 P2Pn/QvDeqtrcc5+lNdkxLW68HWHX7ml9Rhe6fE6T2+HF0856DDmcUUdGl0g3cgIeDpXtC3z5Bw
 7Fh+uvjrvEks26nHZ+pVblNYJPipegkkG+1dv85NHLygvaBACY1jfhvB9NrIKNq6ewF/lvSmhbp
 dKcWi/0FBq1XX2D2bjPfPQDMkjRpyTSQAo1LnNxA06pDsh7VYwujBmMEJ1GF6pTr09/JIrizFPV
 U/CbLTmeVXXVDRUzCYDP/2U0Q/xEn7I6Ib/OzDKdV4PQBmeH4a60YUfKL0hkMs0fjuWJ8Ws50LB
 Jn4oWiYbO2YYjI4z7ZKL0Re0H6xBYFLF5H5CPeF7MYCtID9ytcuOh8k7Bgsht5EStJQQdRXrOBq
 OXdMtMk6zJPpgJA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NyBTYWx0ZWRfXy+tOmeXJSnr+
 4HEgtlVNgtYk73vGKvUYH7yV7uAAJGZ833JhkIkqEVvBH/wkQDBWHPFGEHeyaUMhWQDprFXnqzU
 ZB499O267fN6mESRXajgAEPyHJbviqlGVuLzfd3x1Xa/b8YwMadcocZDvNa4w3YCEvayGBmMWzU
 OjRqGz5MNkZQ4zd0V06YyO6slMBFo8snV7DKNjdKWiSqsFw0fQjJ36NtTOUx4JyeBXAP4xSMCTT
 Fr5O5S2jfvc6Uaw2QTdzLjSqt0lee9Ni9Quf4+NpmIUt0XRQsyoEvgbIZ3EEkFFN1+EMpkdNR3H
 CKFj3nHYb/7SP9M5m0Jx1CriJfkvE+tJft9jDi/rwRD7h5rFO+pYsItqTcsi+mD2VIGdLnkHrZO
 UN/iqmvu+sUAYIlm5/WRlpwE7lVIrTyDO/F/EoTVW+8wktyHC5U6fhf2LcB8ns7pMB92vm+3+5f
 frLQiQU4MApLsdYJAIw==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c690c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gb61f_RGkQieOckiKckA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: p-LTZvipTe0dXTw3pqTLLAIq5IKCGR1J
X-Proofpoint-GUID: p-LTZvipTe0dXTw3pqTLLAIq5IKCGR1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270097

The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
one found the SM8550.

So document it by adding the compatible to the list that has the SM8550
one as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 854f70af0a6c..096f6b546632 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-phy-eusb2-bc4dd201444c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

