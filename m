Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173075;
	b=3jnMF52/TAL1UoGOGBMEaj+fcRPv0+bQ0rJ0ImYa4kD8P9DsMHhzodqeUePOd9qpWQsu
	 RLfRW07wXryebHIoaZ1e3ojji6VcNNqP5LaHhSmyjtW1i0tNogabcDUUrbBr/T/W51jIh
	 WoNyBqe28dT1+3EeKB0j+wFf8SP0uoN1kMqdDNI+vpSCrvz42OQ9TEJMLqnm4EjdOagRj
	 HUg8gv/eHCijOvJH5mx9yHGBoYLpFjSTQpKnVSZo0AFOgLhaEd/Lq4L6FUcQPyGb+MNIs
	 iYSkhlZum36feIPfl41fn8FB1v2LMqSa9zCsE/TdrvZFji1j0+WrOBTMeJTdmxTi2dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a40Lv0ekGRLuys48DhtObUK0gzbJg8LFj1hB3aT9n7A=;
	b=2yzhwOj5DiHY+iYq5+DgWkGujqiErQ4wnU9xXQQ9szVU47zdI3doPm0I91S/klFTqZvN
	 hFK+SDzjonfu3RNBZsENtVFsT8zT71n9agHJxY/yM48GZsQB4AJp9f5wpp9wq+YKO2vvm
	 hoBEvSDg5FDiA/DcBGz8BhAoyDXK2t/SDqRkS9HUOvk+v/ZZSyeAuqoqntD1iLW1cwpGt
	 zKY+cL21iB/tfPYsi7lZdQATIVqz2ZZFeomfLe/NKOVwfD5L9SStOAGQLtDZLngoXyEGX
	 hq7sRbcFUOn5ZUUHpBXEZFU4RUS8R/g5vrgzBJAcOkPXLVBQEzok9eFpZSbYvQ2HTHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eCFJGYLf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFTOnt4u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9520A60A3837
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9520A60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eCFJGYLf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFTOnt4u
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjujn1168933
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a40Lv0ekGRLuys48DhtObU
	K0gzbJg8LFj1hB3aT9n7A=; b=eCFJGYLfmXe1yiWnCmPSQMeIugm9NKZSz2Rs42
	zApDgsFxw8wIq7JM8GtWQdHFn67QVYTWbfDxSOqIzMyOebyxZGhwwZ8VVbMwLKx+
	zj5fjQfjoYskdtaaSojpeCyc09Kpi6ySOcwl+OnCavZDcbkWJeaEBmT64FgAmZ6Z
	MIf5JRdE/iQrtT6SOKhem9QkFP48+23kq2Z3a4bVGbo9wWstSDDGO8NkcREQ8MXi
	hbDgu/P8eWB7ejub0U5DP3Q9gUGUp0N3r5xu1lcW+Vw/QDKH+1hxYcdX30jhysKE
	qdF3xQ0ENYZslILSRM/+qtbT0yflmvKLieboTBrlR0O6NBMQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uddb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so1803955c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173068; x=1795777868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a40Lv0ekGRLuys48DhtObUK0gzbJg8LFj1hB3aT9n7A=;
        b=HFTOnt4ufQR/heaUIIdFB1SY/XJ7xOkMSMmBrngi7LRmXA7Jguy6x3xDqFzHSB4Nmj
         jZG5TJ7uC+29GxDO1hqOGh2YLN0+hQhvYvt9oy2pTbednRtG+zW/aMx4gGo4jUfPY+i/
         GlhpbtplwokUqqfgH5cwUYtpOahLPrQQznSGtGdRyJwCIAoCH0ewl28A4zpw9v/jBc4m
         JPI/yjusONMfV4FCpo2ngRs+TM/brFikqf8nhOTdh5fmeM3NfvS9DjQME2Z1UYEUd6Ea
         F1GFCrbJadJFzj7rnjc86vlRdiBXIzopAXPcuqTvNfPFe3XFZSoFoESqdG6nAhQh34Re
         Iqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173068; x=1795777868;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a40Lv0ekGRLuys48DhtObUK0gzbJg8LFj1hB3aT9n7A=;
        b=lJiYsNDGHZDnROSoKIn3StDMm8jsLucDArhCMrkc5chy2I06poR/f/+xHW0a84KoLR
         wNeU0isjhVvqY2+FLyEmbNll8xQWAPxx3wvItUKU/41Wze/zUa7LynP42+xLeqvKTW/D
         mwaNEyW+h66z72BjrS00kLbA6RiGpQzLpjSGYRwSiB8HJUToGiyUj8pQ0Jg+FHJlpge7
         IQsp3kiGw4fbictfYWtaXAuA5aw6SkSETG190rFdcfIHTG9WiSH6h9WTKRgdpdIdoMot
         cy43AC5YOzz3bWaczPb8/ovsAySeDyqcLPe2pxmThQbb8K5P8YHjE09sefGDQLmp1iCc
         CMKA==
X-Forwarded-Encrypted: i=1; AL+hErG06xRg6kcZY/ajTTmJijhSFpbFyWUWLiufG0yDuIVxDz7OqlxYi2Wo17kdNcd31yjw+wcavsxD0ghr@vger.kernel.org
X-Gm-Message-State: APuU4Z+QFPQaawRsq6bd58LgXiI4NECtz9MRP+hIl8ZHG/Imu5IZ9L1G
	N3nKIZzkLdv3sMOUBDG0WeNIUyt0xI2bJgRj+iuDiOkk4dwjfx2o7nMx3KNRUDxbzpfFWlSlvsB
	Tz8Sf6exPKynygqnLAHDGFWNtud+wG39IfrKIer72hYxTAngSr/UsrtrWo0s8iUks
X-Gm-Gg: AYBFou0L+zUZJXqxHiuX6w8Btwx4+DPOt+ikpGG0rZz4zbktvTaNPr5oFIF1M1MHwKp
	fuFqgY6Oxj0O0FONcOcdll8QWQlzkpIR18lvwQLc+VbfY3LAFoBhoOKRCbw04v2U9rPLOzKZ/Pf
	TkIbLTRYMP49UewbS0fahM6QrZupHEvmbW+DEtSrvPJlbaW+S2rPf+uLsOG46+Sbok6JNSZVoG+
	f5XZ4x8Y+IWpNRCEPiY9kasUFA6QSezRxscSYT+l+/Y6op5WEkpK9bhTA/noDN5ALzgGjx0NKQL
	ddR1w0dbNaNBazG4Luk+Tl+bV0WZ7bcFk2xVPC5iw+f6SkLGYu2q8xh2kMldOJDirB1YJCJlhLY
	JW17tJGvYV3wf2Ro2mqJZzx7McTCGTb40o2QHhqnZAi/0K36/MPBecgIIJpxd8nMUG8KaXyZejf
	ZqcZFWuNOD
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr2890484c88.29.1795173068150;
        Fri, 20 Nov 2026 03:11:08 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr2890460c88.29.1795173067639;
        Fri, 20 Nov 2026 03:11:07 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v7 00/12] media: iris: Migrate iommus to iris sub nodes
Date: Fri, 20 Nov 2026 16:40:50 +0530
Message-Id: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALoqAGsC/3WQ3WrDMAyFXyX4ei52/B/K2HuMUpzIbg1N0tqJ2
 Sh59znJ7tbdCI6QvnOkJ0ouBpdQUz1RdDmkMA5FqLcKdVc7XBwOUDSqSS2JIhTn+3wOY9+vNdt
 zmYFbGC5YCOmMNJZ62qGyfY/Oh6+N/HnadXSPuRhMexP1LiW7GTTVceVTWhNsAX75cbVPOGtMM
 BjCtTSKtYp9jCkdHrO9dWXsUMr76veCRg0OMSS8ZXR4HtowAM6s8EQNXCpLmSHqNa+1yeG1E6a
 mstBZUJ47yVjdec9AgqJSeE6F5toYL4wWjKP10mtI0xi/t5dmuZ265yHs3+9lWUI53koLWnKv/
 Z9Q6LQsyw9exMU9rwEAAA==
X-Change-ID: 20260701-vpu_iommu_iova_handling-556e969a1f1c
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=8526;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=nd5hOYhOmQbePqVpVnYqGi/XXm89BV+StxbCqY1SZ8k=;
 b=Wevnc3f/zvxIiJbcKCjVzUcHmK1zZjvFmWfbmWJydNPhoeFuZZI953xhJmEO//qGNuZZepSwT
 BZS7fVUG8ztDySCRXzMNt3A9AsCeAot0lC5msrtlayiVWXdJYHuqtj6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6xVu/18+yfwf
 N9lndVWJDp1uYvap6byPMBd8If8rpBjdciKUeYNZKVAKAOF26COg513hNQvjgx5Ylu2UUTSxD++
 yI54hUzHDc3h5kvn29UIBNutwvUuXtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5kwXnVH7lvzx
 wGNdq3kc5vUf1Xlgu5GDD/MmpydMu6UCSrFnD0CQw/ZGxOgYoHgeCHM7GQjOe5qMKpgvKZ/H74/
 ti8KK+H5OR5+p1jCoRgVx4oUMJsOauZCzt7Qa/HHaDBQPDLPk+3PH+bfMMz5z1F8kfO04k1HWzR
 JnqWSnlgQ7RBalUa1nGJzaDLQiLOjfMWv73EJB6cSxuuNxRNdP63DSNTS/K6237GKzuy0x/pRXW
 XZ8yPA8+jtgPRSMq4rpFlPX/ca1NY6D3065g9O31fSWdKIU66xkantI0POhCwRgEWWF8ZJbXbNK
 aKhDTeXQTYpjk/2QhDLiC72/ucM3p1Ipg5a69mSNngCE+opEvPRCM78y/AcE06VPV8da6GDeItb
 G9qufqcxiO8sWIYtzb2bgy6OrdOxjcQotakDN2xVJ+7+JkzJaASKvVAxBszxV3qqERb/fwOPVnQ
 5PsCaGi3asLgQDB1jrA==
X-Proofpoint-GUID: 9_9ZvDSn3M3rdktukokXv61-YgXWOr_y
X-Proofpoint-ORIG-GUID: 9_9ZvDSn3M3rdktukokXv61-YgXWOr_y
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002acd cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=cpw3F-7VUnyQw8rkHkIA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does 
not restricts specific streams with specific addressable range. The 
non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
pixel stream can address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+

A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer inside the low 600 MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix was made in iris/venus driver to reserve the 0-600MB range and 
thereby prevent iova allocation from that range. 
https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com

Given that the address range restriction is for specific VPU stream, it 
should be ideally moved to that stream. To achieve the same, a subset 
of streams is now represented as subnodes, so that each can be 
associated with its respective addressable range.

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The maintainers agreed to proceed with the subnode approach to address
the VPU hardware limitation.

Reserving the iova address using "iommu-addresses" requires it to be 
placed in the reserved-memory node. But when "iommu-addresses" is the 
*only* property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong to 
reserved-memory node. A device IOVA range is very much specific to the 
way device own address space is mapped, and not a description of memory
shared across the system. Given this, "iommu-addresses" backed by a 
"reg", should be placed inside reserved-memory, otherwise, it should be 
defined within the device node. More info on this discussion can be 
found at
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

"iommu-addresses" property expects a phandle, which does not make sense 
when the same is defined within individual device node itself. 
Introduced a new property, "iommu-ranges", for the IOVA ranges required 
for DMA memory mapping to that device node and when there is no physical 
memory reservation.

"iommu-ranges" is defined with the schema PR
https://github.com/devicetree-org/dt-schema/pull/207

Patch #4 from v5 onwards is now posted separately and not carried as part 
of this series.
https://lore.kernel.org/all/20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com/

This series migrate vpu3x platforms to subnodes. All new SOC having 
iris3x or onwards(4x 5x..) should follow the subnode approach.
For VPU2x and AR50Lite SOCs, which are being migrated to iris, the 
subnode support would be added once the SOC is migrated away from venus 
to iris. There is no plan to upgrade venus enabled SOC to subnodes.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v7:
- Addressed sashiko comments.
- Rebased to linux next.
- Link to v6: https://lore.kernel.org/r/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com

Changes in v6:
- Addressed sashiko comments.
- Rebased to linux next.
- Iommu patch #4 from this series is posted separately. This is done to 
get review feedback from iommu maintainers.
- Link to v5: https://lore.kernel.org/r/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com

Changes in v5:
- Addressed review comments in #4 which seems valid (Sashiko)
- Added RB tags.
- Link to v4: https://lore.kernel.org/r/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com

Changes in v4:
- Dropped Daniel tested by tag (Krzysztof)
- Removed depends-on info from the commit description ((Krzysztof)
- Dropped the soc {} in example (Dmitry)
- Addressed review comments which seems valid (Sashiko)
- Binding patches depends-on: https://github.com/devicetree-org/dt-schema/pull/207
- Link to v3: https://lore.kernel.org/r/20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com

Changes in v3:
- Drop iommu-addresses from reserved memory (Rob)
- Defined a new property iommu-ranges (Krzysztof, Dmitry)
- Moved the vpu specific context bank handling to common(Dmitry)
- Dropped fixes tag.
- Link to v2: https://lore.kernel.org/r/20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com

Changes in v2:
- Fixed sashiko issues.
- Moved subnodes into common schema (Dmitry)
- Kept the firmware name as the one defained earlier (Dmitry)
- Added dma-ranges to specify parent-child address translation
- Moved context bank hooks to VPU ops (Dmitry)
- Updated commit description.
- Link to v1: https://lore.kernel.org/r/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com

---
Vikash Garodia (12):
      dt-bindings: media: qcom,venus: Add context bank subnodes to common schema
      dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
      dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes
      media: iris: Add non-pixel and pixel context bank devices
      media: iris: Route buffers to the matching context bank device
      media: iris: Skip DMA mask setup when the core device has no IOMMU
      arm64: dts: qcom: hamoa: Add Iris context bank subnodes
      arm64: dts: qcom: sm8550: Add Iris context bank subnodes
      arm64: dts: qcom: lemans: Add Iris context bank subnodes
      arm64: dts: qcom: monaco: Add Iris context bank subnodes
      arm64: dts: qcom: sm8650: Add Iris context bank subnodes
      arm64: dts: qcom: sm8750: Add Iris context bank subnodes

 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,sm8550-iris.yaml           | 17 +++-
 .../bindings/media/qcom,sm8750-iris.yaml           | 16 +++-
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 15 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 16 +++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 15 +++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 16 ++--
 drivers/media/platform/qcom/iris/iris_probe.c      | 85 ++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_resources.c  | 41 +++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  4 +-
 17 files changed, 345 insertions(+), 50 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260701-vpu_iommu_iova_handling-556e969a1f1c
prerequisite-message-id: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
prerequisite-patch-id: 99bdcac6ebf8b12961e5288bad65e7cd62888f91
prerequisite-patch-id: 5ea5af6f15d0c88dab1b192d74ef4cd938e69227
prerequisite-patch-id: 792dd9c2022019b38a169cb1e6ab84d87316b833
prerequisite-patch-id: cda71b749bf72bc68adae87d8a34bbbb9aecc5f7
prerequisite-message-id: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
prerequisite-patch-id: ea985fc3b351931adea7940855e5219be3a2bed0
prerequisite-patch-id: 5b6c27159dcaa5c06b59ed92ad39824e002a9f93
prerequisite-patch-id: d9bd004033c1a7b4f02f5fc1390a5e21ee6b38c7
prerequisite-patch-id: a2ea5644cca938dfb766227030f1200fe9e08cdc

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

