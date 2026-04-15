Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973D3932E9
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239604; cv=none; b=EYT65SCAVrqqW8zbDwV/i+pz25+eI7RPk4ly16/xozvdxYjfnavscZ4pmptnP2411Zz9ETFDTw9DBcPWDhRfRvZ6MGxJp2kHVu32axjdA5pAbq0nzoJkSMbkruNl0zF4O/5tvbdgJ7vZHENgsbO+Np4sqUojU4UlNZooeVQzOXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239604; c=relaxed/simple;
	bh=F9nBylT8gwdnIzBW9sQ2lF5pOxrCapc6iKyVgITuQhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+vhzSNAIZ8cktAI9LLjr6E1ruWuy491KCkP+DJKIpUL0EstsEzsuUV0u0MWTuquQsnWh7k4HMGDWqe3ZElEgl3SzwZbsbtrNFWwilGjqrJdpwI0+484xMEkasu2RBGxZy2tfCqcOuq69ioA1RKJY6qyJ32lkmaeBgXz/ZFrwQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/t5IfgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxCzG9Yh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/t5IfgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxCzG9Yh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F3dhhs1701751
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N4qQvo1hCeC8p7xFW03BzTAJTuJ6TB5gImGlhTYjJg=; b=h/t5IfgFkyrMbGQs
	9751o6vZNUQPgTjiLxgpitpP9t4IEIuWSU1MO8RbJHQtjuTDuXODL0FzOC7tYMVT
	eVDswQp5v84gUkBzq3TuEW3plkumGgcAScruWBYsGg8tCROp1LpXSEijDYU7ubTr
	wizQpRqw91tryjLrv8Sn3HjhnO2LLn+iZFvo4iL+CO4iJ/oLT5D+n/6JFWJRwATo
	DQcEXM6aaiVo3TBQsmjezwnzf/7b+xRaXeMjnDrTB5ROikVlleNxjcW/19Mprd0T
	Ns4NFbDmNunUb033gXtyw+p0Fr5n33S/Cy27KJzW9rXp97j/lKvnSRprDtWloDFh
	dE5FXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56t9jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d58bed44aso192097931cf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776239600; x=1776844400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N4qQvo1hCeC8p7xFW03BzTAJTuJ6TB5gImGlhTYjJg=;
        b=XxCzG9YhLmTZKWE5cr30lcDw9WCQmdG6HO/c+U3jBFgTfL0258MJ2jaL0+5ijmD+Rm
         mtwjoGLAuREuihVWS2jR1OiUB0USXXsY0rVM5t0rK2Ong3Dzv52Xa4OtaBdKD54BHgIW
         pM2Ewc/mCfy02zoRzTdjhhiEOmmt+WyAZGwPQlfh38aEaPRE7qnJjiCD6w1wQ1XCYitQ
         qGugr5Ofrv39r7y+joBAnsa3OCw+cb5hOLSEexiCreVSZp5jBs/PcWCy9nvggDFbf4GH
         6XAqNhyDdAxWHTVwH6Iz9kEGJS650LIdQcdtZ2/686A401/t8UisST/TBYQD0pxnGscu
         No4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239600; x=1776844400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1N4qQvo1hCeC8p7xFW03BzTAJTuJ6TB5gImGlhTYjJg=;
        b=ez73iZSkZcQaLS6QsSHs9uhw1Lj9MIxhl4dy3y87SbEVaFjuVO4nnr3bLhOebVakQa
         oJqXqRIid3HkG3FVFmJ37wqJt5tpJaszEV+H61C3IcstZ5WHTdjOsaowcvzwquaaCMzZ
         M5tPFsSWSENEMXZx4byGoIS98n8q94A+2gx3t/r08qLtyhCmXf+7LHgVp4NC5EHQAsOE
         lQnKlocX858ePuZ4XcTNZlzuTJa67XIb5uRfcjOZTrAZr7edxOcO+mUH5CyIpHL1aDNS
         eJ+U9Fgkj6Wle33Jf/yr7FtdRNSxF+gs3Ov98q9kn0xZveJ5GPrE8SrTvaFMYQIx85kT
         unqw==
X-Forwarded-Encrypted: i=1; AFNElJ8D0dTmdFeyI3rrEhGpgkZCydOiTW/ny1dyvnQ6YEVKT/t1oTfAD3k/oSjKP89t7gFMcR/2Wk0TsU8L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0UuX2JnqIixVoTAUZiXrnbtqEEnRdXKANT8Nld8QbYDFnwSr7
	wPUiF2qslj69MKAkk/P3IcX3bV/5ZskHIyO5E6ZqsE6RFjVqWIbEjJgLwd5QJ2LPasGtzb14jaR
	0dLry3HqW1dqdQYRka6nuueFeqLkNyzSglpG0FYPU7/N+xlFmV3kQe8nVhkZvQ28I
X-Gm-Gg: AeBDiesxWI0ROrBv+8gnfCoJiPX03M6W357dTavMw++c792Pm9PxU1ZWMSfHtCfif+X
	ArGcvUua7VXJljgLt7UXocOC8yrBb7sXflwwBE4nnNdvwaQ99Paz0rHib3zzK/04shSP66aruG+
	eY5TuJDIA2/tYJBkxfjYtypD67biE6ITv8BKG0x5B0sE9A7I8pKpeN553HfhXRQhKHJu73VKG7R
	wH168rVxdTQtofiliD92QzZRnnCQvqI16lllT/G8cFczeiFNi2J6pbLVdEE1FdkriVkf/OkM1SL
	sBh2uygZT7ERKVEmCsorjekNxqgDTM1EbWQHsv+iTgvuf+v8KphnSQcjG4YSXbkeF5gzSn2igbb
	KVVOKCocNDh2cctG1k/ZCiSYRK1nCnb1crz0=
X-Received: by 2002:a05:622a:4009:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50dd5bc5171mr313668501cf.14.1776239600504;
        Wed, 15 Apr 2026 00:53:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4009:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50dd5bc5171mr313667911cf.14.1776239599359;
        Wed, 15 Apr 2026 00:53:19 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e7ef99sm19334975e9.8.2026.04.15.00.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:53:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:52:56 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as
 role-switch capable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-1-409e1a257f1f@oss.qualcomm.com>
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9nBylT8gwdnIzBW9sQ2lF5pOxrCapc6iKyVgITuQhw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp30PfkenHSe6gkGBuoiFqm2zafXz9Uy46ab38N
 eb6QRC57uiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCad9D3wAKCRAbX0TJAJUV
 VtUpEADDgJe3/6XZFGZcnU4ycaPlJUPWn3SVzP2/Iu/CdyrVMwEE9DgHkDcSp8tpylaAVtJ/Qeg
 13uP+pt91oco4AklMXU7ECSG0lTMU8lwQJs6+KGrIhiwV3D+lvxsRUpcUlaNxNhK8A4xsVGn5DU
 4Dez1S/gZRXWYWFVbx0QVPa0duK75Fc5eTJ1r9OzZhTubwdVA69QJ/+goTJJNeQOccy/PtSHl9K
 iCgNvSookpVnFXcPPCob1keioBCZWiCft13kyIxTuH1mRm213dUqpeBF6KueHltG4Mk/lp6QqcJ
 uJo1ug6lzUrCeVqu8TgfwM9HDW3I72ttds828gZ+FvXSBEy5fmRNGMhJMpvMFdcgXaX5FPWrVCl
 qGbu/xuGLDBdLSPWgzNPq+jt/0+1bC7kztad5KRrqrISVUy89HuEgJFpyCLSZLZZhNXsL/PCJss
 H0nAh+k5kvyKwLywRxz/VP1ijlRBKJ3SDsYTDBzhJwM7dsyZTUgNEOx4TlNCJbPnr32zQ7DFqak
 CRJ0u24xT0nDfZvpyRNMKzu38jNiaQIVkDweIgzeqMbyYs3VFmmNlgQdBg7dPyOV3SX2OuNcjYL
 oOcfjsP2UD8Vbo2qQAQHMQz+SH4c1zqPk5Nalj76Yg/dxFOzEI7hgWRFPyEG7RzYxaeKQ5NBKqC
 Fi+lUHZZraHmIRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 1zt6ChavMkgJuWfk3gyEDdM2lUdY1FrP
X-Proofpoint-GUID: 1zt6ChavMkgJuWfk3gyEDdM2lUdY1FrP
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df43f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Eb4xW9vDPm6OQTOasFoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MSBTYWx0ZWRfX9wGcprdIkoHq
 4wV6B6hPzkvTnDkb35Ym0Nzt98lzxGR49xfa9WGHS+3UZ6pUix12Bzo4mGJKKfeG6Yu+qwzPy2P
 TsXgqUa5E1uLuQmEPUfpn4NNJ7DgzS7ZC1lbgTH9V08zhrgjD8jM3SBSRY4D9FAAIBJhqULlK/r
 n0Du9t0+UB6463NoApebv7993owjde9zkV3KYwrmQ+XyLLpMOzGu5SpWdUffLXUnPVKuDYIb75W
 X+AWryeWu4UsV2AqyQLBlaCoesVcnGkZi8njYBcT6ATtYbub5dzg9r/0RLNQgKApT8mLt1ZsNDs
 DW/KuBgjRsuLHJUIOXxryot68Hg/yuYzrzZ7ipt0Wmd26BNQuakFQmEwHscJncNVGQN1uwTlKL3
 scyPLJr4XYsIpnwz0H+eE0/zfa+Y2GHT0HvjRwQechnFjsz/+383hJAaix4ah6r4GNFaeo+YEHB
 coG41O7kl8keXc7TM9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150071

Like USB SS0, the USB SS1 and SS2 controllers on Glymur also support
USB role switching.

Describe this by adding the 'usb-role-switch' property to both controllers.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..0251ff43d594 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3928,6 +3928,8 @@ usb_1: usb@a800000 {
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
 
 			ports {
@@ -4001,6 +4003,8 @@ usb_2: usb@a000000 {
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
 
 			ports {

-- 
2.48.1

