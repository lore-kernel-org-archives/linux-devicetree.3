Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA637B019
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210887; cv=none; b=FavydcamoAQ6QnFAOYnb2cwvX9yaEHLHT7K7/a4/4HMkz+58uP1DQacR1X3CBmpL9qEEJN16P6e1+FbUNPpEEHwzaqLAz9bGsg1QBUR2HR1bJXmbxhE9zAxjDtEjw9h6vXbgHkOWMEaWOGdNHBTUyXOLsYoWLhBfSsrlJbY9xHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210887; c=relaxed/simple;
	bh=5i2dlGektZ2bVp6geGN8HMb/Tbt8VlifUxmoU67T1Ps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kKk/rxlQjN0CNwLwaxH/iQtJTYhQ5u2/i3JQwkbbCXcfj0rviBbxuFrv62mRQNcwHbSVWR3VrCLBW2BHtpvt2M3VEEXoXWV35Lz1rgImeNnSCpANIhLmxqoLQd7Gcha/CJ+DqezpbuS4UwsHqCEsUoghN2U2J0ylN8I4s6vkp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHEbGbok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ce+nMIbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHEbGbok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ce+nMIbP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332N5Zk3804973
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 10:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PT5gBl+sSn8JSo9OxtRaky
	+Wb1TH/j0b0IlB8lv5iXc=; b=MHEbGbokjfxo6rDJytufGW7W1ETBD2oJ/xoo/q
	5lg5h1BpgKISf6FLgTrQrPDcVKQEDowulRXVZ4o1Kkus144y7o8swFZ2StGH9gD+
	Gp2AWyeiL7AtTbysHFX6+YLpG+W8rogtYNlz6A+XrIctzLuCT5gXDyhuePZR9j/9
	RL2r7Hv+YkB7yyKTyM87GzKk5I0Ntjj/MKN6lFjLacwIRFDrN5JOlVlaRsmW/D6E
	I/vxmH5cPUvBlZgdqxuS8Fk4jiXAYcCE+123750CU2YHePDeImM7vbTy05EPPNcQ
	q7/elyQqcJW1m4tHhz5f09bdqCWB60cp3A67WfWgTbwgj7XQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u40fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:08:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so2120709a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210882; x=1775815682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PT5gBl+sSn8JSo9OxtRaky+Wb1TH/j0b0IlB8lv5iXc=;
        b=Ce+nMIbPPLn3SSG7ArfykSswbqs9un/0KX20PkCWXAi/XfGCWnU2IlQUTbN1VwMF1E
         9WbHjm4r55F9ZEBGXx5g/lpuq08wSpDV1oVLl9ovzMoACk5tEeJD23LdaerXeAG1weMe
         XUxY5bGpNKFMunREM2KiOUyH09a1AyZU5uvGizTgqvGUMqrT2MboeFjiyHc/c/wbUgOF
         2YMuqI9IVT5PkvDWyWTvqBng2o0dNJ63cSgbsQTpWmq7lVr61XsAeP3pxnvUJ/4ckVwX
         PAfIOTIQ9goJSv+m+jwqo4F0yGgxX4J/g51HkvG41W4djMExScXmdmNzUf1c0Ibp/e9F
         XMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210882; x=1775815682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT5gBl+sSn8JSo9OxtRaky+Wb1TH/j0b0IlB8lv5iXc=;
        b=E00YIHA9lmmq9FYAFXiUDIMFfWHGa0DMYsylsGA/tLGZyQDfIjU5cTk2YHLNnh6/pU
         8f7P2v4mu7N13K9qHPfY2RAC2ycL/fBsBZpjsDs6e/oTmBe8450dJBqqEdgDazPB/uEw
         ZOFEfsZujUDc4i2iUNVzH6ENsi2LSptNr8PdultsINMrWbPcAfeEiP4x8uBdSGCWMJud
         RiowUK/u2HLv80KQ+aNC2cceLtnXlP+5rKOoV+Gw58nJXKWrs1Q8iAHx1/k16KuPWuGp
         VBlF3o51Bp7514/g0/GxNkU+T0RYmJnDt0dYp3EGHfhMVd4Te7nbgaydR4/DLF15i4Mj
         1jFg==
X-Forwarded-Encrypted: i=1; AJvYcCU0a8r80OOGcFqLFagYpTK1yZNLzKlH6m+4cgxL+48SiAJI1vu3YQzMMFt1VXl9rLsiF8WV6lLKv8I+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1QqmOnHKpHO/k4NrLAl7+iSaj9pK5ncMXuAGpP6B1uqYSl2i
	JQmI97vGMgx2Dq7Iwf6HkhtX+PW0YVaJzQv84+CjivvXvc/wY1+LSJkgD+G3d3xoeIuAccqdaX4
	/rtGWMELUSnYH+Xdxfu9eN0xKvzRn2CZxI7FPefecM/V9hpH+Gmf2efXRtG0/pNdV
X-Gm-Gg: AeBDiet4D5UXekElVyLxnGAQwuKO+ocGOnfa048K4mN6gB+kee4KKqUzBJKSqTIR608
	ZKTy71Py5C3AlEzlDl8IZbVhmWFSQrXndth6/v+ob3of/JexbUoLC8kQsa6sa7ZusMMeYq1QlmW
	XORLpfUQoSlTXue3Ei6Mw+RbxQc6+ps5fN8FjtM+KfI30q0knkWcZBBf8MBCEt2Y8sdbV5rRIuX
	c5vFlS8Nw8kd7FBiij1DB1OeM4j6e/ofouA7gDhSdivlpUeAugfRbi7b3gQoBTzq20tEFw47x4T
	kmhle2qdMMjQMdBLk8cSX+4P253SXsMeSRPRBLG6o1keW5BDiFwR2Sh0am58fR9nMMJZKmtjO8v
	Iz5BwETedQSlaRBwLqbIgg5rhFfvWA5L11+8caq83yFtoXAuOIZoDF98=
X-Received: by 2002:a17:90b:3143:b0:359:8eaa:7f42 with SMTP id 98e67ed59e1d1-35de696f02dmr2163422a91.18.1775210881813;
        Fri, 03 Apr 2026 03:08:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:359:8eaa:7f42 with SMTP id 98e67ed59e1d1-35de696f02dmr2163390a91.18.1775210881349;
        Fri, 03 Apr 2026 03:08:01 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm13497522a91.5.2026.04.03.03.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:08:00 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Enable secondary USB controller in host mode
Date: Fri,  3 Apr 2026 15:37:51 +0530
Message-Id: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OSBTYWx0ZWRfX5b5T4QDvrP+D
 Q1Vx8sfJuaQGRaxwbQvtfz7VK6ySiGqPihghsRexGfkioQQL+CZf+lqA7xs5hZDdj9St8Dw8ArV
 oPv8ejZv9VykgB0FmPV/dslhWnfXI28c/q2/xQuBOo3lYna8UFrc457QziEFVeiMjGsMlXDC5bx
 siHeE45V7rmYviQiVmjOTYwIVBLmLFkLnLmbdFown2OIH+i4MvtZ9WdKcEtW31aP1rAUIfoX/lh
 kyv5QfFQETZcWXrvAaCMkwGpcc4fGDWGlPKpoMKrtPvPC7OmcT20gaud8M6u4XDoqpPdJFdw2Vt
 /iMwmqIAgsjhokiaQEhwav73iyxCFQ2wSqgLnUE1wC+ed+1RNmaeTZD5NRiMexs/td+2Yuz1XoQ
 eSkGfk5QmBQN1f0bntltjmTuU48qOogA9FVr7ZrABISsZTusQruI1vzYHVVhaAWRA8V1T7TgIlW
 3ghr4HTMuseVs6ZFNUQ==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69cf9182 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaSnYlJwPn2ZfU4Ri74A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ayOJA2PKXALwoQM4AXTPmXa7JfOUNZrO
X-Proofpoint-ORIG-GUID: ayOJA2PKXALwoQM4AXTPmXa7JfOUNZrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030089

Enable secondary USB controller in host mode.

Changes in v7:
Split Driver and DT patch for USB1 controller and USB1 HUB support

Changes in v6:
- Removed vdd12-supply property status for all hubs.
- Added connections between genesys hub, HD3 port controller and type-C
  connector as follows.

GL3590 USB     HD3SS3220 Type‑C  USB TYPE‑C
   HUB         Port Controller   Connector


HS HUB                           HS con

 |------------------------------------|

SS HUB          HD3-out          SBU con

 |--------------------|

                HD3-in           SS con
                |---------------------|

Changes in v5:
Updated comment description in DT.
Updated vdd-supply status for other hubs in bindings.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v6:
https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com/

Link to v5:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Link to v4:
https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/


Swati Agarwal (2):
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 214 +++++++++++++++++++++++-
 1 file changed, 210 insertions(+), 4 deletions(-)

-- 
2.34.1

