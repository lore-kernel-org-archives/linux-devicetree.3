Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3636B937
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369261; cv=none; b=DLUEr1DzY+CvfrE65oS/ElZZSsTgnR64MWiuuo2oEriwdHh4qVKzZKyXVZCDccUKMBCYYB9EFKzsPAdt9Rbi1OtVzCwNU4sROgrE5jTUt6pEtBsnwMO42mX5WV8DDX4+NeYYophpbbcsdJbvZLgC5TCHHGEQJLPLE51jotQLSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369261; c=relaxed/simple;
	bh=opvRUY8kvkk1bwENXTHOgraFl66sjpyKdC+ovoXQQRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oF+2QZlkj87GIVaaAa3sA8nF9+tn0S6zfndrt3rWhVoAOxzJaCr4t38vxmFOM86aRosStGmVD+O73O5/W8UV2IGVYxq60M+owqfr7iKG+K13FXrdv/xxZzS7KMkh4x5FZh6paOtEvMHsAPHOsWMG6Qg2Sy7AlRZnWcL5x5oA/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ri76cYp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7z6Q018; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ri76cYp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7z6Q018"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5inNi4057536
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRuaoIWYFJogibI0Eo6vzSQnslysZ7WXMp7hlAqc3X8=; b=Ri76cYp4lS8gILgy
	i/G7sdvIUNf6R5JCaSLAg6Nq7GMS6+TX9Jxf+KR9v15pucWagQcDpwo7/bgobvFb
	nKCCZDxzwc4JuUBhCv3AyxAp1iiWT7G2jAQOpeLDBaqDCyd97svaie4mJC0C21hE
	9UBAUkJAMUU/KNGxYg0xIRjGFEvM63X/Nc/aZb+WucBT/+VA4TCHYjHMN4+ojNpP
	LDbZ9XtrClj1ATdqYtVk2eVMC7KRwGrwGS4izkXZXeXanWGVE0ZjTklS7KDaB55a
	y8uN91Bca1IUstidaw9oGZx7xfqTcOd2jng/3drm/1n/lACH+rWFxCa8QsRlLG9W
	akFyLA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss7yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4260319a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369258; x=1789974058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRuaoIWYFJogibI0Eo6vzSQnslysZ7WXMp7hlAqc3X8=;
        b=R7z6Q018GGsp3YJttFaFOPKSJSB/xhNi8LAmh+AaSfJP3KzYo1PgwRHytC7M8UAB/z
         xzTL1ED+qyNZ+cD3ehLwhchFq9GG9PyrCHeLs63+kJ7w91pnExfKrN32BOVQerPwV3Qe
         rpkeJXoNpogJORztbC2QTyj80wLBOZ5qsuDYZoA6zMj2kyVvChzZMwUg24F+bmFcz5xg
         MG6eCWHNuSfpf2NKN39FIrAd3nL7pXyp5dE1XFxZok5IbHgR3BsU7wJD/UKXD4UggKdQ
         z/xhdtUBXml4LKs7Y3erKWrCFki1VsAzt+Ny5aLV76B0GZMTNHiYE6MLt5G70XQhZ8Xj
         YbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369258; x=1789974058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRuaoIWYFJogibI0Eo6vzSQnslysZ7WXMp7hlAqc3X8=;
        b=TD61X43m+EzTGCn/0AS4ngdKaZY/rxmGPhXFOJO0qaTEEATOBH5ewXC8YFjpYsSUub
         aL/fLruQ/01Kl2TEcqOjy530v+NI59F5787JBY1BSLvgYb3dmbAVeRAp13IDQ4aulUWo
         1HqSrbCAnRm/MwmWdt+kU6qtHo4bsCzGq+YIzxUzbMRTCmvn13Pzz2z13hx1ydVdw9c3
         AMfA/4ruwVlLcfe6wCqVEOfHqFISZRHSGyOzOv5oQxbi8JsrMj3qRiJvPh13GhpHzrtH
         QzrD6kSxcoGJd8+lvPO8dpVtjILSe3VUhmW2QA+rccSPByqq39WxOkkgd04DNMVdiOc/
         uhBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd5iLEX8hlV82y86Ggi/Htq5y+CPu2hKHg/A1pQFesk4AAcEzKUjtHdnXM+eXnTLdQKq2ACW/Usdmn@vger.kernel.org
X-Gm-Message-State: AFuF++nEJTqSRbLi/+RvtKPcra2W3s76vPZA54sTfMRgJQ0lfEafS/eV
	GXxJyDM/JwnzS5pFMGgiGkkSbyKMaJQWS75lrewbJzVtciMfQKkUXKkA/2Z2G4pY18uVLmu16Vg
	WBBAYajlRy8R5dut1n2I0wSgDxyQabsLuW6E1Po3oo3nLSNmPqdbLShXq0xwR51nD
X-Gm-Gg: AYBFou2h34EgsLE1ZVNDwJjdPRWgUFPUA0jWBRsJDWOrVzRH7e8AeikUP0qVZigiZie
	N1v/iWzuHkcb9uhmE969AIgJkx0YjyeCfH/3/oknITVf5CnT0xD9tRP7TviZumV9EJ+VUM23x9O
	P5/SmzNyfTPUHofr9XPjbAA3x8fHBGm5IzjCynuLGFHWviYpLqOUH/IlWGnj/YrfZQ3wOrYTSRh
	RlO3fJGKUySZ8onmBnvqISm7ur6RhyedaOCNAOfVTdQVJ6pc14+MrnQHrkOFlAXpqPVAQzZCkSn
	LeQkpeqkNbJiDs5YoVE49URbAIb/UurqRtzB4AQvJ6Qr/tVFQYDuJZvCW+WhOSgqjw4deQ1y13t
	95hK/XyheYTzU9nb5BAxr3swl6JuW
X-Received: by 2002:a17:90b:1f8a:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39dd56bf8d7mr6989999a91.24.1789369257608;
        Mon, 14 Sep 2026 00:00:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8a:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39dd56bf8d7mr6989925a91.24.1789369256948;
        Mon, 14 Sep 2026 00:00:56 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:56 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:46 +0530
Subject: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1607;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=opvRUY8kvkk1bwENXTHOgraFl66sjpyKdC+ovoXQQRM=;
 b=VR+OwShhkZdl8S4D/G9Tda2n5HSr9DzP24y4pj9eDfeu0PqpeV6DoG7UolIaha20AX4ShxLSE
 uJE7/y8XYwmAKHyfrdZiaDYCIdyt1bx+8TRWVF3YWE/7nXiBp9oRtuR
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4uKgk39ZhtSZ
 gu8d0aPRx7kmW8PhShKZbwgrCbFYpCNyCqoRF8w+mP2QaIdFV5p/jAQe18fDSEWfz+aqknmEunG
 Susn4luuIs6KhOJX4e4Qz+2PoMGDZMeoYgn89XmcIsTdneUHjUg/yNrTRFhKYEYUz73guJvCjHH
 l+bN4J4XrbdMdY/tLa2/5+sKzk8WoDDWxPQLBVQ8aE4Kfme6+AhOC6dkK2/crG11BXtZBsZz6Io
 UCU3DhwNms0T4vqctgh4iX1UPQ+d+kVt1ynClKsJ9l4mFrvx8vU92ik2HNq32vRm45J0YsOY5P6
 V9SrIRbbCvX4gLPd5qwWImBqeetci8klDbS3ufWO/XkeDBw3zTBhrVlt4errRVR0UsXC7qGyIzh
 2nhUGnfO0CkvJcjDA255RE6hYwb6AEkn6oK0/b6hBP5UcphtEf0cfpJeLRYBup5Y2Gxnjb8jYnc
 7tUFbzC+T06iXW0PtBQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79baa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dA25IjVxQEbglN6TvAoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: j6Z7AsJAoGFHivlAj2JSyTDxNv2qVEGn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXwzzMWTWXZuoa
 igy1nVDlBbRxVn6gKi+h4YP2ShY4PM/t/sCXFRR0zQkhR7zi5jO2597/0orCJ3Mxq2ZLJ+4bzYt
 sAAAEPU9FSR8gNZQerPNr9Drib6cWeQ=
X-Proofpoint-ORIG-GUID: j6Z7AsJAoGFHivlAj2JSyTDxNv2qVEGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..57b90b62a53d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -341,7 +341,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <360>;
 				exit-latency-us = <531>;
@@ -351,7 +351,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -363,6 +363,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3264>;
 				exit-latency-us = <6562>;

-- 
2.43.0

