Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB3568552
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191311; cv=none; b=C0I1VaeO7Cbl27oRU3lqhS+hqh8WKMxg5HeiTU8dGEL7hW1JXu2s/PfDuMXRzF1ovldBjuB2yTnLEvoCTkm+bNECxIMvciJckjPQxcCi5NQRDBcmqB8zhYqeIDW3oyhWBkFRh8EIWpL/pqCQR3j4iChDUYAp2kaoeNnVBOMZ7oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191311; c=relaxed/simple;
	bh=SxXdQ9x4xrXPna5Lh1tiLIazYVu3Dy/LlggDG/smh7c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aLDMz1GS/eqFbpTeZhUuGUu6hbSYK/q4qbql7JsGiWaDwFiq24zVD+irkLNVhrrUxJYB2JCvp/CQ0N/W28l2Uo9fVfFpS5Li5D5E/+EJQj39DJbfpAMtpC51flFstst3bj1IskJFANgmDgVyM+w6KM2jX+dfLzL7WWpGbW/yeJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSu4XVVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpYedIiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSu4XVVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpYedIiy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTaon740286
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x0wpg8eQ3E+q8HUKpU4pQ4
	nMAtVqxGLo66qa1sOrIrU=; b=QSu4XVVv8pp2hbn/yjP2RMLOp0CUnOWtoS62yZ
	7RJVjmubs3YeU5+Cb0UZCc9wKv5lNP+o3k0PMyI5CsCNlWDNTTy8WfUQNP4+8oKk
	3CRPuUJxPEj1nZxzGLideiCiOAmb9/oWUrb1/AGyTKMLcq6ltO6h7Tg6AVxM3Fpa
	zNzbHpeDZo0nozMPLw5BP7q7yPGW/PE6qARrMXAS7otaBDLTK55KemGGnyKuH20x
	0oX1yF9cBjz52p2h+qeDFgS4YNBZCit6A2JJHS5e1GqYsp2c5IBnIoTXE8F0WN/p
	QguaOjW9MnB4kcGHcR0pXD3y7y6jAN8/Ar08jKvLny5bDKzA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjshn3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:21:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33310847fcaso2226519eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191303; x=1790796103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x0wpg8eQ3E+q8HUKpU4pQ4nMAtVqxGLo66qa1sOrIrU=;
        b=OpYedIiy4DlRDvi6GTIt2A708yZ924eBQyukTfudIvfQaRHrUU15pUKPbn+T+2uhmx
         jwlgarbHdO52rwaj0fhSMn3JdXYz71s1Ec9+Ds/ZHkxATNn4L5K8ucoPdN7s0MN22EdL
         1kFngNMu3HAgFOKFP7iOyfLKlAXYag0cI7yT3OnJv2BW0NkGaUeEaajotc+1XXiwinzK
         /24eqhWClF7RRPY1ra3pRaKeVAwekxGEpzPkAqEUanoRN0Rlb0xFu+W+3/4EyOTRgm0N
         3W6U9hypGCcDqtaaOQRf/HqsIi3D9WambGNqooEpYlQLlY7Mum+33gdUWTjp/0/KZdbE
         QcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191303; x=1790796103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0wpg8eQ3E+q8HUKpU4pQ4nMAtVqxGLo66qa1sOrIrU=;
        b=VnyrEAml44slKiq55HIKQHUEJ4Q7bp6yTlOo0bCA8DOoa8zLSoEEPK1WCHIm3x9HvG
         WPt5dXKZFj1a0xpMebNG8KP8PTqzuLAxEZoNaOosux+39rGDh0IfbO/iEJ+PjeIZ5D0m
         arbowl76aHTpDBT1JZAlDWJlvWn1d+oJEyIxM7+sxQmisT4nYClZvBlfjQsUKsXeOk8M
         iVjprFFtMDOfR3tgJibfz5Fr0uepMzAvYw6eQGpHsc6vSgHCWtrAJsZ4l3JZL3We+H1g
         GV+4Qa4vmoVWXIxoPnyOGU4DoErd7FjXL3FSuwvEL2HmGYZ2qn+Q4VPdY0Yok3z7waA9
         HAtg==
X-Forwarded-Encrypted: i=1; AKwUvBxy6wPgXaxDvm0qp6TkAMiDKlEwi6aNwquhqUAqQzV4J9/HTVOyoDjtLRVrQ7hsx101oEYCmCrQpD9v@vger.kernel.org
X-Gm-Message-State: AFuF++nj4tJdu1nGPazAn+fwHdnzlptCMYAk7Q2CCVVR1m98WAHc+Rer
	V7z2cEz+jyMLJqtk5wvT5K32HRhHXRg5QS3sqIgeMuGVXmN9dJHOeAqqzjYmTuPulv69Px5bDWV
	FTSAuqJS8JPDIe//kLudydsfmTo6WTnm4AbwIFBMfjppv9wY91L70aSsFfnHeRrH/
X-Gm-Gg: AYBFou0zusamMRxx69GZaJe4gssXjcvlIbYOfqKoMuKwZMG40/5eFh2DUMPkp+fsbcn
	bSgEssGKenGs5hjFzkyUmGeefo57uqVs+YpurRTEqAa6VLL7IT/EEDJWQ34sblY3RhqMyCL5Pul
	rL5U4ZXg108tN9dWcdJeCBxsvuZZBaMDzJUCVAev8QA7ewcgt78QQSXxz9Z0pha2nKWiRRtA7UD
	9Kk2ob0gMaaMCkCTB7RwL2OJZQ2sHSAUq5hBvRz49TxzbzizllsPNC5zi8okx3fGEDOnG3hgdLe
	SM+xiV92VOM2tNx8xNbBtXIifKMDLhTUhtGfmMnEUZ14Mwvwl5fZZl8UwLHFs2KTBwdUw7SD5N1
	ws9j8ND/HnWHEpM5U9eOLOIraInCl32YPCw==
X-Received: by 2002:a05:693c:83da:20b0:33b:e9a7:d819 with SMTP id 5a478bee46e88-33fff15ba3amr137887eec.14.1790191302722;
        Wed, 23 Sep 2026 12:21:42 -0700 (PDT)
X-Received: by 2002:a05:693c:83da:20b0:33b:e9a7:d819 with SMTP id 5a478bee46e88-33fff15ba3amr137867eec.14.1790191302019;
        Wed, 23 Sep 2026 12:21:42 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm17609309eec.18.2026.09.23.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:21:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Add Nord DPRX clock controller support
Date: Thu, 24 Sep 2026 00:51:30 +0530
Message-Id: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALomtGoC/03M3wrCIBTH8VcZ5zqHOsnqau8RI8w/TWi6PCWL4
 btng6CbA58Dv+8KaJO3CKdmhWSzRx9DBd81oEcVbpZ4Uw2c8j090o6EmAxezJwWIqqNVFofBIM
 6mJN1ftli56F69PiM6b21M/t+fxn5n8mMUGKE5Mp1jrIr6yNi+3ipu47T1NYDQynlA01Ofo+rA
 AAA
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX0AxoZysXCarF
 ieeRRsrkf3YHewGJ6skgn0qmLXLrdpmVhAxhKFqCOmfIa/WfFmBpBiVAhUOYHeDgWpENqJQURmB
 TdC6ApijcCJUnIOIp4bDWfqQl+jqSxhdpJoF0WhOafd1GJ9eK5SN1zvOOGb+IoohwxwFWmRaecC
 IYTE5kqqmplE6hEFqojmPK4awXi+khK0rY9XJEy8oADS3Azkw8pNe0zK2weIZkQAnf6MZS5SILd
 BoWB3DEV9HKNfQgb4vgKjx0Pwdup+F/TSaiWKQDSGf0504cR0D21oKkoF5+ww61WXhnrQ001rLv
 Fpwhw01A/qbS1vkE6vXf+Wk4Dzahj7WqSo7LWu/lgg2W9BOZlK7l1mZ2IKWJd75g4WPt02eFWIF
 wdzpCrDs4HYk3COmhCD1gKcJ9GwCK12azihV2SXWQ894+f5jLo2koF6dvpfLqoMnsTG349R9M1U
 5IAM2hW2bAmEepO/CKQ==
X-Proofpoint-GUID: Q5bWelgE9k7BDgPXQW5fkACmpDNiXBpD
X-Proofpoint-ORIG-GUID: Q5bWelgE9k7BDgPXQW5fkACmpDNiXBpD
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab426c7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dhWb7Yg5Oiobcms0P14A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX7mzncpxGtIB4
 mj+u5GDOjac44wi7Pg/+A7EVg086cieeyNY3/ryW+uR1gx6CtKZsgdzA3tsWUDstuWSqf+uXSVa
 aVfVUBAA+iYdXHwZ7lsebRtPYvOhsXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The existing alpha-PLL core derives the ALPHA_VAL width
solely from the register-map layout and can only express 16 or 40 bits,
so the first patch adds an optional per-PLL alpha_width override that,
when set, feeds the recalc_rate/round_rate scaling and the Zonda
set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
lock to and report the correct rate.

The series is organised as follows:

  - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
  - Patch 2 - documents the Nord DPRX clock controller device tree
    bindings.
  - Patch 3 - adds the two DPRX clock controller drivers.

Changes in v2:
- Address review comments: remove unused definitions and includes, rewrap the
  alpha-width ternary, and clarify that DPRXCC provides clocks and resets.
- Add RB-by tag [Abel]
- Link to v1: https://lore.kernel.org/r/20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  68 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   8 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 434 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 433 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 981 insertions(+), 4 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

