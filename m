Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713CE47604B
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870109; cv=none; b=K7etZWZSF3qPO2wxdkfw3Q3HigSyfo2yk9NNBR85gUu3WwUL0dxpfrEyivwOhZjFhtoZeNcBysKAfaYBh5ZgRgWBSZT7+VmC3czLzwd35kUy9/KCVPUh8RitU5ZM5BGFMOs5tJ+PQ2d/K85K15lS8j6szOpfVD8vLtFlS8B1h5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870109; c=relaxed/simple;
	bh=GmyzzdSR34wcKZ7wk84YNudIPZ2Gqjk5ieu6wm2qqMw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S4+dMxae4F3FcSJ62yYDtXc7/mg9zlTXzRUzCtcbGmZsZDkaTvpXg+n5J1jzvmP4gg2AJIW5l4YI2N/a1KCcwBJIo6zWA1UXaD2Mv0wVL8ajPQJvwfVEKcaqI5vSRwMaJCAF8EMGgiZoA7y7waRF/Frq8tNW5a8iomwFfu/nQEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqdYoTgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEWtJPO7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqdYoTgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEWtJPO7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45siB173322
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fywdYSI+QwC3MxSFOMdWKg
	lnBFD0ZX+8NEQ03S4/7tA=; b=gqdYoTgZGf5IjK5iUfVOUexRw3UKrGN6us/1gm
	IUlMQFYerLX4BtF5n2YMb0M+BsEwQClp+WuY4ZdGO7R0Y5IP3RVhp40sLp9TaZhz
	LAjwZFPF6d3iXQQo+5QJhXP3EjSm0hfTOeqkB3Ehj4ShFIg9l90tastmJb2XH5rv
	6IUfqXw2aMg3i1BdCF6pVYT5M0hLNFU1QAizwO5B9ZSTx5muoM9yBDXnQEn4+dN3
	Sa8+oQQLZatkaJ8cj6SWUBSIImg4JPKhb7z7wLIbuXBNlF8s5rVuJD2De/rNrvJl
	RXvh+t7XP+1cZXsmbOvDaK0AV+StZe6FcD2CrAM8dJQzmO7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqr9te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:41:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8af172664so2042121a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 22:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870107; x=1792474907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fywdYSI+QwC3MxSFOMdWKglnBFD0ZX+8NEQ03S4/7tA=;
        b=MEWtJPO7fmQmP4ER31RoIoFgcizn2gt7taSFY6bhvrIuIT3Hh555cqM2T6B520t8a3
         yQhh9OJSazvmKaeq8Uo66WQuX3uBEo03QpozwCjvHYUP8amHU8nWzLf3sOGDWBWQweDt
         nu17uZiD8NVDuekQm8+WJWVeuOh6sP18v8APM5sn6tf+zY5Np2pQS4Fw4WxuYVGllGyY
         8n0jc2vbAKYrHMb6BREGgWVBw75q9n7HL9XWJvwWEEx5dmWa6pSc09A+g1/9EPnHNS6N
         4UxtELlAmId2PJys0E7yry6iJZuZIwcp9cjNZb8rczmlk//f5o2Or7nLQ2Uj+jpfSlc+
         ySng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870107; x=1792474907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fywdYSI+QwC3MxSFOMdWKglnBFD0ZX+8NEQ03S4/7tA=;
        b=Veg8gx87PTh93y4xP4Acok61qQXS4p8TOoDJjOiF1hcMTH5AVkoh7kzQHLg0yR1yV6
         T/T8r+e2oO1d6K+I/pebRSae2sb9mEEE66IMTQd86yl1W/40b3XF6mSwZTk7Un71xDEc
         TO6smKA3wVponJ5iGNDGHWX+eaB8yXJqQNGa7mr9zGZIgmzPpReUIRL6KH2g8+YIaYJY
         lsyFk8ogh4rP6Yhm9UA92fxpR2AAr0KKlkM1BV7v06ZF1yKlz0om0J/bx6+eS5qWOS/a
         2TPZf7H1wCwUPUjd0ToE4erYYOP98H0PZJ/RFntIfDZhkfuLscE00kRGpQJNCAOmvG0C
         jFCw==
X-Forwarded-Encrypted: i=1; AKwUvBz2/kCy691KNRficmOuCh5T2/o3/f8ljnvp9gKgp/703Sqsw2462NK4kfliVjbGojbAO8ERAyaUDrL0@vger.kernel.org
X-Gm-Message-State: AFq9FYLpWZnW5ZmPQzv/vspEaFbqmwPLv/0YIHsdVK7yxr18NQz9zQHC
	x8VWYu2zQ9x4nKyFi7YNTYNvo3BKRYSshkTlqPuCj+V3NPz82jELg63j1xo/w6tS8jLjTCk5yjh
	ZeTX8b+1iZovkGqCLV0oEQzbsdmExP3OC9Fy2p29ojjB/q2u+EBdqq1eFmesYjD0=
X-Gm-Gg: AYBFou3jpADV8S5mMO9YJEgvTFYThO5scS4mmqKFR9IftkflMn+ynPB1LbbvdoJcZTj
	SiozK96tQl+i4fL5WpGl0wKh5Xp4nARE7rpR8B5hBL2eJkjllkTn6oswy9MGozVYnRev3IRCm3K
	yumxam741dE0+UQeDs9w5oYaX+GI+bujDTtUBeH6kisL6CzIaFuT7ETwXyI2XwmqAbFKKggxCkK
	615VzBT38q2hQmpp3v1rBhnnXo6OpITJGO+/b2LRowo4XP6Jl/GjIkeq25YGXOtKNaWs26li3oX
	OL71tnlHbA2vW79cpoTao6Om6ZSCXXYkPZzjO51aUAjSWTAfFvIgKpVI52Jhp8QV5BC6/nC9Ir6
	d5Lw2TC4W4Rzrh9Hi3Z8d9X0Cu62TBOIhU0cg90nA/El5O15cmzxQkBJ/5g==
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr9708185a91.29.1791870106664;
        Mon, 12 Oct 2026 22:41:46 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr9708173a91.29.1791870106161;
        Mon, 12 Oct 2026 22:41:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:44 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/9] tee: optee: add RPMI backend support on RISC-V
Date: Mon, 12 Oct 2026 22:41:27 -0700
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfEzWoC/4XNwQrCMAwG4FeRns1oUzadJ0HwAbyKh9mmW8Gts
 51FGXt3Sw+eRC+BP+H/MrNA3lJgu9XMPEUbrBtSkOsVU10ztARWp8yQY8VrgeDH3sJEBKkYrSJ
 o/QiaIlxREZpKEteGpfroydhnps/sdDywS1p2NkzOv/K7KPLpvxwFcBBaaFkqbLZlvXchFPdHc
 1Ou74s0sh3x4wnOyx8eJm+DBhEJJSnxxVuW5Q12Ove/HAEAAA==
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: _yXeiSvOerxuqT7OPP74zU69vc7ZT2gd
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdc49b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CKDX5oWuAds2uq8u-J8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXzzOolhdnJio+
 KLQCClZf0QlJeavf0pRogVa3A6Z7Wyvh5/Pa/W45vs8cB5lKDIpr7UbWU8mSQhUmbrfUmssz118
 Xgps7Wa5rX7xOVojIog7bpyJIoGYf20=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX4WmdlgEAg3cs
 TqMKYhrN1B59lklqoWs18j3Zx833Mq81JTEIkCkBvpXTzRoPbiNcCYYQ4IMJouHecjsE7FUmZm2
 siVdw7li33FOPGTYKBtA1mE6s1yM5mTmFeO5Eavpm6dLaEdLGNIHUHuyrYb+RKNiXvHOYuNeTsJ
 fYrvQ1mYGeFh42CmmqPfD/oMNWvK3AWw1vHTGGK8yR/9vWQ6w4qjk+UuNh+CC2/cXwVYriymOY5
 VeMaIbcsEujyw50WkZ8q+vYIZ0kKn0Dj5X9mMffTECD/ba/wAufrecXGiZVfhdO+lcFE8eW7XYt
 AmCBJ1Rf5OmSB+rYm2EYLmcGpDUkl5E3JirP0pLwTmoBKND2F/nTF19Pf3NjWCpQVI3CnmQ7uD0
 6xi2zub2KoJXuUqjT58ruiE4XkQDTbhdcWBaVmy9fJ4nI6x3vKVmuljQeoyDC6k44MovN4iHUa/
 xCEgLmcS0bp2NtGmfoA==
X-Proofpoint-ORIG-GUID: _yXeiSvOerxuqT7OPP74zU69vc7ZT2gd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130022

This series adds an RPMI backend to the OP-TEE driver for RISC-V.
It builds on the separately posted RPMI TEE transport series [1],
which provides service discovery, synchronous calls, memory parcels
and asynchronous signals.

This revision is effectively a full rewrite of the original RFC.
The generic RPMI transport has been separated from the OP-TEE backend,
and the backend has been reworked around the service bus and a new
OP-TEE control ABI.

Unlike v1, the OP-TEE backend no longer manages SBI MPXY mailbox
channels or implements RPMI TEE service-group operations directly.
It binds to the OP-TEE service UUID on the RPMI TEE bus and uses the
transport's public operations. No additional OP-TEE device-tree node
is required.

The backend reuses the common OP-TEE session, shared-memory, argument
cache, call queue and RPC infrastructure. Shared memory is represented
by RPMI parcel IDs and nonces. Yielding calls pass command and RPC
buffer ranges within a parcel and resume suspended execution using
an opaque token returned by OP-TEE.

The OP-TEE control ABI uses fixed-width little-endian messages carried
in TEE_CALL payloads rather than reproducing FF-A's register-based
message layout. Asynchronous notifications use an allocated TEE-to-REE
signal as a bottom-half doorbell, while ordinary logical notifications
continue through the common RPC path.

Matching OP-TEE OS support has been implemented locally. OpenSBI
integration and end-to-end validation remain pending. This remains an
RFC for review of the backend integration and Linux-to-OP-TEE protocol.

This series depends on:

- The RPMI TEE transport series [1].
- The OP-TEE notification bitmap fix, which allocates space for the
  inclusive maximum notification key [2].

[1] https://lore.kernel.org/op-tee/20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com/
[2] https://lore.kernel.org/op-tee/20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com/

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v3:
- Use GlobalPlatform TEE result codes for OP-TEE control responses,
  keeping them separate from RPMI transport errors.
- Combine the parcel ID and nonce into a single 64-bit global_id.
- Make resume tokens opaque 32-bit values and track initial versus
  resumed calls separately.
- Remove unnecessary __packed annotations from the OP-TEE ABI structures.
- Share the global-ID-to-SHM mapping implementation between the FF-A
  and RPMI backends.
- Replace the fixed SHM nonce with a per-instance IDA allocator; reuse
  nonces after successful reclamation.
- Report the maximum notification key instead of a notification count,
  and use the negotiated maximum during initialization.
- Consume capability-exchange results during probe.
- Remove cleanup macros and use explicit resource-management paths.
- Use rc consistently for Linux error returns.
- Replace unnecessary unaligned accesses with endian conversions for
  naturally aligned ABI fields.
- Link to v2: https://lore.kernel.org/r/20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com

Changes in v2:
- Effectively rewrite the backend around the separately posted RPMI
  TEE transport and a new OP-TEE control ABI.
- Remove backend-owned per-hart mailbox channels and the OP-TEE-specific
  device-tree binding.
- Replace the register-like control payload with fixed-width messages,
  explicit command/RPC buffer ranges and opaque resume tokens.
- Add a parcel-reference parameter layout carrying the parcel ID,
  nonce, and 64-bit offset and size without changing parameter size.
- Make argument-offset support part of the baseline ABI and retain
  the common shared argument cache.
- Use a transport-allocated signal for asynchronous bottom-half
  notifications.
- Link to v1: https://lore.kernel.org/r/20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com

---
Amirreza Zarrabi (9):
      tee: optee: share the global shared-memory ID mapping
      tee: optee: allow RPMI transport builds on RISC-V
      tee: optee: define the RPMI control and parcel-reference ABI
      tee: optee: add RPMI shared-memory and parameter support
      tee: optee: add RPMI dynamic shared-memory pool
      tee: optee: add RPMI RPC handling
      tee: optee: execute yielding RPMI calls
      tee: optee: bind RPMI services and negotiate backend capabilities
      tee: optee: support RPMI asynchronous notification doorbells

 drivers/tee/Kconfig                |   3 +-
 drivers/tee/optee/Kconfig          |   3 +-
 drivers/tee/optee/Makefile         |   2 +
 drivers/tee/optee/call.c           |   2 +
 drivers/tee/optee/core.c           |  10 +-
 drivers/tee/optee/ffa_abi.c        | 133 +----
 drivers/tee/optee/optee_msg.h      |  23 +-
 drivers/tee/optee/optee_private.h  |  73 ++-
 drivers/tee/optee/optee_rpmi.h     | 263 ++++++++++
 drivers/tee/optee/rpmi_abi.c       | 972 +++++++++++++++++++++++++++++++++++++
 drivers/tee/optee/shm_handle_map.c | 138 ++++++
 11 files changed, 1498 insertions(+), 124 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

