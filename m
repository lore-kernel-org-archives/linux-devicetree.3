Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48754393DF1
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613636; cv=none; b=i4wWY9bk5+uCe9TQ1mIiysCq3RSL9jLgxidujGBiMu9NxT1TdX1OYhfguP9HCCLNpzsADI+0LqGRfnYFt+Kf3NHanlbAdlFrszopRDmDEwaJmsu52GOALDo93FqYdZVykIf4LHAvOG5b1/qihnS+hT8cPLE01R9zIOX6i2unrcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613636; c=relaxed/simple;
	bh=CpiJi1wFsZbfzyH+f0CtUiZ1fQugjFswPbwL9ZRyT5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j+g5WYq2GzNCQsAx3KtGhurNe4g2mG18+8Df5gCNWLh1kbBogyY0IguKG5WthfaBM/CodO8wj1eQE3nCpUjRVC/KTfbUVm3SM+/kC05QlmwOXSM2QGzxoYgmZBzssvtQAd4erc2ZUUzsxavlwqIuokPJtPE4t3SJD91USaRaMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1/nQgS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUwMcq12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1/nQgS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUwMcq12"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wvCn2846418
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kbnk1Dbp628OwAbcO4W3dN
	KPCATjO4PL3FJbktC7gOk=; b=I1/nQgS1fvGRIsowpfPHQcMaUVCmK5ljlvlrhw
	JyGw82eRuItR4/TsNd3Fg4UU/uwwu+2F+2B0mht4PBeMct8dwpAlpFJ8i7AelQx6
	RIMJ6e6XToVJUrE1UblSZuOgp4s20Bddkzn6YIcT10wBgqdcQKMCoPLZgTD2XI8/
	uMCXjaoW5XyqaPJWKkZAWxNzcZ6bpRXYB8q6AGzlb0M7kuBwVri8fDNTQONsBTt2
	fHGx9joXW6wMmaHH6gwgrvJC+JpJqR5y+CBAhh1RbSNreI8dJOpjo/MAgvadhLPW
	e+3vpL03kWrVbiZxMF5cyZAIvSsAhrSuhOPCDUaV0hyFYaaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmxra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:13:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so54573131cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613634; x=1775218434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbnk1Dbp628OwAbcO4W3dNKPCATjO4PL3FJbktC7gOk=;
        b=EUwMcq12UKD4kv4WVKs0LAW9xPa9xgEzCs/52MRqutgJcwwa2il+AIjH5WihEossGq
         puZcAVDRTwiPjhmzetiVZuOtyZbAGLWkrT5qxQGg1UN8cdAg6CIOSewPbugVViVXDWjc
         5HX4Dq4NhbOBwuapdTey0kKPxuQwbBDQ54nasO/5DonRH7fQqSQrVazoYg8oLrJNn0aX
         zcDw0YQnZzXJ8OmwerWpRqXsjYcowx6vqnfg7i1AMexaA34c/dr4Ol7hVEuVyhEq5ldb
         nIYKxPFsUM2kkLsM/u9gFp86vqD9ZGbMG72mIOKNNZeWzH8xJbYZO/xHnjOtZZx8nod0
         hC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613634; x=1775218434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbnk1Dbp628OwAbcO4W3dNKPCATjO4PL3FJbktC7gOk=;
        b=GanSmqTJG90tnBiHENYeiqDGEtBiFdMrObQQXLjiMNjArNpa0Fwev0K/V0pZ/dN1bB
         v/kniTUiT/LQWmr2+sUDYdUkCGqL1TyNTautN0xZh2lKGEjAXq4XMD5Jiann8QALsveu
         KNn+42iFZz7ijZK4MAOpzm98lf/krWlIhQ4+u0XCYkVHKNoZYTMyodKHIW6k0PY/E0si
         K21nNrHLvIgQnZzgNciI06JbLAVljuVLDPBb/NUln5jvt1N6NWT9CrRESmRCGzCGq0bf
         51k3vd/DizPr+15CxrKqEzJ6jWQYnsLJvzhx/OkdHlOo2JsPqt4gqBLZI2RJQBFfMiPt
         V/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXglIwHJFDPSapuaNgcuLfjspyHyqdS4z+QyKrbbP7Yvzeqa2QEsI+QB72YKYBtgK6H3qU36ZpOAxeH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8+oM7gPJS9GwtiRWsEr61Siflz5EAeRcIw6hsl/DONYRcG3a
	wkVWRLgXbW1dO/FUAucvIeh/3pYTF98id0AzYL1lUNU4BTfXTY/oHoP+MegETiw6valOeBP5tEU
	S2lo3eFR9kTrGizYxGxSDvzUqQlVMDIl6hbdjh3stsXT/j+33fZb9I1S4Rnig1Kif
X-Gm-Gg: ATEYQzy0+ECy6hhRYxRLE/8vX7D0Lq92sEwj/NC/5KI0H36nZ5EuGwK89+7lvQMCjbV
	73I65HZ1L/RItQPXwR5JDfAT/NuIOfURqwM4yaRq0WUmCADKF5+R5zxQ0eKOlouenZlfZu14YXc
	H2SB87ZRoLIOzYPrJ/2t40lfoMPv3kW7Cs/d/A/cw2QW3DUZrY+4RoJo2+XP0JM5KvSh/QTEoXY
	yhjE3Eqw0WxjBcDn6fNu/Hu7ajTAT4/x5a2sea9Uq2QBah3P3+14PO8fwsVt8eUqdufWvJbWcNW
	1lk/wiyOTY2AT/SCFy9sQP5H8s4atOqwCVS9ue48S8BB536rLLwUgvfozv3Jjxj27JaaNvCx+rK
	CP62OSo/AI2iBkFi9yXjG4HG1RIU=
X-Received: by 2002:ac8:5f49:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50b9958e2b0mr64471241cf.39.1774613633510;
        Fri, 27 Mar 2026 05:13:53 -0700 (PDT)
X-Received: by 2002:ac8:5f49:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50b9958e2b0mr64470531cf.39.1774613632917;
        Fri, 27 Mar 2026 05:13:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Date: Fri, 27 Mar 2026 14:13:39 +0200
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN0xmkC/yXNSw7CMAxF0a1UHmOpBBE+W0EMUtsUozap4kIrq
 u6dAMMzePctYJJVDM7VAlleappiwXZTAd1DbAWVi8HVztc7d0Ae8aYz9tolQ+n0HbAlwiFNkpF
 THzQaNkzeB97z6eigpIYsZfS7uVz/tmfzEBq/bVjXD1KxQ7WIAAAA
X-Change-ID: 20260327-dt-fix-milos-eliza-gcc-power-domains-bdc66ad5d982
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CpiJi1wFsZbfzyH+f0CtUiZ1fQugjFswPbwL9ZRyT5k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR1hW+t3hCrFIdlWwLympwZnNEIJydLRsUgP
 Wp22ebEHnOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0dQAKCRAbX0TJAJUV
 VhKZD/9jkSAP8CRS6WYhSq26qOdmRrq2SrU5758hd8KmlWvP3T3JpqQTKsL63oHienFSdykhhV+
 5/URs8ixhi/3AxGbVt6di6lljhsHTzDIQ3Hn7iGYXRV4O04j2EjcfQEOpEC0b3SEXnFqRY8sLFd
 KlU02Pf2BsDk2/12ikJDB43UeOwx130n69ndNi4w/EpiQTMKzWc+Uxhi5/xV6HdEDE59EpE6snk
 wRjlwqF44yg5LvJr5oL7jGJ558l/YLSq/cTBNk9VHf2VmoKeqpe794HHALMa+8IP9mMAvdv+Bdz
 EiQal9Kwt8U2lJFA1BBFpMTmGy4g+3zuYH8IzDIX4mHJgM8BjM68KEjxlBwo0EQN/EIZUMGRejY
 2cYZftSMTA/jGV/iN4xIfKQhF4loHppBNgEZmInzUSRTeW32QsdmukfQamSXbVB5pZxeNDmIEAU
 3yBC5nFLM5jA0/TY/VdybzXV0eKDS/OB6TjadRDGo9BbWyrqSJLCkhl8e+PVNMXdEKY+OhdO0zd
 mvEdGeTwcJJEYx6V6lgap9HarAt7SSqh/mBdEzPy+NBJaMGzVoVsaWybMvCtEXsmfM/07VE8l8X
 j5DAEZFQA4FzGu+JdBRReYwX3qIJ8p7EPPxMU5FV/+9j0NewbTpTMHwUx4ccCVu6jBa6KR0/hxI
 1TsIlRK27cleXSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfXyZpmGovju+re
 5BLP3VLWhIsYUjpImipkDxDHxc4anMHhXwpqVayDSbMb9x5VBLSHV23N0pBe1p4bChSGQ0ODdJC
 R5Gpczb5fHdSegNCW17rCxvIZXDs/f0qpPi3xGGGNd3RHrleu/RP0/ZJYNJyrkmHjL72/eZhtvX
 MoZgY2uvgBbzxA6afzStfBWM+Jb5dT4aAIn3b23F2oIMSmt5TtxrebgJU7bAIwatzPXpgmptNuX
 KKv8dDhQMdAhM9Gv3n5Bk6MpRrVkbHJAr/T1J37u1AvdUPSev3nHPFnc2bMPVH1ucAE9X0qIQIe
 FjFxs4JCg+RS4+JVhMF9wbt9w+3BlbBwsOkrFrke1FpWNSrcC/EmJy9Jw3H9vSxVW7C9bCGZj+T
 nHyWYi1Ro7V3cYtoEyh/jVJSvlL40f8LU/5wsbYQvsRdB8T+8wnyk5TMN2smGqxyGpPx7o7kl79
 91Aw+5206dIPqaZWS4Q==
X-Proofpoint-GUID: Kj_wOzV0IiQLh9N1dWsLuYx0LVOHHhI4
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c67482 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GdvNSvP5vY06GQSh6K4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Kj_wOzV0IiQLh9N1dWsLuYx0LVOHHhI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083

Recently, on Eliza, the CX has been tied up to the GCC.
This leads to dt-bindings check failing.

So the schema needs to be fixed. But the schema is same
for Milos. So instead of adding an if-clause for Eliza only,
tie the CX power domain to the GCC on Milos as well, for the
same exact reasons as on Eliza.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: clock: qcom: Add missing power-domains property
      arm64: dts: qcom: milos: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml | 7 +++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                         | 2 ++
 2 files changed, 9 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-dt-fix-milos-eliza-gcc-power-domains-bdc66ad5d982

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

