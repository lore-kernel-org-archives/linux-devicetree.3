Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537DA51FCC3
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547860; cv=none; b=jg4KkTLleXdVWjhtLdPeEh1tsZf/GQ5qQBBQdREhN8scR+p1EYkBeDzHB6BanKZXH8IkqqzgIL/+TgWOMo2aff+mS+Zs7YznQX9/UUFf7ZekZ0V+Pe75y8hrfVxB1WW+RzrfxT2yX+YhZIDOusCG6gidgmbgOF4hjxGBm0aglDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547860; c=relaxed/simple;
	bh=Vq/wZUjdUlnTEU0Qg8+Qz6QiPaIIx1/+oxRf0UA62M0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TkHRsabSkqHn4Qr4bGMSOb0wPfIsNNQzve9zPC5/7VdB0Q2l4WAMCoB2FHVW4Y7i8Accd4LZ8S85yisDB2+fkufukD5k8rEi+HRp2QUjuT5eLtHLS956W1kTFoiUVaberWMd3lcw8+KJaYJhIicxDnZ5zhsCsXhDGsHW7n0kxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXTQkw4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFB2c0Db; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXTQkw4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFB2c0Db"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HIAcF208815
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 18:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2itY/GTJjZwz0D43mAqqG2
	w63oKoNkuiN7PiSrRJ2vw=; b=VXTQkw4+s0Hj4CRl6etzx27xTkHhF2N5MShgqC
	kD2Se/OcNaPLOWDfODY9PaZyArN+7HR+FosvPKMfZz/BmtrV7NUQuuFza4JegGrU
	HfiydMMwbIl1a0wGh7hRHJdr6PPg9BuE1BR1huU4pn4PKd8Wo6UCficHcEluwqxP
	P+lXFI7nlZoojZ+aOlN+iRVu6axq/Fq+7rP8mC96n6gmOih9dOBEddoj0cykMvT4
	g4N+EbVPlAUGOssHZGdLxDmJm/yDG9cG96o0rlcIYqHqPw/bHP3vsCg+yaR6GxW8
	J0Gk6NqFVM1RprOug8t9I8LBc9pEzDi4uD7praP0taKYJRMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp7848fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 18:50:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2620346a91.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547856; x=1789152656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2itY/GTJjZwz0D43mAqqG2w63oKoNkuiN7PiSrRJ2vw=;
        b=gFB2c0DbSUWw+gD+PmwKLHvPsuxsm2wfIOJ7eHG4lamS0PNT7EelWnpk5Hs+mKFeQo
         xd5cwcujQ66t1SoLtgHoMxrHqEt34xgz0go24V9i6HtYPoU1coxOgMZxjevu0CLgxVVs
         21FQ1ZPOpmCpZtdHlQ/kibCPQFwZz1JFbG2rkq44LGW9p/4yUR71jIWX+udSRbBoUVtn
         dOF8jP4oH10leEVAS1S0yhMT5sOxgVLpyPAHqKk6WqvmtugKzL9NyHSygXOHXw1QhHWt
         fVvyDzP1wOOKAkS7K06yQlri2GVxx/EGG2OMWqzlF1ryJt7U66A/hoRJaycxULjUZDYF
         lFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547856; x=1789152656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2itY/GTJjZwz0D43mAqqG2w63oKoNkuiN7PiSrRJ2vw=;
        b=aEWReY+swwFOB5L/knRE2FLQg2qCiGSsusukBFMjqiJslOQm8EfJJLtKmD/vvoHv33
         kl7BGdv9nNbF80fPmKUEl1mbXRY+Z5NdiAySK+fd2aksGnPCrdettSFg0Cbc9fLguBTL
         jrq5VHMWl75/OyTVrzbx1b3/GgOUzeuIb04Dho4c//Gjwok9kqwcYPWn2ALSV91Z/vqn
         H4L5mgt3cszC26Z8il0xyt/cYtkA03nelqpf3dZ8Phn2VMXT04rigcS5EY2Bh/dBBcCD
         GgqMAWR1cIAcbduB2Un7jl34xSl8eIISF22edM3pz0yqiLFAGpa9OTjZXbpk2n7zk8B7
         8DEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy180rq19LdpDTbtzRBpIgKeHLHD6TpVN8S7+OghalF7zrb0k+zPHoNzx7Ymzp1XPPEAlAKhwrAo2f6@vger.kernel.org
X-Gm-Message-State: AFuF++kWvZ0ISDEOVyKdVbk2IM9r5PunAAHS6aBL/iyOO//Xih7HO1+U
	lZpIhFIReUR8xiNRhi8b97A1ptCTHtZGyeURMR/BnIvz/9pX5D6XuF67QklQHzKxq1CrKRcYnLF
	cYDUVsEWxB/jVeSEY1h4D3OGseelzqq1E8q5SXSf9HpsslP2J1wwkGZE6XkXAI79d
X-Gm-Gg: AYBFou1Yj+HgAdRTx/8AfYDuaVbgZtEtz2GIPeSrWHqa+K3TbcmvIRMUIt6ijeDDpz/
	pCNCxJQB3ticeXMTojKrjaeUyBoRfs6ZNhSaydaTNiY2TA+a0O5bY+Te6mQsHZxeoSQpZfmwNa4
	XSSMvbSRLDU3YKHPioHLt8lkEOdiwM7JlTpvy66ytv6FfdTkN5spadUBdDqo/na2apTLe7+eGPu
	U6B87ru48zuusjvDqayUDPx8SWCSKZjxqwDftdMe0Zrze5fqnLTKOYVWRPnZZMkajZDtfckY+tz
	2KLBsr8/MOEoGK414vH7R0r9MpXYMwaOaWmZz5jmt0j2QlEgS1F2isvd7Bm+tC81oabvpi9uyPD
	7x1143KpMGAcJCilIKaWuDeeMvRsjwnQ=
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr12469947a91.16.1788547856172;
        Fri, 04 Sep 2026 11:50:56 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr12469881a91.16.1788547855653;
        Fri, 04 Sep 2026 11:50:55 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:50:55 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: glymur: Add rpmh LNBB clks support and
 update UFS clk ops
Date: Sat, 05 Sep 2026 00:20:41 +0530
Message-Id: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAITm2oC/yWMSQqAMAwAvyI5G6ilLehXxIPUVIMrDYoi/t2ix
 4GZuUEoMglU2Q2RDhZelwRFnoEf2qUn5C4xaKWdKpXBfrrmPeIeBP004i8JWqudIVs6ci2keIs
 U+PzGdfM8L1yz6EpoAAAA
X-Change-ID: 20260904-glymur-ufs-clk-changes-55264e596e6a
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXy3EI3vnYfhbz
 hbh+vBmPUxAUY0GdFYgeiM+X0tHCwBMpGK0RKOtILhv+jq6dTDN9Qdj7gBUg9CxcMIw8wwMZMBg
 DhH0SVu/qdeVwfJEpWy7QXStMkxhGkk=
X-Proofpoint-ORIG-GUID: xyN81EY03-xDS3DEbl1bBXXrXp7ymcxb
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9b1311 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aGb7rr2t1h3agrlECr4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xyN81EY03-xDS3DEbl1bBXXrXp7ymcxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX/hVE8ZpcKzNo
 LBJxcsUMBBIfZDiW/lTgCmmdLgSBKx7Dj5pus+xOkGujIsVdqyV1PqyDU5LEzohy+dblI1S2pgU
 2aIk1mOQDqJpMU0a3AsmNwrtJrIafw95TpGElOobYWrRO/MTbU7+WZbxhOMYBcShngtP2dpzyGh
 ot4oSVDWyzDG2Vmi0WXIo0mwqoT1Oq+uWzmUqC2KygkmuFQHW24N0K97bL3dv4vJg2XAT2NZp8j
 +NeBEts7I03GRZpqp6zZUmqp4rLJ4hdGC/ip3cCdHiGRxtoMmgjLG76SuB7FxXObyldRxSEVPzC
 Bl0bCJCCKUnDjiiHuxUKa602+4i+ACHSDtWAYQtsufEoE5SCe8mA4B1SVkeP09EMAWD/S7sLN1l
 7A3b06NkBaA4h7kNypX9PLQyNS/0ORfc6zW3HnIZB/MR6d4V/J1lKqH4ma9AAc5yTKVU/++oF9k
 dwejiMUTXpqg4ZKjMlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

This series adds support for rpmh LNBB clocks, define TCSR_UFS_CLKREF_EN
and update the clocks ops of UFS muxes and RCGs on Qualcomm Glymur
platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN definition
      clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes
      clk: qcom: gcc-glymur: use shared ops for GCC UFS RCGs

 drivers/clk/qcom/clk-rpmh.c                  |  5 ++
 drivers/clk/qcom/gcc-glymur.c                | 77 ++++++++--------------------
 include/dt-bindings/clock/qcom,glymur-tcsr.h |  1 +
 3 files changed, 28 insertions(+), 55 deletions(-)
---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

