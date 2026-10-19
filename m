Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413B4F30F6
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417273; cv=none; b=KsYkeiZJtiIB3vmXwl7OZ4l7MCpnpsEIBlDF21f0Ud0HMjxVVfyb+pRRLSA/JGtq9uAsSA80wW3JmBK4VL1T7E+3dj/uNMzgnQcCclObED3nK0l2vvRfTLfnifjLJ+GxLSgxLr3JlmxYMwjJGNfc+BHHmjgXPkqgQgXHJ3zJopw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417273; c=relaxed/simple;
	bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cEz+fOdo8LHdtw44YRa6ky/g7dBH/ivvMkb7FEcbqBskpczl0ZSIn81pAeeQO+TI1DfrA3Uu2kER4rcaSYWKgODWPf8Nb2+QbRf+kplflxu/Lc5bNYdDZI33SHIqocbOKSRU9N0rlZ7PNlov+mWfr6ElmH/O4nD+id+v/MTSWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz9ywKlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdSZEukm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz9ywKlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdSZEukm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCsbAs2483717
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JIsIH+g+At8ckqxE6xPOTK
	qkjwbD/YQT1Oj9C9sZJVM=; b=oz9ywKlox3/Hy3jO+MSH+1cj3CijwlwykxXYd4
	GZvC2emjfUt5WBFb7WEAYtBl9wFSvGBIU8zjO0NhsWmtd6WK2o1RtWwl1Uoh82Xo
	b4zoV2va99Z6+d5vER3FLuQgnV3Tp40gDhEJ3B0KP5+cWoeHmAfdOrgn532vUdPT
	LZU6uzljKM0XD6vSNHffqfOSD0jGcq3iwH4tllUdqfVe8eGNboCjhs0pXzz0zR40
	/98TvsPQ3E1TGM1ZgcoOiEHS81ovLqafbr4Qx8gC1N2juRHrqur7ZmOqsNvQxyaI
	3T4IXyd5MUKDK425E5EC7rD/KrzH5QINhMMnla9xH9Om7sdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfg69q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so439867685a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417271; x=1793022071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=XdSZEukmrPJT0agyfdXt5+nlZKqGDjSsnM51GsP4lPfUpb23XMSc3D+U5aQqvhGW6E
         N3K1aspIHC4KtpJwWYHnweFH4pGz2nqEJk/dbYspFlz3cp2dsgvu+lqemc+xQ22zVuXg
         q9oztJikReOgcyTKCcJb0EYJjuWtz/QAR76Nxmm4hnu9Albi8E08N4gF8z742lVnkyfr
         s2vhjp49Itmh5htX2nzXT9LrslPXUuvr25aDIbipHCzKgkEGvHRlHjrjjdM7m743rpz/
         DYXemCv6EC2skqRVZaWoux7kAZIAZDvHZlAqn5jdS5bB16u/XXS2OriETndWOc7NBdox
         HJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417271; x=1793022071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=UpsJgJV6zAdCqpMmVg3v/IrEeTIf5OPLDPPO78IQc77bq9fVIBK8qTWGFQhAPwaU9I
         +rFia8rnVlQagx80sgcZMgJ3ZpuKWnx5PRqveS/NNlfRd4GFsX9Sg/ZZ6nHuNz65oLiU
         Gq/g8zZ1sd6LpgjsEJS24Z547s61KTxXGkbkrPY8zOHCM720IrZ6+y6xCkq3uUHax1f/
         HZiQAB6juqfh05OFDDtznf1VSIHxMn1aIpN6V7qcw6bBcIgUfvjw7pbn/14NUXx12U0y
         1KsP7loiamaeKX8qCRG6kz3ySF65OLD8dV6AL+OfVd2/oeCKeiWHdiSjUAE6Xcy3G0fT
         s6nA==
X-Forwarded-Encrypted: i=1; AKwUvBxQHp08+Pbg3UluqIbXGqplnOVJnDT6KgVvMlIxqMjl+co5WLDFpQDkiWzcJcTCT/mNolFwdsN9aS+e@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Jf9kRqVp6n0WsU+d1GllcUlNfLBArqppzYHnnyMNr7QI29Fl
	iUByck009rQDB/8RpcQMknerKMbjMyD0YvQ0vRfci41wLzF931orHqQdWx7BXDR6TNeDfdLqZtk
	n9rOLU/Yy1lqj3zQK8TxX2Z97DQYydHYBKZ086z+rAR30yod0mCc4libMO17oSP/n
X-Gm-Gg: AYBFou33A5pzQE1F1rZfwoBQfSbtIxJRyjcNbPaTQnOyOZH5fA77XhpchlzJe7xOQHF
	mG75It5QX+bPNSsnTMEebesOI2AMUOu21/K+5Oq0PdTdfpET2w72ed5nimHjxObr0FDG3aS5F5M
	hitr9HB/GlAwK/yNAAlyZtHBFvsp4i1U47lkWZTrYo9AKlwMH3Bg0cotLQit+UAjsFq833qBnhn
	PZw5JxYzCavazCAWqpM/X7eT/wzOCxzh7oftX6NbAqIdlMawnCzGLL7eoES9z64cu3buG+CPk6m
	r5I3NJGAje5Z/lIw32dStjIBAn+ARXexVf1vHk2crRaN1qvwCV+S3uJtNaf7asIvUji8e/sLEIo
	b54nYq2KCFXJhzwGOrYZTJG8QfFwwQ2MrI0a0ni31Rz0bIEBSRuUaCkHrHkiG945lCUTDrbycAb
	AqEfvelXmrgnkB
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310689285a.74.1792417270550;
        Mon, 19 Oct 2026 06:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310682585a.74.1792417269933;
        Mon, 19 Oct 2026 06:41:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] clk: qcom: several fixes for stability on MSM8996/98
 platforms
Date: Mon, 19 Oct 2026 16:40:59 +0300
Message-Id: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsd1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3dziXAtLSwvdtMwK3eSc/OTsYl0zY1NTA1OLpOTEJAMloMaColS
 gLNjQ6FgIv7g0KSs1uQRkklJtLQAQUlMOdgAAAA==
X-Change-ID: 20261019-msm8998-fix-clocks-6355058bcab0
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3tJd/TqO3nKhLXa4q4xYfMfvjF8OD+hnJ2u
 ndYqcs12BCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd7QAKCRCLPIo+Aiko
 1YEUCACyZyC09kHN7FKDl6bZ1ufmSOc5N8Z8KKObSXnIP66Z0Sj3bUq6li6L9U+1l8KfM/WvLZ9
 zzrY5UMnwR1ftVZRJl5UBmMeXddc1pWNxhNibhNRfSHvwR7kzkvDcfITaNUYXWFM7UFhu0dQpNU
 iNcu/79sKraZVkrqvqHeaFb9/lUeoxlqy3H2767JSor+iYQ1FoJa6/4C1KxpLiZt7GM/wf8Tt0w
 zFmadcBj3MhXTQ56qTMmLMzl5TCTSzuEI7tjh/h/eIyuTaBjcxvcSWtiPQFG/tbJMpe+EDIcR1K
 k/MRzxGTYsHCKK5NA+PSEUZ9A4/hV+FLrrB5xx44T2FioLOp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oqqZEnCHU2KVP8ljRYkz36_PshdxZK18
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad61df7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGoP7NTG_pKSZ3bbB-YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX9KUMjCn6dc9Y
 VDiJbJdrsVF93VLYmdCVHaKAEhXHvcNkQmXYLLtiTtKYfxuMmDb9HGBB10l0Fimb4dTXBcoyo3X
 ryoTE7gGuXLFiFuxRVPXPvtTZ1epZDMljsozXPub87XprFX4MszroDqBo95t1n20V5ylA938H7K
 gsvoiJaBfoDlY6h20pm7C1dPISxip3MHrmj5k3HjuGHSiF36pdnkvSFzEJMIGWNGBDwaSVKN51t
 u9QuuKYssELqMTy/naNyKdPFuimVtEDjhmeDikFDY8Fh6GErpaPZW1lhiiiqYGm1bckdWf7Vr3T
 noKSkOaQBcCABhQimMjwo/M7uTuf8gihh3oMs1JpWo+AGBbzQBbHOzQHqbPOW2PvllaGiSuPCH8
 nq3OR9aCQ81FUJ113YGy5gaSuEBK+64Kmfe3Ak6CJqhF6OoKXiLuuAfdDd2qkXXvblA+AV4u1dq
 6riRs2tklzFzc1vqjBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX1WWaFo6RHPyy
 WeSJLXqIUWtGC0KSKCnDbR8uH4RU8Ygw0d56KE9Dkl29Ix6jnvloRIooomD0CKeDBIcZQkEMD6L
 XxzlQcnSxRZSWlfLJxeSiD0bsXsgIt8=
X-Proofpoint-ORIG-GUID: oqqZEnCHU2KVP8ljRYkz36_PshdxZK18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

The MSM8996/MSM8998/SDM630/SDM660 platforms face several issues with
stability (e.g. setting running at the halved frequency after certain
frequency switches, resetting if run without clk_ignore_unused, failing
to scale GPU clock, etc.). In preparation for scaling core, cluster, CBF
and GPU voltages, fix these issues affecting platform stability.

Compared to other patches in the series the patches for MSM8996-Pro were
lightly tested, as a part of the larger series and only remotely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      clk: qcom: gcc-msm8998: leave the GPU BIMC source and SNOC DVM clocks on
      clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
      clk: qcom: gpucc-msm8998: set the droop detector bit in the right register
      clk: qcom: clk-rcg2: forward the gfx3d rate request to the parent
      clk: qcom: cpu-8996: move off the ACD leg while the PLL speeds up
      clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk always enabled
      clk: qcom: cbf-msm8996: program the MSM8996 Pro post-divider
      dt-bindings: clock: qcom,msm8996-apcc: add the MSM8996 Pro compatible
      clk: qcom: cpu-8996: program the MSM8996 Pro droop code register
      arm64: dts: qcom: msm8996pro: use the MSM8996 Pro CPU clock compatible

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |  4 ++
 drivers/clk/qcom/clk-cbf-8996.c                    | 10 ++--
 drivers/clk/qcom/clk-cpu-8996.c                    | 36 ++++++++---
 drivers/clk/qcom/clk-rcg2.c                        | 21 +++----
 drivers/clk/qcom/gcc-msm8998.c                     | 69 ++++------------------
 drivers/clk/qcom/gpucc-msm8998.c                   |  2 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |  2 +-
 8 files changed, 65 insertions(+), 86 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-msm8998-fix-clocks-6355058bcab0

Best regards,
--  
With best wishes
Dmitry

