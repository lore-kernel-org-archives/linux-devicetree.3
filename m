Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A927FD6D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996956; cv=none; b=ClE/iclOO6Ksyp5BdWzlz32VTYWVOLMKjhtVz2M38/QecDK+J8IM+BvATD4T+A3FJBP/ZpKPZuH1RIk5K58Sk9XsU4NAf5+ChUq4gmm8a5nKcoySomzZYkDJ7ZxDlkNSwTovGC/LHp98bZVP9VCRLt295ndduD7E8cbPoqOE+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996956; c=relaxed/simple;
	bh=oEPhubjWBInIHQQra0g7O6nsTv4zdj3w2noh4tW0nCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RYuipi0B1PBLYpWV2EFAI3nYvLtz8F/ph33BUPlhhf4jAsZgcX/wO3tn41O71kka8MarLQdkCAXMTgel5P/CSDD96wlm7iiI3x8jZC9ze3KlOqNeA3TGzjuQNGRFFkfaKpQ8osKeK/0knolM8Bc4N911nlWFLHXkwRvHFB3/jKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGE7nyv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRcP6nVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGE7nyv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRcP6nVA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599JALZ1815858
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oLk9QPedDkL2uCX+n3ZKHm
	PgbpWGF63huvolXEqxgzA=; b=dGE7nyv6Jm2Y29d2xm4CPI9j07RBzl7fB4bKvh
	hxP5vbQ5E6pBUulCSMaRttaLa2r371y8DOs8XJKndldGkLdkk1g7dAa0ZVNliRDC
	rsxrcaFaY4nu6qOJ5w4MJ9fh5gfnICxBgoCCL2Fu8fbR65DjlMI3OJ1TxZa/8bq0
	8RFc4NTkmRS+3Dq0WondAsfsMDCcmQP5p7npV7oKz26XKK4/XuJoYOglRtDNZ2ZE
	7Ub3ZCIxagz4nm4fKNxSkKv8lUYe4UJSprtRPOBeh1lC2U7jYu47usEfE76/ljH1
	MFqOuBq8mX9esKhr9AQGkoi+ZhqwSbJmHnvGmJ0HCts2dOdA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr1es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:22:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so3972998b3a.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996952; x=1781601752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLk9QPedDkL2uCX+n3ZKHmPgbpWGF63huvolXEqxgzA=;
        b=YRcP6nVA5qsGcqKxTcuGIM5T5ceVyYG96UvXnRMXMzQcpXVpjjku2GVOD9K3mYkKKM
         uBQK+iugD37C51Pyg0gBIO2uVsldOSTfOlclgzpMClTRD5NzttNPvaD7PWi+f8nJ2PfD
         JXL7qTtJKoASBrDdxD2bDKrrwtxYSZ9JLa+CRsxs0dXUObN8eY8wfmFXf/2Gn5AGd+Hj
         L5mwngiju0XYHjAlAnGYAqwdw3YX9GhmFRi9eBuCLuhsEKfMvyWfQKAoIfZ0X1dKXrvN
         rgsRTyPwZw0NQ8FJh4cE38v0aPAM0Kb8Y6EVwt7QBKqMHlxqTqPSPKkfamDxsinkmti0
         4cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996952; x=1781601752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLk9QPedDkL2uCX+n3ZKHmPgbpWGF63huvolXEqxgzA=;
        b=Ib87qPkkp+Oqdnk2wYylGDo5b4l6+HXLqiwgNAHxomp27SFVxvjztct0cLdYBb3fbr
         wHp8B6KcZMe6QKvRu+anJt6fG9YVXrfQES3XvnjPde8rv1Q0hCskwZlyHll2AXTYd8Q/
         HfF8Xh06XxGi0rqqAq38Fr+DIs5UtKb6dLA0h0XgkZk8d1IfY/7uNI55jFSOe5Kpb4/d
         4SKzQOBIJHjMrtQdtCS/5NcnOKujXAI+ZcLF+/13iQRwDFMhe5qAyB76p1E5FRxeIxbJ
         atA26lp1U5J5e+lapXpktgYvmVvtQPWdNXz3stJ/60bDepIEpa+9ZCSamCk3WrvJWQs7
         /u0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Li3IXHQ1Mo8Jhm9dP3v0wtyyxgd/Bt8Mn8ZrdSSsi23Rvyyf61jwMItG9M/+zPGhJaJx5Nb+21dm0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywna45zoANWFlficeLZ7WTXGoWcxfNWtOYosrWFqivCDlirSGOQ
	lGm2N+XKUbwx4FvXpkNAzOPJlfA3ndl7eHfa0FI+SL+cBV5TT+iVst0nLUDsWdbREfTtwpau9zd
	GTDf2mAMg2LIIxzH8XVXvGikP3EczBO6KAcUnVNowrwALL0YSzVvvXx7d6+6YrLIh
X-Gm-Gg: Acq92OFAUEEG5zP1IXOWko6bpynz1OSGICLXLkQzzo2Z2RaLN9HN2Xoia5IGB2O59GW
	Zdrd790XmDh58oS6E+5tNrsWwSGFuvKCm5/rTD/2jhBa/8tSRWpx9b/TQuMEDx5B+RTepGk3Tzc
	XqLtM2BmZXwXGLRdS+dU68nDJptV6lULK7xQ1hzRD7mqD40XZZiswbAhYU8s9/dpiqU5CxTodha
	tlftXN5W8uqGR7SJr8sTzO6ZYu2Pl8UpsYOKNR1taKqjfj8lJdEpgYC4Go0kq+tvjZ/754RIs1g
	kFCA3HMRePG5splz+chLBCW9qmKoioj1NuaEvpXIO9rjoPnbKtwPD3UhYbRGCXypn9DVm+mAB0V
	AIQMYyQC8+3JZaZWrosBUFbzNkRDZtCV2wYJiZ7AUPgVkxgIFLLbirAOuPgWy3KqoL/spWu3H8O
	4bqj6mapRMnTnRz1ul9SLq1VNfYQzbYZQx1W/7ldEaBDYjs4otvFG+10t4EVLAew==
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr17711745b3a.37.1780996952111;
        Tue, 09 Jun 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr17711707b3a.37.1780996951659;
        Tue, 09 Jun 2026 02:22:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm22861582b3a.30.2026.06.09.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:22:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Tue, 09 Jun 2026 14:52:11 +0530
Message-Id: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPbJ2oC/02OQQ7CIBBFr9LMWpIBCpRexbig00Fn0VppNRrj3
 UXduHw/Py/vCSsX4RX65gmFb7LKea5gdg3QKc1HVjJWBoPGo8eoFhJWy+mhYsyUo05o8gj1vhT
 Ocv+q9ocfF75cq3H7jTCklRWdp0m2vkldCDa01lFO2rY50kjkox+SxQ6DiyO2lIOB/5Ia9ulwu
 lVCpGS5OKNRYRrQZpssd7a/aTi8Xm/Smwyh2QAAAA==
X-Change-ID: 20260609-pcie-phy-99fcf91a02fd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RpMLpvewQfN9I10uD63QlPcqEXHtvYWo
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27db58 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xdo0bYGMzzAWwOA9nckA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NiBTYWx0ZWRfXwOwf+RHjjoad
 vO6oc1qaUzcR4irfcmuKV0I+sdMOYSVCcl+PxHbQrCb+w3WXlFgKYEqI8dpwOmgsBQ9/fxRJL2W
 yV653zt0SeaF/Ha4PSmz/6tWHHc2lqJCrfZBEHrvua6fcPzUzTld4QP6Hwus/vUuY/YmJorIszO
 1PaMgK9BZ/CdhE6KJAvxNRovnSW7mufy3AYMI4NRshWU6p2+MsKfgZSLewtzJtM1amIGsWJrigQ
 JQJ0jDbLD1TgIJGy+Fwls11aYAVS2ihb8mDsnIPrq30N5DO1gfaqWOLzm6JDNB1Kq4iF9q0qdR6
 EM9HfN/l+l9gxST6JzU8gjYN9hiC1NlSdaIctB4s0SO7fAa50nx9rhwvZxSoMB0Ekoup+BmcFdA
 SwZe0SXXTuyVt1h5F/Me+6YUCmm/1kUx+3cU1FohuVuwPisCCLuXBKkDGaxXMFyCzBEVAFS3gtC
 34KzReMHyg61dN4svrA==
X-Proofpoint-ORIG-GUID: RpMLpvewQfN9I10uD63QlPcqEXHtvYWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090086

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

v2: Had incorrectly made both the phys as fallback. The single
    lane phy is standalone and double lane uses ipq9574 as
    fallback.

v1: https://lore.kernel.org/linux-arm-msm/20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 145 +++++++++++++++++++++
 2 files changed, 147 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-pcie-phy-99fcf91a02fd
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

