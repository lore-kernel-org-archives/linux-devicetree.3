Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536332B12A
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820045; cv=none; b=Whd5cds/pfyOpyCwNx4F20oFOHTUmRwoFFfmai6NIl3hm2EJL438oue2zPF89XObAuv8Z03qeyREb2d66D+PLX9V0kmy50c1VF3+84bLAVyTp5fheaHLn6+e4LBMh1PiAEjnAIDR/xmwKgqw+1RAyNAO3XpDHpv6nPrcnGu8/j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820045; c=relaxed/simple;
	bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P03ht2JVvEuqhfrOaMZuZJ0AxCEpMDnZr1HJEFUZYRFSE/3GI22mVPLo4h3kgV/SGAz+e5qpIK2k60g2WnttEwzWWtZeYugn8N6dhmkBV9Lf44z9JeK7sIWAmtvo4mKzeCTZoURMa8Lxm1DxyuXfgBx8opPv0m83KYjezQ7aFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfWCmvg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQUs1u+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfWCmvg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQUs1u+m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILrndF1034350
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=; b=ZfWCmvg8jkBdBYAF
	TJ6wQ0vCqkfsWQN6TQ9/AQ2dEHQP18zIs63hywJjQ/8c/4G+uLH19a7DwNjf1vYq
	vXcslKmoFIb2cILWMZy4Wr/v1pULOFX2S1jW6FQSc63ZIYJd7Dv7dJxlqGHHAVRP
	t5/o5YO8u4qalBuhUJhr28D7u2EheGMHmMash/rvoSeEM2DCv7Wtv39sPzyP+9yJ
	RGZSN8BKfTqYlxE4OxUB35n9gpvd27VggWYIXffdq8tZHLNd7va5x20868daH07U
	4F7qb70HxJNh2AHXdGksnFZwLsDPwIoLnINlFf98qStfoAdwLbN5gL83Aka231KA
	/LWbcA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyr96rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:00:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30762d67a64so2060800eec.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 15:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781820043; x=1782424843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=FQUs1u+m92VJlyQmPZBkcGIFI0QReIYRcTzbhwv1ixWPw+sd6fJTkfD+xFDXWkAytJ
         i55boBKnstuECm+9CsrpS4NuqxH8FifZQSfdBZOOnSz2OpOQG1JdVF0CHj6foSidG+Ix
         ebCexlpV7sNq8Cggr/ZaLf93DNDSBfHBeHWZzHmx15xENOlt5uH1vU7WY/QHTT/IH23z
         VpNMnrU9nMUt4eUcmMrbtOeYc5tWFN8fw9JaKC/2DekAfaMPw4ij8lef3TPXyuwiqrxv
         vbDImP8ICL8Vb+nNCTryhCWe1YgGpIeB+MbR6YbM71BJz16wtAhRBnb9QseDn/Pp5ZWx
         tAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781820043; x=1782424843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=jD/ecEziXPSSnQEZPo8PfGICt2ra89Ot0LKSknxZ99Pu2MV1f6as0R4jC98J4jTBaT
         NSGgG+VWsxyDvnBzrSNTxNFF3luUQ7B70UvvhPmSrmy+UmHhnPi/EN7Jf8S9PQ9FsMWS
         N3LFLgey1Uszu5RMG3VzvU9inFtqhqa0KVipz8zQbNXc+cS0f2/HrKzp8jca0WBlJqxV
         GUOnGeDT3JFDNb0v17P+BqFyUnTVNVMhk7qwgKuimx86s0FdS8q7qJCP+EbzeAytU3+5
         i6/U0hTBtnHt4UgxyzlL0/4ZKuFb4SNYBUh67JYYscZJLbsCULuGVvgh4JeJaZEog1Ju
         EHPg==
X-Forwarded-Encrypted: i=1; AFNElJ+WlBx0JtRRb2LwDM89lRBQSvp1tBnvsXy2v9ITnsvK1FLr0CassbkB+bbocplNihMn15OGAIJAN1n2@vger.kernel.org
X-Gm-Message-State: AOJu0YzsUocYVtWeoekJmqVPDSNbbxmjkwyPJtTA9DgKG9oTHFNW6Wxs
	w1XHGwiBVn7scwz9jfHU1hIy3fd6h9L4fZky3W8IF4H0Hq1s0faJg7d8pXqihJeZrGbS2OJxp2P
	+SHeTHaBmlcpFbbeBYjh/rTUJohG7GuhGwZfq8hMeOH7kA65IQjMixpVhdG/Xb/yA
X-Gm-Gg: AfdE7ckQhF3dghd+/bAsNhAs94eHbIZ6ko0vkUc8avJOexYkoBVh+EFAw7PfxFnIDun
	XoTQGbjeRnfd/vTnc+9EdKnKAC7ayZ8wrsx5u/mPzVJdKoNvoFxBESewPBlwLNCqGeL+NNV5Bad
	Hk+Gx8Sta8bvuIzV7adjTyw/U5YtEWnOucxGKpjBNA6653GfTDyglE/W+fC0KZV2YVzIIlb06AU
	lfXqDnN4hOGWV3q5ezBKAQYhDFqkn0oLr8sP8nEKY4BRqVrKKMyJF3gwowCL3NEWz+7qFPAihc0
	B2i4Eb1iBqzkdH6GfVch0jBmoSVYgNGz43wsyZyuGsG9K7NqEY7Ah4W4oLfQylOpKDe7WVSOsuE
	T5qTrWYXfBHthZkuO57utcK+IYzFyRrElIXUBdE1yxTgiKRcv
X-Received: by 2002:a05:7301:3d17:b0:30b:c83b:f56b with SMTP id 5a478bee46e88-30c06d86996mr991579eec.14.1781820042522;
        Thu, 18 Jun 2026 15:00:42 -0700 (PDT)
X-Received: by 2002:a05:7301:3d17:b0:30b:c83b:f56b with SMTP id 5a478bee46e88-30c06d86996mr991553eec.14.1781820041913;
        Thu, 18 Jun 2026 15:00:41 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm628436eec.8.2026.06.18.15.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:00:40 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:00:33 +0000
Subject: [PATCH v3 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-pcie-v3-2-f31880bfb3ec@oss.qualcomm.com>
References: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781820038; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
 b=QFphUkJzgyhApyoxYKg6ULID+IFcA3qYKhhuBq05YxGe+7cpgO56OE5WjVqHGu7U4O1BTGY8C
 VnBRywNLNRXAFyjVLN1pkdW3gHcXMCUcwiHb7ANmeQeMFUz2FTgAXcI
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a346a8b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -kGLXZMlA2lc5Q_9EMq_V0Ptmz-mm1n7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX4BQCb6wRL0rY
 8p62PYC64cwIunkphhXtJgBHFeQTdMEAY3bKbBYbKL7+QivaUnDaCYRpnRGb6jSCj1hcGSxKkLG
 IySikQTS2NCx9f5zhrBgJzApE3DcWOwBv9nPrl9sYuPu/CqRs2b7Cs6ulI4byAQjEdKhLI1vyko
 SlpRty453EGfNi224/Gt1j+znLbD2PeNht/17hVigfjYSC6P9MeVHGAG5MNj+QynFaQ4O+CBTdN
 SbB/MwD6Ax8tE9S6ixSb990QbUw0otHlO8gT11MEpBbg5KMtbq5L96OMf2wQ7K1A6yr0Px/gIIk
 ELx/JaamcoXMMqyALy7CVyIKF11th1+hk0eglTQXJfxa4/6jUWotd49Qobu2aAhgA7TRpsfqq81
 gPZhW5SXGrUq6UtsR0XvYjgTU4mqtC5PhkiekIX3iv4zU6TTUZRiPeyoFvqambZsLva32Be83Sv
 H1oZy14yrD+aH7ecLJw==
X-Proofpoint-GUID: -kGLXZMlA2lc5Q_9EMq_V0Ptmz-mm1n7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX/oNc373M1kqq
 eE1t2fxXWOGB7HpSIPExjXV46/jEtMPD8ma6fpe/s7g1c6CiW2C4WfI18d1VQ8jTFkIKEHMAgFL
 lwOKyPoL3nS5YcQWudDkBIGo4UtlRnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180200

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..89ae006fb6c3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2282,6 +2282,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

