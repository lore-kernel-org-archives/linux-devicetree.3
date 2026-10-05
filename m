Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D1359A70
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182213; cv=none; b=FbZqTLG7cA8JWyZnmNEDlV9zS1DWBkgvF27i5LxEZqDNYwrpSoi4LglB9dsJY6Q9ksjwvkWEcnPUfBfT4d8WI1yHXHhQ8Bapv42PGsQrSOP4MnsAe4sHswnHtoQ1UzsBW3kENjJ1RGD/Tee48rvQP70GxIFHq3CGBl8qabXeuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182213; c=relaxed/simple;
	bh=jgiNldtjrq6+My8uOdCwiCVWC2Bi9PZ9E17T9SMDTZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HvCnVGJSfixWjQ8Hu63Hz5rhj3A5euM7U02tJlGmXHV2njUMFGYGPh36HrJnhRR94VuRf3oCLIJXpldIrg1qoEi5U3rPe52d7YUYuVK0r0ugwHHpzETctcU0Bwh4JJNXaUemNthmYQlgQ/6mXnXA7T1kuvDLFqEY2tHiTzKmfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6Q8Qeh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH+TY07H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6Q8Qeh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UH+TY07H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695102Zf3838363
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jge+QnRU55BG/zelwO3Kxp
	qdDU0dzzUZftNxrkgOB7A=; b=p6Q8Qeh61Q4VpLRvN9zr5ilIQ8dn4JJMrBh7LT
	PbV1Lpq5RN8ROrCxQSRmdA0MbA7atyBJZxPWo8Aho/R9STwNF6nF+yzfNfoFQaKW
	yvFCatRkfjpIgdLI9jKC/zljQ3xPO7eem4TDi6Xo1W72oCK6Z+8Ah6SZ7DKZFhlW
	OUddcWqq7LIf70uIbYZS77dbtriBWEc4gN1bkDrGDPKTE/Zk5DIcLBcPASXmrFPw
	Lp2xLfHEBcRK4BKXhmS7tb3fIjOaBwwedoVmjmqqtANUaDuPRgv2uGo+J1JrA13S
	DkqIimLJJEsTozNNQe30/Gdqi/K2MGKrrnVrA+eHesyEkvoA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mmpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:36:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510a481ae9so2712286eec.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182210; x=1791787010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jge+QnRU55BG/zelwO3KxpqdDU0dzzUZftNxrkgOB7A=;
        b=UH+TY07HWjkQ/3J1C870hisDiIdOCWty9Y0LrNluLSHMnYT5PtOlt7zsiQjuN+BKMx
         hC5f1l5BHTFTG1GHEgWWtI96GPs23CtAz+CQVNPrIX9LgiHHAonuCMPwY0ZxfrMlR64B
         TD4O24CDDovhNdoxj5TWL72oJYcbYmtxdMMp7kjzXBzIOYLiYvMmyW6ZyqEi3Kb0wyAO
         Z2vKw/9nrz9giofYHwMZb9q3YZiQ71bq5Gv+cG3bOuUUWwdTM8EMxMh4IinstGvbKGsK
         USlxOxeAEgRz41fdqFSRQH+820Nyj6qJhPdwW4gwYpl8a6vqGty1zEIjcxeuiyQD4FRp
         mqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182210; x=1791787010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jge+QnRU55BG/zelwO3KxpqdDU0dzzUZftNxrkgOB7A=;
        b=ecPOTKqzeVeb4yl7myX9i313cX2g7IzSyO69aTuSVJpxuEztFTTP/4YbBkTfp3N1h9
         kD0ah2MLFZt2h+vf4NROSmvwNVVKDzuwZNOrAFYFIwgCa3AQ6hXAl4M9XOB8lOT5CZtM
         B8m4uY1QwOg6ek88OB2PlzyJ/px4dSuqS/RfWld17IcngSkTqg3h4FzgYBbvC7cI1C6u
         Jpdn0XlsqlzovIo+00L/Gd6lYE8OIBnO1SvNrH3jiJdv5rf+awstp/SOm4C7xBlDrM5G
         NsJxbSuyDUXAKTjFd6khIOtaJxogot2adZZNY+OGNhLX3yW+M+sXoh45odOT2iHJO0LX
         nwcw==
X-Forwarded-Encrypted: i=1; AKwUvByak7nmbhdAFD+6Bsb4qfI0xorZy4NLsfnITARDMOKs/aYFTXx6pMt2oBu5Z9+OirZnEhRAi+oP8bw/@vger.kernel.org
X-Gm-Message-State: AFuF++mofuCWc0Kb33YM96gRIjVnyCisTfzN/LzZhGSoFLq/lz9hR1o/
	ivx3NV3q/moyQ2CfPXHGxoZUZURN3Q+6EiegoqROK9EHhxoYW+V063JBsguzsZHZXVmDPCknl9k
	L2mp97WEFOtTuJi6xTc7oHbWb+CaXYiK/sojNK4fpi3lOoNaMz6wTlejgWWnt9fEP
X-Gm-Gg: AYBFou3Roe/Pib9PRUZw3c4017xc5TLyU2/YdpByYtPfqv6yHPBYX35xr7dPTnxwElL
	dkS7WdsNYP7p7JVEhraTreQLiUQlyb1C7nbEolGD2/0menoHW3cIoFFSgXGhZrxRjH9WyNrRbXA
	pw+jXpSJ3Tv38RQwCPuzWBkcwOhhBlKQO01gDAxkpzWibqGNHf0HG/zJKuuH17CXl77b1SjoOg1
	tLLiUNRllzNIu0GhAjW85kuwkM6wPyHDI2Ifo30YxuIN1/dFdxn/wOoQHA3Xut2FROMC+00LQWi
	fcqZsI4XbRSqM5ySv+6q2Z0nayBO/E3IbKd3dNtuk8cM8JeVx/BXhPbQgGbGXgBVCo57UsY/qgf
	nfZjJXkq0cR1SqB8vFtikUb9UhKSXZ5Y8t3JA7Kgsss/zYxMiQ+EUEzad1wxTyply18eAqncjzK
	XSZ7dk9pftKsVlYla6BDobkpUUOfi/
X-Received: by 2002:a05:693c:41d7:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34f21865577mr11543809eec.32.1791182210148;
        Sun, 04 Oct 2026 23:36:50 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34f21865577mr11543766eec.32.1791182209534;
        Sun, 04 Oct 2026 23:36:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:36:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add support for USB phys in IPQ9650
Date: Mon, 05 Oct 2026 12:06:25 +0530
Message-Id: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpFw2oC/3WOQQ6CMBBFr0K6tmY6RQRX3sO4aMsgTRS0RQIx3
 N1SNLrQzSR/Mu/9eTBPzpJnu+TBHPXW27YJIV0lzNSqORG3ZcgMATPIEfi1HnmWpVRuyAAWyML
 l1VFlh2g5HJfs6HYPsm5ZMq08cdNeLrbbJQ0NHZ+FAgDZDNTWd60b4xe9iMSrMI2FveDAcbMts
 1xJFKD3rffr212dZ+c6jKjp8YMWIBYUA2pMIUuspBa6+oPKL/TdKgMKeU5bTWAqpX6g0zQ9AdB
 jdfpEAQAA
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: pD81kuLaQW_LciLxTFX-zcIZlUS5cWH5
X-Proofpoint-GUID: pD81kuLaQW_LciLxTFX-zcIZlUS5cWH5
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac34582 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX9QDUFLgjmxw/
 rr13X3615mqquuaWyOgqVtrAzkPDlE7itZBld0+141vydhoF5zMB0X7TtNu03e6DXGjKYStL2Ij
 kLoYiKOtrsefLn6bQAPIdTkcHkBVnmY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX6ik98/i/CnMl
 RN8B9C7Cnav1ujtY/gpeuBL3zx4No61BkWRZWnwcuYi+geNgY/zEcgIALLzdyFLSkUyr1WHJgLM
 R7MH2VILSUU1eyKnbHku+y1XewTvKf0/tN7kKP5EWPtZT4aFGdJ2bg0zB+32hBrVy9nTkmUTu0j
 wZnzIGof4GnHTVptsqKAl+EAkdbSJPXB7px4H3Op4JVQyO3NbWfYqtBky9CF0KD9GvTByD/GUif
 C3Rl5E/WFJq4htfJU/x6JQN3mQjDk34CU3DKuNUkI7+odeARb5ik1SED2upSmgJAoRa3mTcsZBv
 eTU+YzQzsr2WFGnGCVmVg7ifNIT5aMxZhTqlsPlbeIhBECpSIjJZHZykGPl9lMDPvI+VQScrJvz
 CD2iZLgkfjcnI3cozTje5CnxHcO0FO0SDcP40XrObleYql+jyDs2zVnz06TWD5dy8fVbErfVbto
 C5Yr37s8ETzUFSeOxCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 188 +++++++++++++++------
 4 files changed, 263 insertions(+), 47 deletions(-)
---
base-commit: d64fba75362e3459e48b74f0484f82fc1b805d8c
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

