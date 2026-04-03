Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAF38B135
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210893; cv=none; b=iO6+i01XDhlGV/AYuSH7C3ohjxlfGpW0dTvTHCoaRdUvU78fLjt0AhWmNeoi70Su5uY3iJr9hxp4Yg9tNTUX2c2eHY3LJenxbLL1l/AN1pjuwg/HRvIgmM8xCcS0dCy6P85dfwgEAxtil/jWY3eyRcblTaoCtUfQqhDDWauFJwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210893; c=relaxed/simple;
	bh=XVSQJAsYoVMAR93G9UBt1XvC4Txcv9nD5uc2OvoYbDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kk5f+K3JuDfUBC2c8ogeZuoVxVZWFCgTElgNtHp0C1sTvt1ZfQ2Ifefy6Wjjnkpx0uSO7XbGjZ0/tL1fHnYi5BiYLMb8CGrjWA7iL0bGo5y9zpQYZMHZzBDpHrGm5r3L/haHP2Ka3gnj56erTGLtVOutnk+rz31AAdR0JpfU2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX4nEAgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSWebH4z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX4nEAgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSWebH4z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336FAl6141947
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 10:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGIKvZFR8Ji
	2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=; b=cX4nEAgrIZIwzK31BbLN6BwFn3b
	fESMbfHHguounj732FiBjUqC6N6f5/cVWTaZCjfp/3H4NNnjy5JSffjbteVc18Ts
	0zRPla3O950Qzla7JnEjsOgHkxjajFzLsWdFd6qM3uG/KPvj/qMpxGXeTedpghEU
	NHPblEasgpalVii82LDJqWR4+Ra+ppkjB2eqhEGGEpKw0gHd1YI4/L5lPAXsyE63
	iOjbYEdDPyIkjOj1PvppIjABuHVxMgqAocIjyTxK/9XJV/N26KePsSk4GZq9n9XP
	Uj+GkaVNebBTGhc1Lv7CiPpSVG9Wf3jo7ynvstslfSVQXSS7QNvz9dAjS+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0p4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:08:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c1107da15so1741252a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210888; x=1775815688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=cSWebH4zAN5OMD9PRcvjGsWlcwGrgWtBx/xlB1M3Bsf/5xluhs4tN86iP+/TGQV+lr
         zhn9LYCFDBKdtjVO4M2tZpFv7xM0z0kkdRfvC5idZ5vHKAGX5tU5B0W+aLfY+RypMtZb
         +Hi/YI0mnJmCkLgB7HOU7jnufFxy4x/mQgdI5KUqXek4TLewiV/2toHe7jQOet11Bpw7
         vrgpX6RGbBSum1jjbuVDMF+qNw6mIG/Fo0vGmtDMRiY6NK1rVMZDqDCyP+/TIHmgqBMP
         OqJbCZM0Onn8j18xT2l3x+piJS7anDuLR8IDvJEvDwfG7JE4mNKvtjEx3fmByb+b3Qv5
         gXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210888; x=1775815688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=s6x3EtVCO/4x4yuj+fJ2gyfGBCNZLkjdcirTzaLlwXQWq7XCt9GY8GQNCEvkvy6TvR
         nfj/8QQtocZ0XP7mrWugCruR+K5YgIeWLZ8xuWpTgh+WWxCJ1aSIJv1y7XXUqzufFldK
         hr9dlWrngt6f2THL+LOVro2wSLXeMBuP/Wk32Tk74ZaoLS5P3tDUw+JLN+fGFmbWdxOi
         ojujwFdiMcG7rflKIVBVWnHU3Q1HItUV5F5V6mShxHnzwz9qdhtzPinY5qCNv8JRWMsB
         SVDbM6guFtfipANbsFHKwu3D0Ti39ftnCSr9BNSPCKE/AUphRm8oWLpLo0SDRW5XDMqM
         AVRg==
X-Forwarded-Encrypted: i=1; AJvYcCVf8mDnu6SJWKfDmmGIKS/3hlT3LHfjPvGMJXB0ZNPX9KVTpX6OnjuUPvp20cbrnBrYEERVa7qOtQ5h@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeByvPYRzDjIEB+591jvUlF56DLHkmqkh92irm7ygTY9fQlzt
	RuvUZPpyJqz80jRD2s6OBXwoTZf3uubTnOgTR2wPIXzfB3qYplagI83GO2Mfqs2ypC9CgybZDqR
	ybwl/8Vg+mxk2pCU4h+p3p8evP/5bzZ8nc/JdFvwF9AoXXkiO1wl9tsu2iIYperBB
X-Gm-Gg: AeBDietxVe16u42VXDOE3Br8tBX7OZKOWoe/o0f39nmVc2Hl3a+x1rUhHpXnMzXPtp+
	haR3YJ/unO5svr4FUqahKEY/Cx/GBxL0tBPsEKh3kowHcL5S+5asSWyMcCuCk3ZkPSje32cA93i
	wibEccLP/NTb3ZWORyeoBAsV60D/ijuhDbaHGZs6+UBf0KJDVU84A2FxTebLaj666yQ18YJHy+o
	3e08WFzUNBFSnkaYCBR/6CD7bX2EpgoxbwqZZtUIYvWAtzMXpQ3izN73VlhgQuQ2sCVXFX7nflY
	eLW9+2KaFolGb+GGN8u8cY+DRH1C6CYAArEOegI3I6FrIjivrpYbQH3sew2iOAs6mb7fKSSSn26
	RayRm0okz9rI0KUZ1AFB3H8xHJViMOxDZgFPWNtnQkgdBqo/dknWHsDI=
X-Received: by 2002:a17:90a:d407:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35de68f8988mr2213299a91.14.1775210888157;
        Fri, 03 Apr 2026 03:08:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d407:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35de68f8988mr2213271a91.14.1775210887666;
        Fri, 03 Apr 2026 03:08:07 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm13497522a91.5.2026.04.03.03.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:08:07 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 1/2] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Fri,  3 Apr 2026 15:37:52 +0530
Message-Id: <20260403100753.3477925-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf9188 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: b6ik0wJshLlCvTuceqMC24iNgWI3z7JS
X-Proofpoint-GUID: b6ik0wJshLlCvTuceqMC24iNgWI3z7JS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OSBTYWx0ZWRfX+rZQ3E3jFfig
 idfc6xHpO7QF5APitmC/yFseKotOAWFBpzOsxymWTVxuMOMwJnazMcqODaD70gB8dboK23aVsqI
 +SsQfCmkFKDQ+dscvaVpgQmtOUJkdlaZASLbrKXP3sMSzJnu0es2I/utyUfsa0TJCkf0nL/7JVC
 6wNz99AauM6AaoGwXKZToWOU3WuGRW+ax7fp2iLNvx5ptChhyNvp30v13YjN+WR3/L4EVx2jld+
 mmtlhnPddyX8wI2H6iSgp2WVrF/bfTpIbso7dH/PpxoG0al/WcCVt8ZnesJ9abeO2cCuMmx7aeg
 6JvyvbTFNDqWOOkx7UhT0CWbLa63c+FqAqvXJsdqmDi8KhXnI4y9mT3lBtoxw6Lr0IRztPREdQH
 scXEjrx/Z/Ph2RLJ1qRPF+m3FiYuqFQiBWsili1AG9vA2ltJwDbyxUJVON73/n83NkrZ27kkQqb
 7hhTzLs8PFQIUk5tODQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030089

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..522d407c9925 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -63,7 +63,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -551,7 +551,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -559,7 +559,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -989,7 +989,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1

