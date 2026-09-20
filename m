Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D23DD536
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896006; cv=none; b=pN8wwH/ZbhfKA/ZZE/t+laDk63sTkZLv01XVIb4mPh5BAQP+zJ6xAyGxIGVoE7rtLY6qyxGY2a9yuiaxpQ7M3tNewDyecc9a/lB0r6jKKhv7HYbsmLc+pnzcmATfCXn4iEmr2qXgNbww0dop2mMAsl6Ci9+La+M0H69IlGW1JnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896006; c=relaxed/simple;
	bh=TQYDLvaC60nSO/5kc+ZxMvsQAd1VH7NGzqKaIB9PbXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3crzXJo1Sj72+Xvw64DV4C756NS8pvlcYhIlVPukthEFKBII1AgpxmYzf2EEADlf2rzCLM/WSNbv3dgexJGUR7/iwp4ZmDIbcFQ91/EaXdNgyIhB9ps53Du4XB+59XQUV42J6RSon99CCbSd8OIs5MrmiICA+WyL20RZwywsvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNopTdwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auqA2RD6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNopTdwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auqA2RD6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8WCog2172578
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M0TpFX4x8EpDL4Y+43bF60ZhBeLF+S9qJuT
	dULSmfgE=; b=nNopTdwXgasj8VVAFzR3CvNf0GV/EpIVD6cIYeXQ7sXnsVBmvf/
	yQis5gO4aWB8Gcu/Qwp31bqXTvhFV39Fq8E0kzwgXlyCKEq9iBQJZoI8g92Hes25
	bbmSEK8bAeKQLsjS66XAhlhgV+lZj2pLLr9ZnjquV1PvQkjbBBYH7ooySsntyuKe
	vk4G3soqXZl2dNq73SuwAL42RlZ3UDG4URthdLCzXNPGOt1Ib5ZwxyokKGEtEej0
	G6bDDXZlOtqDdaDgqxI/IR8RoA+xElsvnmD6Zp6J1WzbpFnUvSC4ZPuYDTXo3lSf
	yTzQz5cusIurcDIU2bp5nzcg/hkRh/aUN3g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfujneb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a59faf521so3579347b3a.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896000; x=1790500800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0TpFX4x8EpDL4Y+43bF60ZhBeLF+S9qJuTdULSmfgE=;
        b=auqA2RD6D4HuInyCEmpVAgapc5eChinUvYOHAkmWiJScQtxgcXTcgWkFGYNeW9k1Pg
         jW0bpa/CYUtfnKd7P6RUQQco66zTifF+iKsmgB4tgpf0LsNyEV1b2KKhu9zRNp5l2Hia
         jxIZb0qhmYkdFJ4p4B76B/OwH1cyBSVt8q30PbsVv0mJGy4yjVm2CfCxrhFUeaHPzPev
         moCRxVfPnnQytvsZgfL/vHZmh1l4+wJCFBdUpBLGgbudP0nymUip56bRf+t3rPVel2U9
         D7iqe1d5spckI/NN0aBeiMOllT6un1RDwDzcrKJlm2cReq5YTyPPxQkMidL3eL2RP6Rk
         IPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896000; x=1790500800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0TpFX4x8EpDL4Y+43bF60ZhBeLF+S9qJuTdULSmfgE=;
        b=lARixr4f8DqEm9i1+b1X9e261FSjhpAFMG5ZN3OtrqltIiHynXZ+p4iuQfbl9mU/gl
         NrI7AUtFldSaMylaEf6AlfXcpY1knrXB65qsNaluiQoYheisWJQsEJPBvgHkZ8sGTwyg
         Klz3SvQvK6IujGQMCIc3gesVn49/1++QlJ4O4JhXDfK++MqINpD3XKlqjzjMBCwEi3Gt
         CDOOyiaAWWyIMNNZ+ilmg+RVI7xIKBcjbNf2UCUTYA2Id4ZQon9s/3IOTvZ8t2HAzZyN
         97qo5O0T+durk/u9T7O0u3yG93j85ex4fuRQzsCz0OdxwLRJFTZE15cXvqWn1VYhV0aM
         U/Hw==
X-Forwarded-Encrypted: i=1; AKwUvBzbi+y8aZVkjFD0c6LGGJNZIMX0AXFeNnYiL2K9e4nPf0AfsEr5uyUlj1LwAVOQUByVUgtt5Qj/RSyl@vger.kernel.org
X-Gm-Message-State: AFuF++kPU9q+zDaEJ8yUpnmurRSbpGGADRgpztl8lT24z4khDiVdNJC+
	asgAXpIqwuTc0MzcmenAIk1qAlmmw1LXaSqv+ywdT1JbsdYrOzqd67E8nIClNOr0lb0W+t8HbOW
	y15n6n7jSESuE1RXsvel8k1a8vpYzp05z+s58zu0uxmCgEPa4EzML3Xv41EHw8rCF
X-Gm-Gg: AYBFou2ewhSJtVXdkgxb5qQVrpLoZlykl68rvd5cq4EqhclfA6GKSxTeIKJapKF5+XB
	drSxJ/9g+CRIJrAJ38+Ei14g47RkhsbzNHU8knRqhQivtLgOaIN5b9GEI1c5w2bZVTMd0FcmnfB
	2zACl7zPYA60qGWLbfIAcbuvrSCOnhJx1eNDgWPuOf4misxuNtW6nely9jXgsBHceTsjuID0gzx
	t28lPhur6US9ftxnaUWjTC4XZoz9o5AfXppYwAXliuzbYqp7pz5+OhuGi+jL5ucI4BX+te91BjL
	dVcn31cRptYTP6zq7dnj/InDqCL2+m39CRaqj9mQT0SkzD+ZXvG1C4J+v4x6wlHEJ9swr8QtA9A
	rP59eP8KbufC70DLlnvht23OeazEEpXjQ5Vop6MDo/g4GU3c5bSw2Xaareg9H
X-Received: by 2002:a05:6a21:3a42:b0:3dd:a196:906f with SMTP id adf61e73a8af0-3dda196a68cmr5966982637.57.1789896000542;
        Sun, 20 Sep 2026 02:20:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a42:b0:3dd:a196:906f with SMTP id adf61e73a8af0-3dda196a68cmr5966959637.57.1789896000162;
        Sun, 20 Sep 2026 02:20:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:19:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: nord: Add display support
Date: Sun, 20 Sep 2026 17:19:27 +0800
Message-ID: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfXwtEpPYRUcDWC
 ScbYcI7jeHmrQ1xcW6fVPAeguemVR31fSrxU0MRxAlBzKKVBkGPuoEITM75sFIa3fumkQlGNhBR
 bA39G6pvAxCqgkgvKwDIofrP18YVSbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX1VEVvbsdGuoP
 QZsXW8aNRth71i4CTGkymocF+tf7/pn8lnxo4JO93joJ8n5ufkg6IJn2UvNJ51V1cP0l4G1qbwJ
 kjqomxNQDzjThXbo4dbh9a5rykfysLbm4eKXHlYH5Q6VyE7jUwiiHUbNZN0IyGQzVodn2sjm67T
 O/JWYJGniarbK1rhnaLORIBDfhhaS3czpWIQA7E/etz5+WlciIq0a2iBVYWxssTqakbCFRXGdHx
 hKP+C/CzIx/m3+a6KJZGv4dXcOJtCr+ltXdFwi/TRcP+upDjooN4um/qlkU52gLd5BNPPHQDgYx
 yd/HvTPQgiU1E2LParWaOdzD4n/dwBjA/auEqUgwPTi16e6PFUCXzYuOFFinQPRYkjrhwNeOJdn
 biBi8zlXN6xBvQr1oZHyL76Niz1twBIkiMSzQ2A1JMZnQJXYADab2l4qYE+QamrkzFjPq4CXfhQ
 QJ+Mot9hunWop5Zd/ww==
X-Proofpoint-ORIG-GUID: mXpfJlfnuQYX5i4UAScYM8TJt90RpFIl
X-Proofpoint-GUID: mXpfJlfnuQYX5i4UAScYM8TJt90RpFIl
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aafa541 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ma267DgbQhYX1yKuqE4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200134

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- Display and PHY: https://lore.kernel.org/all/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com/
- Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
- Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rename label mdss to mdss0
- Drop clock controller DTS change from the series

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 523 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 +++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 266 +++++++++
 4 files changed, 971 insertions(+), 8 deletions(-)

-- 
2.43.0

