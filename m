Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9D3D953F
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306569; cv=none; b=OhW57Q18AF57EG3cfvYX+lKjs0yqVTly+OAD1/JGgY7Yj7CbIVnvrrCIbqASsZ53n6cmlX7h9lT+gACHQGSw5shmOm9KZKvKsxfMDqyb3zEowVPw/UWE4JYSJteeuo87t5ELMI9DneyFuNeacAWWkxSQ9iEDkFqlzm6vCk3gbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306569; c=relaxed/simple;
	bh=laikOYLTOPsJSBO/UZWFxuWPBu+oMI4kCDbCOi9meUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/h74YHDwUwWwv5RSuT0nPXGECMI0Y0ZZ0VZAypulr1+vzScDDBbn7p2PZB1lF3PdEHzj8thPNivhGezk8hB+HlWyHS4or81VUGK4M3C5i3TlJQTwIET3wZEOmolSTiCwiEjCQRLG55dyxdmITtmZj70ZyfwPxeBQVhkg27YB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtYfg3x9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnBCWC/0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtYfg3x9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnBCWC/0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IBJX43121038
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=; b=ZtYfg3x9F1NGbIh+
	07sq+oIVUQGoBpVV4hPpk9tIzP7yEPavrTfzz4iv/I6K+0DD1NkiFAc7W58L9uUJ
	7Xw86gMRNnqSI9MVwRL/IXC7Kl6K3XL0ySx4uciuRWHjMC3YIdf1bLFR1lS4DxUP
	Q5uWYzqexts7MqAd8Rw6LrX1cJonz6CPvoZqsUrkGbl2wxbJZimmHUuBE3eVTp7D
	MsT+Az/st564yilQtSXhDrCyGxqDe0Hksk2zvLv7xohszW+3unzv1mEyb4ehB0To
	K3Qfoy3sA9VygUSjGu/Ly1jThVyGKp3z1p/nfaC8Tyjozx3EOt2g9T8NyrDcMgkq
	QGFwjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cud7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so13034361cf.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306565; x=1786911365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=;
        b=AnBCWC/0M9Cs5vzjbqMT640PmcIGl5j0kNVGUdCjanyIJIkvi0oaHv6OUFjMiinQI0
         mNnGnTJna3rhK+Ws8d9kvJfnSt3T7Wwqdr+Q32nYqVQLJbMbXsLmC6TGPm6sy+CB5ij9
         4trtg/M7pmc4bWIf04/u+s7DtVbyEJazbhHTlaybB8eXSACYNeg5ptPrUrqjtuCj0esh
         ILsLqOWC/gEHGO9QdvCAVUTyc70YbMoLyDmkm+NqgRIhX0Dq3Q6v/shc0P2usepi0tx+
         qMFCDMM4W89yXKXSPBjm2CT2Vi/LzlGguZEZCDylApiXgXd2G47J3W3ziXMGu31Na9qa
         QiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306565; x=1786911365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=;
        b=ZB8RosT9DRbVu/59Y/H2JPRMY2uZbkRqLObaejt15T5jTEVehmfk+T1NFfKfxZ4kpl
         XQ+E7xfG8Rzk3d0QsrzLr/ZWw2jNlKvtBrZFVXF9/2AblGMcdh6KFzcuTrNC+C4WcsFi
         118RQDT46oxk3cwEKDl9A9wDK+itItbRdaX2LmnV+FyGk0b6Vgv84F72NxK+dG8V511O
         BECJ5QWGU2VScOPMvs9CipwlxmK7VS0l55VV4LVIoByuoWxP7x3OyjDJWIJnWiZfMPfN
         pFd/RgfihH3Sfk6eJAVNK8tlkna+FFm1Su0lcyrADydiswpvmglgUEdQCbOejjFpP/GW
         wyXw==
X-Forwarded-Encrypted: i=1; AHgh+RqxBiftmmGjxT2RBtRoko5PtnxuO/m3KDVHjA7LUqadR9SbbLHj7zKzOIlmNABXdCf4sS2mAeebcAE8@vger.kernel.org
X-Gm-Message-State: AOJu0YzGIoAAjQA9dQgADxaF/Gcr4VMqIdOtaa3wVU/1kZ9GQjof7T89
	kJnuRxqaRCtDKsdnT94KUohsxtTnJGARVJMqCZ/mltzhI6fqJWm78dM1OGVNx2ZLuTj6G86RrZI
	ruPTGt/6OeaYf6x+fgp3KE6/FBKjyv3SPsQRRCkpDdO8AgNTtllwk3aBn13KXPhEy
X-Gm-Gg: AR+sD11XwtOFKXW/8zpyYcF69T4xfseP1jPSNzp/Nz9R+UnkcDCjyQmUIs2MljlqdgP
	jNSMd27MyctTJXFLI+z21l6L0adS7rMWMFCzs7Ib73Uy66x77q6f2ggWavfZs2BoTl9FpffOKyb
	3QlfzTHfG9Z3rUcPZvrUrKfza5oA+fr2IUcjwV/pRf+XySW9yjePZuIMUpv7DvqzSntJaTOrZ09
	PcoTY4TiXzE41Nh8Rsjxu9dagRL/ihsBxk352KlkRsDAOt1mpETan+MEHQ1esmM2pm09wDpRX/J
	b302bzpljV/OBdbijQLaYxo1RmymzX1iNh2Sft3K1MPedbzDDl0XSNT7/GIXsxBWu6Xq5rdfKp6
	t62t4l+bjqAa7edkurl2cLK4yqPIHQMVf9cnddtMAubVQrrXhizQFvKttYs7aXaeAKabu9vQUI0
	2W79vaPU4XnINw+w==
X-Received: by 2002:a05:622a:90c:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52d20a15f56mr185842171cf.20.1786306565332;
        Sun, 09 Aug 2026 13:16:05 -0700 (PDT)
X-Received: by 2002:a05:622a:90c:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52d20a15f56mr185841631cf.20.1786306564888;
        Sun, 09 Aug 2026 13:16:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:46 +0300
Subject: [PATCH 07/12] iommu: qcom_iommu: restore context bank state after
 power collapse
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-7-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=laikOYLTOPsJSBO/UZWFxuWPBu+oMI4kCDbCOi9meUo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uG0cDyKR2aok2TJTyzHOzP3um1LRqY9Ani
 w7dGVPzYfGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1SzHCACG7PZKV6+yM6wpDsbk6vicG4zkkgwjq03pwyL5oFnACN7sLYz/WbsK0l+18ZKvlNMLeBW
 EEUhNOOCq0YbDoP2iNeLSgLYxQUuVBC1urvUqAfaDP3OqkjZaEgNrX8KJOzOj8o95JrjrtWpDQH
 Vy/z1GgHzam9eoQBgKmo3On+turuJSrJLOR1FUteO9GTyL+Ld3v0iNZcmoefwJzJVcH0hR0AwBq
 0yLXTx2t3EB4W2UBh55EbwB+DsShzHBaVZ3Sg/q6F7ZDcrro9rhRnHBUpHXutDjfzN/FasiBdG5
 t/bz6zI2xmO8wJDBOKF3IFVIJSvUiOo8IZh9EefdMcXDMLdc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bPWo5khMIOZa6nyhtCE0FJ7og0nV4IXZ
X-Proofpoint-ORIG-GUID: bPWo5khMIOZa6nyhtCE0FJ7og0nV4IXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4NCBTYWx0ZWRfX8ibhYlc+Q11l
 r7N7+zkN/O8ghwczozi2W03D8XselgUNfJJjik90h3NzDEeEQTQ6VpZ3b0y5XYoMml9AyUOObyX
 H9SZEgR/eJVsxb2y9WPr8WMsOficrhEFb3QhOB6kqupmoAQsXyR6iWwdMnHEhn2NgpAKMiq0e94
 UQMgysPjpebiowsPQoJfFsTMGrxkTvq12LEokLJYez0Mr3ktqWakkcaWsJS/M+ZI30W71U0fgId
 Tv2RbdoEiBV3iOBtplgtKNterGJSD+EimqqykQAQjobiZS0azLcaFfR6q19ZWgjGy5Q0EwDJTEP
 m+cBCz0pzEo3IQ/P0psP0lr0dZxA2TgTKoBWPxCXAmOBsX2Doceef7I5OCrOGR/PC94bkhlteY5
 4KpZAZTbtM5JPjJ9KPBhouudD0cYloMy86fT9vS/iwpUhMPJF7m6uvmYq2572hRjf1O878/tMkb
 d5vHB6Gzgdp/CV09eLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4NCBTYWx0ZWRfXyj+zP6a1NoBI
 kRimG0ePdKxED6N5y/lfKrwm4a+sj3/MMaBvsrWvqTFStuIm870PFO8RDMjLFDNxtxhIsRs0fDS
 yPGJyopqoNM8jU1Wn0PavOp048eEf/0=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a78e006 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DguvtcLGRnFhd48z200A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090184

The MSM8974 QSMMU instances sit in MMSS GDSCs: whenever the power
domain collapses, the SMMU loses the global and context bank state the
driver programmed, and the next master transaction faults or bypasses
translation.

Cache the computed context bank register values at attach time and
replay the global reset, stream mapping and context bank programming
on runtime resume, for instances that opt in through the new
ctx_restore configuration flag.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 3b07c4cf23fe..8e9488c47d5c 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -64,6 +64,8 @@ struct qcom_iommu_cfg {
 	enum io_pgtable_fmt		 fmt;
 	/* the walker faults on the AF bit despite it being set */
 	bool				 no_afe;
+	/* context banks lose their state over GDSC power collapse */
+	bool				 ctx_restore;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -94,7 +96,7 @@ struct qcom_iommu_ctx {
 	bool			 secured_ctx;
 	u8			 asid;      /* asid and ctx bank # are 1:1 */
 	struct iommu_domain	*domain;
-	/* programmed context bank state */
+	/* CB state replayed after power collapse on OS-managed instances */
 	u64			 ttbr0;
 	u32			 tcr[2];
 	u32			 mair[2];
@@ -1063,6 +1065,7 @@ static void qcom_iommu_device_remove(struct platform_device *pdev)
 static int __maybe_unused qcom_iommu_resume(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev);
+	unsigned int i;
 	int ret;
 
 	ret = clk_bulk_prepare_enable(CLK_NUM, qcom_iommu->clks);
@@ -1079,6 +1082,16 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 			return ret;
 	}
 
+	if (qcom_iommu->cfg && qcom_iommu->cfg->ctx_restore) {
+		/* Restore context banks lost over power collapse */
+		for (i = 0; i <= qcom_iommu->max_asid; i++) {
+			struct qcom_iommu_ctx *ctx = qcom_iommu->ctxs[i];
+
+			if (ctx && ctx->domain && !ctx->secured_ctx)
+				qcom_iommu_program_ctx(qcom_iommu, ctx);
+		}
+	}
+
 	return ret;
 }
 

-- 
2.47.3

