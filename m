Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FA03BD638
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800354; cv=none; b=QvfD3tPilW2CXmg1f/OsAfnAU79jcX40Y9weuf5WkS+ZfLQtO9DigSu67eFGXIX9ldXd7lwoh5bRXT87ue3M/715M69VHBtvhIMJ+jWJ9Z74a9u8gT6vB4+vzhdt4CtTI4+gjkOqZFQ2GsghBzadw8w558sOxBQGdJ+uGPtNYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800354; c=relaxed/simple;
	bh=mon6vIQ7udAC3IO+RUWfJ16cTVpYJMcgU5scN/63gyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9bXbnGL5o6t+MfezxeX1LCuHE0/g/YN+jRPPDjyfgN6UV6eurQ8bC2EjP7OGpSD/pZPSaRwZJs0S8KhIoqToagyPePBkYBvkWLse9egSXuR2GAZDoDrbC+9FLHAM4RfmTexm/o/NtU0MxCYLlzmoSw4qUL1dOWigMKmpv3A//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHN65ENQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhO/0JgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHN65ENQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhO/0JgE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMWai247640
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1/hdg0OylVKiWSO27FOCcJnhdwLfCiSrmgx
	UQQy/kgo=; b=IHN65ENQngpX3PtJhuBoW8dvtpyaKxCgHZvDJ+rmW79z6ZENK1H
	pFyIQw1v61KnDlELObpH1LXJNSzeQA21lM5wUzhnehfcMmHrE5IkVBfyfFGepYNW
	5Uj1CttmKFGjl2rHse0Nm2RbzmCLySAWG3ehhxhNqz7XaOXhW4rUm2XT8jXvyjkv
	PJzt1mF9yOLOH+PmjH03rM+0m6iscxKj15eM3UUd4vF9UZ/OCsC/WZ0fj2f+kt4R
	0HI5/xvmJWnD+kl3ZMCGev2t6PNoTaaEGMwYkhFRk07T6RFCEhPYFkL4OmNLX+x0
	cYws3QAHPIZq+vd0+FnKicSEvmDcFsd3Brg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf91n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so2364357a12.1
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800351; x=1787405151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/hdg0OylVKiWSO27FOCcJnhdwLfCiSrmgxUQQy/kgo=;
        b=FhO/0JgEYWsHNuaZ2T07jAvBrAmYClyrA0h8fq0P5QAOG9dqPIA7SQ8rDMzN/nluVa
         xzrdkgXQ4oMAjbazLlrs+5aTehEev7+hgSVBGDYfWh//hYe8Fj0aSbOXE7O/iFBOiHyq
         ShAmACrcBkNDz5PsL+xEldSqa49hPH3V1XRmZjzd3tcnLhMn8j5rBhJRVc0XVC9vTNXt
         gLuZOc9N1OTSWRT6o5rizJcB2oS9YAzKHr+dWWu+KJtTha/3XGU7HAFdxd7RPFLEDQBK
         HAVhY1I1In0xtH9zhPVQxaTX8aV0HZRnrOE+6OVdeLkMS5cg8V0c36uEjSv4A7L5DWWJ
         gCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800351; x=1787405151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/hdg0OylVKiWSO27FOCcJnhdwLfCiSrmgxUQQy/kgo=;
        b=onVDfau7dgyZzndP6OpcKIb78TnaUNSdbdRXb0G4+QMq2AqakvkyWN/evaQOwqRLPQ
         mKbyqrSmKK3Li3k5ywpYzWjbBTa5cSmQdRtyHmkOcRHVCLdiEbwtcHrtDAJYEQjrS8kJ
         flC0774+gCR23sQwNoJDLGYNSpox0jWfDsU3Q0aSlpKRRsMBI7/F4g48D95rok2LFS19
         t/tPXUjCiKT6y46BOIEI+bO8ed887C+Hg4eieMAe9XauE4kp/MJjKCyDma2LgYZHCKzy
         ndq8cLAD0V14JDzyC7TWhVoLhIuJ/q3P9LxMw728g5xxtywhBQlMdzwZlIjqwjYCE9Sh
         QQgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIY3J6ayYQdKOWz/Cx5Q8XOZG1IOzYW1AEbCBiglab6Sr9Dw0KUuZnqLKgCuHn7ExOxlu832ZaaSfW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07rwIswJGHuu4mS8CNoCrFMisOsHw6yL01yRDM7CPLM749fvo
	Lb5aOTxQQ8CveSSaNrAJCPyievGE7kDdoklzMz8MS3mwnlW6WvS2i2gIv53h3mQsYzZ5RKlb0/H
	jrHuckhhm3nCkRmS09froyAvIGdZ2OyZHPT/aRNknPxTUUazEt8XS4HTlFfG/MEiJ
X-Gm-Gg: AR+sD10CJBUkEGyO4SXY5qZzxj/wtT+WE2Zji96VCk+eqny4B7cu5VClpcDn20qpITh
	ulaP1yxUKHrGzyfjQGXb5JN3fUEtgfaV/Bb5PaebcpHCBGKqGfbDmReYSRe7TAqDlUukAtzMcvd
	U8jmwXnkuktaC5Pyl0KIMqn/7HHQOU51pH9eymVFwr+a+aqFEACXJoDeIx826gvZq8sd5ImgMHV
	D0lkqtwUXsUbyRdRzrBBOemE3nUt7t3qzm5BuUzfyzCHC1tGFEUfZNKGu0h62tsKyaAiBF6ropJ
	gSwZfxCtE97UYUeYK5OAbbnCtgWqoH8Q2H318wGtnF1PZFIYu+jLDDdmF2dJw9keVTAVlXr9xla
	863BN+ILx10Z5CNj2a48MbZD5CTQuvMWLj5c8wGyj4vTh3PvXNFMoV3/5/ZmU
X-Received: by 2002:a05:6a21:a94:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cc71d78478mr15320363637.18.1786800350818;
        Sat, 15 Aug 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:a94:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cc71d78478mr15320326637.18.1786800350337;
        Sat, 15 Aug 2026 06:25:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/8] remoteproc: qcom: Support the Nord HPASS ADSP cluster
Date: Sat, 15 Aug 2026 21:25:33 +0800
Message-ID: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX760wmwqigfG0
 FCewGyM2sprTB20xjCrJMEdXynXZlGLjfR1HuxlLFo89Nc2J4AnJRVFkLmiJBcVED+86zsMKsgS
 KqDGQVInT6McsRZ0jWB8cu86odjsxTA=
X-Proofpoint-ORIG-GUID: J7o_zCNHo_jyhq9ksMqwkUCiy9T5A_0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX9mr2BVrL7DcW
 gKK22qkQRwjnLsrgi/lIEzqY5J+b+gsr0d+i9KuUsgtCO1RlwVIeLowjY21x6bXFvlXPZlJ9ibk
 RtmymttIEVSbW8xdudRJQHkZb1NPXjX2QaxF4Rhu8LDFkE4280r/7HeRhVY+b9zaHcMZwfftQgf
 qWUjmNCR4uezwC1m5Sfb3nrMj/MCXaqs57dmZ+nGFDlQR3avbUj6gbaKPa6/b0QszIxBFiYFo9I
 2uu9I19XpXOcBFifAWild9bPimVzKydqbL1cI/Fx0K3+DNezUKMtlCh7z2hYYB/BLhwDQYdcAfE
 n3lokvL4odiv/3mfd/A5CMphOf9KMcHPqYjs2NdkJFAaHxNs9pFl8gFjiN5VZxMpqL7KZGZHJhu
 DRe9mTQD/3DI4L53hB0LLlV099QpUlsawBJakNIrDiPKAuL2nWRK96ICh1t3AZDhgcbk/vfzpa6
 wHCIK1W9BRbdlBkLynQ==
X-Proofpoint-GUID: J7o_zCNHo_jyhq9ksMqwkUCiy9T5A_0a
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a8068df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=2qs_MHxpMbuQh43gsaAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

The HPASS audio subsystem on the Qualcomm Nord SoC has three QDSP6
instances, ADSP0/1/2. They are not independent: ADSP0 owns the resources
the other two need (PLLs, AG_NOC, RSCp, CESTA, THROTTLE, QTMR) and
initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
boot once ADSP0 is up. Their firmware also cannot tolerate one instance
going down on its own -- stopping or restarting a single member leaves
sysmon/glink_ssr notify requests to the siblings timing out, and the
whole cluster unable to recover without manually stopping all three and
restarting them in dependency order.

This series models that constraint. A new "qcom,cluster-root" phandle
groups the instances; every member carries it, the resource-owning
instance included, whose phandle references itself, so both cluster
membership and root-ness are answerable from the node being probed alone.
Instances without the property -- which is every PAS instance on every
other SoC -- keep qcom_pas.cluster NULL and are completely unaffected.

Two invariants fall out of the hardware, and are implemented
independently of each other:

 - Root-first bring-up. A dependent member's start blocks until the root
   has booted.

 - Coupled, two-phase teardown. Stopping or crashing any member takes
   the whole cluster down. Hardware testing showed that whichever
   member's PAS/TZ power-off happens chronologically last always fails
   its own graceful shutdown ack -- both the sysmon SSCTL QMI ack and
   the SMEM-bit/IRQ ack -- regardless of whether that member is the
   root. So phase 1 fans the stop out to every participant concurrently
   and waits at a barrier for all of them to finish requesting and
   awaiting their own ack while the cluster is still fully powered; only
   past the barrier does phase 2 let each member actually power its
   hardware off. That way no member is ever asking firmware to ack a
   shutdown after a sibling's hardware is already gone. On a crash the
   cluster is then auto-restarted root-first; an explicit stop leaves
   the ordered restart to higher-level policy.

The remaining wrinkle is that a cluster member must not send SSR notify
to its siblings, whose firmware cannot handle it, while still notifying
non-cluster peers such as mpss and cdsp. Both notify paths therefore
suppress receiver-side on a cluster id: sysmon (in remoteproc) and
glink_ssr (in rpmsg). Since RPMSG_QCOM_GLINK does not and should not
depend on REMOTEPROC, the id is a plain opaque "void *" cookie on struct
rproc, plumbed down into the glink edge rather than looked up through
struct rproc from the rpmsg side.

Shawn Guo (8):
  dt-bindings: remoteproc: qcom,nord-pas: Add qcom,cluster-root property
  remoteproc: Add cluster field to struct rproc
  remoteproc: qcom: sysmon: Suppress notify between cluster siblings
  rpmsg: qcom_glink_ssr: Suppress cleanup notify between cluster
    siblings
  remoteproc: qcom: pas: Track HPASS ADSP cluster membership
  remoteproc: qcom: pas: Sequence HPASS ADSP cluster boot root-first
  remoteproc: qcom: pas: Enforce coupled stop/crash for HPASS ADSP
    clusters
  remoteproc: qcom: pas: Add Nord ADSP1/2 support

 .../bindings/remoteproc/qcom,nord-pas.yaml    |  17 +
 drivers/remoteproc/qcom_common.c              |   7 +-
 drivers/remoteproc/qcom_common.h              |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            | 524 ++++++++++++++++++
 drivers/remoteproc/qcom_sysmon.c              |  18 +-
 drivers/rpmsg/qcom_glink_native.c             |  20 +-
 drivers/rpmsg/qcom_glink_native.h             |   5 +-
 drivers/rpmsg/qcom_glink_rpm.c                |   2 +-
 drivers/rpmsg/qcom_glink_smem.c               |   5 +-
 drivers/rpmsg/qcom_glink_ssr.c                |  36 +-
 include/linux/remoteproc.h                    |   3 +
 include/linux/rpmsg/qcom_glink.h              |  10 +-
 12 files changed, 627 insertions(+), 22 deletions(-)

-- 
2.43.0

