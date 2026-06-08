Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1813BBA04
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914838; cv=none; b=rIWCFJ14vOXAME21j8uQ2XSERgp7zhtLCRQ3yUsrF+X9BeLrgpYE7+xEWAzknSdSXSgQxLbGXt2M45032qXbDefT1bG7O9jEd70iCR7jorShppczlMH17rwdfCyFtBUCmG+KhdHw8OjMqLSzP1WyIPDyRaOoyqM/j8JGFthBR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914838; c=relaxed/simple;
	bh=A+/EIF8eXT0VuvNfYNQPJz5eVhkjLGGcH5RSGILTHLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pbHcd7NIqPfBFAAGJ5UQeuDDvNCAtVo9GeWbVQypIGb3YiWAzAJztlaGQ4xT6yJb4WHsukoWkxEo+4d0vqd+iAWOEiTej+1fTjH8fAIl1ggYckkudBGEdlC+iJchoLbb59YNcc+K3CtM3bDqdZZAiic9Z0LxtZjtFJAyafoj+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp1vqFte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ld6rBYI8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp1vqFte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ld6rBYI8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892KTd2677806
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5kZFXrYXkFu
	MwRonPUnIHxpnv8Am/3Jb5Xkdegig3qg=; b=gp1vqFtegVxv+mGdJo+NWdUIQUI
	yrYNxHxtvGZC/FDMXsTxhoDMSc+B5bwZNT5yfkwqoajmAubIncHT8MjwQ8CzYqmh
	JgiK44XkM8MfBpqqjiU3ub8eRpj/HVeD9GfWqlUIMT4yKjdpYbvR+8cxvyGxhGMh
	vDkIo/wVWSHzbEnLZljFNeqfxoEXlNO3Hm1l2zN6x5jOB6EEagvbEj/Kimx1po1B
	uqG8Id2EwDIyZl+LYqPnHh4H3EjQliMTRq8FMpjcifTjdpt8hu8sIvryVZtj/AsU
	hRqbrsyQ4ScFZb4LFxc0VFaHbtMmnG4idmUCW40CSne5yPbsRDCsGGAYRdQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkrd7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:33:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b1354edso5053013b3a.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914836; x=1781519636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kZFXrYXkFuMwRonPUnIHxpnv8Am/3Jb5Xkdegig3qg=;
        b=Ld6rBYI80H/vrDqsKcyXfekZcOeb2Q6v69Q2M1zqlLE9A7mDFEpsMjGmYZKPZmIjxZ
         cHiVKt+rqXOSqPV2vZWrXwAURRNX6rraP/NsWfufO2uqFKmszGhQ95e9WIMQCxqjF1zm
         KaKFpavcBXffc2G8FgwIcb1YNfPZ6LqIapvD0l4HJSVt32NADMqSTVIBVWMhPqDXj+lU
         UeLjjzqQcEKqourGLmIlPxx7Wp+wO7XBUYcwHAZhm6SegBF/mlT/OGGlOQPh0v6UjQyC
         +cLEh9Kn17A1+aAWXboKYVxSlF++xwtyZ9X3lWLZlYhwrhmRRsQejKOnrHxh7kmCdMXr
         Ou6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914836; x=1781519636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kZFXrYXkFuMwRonPUnIHxpnv8Am/3Jb5Xkdegig3qg=;
        b=JUT+ZfCtUhZRwYWGirtag82jOlhJY486eYM/BQiVlxmj8hgLtwtaq7114V1P342tIo
         NWEiEwWz1mHR9dA94v3rw37zYVbr1jujjqvTEDOYqJIsQAxatq6Uef/L/UDl/hbi5ngs
         0WdG1X7PRVdQK/zr5hWvsQn3udoZ/TZK5pckkWIVuMHU5CIaYCkMTCqJ4uwoRBA4lo77
         M96zqnZtnoikoFdK0IsM+E61886BladAq/HT3uuiQ0RDDH7badw9JRvHxAWpZxcHdfEt
         4RLEXFKx3Y0XLrWzYHqZLEK3tZ1urt75UNwWfqtvYi8PRHAgtHmVlLI1rGuc3Hn3nEMH
         xEuA==
X-Forwarded-Encrypted: i=1; AFNElJ/m7Q4axiFgGazZ1tV6tDf44WWonPGVMRHYEvo63MLKlTWACx4BT38hEOq5bH/1Iu8OQn1TyOxxLXVc@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4rS1RmpH1HkCGQs6/z9qOY7ASZ/1q35x52bfn5HAtmqrn/u8
	Uamssj8ElTKZNPR6Z27EGa0oXzWNELUgIijEgAE747SAK0pSuZEGRyr+TX8FlHxYSpxqNSINW0J
	oiEFuBYIM1wgD8RvvKxFW/B4sIatIVa9y3qCOecD1EgSIvLbrjlDquvyrGMu59KFm
X-Gm-Gg: Acq92OEl2IigKCMlxJHuLiRK6wk7Je3Sqwy2EUQTtbVCpjbc63/zm9aWs8A6Rxt9y//
	OIbMJjyfRr0HX5HWl2K5HOz++OOdMrBtdcoQ2BwDKSeRlxOnKXDs6hFvtAR8uciOZl0Eq3f5U8r
	3sZv4VAOT7gxQFGp4byIiXAFbPgQZPZJGVY/qE8LqS8UsAFr0ofPwAThFLeSIa1g1lqJSDQ08cn
	+nD93UJrf0WR37WSWhoE+3aCOJisuCV6Kz/WIjljkZfc5AuwudYLrcbpGLuuJ9vow/zWx3tGcRF
	Ffq6ay76TVmzHgd0sKvVxKKVtZSsHk8Ism3dt2NhglfezT44UQbN76NUvQnSCFdSK8sTiLCPWRa
	9hFVsXZ1ic8WCdo4HM5Ek2nFcC2Bh1wr98k7AXFHDhMRKPtsICu8vk0cDuZ83Z43y1XvvAqD6GL
	yxmjCMTPjmkd0dbxLQDxNgtWTr3l/EH0Dv8FL4uYBX0dsSv57++cOH7k+xgdukTw==
X-Received: by 2002:a05:6a00:2ea9:b0:841:d7f6:7297 with SMTP id d2e1a72fcca58-842b0f0994bmr15341785b3a.40.1780914836355;
        Mon, 08 Jun 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea9:b0:841:d7f6:7297 with SMTP id d2e1a72fcca58-842b0f0994bmr15341757b3a.40.1780914835851;
        Mon, 08 Jun 2026 03:33:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a2600sm18571570b3a.27.2026.06.08.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:33:55 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qusb2: Document IPQ5210 compatible
Date: Mon,  8 Jun 2026 16:03:43 +0530
Message-Id: <20260608103344.2740174-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: --EdTAzvb2zagd-0BsiUm9b7fQBzUUQh
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a269a95 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_sJFZoy4csN85dw_wmcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: --EdTAzvb2zagd-0BsiUm9b7fQBzUUQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfXx8a3QZDWn6xz
 DA2CCHepSWdRXKx27g46cFglECwLjhezGbfS9DV8DzjS+TL69sCfyRxp9zg5KoCRpol1Rr1QzUA
 njT+TbpO3m8+NG0sZsCFO3xb/oPYjOVUY06+jgAXeKIMJDwqjPJH2pmzhQ2Sd2C5yeKWJm8EWqi
 S2NnM5uPle+U6kukzTj7QI687ZTSlvOd2kpmzVDFEtqYGmoplNrY/Xw9Xw4u2/BTLVOBnv6LHJ1
 yhzsGOkgFD3OfO9ghSG6GS9krkUH386eKrpSulb/41mZlIg+ebIEk7yxR0x9/u1ADXJCtXBNfiW
 bT9/Vz5IZFKyE3xhmL3pEHFJmaf54C3VGHLu04petBCZp92nS5mlvqUprgR5tYRV+w1/dhvI+UX
 nzFydU/Lc4Yc6K/YhqGxOXePdJ0xjK5tWG0v/9bBtNfQ0DCD8H3Pi0R5eJ3MopRDykkVpohFL/2
 JiSCiPEMQipa6Cda2cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080099

Document the QUSB2 PHY compatible for the IPQ5210 SoC. The IPQ5210 PHY is
compatible with the IPQ6018 QUSB2 PHY, so allow it to use
qcom,ipq6018-qusb2-phy as the fallback compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..449c2a7e5fec 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,sdm660-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
+      - items:
+          - enum:
+              - qcom,ipq5210-qusb2-phy
+          - const: qcom,ipq6018-qusb2-phy
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
-- 
2.34.1

