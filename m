Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84593C10B5
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220554; cv=none; b=Qn1YM6hmu0aAxK2QY4+jQ1QzsnbOrBcF0ysKDeUg0I1/mZ+ipYuBiO/5LwW4oHG0aZKo5JKqtvZvJw5mxzV13MYWzztEVxbVUAFQ+rt72cbrDmTiWqcGII8vhAxwoTMXuGOmvc4DmS1uJ6NJmkomLWL9Dxsf2nL3GpePsnBp3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220554; c=relaxed/simple;
	bh=ppqg0h8bRGvJ8cRgzX+fL/RjwZyvoIJpuivJiHXgjs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGQe8B2D5X641Gh6lIb2QtCQ2hITQfSP8m2JEm8JJXQQvEu5hVByWx2n9YPXjz1ld/L7a8vOQJS3048LLSth4rJ6bqENvSxGW7D724pzHJBKk3Qk9EdaVjGZMcS7hq6c2ZY5Oqvfy3GN848bxgllB2T4fxYu2BuZsA6i/iSVbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ScBBBqAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePIQQLYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ScBBBqAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePIQQLYb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LCKZ2753042
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=; b=ScBBBqAFUdi2PffB
	gMYGJx9edVAvD8Bgh+ewRrCETpcJvOA2Qz7um959OSi0imRf3batshqwgGOIhHxa
	K5FReJ9eH1PZwgqAYCEKgAOelwCMaoHzoZrGFMqCfLLybL5MM24OhswcP1QSHgGM
	ITLFTjBfGg4gwraJLPKS4j0OufeAOJpitxQqfa8BvLB5mTY29lCQkna9Z/4VXz/+
	bolb3FrNEytrQx6+DyC+yMFi5zqF6LMUF6yJX4+NUw4UuuVOUgVIXN0Q9UG/i/EQ
	ARcnEeKcnRZ7WZVI//KxDk0fyOLLIYBMmJM0oQSE+sTBgDwKBDsJu0xWjZNOB+bq
	4qRmag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498mqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so359512785a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220541; x=1787825341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=;
        b=ePIQQLYbaNj8i1Yl7yt1/e5KtACVFgKwJUZerF7PJSJev39iwXprSedJMaKJbyJQoP
         fTgTASaOcZ3x11Tt8yXkvvqyrQUs5vArbnShkk2odXAghxtznsj5xxGuEJXuYqKur0zj
         06fcdLC29o4NFaZ8wvfs32iFUR1Mbr0yZGH/hYRdXTWajbdf3qgcBHt0WYGW8lHenygJ
         0zIHWH99m+J8PxOUYCVZcuNYjKAJipDsyahscerSvLdLdWYWrjKY4Q9Ngj615LGUvULC
         05YTHJhaPozXlzZ6duBVXuYlDfR1TsgwFYB5S9/OIRquWfUkQNlAh1ZYC8y8RQZJLJcz
         /LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220541; x=1787825341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=;
        b=gwlu7zhXqp3yfmVhXnXkssPzrsGHt/VP0uBVcM3ER24jmVxy8yGYJA9xcR204K+H7c
         YzxsmkPojmGAhjiPZ+aibNq4r9wVW5WMQhXQV29I/Frj+ewwLoAcJfGr9L/6lIrFvnLA
         N6EPjbIA3cpZg+WlXOIuZgPr+tbHjcNST/qf6hh14Whew5yRI1y6VHaKcHxNy5Nbdtst
         yEsVc3Y/7+RBRyGdH8ACGd6FmDCfhs1T28uTAoY1w6+wcZ9w/hW5SIjd4fbkYguTwmbD
         TVl03MJv5RUIFFoIOYpcn8j6wa3SscABbOVG/1HWjVzh41g3NyOZhQDUfKAqcA78hb2Z
         +qJA==
X-Forwarded-Encrypted: i=1; AHgh+RodP+B7yk2AnrJp2hIaIiVzA8s+h8NMQ4uOR4GufDOg31P6KNdwDSRZSaIyCuzqERZTibPDCWieADtO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hPwaRWkr7NSWJSF3YNKDFY/7gtiIblR24yS+lzB72L7VOIJR
	LRPyBI+qe26vBFbheQANbA0Rua79CcR5MIDiGQoaoxvxL6Ce+n2NI3xPzeMBDAj7DGYlx+g6E00
	pxKbOtpa3zEHXLR4PMJF/5RTD1MOk2Me61bE5eBnbUkmqR5UT1XMrvE7JDvbe5Vty27J/e+KVPa
	mbCw==
X-Gm-Gg: AR+sD1254q+4K8twYMp4PlhDFtt0qNibfkNnW64gsE9/9e/gyPmpJMH+0c6yZZqwwvt
	0/J9MBWXtXtFY4q/tb/y3VqJ0Df9DFYGW6qsvT2rdxhxM75GSq3ecVYQkH1HgX6mexB5qmocnZR
	dVDcIUWaix+JRXA3ur8be7039lHSdACn3muz5HrtigJDuxhqhObjfIa7UZjdB9cQZNrVLYUO374
	3ke9Zf1sn1sdMRHuseC9qw4ezYOyZ0T32BkVwUrJkKPkLllMzzDCdGrN3dT+4mi97sSyolU3TCz
	DDS8k6MumyrPweoBweCqj25nrT6mzW4UQLd75TT0HpDrkR1Rgnxs9MP8msvaJIcyDyjqGwbQMgZ
	M32b5urtD
X-Received: by 2002:a05:620a:3181:b0:92e:305a:d729 with SMTP id af79cd13be357-9371e31b0b7mr926371585a.7.1787220540783;
        Thu, 20 Aug 2026 03:09:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:92e:305a:d729 with SMTP id af79cd13be357-9371e31b0b7mr926367285a.7.1787220540270;
        Thu, 20 Aug 2026 03:09:00 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:12 +0300
Subject: [PATCH v2 09/16] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-9-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ppqg0h8bRGvJ8cRgzX+fL/RjwZyvoIJpuivJiHXgjs4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtH+TvlcAiBJTUv1f2KiEaX8Ufh42yZYlACGr
 OpDx6YksYKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR/gAKCRAbX0TJAJUV
 VrLVEACmX8KfUgNLlSxVbHKFKNelWR2WVFK1Z5AOZ1cvZ0SLJDGF3Js+0MQ3XFYH49mzCrPmUNN
 CPJ80H2d35iupUgUG7jX5T/tDMn1uJSWuWSfQTi5ja7cHEGn/V6WDmz9cGWX6cdUrBgMLCpQzuO
 +4mh2GJ7Da1lzpno0+P6078nuq+UDdx8JaUdlkemM8hcMWVIxQc2LyRGSKt8weA795HWqeHbVn0
 s0xczvps9co84gr1Vdd2OLV4dul47+DqjGy8FBr8XzEYE3Hum5xnyPKUhqJS0Q2DuvjURwk/Co+
 SAhDZbTLOnbzPPI2TYcmWPTRiI1ftTRfa+qH9q1v45grIUD9HPWnkWL8xcO1RdPQLoXkqeCWPRe
 A/8QcmYVAa4NmJv8QDiYmEJA8IkY/UKggWiQ84AhYK1KCddq6P09umj4DjGTcYUIIeq+gxF11K0
 8Xze72W07+7FOjXHkud+jao0i7Rwmvakug6QcM5lOUNLbbEZT0ws50/lbAzmN+YAhHlf960itDx
 3mqFxvgHmbSxR9yDxCAHUm6GiLmsRzwORsLVsagxQme7+PhktK1ku1w14/8w269NW7xCl6RBPwx
 Vd6dlAC3JnjksnDe/j5BInQI/HmHgz1XEtIXPhX1H8hTy9+0sTrGRUzs9rTk+W1LZ9nBoKF31ir
 ezLH8itnN7xYSuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX/cD2twYd1GFh
 QDM9tRk78KXDB3TmECbYIxhMVkQqMK1ocBR4gpEOQ9HNE1o2LIp7HrsBuxOBdNZk9BbZkLAHzMp
 LeaT5hV48ScyDRcZ5E+qvCnJhVYMvfU=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86d23d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: q_zQDr_Cf05V-6upD-IpvJTjUuyDU1aO
X-Proofpoint-GUID: q_zQDr_Cf05V-6upD-IpvJTjUuyDU1aO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX5BMIqv7NYx69
 hihNaPI4xDTEOPprdXAmd8JxpdnLj/nyBUerdZi+qPlEOiXnDw7zssNNeHPDO3VIubxoGaXRmuK
 oC7qvN+WyrplwR7odn6BxuCIv53oKy5eNq0KRyt0sDKy8hv9lVJrrs9vnTpKE/194mDew1CaeZP
 kOsW8L0l2sZPTnWWlBvuAiauzn//ke+v0KV4g6hjknG1gbP4knWj8swHC9SkgaaYgPwX6ujRdyo
 5IyEo0M0Tbj33XcthTm2N5+vcQIL+MuIl2F0jzhfyxBcjQU4ZJQBJQd/+x8HmG14gqxz9URKklI
 ADNO9tJGSI1T48zKIcbod8zT0yRmqwQUPQFJ7tQYEtU3shZvcQ2edJjIlWrkgyt9WpOady14dqp
 98nhZHBXzXzgBiHiCyQpoaHrVuqqE/QixxJ9sGuj7LyRXkX0hBHKKSeRE5oWcQePq652gL1sq7H
 4UMC3/7UURHplSMpUsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..50790cf1c3ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -971,6 +971,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

