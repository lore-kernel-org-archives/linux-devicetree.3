Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C01029BD95
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325795; cv=none; b=tJ0almisaCRjX0FaQvlnboC3HAWRsZtEL/yXQwXqn0dgCMTnEItIeBVU3sCIfwRWOG5WLyzVjL1FiJy0jLWl4eFH4gUxpci2f3WZFijL4V3w54z3xS3/PMVZW38xA60Ok6Pu8t3BPwUFjIy5PH2lpUsdbEbozjNKPge1Uq6vKLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325795; c=relaxed/simple;
	bh=EXQRhW/IvzjMIzr0CVbYF9vLiRbp2PMcWUTZN2P0wTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sii206eKv/KcbSkvLNwvHxyY2dX/mQuMv9yIqSva1+mlzRa4bnM8M1NHqZ3maI5xgEyWYLIj1qlvXBetjlhhB3uJ+ZDVFaWaDEDY4AggqzovSgqQBWf3i81Tqn+7LwSxIfOPKMtLrL+WUPS6UXbLdbdOtEvLMT9gYozI8oI+rfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=it5K/Wjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQNhXzX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="it5K/Wjn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQNhXzX3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGmNp91177868
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+OBhukk0LdM1gR7M252L3/
	fOKTfD601zCAkg1K9NP3I=; b=it5K/Wjnd+7oB475M+VhNTMERKR0ET4GvMh2zn
	4a7EBuJyd0x/DnOh4VxOKRe0AqF+jpp1RKej139TxWiHMThNa6EJj54qRpg7Uhlv
	3YGlp+MgGmgB5O1+su+xPnBnlv7N480VlwElX2RHG9uvdFn7KGrgpp+7VMWlB6pD
	7yWobhmJaooDV5fqqqnbjjRCnUmFyP/tFi3ezCBNo2+FTrx8rW8jy55bj9Zih9xn
	Xkj5DCEGzwWiC62zE9Ce/e/qSL3/AIghZWmEqDM0DTdLxO6AY8TrFDQdro1FZzhE
	6vuz+I45TpGPLqHcZyie6v5POI98Yw5dG/p8Vd+r+F2knjcA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6u9ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:51 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65d8d110fe4so13322167d50.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325791; x=1779930591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OBhukk0LdM1gR7M252L3/fOKTfD601zCAkg1K9NP3I=;
        b=LQNhXzX35vb05gj6doAAfqouZwIKSI6S0AMi84NZa0QWOC3khg4rle9dqEyyB16Ljh
         cp4Kw7v7g65wh+lqTYB2gftD8CBOUKQcUKR6wzf7RMXQjxS7x9Cyz0nj3eIayV2fdQ8a
         2VMHY6kGYCscDk45iLW7mBTWlMxruA0lWsm2gyuIDZtXnKrpLJiVqGab2T2UT9ZEohcR
         BFrdRRE0CWAt8zCRbpOaoDoOtCy5oLg0gpGDAy4uFCFdL9rOuwm5QEgkGCWoEQe6/bbY
         1M8erq7xIMfIxLsrDq2CBusJZAEnji7Rjv6k6NUWF3SYu/u8gDcqR/Z4OVEeXDtaa1jU
         OArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325791; x=1779930591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OBhukk0LdM1gR7M252L3/fOKTfD601zCAkg1K9NP3I=;
        b=R1IOV0gKbxb1vyLlhqYAka+gHIA2df9E3XnGxOzpu7Uodf7uC/FlVfiakrqZmsYv9o
         S8oE3U6n7DLW5dy7ReHVGpzs5ru4lXjvJag0dgqZw6iu5iqII2p2B7UCUOOLjlE6m1uJ
         p8WwDrHV4GY7z2ETXxWUnSqR5RfQKG6our+CCf3NtJwODFOtyS6EzeK1v+s3sRTSzbIw
         D0ttj0epT5WTlsT0vqEQhKi9XrMeyYUQ3oH3EY0T3aVYY8b7X2+J5DBMz2lGwPkmnZrI
         m2ROqeM7RQPMMWtMrI4U4HLXqHNHcc9kv0GPSqfdSXKvswkRquRdDrNRZHcPXT5p8JVb
         PsjA==
X-Forwarded-Encrypted: i=1; AFNElJ/rSW4kO74imQUKVYIpnqFolqALqr+RdtElAjxkHKIliGclMXyLmG0BJjIlcaoFIg/kH77pkiQEc1Am@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfcTvELRyhLvvaiNZkwC5mfUr+Rylc4zezeMGFSa40V2Y5q/0
	PAluZEVIS3bFzd++jb106ZgJs7TzhZWnUvZEuKibTnbw0VYpu9lNuKrsgdt7ewCCuUb0ShqLU0r
	5gzqttZjEv28NAdOHVvnajotL9G1C9wP9okXPjC9Ty7jX2v8JaxagzBhNTaxtqB9u
X-Gm-Gg: Acq92OHFftklmaV/ULTosg4X7ikpJYl62rJSBGWgmvpV4GVz7iBd2QLvS/61+0G0YDr
	gQbqMBte/7qQaY2dXn8cvc/LmPy09yTvJJo9a/TaRRaf4YRUvr5hc3KCXMyTB9oVZ+MT5cuNjhl
	GxvOUtCuhnIfC9/xr/72ILYsrSNxk5GIRjy2ZVm/YQg+pRDT8Gmw3YXOzLD5UvfyRjWVNR9YQYc
	GlHA/4C22vLw4kH2Ar/R9uTsX95qiUjf+wkREBl28Oz1SIDFWIBeY4ROCUEg1/fpkz2skOlOCY2
	FyhPgHgeNnpp38ycogQZh26sO4IKkVvswoRemOdzAQRfwsXAnBc/wV9qYrL5sjoCNbhX40OSbRl
	neZkD6McMYjZA2OUZI58o55VEwuB8OJeJixpLLDX4Z8A7crH7JU+1EpId3Dk9E+HT+QOrf3P9oy
	vJlbzuSjjO2nbTUzM=
X-Received: by 2002:a05:690c:6:b0:7bf:1433:8f92 with SMTP id 00721157ae682-7d20b278cccmr7101247b3.7.1779325790518;
        Wed, 20 May 2026 18:09:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6:b0:7bf:1433:8f92 with SMTP id 00721157ae682-7d20b278cccmr7101067b3.7.1779325789988;
        Wed, 20 May 2026 18:09:49 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:48 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH v2 0/4] phy: qcom: qmp-combo fixes + x1-dell-thena DT maintenance
Date: Wed, 20 May 2026 18:09:31 -0700
Message-ID: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GreNPD0qHyAsf6Ac9tYBMrXeT5CXl6yj
X-Proofpoint-ORIG-GUID: GreNPD0qHyAsf6Ac9tYBMrXeT5CXl6yj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfXwRFWp+2M78Sg
 KS8djxswjVKIW7A+CX2kSPZxUMilo++LaqLEz5k+FJZVqEropXOG6G5W8bRTgvZXmPOuHN/+27E
 nmuoN5FcZ8JEqQHSYDRsqM8V5FpT5XEK+8EQPFESrMZkJg7c9KC1mzZNHaEQv4FVmK+cswN2P0r
 Rmh0VDA4INJJbH3Y9NrQFekbSZN3PTvZU2sWGvjfniVXduYspjVR7NpodbdqVelvATNvSeaWxDq
 d8l8nuTAD2T/MUluSCtBm/GNzEyVFq1RgYgN9dwLZXUViGKNCH541S0imhQA7z1f4yrKFTyFPOv
 PDB9OfWBmn/hw0VPEq5BaAZHQi0cI/XEaSusje0/cR9T8Bm6/tL7oOymFNonEdrTV6C4Q8vPgWa
 shd9r8brTDVS5okLA/skjYxjX4bMwm4Lehkcnu9/XpWz4mTsHFPRkFmfXSPWaj3AOPifM9uHk57
 wyFWroKCZ8l/oxtHsvQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e5b5f cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uA_aelndhFUrj06f5w0A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008

Four patches:

  * Two pre-existing bug fixes in phy-qcom-qmp-combo that are reachable
    today on any board which registers a usb_role_switch on this PHY,
    and will become reachable on more X1E boards as their Type-C
    support matures (patches 1-2).

  * Two dell-thena DT maintenance items: one mirrors a regulator
    always-on change Hovold applied to the rest of the X1E80100
    family but that dell-thena missed, and one bumps the linux,cma
    reserved-memory pool so the camera pipeline can actually
    allocate buffers alongside a normal desktop (patches 3-4).

== Changes since v1 ==

  * Rebased from v7.1-rc4 onto linux-next (next-20260520). v1 did not
    apply on top of commit f546912bcac6 ("phy: qcom: qmp-combo: Move
    pipe_clk on/off to common"), which landed in phy/next after
    v7.1-rc4; patch 1's hunk context is adjusted for that refactor.
    No functional change to any patch.

v1: https://lore.kernel.org/linux-arm-msm/20260521003615.1260844-1-mike.scott@oss.qualcomm.com/

== phy-qcom-qmp-combo fixes (patches 1-2) ==

Both bugs were found by exercising the typec_mux + role-switch code
paths on Dell Latitude 7455 (X1E80100, dell-thena). In mainline
today the bugs are reachable on x1e001de-devkit, which registers a
usb_role_switch on one USB-C port; they would also fire on any
future board that opts into the same DT pattern.

Patch 1: qmp_combo_usb_power_off() / qmp_combo_usb_exit() can be
re-entered as ->exit from an external consumer (dwc3 phy_exit during
driver unbind) after this device's backing devm resources have
already been released along a separate teardown chain. The
dereference of qmp->pcs (whose ioremap has been freed) then oopses
with a level-3 translation fault. The patch adds a usb_init_count
guard so the re-entry is a no-op. The proper long-term fix is a
teardown-ordering rework so the QMP PHY outlives any consumer that
may still call its phy_ops; until then, this guard prevents the
oops.

Patch 2: qmp_combo_typec_mux_set() updates the cached qmpphy_mode
unconditionally, but only reprograms hardware when init_count is
non-zero. So a typec_mux_set arriving before phy_init updates the
cache without programming hardware; subsequent calls then see a
"match" against the cached mode and bail out early, leaving the
lane mux in whatever state it powered up in. The patch tracks
separately whether the cache has been committed to hardware, so
the fast-path bail only happens when the cache truly reflects the
hardware.

== DT maintenance (patches 3-4) ==

Patch 3 marks vreg_l12b_1p2 and vreg_l15b_1p8 always-on. Hovold did
this for every other X1E80100 board in March 2025; dell-thena landed
four months later (commit e7733b42111c) and missed the change, which
leaves the kernel free to disable those LDOs even though several
board-level fixed regulators have no described vin-supply link back
to them.

Patch 4 raises linux,cma from 128 MiB to 256 MiB. The 128 MiB pool
is too small to support libcamera's buffer set in parallel with the
normal desktop: msm DRM framebuffers, qcom_iris codec buffers, and
qcom_camss VFE pre-allocations occupy ~100 MiB at GNOME idle,
leaving ~25 MiB free. libcamera's "simple" pipeline asks for four
8.35 MiB ABGR8888 frames (32 MiB total) and the fourth allocation
fails with "dma-heap allocation failure". At 256 MiB, ~150 MiB is
free at idle -- comfortable headroom.

Note for other X1E maintainers: every other X1E80100 / X1E78100 /
X1P42100 board in mainline is still on the 128 MiB default, and
several of them carry camera nodes (Dell XPS 13 9345, Medion
Sprchrgd-14, ASUS Zenbook A14, Microsoft Romulus, Microsoft Denali,
Lenovo ThinkBook 16). Those boards are likely to hit the same
allocation failure once libcamera enablement lands on them, and
should probably take a similar bump. I limited this patch to
dell-thena because I do not have the other boards on hand to
verify the resulting CmaFree numbers under a real workload --
applying the same change blindly across boards I cannot test would
just shift the guesswork.

== Patch summary ==

  1/4  phy: qcom: qmp-combo: skip USB power_off/exit after device
       teardown
  2/4  phy: qcom: qmp-combo: track whether the cached typec_mux mode
       was committed to hardware
  3/4  arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
  4/4  arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB

== Testing ==

Hardware: Dell Latitude 7455 (X1E80100), running Ubuntu 26.04.

Test kernel: a local build of Ubuntu's 7.0.0-15-generic source with
this series applied on top. The series in this submission is rebased
onto linux-next (next-20260520) so that it applies cleanly on top of
Val Packett's recent qmp-combo refactor (commit f546912bcac6, "phy:
qcom: qmp-combo: Move pipe_clk on/off to common"), which is queued in
phy/next and reaches mainline at the next merge window.

  - Without this series:
    * Writing "none" to a manually-bound usb_role_switch reliably
      oopses the kernel. vmcore captured via kdump-tools; crash(1)
      analysis confirms qmp->pcs UAF in qmp_combo_usb_power_off,
      reached via dwc3_remove -> dwc3_phy_exit -> phy_exit ->
      qmp_combo_usb_exit.
    * Without patch 2, the first typec_mux_set arriving before
      phy_init updates the cache but not the hardware; the next
      call hits "same qmpphy mode, bail out" and the lane mux
      stays in its default configuration.
    * libcamera-mediated camera apps (gnome-snapshot, etc.) fail
      to start with "dma-heap allocation failure for frame-3".

  - With this series:
    * Role-switch teardown no longer oopses (patch 1's guard).
    * QMP PHY is reprogrammed on first altmode notification after
      phy_init (patch 2's committed-state tracking).
    * CmaFree at GNOME idle is ~150 MiB (was ~25 MiB).
    * gnome-snapshot opens with a live preview from the OV02E10
      sensor.

Patches 1-2 were exercised by manually wiring up a usb_role_switch
on dell-thena and driving the role-switch path; the DT change that
makes that wiring permanent is not part of this series.

A personal note: it has been a while since I last sent patches
upstream -- as you may have gathered from v1 being based on v7.1-rc4
rather than linux-next. Apologies for the extra round-trip; if I have
missed any other recent process changes, corrections are welcome.

Michael Scott (4):
  phy: qcom: qmp-combo: skip USB power_off/exit after device teardown
  phy: qcom: qmp-combo: track whether the cached typec_mux mode was
    committed to hardware
  arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
  arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB

 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi |  4 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   | 47 +++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 3 deletions(-)

base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0

--
2.53.0

