Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9974B52ED5E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951070; cv=none; b=MRct/3PCl0d/mpeKDOZvxleoPn70V85iW9RQn1K0Q2GEc4+ptg7dxwoymZ0ri4d1sDqz3S57WQXCRM1Wlbl7dffX9Sx4nIIJG4lF5lNxx/kTepRo0LH73XiLpdkbDSAFusWW5+/G1oLVq/whJB+KSv6SjpTDmSt+4R6cjD/QL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951070; c=relaxed/simple;
	bh=XyOIHtjc04/yJvJbnstL1jpJRMGbQhS1T68GYeytCf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rV1sF00/sfrrNiB0cmjTpC/yBf8y+MJek0pko1rcrR0WdbTlDr87JrbZ8IN+sdXhfawEsY0pKyymucPkwQfKgxDsbmCpt57GTQPnVWEN0ADc2dB2DMSc0Z1lgm1UKl1xXuu/sGgQTeGh8x64bNWi8D/uienukGYXphkNT6xadn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awNr8hQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbYFf7lr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awNr8hQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbYFf7lr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ATmaV1677940
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 10:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KE2mNw13WoP9hs4aiWcB5lve3gwFX44yO6O
	G2JRWijo=; b=awNr8hQ1MfX+jPQNzUWaptaD25P9LAKMCOXStb+LQ9r15ij4ERN
	ErNFmZMP19ic/Pu6cWrQLGLVfrf1w2pbFwCoOniQj+u0xHoVr2q+m5admSmrXYk4
	sVsWK0APR2Vsh6YaKQs05G/2H1wJZSusl799s/NLGGF+jyV8nK+sbWagbbRFE3rA
	QNr8A94/3gkJMKsldwHPQrJwbbiYZmcTVFiMFSuEdDdZZyIfug2jdwG6CJolskri
	b1tN5FtV6hejKL3rHguBJPmjqOazpa9BwxYvG5MmjujM+vG6TF6ZXTlQ8hMKyn4Y
	fZYp8sj4edFq7DOSQ0yJpqY82QQZXhN6vNA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj093h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 10:51:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1123860a91.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951066; x=1789555866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KE2mNw13WoP9hs4aiWcB5lve3gwFX44yO6OG2JRWijo=;
        b=ZbYFf7lrMzFRyiCsx0UNwY9yujmEuU9bmIYtBILXJ09Hxv5SWR0VSUCrNUcq1Bl3I+
         7zdUtSvivh9WkLeSfNUKVpzdmmn97OjSKNsIqT2ablOR6K8lT1h/e7oMHdFn6zBVqOKf
         9Ow2Ref/eDf+teSigLF1KTcxfVL/OpRrStIqUQMBYzEhYWJMbf+wkBgBhM1aOuW1st92
         dudcv8vxqbfjXrliOp9QvKhyUMlcbHBJW821kab7fuOk8m5rnsz5P7Wiy2zGHCLRgdU4
         kczgv/dcTwLhdzxSsPh+KIgZkwK8R7SCrngPEBoONrX8jhpXpg6J1SLHYh6h7eFCW78v
         hDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951066; x=1789555866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KE2mNw13WoP9hs4aiWcB5lve3gwFX44yO6OG2JRWijo=;
        b=kNH+T+iOhZabRY3UWbu5duAyJgcDBJF5VIM74Lp/VQqJGx3wBT7jg6d++pPTmUJR9z
         5PbCix/v6lxo4HyKfV74UErbjMCclsfvBJ009It5QGiHohEa+BsfegjQEtOp/b7BlVB1
         4u3TatUf8C5/tOrcOXp7irEfYiyuRgvx+kxzD3Yt1hm1KJANP8JaXtRUYKzH9ql4B2XO
         +luMnrvqRBf+UIWZB7RzaDUhRUy1mwF2OZbZGSAiO/NwTV1WOx7U4zThsotBQpnEg91t
         sCCed2RDlPCA0YygHtLLSFzy2vmhnC0NHOs9FQIGLbyKP3Qfwx06DQcZ/gaWNK0ypXcy
         1JqA==
X-Forwarded-Encrypted: i=1; AKwUvBzXu0bdXuGkli7ic7pMXInv7YxcwBDqtBw5iNfMW3HmlRH6wEab2NsbdfhxaxDGZjOzPN8EfNg+CH6E@vger.kernel.org
X-Gm-Message-State: AFuF++lX7EBsS1SjWErUXNJvftSZICckjSqnvnTxWCnO8BULtXOg22S+
	OFdK5X4RpReg9ZrzVkxOKPrOsLQRCJC9HPYrIFCroHDpqyod3MKvQm63iBLXP+h+pb3cZKfduSQ
	nvizkN7SBeJDlK3PFf/W3DYwICGo9pNsGazUtPj6QaUPK5zXi/1T3GuZNL+84mNo6
X-Gm-Gg: AYBFou08LQjBtmd9d0gbO7epuuQ+2P0A87/jKXKISu6iscgj6GuZ6ld9VrCKla7PsGF
	O6gQaxUDOLSvqjn2cC4kfOwjvJ9r7c/ivMaI7ZM5foL9SrHG90qSOYKVxA5z7Iv4FpjcriS/IhM
	F7f0RwzlnNiMdXDf0Ry51CznRw3oZFH+zYisI13tiykXOaJhPJBCjhP/6Z+cme5KJWA49x286DD
	QNVRwo2he3SSCXcHzQPt6lkL/A438sxDraoFnPy1+koRZ+XcwXHLc9rHORiLiVmfZe2aWE7/Q1A
	tkPLThQjdUGvQNcQmEDqJHGslmHSamauHgCZ85OLkk29voE5pLN74i2e00iEtZUY09Rj7E8NsTS
	TF86BAcve2Lbje3qgtkl4PmuBDmk=
X-Received: by 2002:a17:90b:3c06:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39d70b4a2b6mr35807a91.15.1788951066083;
        Wed, 09 Sep 2026 03:51:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39d70b4a2b6mr35739a91.15.1788951065449;
        Wed, 09 Sep 2026 03:51:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 0/3] remoteproc: Hawi CDSP support with per-PD
Date: Wed,  9 Sep 2026 16:20:46 +0530
Message-ID: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX9thodoJwQGnP
 Pf1sWuWpFidFe61PTfTms7FerzeGwCHpQCO6vFHke/IvI2Upvt9/cHBtXX86NDirqklQSNqbFf+
 W/r3RkpArdCaatLrW9OLKSCdf8+E9s0=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa13a1b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5g8txmhWQN_fPa49kPgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: rwgmsIGdvHFkgO3OGvgLg8YjJcroOrlJ
X-Proofpoint-GUID: rwgmsIGdvHFkgO3OGvgLg8YjJcroOrlJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX76D7sxa5Yz6v
 ugm+MM2SVEoLbZ4sqgPbFg0sqNijPbihZTx8DAdhpKaysVH1CpBNeVzsbITBilSznTxIeGDRLWz
 /IWZBQfsl4UYD53yV6jdSUQlTZj79GxlQ7nP517IBZIW9/+FwW6WG0IC4IuJ3kLoqSiJnCaLbTt
 qVXQvSFJWUHUAH9xJcvJXR1LTpj5909sN71OiGUdXHEmRFyb7tHDokHxNQ8hoYjPlUjQg3Ib/UK
 sUGnOxeG4OvCxvc9JiroWfV9cmQCq67wHarsDoNgx2n8Z8z30GyUktpP9FaI0KktvsdVsI4eDHp
 tg7PlVU9enab87iJaetqc0qYJhGISqoyXUfFJIlvrBjWFbbdvOLznERctcDlicUVmv8DZ4pfRxC
 mc/5B9Za+JCbg0AJvtAL471VB6MvSWaWVaV4onDuzlbciezwM12Q4EHcxNx485blSdRyEM/bZ3/
 5UEu5LanqvBxk7YOZ2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the hardware-level compatibility.  Bringup revealed
that the NSP proxy power domain on Hawi requires a specific RPMH
performance level below what sm8550 already supports, breaking the
compatibility contract the fallback string implies. Remove
qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block, add it to
the standalone compatible enum, and extend the existing cx/mxc/nsp
power-domain constraint to cover it explicitly.

The fix is two-part: first, propagate the dev_pm_genpd_set_performance_state()
return value so the failure becomes visible instead of silently proceeding
with firmware load. Second, introduce a per-PD performance state table in
qcom_pas_data so platforms can declare explicit RPMH levels for each proxy
domain. Platforms that omit the table retain the existing INT_MAX behaviour.
Hawi CDSP declares CX/MXC at TURBO and NSP at NOM, matching the hardware
requirement.

The binding and DTS are updated in tandem: qcom,hawi-cdsp-pas is made a
standalone compatible (dropped from the sm8550-cdsp-pas fallback group)
because the proxy PD behaviour diverges from sm8550, breaking the
compatibility contract the fallback string implies.

---
Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/


Mukesh Ojha (3):
  remoteproc: qcom_q6v5_pas: propagate
    dev_pm_genpd_set_performance_state() errors
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  3 +-
 drivers/remoteproc/qcom_q6v5_pas.c            | 54 ++++++++++++++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)

-- 
2.55.0

