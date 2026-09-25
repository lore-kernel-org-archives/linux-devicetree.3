Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB022FDE6
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315342; cv=none; b=ptAux9fiN3DsRJ2uGmjJ7SZhrr8SqxZR4StW5CUUyu8wX+UTuQk3a6dI7U/PizEHh5ZUwXVBFtkv6xaXDq1lh1myAGRpjpsU0pL8F2JSWlqLp2EPS3NEtFar0EVdV1hFCYhIMuN8KVeeSfd97aIC5XNa+7XBAlXeWXOtFJT9t5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315342; c=relaxed/simple;
	bh=2VQKFd9S+is1roxFQ2w3VjF1z5t1br3J1sxIby+fveE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LvwHceQtUUO0uAgmmxMdLNvr7g+aPVmoLsEeVabF2d/iGZBuhXIrLLtoY845pJoNX1UsWBtXaHyluonmIWvPTiKxGDJFcfLGEM/K8MFp7TXBWkDB+JL3qpmmMCgupRaO/5GOPpTceAdRkDMXfgMT570oFFXSuBF8aSuGpSoqlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EORTa+fU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlztXSY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EORTa+fU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlztXSY7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YbHK1193848
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EnZrBCS4to+L5xHvaUhf/5
	MW/QcwVf0mDlQuJ/K0HTs=; b=EORTa+fUyEMsb3cxYwtNXsD+DW17DTaXQAYZTG
	TtFBRrjF1/hOgRp3X9XkwESqdzNQcvtOA7M7XX/QBWgF2RolxL7/zpfgTthOnsA5
	l5EMXXSCRwiq1pUgpwc0umjFm6wv9RyXQ8VOMVzS6JaCalzRIy3E3bxnmw9Y0wJ1
	LgSXZXbsqII1Rb2HhLMBvu8QEr/9VEmQ8VduSstfFer4hR9+Of8GcUfl08bM4UPu
	d/1Jvb5kRHXoQQuifGPdN67PUlEJndrSa0N5HY/az/s47F4PJcbb6RvirMLLaJ5M
	8RZWMmG4ljWJXveQel63tnk1pR9jmGOLdeCHyKcrTANNGtdw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874j6nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342138eeff2so28535eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 22:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315339; x=1790920139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EnZrBCS4to+L5xHvaUhf/5MW/QcwVf0mDlQuJ/K0HTs=;
        b=WlztXSY7X9G4UhSHN3eZwF0oiwSS586wqcx7IqhB2ljBk8hqtkMdnrW0AodKBYOtgs
         9T+mYRoW6MgmLKCJSWdyjmSz+NzUzzlKU0Y5E/BlTzk4+RsjyMqiiEfcUMyT0kuK4H/d
         UUH5UfOMKr2z+toNGU10IBuePdMhkS9vX/4LlwmiQDdC5ZE20nXIDQs4a6qLhMYT+fsL
         YCSwI0i7549nuTTeYe1FB2bZQAb0gaiNR5zHd9zT3Z6YzgYBrtfpPew8Wx9jGRtVuK50
         09Qt7WBJniSRUPUZG2eRVmiwO3tP+JuiLyHuqpE25RtGV07qZ+QVbdhJBvBWU8yYl2ib
         Jg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315339; x=1790920139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EnZrBCS4to+L5xHvaUhf/5MW/QcwVf0mDlQuJ/K0HTs=;
        b=ZsFGuearoxG8niGfubRvqAaOLQXRnvISFPqRMRCE0TCnZOawdjsWp8OyLOxqSxOecJ
         dTICPcjUQfhzqiGQrEfj0nrD00Qge6fmjFf7Qnz7i2pyzW6/rUU9eDeWRawfxOLmZnuM
         YPiPXSrcU6nAyD7tiTU5//f0fKijbcSjWbkFBWuRakB876slXoEImW3QCuUB3ZgYvq/K
         5ltW1j8jdK9JOL3BrxSUy56LSutEh74ElSpq7e2tQNkBDN4rUNFJWBDwPJRzIiuhJxWL
         lmchD2/c4jvg6d+kY2jsLQ2eEtXTRHGj17bb2wi28vhwWEuPohzI9FpslvAOlPMZAZ07
         sHCw==
X-Forwarded-Encrypted: i=1; AKwUvByDk/KmnEbhOR7p+Brsq7pOw8OxxaahNuUFiyVkxKwqVSqHwuYymifhGd+nHA7CdLJyEGKiQlNepiQI@vger.kernel.org
X-Gm-Message-State: AFuF++ko2/3utEkEB+UJVSUaO1AxNOt+lTPHcYNiqKusfLa4ezB0L80H
	5ON8h/tUiO/VQME/3SKKRGliYNoun7DQp5ZTaKlevQf3IM56BZHF4yOanO2HHXZykFuSleZErUz
	qzCglaGUw9L9kq0OnbFxh8jcA99TGhxAeIFBfGVK4ifkSVdEi9FCtD0FTc5MkVDn9
X-Gm-Gg: AYBFou2/vIu2sMjmR10ag+6/7JkQjPoZ703FsAoZnYINi7RJ8tER6DrA1X782wrz3zU
	E+pHM2TUcQy1QSm1GLwp7GzPfiAhjtezd+epuZBbAf6mgjTU8LrcVzXLBMwd2LiOhGupHP2tmB+
	d6QJ4nhi+p5WwNINQHChYMCjo//9rZJVUIa5p5lJv3Nky6LyJrrWQSedU/YWfsJM/EVwv6GPHny
	n4UNKopPMYkcPSSPUCBe0bBTGWaSO0DfSCgpzrxQ//2Y6UWe8MWmDCgggXD9LGho+Gu64pGk6wB
	RSiNWZnQJ3WGemp9joX0HsZvokXUs0o2YTddBfscGfpekpP2KcueCgLi/Mj7yEhqORkNQFFFXmG
	EVB95xDXn50/z9AXAMShCPMRH5TN8YyE=
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id 5a478bee46e88-340dca6f75fmr2322398eec.40.1790315339140;
        Thu, 24 Sep 2026 22:48:59 -0700 (PDT)
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id 5a478bee46e88-340dca6f75fmr2322352eec.40.1790315338423;
        Thu, 24 Sep 2026 22:48:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:48:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add CAMSS support for Qualcomm Glymur
Date: Fri, 25 Sep 2026 11:18:44 +0530
Message-Id: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwLtmoC/32Qy2rDMBBFfyVoXQd5JOvRVf+jlCKNRokgjhvLN
 g3B/17ZXpS2ppuBO3DOXOnBMvWJMns+PFhPU8qpu5Ygnw4Mz+56oiqFkhlwULwBW50u93bs39G
 1OVegXdS1r4MIghXko6eYPlfd69uWe7qNxTpsS+Zdpgq7tk1DuYLQCIfSg/UGFaKKgaKJFoKMD
 gMpICW8ZYvrnPLQ9fe16QSrbC1luPpZaoKKV5EQCAklqfqly/l4G91luXssY6m6sbDHSoPeqFo
 aG/5hLdc7rG6itgYCWiP+sss7JvHd3da/HaI46sCp/IB2AWjHMc/zF2Pau7i3AQAA
X-Change-ID: 20260529-glymur_camss-27af71b1d3d3
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=2996;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=2VQKFd9S+is1roxFQ2w3VjF1z5t1br3J1sxIby+fveE=;
 b=m0Wwg465FszVHMiIt0GbOcmtk+4RQ3vKtD9RDrgPA3MFHtnlK3JdD5ggPD7tf3PHBHKHiMlFq
 XWQ9oEemIcyDOAUQrafQNFbdRbp+63O/Z02hAqB88wMqt8XUUr0R4e0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: f86Q_CvNhbLHgv45SXmlUfsnfph0mTb4
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab60b4c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u22DmsK4ZUPFP8xnqCcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMiBTYWx0ZWRfXw62dULTL1KFs
 BTksBnjDeJ5jvKTvbj/BVsL85wJMPU4vNhzSIleJmLbkII1SZjUDDfGtUt3WvFTU/sKtTUA9KXf
 DpLbQbghFuNKgJlqJZNbhaSNxCEp9i0q+gnkeeeTL0vJpAr2tUEG+xSyqs7BuQhpR2Yp+UL9bs/
 kuzC71h0rxk03cCH0j6P2NZ3vzr04peAPg4lJEI00CtTvRUxeM0LMQXg949/2FCCPHHqiEgGeRA
 chZmmLH2LsqU8D3JLlfEg+z3GABRM2/ci5IzGUJn4luij8ERXWKJOzbpthaMWjhnyee507MKlXd
 XrrZWa8HM1Md3AimU4OMNzC6GODB9R/n3bcvGhgOG3hNL0nlP0MwvqOQButemPUyMHAF+/SWsbe
 QT8Nro7TdMA5MafF7PAw8LqiQntZNVasHg2+wwL9H4RtCZIdYuSKcCJQSFJYM/kUx2VbtT32ego
 v+p4dCoKfh+mUBY4MEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMiBTYWx0ZWRfXwXHhECgdWbeG
 u9yBiOXRqKcqQKlW2gLoibwqBIhha3ckbLefJaXzJa5P//YpfVi//A5BmS3nZ+XF12m/KUSUqv7
 VcMRlSbRW1lUdFqAYTddOeFeVs6W7Gw=
X-Proofpoint-GUID: f86Q_CvNhbLHgv45SXmlUfsnfph0mTb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250022

This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Glymur SoC.

Glymur's camera hardware topology:
- 3x CSIPHY (CSI Physical Layer)
- 3x CSID + 2x CSID Lite (CSI Decoder)
- 3x TPG (Test Pattern Generator)
- 2x VFE + 2x VFE Lite (Video Front End)

The CSIPHY block is the same hardware version as x1e80100 (3ph-1-0),
differing only in instance count (3 vs 4). TPG, CSID, VFE, CSID wrapper,
and ICC resources are fully shared with x1e80100.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,glymur-camss.yaml dt_binding_check W=1

---
Changes in v4:
- Rebase on top of linux-next (20260924)
- Drop dependency merged in linux-next
- Collected Krzysztof Reviewed-By
- Link to v3: https://lore.kernel.org/r/20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com

Changes in v3:
- Dropped PMIC changes; will be submitted as a separate series
- Dropped Hamoa from commit log - Bryan
- Collected Bryan Reviewed-By
- Link to v2: https://lore.kernel.org/r/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com

Changes in v2:
- Glymur is now defined exclusively with the new PHY API architecture.
  CSIPHYs are standalone qcom,glymur-csi2-phy nodes falling back to
  qcom,x1e80100-csi2-phy. The CSIPHY supplies and register regions are
  removed from the CAMSS binding; they live in the PHY nodes.
- CAMSS_GLYMUR enum is dropped. Glymur wires directly to
  x1e80100_resources in the OF match table. The CSIPHY instance
  difference (3 vs 4) is expressed entirely in DT - Bryan
- The incomplete compatible + resource enumeration from v1 are collapsed
  into a single self-contained patch. The pointless VFE enum patch is
  dropped - Krzysztof, Bryan
- Add dt-bindings, MFD and regulator support for PM8010 I2C PMIC with
  qcom,pm8010-i2c compatible; qcom,pm8008 is not equivalent - Konrad
- Drop dt-bindings: i2c: qcom-cci: Document Glymur compatible; already picked
  by Andi Shyti into her i2c tree (now in linux-next as 7c9474bd4a8d)
- Link to v1: https://lore.kernel.org/all/20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Nihal Kumar Gupta (3):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible
      dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS
      media: qcom: camss: Add Glymur compatible

 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   6 +-
 drivers/media/platform/qcom/camss/camss.c          |   1 +
 3 files changed, 306 insertions(+), 1 deletion(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260529-glymur_camss-27af71b1d3d3

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

