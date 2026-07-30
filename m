Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557313B27C3
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406548; cv=none; b=l1j07PCruQbISrGqudwF6KZOoRNLQj/3RlGXiProKzJ6YUvQr5wEbLbGgxi3JoK0ivMdk1OOCbzzX4G6SgsPtXm+nnjYjvlJDPTAj0kCbDlbA/gc03vKhHmveVc1JtRtxw/nhFyvEt9vBLQ7d41qKCJqmuynyfOrYPHekwuZYso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406548; c=relaxed/simple;
	bh=e0HXtcYdZ+uScT4H5oo6R2KOHS7Q2bIuCKPJ9wJYhXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lfFY4SZoYw/S0xRTt2MEAYNc/Fdgkd5sCQwcoM64+fZAlPNHuI+1DRmRHG1zw3hIxuQoJowmjepFdO/UuzgUQ/tuXZHguH8V4fK+TnOvIpWPFjD4TTVHGikByu4WZygW/HbIp91XgfspDmwQq4J0VSRtKcP1IePzIudKyPwH7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehHZUv3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDc+tCVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehHZUv3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDc+tCVH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2ch8496650
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k8v2hf9Y3CqVvaj/kH6HK8
	bvjrar8ZlG8tBL2yALbJE=; b=ehHZUv3L7ESJqU4aEXz3paU2W79PrQoDVgdaPW
	rnWmd9FFx1jbbsqy7u3wJFwJH3XsVe+ygjirS+qGE6lJfWwn6plAhZqJQJ2gQZgg
	PfW6AU1O4EegIqZevuNIWfPKLTHNK9zYlTfX50FRuMdnLgactbXMH3uszdkYiBa8
	MtYDzI3PKZlOC5HD/1iFZk91mMmqrxczSVOwrscqslUtGvHcZvjVK+72Bcq5OL8Y
	foFCTqUQ3G0TNZnuhLlfDqoj1tkk7y/E3Zj4hxlpxOTUkS+79j9ILpH2rEgTAZao
	GV8Nuh7HmNQkSAgtmISySNmfqf3Gvv94vO2RdD7IAClawjYg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h4rc33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:15:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so3551700b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785406545; x=1786011345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k8v2hf9Y3CqVvaj/kH6HK8bvjrar8ZlG8tBL2yALbJE=;
        b=bDc+tCVHauDLClAepUqITIG7vMBsou1uuQtb70a8M6pURlqTz+vjctR/7t77kV9E2p
         WJqQZZQqYL3pd954/2M2OtivCMR1Nq3nI9IzyX5Dgt4iaz857XZqpupqXJkG7YIfcdt/
         UJwwmIzRlVQoBgcYyg+z9Tn3i2H6YXT9/R4lrMrIODDyHRq6j6GRQPu0ZY1AzmvK34Po
         wkKb8cPzBCmo7ZSpjAVKO/fNFQH2Jy0ro8oCtBMgG0FTIVzgur9eQve0xCyZNKbnGWF2
         nZMj0KOZ/jfIfD4WRnO866gixYJvnwIjirOQ/mbRCUmNIX4JTDuNSxxP9NsqPeq9eAVD
         HyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785406545; x=1786011345;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k8v2hf9Y3CqVvaj/kH6HK8bvjrar8ZlG8tBL2yALbJE=;
        b=tU7I7zm+gDp6lO739SV5PMmm7s5B4cbaY2WrlNy8/iEr8BFrAsIQxMiY4pX+bMgn7G
         PKbGIFr2fb0ZOCrPI1pAo0vVPCG6qtBgbNJ4/Gksk16it2zGEgIIiUjvyPq62uR7V6it
         JPh6b9dpY5PN0lunET9hXKVzzyANNPCxgP5n0tpjP5ft2Plzr3+I0/yAOg/GXTVbtVkF
         i9pGE5KfEEAnDzyagweexxoUGzdACFKeiJEfYy/mXdWHRP1kV3UlAb9bEzvgTVdkgKGW
         CJs4MD+R5n2KJNq6TlFe1vTtu0mXCLN4tWwvchiC4+dtioUvxXVdWSNHQ/Y4eGH4tTqX
         8hdw==
X-Forwarded-Encrypted: i=1; AHgh+RoxdeTK4p4vKiQg5NiaxPVMkET8gnrIr/bYSacSSo+hQ9rHJl0suYmOdW5yWYNf2YbeNV1n8ximH9yc@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4fJDP+GXcmcVZYT7TDgjli6KoxWmxAUvXD9pIdmwjzr6dbBm
	lwUFpnuI4vlJEY/ljK80y7zmaMpda2C0jDlb/Bbh+xXSRHTz8pFfPRlzjBk+mqg8aw5mE/gzRzU
	+lroMDfWa6AFOPp9N2NgTlKWnDqWPdagVjChIlG+rp6lf4GVNY3gQwunLz/ZgNgNR
X-Gm-Gg: AR+sD12mKhFTebmTK/QHGydq6H5DspVrz171dsuP0Ks0RjFKMxJCPtjjG4k8suBk+Ou
	mLJwrngTGMvJvahidJ9hnWJN6vwUF9vRPyofjxEPyLJOpW6IeaUHaSLUnvw0hrpzsTAKO7oF68J
	geFTDb15CPAHu68qEpP60UQsrQCp1huFHuK2xTT03Y4QhBUv4H78BcwZ+5Lrq1AdwYCxuF9NWoE
	FfxwRGkolVvkZJ3T1la/b8HcHiih5T1Mh9bwiGHqSY6N55ozFDQmRBAzu9cFLI2OuPWfwntbqLz
	Qze2w1UMniz3IM6tyFJimlV9CRDCoX5NU313pI1be8DBdYQ2opbn9/DVWItQTxEdVcHnKVoBQ/I
	c7frDuULM/3FVFpH0K004tPq5j3vS/ls=
X-Received: by 2002:a05:6a00:94ca:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84ebc22a3c4mr2003856b3a.24.1785406545003;
        Thu, 30 Jul 2026 03:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ca:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84ebc22a3c4mr2003831b3a.24.1785406544589;
        Thu, 30 Jul 2026 03:15:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0374c20sm2828020b3a.45.2026.07.30.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:15:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:45:10 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency
 typo
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC0ka2oC/x2MWwqAIBAAryL73YJJ2uMq0UfYVguRohWBePekz
 xmYSRApMEUYRIJAD0d2Z4G6EmD3+dwIeSkMSiojW2Xwmg8X0frboPMeV36xbnqtSXemkRpK6AM
 V/U/HKecPQFTheGQAAAA=
X-Change-ID: 20260726-talos-cpu6-opp-fix-14955e586405
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 1q1DBGFf3nJ_ztU7IalKFo0KDdNjTdJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3NiBTYWx0ZWRfX93GvGoY0fJwy
 x9EcQernx7yLfvEELDym5Jdnw1zySQCCmnk21Gd4EM20PkIFC92us4AErbDQMdsYgQe9rOEO4Ku
 OtpgzzV3SSqj4f43sBmOqP7EXJly9WDSkzTo4UaThXDadWb8yoqHEH5hDrm/Z8E4wmWgqhfpCaa
 KRYbwZubU3l/TL9uhoPOGqI47c8As1yUIsv7KW3ShKwwFoyQPR4syOEsXuiJx7dg+SRkFsYuMQ/
 4qhLsAFjBy1OAZ+1NGXbKEpD4/Jb0HD1xp3G3qFYx6XRoVsrNE5EHR+SK3DmVsX9kZR+g3uue7n
 Mrf1ER6BwiBl1KCiBB0GUspoGyTKyx8VXi6gF09B7xn2G0cpwootirw6ALpIvUN5KDgwP7vqHwW
 Cn6XVaNIhyNR3JhWQn+e4vImHikJTDIGvexW4BbZMoEs4biAq1d0OSSLqKs2ZtlioD8lyT4c992
 +SZIqUg//7urb6GKu6g==
X-Authority-Analysis: v=2.4 cv=bq18wkai c=1 sm=1 tr=0 ts=6a6b2451 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=E2NpRe_1XTneTphV6M8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3NiBTYWx0ZWRfX4L3ImpMZQjSI
 aOJKXt5Xhf5DQqtTOGzQ1HNVaRt/kerlTJyQZ/k7TGijVBDFcglUVaLX3sn3rbcAQJ2rFJntrvC
 ElVlxFWDm/88/b1fXNVtQgpJ5PzeRhQ=
X-Proofpoint-ORIG-GUID: 1q1DBGFf3nJ_ztU7IalKFo0KDdNjTdJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300076

opp-1094400000 in cpu6_opp_table has a typo in opp-hz, missing a trailing
zero. Fix it to resolve the following OPP update failures:

cpu cpu6: Voltage update failed freq=1094400
cpu cpu6: failed to update OPP for freq=1094400

Fixes: 44562f591890 ("arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and CPU OPP tables to scale DDR/L3")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740782c4d073f6de7866f81502116eb..bef3e2e5fcdc05972a7d3511b53149ef9013676b 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -352,7 +352,7 @@ opp-1017600000 {
 		};
 
 		opp-1094400000 {
-			opp-hz = /bits/ 64 <109440000>;
+			opp-hz = /bits/ 64 <1094400000>;
 			opp-peak-kBps = <(1017600 * 4) (940800 * 16)>;
 		};
 

---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260726-talos-cpu6-opp-fix-14955e586405

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

