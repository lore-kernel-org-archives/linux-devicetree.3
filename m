Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC163FFAC6
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354614; cv=none; b=ErBP+4nK99U/kCm3QCYjvOsO6+h5uPOgu9XPz5ftCQ7jYa1mPbid1Y4VRV9JKC7rIj3md4RqL2ecrswTRLK3mzlVQhfZIEb6HrF8mj422J0qxy9dmW/REpQ+t89Uq52mYFFJHbonasGDOr9RCnewtb8Gn2VcZz1hcJCFiFI+EKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354614; c=relaxed/simple;
	bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nsouh4O34UOa2YgY8rJy/1BReTJ8DDfOKQlTKO49WqsY1wGRdhlgbCBtHDzp9xXdYsIXKLsJZcn/2c5CO+0ZQipWz+6V3qC0RolnmmwLw9qTPwDzaU0/yvIpuyVLiZByZuXnfEFkOFaKOU5c1M5Qi9UGypJh+74rw+enKUfnhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIet/CON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/lTjfTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIet/CON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/lTjfTB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U9Dl3264005
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=; b=TIet/CONig7AtF/B
	2v7PGAl0tECSvmiuV/+ovSoz3rdEARorNEBFitEDjTckJzpIl3dvDw7V+De3Tgzc
	4BRqFxvEQvh01VuzIElGWfpqeij4KyYIjLo3VOh9d0IrHrrymYj6hNyzzz0HyeCD
	SrJEXyCyTC/CA4tKv8v+hLyCUiXG/XsHeAXHzVk5t9F0zX7O1PwtBtlTKTylAU3E
	ki9u270KwHPHffXGpjY6Ka4/wJwgU4U5On0nbUT3cYFwML7OHto0dBXDkfC/Oka0
	S9ygVopEYPn5NZZbJwhKAJDY0O+FIRaHtrIM3BKVayikQz3sfm8/Z/CUjTnVLbxB
	A1FjIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c608vbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:30:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2915175a91.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354611; x=1791959411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=F/lTjfTBP0N9OmsN6UrYQXbIyFV9ZRaCwekdto88/WUxpxuzrbIwLGeK6QcfF55FGv
         KWUHkUUNY44YQT59EfSdP5zg38ExjmSdtO1g000ciIH1d1tctbMCmTi1s2Pwg2TIzO0w
         4Bbl1PS7VqxoWieq3+MdaXNynzOi4dJuGALf9ZLSRUzNqwHcz2R5FBLMFpere+olbx4Y
         qoVBlYGrNJ9UvurGflH4iEzD4xoXaDYjk4FUYnv7HZwGA4WF4TeMwi/KC3OwP5lPghPL
         qQ67KBLTW70ldKonpRnJEo+iKjEa2zHkc12KbV8QCw4P+Li+7iqK5p3vknIjlKYZCT5X
         A8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354611; x=1791959411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=cypiMsrZI0jljwClS1sJskJL/syweR6U3uVFKBC/8Zomj1I+EzmMAMzrxFDjFSbxMK
         NfGyvDksy7eiu5H1i/2Wlyx2l+M+X53VmoW/sK9ksrSpGWFcXVprqXI4VEsHdmUWp3Fw
         DRR0geD4Ck+AXuM6zy/g6V9hEuYETEli+sHs9LLNISAQ80yRgLRqiH8AZhl8KDvWNaE8
         iSi6H6I9ZSOxvCL+fVNWFtFnA1Ro1wcaVtCmDD1J0UcRE18ES8ZNMvHA0BiyOthyQ7O+
         dtIMgJYIyYKVymtx+oTzw88V8ZSy/5zx4BCHa7vYN2TrarAH4Z8m0qFv6C9pN5LKMd51
         HlYw==
X-Forwarded-Encrypted: i=1; AKwUvBykWTSpo6FkeVCLpCaE1LWd8rMxotVuJ/FMhtbe2vpFQfcP8A7cv6/bFKCPu2xqh/2mG8+5SoYBxWeW@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ4Z4NrZQTmS5bGbPg9lOL+AGLKIVc070SaOZTmAnFgqn6PNGl
	OqyYmu2MQR0jnBGJpVhA0p+mG6PbEJ6Km7wiXFWeq3lWveRrtC/RPC2L9maLHw9t4CzajklV+Wr
	YT2TTWg2zGNQpgyPpkFP3L5NYaAnraOlXdTWA3f6x3TJAKMMgqQsjROX7VxNDPytR
X-Gm-Gg: AYBFou0pRgGrlUZOCD3gKL9k7eyJ6qLSLHClXfyp5u2xZP7Z0ZDqb8lA83zHhvTSZjp
	JGVNOsjEw4F1rCDHzRTmbaNFTez+61nLNABFR1HYYGSkv/rOBYh+8oc7jJUlsWN1RD/XKGQDqYn
	c6vd++y+5dNuleEF5L779OFPIQuFu3eNmYUEzJEf3e7s5pSODW90HZ8TwsAQjCTTthHnovoq6Y/
	dsfmDav1V+BT+cNDuMXQRh/SkzWQVDo8WKB/yiuC8hdOPefmtbwm4FtjK+WG3K1/c/SXru/1Z9K
	VmkOcHfPGZjPJwt3lM1HvSYVNWQ1c8iMO9x5CVpQfzAoo074325mTXOLAqgzcicXp8SfKyiPYXD
	3+lOhc21AHpCk89Z7AINpZm7Oxg==
X-Received: by 2002:a17:90a:1581:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3a8c0dcd11bmr41631a91.25.1791354610784;
        Tue, 06 Oct 2026 23:30:10 -0700 (PDT)
X-Received: by 2002:a17:90a:1581:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3a8c0dcd11bmr41595a91.25.1791354610125;
        Tue, 06 Oct 2026 23:30:10 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:30:09 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 11:59:35 +0530
Subject: [PATCH v3 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-2-84cf4f861415@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=1442;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
 b=LWAPfyUHD/4HNyS4Ef0pdT8IssM4Wdd2mxGj3c1zmeM2ln+uM6ccnhwYAbiH+jzUPDZxRz4J4
 assC3IcQZiNB8/ufVjAWX6ahPTHC586lyxSXcUS/fd7k3rL5zptEc2j
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-ORIG-GUID: K5N3BBhuXCV9iCSAUCP9ucDHMkydlZD9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX86gfHa8o0ZXP
 FXYjJgzNHEM6ha/qIT9hXZy6rw8rMtvX9CnBWL9yGifuEkfssxFVP18SC6M7DQv8YIsaKcdXuMC
 w8cUDAgYNx8o/z6rSoNuXiDLGR9LsmI=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac5e6f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7MUb3q_Ox69Zn6kGXoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: K5N3BBhuXCV9iCSAUCP9ucDHMkydlZD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX0IZ9111llCQh
 Ulqbmn6tbE6FM8ONgTkgS5vmUBoFRewuPS7hBbNF67vWwGzed3BHWfKiaW5aNYcSN97UthXJkOg
 ci3iqyj24ItrZHI48SgDqhuNgoiUjIHkmYnSfUcmuu+xz6j8z+XUG3j8ocZkifzN93fNoP1jqLq
 w/KLjRFnniR+ZI9Ci6SRb3D9+xmnWIyRvePpqAtNlsSS8QJ+9CK9YGE877BOLsIpzTDHImaMZfM
 cxhNpP/cdKFnP0rBOpD+VuDIw5Q5qmHAX861FvY/LL67zWOVR0E3MLiVEaP2ADNYtWqzxKLRNFi
 wLciSxvyRy1rz91GepH021gkgUKht5Q1DclXeWFGEPUwhZbCrs2Q6smP/BBEsFy+auAUNTHoDSX
 /QCDrnh0lfE5NPvGpGo2o0Lz/6R8xI18ooppl2xYiGiM1IOj91UImyLurrB/4gfZ6r3Aw6F9SYr
 HQGrZlb04h9I9SeE+MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070025

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Acked-by: Martin K. Petersen <mkp@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

