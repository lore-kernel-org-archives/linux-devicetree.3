Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90930288505
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775482603; cv=none; b=X1nakBM4vbMzQi8Z5mlMphI9JTp+rYvAiObdIaeMbvLSVBv9jfnzOQVi6Ttk4xHvhyovykjgkTgBZxhGT6S1vdikPYdyW3Bac8W0LhGHs6V2rQ9atU1eXBvIGqIIuLkmffC5jmxcRJ2dg0T1ZotxPUMD5dThuJUoJh7ezhAm7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775482603; c=relaxed/simple;
	bh=Lv58i/3SsfM0bw3as4gXi6fzxDYm9GlG7i+Y45TCYwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gpyy+ebGkFCpCZ02YPjmIAAO+GgteueaJjNRay7oKW1dk2GlTJ5PDSFXEOti7C6ilZblXfWvYEBcu8dOCPD7gK8OHsA3lkREjnHIpy0lF0rowz1EXyq+qlyI/v9PDvGr3Auf6nl70JY5XfGCqekyjZBDaceniTYhgMB1dg/t6qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqHiOgBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgVvw/Xw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqHiOgBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgVvw/Xw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636A6Dxe913876
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 13:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QQeww7QGYgNJDU/rZW/93R
	+9mEweDrvUfKnoJrTGYao=; b=NqHiOgBkC/Jx6PteZ0ycbvV9+vGqC9GJ2AIGo1
	+k2SZvskrqxfXR0fFUtAl228ngcpT4DffQggEzXkzmY+WGEQ7bFXY/H+Ua98Fm18
	Fmn1UE0D7Lu9i4MUn6FM/Ao72QKdLw0JuzvNcCu0t8z3RV5kZTgOnWWQNlfv4Nfn
	sELPkTDWmqQJPLzx6b/s2/D4e+epEu394XB43bZHY2O/YirbLhE0ka/ZU+lBXSWZ
	Uv2WaNFoh5DNBGm3upLnyI6n8CJ57Uj39Ch4N1jPhDaBX/tP6ZY+cfxqEOUasHqF
	XpqUHK1+waUnaq4lT2duMz8bWzdcENiXQ1oUDi6h6Zmi6H0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd586f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 13:36:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so110632275ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775482601; x=1776087401; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQeww7QGYgNJDU/rZW/93R+9mEweDrvUfKnoJrTGYao=;
        b=UgVvw/XwRRG20JxdWY7TIlNZt6x8o6RJftKKt+OAPfBNA9fWhKF7IjxdAnGInEZbP5
         zMT31c/Rgqj2EJMX5j4/v6QCYgfHnmfhrFxT/xTtzHGrm/J1kkDPPUKXvztmcneSZ5iH
         G8mNJp5uYKfHnS0KP/56vdK61spROCc6WKjTj/ys6q73hLXHGCn3tR+yqDbn9Uuonc6r
         NpbhqYv8pPsDvU8Y0FeAxCinFTuI5xDYclFhixVbeUSr3Kx+8V+nHcIEzxvo9rM+AkXo
         wzK6rWz98k54VzntgR2icEahhYAfDKqFNBB6WhBY8qSoQILEDa9/tO13IeQRELLrtqea
         PGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775482601; x=1776087401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQeww7QGYgNJDU/rZW/93R+9mEweDrvUfKnoJrTGYao=;
        b=jtUiEUURGMREJd9ISOpGL+OvBXnuGOevnfibYDv8jqtyD5tWNSm8V6DB5ctujlBUS3
         w/zg8GHuPB54u/uS675YM+6wOlCrGxMSrgV8lsgGe292tcGKVyNi7QbbAyNN4bqlyon3
         UjcuznhtP1XJf4hhVAQedkFkaP1NL4+nb2mBTAboyyAiJ5gCSqaeUOdLdDU2JzTC56dB
         01JxAQrL0oBylWiwD5mWoxqE4JVQc4Fpk1EPAujLLil1AxsTAtyTkhSLDrG/nNcNYCVm
         fUTiSbpJeP484Irr8flR2IocuYEpnmCwQ0OT8V2PfQisU3i4LMvBdsQGJoyWZrdNeXg2
         E8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWlf04NzE/d7PD014emmawr60NM2/GfY61Sfq5+9IDlEmlw0aBzVYO7ItppuZjqeN/XbVboUz2A8vpq@vger.kernel.org
X-Gm-Message-State: AOJu0YzDo1335FBeFYIFifDeF52a2cJlX/wym8rtGmSutVSVrI//Djdb
	ygjWIA7bTDkwfssFkhw4iHqhC0nLULBbgJ9/dSVyPgIJwdpudeTGPUDotTZgHhtF2Sk6cKpKYCB
	VsdRHPyGxQYnJXkOUy6XLZHpaVYMtN1FIoyHfCwMLo8aKHC1SjC5YS5XF2fAKsjqT
X-Gm-Gg: AeBDietOgIt4kGJwTc34gyNSfYmpZ0ULEmIUoZWBOb58nAphqL+0fy6PUVMADqnYoRZ
	z/2LdmKmT8448T6R1j1heomHuvpaaQ9Z9WDA372QUXhCWIG97Ua4CH5pbvbvH14yW4cvySxgzdL
	NoxTQrz08xM0LFEgmpb1xvbR7MrmwsM7ESe0rQgpRCM/U88ZdZ1L7BDdq4R45TMSoJ9/iGFoMqb
	5wWvAPVNR5Bl7M/IaDu6agvcVAKGn6VKttCdZP2ngpdY3MSarkzFfzCMaXy2j69HZO3m3u+UduS
	BgYu/sqWNFpXEF6bgh7Zp/7GhIw6MsuIYF2eatoUb1S8NTvzu9UBy7hx4t4daa+zeVtUTvQgUNS
	6mP+S9qv/EXLMPvqRXLdumYyPnT55yqLViDcdbFeSuDGzztHyljQ=
X-Received: by 2002:a17:902:e749:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2817ef051mr144409655ad.41.1775482601201;
        Mon, 06 Apr 2026 06:36:41 -0700 (PDT)
X-Received: by 2002:a17:902:e749:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2817ef051mr144409105ad.41.1775482600468;
        Mon, 06 Apr 2026 06:36:40 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a3af9sm133535945ad.63.2026.04.06.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:36:40 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 19:05:55 +0530
Subject: [PATCH] arm64: dts: qcom: fix temp-alarm probe failure for PMH0104
 on Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALq202kC/x3MQQqEMAxA0atI1gbSInWYq4iLYqMGrJZURRHvP
 mWW7y/+A5lVOMO3ekD5lCzbWmDqCobZrxOjhGKwZB01ZHBa7ngopjiToQZ3jgn94jXiKBe2lt1
 g6EPBMZRHUi75/+/69/0BLuGMwm8AAAA=
X-Change-ID: 20260401-glymur-pmh0104-temp-alarm-fix-72e6c1080d6e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775482595; l=1579;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=Lv58i/3SsfM0bw3as4gXi6fzxDYm9GlG7i+Y45TCYwU=;
 b=qrX/VysOGhciZX1HzpDUnOVR1FIPT1msani5LHCDYwyEPsSHERJhp7i9QCTRj0HVqFfodRO+5
 LGiF7JFvqOGB2L4QAy0JLY+19fe4JsZFWAyzW/IINpKM9SqS+TyWRKg
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: 6ApqWfbHiqyS009AtW3Mww39M7e3cA5-
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d3b6e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nwn3hN-nbngWV12mDskA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEzNCBTYWx0ZWRfX/ez1ZlFJZ0rQ
 sdzpBzmpYDsdpcv4yJUasZf1S9fwikwEvlSSahnKq5JzBxyAimTx3xqgZDRL/4RhsZzL0Kf5V2b
 CpWsUbf3c5oxIbahiMExxjTUJ8ClIMYSlKor3jPQ6Nc6SfPUwfAeuM8zpfVwm+OV0wDIg/HUCH9
 ve5COj4gE3Yld/0e26cyrMTV3gI9jiXmo9BidvOxyZqoUx1N0dJXfrMN52FmE7b2FPmPRQYgGD1
 nL6h0jsFp3UVtE+QokUrQ64VjJDn2nnw1+5Ced0EPyNBSRvqsJ3zHt1rF+uZ6Qfftf3G1rQbxwL
 lCQGXRjku29alMbNxYoRVDda+oCF7jCUZDD4NbKgqtFaoyJ3Fep99jhBqf+GFQCN4q52gsqYnkn
 XwlZi8VdapPKMRwu2W51l2b1E0NUK1CsfCtnjHvWPAKM/Ka2Jxw4qkkXN0bk8sfeAe/irmPEGjG
 AkKUcIBF6H/HONc2rUg==
X-Proofpoint-GUID: 6ApqWfbHiqyS009AtW3Mww39M7e3cA5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060134

The temp-alarm driver probe is failing for the pmh0104 PMICs on glymur.

[    3.999713] spmi-temp-alarm c426000.spmi:pmic@8:temp-alarm@a00: error -ENODEV: failed to register sensor
[    4.015066] spmi-temp-alarm c426000.spmi:pmic@9:temp-alarm@a00: error -ENODEV: failed to register sensor
[    4.033908] spmi-temp-alarm c437000.spmi:pmic@b:temp-alarm@a00: error -ENODEV: failed to register sensor

This happens because thermal zone associated with the temp alarm was
defined under the thermal zones parent node which had a typo (used `_` in
place of `-`). Correct the typo to fix probe failure.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
index 7a1e5f355c175913a38d536a1ca13d870049b741..6b4747025b9f85d5fe58ee6ecfbe8d07b38d29fd 100644
--- a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/spmi/spmi.h>
 
 /{
-	thermal_zones {
+	thermal-zones {
 		pmh0104_i0_thermal: pmh0104-i0-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur-pmh0104-temp-alarm-fix-72e6c1080d6e

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

