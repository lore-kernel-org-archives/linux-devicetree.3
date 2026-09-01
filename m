Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A91F3B85
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242677; cv=none; b=E7b8Z8UZvFG0ZMNgJ/wchRGlFPru2PiZ5t087hbwO3IXdduxuSuUMvV03tKEujjzRz3BsQHkuMDZipz1u9Uv/X94JTeo/IDJi+S7QV9TAgE4vOcLMiUIZl9dUIF8SdKap8ANSbCtjbyAKgllWE5PU0OApAQCujLBJdSAYgGWsx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242677; c=relaxed/simple;
	bh=sdAD9UnwXQYZoYPI30j40I5aeiFnombqJ59n0J+3aU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MdFVDDNNLaG0R3u00/ngNZD1RvhE4U9R7iwm+g+F9i9NkIZfhS2pAh7t4IQyZ1vw7oWeClyKFmPzrOftKt0a3EdWcKL5SeWRXkmvE6eCMg61bMqZb/3KisHZ4pXqpDytVhmsM6oiGikmwtU7jj8eYfehWrlp6IqDLAIPTBhc72c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfMzcn60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHYdMBC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfMzcn60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHYdMBC3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p07q1487686
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kp/nji48OQnOcUeMn8Jqrf
	83t8bcwfGSAcwU6h8CLw4=; b=DfMzcn60Mz8fHAz2tGfx9jhsvVNy2oJ5GAczvS
	uoORFzNEjoR8h5EYmZ+U7XeSewKXMLkGRyrYZAq41E7w4tRQf/Xjuz8/+M8s98c1
	Wewct8hCBjmT5o0zYOkF5x9Ask5f/mjy8FZnbg9sa992Oh6PnLUZXHydww87AQfG
	bZW5l/es2CV7rB8+OCguMESqnCDCgKk1voEYuv58DRFwwKEC/w+utqh+GO5kakmZ
	xfVet1hTij3+jCb9M/lqfxE5a/EelBJYhGbDDx2G3PFI6rBzwFJudW3A8dBvKqpk
	JM/6y3dGcegbEsd5UWhr9ivP5b+QcLdlkUiF3j/d2P5ovOqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchaa9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:04:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so6234176a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242674; x=1788847474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kp/nji48OQnOcUeMn8Jqrf83t8bcwfGSAcwU6h8CLw4=;
        b=eHYdMBC32bySJawwLBlhtX60bN7r0K79v1uxbdCpmMyQ/3oyzIBQPu/SHIMsgM3Pru
         IaVFN2R2UcMGgDJO0ltL1ckKUT8WrF/jtzvFndIEXRS9/mwoDeAZUnAPyo7rdHv6yS8K
         PbOo6wAv0eLX8Js9Mi3W1YGAJAw7f4h9iIx5PN0wgNyZVGhz9Wh0sGDUDEPDTARqW4Jk
         yyzLrbNKuwVZHn/DohFRJYscEv3q2iMIF66DbW/UxODJVWHt7EC4yhhMLju9ErVTITmC
         PM8/CLXbxdqH8uU/dRP2E/VnvT8U3gd+oHAqlulUDB2I8JbdhuuF4csw2+Qo1I5b6ZIA
         lfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242674; x=1788847474;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kp/nji48OQnOcUeMn8Jqrf83t8bcwfGSAcwU6h8CLw4=;
        b=PJU9oibLhiMSRpLxfnftIR1uRcGTALG8SyEjGvcg9PKBgZp4Nt80RYvq1nkpMEsg6W
         oweYyh9KIx4CdMgNwYKv0EWRmjO8Oi76B8cUZ9jPwH5a3pmyFDOQAgFIsuOngrTE+VIJ
         sXDvTd0uwrnp4Y5u+JJBYpptgS7td/r2BlkGLtRQArtafDIVYrayu9rv7Jc/jhqYq8Qu
         ynzH53V1VFX0WvfsWQCatk+6RtDYJXgeFNOEGBaQgyFfJOJg0MUkbk1r46o0vOwD4NNY
         k13nnPiqMn7XQnV5iRmQ0wkRIuGQq3LdlVuba1shsW8yowvrvHimsuDudK1Hb8V9VGyU
         UQjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMfOc7yJg+46IQOYhVZSqPBxrc6UbFa2aLWr3vXecqBD6UooMDK6MgEioD08Z2Wf9Bb7Ahq8Op57Gz@vger.kernel.org
X-Gm-Message-State: AFuF++kyK+X53+uKC0tS5JkWqWzE0ONI86KcJLKPy1SaktNug1tp9MSD
	COb0a/ASs9WnDa92lzlWLwrIieHGb01VnICsccJlvm6rcI1ACeuQgV2U3d3pyH3PDye5/tBlKhj
	jG4hHjpxc7wD8r1/Tv8YJ5MOGctZWO74MB+rIEoRcJqc9rrauCK16ZFjC2R4tztRR
X-Gm-Gg: AR+sD12XV2P/nFofvgGUO5ZKqO3/sd/Y9AOxQhO9Q9mjAmE1T8c00wG1iKgRCwEi3gF
	QFl7FsxoaNlKYutQwvS1+ZHHs6p6EjRA8SuN7r2Ogq8NkqQL8TpB7f1n68Q0EvXXeO//3MRheoq
	cZxTO7rJcJTElnifyRxboRr5Zuak8Jpcy1RsC5epoS5x3Jicx/7BdBTQEGy0b+AIIIp+Qo7AY1u
	2b5I1IVy6GGsy5M3ri3WCP4ZgKigm3CVzqa2oUrEDnQik6jpTfPd0q0h2U9a5LZLnvohlhm3guH
	Px8OIjWasxwkVrh2yuf1shuCX6pN1MZ68LuMkKwd3brnf8rRRO+GnbrH5qbPHklA34A3mQaOAA6
	1z4d4TG4/hYemB0BPggZ9nBcaUm9MYraAt8TpQ96DbHqZu0o91f1dhDDyZNhSMTr0ssKh8dNSWc
	AY3Jnvj6yWrgoB3+u112Ze/mBqbOTgLg==
X-Received: by 2002:a17:902:ce91:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d94a8e0e50mr65328845ad.13.1788242674498;
        Mon, 31 Aug 2026 23:04:34 -0700 (PDT)
X-Received: by 2002:a17:902:ce91:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d94a8e0e50mr65326855ad.13.1788242672692;
        Mon, 31 Aug 2026 23:04:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support for USB phys in IPQ9650
Date: Tue, 01 Sep 2026 11:34:18 +0530
Message-Id: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJqlmoC/y2OQQ6DMAwEv4J8blAwkFJO/UfFIYBbIhUCSUAgx
 N8bQi+WxvLOegdLRpGFMtrB0KKs0oMHvEXQdHL4EFOtZ0COghfI2dhtTIiM2pwajg8Efzkaeqs
 1WF7VxYam2cvctYRaWmKN7nvlymig1bFLmCZwBjplnTZb+GJJQuJfmIXCJWGcYX5vRSFTTHj91
 NbG0yy/pzP2A6rjOH4QiWfBzgAAAA==
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Kr1mbfucw9QuLMFicY8kroB01fwDfGEN
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a966af3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QVgSJ0PFQKcnxtkCEG0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Kr1mbfucw9QuLMFicY8kroB01fwDfGEN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX30ZkOM3bX4+H
 SDe7RrcUFyRfnWybQ08/8k4lsUpvfeusqPDGmsv19qhbjC9mhMfVY8MLQ8q0AOTP3VPNWenTqFY
 q9arpsg4Ab2CSnjvZcd6TU3wqxX5+pY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX/qGC6mveflKP
 jhQil5OVkHBPnFZjRHie86ykUIibsOR9ymmAIUNuUrOhw4Ypt8HAFa/Q70VvEo5jF4Ez3ov4fNS
 DB3QNusCWfHBlMyYyxPvD310XQCfuM6MqyFO0VbJpfCPFzugeTDZLDs39uNR2T7ZJsQDCcoo4JQ
 UoShmKjTMJMa0UDLOWkjrB9WRjUG7zu2b4Z2cywPToByvQive93hvH/It/32lQIN2L2hVDoRN2A
 FrTqYotgRbuRNQNd46imD21N30CsGrKCjR0+nzATTGtmTAOmuCubn2wir0NDHQitxxya1TdPInJ
 ElFlaJIwSwzpvXNSqBZvxvBl7ZV/ZzKkD3kw9703UhkbPcOdSh17NJU7mkHhCVBmhN6pz5+ChIl
 +p+jigV4q5usaxr2fXLo5YfiHgkIDFi4jxZBptrGOvYRiribHuSBR0SHrKxBs6VOgNZYJUl7Uug
 Xp+RA8PoeeAqwShaknw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010052

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 188 +++++++++++++++------
 4 files changed, 263 insertions(+), 47 deletions(-)
---
base-commit: c7507e07687010738e5f16926078f78ac0d6509d
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

