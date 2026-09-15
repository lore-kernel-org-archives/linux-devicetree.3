Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5D4BE433
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474078; cv=none; b=VbQqpPR6IiSW+3nmkqTUPbAYTetZ/ZHW8f062lf+t49gnjXCD+pKOaO3FuNLCbpwAOEXOm+YsW7rXwPRegureHY5u1ySJI0KvHcO2qUx/MCVc8tk4yiVHbbsaD9yrs1TyYQ30b8SvGSWzIH+LHkWO5gWQ/3EzcZdwunCleDvsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474078; c=relaxed/simple;
	bh=GEjLPBrVnRdlflgxLLipFE/ZN11/LiXjHbHLTZLfx9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pN4lbdU0XGjhZey8yb2Q7+/v8xaY6vbtAEhT88dOt/NRcBDdWWIkJgKj218aceErUeqHpPvSSySbohSTB+cQwg49pL8wPxw7c0Yv4ltZTUVnM7DEFyys8ntOYCeOQRSMWq3wuuLk6ssSAi65RDlUWxTZ9bRLHPN2DjgIqR4KOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAzvNJFo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J70+E0Bi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAzvNJFo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J70+E0Bi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCZI064547
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y24/WIErvpDgnwR3OkPWRb
	s6Sun6MQs9JmUqk5jN0Fo=; b=TAzvNJFo3Y5FG27lkHkf/XtiA8Xma5OGpUVDdL
	lB4IeDVKeGXpSFmgdVxsXryXkjeA4tD+eSGSgf+6y9Gyt7grACeLNKEx3KiJeT9z
	MRSA1PF6cAdbpk5sPEmtE9a8B3Pd3scAuN4M41co4IOpCmLOGA5pHHVo2DgWW2mb
	9t71JedWMhkdLwWcl6xYtrTzL9CFs1ME33s+gpPFOH2Y0uJNQIuOWBftIlMdyh9e
	4TftNOFSTG0pwNDwjp5kiGfeqtQQlKbOe+Nz4p41P+zpHbJIt+EaENJyzuBdeNMP
	S/H9Ih587rvQFndTddUlp5PzWhgRKfqOpcY79WQKyuXAK95w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41vey3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:07:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so2591076a91.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474075; x=1790078875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y24/WIErvpDgnwR3OkPWRbs6Sun6MQs9JmUqk5jN0Fo=;
        b=J70+E0BicFH4PWtaxiCAaVFbqYQdl71x0QPkjBmexIGBsxDwJ27YslRzCywSqgrQPf
         aG5xCbDG/aX+hzuHmEOg5csZ5rtvJ4IFwKaOYQApsAw49Ft25wLxT3INx3Edqn7/iw/N
         R+E9Jeg9KQbD+JDM2lWwAB6o0pTdPjQnvJHqzrVLgMTDoYp4Dm7gUaDuj2vLUZp6xHvq
         ouq4M4bxkVIIf/3VLXZgk+Lq0ulWOBSq2tOMNgtnfJDHLe8ByhZqWHMZVuFVHSuCir8i
         TpL2V46pwLgcy2oBUFSdC4qYC195uVktq1+IsZJxB7bLLjZkg0xGL/oNnJ96Yr2XyQ0F
         PbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474075; x=1790078875;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y24/WIErvpDgnwR3OkPWRbs6Sun6MQs9JmUqk5jN0Fo=;
        b=qDNPIlPxVF4l4b2KoSgedQoa7Y669Ob5vsqF9oGNomkivv5nWpiePlLrPeCaxOYQqS
         89MM077/PFzjYq3Qnkuj4ND6ogLb2wIvpYFHL6WZz+kQyDslI86+bsxPTMAMgiFat50u
         qljPZHzwK9I5a7MUbhmqvUWfcJFX2mQ+hgYqFsGB3on3vBii/hOHwbkCJ65jSCiEKe62
         YJ9l3XdPOSAQ2KYUIncSh1xTigZU4SjLsoITdqjT+MVm1cdMjBmjgulnbiUxWT6qNuDn
         kYZh/q33fYN7bTWvr+kqgFcIHoaIcfMP1leVABFT+LWUKO/d/tuHCND11hlkt4W0q2Pb
         9MeQ==
X-Forwarded-Encrypted: i=1; AKwUvByx1n/AI8aV9DNlGt/gjp52bwIbVSodi8aTo/8cFUkO0flzBvtPlQxtuQbvG4uhz4szwABZ4oS+EiKS@vger.kernel.org
X-Gm-Message-State: AFuF++knvrnvTg+xw1N9P4EeeVftIXo0SJNHX5Bzsrd1F5jb1EB4c2gC
	SQPSwaf1CtyAspqrhujShQwzNB8r0BukO63eosSox4v6P31NI5TgY5fBBdKtGfA0t+/+s3R2gOb
	S9E3SG1PaZVseoZQLCTTKIBIwvUIldhBWJvWFJvIE9VvNf/VW+SHbfWUxVsONkpv0
X-Gm-Gg: AYBFou2qaf86gqoI180nPXoc8masP4r5jQTAsvaS58AOaX8KNhDz1AgvSie3Pph75NP
	+zWdQZnsVvr2/4CAGH9KBBRF97+fo8Y1i1k3/KeeCsb9MLGl/fKYdNlw7SOJG6eieOTTBazcFKB
	7JPKiGgTQ/DoOEoLUQxGQeu7zr8rFx1BRlyZBzHBxwIf3xxbQE9o9dhaOswun8NO5exNjpIn5LK
	XTHWZPYm++0vbS2AI3YgqzRLoNgVHIeV8lDFo869QWML34SjOjfT7QP4D0+YDg+hmfL8s6iXQxo
	cIPWyQC7O1C0VM9wD/jHn0Vxb4hH4U+rr58RaMAWisPuUnfZ0BQXvOZWLZZrFQRepw3d6d7QkaN
	TX+5s7e1GAYU2EwcNgF5UyLjhEnW2UKk=
X-Received: by 2002:a17:90a:e7cc:b0:39d:fe64:5725 with SMTP id 98e67ed59e1d1-39dfe6461f0mr7275115a91.5.1789474075401;
        Tue, 15 Sep 2026 05:07:55 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cc:b0:39d:fe64:5725 with SMTP id 98e67ed59e1d1-39dfe6461f0mr7275025a91.5.1789474074785;
        Tue, 15 Sep 2026 05:07:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:07:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: glymur: Add rpmh LNBB clks support and
 update UFS mux ops
Date: Tue, 15 Sep 2026 17:37:30 +0530
Message-Id: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAI1qWoC/3WNQQ6CMBBFr0Jm7ZDS0CquvIdh0ZQpNALVjhAJ4
 e5WjEs3k7yf/9+swBQ9MZyzFSLNnn0YE8hDBrYzY0vom8QghdSiEiW2/TJMESfHaPsbfkuMSkl
 dkqo0aQNpfI/k/GsXX+vEnedniMv+Zy4+6U+p/innAgXaxjlp9dGcrLwE5vwxmd6GYcjTgXrbt
 jfaLLIswwAAAA==
X-Change-ID: 20260904-glymur-ufs-clk-changes-55264e596e6a
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX4zuw/3hc06My
 45BFJDyhmwNNqTGO4fbE1onm7wojBUUNKjeAEaliBUlXUbm1IvV72+noA0SW1uv1RkijpieL9Hx
 KAzaOVOy2ToIP2vTgQ2bzbshAzG9DWZQEYkW/8vz+SkImxx1BeVw4Yv7dp6vMgB1hkz1zg31yKJ
 OL7Nqzbll8RtzaQzm9C8U4vSm3UOoGuqzz1KKCtzqCWXyHsqftmISNB65XCtWolEqRMcFPxke5T
 xv3Gq14U9dLIiFcz/H8HuaNrG5/yLACK5bl4mwv4UIYRBJv3/vLt2Iepdd11abLaExcC1VR55iw
 zpgZb6UAe7Nvy8TA0M63SM+s3oknerX7LoRZKb0JLG7H4D0aZz7QlgfhzyCeQJI9v83J8nzFkv4
 1d4SjKIWbWqA9/Zg3ZIeBYUzQuuFmQaV6V4q+GkJvrIQsiPpF5QJD/qUl5+awlR5CCPybIu4lk6
 cdifqTrhsOJyR9xVlXg==
X-Proofpoint-GUID: bsrYOcYRrAlis0RfCoJ4FUHsSB0ZaYJZ
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa9351c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i2ruGUmHugH7EZfeDigA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bsrYOcYRrAlis0RfCoJ4FUHsSB0ZaYJZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX4FmoTYTUUF0s
 IDbZBTP5Sq65t9vt0OSsp2Qk/vW8pjf86GDkBpQCl0kIa9s9RVspcuZhkMGW7gaCKX5venzgwTb
 y/ut2PJbTWCpqC3WGIYYwYrzUy3sPQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150175

This series adds support for rpmh LNBB clocks and update the clocks
ops of UFS muxes on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Added R-By tags received on v1 & rebased on top of latest linux-next.
- Dropped bindings patch creating alias for TCSR_UFS_CLKREF_EN
  and UFS DT node will reuse the existing TCSR_PCIE_4_CLKREF_EN binding.
- Added Fixes tag for rpmhcc patch adding lnbb clocks support.
- Dropped patch updating GCC UFS RCGs ops as it is not required.
- Link to v1: https://lore.kernel.org/r/20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com

---
Jagadeesh Kona (2):
      clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes

 drivers/clk/qcom/clk-rpmh.c   |  5 ++++
 drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
 2 files changed, 23 insertions(+), 51 deletions(-)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

