Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE133D5C38
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906647; cv=none; b=K1JlACzXTJjbEq85VkRqENxFJn1G2SSGVlcfTWCyZACi7UzwJRsaINk3ilMJlDTnjHpDBYgcL9nXfdauixdSF1QFuOB4dQuM/Z7tMznTtn2hLPbU8nLnga+Wwwb7zMs600FkR8eUzQ6hjCLAgDPznzJ4T+lmvrw2PLanyUMHRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906647; c=relaxed/simple;
	bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b063texrCE59KsP6+6PzAvJW5GtpPWuN/BuLrPdusUsgJbO6GaewYcdWHTiKR/oXWE3bS2lG/+CMigyifrhgb3G7xadOhLprKVC2Q6CMJ5cTHJ1L/uriHT+8SihynMkO+aClINBDfTJAVgH/FtYJcampt+TX+UwUckNP4USjvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QD+XAuqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6xVhdxw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QD+XAuqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6xVhdxw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66gex1520672
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=; b=QD+XAuqqIWu0wKc4
	vfWTahr9L/A1sy/QyMSZMD5OOtWeRDd0sF2ZIt3cxc4yUh2Ph2BCYZz5bKjaw5Oq
	FOt8/Ly6sZROSCRWcRDU1fKxeLTumfxbkNDWGNvgA3RQJIDsdpeeMuZv3iIvL2Jc
	nQ7xdaUcW7ciyI82YponHEp64x30DN8xhGNRKWTywEP4aXmNNZZUAfIUoAzFL9rB
	i0lQft/mQ+HZ4mEIGtUsXWzllg2SgyccxiPGrva7z9rRj9dbtTJ9HBYOU8Hlxec5
	H9gd8e4QOWFQtFWD3aarmgEkWx3WFWYqUuccap6v1hIVnuNFqu2YqYyfZ7b6Qroi
	tXJIHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu8v0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:44:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so11842535ad.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906645; x=1788511445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=j6xVhdxwycAdr3JxBIgUjdN+JB75NW2O8hHcDQpUV/k7+ADqyrSEDr30TMG8AIxYCT
         65vfWzj26ytIIcDu00AH6/2ZTIDZTCIE1CnaI+WVZMatntgAQOyqYnvpztg9PllrsRRa
         5CtTzruqqog52IznbAOlZa5p3/fXCk2GcrpefLbZUuhWgdE2upjx9LeG3jGK2+pFIJM6
         qyEE443QLewwxmV3+JOcZRxmliMVLSf3YoEomf+UnIp2U64pRoLoVBMKLKUfioWzENfV
         Qkv2A/GJTDznn6ZBOjMZE9GzaIv6h2RkjuprsAok5eEcDLJoAJIjpjnRqvpsD0ODeFPp
         PVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906645; x=1788511445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=aB36DzZVwQzV0a9YlHtH1NF9sy09Sv9o640m5M6FrfKoSfmDRu5FglZv73m0ULnchp
         q6kHqrkPHY/OETxfwV4ssSLNJdyLgQ7xr2Iv5s16C0cWGhqnCF2LJG10atAjgN9t830+
         VgJdyltXBrzZGDSEIZUukUQaUPefApSOmSM8T4M9PP1kryHh+2q71HKtPWS/UHnBZyCY
         +qd0xzJ4DQzXErXNrxNOwHbte5IUNtrE4BqmbdA01yKdWOnOsLyiUrjPjX8nl9ND17yj
         lMSsHg4UFZ1Q25JhlCLLgnoMOLv23p9mh18OqkB/Ay607Ti2j52JHz63HXJo0C0kXPG5
         tEUg==
X-Forwarded-Encrypted: i=1; AHgh+RpkO3jlgajt/8GpqA7fQX1vSC4MX1d5Y9BQ+OBCdUN4g9BNCMKpRcWtT724a77dd4cnRqW5eAk+2s5t@vger.kernel.org
X-Gm-Message-State: AFuF++ntuEYEkkbdWfBmUW7/x+Fd8SjeMOR9NsGDMo7IlGNo6vbRtMO7
	68zb1i8uZeQ9xMM9z4Mx9eJHky25+bnYmV7np3vcn7pCQZJgx4dp+E6+GI6rB+L8139MJ8SO0kP
	7Fi+HV8u0dacxn8KwyV9J3KfdxzgUqjxZG6KQyAMzwpxMTQ3Y28JP/m5yrlMwb96A
X-Gm-Gg: AR+sD10lXJN/tkie0Rjy13ZYbyIHFVUzE7DeE4K+WOqhioer2C8d6nvAA1uiNNQZ4VI
	t/QFhlDckwPoIoy7M8KZdQpf4zcOO1QOJpIGaTxThq2gpLQAaAiMWpIeuOEo7MqBK2ortmDIPsg
	x5rGWGqbN9l3yZjMPmIM0GcqpOoTSHInyzbUzn89Ka5ffcd+4XIhQtWPfaiUJmQ6gVqN5asV6lS
	RAmYJ1/ynwR5TwXwdipfsgj2GmnoZvSSHnUMtQ54nyGzmwO0xRrikMx5h3PZbX/jl5TI2EKbNY+
	c91/dh4rJYru4DxkaLs4DopX4qPFRBdsAR3GxEPx2vC6C/NDYXfplLpC0aZgJBmKQQnfWSBHoEb
	F0csJ7Wsc0moYw2wFXJycB34XUmiWDY0IxJw=
X-Received: by 2002:a17:903:13c7:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d74dee93acmr24598915ad.10.1787906644738;
        Fri, 28 Aug 2026 01:44:04 -0700 (PDT)
X-Received: by 2002:a17:903:13c7:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d74dee93acmr24597695ad.10.1787906644217;
        Fri, 28 Aug 2026 01:44:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm3673459eec.3.2026.08.28.01.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:44:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:36 +0530
Subject: [PATCH v2 2/4] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-nord-v2-2-18bf59d19d6f@oss.qualcomm.com>
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787906625; l=947;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
 b=6a9qQEeX3hsEP5/9IdXU63jKORwsf3AJ/9gEUD4IpThtQPlKw/iFS6R7s+vzE3mLD9N87U/U/
 cd63oTw9EKpD8l/xhrwVitROD1e91pXSmwuo3d7lBTFFNUMqWpYJpbO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a914a55 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vlg1ns6_vDti4_PWGGfCaV8ftVjORa6X
X-Proofpoint-GUID: vlg1ns6_vDti4_PWGGfCaV8ftVjORa6X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX6OH/MYeL8uRZ
 drZrJT5OV50clDONOCaLI7rHzzw9qr04Zfmcrx3YAX5aZyFjODEYoNF2J6De4qa7h31VwXWcFNj
 MVhUEzCpp+Ds3Fh1CC0GSko1tMIswwY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX6tdDyS6rHL0g
 op9F1glH9jc/xL3WTgXSRwABUsIjjZXh+8vY4nUNG1CPGcMNiCYy2fSDsx/8kcS7MxLaU72SjbE
 kpT106F4ZPHpBNpOgvDUqtfRskMTSLrWuyhgQMlQAs46l82tY8nyoLP2fgv1R6wL7a3IrztF0oF
 Wc74SYG4vo4KyGJoIcJIVKHC4+zQrifQHGAkSUSCPhxI88qdFkZYnu7CIwT43X3Vdxn9LlCb1E7
 tXlnllCJ5x668+eA2n5xMuLatLkdS6NvLcw2t7l0E8bNA+DhzO9aoHTAiJfpzZpfH5QE9wzq01q
 hKsOqARcI7OXPkjAQ76qlR2gQPzW+iqwTrlsh6zVm932imFB7k0s4FIkS+KL4e36wSSdNye/kqU
 UQQAClLREIJJ91wA+7A2igS1ksGKr0Y49s193spaiL/GZEwwYy3x0gDwaybFClg3whtl5V0ju2r
 mlFw1Pp/1yZ+zOSsMFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280074

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

