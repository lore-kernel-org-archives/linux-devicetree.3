Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C89F46D545
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146632; cv=none; b=fAVVzYKAW0s/usro43ek72ZN6RZuL16RdbiDEscRUUgJa+WuBGAOsTOAz5XTRHYeYno9A3FD5D2LOzajA8d6vSGP0NqEquOEs30lTXaasPI8wNJmT9slpZ1c80k6lDcsEJf6nbnMTqFDvwR0EyuK1viahQnoIY44CfLm/gWnxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146632; c=relaxed/simple;
	bh=Jbm7J4If1elY5m/z8LmWl5jDmOFPgpO8abDaefYWVEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ET7VGkN1aHEanmQA0xyLxYmP2alka7Y2JSPAFnmX9bwX3C+oe8sSM/vErCUKQC1Lpo+20QBG+7abGpHWbL7Jt2U7PwV2bemdydgA342hObwzSlb2WKnt2Vw/GBe78UpY7aoBBD889ooX2qy8/XI6BM0NHnfjnro0Yn8ToN0i5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2sNMA2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZPsbtWg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2sNMA2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZPsbtWg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA1vk1945547
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mKdai1KOtRBdnu89q01U5J
	YR13nVoU/1ZFiyE0YXgVs=; b=i2sNMA2Dh5Rj6wnYuBJVeOMryJmkk+Y9P3hXVB
	geXCO9kBti9RBm0zbn+0nUW3Iv15J4tdZJZkDEsAGdP8y245H/Ot9JbIYdPj6xy6
	PV/I+QSzSAK97nqxS0htmVEqmqC4ZJPa3knabxhaug6b7vEKRAhbpcOyjtQE+vW5
	8ww2AOamIeU131EgeI1H5tOGHraKYX8IJFXBmA5kEtXAsr98CnhrkAVygPVH3vB3
	Ej8LE8P4sqDToqAyAssU1Kx6fCjIsFlhsc5dbup4D8LKlIZ3cD0obePO8ntqcaGd
	u8iBxi5sD+clHXt4W++cmpzutfhpBMHfzCfY+7C9nvKcq3wQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrh79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:30:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso906366a91.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146629; x=1792751429; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mKdai1KOtRBdnu89q01U5JYR13nVoU/1ZFiyE0YXgVs=;
        b=YZPsbtWgETuQ5M9WAJrwJa2Nxg8PYinucdJE8oK5tDtEPp8otZ30i9OP8ldWzay2Yk
         ksJAvMrK+dBw/vqRFvQIMF7NWCD07Ojc2dL9BwOTI+jObHbJfz6/H7NpYL48Zd8AxpU6
         XTfX2Gy0Tgwn0tvIP2ycTuEMrmUPUlvL7GdX8H+rVFBM/EGw6b8EnYcNFhmJ/A/DP4Ie
         3ytGPBUcK3cATAif1j98b2lViAkHp7KULoMZJGQzKEEkwUFOF72gaOU3kPlbNsFYg3hP
         gOXr1HImp6f8gntEDJcwCf5nSwnFtxpbzLjsEt1OZMUaVFhZ1xW3TPtmu5upFhKq4U8V
         6HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146629; x=1792751429;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mKdai1KOtRBdnu89q01U5JYR13nVoU/1ZFiyE0YXgVs=;
        b=pTAIeQuQtwOAiKxkCUbeo+oEpfM2zvl8iI0HPBYTJsy9KzbNIiZQpehBHzFvDyCzFv
         Wz9hROu9kb9ww5ZoUsUkm9m1qdTTMpA6IlbKNokuWE3C2LRAd/hAU/WkVLj86Sxw7D0R
         VBv0ZC7qEYE3f4G2/a0VWn0KT3wb0umwGyzodJx0OCOBjBcoR4pB+vv9aSYPojJvscFU
         K667GKw11qwlCuDkOzbjdIi69/qcwn5x55o/ivK0B+jY+iB7IcmYEF11Sw+VSaPOGEmj
         U6RdPv3oro3w2sQaggHy0WlJdccS7p/WiLprvWBzCwjTMQF61rT0S2eikbgXKUxvGF85
         i6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmPa9/i/qKsqlT+0XSutUFIZdmomWFeIyQWUQjPeAzueHh7w63kT3cIUVPZj/R9TSUimMh/VzLYFyQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKD7W7hRzBz1s31ouBMfXBsIlO3jPyIjev8PrDIYtsZHXHqMvsi
	Iwyj1hydk4XPEZkc9exViaZ0ncyx2G68YllT8jPcXkvNsFNiPNpfwbUrAdh5oLNNvAXHvPWsHX8
	/U3YfUAbFX/5z2Z7N2w/BSx11s21ygrKAQZr7N2GZziLQ33DJlqbkPzq9iw8t2eL+
X-Gm-Gg: AYBFou1ZOFgTtmqiH9DfMOzqFyJ1tsSNb2TBaU+8AW/kLt4wf1TOn+oyTpifRi7LdFW
	Immtf9ZixTGZpIgV1N0gTNlhk97v/IoxZnO/qYMQw17SJ8IyJ8nFJGlm7xA56OCpHd+LSA5a9TY
	aewHXiZ2ons0LxsTpW5t4CB51oRnAQpjkifUv6XMlCQ3xBl/2Unvw5H6zQwWAc8KXGPMxdRiqVc
	E8S+8S65XDbdA5Vmh/YRqjutmADOKcGwIsi1h9kJYzpePuXpCShtgLCrsK+vaVnhtJDsrxzMyUv
	jXpfco0RWD4aOqVx7crkQfDddkaE4AqP+E67VlWMbkAPQIEbX129cc4JP6fdCdyxahn0F8DaWQD
	dLmy8TyCdQQ6JJC575MIyFOB8E47oFr+tKh+45cMhOK+d5fmVtu+AGghVuqiGvwQ=
X-Received: by 2002:a17:90b:48c1:b0:3aa:f4af:1e0b with SMTP id 98e67ed59e1d1-3ab3a32f599mr17763799a91.8.1792146628696;
        Fri, 16 Oct 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:a17:90b:48c1:b0:3aa:f4af:1e0b with SMTP id 98e67ed59e1d1-3ab3a32f599mr17763756a91.8.1792146627935;
        Fri, 16 Oct 2026 03:30:27 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm961696a91.4.2026.10.16.03.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:27 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v9 0/2] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Fri, 16 Oct 2026 03:30:21 -0700
Message-Id: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL380WoC/3XQ20rDQBAG4Fcpe+2Wndlzr3wP8WL2ELvYNprVo
 JS8u5uCNBhzM/APzMfPXFnNQ8mVHXZXNuSx1NJfWvAPOxaPdHnJvKSWGQo0woLmQfFXOtE59Dw
 OiTvjAUnIEBKydvQ25K583cCn55aPpX70w/fNH2He/lLuLzUCF5xAGB80odX2sa91//5Jp9ifz
 /s22CyOuFAQVwo2RWJSlFIEin5DkUvFrhTZFNToREcx55g3FLVQpFgpqilZade5IByA2lD0XXE
 CVoqeuyAYQYFiJ9OGYhYKrLuYplilsqMEifLWX+xd8cKvFNuUThunnVDKOvpHmabpBx6Qf9pXA
 gAA
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146626; l=2993;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Jbm7J4If1elY5m/z8LmWl5jDmOFPgpO8abDaefYWVEA=;
 b=s4pes98VnyKWfLm54jKxGOSlWbHrBatNLdKUmIOYRFdGkxVTq0hKSwPjnSlBRaxSQ0UVIIl7E
 5l+mxTRzZAgBzi1fr50M6ZpT0bkXVa4hPchUHOESmDHakF80JB5KXw+
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: 8ES4ecXdi5ib34vOL9TMWp4n_SgIzTJ-
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1fcc6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Fi5xAAtXvFuIIJDXGKoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX+j+AZiv6Ii0+
 Mkt4NwmzvTFdPlXDacl1YxiRGdfyFai9ySQ05pMn02QqVsYpG2NbQXcXD2KCbKmvtfKOKpvF26c
 ImPdGU2Kkkl6H3TQPJfkB6vKoNamo/M=
X-Proofpoint-GUID: 8ES4ecXdi5ib34vOL9TMWp4n_SgIzTJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX8iEAWZ1T+9zQ
 9uaikf+QMXcr0etKKZu+2rweLTM+ZShjXdCBrt9YsmVK44PWUC/YsAfx6vuLhwWtgckXCpy5Pes
 VFqZ54P1UdVGq4+ZRg+ysAIT4Hk/XWbs3jRfw/99rloYjjdQNeXZm4dcr36jjcKEADSqfNO5jsI
 nNUssuv6+qTLSqMbRQEMNbjcMrJRVxUmbV7YiDiEZsUWBevMKO1oqs/zktnWxo1Su1Pl9EA2aUj
 yXE9XD9izz7+haWw1lNCrY+n5PfUd8f5q4kjNgdToNtWjLlgzSbeR2a0h93PQ/7+31YRXhhD8UN
 jeRfCZSicOOTecMW7HFwPf1qvY8uVkRDl7GBBZTxouC9sLnoK5QJePNVDElu5ZnhgokiF8HICpG
 yRh58/EKlf1LEVUct48NMX7bXZrjEJFqWdf/VbSo5G1u0Cjr34m1cq5wuUoUt/I2QAjVUb07Asz
 LmuoqFr7KWWfVw7RtVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
removed, leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees.

---
Changes in v8:
- Rebased on next-20261015.
- Dropped the DT binding, SCM, and UBWC patches already landed in linux-next.
- Retained the Kalambo SoC and CRD DTS patches.
- Disabled the unused bwmon_cluster0 while keeping its shared OPP table for bwmon_cluster1.
- Link to v7: https://patch.msgid.link/20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com

Changes in v7:
- Picked up R-b tags.
- Rebased on next-20260908.
- Link to v6: https://patch.msgid.link/20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com

Changes in v6:
- Add the QREF and refgen regulator supplies to the Kalambo CRD TCSR node.
- Drop Konrad Dybcio's Reviewed-by tag because the patch has changed.
- Rebased on next-20260807.
- Link to v5: https://patch.msgid.link/20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com

Changes in v5:
- Split PDC ranges at 130, 147 and 171 to skip pins 134, 138, 156, 158,
  172, 181 and 202, which carry gp_irq_hvm inputs with nothing wired to
  them on Kalambo. Reported by Konrad.
- Reword the commit message to describe the PDC difference.
- Picked up R-b tags.
- Link to v4: https://patch.msgid.link/20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com

Changes in v4:
- Split PDC range <108 619 22> into <108 619 1> and <111 622 19> to skip
  unconnected pins 109 and 110 on Kalambo. All other PDC ranges match Glymur.
- Rebased on next-20260729.
- Link to v3: https://patch.msgid.link/20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com

Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

---
Gopikrishna Garmidi (2):
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD

 arch/arm64/boot/dts/qcom/Makefile        |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi     |   4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts |  37 ++++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi    | 123 +++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+), 2 deletions(-)
---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

