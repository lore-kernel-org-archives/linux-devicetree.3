Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F434E1414
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646138; cv=none; b=N2z9RY1RXWMmktwZfztHo+Dx1kPmuy1Z+yUSXwHfyOcE0RTpIJGCf57dpxgZ/SLet0FvaqecIDG0KfjMEydty8Bqt4VlIqbZJrbWPP7brdJ4hb73XSYse7gvDl7ZDZIdm1AL+PrwZJ2CCuJxFLLkUFfpMBR50eaajTywCqqRi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646138; c=relaxed/simple;
	bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L42FTXxK2oNE6vMTuB4BTZQuE0Te8p9ioY/QXTMqdCSAOCsgAEYeMMQ1FDR5FO7Pfcl0dP/tY0aQe3U1RHeVQnMTA3OlKnj8crtgh1Spd2qSOeSMny3JERhcp4yofre7QD/6wLx5qpNmpF+ucm/nW2fUST3UrGyAT0I8+/J9LWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fi6JniP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OajS7YH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fi6JniP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OajS7YH0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVKi612887
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=; b=Fi6JniP/uKE4fwho
	QcHpVVAyhHCVTq+C5qIaJgogxt+X6qm8mVM7v4ZEe88UQ8fJTmCPhZgcW53uXyIn
	3b58OjVQiVxtFIGgUbuawkh7QW2/doZuJ1n+9CCPIAVgfujxJtPPpDVrNM6oTrSv
	J1D0a0x2JbaKwASqIYRGiyysNslHAmOIEchwB2yIfdyA20oPQ/2dgHlYk/XkbJyS
	yk+dMGSkZ2XxjEoa1mljmaECidn3jcwKFcX2Pni+1FYQhJRRDE2et4xzZygcPFkc
	7DNzFUfwW+PoZ4R1XnV2UrL6X+UKXy5HEf2uSpSzU/N5t0nubeqAEVrDGYsjqp27
	+ZYXzA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rxj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so871839a12.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646120; x=1790250920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=OajS7YH0hxDnviZ6ZrNZSBFS5ZGYD924hPa6vz8XoNJzPwH9ZhDeoVwG0hghFzbFiJ
         C2vXbXwW/hXNQ3SMo7H4YBd/EZ0Fd+PmY8z8T+YOsJddqe/hyPxVMS8rnfkUabQ668uH
         jASwjlIhr0m8rfKQCY/yTqXGN/urRms++//1UoFLslN/4ANwMvodXcMZrMbaSmtewGxB
         asy8y1Xykc8plrLwd4/VKka1/GQR2RQ2w73TWCIicYJLSes86kXDWhLw2C/sKJsCLjKm
         tysDxa4lsY/l4spUTNq0L+R2HoCJvD0Fglacmn3ddsfydQBwYadCmK4wOZms5FY40C3F
         CHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646120; x=1790250920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=tHdUL1nRJcLczK+kgRNpwJRtHATSQhvZwoa8C4uloSRpZZ5wRPUW1r/PyiNSIytcwS
         K5CPxWSzi0gJXZcWo0yNmYlsMsU7DBhqXidk7E4nzjs0dgXjXAc7ZzNNZNR+sYmg3F9v
         CPWQAm2hlZRO5CA+kwHWzvoGSECKBG2D/weU0TDEE4SnbjueVTZ2IufRzQP2ODQpXrlM
         P/zjpsemU5qZ5G8uuLtZcCss+EGJkRpjNtw6IIAdrTfVB5o4yb71NnkuCro6YGy856Nm
         aW8qBn3hwPUyVjxtFQEb7AMzisl6qV1rr2zMRclKuJ+7aBAs2n5aAXrBDV/c+4dwEcUp
         DXQg==
X-Forwarded-Encrypted: i=1; AKwUvBzPqQNPTgZo7MjHUroysZZySSqzrc6IaNS0bnGfiUvBYNbP4ybMIGZdUYKIlOFdIfeK1puqx9v5iyFV@vger.kernel.org
X-Gm-Message-State: AFuF++kmSpKM5FUBuVN9bP0i6yBvd8+ibRupygvmM4g/At0/zSTC/7iA
	KEB1VfR8pl5xJQPqTObqsRbtDv0LLrzMVIt2Ek6po4zx1XQBh3OPN0AmFSzbHN5OKriTffEUtCm
	977GZTeXF5itN499IeLSXnkMG1MlxrIsFYyFhiY1kB04shdbRicUA2hX1EMoipOXZ
X-Gm-Gg: AYBFou1OCX2V3MIu5tWMEPTPhsAdXN/1XB1EoGq1XM+8GqQRaZGm0/BfPU1ws8fDQWo
	vUmp6gB5fheKiBLICZmF18q1qrdUbORClAlp4uZ+qq9J+RJdbiUobQPTZ4nhNKcjue6mGyr9RfC
	CJywke1F9pQB9tHFiaBN99ch43rpXUbEifg0mGADpnRb9REIgKut/WA0wRHfQtqOGQeMt661Mxs
	UPbr6SoRjvV54dW4FTRGpq1YrTPSD4M+9E/dwYjAHKB1xYtliWdZrNUhgVnhtEd5qwuB47LCQjR
	oDMQ6VOyJb//ghpzLNbcgGXSFItauVUW+XDd66J+BUADIUVy65sTaQQEOFi1OiTXKnGZIuf0FaW
	g9xcocMxdt8wMvYq7hY6MOKWbjmWdz9SrmQ==
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3dd5f5e8c0bmr17137929637.19.1789646120319;
        Thu, 17 Sep 2026 04:55:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3dd5f5e8c0bmr17137846637.19.1789646119776;
        Thu, 17 Sep 2026 04:55:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:19 +0530
Subject: [PATCH v2 11/18] arm64: dts: qcom: sm8750: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-11-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
 b=OilxmmyIs5BTqVQhAhlpEscfytOalovaVpvmaIvQaNtCr0JkHwTgzOja7V+OHLrEJchM38i4v
 ougO3Q+sa6yAKLviQYX2LTNG71i7QxzO2lzwQ38JAI4rwObd2ER9mVJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 4tqlcTaD87O8oNV-Shwi5V5jMGr2arCd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXzednDNOOKnpo
 3fFq1uRak4Vfc6HU2G3f44NIl8i5IEHY/baSVQ5uWiNHeBTlkfOtzesb4ZL2BTOnYGIKFUB/i8R
 4EXG8buhIasobTYTodbR/8VhUfFT1YA=
X-Proofpoint-GUID: 4tqlcTaD87O8oNV-Shwi5V5jMGr2arCd
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd529 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/9FX3XZJeDgu
 XkGFyhbePhSEJa79jVslGXQZItgL9YMEjWanskYeWT0F1roSqTcpfZqWHk+qLbpSk2gt8YsGyek
 8PdSjFL/+4yR1ZGTopNamgqFZ+FY6Ctu/wRUjOx1gmy1RlV4zjptwT9UUYH6NaM8qrl2G4R+7Mb
 0PZC+TCclzk9438hGsLYGvZH3NwnPss3I6qRHngbP5aw6z5XPSN9ofqEHBUl/VL7bqhjhgpI0SU
 NCyr7MR6nIel47mAbjSf5Wtn30T54RqhmRpaw0m9m3KDua3sPqmRuhlHw7DZCggtd4lIQnv4tL9
 Q/lvigYkKDuCXXonzfedjkhFcAsM71HPnlOpNwP+60QkLLTnrAi3SAT1BHV35Q3Tmy+MUcg9/Zr
 rzTe3ar4yAc23if//JCagNb7y3l2Jh2x6OXoFQltYz5+boKpCzLem092uDv14OQGLp8NZrW42h7
 zo5DQxj1DEXk2wEB9EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..23476fbd993c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

