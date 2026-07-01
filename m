Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D137B03F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924675; cv=none; b=iWcskqWY/K3/SYP2AHB+e8fXyPpVYhoKt0fy54i/sxYn5SrZk1juy9/DppUVj5KcvOb2212L54csINcjy5fCG9yoTxyzdOiMOMfkenhN6CLawTyvcj/c/jdjGdPep6qLi7nE8KWGlUrtEfNepSQscO/BGCrhJcbRRsrSJu61jmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924675; c=relaxed/simple;
	bh=TR7+IEJuNG0r8AVi72eMbaZNHEWCYm0qL3Z6EwOAclM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lzGmqeOjGe+PRAbN2l6kd6/4ibRdsQIYvxUJPvYmHqFQttNKQKgiIZUnp1oNToaYn7COgS90Q/NhST9K8S57ujz3hPTXR8UYfrn7m2JH6zTu2K178w7blgYmzQTYvgZFx6mzXzr3R6scz1YaV1yEcQw8SWEgy/4LfvunHJfjvMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej5Xt0wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqLvq/rn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej5Xt0wF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqLvq/rn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gme911630487
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mQA1MLuVYmC
	JM4wnv1k9JMDKSdRHRw9JwbkaWYSTWBI=; b=Ej5Xt0wFyAbaFoqJQZLpIovWyvF
	/guTk2rgClaNxQangJGj+2xMaDuYKaoh/1b4V/pZdMEesCOik4bS8MLWm/xxV5lj
	1kfiGvw8BWuiDvRHwk9+jC3w+XrO9P91rxc/fSXN4H53YgVZ3qC07MEZaeXYeIg1
	z1jcAWC7kyccUTOIboY1zOytH7RLHM4X1UJUTWigbpT59Rq95pB8PErubZVNLKty
	plEmGczqtGPD2wo34DbeZyWYXx8mxyo5B7yO1P+042cEuyTIFXFsdOtyLYS8fZVB
	TBArnvewJ9FTZLkjFbGERSaDYiOkBwAfPuZz0QDDb4lgZQGuDsh8abwFjjQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mg6g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:51:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ab059052so819511a12.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924673; x=1783529473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQA1MLuVYmCJM4wnv1k9JMDKSdRHRw9JwbkaWYSTWBI=;
        b=UqLvq/rnh10uAEEsaTvEHUwdbwnUbiap7+/MR+tStCexc37fyO2s8GPNCPRztn0tGZ
         2KDYG6tXRnUh/tP9DBiaRWzv0wjl6vox3FeaUR76YInFYFfmpn8G82+VzIGgqE3Ozn5T
         Eo7KvOqsgY4vA3z6UYmoOOZR6JtsUTXFVlyWCevK6A7T/Fer7+rMNtdslo4/x7QVOVy9
         WLW34s9Caq4DoLR6qz0fsQH8UphBkOSLF3lunnAncrGA3u1gwywnDsm6BvHAQ1RYTUIx
         f/+9kaYHmrYRobVoJmLfu2jwGRoOnLOXXewQ3vFknVnoW1stXes2z3pX3hbvMQgTg9Ic
         mKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924673; x=1783529473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQA1MLuVYmCJM4wnv1k9JMDKSdRHRw9JwbkaWYSTWBI=;
        b=ENJthODRhhWwvPN56JBcfnp0BgZCTQ5I3QY0oWLzy7kSKsGlrYq2KIO0teOvY/kMoB
         8JYeySnJuKBxMhR21pI/RZWLSnHdM7zxKGUfaI168+TXQqUyRlOni3Gkyuej4V+ZcmLx
         9jCs1+CDME0fc+x9B7cFfY9kzOUDbmtyTftYfsYXpoE9v2juChnN9YXIgukwv7chPnGg
         YtakbzmKPf8nP5sAT3jIStFB48hPBXQIUrU/o53eZrj/g0MivbMXIgCnwMI0Qv/khWKZ
         qeLdCHhoDSMGROGDf/BN/+/uQ4BjRBndOgKA0/UJ379pqneQaB6uLz3xGNSaroIVPfNa
         TR6w==
X-Forwarded-Encrypted: i=1; AFNElJ/3ZTirRS3KV3oIA31vEm+w+52GLe8IEF0W+8dKsB74AiYXW6nBjUxKrh/M9siNCaSW7Fb5QA4cr8X7@vger.kernel.org
X-Gm-Message-State: AOJu0YznNBWht4Zz6xd+JKXN0X2rGwmR+wG6L5ehqylQcO47BCZT5dti
	rAcb/2wTZEzRt8yH14nU/QJd/pjTe6RHPV/AvDQJwa503M/2472Vvz4tGDXVzLciK/MgU1eFR69
	u1+qa+B62c4Pa5vHhjZiD5eYxiWgLdLRY3jhVNFpcOqCLQzY3IYdukBuTYUs6W7yH
X-Gm-Gg: AfdE7cn7WnEHrCEUnFrOfevdjddDQMenlMaMbUpNxTzd9O7ZuanS2qgiUGpmBhbBe3K
	ixtP9sa7bwsUvVl/PuERtkrbBGOTaTQdOVreYw34gaRwtGtyAW0QI2+dFs7ou+GrBCaRM4x7v/U
	XIkuX5g/JklWYzTHFfTN7tSGUocx1CN57X0rVtGYNjrhFthjOh10gZh4J/+RcwlqjhYpi0EHlKl
	8bKeb6JssEK8Cm/xw+csp23mmLEYRhHHy70e5+3vccrAm4heeOHU7wWkbqNpyBaIbMsP4eXkvlE
	Xxjdx/UvnB1ZunkbT5lTO7UQqXcXu7mgnXjmR5tRrl0VpihGAhHoYgdgIfeG1LYeFWsF+5nHCyf
	jeplQV7QwB4LJS7Ek5P3E7xZwu5V46typRNXin53qWzmTFzJkEFfBDqA7Qwf2ZKxXTx67uj1pqs
	SnlJFj
X-Received: by 2002:a05:6a21:7109:b0:3b3:3852:6663 with SMTP id adf61e73a8af0-3bfd2849453mr6618098637.24.1782924673011;
        Wed, 01 Jul 2026 09:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:7109:b0:3b3:3852:6663 with SMTP id adf61e73a8af0-3bfd2849453mr6618050637.24.1782924672506;
        Wed, 01 Jul 2026 09:51:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
Date: Wed,  1 Jul 2026 22:20:48 +0530
Message-Id: <20260701165051.4122259-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IU-F4X0IzG_AROURQl4t_DPWQ-wayq4e
X-Proofpoint-ORIG-GUID: IU-F4X0IzG_AROURQl4t_DPWQ-wayq4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX6FHMQ2x/sOGb
 ZZN/8cJbrDbJfop62PlYJz4MGnq9+gDTKdgV35Oz2olAFr4Cw9QbkIKS6P2k3feSwv6G5z2VoBn
 1MQZU0wwYsHqCf0ld92iRgvrcDi0IbyxsuXGVUE7CcZwH0yUZ1U0Ju3wG6OG/i6f+k11vX5o/Le
 kKWbw/W4ZDraEGdhINUuNa5HTxPUKJ4Bxae2axKoyGPYsHnqcRIOlBMeYZtdsm2UMXpEd/RTTRm
 pyI5LDhh8j6rIsv29YjZ2ayX3btUDgDn3/DGtRwBDThxeLegZRlSZvnkjEr2/qjvQJf0zifDLQ7
 ywDgN5EBx0Qsgkb/bnGCrr0EofgaHo9MI2X3SKs3KISe0ifXkEpRW6yoV6Jp65cDbpb0qP9yhmr
 JrlKnUpYXp8uQ04+J0V24ukCMC02Iz6EoPVChUMSCOSAt+wd9toh5sQXPX2VUwMEfxMCZBEUaEk
 il6sBbfWw+sBKYREaQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX/EoHPAXFWeQD
 ECiqvlFFbqInc2bJwq2yjBTOAnhowRFpELkR7CWZD2u1xYK8fDC3JCaGovnHQx71n9z6VBTukrP
 71eARCYTdhESP+dARmboaJmgGi+Opx4=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a454581 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ybcDLLt5cEg1GZjoCqQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 449c2a7e5fec..001fd0ccc985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:
-- 
2.34.1

