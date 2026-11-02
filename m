Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608282;
	b=gY/QyuDLXYoyYJmUFkwWd/Jr2lJMxdD1fWWt6AgCgFW5v+GR6N4WeXZ9j/WsFFmQzHLc
	 RTnevpKCW8ig8zRveBGIZDQ2CLMf/BBky3oHRxhjbJ8Ow/7Tdje0l1SDiNZ5SLwTxCzi+
	 azWC3i5Tyk+rHmMNBDcHB+b09zrPZcHyW3wsmRBShEE1ATAIm4fQwRE+1KCeG4XWn1B6g
	 WwAn2EMTCFWyqlQnKZ978t475whurlk30WnhqrAH3KRQZ5lwD7Gkec0nG1P1DBoN2+PcF
	 nl+z5N6p9SaSFqRu2g+xPfRiY8HzY1uu0g7RwyrpIxuKLoXldjuUEGNdogKxba4rcog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMYB9Ukf7PZSRlLsRb/17nPBPI78tPEvnCpbI25t39o=;
	b=G66yy92R5MtglQV3msXWlMakO7BHUycH0FulnwcUWN/HZAJjRSVySo24e/w0Vo3tFPWg
	 3gGT1CY4zo4UMSbcEwS4YeQBI2CYLBwezY/itKnl/YI1aY/VCCdCwlIyNW8H1Z/MwN7Zz
	 9pUwSnhAxiajw+JUEwUYHIico+kq/dD42C/jtCeiZbrAVaGbhCro8PtfxfkcEveOrmEy7
	 mRO+R2Uui8jwSvcTqn4rXq0O4vZiwMSRm/iUFSdufxR3xz1ru1xwKJOOJRmra6P93jo5i
	 7JAHnwp/tYPT7s3jwHPW2hxDzd4ofTvjDuTuMa9oeK7nwhfD2Nnl6AHOt0xMC9gtB+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vi71yW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=goY8BwUG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4E606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vi71yW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=goY8BwUG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vPEv3324795
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uMYB9Ukf7PZSRlLsRb/17n
	PBPI78tPEvnCpbI25t39o=; b=W1vi71yWuacj7PkulWZKjD4qLBxdffHsFSFJKe
	hLlMwV+nqExr1gnYwwK3meM8tIPUgkDPJTIKXHjDpz89/0KfAZY3rWxkFuc3LU23
	FOUn19PgzjWU6b2rGBwnCAxQ5M8MmOcZDRgT+P8iixwTN5NwaUCwJzUMtPuzjTZ6
	MOSy+8xQOlu562EXpiCxu0hgaZ2jzF4zR/z6C/wgU3vLb8kfdPnVwsRR265oe0Pa
	Nl/LSyytuVcoHIQFZTlnGxoivegh5kvq049IwXTKZjMj6oFBpsBJvqk78FNXZi1n
	9HeZRk76BRa1Peqglwk39HLiFAXPEg5U3mHcB6V2iaEBRIOA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p2ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:31:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e05d31e54so1838362b3a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608279; x=1794213079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uMYB9Ukf7PZSRlLsRb/17nPBPI78tPEvnCpbI25t39o=;
        b=goY8BwUGZyqdLM1m1qiwoDmdd6J1eqRmx9qRBZjiTdyoruv7IGUsDTrz3VCP8MpX8e
         qmxB6dBEWAC+QBLJ8wJZlRw1tSOU+fqBBrvoYpGb63/avIj5U5SL0AjeTaUQD88zfIZ5
         WD7QrN5yvPf7ib7pflpCf9exHZVOSOViLSzXV1RbNYwAVgCOwhIlzSi4Rcvzm564tpF8
         mOuAayKzH9qBNm9U5NrCPqJUpmTv83DYwDszkb90Vl+cHIxfVZhrgviia/peXXDR2MHP
         juUUQB2fWqnogYao8ncPRrQ54S4BVfOVuAehovtPlJa+ZJG8fg0D6uUm2ecjJZPVKu3l
         inWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608279; x=1794213079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMYB9Ukf7PZSRlLsRb/17nPBPI78tPEvnCpbI25t39o=;
        b=N0o/oimHE8DKzzOzM5HlREHoz6Vwxl/RLTF1H7BKkpk7y5LNt0nM8LwVyXTb5CZ6b3
         eolv2/s17Hy95nB/9hK2C2E/ZOAbKCPFkJuXuFZurfsawDNoON6rxsVsYnRKf5+ZPBXK
         XUXJUNFSarHsSeFliOS/t+qbwhy+Mpzb157FdMDOyPvU2JeCOsDnbAh5evcZhqSsT9yU
         g7YyETAtpo/ty4CzGh8necLUCHcyoueR8S8vgQ+RYtcFbq03blojyqIp+Mld6hWfLaJz
         L5CsI3Ljx0VUuPrRVCFT++xFnhXdwNbpKac/7jwb30SMLaPx0LtLJoj1S62ag8lsvT70
         u4tw==
X-Forwarded-Encrypted: i=1; AKwUvBzJJWXIHCJmWWNVETdHINmAIL8kvjk7HOTr9qtOkv1rfzOxIR/mU4KA7tYNELoL7DGPZWp18ckCVHGs@vger.kernel.org
X-Gm-Message-State: AFq9FYKrWAoxHXPeqE69HCCbvndBP70ur5m2Q40ygGhr/oySRxtleW0p
	s3324D2htQjzFVSzUjNz+teHbJTHtJ4AkpxuoeBAqBptC4qAvOzOJYp0bxirRdV4IlNv5AQEoUk
	DQuyeWrDPXDXniRmMjxs9X64Op3CZd0B8g8Lltkyg73pV1bY8yPTosb0NGKvsllN6
X-Gm-Gg: AYBFou3jucQLrGE2vgXFjl+qCI5DZ/RjKI9NJB6+Bn82HnHTEUoR58M5hz+qeiT/CE8
	MHVihjc3XJu24mYrPtkwXOeyoruy8tTUu8JAofrpwWV9EHAJOeTaNcHl49qvtAUeUwupd/v1nAV
	0NeDv7tYaC582hubMW+e4Z9rXVpxBnS0E0UJvoDh92/czQfwXIaUn/yH/50w6vg1Ewo/XknVUKF
	9sFgD1RjVGe5MIAd6VowDYDunOeugg5ucPb7VQn0CLolWACS/nDsHqKKktz9HsZDNjUSh3HG9Em
	KVTZ+4i0G/prKA3ICykIKh4cjMcKAflU4pMmbvDj1zgP/0fRX6xSRtusepsG1kPi6UglumSKd4A
	ITUEXCSFNHyX+7GGz11Un2kG02kcEBRtxQ1UEXkOQNaU58Pl/8CHY+xJGniaQ1pS0bd6MuZgUeD
	q1dK8mlg==
X-Received: by 2002:a05:6a21:828c:b0:3e2:200b:dc24 with SMTP id adf61e73a8af0-3e928b1a148mr6877472637.90.1793608279268;
        Mon, 02 Nov 2026 00:31:19 -0800 (PST)
X-Received: by 2002:a05:6a21:828c:b0:3e2:200b:dc24 with SMTP id adf61e73a8af0-3e928b1a148mr6877443637.90.1793608278752;
        Mon, 02 Nov 2026 00:31:18 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:18 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v7 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Mon, 02 Nov 2026 14:01:01 +0530
Message-Id: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEVK6GoC/3XMTW7DIBAF4KtErEsEw48hq94j6mKAoUFq4tQkV
 qvIdy/Ooq6sehYjvaeZ78EqDYUqO+webKCx1NJfWuhediye8PJOvKSWGQiwwgrP0/3KK9X5rnJ
 CwIgYpfeatZfrQLl8PbnjW8unUm/98P3URzm3G9AoueRgvdIYgs+oXvta9593/Ij9+bxvi83eC
 IvRCbcygAueUIvso3cIYcNQi+FArwzVDB2E9ImyJrFl6L+GXRm6Gcq0SRAyJb1hmMXwoFaGaQZ
 5o6RSKB10G4b9NaQAuTJsM0znMBgIaG38x5im6Qf/rFDPAwIAAA==
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=3324;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=G5NPjxUkQvJJP+CDo3Xybd8QTltubPZ+eNMbx/UPZDA=;
 b=HZJhg9wSGdENOnWDyj+uqK8+1TjvNtFK6AlbEJkorfTODKGPHr6t3xi3NJdFiZR697dZXNTrO
 aiK/AGrwAqsCYwr1OnZ/B6sEMuuRtR1VUBXoZR+d1gb5v5oD/iPtX1l
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: PFzkKgrvKAJr5xJKxQpN4sSoDieR5C_z
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae84a58 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rtvGdRlZkeXjFHPAfbIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: PFzkKgrvKAJr5xJKxQpN4sSoDieR5C_z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX3XbbrNhBZ80n
 ulj/cpBVdXypV6S5us6KMTkyJsGbxbtjvTtVR/N228rHKCPhXwzMwb0q72EAwMgt+vZt3saFahm
 0hUl6o567fMn4Cm+qIyQc8PRwRr2VqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX9ixp4XrygFLZ
 tSin6T7ek5Xde5/lolsNZUcPN9ggWJpoxVHyWeDb3ojUGBSGBuYQVqvgkZAcKbujk4MnjG7Td2B
 rLgBU/9vFbo0bPAQA56WhIjbV3PP+Ec2omhE/cGKsgqhxcIfSHl7nXH+YL19z6sxaXCvxueVmz6
 rMMjepc4phqqI+dYClfFVJyzAVDqluANRTrXUXaXwpA/GCEs4iLtpmGI4NkoCH60jmGv/Ohhwut
 LAkX3CGQ32S5c0V6g44en+XWX1t8eXzUVnmKgh2mYzDalcC/XbQlAa2o73nLj/wmacOk/8wcBrq
 Ozjqn5oj1tglVJYXxCsrtKKy11yCBXJEeUpDDRz8ux2dTiBKj7BnkIqR3rPjlmQ/ZIf4oKGAZU8
 4jUd+GlSF72RZ6fbeBV1wuDShnp2Wt8GEEDDmvCn0OlsFJCZZBN4o4tomJsbSz0VkLJ0uBl8Zd5
 87YdIcg2c4tvHcrnugA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some DT set:
  qcom,nsessions = <5>;
which duplicated sessions inline during context bank initialisation.
Upstream feedback indicated that this policy does not belong in DT and
should be handled at the driver level instead.

This series iterates over CB child nodes directly and synchronously,
replacing of_platform_populate() and of_platform_depopulate(), and
configures DMA/IOMMU for each CB itself since no driver binds to them
any more. It also moves the ADSP session duplication to the driver.
The qcom,nsessions binding is deprecated in the same series.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v7:
- Call of_dma_configure() for each CB device, as no driver binds to
  them any more
- Skip and destroy a CB whose DMA/IOMMU setup fails; defer on
  -EPROBE_DEFER
- Drop extra of_node_put() in fastrpc_cb_devices_create()
- Link to v6: https://lore.kernel.org/r/20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com

Changes in v6:
- Drop unused dev_set_drvdata() from fastrpc_cb_init()
- Use device_for_each_child_reverse() to destroy CB devices
- Return -ENODEV when of_platform_device_create() fails
- Add a comment for FASTRPC_DUP_SESSIONS
- Link to v5: https://lore.kernel.org/r/20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com

Changes in v5:
- Introduce fastrpc_cb_devices_create() and fastrpc_cb_devices_destroy()
  for symmetric CB device lifecycle management in probe and remove.
- Replace module_init/exit pair with module_rpmsg_driver().
- Link to v4: https://lore.kernel.org/r/20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com

Changes in v4:
- Rebased on latest linux-next (a8406e6c0b79, 2026-08-25)
- Link to v3: https://lore.kernel.org/r/20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com

Changes in v3:
- Add patch to fix async probe race with of_platform_populate().
- Rename fastrpc_cb_probe() to fastrpc_cb_init().
- Reorder series: sync fix, nsessions, binding.
- Collect Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com

Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.
- Link to v1: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

---
Vinayak Katoch (3):
      misc: fastrpc: iterate CB nodes manually instead of of_platform_populate
      misc: fastrpc: move ADSP duplicate session creation to the driver
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   2 +
 drivers/misc/fastrpc.c                             | 153 ++++++++++++---------
 2 files changed, 89 insertions(+), 66 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

