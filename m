Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172823;
	b=NZ7g6zVuqFpdNpAMuxQyyQ+88Dv+unzdENdvX337xf7C1x14jLCJap4LqThML3i03TIh
	 fmLEVh5zZPOo/R5EuL2CtBK2/kYOS9mH8mA69pbkWNvVftc0Ih23iUg+30EfvULf9b3nF
	 L2yjIvuE2iLPVpV8FVIlXNCK08QRxK+ICZcFqvMlCuPdmrdZo/rCA0799qfTxFjj65u8J
	 6ltL4XXxJ8ckj22ZO51UcNDwixtv8T4K5nrz2hswITmm2SWSqiTB8hxmPeF1jXR5Qticr
	 nlW64asLeZIEo6XZqq7VMH+59sg7W3GvkRuCAcQ2s7xz9NhrfJgLy9aXkzEYzWBcy9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
	b=hJPZi9n0KcT4hYeySo2/tcoE56AwMa2oeZHsVuPeF+iwBsnsLfebi8duWjSuY/tBVzN7
	 vKb4PKQX8yIun3awJUijF4P5/g5d9dF/BoR7+guetxWhzEwrDc9K1LZIgl2P8rOZFYtry
	 N9IpuGd0YCIxJsAzdGgAlCsiYhLB/ZPcQ+s5jCgVMXroJlyIgWZgFNviP5KXGopJqPZPO
	 2LEsgo8llvdJZvvnzCxP/pvf21QlaeUW5t9JNjNe/08k+8Dd0WdoEtSIMnd1UPeC/0qmE
	 0o/MDfsO4dtzmzqEQZQvLFBLi3eQwY3wGpSfgR5Qr8WoT6iNYQW/gtrFl1mYy61cuqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6Ft9jzM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Sf0ibu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458D606A334
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4458D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6Ft9jzM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Sf0ibu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkQd11017536
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=; b=k6Ft9jzM+Hll4YRR
	eaVThWjOWxFJvu7IoA/Do60Gtn+KTjaPAo7Cpr0s9KI6+itc9jYLIJ1zUUJYne5T
	3c5HfDXZ8rKS7pde62QLuaCSn+SmHMylXGZiHYu9p4GgnycrT8rkLi8lZIZuI53k
	Pm0yQ88iv25n/1nalIpxjikLGYV21KpyXE42GdDPzXl4rV1mxPlkyea93/ZOgzQM
	eQr6kCo/JLVdsONz2XGgCQu5wIx2X8PNU2frIHavrrudyrpi3D0pzecmdROzAXcp
	rpcEaGKCXlSc0UTOeFftUD6yNQ7MgnHEenrWFl8cLcsh3ZVQCmH6EIh/+jMZ4bkB
	qc/Dlg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso973943eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172821; x=1795777621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=h4Sf0ibu38VEJnd5XDTeXdjxBLfxjmCBYReq1o3+72L3GoMIIa97oaAOkkl4lpupWN
         pAFwUv7KIB/KHVTtLKWiMwFzUIOJsVtpgJq5ILFMNk52+1cWAH2DgcVGERGUzh3blI+L
         TCBQsa+mbiNt+kJTs5lYF3Eye5uw9v4SakThDt3rGbiWo7N2Z0nlHof5hjEHX6q8303D
         2Anmc0gG9c8Rvl97V4d7Z4PaJeGC1zI3e1jxPtTSQlThOqdaA0GBMsZQFr8IY3m9cok9
         Lx5yXlKQFCHiQ3gid9XJOl9yUKN7Dv8N7/OrdT29MR2CXJny4vi1SOPefSRx2/3ujWrJ
         gayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172821; x=1795777621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=fOh2Z84ktaw/iikyxGjQlboczx+S2vbEWfI4Z8+yvuBvoEhM/dQM5SmP9i5BTU60Cl
         z+dt+xJWCyxX7+TwvJgN9uUfAh7hyznfrw5yoJzRgIg6TBwdHFahWnN3uj4zUsMRstkK
         OCkRSpH7lE+b9AKCmaj17CIxqShBNEsJZ4e8bsUNxRGkt3hoiPkHnkAOB6V6egjXUIw6
         X7BnWSVdaOcgCH6Ie77XAFzyRBVqMaA7cRrgnQuTARB0zzxY45p2MAHmj/yXBAk4OQVG
         S1ptQymOKuC0jvlmcAAa2ldlUWnN5OF5+3WSESQCYBuQlT72XA7tppGRRlscrjEeWiJg
         cg8A==
X-Forwarded-Encrypted: i=1; AL+hErG5oo3tmBzksreN44uGS/vKa1kY+oJ3AoWFU9AoOsjoXXS4qLgHWBoSlAXazf895APdAfUOFc9Hkh5J@vger.kernel.org
X-Gm-Message-State: APuU4Z/rhTKEx0vjOLr/jdeMlclDTy0uCtJumjpXujUiyCqINmwI1jm3
	KuuuoX6KmLefwIySh8ll8/THXPcTMwycgQeiLGZt34BmKhik18PVsECdxw+UT19PLOGKH5L/efm
	Les5FFY5qwRkJ/xiky1yzi64O+7Lw+CIXjoqRKrmlqIxfkJw3oJdGZH5jO8FLAY/X
X-Gm-Gg: AZFdTZfug75GstnuN6iv/D6z2VCTrXxUC99ohiTLyaUpjCn8CgPtFPPvxlMaRVGOdT1
	fsjb6zbx/wNnkIB5py9k4PguAi4qDJqKVBgW2zTlDhB6oaBK8biIAFethw9bPmKqEg9y8DnbaUZ
	4Z+nPZktg7hS7zzMEWqvbDn4e2hEATQ6+reuqnOM4KQr2lxjIJ2hkb/75/hxHwRIavai508/dmX
	gVkUOLe8zxTbk8twTrjOeVWkS1hBlJJgezRuJTC+9Q796CNw9aF63oNx/dGKboHX/dxBEegb+pt
	NBQ1A8gx36FCDbTHa/KUCrmDoEj26zRVCJoDLMuM0jeTwPu8TnhWsqDIERd4v7gK2XzSxWzr0sd
	jMtUBo7ZaxjwML1rGNwjlZzM+8MNfYKZpoYPySbHyte+IfbCwy/hYF9PxwEHlA+EzuKexL4oQnB
	2nmmnQ
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr3104337eec.39.1795172820333;
        Fri, 20 Nov 2026 03:07:00 -0800 (PST)
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr3104290eec.39.1795172819595;
        Fri, 20 Nov 2026 03:06:59 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:59 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:43 +0530
Subject: [PATCH v4 02/20] iommu/arm-smmu: Add interconnect bandwidth voting
 support
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-smmu_interconnect_addition-v4-2-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=10382;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=2Tn1fmNrImTIJuMoWPhujoBy9ypAmrcFqaUEL7ITQm0=;
 b=82e3NtB7zovJkGgRY6qn9VlGw4xD8oguiXH/aMhyAV0D66HhFdOi+uicnbcEQtVbudd6sGBTp
 XXV7mvXP61gCFF/Jd4OPrIq8UDWMEodObIuOHU1c4R9IDWgVvirvrFp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/MEk0GJI2FS2
 7AC1scC55YZ6pyMpiJBWf5jCaNmujVGUlAy0rWLKfl5iJjrDarazVVKAmSqNL+nX1jNy4WwRlhj
 ziUDYh6XczQtJqfixUPI+jmPBgBoZQAf7uaFTG2otTfP/HCaPWMP3v8+eaNB3XOc/jHkZ0aPJgu
 vIrhz/JdCfnBMHNSdu/lYAYmaIshnIZ+SSj4pjhFRXKfPE5L2b0zQqHdgnbLos1zM2881xQWbWL
 xLSTLnky3siwl/N/iA6bsesG23hBkOxpJxixdumBjUgZJDZalGfcRjUxBABndqJuXM7A4gRzHH0
 3K4gnZzC89EeRts+PCByztRdX6qJfQhmwtP2/JPN7Tv4VMtfBtLAY179trk0MSKFcjw8JtvoSJB
 EV95JgPl8m9lfgeqJ62hX99Wl5nPQfX0JTqtPLE3tT4nEPZ9MyWHs5ccN5Z0iSajQL2WTJXCQhx
 KowkhK6RIULMfEhOdqw==
X-Proofpoint-GUID: iJMHpd8pM_pu1tIfTO0zCeIsOQGu7Nh5
X-Proofpoint-ORIG-GUID: iJMHpd8pM_pu1tIfTO0zCeIsOQGu7Nh5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX90mnrz8csChy
 yewh0Vl7LFIDMCNy9C2PZTEgcwnjRSE3Yry0Wa02HbfHfOeuyZs/88n1opVnEwlQ5+MIYSr44ZU
 FpvVj/bhGffQjOvsnN/0+z3BRLdStM8=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029d5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m-PSj7kzn0EKmAiG594A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Qualcomm SoCs using the ARM MMU-500 as the adreno SMMU, the GPU TCU
sits on GEM_NOC as an independent AXI master and requires an active
interconnect bandwidth vote for its registers to be accessible. While
other clients typically satisfy this requirement implicitly, certain
corner cases (e.g. during sleep/wakeup transitions) can leave the SMMU
without a vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently. Additionally, GDSC power state transitions in adreno use
cases can independently drop the interconnect vote, further contributing
to this race.

The design difference between QSMMU (SMMU-v2) and SMMU-500 explains
why an explicit ICC vote is needed only for the latter:

QSMMU (SMMU-v2) — SM6250 / SDM845 era: The TCU is NOT a separate
hardware master. It is integrated INSIDE the SMMU-v2 block itself.

  GPU SS
  +----------------------------------+
  |  QSMMU (SMMU-v2 @ 0x5040000)     |
  |  +----------------------------+  |
  |  |  TCU (integrated, no       |  |
  |  |  separate AXI master port) |  |
  |  +------------+---------------+  |
  |               | page table walk  |
  |               | issued on same   |
  |               | AXI port as GPU  |
  +---------------+------------------+
                  |
                  |  qxm_gpu0 / qxm_gpu1
                  |  (GPU data + TCU walks share same NOC master)
                  v
             GEM_NOC -> LLCC -> MC -> DDR

On SMMU-v2 platforms the TCU never needs an independent vote because
it physically cannot be active without the GPU data path also being
active.

SMMU-500 — SM8150+ / SA8775P / SC7280 etc.: The TCU is a SEPARATE
hardware block with its OWN AXI master.

  GPU SS
  +----------------------------------+
  |  +-------------+  +-----------+  |
  |  |  GPU Core   |  | GPU TCU   |  |  <- distinct HW block
  |  |  (rendering)|  |  + DVM    |  |
  |  +------+------+  +-----+-----+  |
  +---------+---------------+--------+
            |               |
     qnm_gpu0/1        alm_gpu_tcu    <- separate NOC master port
            |               |
            +-------+-------+
                    v
               GEM_NOC -> LLCC -> MC -> DDR

On SMMU-500 the TCU has its own master port — it can be active (e.g.
page table walks during wakeup) while the GPU data path is idle,
leaving GEM_NOC without any other voter. Hence the explicit
MASTER_GPU_TCU -> SLAVE_EBI1 vote is required.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 50 ++++++++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 29 +++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..eee20811eede 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/delay.h>
+#include <linux/interconnect.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/platform_device.h>
@@ -608,6 +609,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int err;
+
+	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (!IS_ERR(qsmmu->icc_path))
+		return 0;
+
+	err = PTR_ERR(qsmmu->icc_path);
+
+	if (err == -ENODEV) {
+		qsmmu->icc_path = NULL;
+		return 0;
+	}
+	return dev_err_probe(smmu->dev, err,
+			     "failed to get interconnect path\n");
+}
+
+static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
+static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
 static const struct arm_smmu_impl qcom_smmu_v2_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
@@ -659,6 +699,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -668,6 +710,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
+	int ret;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
@@ -692,6 +735,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	qsmmu->smmu.impl = impl;
 	qsmmu->data = data;
 
+	if (data->icc_init) {
+		ret = data->icc_init(&qsmmu->smmu);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return &qsmmu->smmu;
 }
 
@@ -734,6 +783,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
 	.client_match = qcom_smmu_actlr_client_of_match,
+	.icc_init = qcom_adreno_smmu_icc_init,
 };
 
 /*
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1..12c3eda780dc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -6,12 +6,15 @@
 #ifndef _ARM_SMMU_QCOM_H
 #define _ARM_SMMU_QCOM_H
 
+struct icc_path;
+
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	const struct qcom_smmu_match_data *data;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
 	u32 stall_enabled;
+	struct icc_path *icc_path;
 };
 
 enum qcom_smmu_impl_reg_offset {
@@ -29,6 +32,7 @@ struct qcom_smmu_match_data {
 	const struct arm_smmu_impl *impl;
 	const struct arm_smmu_impl *adreno_impl;
 	const struct of_device_id * const client_match;
+	int (*icc_init)(struct arm_smmu_device *smmu);
 };
 
 irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8d50a4ad221d..f015985cbb8e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2183,6 +2183,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		err = smmu->impl->runtime_resume(smmu);
+		if (err) {
+			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+			return err;
+		}
+	}
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2263,10 +2271,13 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, ARM_SMMU_sCR0_CLIENTPD);
 	arm_smmu_rpm_put(smmu);
 
-	if (pm_runtime_enabled(smmu->dev))
+	if (pm_runtime_enabled(smmu->dev)) {
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	} else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2286,9 +2297,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		ret = smmu->impl->runtime_resume(smmu);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2301,6 +2321,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 
+	if (smmu->impl && smmu->impl->runtime_suspend)
+		return smmu->impl->runtime_suspend(smmu);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..ed08f86cf99d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -455,6 +455,8 @@ struct arm_smmu_impl {
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
 	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
+	int (*runtime_resume)(struct arm_smmu_device *smmu);
+	int (*runtime_suspend)(struct arm_smmu_device *smmu);
 };
 
 #define INVALID_SMENDX			-1

-- 
2.34.1

