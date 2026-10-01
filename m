Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ED8371D1E
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847506; cv=none; b=cKJsJVJ7xA33wzMFd/fuOZ5J0rrCXJFREzUDiru4qceDi3ZHP6xNmRSdzZu9Egnmq9hH6woM3B5SePST3HKkWCjDwkRq2Qb+jEqhE2rFvBGuM5ctQYUHkQcRck4o4WGlsK1vTB3PBDKsinRPo+gpfvn4B9uVWJt7IHjaQHXvfJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847506; c=relaxed/simple;
	bh=DWooC2VkfML8g4xa8rXJoaau/r5oJ8SbUeOK0UZy3kY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eA3rzEpte/F0yFOOCbaQVVSuUM+cKpgaHPqMODItL1RfqgZM5ygWdmfzgxG0Bqg3d7XyjVAohWCJLLt4dMgQ89gyRc51Zo/V4ZWwt2zfEBgZPTQy6WoVUn9nUIJNXrq6umr5d2FErYQfMKEFN0bBly2cq9ZTEAKhVrUNkGzTb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGROtd8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXHvr3ZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGROtd8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXHvr3ZG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNJZ1062184
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 09:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EvKMpWanvpqCgtKVhF42kRfvWBmd+tcqJ8h
	5PSGSviU=; b=HGROtd8Ggx13AFN2h+NozbAX5FHkzOwO8bADKuZ/4Po9GS9wp3o
	E4PsdniWPSr6lacy9Zw4wE0RtovN9e5w+Umm94IJX81bE+cqaiO/DeCh9KpQErQ9
	vUD2UHVwnaBz0zbDJGMLvJlxhrZDbcx7nECJzA7V1TPM/zuULk0D1O9WCKebd2is
	+/wP7Ebnit8YxPbFw+8GP0AgnqdrQ+Q+nvL53m31dQj+4MEEDGJHSlDZ8SrpSmv8
	kyTePAcF0ikt0f3zum/s3XZraRWz+EKF/qZbu89b6r+Yv8p6NuDIHk7USeg3mQ51
	q8ZLua2SdrKE53aRwnm60eRWC2IwX4WSngg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvu342-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:38:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca4a2b9c4so315809285a.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847503; x=1791452303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvKMpWanvpqCgtKVhF42kRfvWBmd+tcqJ8h5PSGSviU=;
        b=IXHvr3ZGFRJXa4SUzHfszxQHQy6bCdFV4lULoFErtmkUpySwpsqOkpp0L3pomNmSgs
         nAXPbByhhBE8eqnHHFsNdlkIYq8UTYOZqMHVk9S0pDDKDQSPvWTAwnnnWDRQVU1q/nH+
         9C8fqrbWupciEMw45z7nzsEB3jr24OITjq385mdbGoeyqnqyVVIozjdsMyI84wQILCxq
         GJA2B/1XzmgLi+/1jNrX/A13wlB+2d5cHwHsIr2Yb4SOGFu+FqssHLyd6uruTKLjA3BB
         xZuYzGeo5VItoGcsd+Rn4TVJAbtButAQsaa2A6Oco1XQEStmByIJsXbteurTsIxu2TWW
         Vl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847503; x=1791452303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvKMpWanvpqCgtKVhF42kRfvWBmd+tcqJ8h5PSGSviU=;
        b=zWLiKejpqtYj33vZnVUDLateMnKtyRMPcvFKQT7fwFPGQtIr2E986eqKEmn7W+79XX
         FuP9f/DO7Hu60nPEujcbqIVmREOkK2VKaISTocpFTr84TbQOvm8pdsX2rq6ZumQtry93
         S/XQF9PEzwSp23qMrV5/cKSMu36oTHh1kxVXexz4JKSUwMhRyas9YV8Tl8u6WzqZUlTy
         oDWMsh9ZgDMtFRslKeHIOT0eJmcchQKS7EKb4E2YmCrTM7JJwsDnVBsm0AvcVG2Yn6BO
         2/60zkHNBxgLYBInx1tIuoyzP3n1lCcjC1rD71ubPXdjA4x75LFlzm56W5q8BW7m58BB
         AJsw==
X-Forwarded-Encrypted: i=1; AKwUvBzBBYvqjtsWNlym54E/X6UaevVPV7ZviyPwjytvhD9OmEm+wMAVxFz140PvztFTISmbt3pkNkagz/Lc@vger.kernel.org
X-Gm-Message-State: AFuF++mvaQ1BZoUPJESdZYHBcS8KU4DIM9kLGHAS0n5syx+D7pq8/9/+
	cuVTKjJ1AEDxBdaZLbvnYSP8i6XDgdouKbHWmKvncQw+I3N9ovNbfi8TPPw8yWk8/pygJK1mU+y
	bYr7GK1hRoBvkIVpevzwkde5Dasfyf9aMX3lgT60i7QALLDe1fW4RhPGH4X3/aRX8
X-Gm-Gg: AYBFou0lSUgL2HcsjOqYEbXtBZZuvM976RXGrLazwV24nfxNwwXyYuxS4Q8yCJfmKVa
	yt88C2mVJ0jYHcXGF84Niud+yQ2lR5fWfo9uRY/34l1VuQSuUsTfYYufRdF3GOgunrjc478bPL+
	0I0uE1Sh8OtoSG1D0b5QHTYH7mrYXNZauDeAHkTQGKf6yhMnhYYbWK9QN2134m1fRxqIL3ueVrB
	oVMlTvdkqASSnrfw2p2fzeqw4mOxmBUWA1ZWmj6Cs+NpXDjBZw9AsJVCeuzMGjOnl+S5tt8xeoZ
	P/eiTbHeHX3J4sJSsvuw3tjCP+CF9mYKuYa+NLnNwhfxvbRxSpUOH4U1V+1p8y+YVMM5B7PX8ar
	1pO3KIh2p/8Si
X-Received: by 2002:a05:620a:46a1:b0:93b:eb3b:dac1 with SMTP id af79cd13be357-93ca9743652mr730817785a.18.1790847502952;
        Thu, 01 Oct 2026 02:38:22 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:93b:eb3b:dac1 with SMTP id af79cd13be357-93ca9743652mr730813785a.18.1790847502273;
        Thu, 01 Oct 2026 02:38:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692b5d7sm5231750f8f.28.2026.10.01.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:38:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soundwire: qcom: add multi-master support
Date: Thu,  1 Oct 2026 10:38:02 +0100
Message-ID: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RXEHMyRnekRyphZy6pCacvFnqD2zYQJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXx8luYzZn4T9j
 eDEUiRLDlJ6LdxDoQwnI7pgTaNmgT/rjPoj1C9NctFFKoyqNTh0LCSBYQxFQ3zOoOFGGB2Qezyt
 9Y+C4Z2JUAUNgme4LLZnDqn3YmUfoW+rvvVNQ15F0jHt2eyjPqYalGo8pgyJ+7+GTUO9Wyn09kw
 8005FmxcS+cRKMjJHUWPoUwbZgx6pQDyPFOzT7ABUkmA9raFT2GiYICkn2voUr8A+7QxKAwot5f
 hwvEnrKL0BGssj/2HIuY2dvF8seKanHiDWbFW7cs+iKmsQQms5DIRiRr1h11QztfvHIS9V+Lj2+
 WhD+aQtIqqVkyMHMXI8zgOZlMRTfPCsgjE34r/uo+QtRqTT2ERmVXJ97avksUbta6XTy7MluE5O
 DlXvTicMDxoMFroI6h5lBMB5CE8xRv+vHaPcaODx3+OjHnINTShsNbK1wGuQ3QU85xsvAywyDiz
 VKUrYjx8VUAP3kiWEUg==
X-Proofpoint-GUID: RXEHMyRnekRyphZy6pCacvFnqD2zYQJE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7DBCvOTwGrXR
 re3DGqhEsABG5oZYfEqOJXtxbQGNwBlE4mju7QnhXQttWZAZI8neZJuqufMfojGbmxtFgjv4oBv
 KLMWwqbJGxBWaVtJpJ7hCjFPyLjOgQo=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe2a10 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=owqDj3WxTxIMLBZ9Q5AA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010038

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Changes in v2:
  - Dependent-side safety: skip ctrl->intr_mask and CPU_EN writes on
    the dependent
  - Probe init order: run qcom_swrm_init() on the primary first, then
    on the peer. The dependent's frame-gen poll cannot complete until
    the primary (sole SWR_CLK provider in MM mode) has started the
    clock.
  - Peer teardown on probe failure and remove: disable peer SWRM
    COMP_CFG + mask peer CPU IRQs so the peer releases the shared
    SWR_CLK and devres can free the primary without a dangling
    back-pointer.
  - wake_irq request failure now routes to err_clk (was err_init,
    which skipped the peer cross-link teardown and leaked hclk).
  - qcom_swrm_remove deletes the sdw bus before clearing peer_ctrl;
    in-flight bus ops dereference it.
  - Re-program the dependent's MM_SYNC from the primary's
    runtime_resume (dependent has no PM-runtime of its own).

v1: https://lore.kernel.org/all/cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 108 +++++++-
 drivers/soundwire/qcom.c                      | 261 ++++++++++++++++--
 2 files changed, 341 insertions(+), 28 deletions(-)

-- 
2.53.0

