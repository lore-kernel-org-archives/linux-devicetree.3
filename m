Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078902;
	b=Pn4kVcIcfnsfxlwfBqilHBdn3FLhat45gm+CSB9MpIlZnpewiSJ963wlfXf/8XK+ckHQ
	 kVTXHdZSnBIAt4om7s+dTuOrrB8J6vdzTVZacs7xiX+f4heamPAHfsoe0GwELeTa7DtWp
	 5yJIIkdjHOfifMftbLUs/g1kexa9zhsH51VYCh7CkFCWj/shvHj/bEhSIxsNlu9jLpwoU
	 PVlDGiu+xDBeIvt6ccWzsitUuxXBf8mfEvThpbbqJ0L2Wpm4tUAlE4ReggIST+jlXhjn4
	 ocbB+7avFoDZNnfdiAJNhJy/XJYHtQzISO6RHqs0d3jc0bFWChrj1ZLxd6tdQWbxo2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ITGCEGI1ZSq7Vdj7hNGvtyM8m8GrUhYbkv5XfNHFCTc=;
	b=5E4tZm/Is/oSwX08GGLSZJIBpeXEzRDRwWOMPm7I2j9ex5UPWfOlkNt0JgtBxBLlyUym
	 lvlqBQ5EIGUjZw5yNkZ+kxbVsPS+AxAsGCDvxFMG06DY8PaCDs51HfNlU3qAZKLhmGTkJ
	 Qcy/2c3ZzSWml3K75FBLfAVaBEH6YGwqqWe6+CfN763dKdslDwOdbs6WycWjs5k/g3tVk
	 kJE3wFSit0njr1Wna8T63IGgVfPXdiHJhSQNbB1Mhhc+JwZOKk4eNJDuDL4sbCAGnu7RZ
	 IOOqqo6A1VZWU8j5N8RZTYX/GL6GBNxXqpaDL4TjXxL9J4BC1I0ZhlC8bUaXTVPB/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZUgwTmY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NkC1cqhr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBF60A2605
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFBF60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZUgwTmY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NkC1cqhr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6cU2030625
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ITGCEGI1ZSq7Vdj7hNGvty
	M8m8GrUhYbkv5XfNHFCTc=; b=TZUgwTmYMcMK/kxbo5yjiDiyYStlHnrk3z6Hog
	EVNBlfiSViFmsWKAUDHGZ6kofY1tzvRQNyea/SCMIfHte21Z95m0RAatq1At3tAA
	5/ufz27LtspqByurPrxAlzd8n4Kk+p8I2TAOEWNOThMwfG8tErGge/z4UUfjsg+b
	Yz2NAO9HWffZLFh3YMw83VXD6KdUD/7V7wfhXGFlBL4NlSuVnO4lNKNI/Dl1IPtG
	7+JAGQ0Q7VUEvRw/SHGSpt+XMLV/XifE1ZIDpbXRsUxA29UEmVqNBQkBuZ62uolS
	l/ja9EA/+dzlRMbJZGn1/YFdp2uej0cNoihaci6Wt4JJ5eGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kum0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2315579a91.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078899; x=1795683699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ITGCEGI1ZSq7Vdj7hNGvtyM8m8GrUhYbkv5XfNHFCTc=;
        b=NkC1cqhr+pqIVr2nYzITnqpLD/kZk/DgVDTfweEqxh4QXwTpdYont8QNsnfV8ZrCGN
         62FMmiiD37283hqzgowIol+VJEiCeUwCVmukEVRIIVX3hhCBXv5kmOVp9bJiCukyYb1N
         R1w/QOX03DXhlgGCofikcYwOhxWcU9PHiR5vRDN1exDRjTrlxmMrxdkyzkj8pXTCrL/9
         mha2PWlNTYPnUsobNPsmwmo8xk/DtZqPeDSeS1ZiUdb7/Duzn3bdE+YU4i2F0H0UVGga
         f8RdwByGCnQCXtc2XoB01uBduTeZNdO3O5vy/vQy+fqpYxAWJ2j69hQxACWVXtGny0cU
         15pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078899; x=1795683699;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ITGCEGI1ZSq7Vdj7hNGvtyM8m8GrUhYbkv5XfNHFCTc=;
        b=axxZTJHl3u8ISvtxg8yd+kySR/qv7gpp/mIimbQiM7RjWMVSt97YYC+Hrfa0tkld0H
         X98diT9w9w3JQ8125nWLJeUx3iEWUeCS0U0GzEMOP7nHXdXSzFqp3h+AZSnZrVwnrqB3
         7oy/JATrpXEFhD8YEhc1F3PUUhJ5a+YmlmHL4azeLbfim1sniOlqWW8WIZa9D/sFNL7r
         I6foDNj+IPzDmgDZaKNv/DyK2oPtQrdAo/F7n/zwt9N888AGLjIkc/QHxtU3y89AV5HT
         oRVVn9nf5QdQCjjh/z5wGzrz88Yx2ZwtJSXxsBSihy4jTSw98H0xEId3kDXy3enVnkCF
         VoRA==
X-Forwarded-Encrypted: i=1; AL+hErGFmxtuNzmPxiFxeSSngrbg42SrHrMG/gR/eNxzdGgF+biH5717CaMZIT/ApC/N9GQNssaHeUW7uZfV@vger.kernel.org
X-Gm-Message-State: APuU4Z+TKgtPmIJIUUvYWuwyTYY7Px/I6XN3qVngpNaT4W1CBBHLS6cj
	p+imAJVYHjskAMKDAh+Tc0GEWxTD8PldUqBsoImO2JS9W7kbDpzLP2aQBUSTn56F5/Usqn2aXGg
	rEYdcQPeHV1Bcz0dBBctEKiOdy3jP4ed63ymsYm+CtjqohxH23qKZuHRrLtCWMk+p
X-Gm-Gg: AZFdTZfnQQ76FRRp8sCBCqA3EnA144spqzGrX6KhQzqgqfUysxa4Vbj+vFjGFcybnyc
	zq24MCfzIjkljIzFq1dn5V2wSuYIVCy6F11aupwf2+znnYGTmvti8+NbOoqH8JaxlQQdZJbsYdZ
	cXccN0Ccedc7i1Xq3Nqm84bFKuPUNYpsdQx1JiNNveYav2qU9n9S+EqbbmMHa8VdvaGM2tZBQEZ
	ECDh1PmIIPQjLxiKW7T9dK9PnT1HUL2ruOLvLVXiMXbiU54ovVsCXRO1pu7i/s55uJp6JwYNmG7
	gmTrUhfpLfazpIkDy+1avnhcz2I17+jCNBFXrCDUmf82frutziiSdPEj2rTmyujtEoZh2kLJSln
	m18GELGNlBtEHd4N5+X2yxyanPBeZRWyOQttVgUqTjpxWeltJWTWBoJCr0evCxpCUhui3Wteued
	UzfrBPFsm4iG7IgadauUJ3wEGF3FFRQ3AuGvnd
X-Received: by 2002:a17:90b:240f:b0:3b3:fd13:6846 with SMTP id 98e67ed59e1d1-3b3fd137820mr1180159a91.11.1795078898529;
        Thu, 19 Nov 2026 01:01:38 -0800 (PST)
X-Received: by 2002:a17:90b:240f:b0:3b3:fd13:6846 with SMTP id 98e67ed59e1d1-3b3fd137820mr1180100a91.11.1795078897709;
        Thu, 19 Nov 2026 01:01:37 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:37 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH RFC 0/6] Coresight: Introduce Qualcomm QDCP support for
 QECP-owned trace blocks
Date: Thu, 19 Nov 2026 17:01:13 +0800
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANu6/moC/x3MwQqDMAwA0F+RnBcwBTe6q+AH7Dp2KDHVHNZqq
 mMg/vvKju/yDihiKgXuzQEmHy2aUwVdGuA5pElQx2pwrbsSkUdNm+VxZ8GV8xtX4QWjhG03wdh
 5brvgiG4e6rCYRP3+9yc8hh5e5/kDD6FV/HIAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078890; l=17813;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Qm8wkTDkZmUAiyAjxR4v3XV6E4b8uB9Q9ij9pKed3qM=;
 b=WHURqNKlO8bshALcTNZvAb2XCAG9UhRdzluI4GDnVo8+a+oCR8c8efuowElgHF3BibGfO4UZg
 eO9ETnoPvn/BrDQejWYYPFXNn5iJIsUfZBXoM6X9uAYHvOnNSETbd6A
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX+1A42LNQDEfk
 mdSvqQcdQvm6vEeImU2uCNeAFFYUcFfQmjiasEHczjNiPXd79x9DSUaPqbMqGY2iX+Mq5a6oI/6
 Ej1p6UzxoLgLTCUKHdyHV68u0yEF7G5fYfqc3HSttIgEFZ4QRUhNTsHvGNzOG77FX1kQp0xQNFW
 se7AWXY94mo84Ghgf6y24W/jShcsol2obCaGbzMJXgDJCleSWoZSGhGfsD+bAOx2x88qpWOMHdO
 WaiQArLjkKWUF3T2j574gZw20oFGZjDcLjfh3AfAYIck+o3lsn0U+0Ya5+XNgQQv6dhrHLU9fc5
 6Uy2yGYo4M4oSaoZ5oEvVH+F1J3i2g8UTUAw8o9RuoFkYWCdGE+Q85yjQAPxwll41hwqVShB7rn
 ENBwKbHeUE7DY6flBstsi/Vc+A23tEv7RYSFQ6cEO7qOk1v0x2fN6YtODJ7+23o6BZWCUYAzHqP
 /Zx5s/zR7IsmJBJFlOQ==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afebaf4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3_sEtDhLtaBHQnV-pIQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX8V2wa+eJyO9h
 eJsfRISXmb8gYrvvyFqQPNoLVQ1Wmo1d0EieY6aiAf5Ah8YodzsOyiVX87XdZLhNPoFwESGSri/
 Z+qqtn20H9RcN4FfE4I2gJ4Slvee024=
X-Proofpoint-ORIG-GUID: WwuRyApAFB2WjTISm23NhQg7rmQXmtUQ
X-Proofpoint-GUID: WwuRyApAFB2WjTISm23NhQg7rmQXmtUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

On Qualcomm Hawi/Maili SoCs, part of the CoreSight trace hardware is
owned by the Qualcomm Embedded Co-Processor (QECP), a separate on-die
processor that runs its own firmware and has its own view of the trace
topology. The owned blocks are an STM (System Trace Macrocell) source,
a TMC (Trace Memory Controller) configured as an ETR (Embedded Trace
Router) sink, and the internal funnels/replicators that connect them.
This hardware ships today; it is not a future design.

The Qualcomm Debug Control Protocol (QDCP) is the firmware interface
Linux uses to ask QECP to do what the AP (application processor, the
cores running Linux) cannot do itself. It is a QMI (Qualcomm MSM
Interface) service carried over QRTR (Qualcomm IPC Router), like other
Qualcomm firmware services. QECP is the co-processor that owns the
hardware; QDCP is the wire protocol Linux uses to talk to its firmware.

This series adds a QDCP provider plus an STM source driver and an ETR
sink path that use it, so a QECP-owned STM -> ETR session works through
the existing CoreSight sysfs interface.

Register ownership
------------------

The QECP-owned MMIO control/status registers are protected by hardware
access control. AP reads and writes to those ranges are blocked or
trapped, so Linux cannot touch them and there is no race to describe.
The AP does keep two things outright, with no access control involved:

 - the STM stimulus write aperture, a separate MMIO region used only
   for data writes, not for block control;
 - the ETR trace buffer, ordinary system memory (DDR) that Linux
   allocates, maps and owns exactly as for a local-MMIO ETR.

                            AP (Linux)          QECP firmware
                            ----------          -------------
  STM stimulus aperture     owned, mapped,
                            written directly
  STM control registers                         owned, access-
                                                controlled from AP
  Funnel/replicator                             owned, private, not
  routing                                       visible to Linux
  TMC-ETR control registers                     owned, access-
                                                controlled from AP
  TMC-ETR trace buffer      owned, allocated,
                            read via sysfs
  TMC-ETR RRP/RWP/STS       read over QDCP      owned, returned over
  (read/write pointers,                         QDCP on request
  status)
  Block clocks and power                        owned, controlled by
                                                firmware only

Linux owns what it can observe or allocate directly: the stimulus
aperture, the trace buffer and its sysfs lifecycle. QECP owns what
needs access to live hardware state: control registers, internal
routing, pointer/status registers, and the clocks and power of the
blocks. QDCP is the only channel between the two; there is no direct
path and no fallback.

Because firmware controls the blocks' clocks and power, the bindings
describe no clocks, clock-names or power-domains for these devices, and
the QDCP code adds no clock handling or runtime PM.

System overview
---------------

Control path (QDCP, QMI over QRTR) and data path (hardware):

  AP (Linux)                                 QECP
  ----------                                 ----

  sysfs / char dev
        |
  +-----v------------+  typed   +-----------+  QMI/QRTR  +-------------+
  | QDCP STM source  |--------->|           |            |             |
  | QDCP TMC-ETR sink|  API     | QDCP      |<---------->| QECP        |
  +------------------+          | provider  |            | firmware    |
                                | (soc/qcom)|            |             |
                                +-----------+            +------+------+
                                                                |
                                       programs STM/TMC ctl regs,
                                       ATID filter, internal routing
                                                                |
  Data path                                                     v
  ---------
  STM stimulus   +-----+   (QECP-private funnels/    +---------------+
  aperture ----->| STM |----- replicators, no DT ---->| TMC (ETR)     |
  (AP writes)    +-----+      node, not visible)      +-------+-------+
                                                              | DMA
                                                      +-------v-------+
                                                      | etr_buf       |
                                                      | (Linux memory)|
                                                      +-------+-------+
                                                              |
                                       AP reads via /dev/<tmc> (sysfs)

Enable, a trace session start (CoreSight enables sink first, then source):

  CoreSight   QDCP ETR     QDCP STM      QDCP          QECP
  core        (patch 6)    (patch 4)     provider      firmware
     |            |            |            |             |
     |--enable--->|            |            |             |
     |  sink      | alloc/reuse etr_buf,    |             |
     |            | compute paddr + IOVA    |             |
     |            |--qdcp_tmc_etr_enable()->|             |
     |            |            |            |--SG mode--->|
     |            |            |            |--FFCR------>|
     |            |            |            |--buffer---->|
     |            |            |            |--start TMC->|
     |            |            |            |<---ok-------|
     |<--ok-------|            |            |             |
     |--enable------------>    |            |             |
     |  source                 |            |             |
     |            |            |--qdcp_stm_source_enable()|
     |            |            |  (src id, trace ID,      |
     |            |            |   port mask)             |
     |            |            |            |--set ATID-->|
     |            |            |            |--start STM->|
     |            |            |            |<---ok-------|
     |<--ok------------------- |            |             |
     |            |            |            |             |
     |   trace flows STM -> (QECP-private routing) -> ETR -> etr_buf

  (SG: scatter-gather, FFCR: formatter and flush control register,
  IOVA: I/O virtual address, ATID: ATB trace ID.)

Disable and readback (source first, then sink):

  CoreSight   QDCP ETR     QDCP STM      QDCP          QECP
  core        (patch 6)    (patch 4)     provider      firmware
     |            |            |            |             |
     |--disable-------------->|            |             |
     |  source                |--qdcp_stm_source_disable()|
     |            |           |            |--clear ATID>|
     |            |           |            |--stop STM-->|
     |--disable-->|            |            |             |
     |  sink      |--qdcp_tmc_etr_disable()>|             |
     |            |            |            |--stop TMC-->|
     |            |            |            |<---ok-------|
     |            | stop confirmed? no -> keep etr_buf pinned and retry
     |            |   on the next enable, open() of /dev/<tmc> or removal
     |            | yes:                    |             |
     |            |--qdcp_tmc_get_param(RRP/RWP/STS)---->|
     |            |<--values----------------------------|
     |            | sync etr_buf, release                |
     |            |            |            |             |
  userspace reads trace from etr_buf through /dev/<tmc>, as for any ETR

Sysfs ABI
---------

This series adds no new CoreSight-wide sysfs ABI. A QDCP ETR exposes
the existing generic ETR/TMC attributes for buffer sizing and sysfs
mode enable/disable, with one omission: trigger_cntr is not exposed,
because the QDCP enable RPC does not convey it to firmware and writes
would be silently ignored. The only new attribute is a read-only
"traceid" on the QDCP STM source, like attributes other CoreSight
source drivers already expose. Userspace reads trace data from the
Linux-owned etr_buf through the same /dev/<tmc> interface as every
other ETR; there is nothing QDCP-specific for it to learn.

Why do qcom,service-id, qcom,instance-id and qcom,version come from DT?
------------------------------------------------------------------------

QDCP is a QMI client over QRTR. The only lookup primitive QMI offers a
client is qmi_add_lookup(service, version, instance): "tell me when a
server matching this tuple appears". There is no API to enumerate all
registered services and pick one, so a client must know what it is
looking for before it can look. Firmware does not advertise a list of
services for Linux to negotiate against. The (service, version,
instance) tuple is fixed by the platform firmware build, which is the
kind of static platform fact DT (devicetree) exists to describe.
qcom,service-id and qcom,instance-id are required; qcom,version is
optional and defaults to 1.

DT dependencies
---------------

The DT surface is deliberately small:

 - the provider node has one connection-N child per QMI connection,
   carrying the tuple above;
 - each consumer has a qcom,qdcp phandle to a connection-N child and an
   ID that names its block to firmware (qcom,qdcp-source-id for the
   STM, qcom,qdcp-tmc-id for the ETR);
 - the STM has its stimulus aperture in reg, and both consumers have
   the usual CoreSight graph port towards the logical path.

There are no clocks, power domains or nodes for QECP-internal topology,
so the consumers depend on nothing else in DT.

Design
------

CoreSight is a mature subsystem shared by every Arm CoreSight
implementation. This series is built so that QDCP support:

 - does not turn generic CoreSight drivers (coresight-stm.c, the shared
   parts of coresight-tmc-core.c and coresight-tmc-etr.c) into
   vendor-specific code;
 - does not invent fake CoreSight DT nodes for hardware Linux cannot
   observe or control;
 - does not need a broad refactor of TMC/ETR internals.

QDCP is therefore a firmware *provider*, not a CoreSight *device*. It
lives under drivers/soc/qcom/ next to other Qualcomm QMI services, and
consumers find it through a DT phandle, as for clocks or regulators. It
never appears in the CoreSight topology graph and has no coresight_desc.
The phandle must reference a connection-N child of the provider node,
not the top-level provider node itself.

Only Qualcomm-specific consumer drivers know about QDCP. coresight-stm.c
is untouched, and TMC/ETR gains a parallel, isolated code path chosen
once at probe time by the qcom,qdcp property, leaving the local-MMIO
ETR path unchanged in behaviour. QECP-internal topology is not modeled
in DT: there is no node for the funnels/replicators between the QDCP
STM and the QDCP ETR, since CoreSight only needs a logical
source-to-sink path to build a session.

Probe-time resolution. The QDCP ETR reads DEVID (the TMC device
configuration register) through qdcp_tmc_get_param() instead of MMIO,
rejects any config type other than ETR, and selects its coresight_ops
table and its RRP/RWP/STS readback function once, mirroring how
CoreSight resolves desc.access for MMIO vs. system-register ETMs. The
two paths never coexist on one device instance, so there is nothing to
re-check at runtime.

Lifecycle and safety rules
--------------------------

 - Firmware DMA into etr_buf is the main hazard. etr_buf is the buffer
   firmware may be writing into, and Linux clears it only after
   firmware has confirmed the TMC stop. If a stop is not confirmed,
   including a failed or timed-out enable request that firmware may
   still have executed, the buffer stays pinned: it is not synced,
   freed or replaced, and the stop is retried on the next enable, the
   next open of /dev/<tmc>, or device removal. If firmware never
   confirms, the buffer is left allocated at removal rather than freed
   under possible DMA.
 - A failed read of the RRP/RWP/STS state invalidates the buffer
   contents instead of leaving the previous capture readable.
 - The provider-consumer link is core-managed, so unbinding the
   provider first unbinds its consumers. A consumer that probes while
   the provider is already unbinding defers its probe.
 - If firmware does not confirm an STM stop, Linux still marks the
   source disabled (the CoreSight source disable op cannot fail) and
   logs a warning. The driver remembers the failed stop, so on removal
   the trace ID is kept allocated whether the stop failed during
   removal or earlier, and no other source can reuse an ID firmware may
   still be applying.
 - No lock is held across a QMI transaction wait.
 - A QMI reply that omits its result TLV, or the value TLV of a
   parameter read, is treated as a failure.

Known limitations
-----------------

 - If QECP firmware resets while a session is active, Linux is not
   notified and does not reprogram the STM or ETR. Trace stops until
   the user disables and re-enables the session, and the disable logs
   the firmware error. A provider reset notification is left
   for a follow-up once the firmware reset behaviour is defined.
 - The STM stimulus write path checks the CoreSight mode without a lock,
   exactly like coresight-stm.c. It cannot take one, because the packet
   callback is notrace and can run in atomic context, so a write can
   race with a concurrent disable.
 - QDCP-owned ETRs have no panic handler: the control registers are
   firmware-owned and not accessible from the panic path, so trace data
   is not preserved on panic.

Scope
-----

This series implements one complete path:

  QDCP STM source --(logical CoreSight path)--> QDCP ETR sink

Not included, and deferred until a platform needs it: QDCP ETF (embedded
trace FIFO)/link sinks, perf-mode (AUX) support for STM or ETR (sysfs
mode only here), other QDCP source types such as TPDM (trace, profiling
and diagnostics monitor) and OCLA (on-chip logic analyzer), a
path-helper device for no-MMIO static sources, and the TMC
BEGIN_READ/READ/END_READ firmware data-copy commands (the AP is assumed
able to read the ETR buffer directly).

Why not the power-domain framework?
-----------------------------------

The exported enable/disable calls could be modelled as a power-domain
provider's .power_on/.power_off instead of a new API. This series does
not do that, for three reasons.

 1. QDCP does not power anything on or off. The QECP-owned blocks are
    controlled entirely by firmware, and HLOS (the high-level OS, here
    Linux) has no way to request a power transition for them. When
    firmware receives a QDCP request it decides for itself what the
    block needs, including any power or clock handling, and performs
    it. The on/off value in the SET_STATE requests starts or stops the
    block's trace function, it is not a power-state request. A
    power-domain provider, whose whole purpose is to control power
    state, would describe something HLOS does not do.

 2. The calls carry data a power domain has no way to pass. The STM
    enable sends the CoreSight-allocated trace ID and a port-enable mask
    that firmware turns into its ATID filter. The ETR enable sends the
    buffer physical and IOVA address, size, scatter-gather mode and
    FFCR, in several requests. qdcp_tmc_get_param() also reads DEVID
    and RRP/RWP/STS back from firmware, which the ETR needs to
    synchronise etr_buf after a stop, and a power domain has no read
    operation.

 3. The trigger is different. A power domain follows runtime PM, which
    reacts to device usage. QDCP enable/disable must follow the
    CoreSight path lifecycle: sink first, then source, started and
    stopped by the user's sysfs enable. CoreSight already drives that
    through its source/sink ops, so the QDCP calls hang off those ops
    directly.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (6):
      dt-bindings: soc: qcom: add QDCP provider
      soc: qcom: add QDCP firmware provider
      dt-bindings: arm: qcom: add QDCP STM source
      coresight: qcom: add QDCP STM source
      dt-bindings: arm: qcom: add QDCP TMC ETR sink
      coresight: tmc: add QDCP ETR sysfs support

 .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++
 .../bindings/arm/qcom,coresight-tmc-qdcp.yaml      | 102 +++
 .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    |  81 ++
 drivers/hwtracing/coresight/Kconfig                |  11 +
 drivers/hwtracing/coresight/Makefile               |   4 +-
 .../hwtracing/coresight/coresight-qcom-qdcp-stm.c  | 550 ++++++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 145 ++-
 .../hwtracing/coresight/coresight-tmc-etr-qdcp.c   | 379 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  46 +-
 drivers/hwtracing/coresight/coresight-tmc.h        |  46 +
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qcom_qdcp.c                       | 985 +++++++++++++++++++++
 include/linux/soc/qcom/qdcp.h                      | 128 +++
 14 files changed, 2553 insertions(+), 48 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261119-introduce-qcom-qecp-feature-f59c05a21179

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

