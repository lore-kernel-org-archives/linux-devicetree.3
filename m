Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013140BCDF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419967; cv=none; b=mjNRWtk4BqQO6yZn2UZY0YEFZfiDv5sS82vhyuhQwS+5UOly6NTE2mtp+kMP+XBGXa53spim3GyeuL/vG/1ytSY9Ojqv/bDh7yZc23F4E6tNOIr/IBCtOWLeHleYScYLiLjX2/jG3kMYJgvEBRQrHIDfYNXvmXa1IHcxDUTjk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419967; c=relaxed/simple;
	bh=ScgocSYMJZUtb7PWKiEExIwCxdphhRQmmpNH+RfPfM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yov2WJZKiUylAYp8m+fl+I5S/GdWxQDu2tfN/mOVSBHa9sPKCrEP+Trmt6Je87A2dmI5IJ34u6d2+fdViaG0OajR2Iwv4MOGrUeHl8u8wg4sb3QB8x/K/aEtz5bdtT5VzNbtp8CUGNNuL9oV5i+kkgrTCgnwfAG1kJPQmkVKHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+w9iYcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmDmM9lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+w9iYcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmDmM9lq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lK3b721290
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xeAWlnFDPjChrwvi7D0ePs
	+8sox9HbQqHEX6wfQpKhY=; b=j+w9iYcl1SHasOkk8ecdAyPfv1KY3JIQHD1FSy
	dOZrb6YCsUZvfOsQSMgGFjNJDWVeztrY6torV2jVYXr7vL8bvDgWAnM1V5LAspdL
	0itjPoeSP7VMawf/SHelXAHRj7WipRNl4l1C4yLh+nbkIMQt1Ik4ozMcJd4cPTfC
	35UJFOUi/RyJjbj4lG0YmluqLxWm31fxu7Jh7GJq/hoypuSQ0v8rLwurcAFv7Bry
	DRRatMtsdYOz2OJtGBhMmUF7EiCbzbAJymUT7Nt215sIrYEwoWLVdknrVivUK1HV
	SkPA7Ai5/w8NIsRtvwBVlnONQqfjZRSR4o8n16wv5wlAjSsA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkt7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:19:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so2954425a91.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419964; x=1789024764; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xeAWlnFDPjChrwvi7D0ePs+8sox9HbQqHEX6wfQpKhY=;
        b=cmDmM9lqfADBRbZZYqP8+LIPiMgQypfSBMjfE21fpmcs0x6UuQLage4RlT7B4hU8Xi
         vRkh5TtL79PkYFtNTXkfk/73sLfaLh5YsvIQ0xJLAnbdVJ3+dAWXVVMSjTCQpSVR0xpI
         dRIyw+bxeWrCzY8gia1Bl9tsCoE8au7gxg60AXHk6f9hvRcfMs25jfBqwGa7HQblMk8A
         4/lPFf/QcWbGmRuxTx8HM73JMTUy44uMJY+vWedCAuvJukDr/x+WNIBIoZ3mSrHS/OVo
         tV8CVSco6uZw/3m8HS/k9PL2GTEVISH/vTbE0TW6kHJdajqM5Cl9LGzVn+z1dXFBU89g
         Wj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419964; x=1789024764;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xeAWlnFDPjChrwvi7D0ePs+8sox9HbQqHEX6wfQpKhY=;
        b=fI7ChupVD5doj6u7/xddD3nPxZQ2uRAGS+xx9RgShtz+s82HFz6tVLG7DW49Thyrn+
         9Nr0JgA4XimdbWbZlLM4L+xA4B6AN7MCJQ4jVnSXI+BluBHX76oozsiIrF7xpD+Pm8uh
         IQj0U+lU4UO1z7nTBhXqjm3KS1xIGmWOgkjauP88vvRwMdFQdjWFVlY9fgpaIoFv6t8S
         lcG5+puKCJQILshxiC/+QxZJR4oId4yS/g6SHiziY+t3Ra4c4Iw0rXxY3hM4fPcUUxtd
         7ceVmVSP3oHnwTv5Tp2B4Z3MQ22eIfBAJ5YjHC+5eeKZi/KBO9PBD93SKlDTb7QXe8t0
         E1vQ==
X-Forwarded-Encrypted: i=1; AKwUvByF1dEt75Las0AYaMs02PK1SSCzvWuUgrdhsap1l29WWpc94a0zYB6BPu2Zl6hRoZvJvspjeVUIHEfQ@vger.kernel.org
X-Gm-Message-State: AFuF++kDPz1F0r/cjpIoIbwWH/WNuTdTtHovdRkL8fdxxfSK1KPPzPm4
	BJy9vOUHjheV4Kavr6qCD21eC4bHEH/aGqpGZnG+e/WQ4toULr4XD7z9biLYJytsTXKEwYEmLkf
	mmFA3Jfj9O3MSaI2LovrPeTZKpKNOE/uXb51rnz3rScOvG0ZB0A6mDMFsugSPuzpu
X-Gm-Gg: AYBFou0jTmO4M8/szgzAIqjgW11Q5bUbq98tF4oMr8PuEwvz5hWPn0+7trOLig+6e+w
	SfCU70obZEZotOyTuS84fTydStqtaF//E4wxUcOmqvraBtz8uf4xVWWYx9c4xUZ653aa9Z+H35K
	tlJuXLkdbUtX1tGTNIyxIsrC1mWGIQatETs21mo5KVIYgolyf5RBFzD0AWGN4XwjBlB0RSflywb
	3UYK0oPPtOV4roAotsp2KL5ex2HkIwhdWGWYRvFeEITDnc2X3z5YWah/ZgpnkuHBSdEW7s7fEF3
	KLuKCtivPv7icrYx1fS37LTwowJd4iVyqHXtUGaGnCfDF6TaSeQY8bbpXiGWfh47bwEZI8jWkdK
	b9mExPvB0MWVfLjNg4VbtX9Ac6QUdoBjx
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr15797838a91.6.1788419964076;
        Thu, 03 Sep 2026 00:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr15796641a91.6.1788419953876;
        Thu, 03 Sep 2026 00:19:13 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:13 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: shikra: enable ST33 TPM support
Date: Thu, 03 Sep 2026 12:48:52 +0530
Message-Id: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwfmWoC/1WMwQ6CMBBEf4Xs2SW1loKe/A/DoSlFNlqKXWw0h
 H+3knjwMsmbybwF2EVyDKdigegSMYUxQ7UrwA5mvDqkLjNIIbVoZIU80C0a7ObJY62Owhrb501
 DfkzR9fTabJc280A8h/je5El9259H/3mSQoGNqrWUh32jOncOzOXjae42eF/mgHZd1w8PSZG3r
 QAAAA==
X-Change-ID: 20260825-shikra-dtpm-7490cacf0266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=1355;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=ScgocSYMJZUtb7PWKiEExIwCxdphhRQmmpNH+RfPfM8=;
 b=vDlxITKLapkLDOC2sAxZivvhsWGwPP0NgQdp3T25QEnSc/LAVe7tmHV2VxdKWQfx3HXniL0qV
 Kq/XrwCP2NKAqyTtfmFTQxDA10iQZOZHQFySgY3fRvPF2k5VU0cvwF1
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: aPe6pMnqa-f-KgIuJlrg6G6E3sBOAhF7
X-Proofpoint-ORIG-GUID: aPe6pMnqa-f-KgIuJlrg6G6E3sBOAhF7
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a991f7c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LFEp--mz5Qji-3JE28oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX+oYWJaTtz6+/
 d5oN4jSsqZmB8pjKzvfFG+R/UKS4A/hk7fRz7gglTXauTin/tgclcMKBiX0iQHu3amKSccEc10p
 y4RPTMEMNrWrfFzSm9vLUpohGgKwb5J3yuUZwcFAKitHiDu8mYZO83uTEebV1LVCPzvkb4m2sKk
 VoySD2SOh3VCWkeiU9l6cnfw22pQOKDYHPzaNV7GDHk5hqL3UE+ROrfBCqCYYgTraW3kX58UPTm
 RpuiopG2Tr8nIETZ+Mk8K1hjiyHIqlfJDqr4VzpQrkqT9xiANCCnBwtKj6d1sG2XaaeAgqQqj/u
 v2f5WCpINX0RCehLV/2B7VAoWsuEeKTJB8PRpX8P3q9mMqGDKwb3yJSdt7H4AZY0l+k9Xb+kKU8
 mcByyp2IdrjZOB0fl3YwypBzr2uiQ0IKtUYEsxmWAPnX6ovYtwVIzEDMyeEGeUydx3hEdCRgOWX
 NTVXcniqBUkeEGwsj6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX4cDXU86feED5
 XBr7K07K8SDuMVzzmq1inIJTeLfIReueIy/rKYbgS3hpcj1XWNmRaoJLmlLA7g543ByUincV8Qc
 7aLm13UxZzb4R5JKEZHrhrl7L/LQd7Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

The Shikra EVK platforms support an ST33 TPM connected over SPI5.

This series first removes GPIOs 14-17 from the reserved ranges so 
that SPI5 can be used by Linux, and then enables the ST33 TPM in
the common Shikra EVK device tree.

Changes in v5:
- Add Reviewed-by tag from Konrad Dybcio for v4-patch 1.
- Keep node references in alphabetical order.

Link to v4: https://lore.kernel.org/r/20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com

Changes in v4:
  - Send the interdependent GPIO and TPM changes together.
  - Add the SPI5 and TPM nodes to shikra-evk.dtsi.
  - Remove GPIOs 14-17 from the reserved ranges.

Link to v3: https://lore.kernel.org/all/20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Khalid Faisal Ansari (2):
      arm64: dts: qcom: shikra: unreserve GPIOs 14-17
      arm64: dts: qcom: shikra: enable ST33 TPM

 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  1 -
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |  1 -
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 65eb47183e176d8c1220cb945edac71dbedceac1
change-id: 20260825-shikra-dtpm-7490cacf0266

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

