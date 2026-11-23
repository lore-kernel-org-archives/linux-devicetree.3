Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454069;
	b=zsej45H8J6FkkK5I1ujDiNf/q2Gh1eiQnGKwpNKLWttrLkv7e4N8tfv8F5x3Ng5jYqXk
	 nNDBzj4Jo5atfKZAsqS8v+aOKvWYyBaQZBhsD2UBlfYvbu4YrqGV+9FoXxYS9kszcziok
	 bCESr1LR9P/mmyPbWTFL+vORzURynmGpp8bOcgZZJTCZMoloYSENlZgxg1l6sXs8/BTeB
	 54N3dJ43s5v1tIneWoyBj0Bm2QcX7ZAHEka3gcbn9ERUo+k4r5pYarswYhbSFcQG5LANu
	 /hWGld5tO+L+AtKMDuZmJeTab6ETfMIvXwmj+CHudDBd4HVz6i8IhwRy8Mp7f1HpXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
	b=1EUkSxiftxg7hoHgGnIoFkEria4QksPSW0ZYLFtq6BPtpwqIaTE64zjoF8kvZM80F63l
	 TpaBpUy1gFsccnQX72Vg4gfV67ooTTLUTK2gO+LFJaKKFOCA46Wle1zOLqqm0zrGFT2Gh
	 i5BnEbomv+XhPGtKl0i8iZVyuzgz8lfA9CxUmavVmfKdXR9Ck09+ZTd9+9w4Wh/igaQvJ
	 NLZj5jrlQK/keCB1MRzYKEbJQG8THFgb+viuNF21nJdZ5UQ94EO1iJzCE2RGir/u18U0V
	 hogoVtUab/MZWbz+W9DEZRFH1TvCJPAXp/whcuV2dl5erGofGRGzz9iT3xXkBSt4eBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08160606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08160606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtoh1861560
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2
	l/yhw260=; b=kNtD7xRKKfKPufQqHWGDlvpUdKfMbwYMs+CfxgvwQwrtsoN20jH
	YMniMJZlfbb2QXZ67Ulv7v11cOe/OB26lYk9meK78i08hqTC6ZDQZcejlAOMh8M7
	TWROgOrZmtEfUB7caaEgZ8ChtFRdtUTqiBjEhAMZmYQo/lzY4D8wUp0wRdgdkz7E
	xFg4hJjBTeXTi00A4AJtCpzF7uNyCVueIB76LQ5TLhyrlohpuhhghKifVap7Tkg0
	fxhVp8HWdBp302mvCxTf0CYJY9GSuqjcDavUMARGrBgBHaclFFGAyNo17CVguIn1
	2oe+hMPnz+J27ZlKi3/hYY+ddw43s/XB+9g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2gmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677deb12bceso5681344d50.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454067; x=1796058867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=RUmta1yWodRd96hJYYv2QoRLP5No4YuO3ZX+fX4ciNb8DKKQqWt+wal9AryXu0DfJR
         95A6Nr4QQod1cMERl5egpTI15YLGa0DiXrFPRJElZq9vqsqTwIFT4hk0E1oeztEzBDyf
         TY5BhoZYXsnz2vi/uzm8weJxyn/hA1G2+eedTqMI6b8u73kb9AcImFHlLvl0MR7qdjIk
         b0Ter+KwzQsVijx05+KzggJLpRgEJqk+6T6leF3A8dU6wzGZ1pVE+tqzPXgIgBlbRHqt
         8gVy804Mp0IGtILodT34PqfOUvWVPAdB0hEBZtP4E8uh9R1BPZoU2jnEUMI9M2AiS5Kk
         cjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454067; x=1796058867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=uQM+DQ1lo12k1E11LZGQqeB9n04bhQklzzHkhITcC4Prvu2tkdDyRKFim1BN5k2tV5
         fxMjEg8HuxChZZT+Fy53/BkzIQYdexBtmzaEZI1F5+ehQzgDAiFhznMsdaxI+HZR5h+m
         bM38MiqqVk3trPYhsy/tkCVakiZEmeSjKP+JkiUOWoVc9+PC5mhiuNsQV6HkZc55Vh+2
         5+yj+7BCe+KXhsYVw8rhAtzX8T7md81t6HQYOC/S6e56mLeLsGNhfBJkmWuJD4ZOMguC
         EcUx/QK48EdfpFgaWoxE3vpv2YfGI8T7JH5gxfFICPWSBJzBYCQRZHch8iY60KkWKJkx
         A6zg==
X-Forwarded-Encrypted: i=1; AL+hErFDuefVwSSV9uQ6S/J4P5uzmxG91FwwlBFiTOdryeuBABmoxa4YVMzopVeMLgTtUYGurWpsmOHWLxdU@vger.kernel.org
X-Gm-Message-State: APuU4Z9q24YJB9UNrUm2AyFo8xboTaSHPR2e3mQCid1Q9IDrQlP2Vo7M
	JBMrokIKdNiALuzDYm7hL8kCpH97jO/rO3x9dL8wcVqRkSXQPoq9tA8okpnGsicHxCiVHCn0zVH
	D5QNogor7sUNNbN18ZUUzNZ1O6mnueXxjJzQpYRkQtJQ4YDddymQDMCQlxykfLNXs
X-Gm-Gg: AZFdTZctRwz65imcFKilzHARwplPW/ElMk8us8/O80gVPnXwRzXFuJtCRuz3X2LNfmL
	S1swc0wUS4JL608NUWX7k5oV458zyKy0CIEerNiKf+5UO2R69wmrgpEpkmjGu5wAv3dKzLFXr1j
	wizPsLaYeo3vvR72x0QYPzag3ZMPq5YqVc+KTey04B5bi1u4tfSm4dPq4xmR3GPxZshFb+aaJW7
	57TeKQTjdwng72PxJRE8NhI4404DGAwye4cR9s6YBEx4WBrsuG6rRbBb688aVOtmp5ijZx0dWGg
	rrvxIb8xgVhJPrNm7Ga5BoNv3gXGpWLSX7V7fsUVxQpVm1EeH5qk5kBz6VQo0K74LkaGK71lIo7
	XE4V2Lwb0mwVAbGIcd80Vbj+eOt55BpfNI7c5sEZ6a5/PBUJDtCuytqi+nMoZlE8v
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150744d50.137.1795454067138;
        Mon, 23 Nov 2026 09:14:27 -0800 (PST)
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150728d50.137.1795454066646;
        Mon, 23 Nov 2026 09:14:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/3] soundwire: qcom: add multi-master support
Date: Mon, 23 Nov 2026 17:14:08 +0000
Message-ID: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX3dpc8VVPYrrz
 0YAT0OfGFntZAYitUxuNVpxoDropaasiPJoxfwzeqXsNXYzNAvpYjyKKGUw/BS8o7Gqpna8aHi4
 Iq3tD0/RZKA/Wx62895ByQhOI2IABwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX3p7LhljwM1JA
 C0UqOzyrAkHNd+SmpiH/4xwqlwoRZU/DHkVmLUiUhBTW6a2D4EeLww88T+CfXL9IarI/MoZSlWR
 rUFZ8GKc6aOPa4x86EqNtp/U0LXipWChUgMRHzgQ66AuONl19x52/JIGdUNoZ0KENFsR4+KkNmX
 0ACkJpOYUk8L2wzB57eR22V90Zi5oUjPJjKFEsX0BZmwMRKicQBgWmo5BmNoBBTvKNlmGAeGP4u
 dscCo+MHdolG9jljBG1mDDTafFtRT2hjGSmIRAbp6bjusRH8lsUwt2yPYo74g9F1zSVkTVwwZhf
 MT3wK3CkQ1W8n+4o+Ia+TqiztjtXcLx3hekksQiLDAv6lRMzd53XO/Pw4bZrlqR+lTGHGyeLu/r
 dNVClEtu9/AXjbTnIpY6ge1dTuwq/ob4zGncT1bHdwa3GdZ+4RUnanVr1STODvHLRTNvfsm8Dak
 S/2MyIx0KzqXs1ZVdyQ==
X-Proofpoint-ORIG-GUID: wKg8YuEbMTK52f-6tehtIl3UbwBFysHN
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b047474 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=owqDj3WxTxIMLBZ9Q5AA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: wKg8YuEbMTK52f-6tehtIl3UbwBFysHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

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
supports single dependent for now. The primary rejects a second claim
with -EBUSY if the dependent is already paired, so any future misconfig
is caught at probe time rather than silently cross-wiring.

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

Two further patches (broadcast fan-out and SSP-period programming) will
follow as a separate series once this core lands.

Changes since v2:
 - Collapse is_primary/is_dependent to enum qcom_swrm_mm_role
   {NONE, PRIMARY, DEPENDENT} [Pierre, Vinod]
 - Reject a second multi-master pairing at probe with -EBUSY
   (primary already paired or dependent already claimed) [Vinod]
 - Gate the dependent hclk through its own runtime PM and keep it
   active via DL_FLAG_RPM_ACTIVE on the device link; fixes the
   stranded-hclk leak and the double clk_disable on teardown
   [Sashiko]
 - Hold device_lock() across the peer drvdata read to close the
   UAF window against a concurrent sysfs unbind [Sashiko]
 - WARN_ON_ONCE() on peer_dpn_offset underflow in
   qcom_swrm_port_target() [Sashiko]
 - Commit log for 2/3 now explains the lane -> port mapping and
   how the dependent is driven via runtime PM [Pierre]
 - Rebased on next-20261120

v2: https://lore.kernel.org/all/20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 +++++-
 drivers/soundwire/qcom.c                      | 337 +++++++++++++++++-
 2 files changed, 418 insertions(+), 28 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

