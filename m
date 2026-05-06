Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35013309EE7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092733; cv=none; b=pe6PJLDHm83G9eCcD5s/ZcktliWH5EOd/GdKg6WB9ozQX/77DTNmtRZRD3n/iq9t4A8b374w2lTSc7dji+NeY1UIx0B19GbNn+sEiQHo9wzad3ku5i64AptH9hDPGv3AyU8249P2FPnwy3wKhd4Yx81sye5RxTCrjfqhsA1SSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092733; c=relaxed/simple;
	bh=96jOQ38DKHlJwyQEUSdRWVCI2RgSf5udNbyTMFN2/pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dNETUlsUOh8xQKq9l5ZFvNGgUh4LdV1ZOIIt4hnCUBjvhSWjg+YDIhHQiA3myvR6XkNhBZrLhIHGNXPhJHDDrMWYRYvkrszud/YsxkyjFhOUHbdZqWuCx4RiRGlPDVuK1bnn2AQPqUDlcM95eBC0svZuMhjxKePfMe4QLESUJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzVnkXD9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R61mfW34; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzVnkXD9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R61mfW34"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GbiGM1987488
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 18:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u5i73O2TeW40M4e0REO3mU
	O4IV+MciKckhAqv2Nzlgk=; b=PzVnkXD9hjtghoCbgomISbLX4MPW2knRx9DGpH
	MOMAT5ueFuKxzpuncFbb3m73ub2TTo7JIu0Cd6+D0WEnmehjEubRgbABWY2CidI4
	dWmm7fJT0mh/l4FHZk7g6aUx4QmTbF8of2/SilFjRqkujnup/l3oaCDn8g6OoM+K
	vAEqpJTF4Htt0fV1kVFGjGTc968iMYKuHEbKI5GcajCZMQpenYGe0xl4WEKfcJge
	LBx+OXnPFrWU7dt5LscWE+iun2i4ecR4eaoecHgenPH/QM/alBP6wmJZd+aT2R+e
	PC8IUtzn5InpS5lAN4ldbZvalUoyDoTfIYcKEUS3kq7mdczw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp1w1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 18:38:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so5725eec.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778092730; x=1778697530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5i73O2TeW40M4e0REO3mUO4IV+MciKckhAqv2Nzlgk=;
        b=R61mfW34mJYjFBv/0Wf8EUYsO7N8FB1y3bd8QX/KsCLLjOrTsbbsfOLyEGT9VG1CAz
         Lq/nRTdg9cRw2gL6uPAlsYE22aE25TYFvroaoC3UsXf2bQ3BaICE1K4t6zvhgtd1WzvE
         a533LXmo2l12QNcnpJEU/6NC9EhtHrRA/KsfA0UPJ5xpBvXLX/k7+p+sSARYbjhYJDiO
         hiNQHSEZUzzJtgo+dJnYdToVry2kjkl0pctJ0LppUgaJNOJnZ5UFyaNYwuiIaXP+rZL/
         WND5DaYKZFJvfw3xIxyAvunJfTrR7J23vspbbKGyVYg8nWKgbQmzs6heaURcRgfkkuU9
         8mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778092730; x=1778697530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5i73O2TeW40M4e0REO3mUO4IV+MciKckhAqv2Nzlgk=;
        b=n1fqKpuXic/FhxLIPKBylAr1rKHiQCCYkDWEmvnyXCjVIQyBpjHm4FHTBKCTccYBU+
         6lEvemihs5DFsibyj6DpAmfjomfFMX+fCYyx6lDf0TaPfm0Rmoh+j3N8sLF5noz0a2cb
         K0XyIsHkT29GdZLi/uwnTdMfbLw+6k8Rm7sOWqIHZKd4vR5ymnKydVpcQC+ZhiE9dx1J
         rOx9NOdTeJh+OzgiYymzdvcabEasTm+4Wjc1DjYfymYqS63L0m3f+4a5/BhGp189kZ8D
         we+rQ5L0pMQ4zF76rgy4HD0VKVfiSGaf5oSUo+xt17hXIGna7QzQNBEFIhFLZ1xRTiPQ
         JnNg==
X-Forwarded-Encrypted: i=1; AFNElJ/sAhk++SnL2QnZeieASlpoUP0ulmU3pC2NuwgVMBmTWRvvlJXhpv1OA6rGuMd50uB3JbMTPdLl/3lf@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ3+45t82CvSngd5T5MdoUysPEMERizXzVCngUMYKmNK8st/HU
	cncvZ9N3YgU3v6+V1o7eDBbtxICCVeUH8Pw3D07D+jIYE3Hx0FhrTdC18p59ynV5hITE9RScdzC
	LJVsRJdkygBYb83scnpnv91vj3dBAvGKsaiivxnKRvKuWIFhIvywP2YahxrU6OXf4
X-Gm-Gg: AeBDieumAFhRXdFRAXDynH09NOo4gkVzjLWMWlRazCJl1Y2RnlrLLfcQI+Dd7x/Xfeg
	v/RL/PdUsHEmVaNGIruwtzpd69bNFhU753C6uXUesssTKvQh4a8e95y+d0betRbuS8Gf5qL9xqr
	4u9gffQsSTFoWnaSRStRw91BatV0TXZsYyphv7IT5T8g9XN2IeOY6DbhoxgRaTI5C8P0EUQNRT/
	XsLroqpPXK+OQ4scGjy0MgKlKfSb+2QoR9EYeejv3KVw6Aup4jFZfJi5O7NEd755zZpM4RqpMF2
	MSMMJUHvePs2WqwFEY7Tk48N7XjzGVMm2qM4qLTxQBQHCVoNjE6710acfDHTaXX9N2gD5jdkd+K
	nnA+/jqHHqbGXR4ntcEmfRbfT1mzpNndgTgQcQezm3rNa+uvr0cqGX7LKFNfIEKdXJ6yKGkEEPW
	JuggklDRidCuY=
X-Received: by 2002:a05:7300:818d:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-2f548e95c62mr2289986eec.13.1778092730189;
        Wed, 06 May 2026 11:38:50 -0700 (PDT)
X-Received: by 2002:a05:7300:818d:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-2f548e95c62mr2289970eec.13.1778092729569;
        Wed, 06 May 2026 11:38:49 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd92780sm4958372eec.23.2026.05.06.11.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:38:49 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi
 SoC
Date: Wed, 06 May 2026 11:38:45 -0700
Message-Id: <20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWK+2kC/3XM0Q6CIBTG8VdpXIfjgCB21Xu0LuiAyZZSUlZzv
 nvo2vSibtg+dn7/gUTXeRfJbjOQzvU++tCmkW83BGvTnh31Nm3CGVdMAFCPSGvz9NQqi6BkpUs
 hSTq/dq7yrzl1OKZd+3gP3Xsu9zD9fiOCLZEeKKP5SeamdIUVGvchxuz2MBcMTZOlh0ytni8+Z
 2rlefIKK+d0YcBy+ceLtS9XXiSvJaBB4EaD/eHHcfwA0TyHfCcBAAA=
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778092728; l=1559;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=96jOQ38DKHlJwyQEUSdRWVCI2RgSf5udNbyTMFN2/pg=;
 b=sg4fhKMVcehnEw9zYXwuwp6i/tpPNQZfOAc55nKz+OfKKCSQqYA80uLGSRsnpCiSE7JbKwsQz
 viSptHDSwf5Dt6RDr3bJSihCTAuRPkOM6kJ7BGwo/Gc5dZJHbFzrBX2
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE4MiBTYWx0ZWRfXyrYEtFbhzDa/
 397cik/5YTaQOmX6i4stiQRVTfHUORfM2mwkhTtAShqLy+mbs/uXGJjFMFDCGRGTC38MXIvy9yi
 ouOlGeK2fEqTiS9DPcRcu0usQzWNmY8Ft4oGYRusc2mCZoJPNJWCIEasSnFKyjEH7ULnO106siA
 ZXQZ2bp4phMiGV++7c4xO7wcvMQzDDn4kcZB0uCArQBKDloRJOzc75SwMC/tY9oZq5JNrD3KsXv
 aVhak5V+4l6fm/UxgONjy4R16yF4sdul3gGKfUao166qjSedQrK6dJiJNA6ic4hEgl2VDqmZ5Vr
 1rnIv5dAE5cnzAQnezVj1le7e0A8qbgpm6I36CKyWzeD+lpch3LUR/uLsCqZquaNPdPn6EtJQB8
 wG9yzwxaoWZKZrnFwD7X4a3tp2mCMrJo5nPa6gDu2Mvt193bz/Y3a4guuM9yTL9wCu1PR69iAXK
 nwAujwZUMd0DAUAC7uQ==
X-Proofpoint-ORIG-GUID: M8col-v6T9e8Yi14GBJ09E6gbiabZPCU
X-Proofpoint-GUID: M8col-v6T9e8Yi14GBJ09E6gbiabZPCU
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb8abb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZFe9A1L9f2-jg8me1oMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060182

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v4:
- Address review comment by adding missing SLAVE_PCIE_1 node
  and corresponding PCIe path.
- Link to v3: https://lore.kernel.org/r/20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com

Changes in v3:
- Fix alignment of macros in the binding header.
- Update binding header commit summary and description to mention
  Qualcomm SoC.
- Collected missing Reviewed-bys.
- Link to v2: https://lore.kernel.org/r/20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com

Changes in v2:
- Fix warning reported by dt_binding_check.
- Collected Acked-bys.
- Link to v1: https://lore.kernel.org/r/20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: interconnect: qcom: document the RPMh NoC for Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  131 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2028 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  165 ++
 5 files changed, 2335 insertions(+)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

