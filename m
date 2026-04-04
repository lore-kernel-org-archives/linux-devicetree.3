Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AA3B0AE2
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296288; cv=none; b=Q0yfVKjLKMBuPGn/E+rQcwshksZBd8ySXSVt3wsZns9/hQUbLQWz0j0el8bh0i6jSqOaCS6AzQ/wTnbVt8yKRQk+1xISuMBjuWqXJ8+e0qE6W2FolD4muq28PF+kewW0rtaIwWyKMxdcdSDF8d/rRmiQAmL0sGUbbzqLoC/EsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296288; c=relaxed/simple;
	bh=OeNwcRlQgwAI0BG1pAZa7ppViI2dy6Ooi6YXKdcsrkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5KXwMinX1XrjOXcRO5fkmC6LTMh+bwCQfIxKeVot8Y5wH5AxQSV+iohMjvvaWFbguBDF12UWcwrLbShX3dNLzNZuvLSDqrZnpYRsMjrZ3aeTksVnu3jaBhVys/E3WP7s1Sl01KgUgubTjXG7jv44CQvVEb1+ypEmZtjFy5iJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neUEVRnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSJYVYcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neUEVRnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSJYVYcT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63429EuE2409353
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byqd4nCWmFMyUrN2uTmzw7uUAwnY+j4PHal/eEl3wN4=; b=neUEVRnRW69uJFfU
	fSqDhOB6m1XTSGyk1UnKxcnfo8VIrUIWvpGVqVmez7hHIHcyVTGVkV5kgcXQeRyc
	SxFdnfkqLzlAwXCgtzCgySrTuGowr5lAWwZtpUg5/cpHxal/sMSfLRG2vDeVa6I8
	xr5TBwCcSVIxMrw91yCmTkJGWhsaH73oOCUgugh+7Vif2e7i1lqx7OcKmsuRGU8U
	odZxSutlYiZnNYWhgabUTF/3z45o2RlMyHXz5NQNl/nTD0dwWMyT/GdwkAEFEh7i
	/73zy4E8ZPDHvZqImaRo7OQU/3WkAR7vtGeAuA6NNV9+0wiW6rGulmJbmK+ldl0X
	wBMdDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrgqcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:51:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so81283261cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296281; x=1775901081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byqd4nCWmFMyUrN2uTmzw7uUAwnY+j4PHal/eEl3wN4=;
        b=GSJYVYcT0KRaVZUNMwAwJEyz05gkZisdqXd2+uxoVXQBaKpM+gfTfmDuod6HTpsZAl
         hpUdUAvuozmUEuFZHLGj0OJzc+2hwdfKFET5niG/O35Z1eP8djbmx7kY9GzWrhI+Etgp
         8bFw4yGnI9eYZ1RXr9McLMSnErTQBn7VoRAVETzIWD+9Giasbymb6RPIHShIAX49wnGh
         Ivjp6yLff9t2fKPg1VvviziyJf4WoTqbIxGz4P1JD83bVZOW49/X6e5BusoPI79n1XeB
         PDbsvT78GqwylSlctHMcCAFZdeXPyUvXFYzAV6fbxhV20a9zqq3phBlD9ucQ1c2tmeXc
         IanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296281; x=1775901081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byqd4nCWmFMyUrN2uTmzw7uUAwnY+j4PHal/eEl3wN4=;
        b=RBp0/ftTY7j0L6Z7ytMgFJ+a3inXqZBAwvRWZBFSogKWODGWxKJE8R8HYzzb8QVkwq
         KzTVz1RB5qbOrUQ3qzg9DpzcRW+xY0piUN6Gzo0YZKPTkVVQeMmpFLoyOjFgBoy/dgyg
         5AgPK+Tn71Bh1JXfONS18ZNMDZfeG7HS2+yGJKme16XNwAYvQ+kJsicspFV+s7+azbdL
         UCCEzEd2BFzSdNT/rhgwZtvMgGsaF/rsWSIp9adFmjL3j++ggFurysF6FV80YOaJVuXV
         ac2UxdMoXCi6a6wHZkQAFPpz6eKztZt+3UKMuptKJQqGSDd+svCqZmSYrNF809hC6gvt
         CTzg==
X-Forwarded-Encrypted: i=1; AJvYcCU/L1wTYVviQ7pRdNnbbPR8tZ2mLCAIp+XNwrSsPjGuubBM/6FqFxm+EtSMN/d1zrLXCZOX2ilfZb3d@vger.kernel.org
X-Gm-Message-State: AOJu0YxObqYNEmzDLAphrGJn5k6CeyXlDZ6E5xipUYrYRFvzM3h0g1Ms
	byr85WNzNg9dWvc9DBWAzIbYtdP5VNyWv1ayXRpsANbgzQ8rmouysV/NrTG1gOmXGhdW1gpmydx
	KxG6d7nnEgtgSDL2ugYcVxc8cwPnyrDSuiBVN7j8F8xmSdf/6bKgJ6BnnJtADaJbV
X-Gm-Gg: AeBDievDgYS2xqKu/H4P21o52DJ0q7SpfhsmOKyV/MypEuznSLEelrsgkxv+WawKF71
	ybVPn9mpV2iXGQ67FZgk4yZZYWkRx3iL4wof4LpHp3YAEMxvSk85wBRxNouqYROaQhgIp6ABxHn
	1ppKK9INic9N914fwtXf8LxXWxpkihFCnf4a9DYepBjIW6zDkx7HcmVyvm9esbAo4cHXtKt8LLq
	13bVaOdiuECYw0vzxJC2kOihinsK2tbpAkX8LCJ4+bu2+egDNkVfsEdpConK/zcvl/qI8tOfiIx
	ocXscEKEPmMu/QidcjRieEkKYIu0vh+SqLgZ45NJAahLKhpxEcrX8CIqzQXuoUquHLYni/T4hLn
	GldWTrf9IWmb70/IhKWuSK0cg2X4ELmmDgH6eJq7AyJZV
X-Received: by 2002:a05:622a:1a86:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-50d62d1c974mr89291341cf.2.1775296280787;
        Sat, 04 Apr 2026 02:51:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-50d62d1c974mr89290931cf.2.1775296280296;
        Sat, 04 Apr 2026 02:51:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:03 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg
 warning
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-4-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OeNwcRlQgwAI0BG1pAZa7ppViI2dy6Ooi6YXKdcsrkQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8Lk2Wd2Vds5fIegMO6SFm+Gtz25G1xBPLpS
 +F++phK7s2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCwAKCRDBN2bmhouD
 1zdVEACO+1qTT/XUzfQBdb5oYUMX12zACfQAFHCQD4pMaIA26UjfbvQ0PmdyXIAnC1G7LA4Pvu4
 pvOf1WmEWSf7jb/mOK8JqxP/CbNRw9lvqpyoUQaz7LQcGHDP8tOXHUH3+v3/zA8cqVNG/CSnoYa
 ewb4eXzoaLFJX1lDWlkHIHt2ONLTt4VXkeEHBHNEb7Sx0iR/fv/kXfyeILwd7bdBze5yaOXxiNi
 4oYh8uHW9iNg7h2ajRRl/eTe4OuKsf3lShCbtUBFOk0Ioj5fZJ6joYmRYyqVgUKBJ/7a1kkfjIJ
 1DEejNfVMTxrYdomIbU6CvZJy/CztMGcw0rpHGZJ5/ecW6+XLD0yS86D9gSuNMB3IrVIibR8sDX
 1MhETd0NmFzPqwW3paCEp/Ta8SZeiR8IzYnLb9iCg+Y7cGkKBWZYBxh7rtZ0jf43DF+oRxgSgTx
 oUZKA2w0lFCTuHSwgnyqdB3m5PWvLWoNTcrMpTwx1CLKg4OSTmF9qwO4Eqm4Tweii8QKkCHuKGd
 WDn5QT9lBiKwgWAkGAVaWJRHCA8DBNyw5hytIRJZMYkkdAXLPiQilCOXijiIRn8kCzhJj9JYsuo
 nLyB40FstDAMLBM8nkC8NUQumQu0cdmT7QUImKq7VesiKhZV3pj3pe6iJqQEGFs0C4ewWJmNQZ3
 RE34XBES9ycbNhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d0df19 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9meie53SDYsjhsWzb5oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iPwmeDkROavD4Ovq1nN1goQo3JXqjU_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX4GVLU9dZ2l16
 U08r3wvJIYSP7xhAdH9443n7CgrSMzXPo+13nkPATl7YCYqox8CNaj6+hkIhPEXzCSj9qW0mLb3
 5ip7Qw1zpxHjgi0kORHM282ZDxxyHQmoP2lszXjaqRD6hNEIzSh2p6IGHOGHW5wKdXh5Hni3LWD
 RW/PWMEEbB96HTqUU/brRSd39qvSpdeOrjtLtJvXn9NLAzw2zQh+3QXZ3NRYq43Ty2B3+VUxMIg
 hZ/Jpk2NmWQ5wZ8UAQJnYBT0qs5FlD91UR8OBMojvEPLLCQHbKyVmwe/3Sk6mbXL02RFw0ZNmM0
 59B78ADe7ualMyaVVQKu5gDqI/ekDrvWb3QRRAaAA76MRgJB0/72QhP3bjI8ZcArIO6wpYq3Euw
 zkg2RJTvtEORRCLmsqgTgMcILpb5VvPJqgn/vWdXfqPhPP2XmtIV81Mnbo+05wKbFw7ZUTQovCC
 VzrW3a0YspQWYETw5lQ==
X-Proofpoint-GUID: iPwmeDkROavD4Ovq1nN1goQo3JXqjU_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088

Correct the unit address of phy node in Qualcomm SC8180x SoC DTSI to fix
W=1 DTC warning:

  sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"

Fixes: 35e3a9c1afce ("arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..e87e82fa73e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2647,7 +2647,7 @@ usb_mp_qmpphy1: phy@88ec000 {
 			status = "disabled";
 		};
 
-		usb_sec_qmpphy: phy@88ee000 {
+		usb_sec_qmpphy: phy@88ed000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088ed000 0 0x3000>;
 

-- 
2.51.0

