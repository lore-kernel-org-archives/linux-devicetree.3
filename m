Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4013CC7D8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369306; cv=none; b=uuYN48c3ALDhzAzn+EM1wJXMiDtUEXMI/yKOybomdvILeWbEJPx4RWunDyOmHuOCRRF+z5fcDq8ikI30837esad6gFC8fgCUah0D8wVHt/X88zQXRDfSqHjlQSWveOoC2UX5qIWlUwMSZpof5mFVUZOsa5oBZyivV0zL3cP166E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369306; c=relaxed/simple;
	bh=w/b734DotcB8eJ+zd/qBpZneLKAt0Ak16IfGEt4XOKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0KS9b3i4v/+6B3/Kc2Ypv+Gz95bXosB043ibEnvVu7dVIVwVFhomYItUBKM5DqKBcfkHqjPwyMbR33emQ19s4pbaDitY3MRDk/a7doGlBQbzcBLZEEzrF2zCePT8GdQzgYAdZ8/+aKuULaUYFaHQzq/vjpTHMPVmXU6Mf90Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckUqmnXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c02dym8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckUqmnXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c02dym8v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ij9p793264
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=; b=ckUqmnXuoq0xWzrq
	IdXqsBpQ1A7+tFRJ08kfahA7CLTUA+yi9Q8yybHawiAV6hPGrxJjjoLgYyk26Urq
	TSUUsqNPAoO7PaN1d5nEfy7u7Z54964E+a5yN/aUygiUVJ0+Z1djh61tk4LkBKVP
	O+68+RePOv2WMdVFAzMzt9bXXlnEXFRymLUDCrqYFXC8FOjWxfOt59cEVPYK9gnh
	6fDZt9w9OHQgZ99AWsUdFJrfiFT9OAy6AnpWcaoaQX2HNn+8VbzUtMYbCJ+6GT/f
	j0l5Cb08AjGSuuNYXAJ+plpfAoZHG9LexP92JW121XzsYgY9Wc1FgJtD8cJuYJo/
	4KQi5g==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnd3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso4766973fac.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369303; x=1789974103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=;
        b=c02dym8vmbIymFI4NbmqBIiQQ3vF6oNn0mWH9wvL5KfQ87PkcCcvM40CHxyuE/7HdC
         PYEEKXw2pMTps26kBNPWbgbti5eZ7eyescTBb3anm0vY02Ie/6IhHmwDFf2ScTfkZBpQ
         Ih8tqbPyXoxRy8I0ynaUba9WcZwrpeufA6W1nEkUw/7+POaiXdSoDwKojS11GJM3eHNV
         B+ZbIUNVQOmVvdFKaUvHPMnDFdqMLgmNs0YCF0+Pn2XuGZHMJfcykTniSM7G8Ncwh1s1
         XotCIxVW9nCztmI4OVbwfIdaBqaezNIbce96v83UP2dzhqkFtTyWqDEIc+JbeY7pM1Mo
         LQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369303; x=1789974103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=;
        b=VpqFqpxdTuIpXL3Jq670BmD+ucNv+/o89GYWNVTDvmrWt4IQQN9ppMm/PrcSBAtP/H
         oGeZDk3qf2qSc5H25L0wlX3XIVKsi5EiEAUTQWILalKmcmo+tW/hfQFjQqIcvgVoTZGj
         j9VZA9/EA5Qr+MuztTrpGaBtyzx0VNhZDD7SWN24eWBI6nIzH1HKzU8UeMy/77O3iqSJ
         XUNLD0gk+pJAols+02hBtGMp4bgT2veMZKX2l7DvtZSsaNyEFh39cenAJv9GljAmoP8c
         DSib5pXj5U1/OZtSt5SMP+yXkDaZ4+uWupjaLIMltw3ecr4Mb1Y3lT26SCV687z/HdIo
         Wiyw==
X-Forwarded-Encrypted: i=1; AKwUvBypCEkXWPY9810aBBOmKt/dKPcnDQwoAp6NDfslUSDuhoGv+aSUUkBxfQ7ZFoe/K4WUcVwy4npUgZNU@vger.kernel.org
X-Gm-Message-State: AFuF++lpsCr3tbqmj6yYGLV3jAign9f9EympXACQ6UYg8y38XLXQOYvL
	+2kRId9lONKnlFGugktFXibG7238af6Aj+DeMjqFY1ge140U4jcNtOYBBHs1KBas6634An9wON3
	MU2x65zo2C9dFZyf+cKQm+QLAlXKcA+aStrw0ueO9LKPKkqKLmd8UdzISvH8948Zb
X-Gm-Gg: AYBFou3dH2gxCQ2lQzWIKFv+16TraWwQj7/wKLPmYaIMlurNc9w1QdKV+wI7P7JnqL9
	io/T2s8tLBCHrjSgupjPmNOlvfU/kr7+5RvxLaQgM/eMIi/E4BxJiuXRepsmzzp2UUxbzc9Pcwb
	7PQTbACL3v7TWE5zeR6ZBUb4AWMPGU6MH2sT8QdQUlAp3JoZO78qslyNKnkKbwTY4xryVE+R3wL
	UxIzo9SYSh0lg8sWer7ctGEoZxKPpwt8T1Hjkw8CgFapHPyGAb9S6uK2fmAyMYM/lHdBen7Hgg9
	ULgdYvD8k+j8Asd+9/HnCpMs8pbAGvdvhD+Cz3SrucbrzJZ4hU/65fbVzI8uGf0u95obQoyDIpv
	L26yWZJTsULW7LNs4IX9cEH8UoMU6
X-Received: by 2002:a05:6871:2b06:b0:475:e235:905 with SMTP id 586e51a60fabf-481fa35c94bmr645214fac.35.1789369302965;
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
X-Received: by 2002:a05:6871:2b06:b0:475:e235:905 with SMTP id 586e51a60fabf-481fa35c94bmr645167fac.35.1789369302570;
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:55 +0530
Subject: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1489;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=w/b734DotcB8eJ+zd/qBpZneLKAt0Ak16IfGEt4XOKE=;
 b=Z7i1zGwGgXwp547HldAafpO4c8NsnpYQizqQevLpZMjLISWO9vwtBy213CGUp84oeCgWo1B+I
 zy+Osim+KwpDmd6/vgapJvx1UiSw8W2z/ITyY7i54U5EGqWBpGHpRJD
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXwTnCaoL90If0
 06it7C2ZomLQuwDGE6fOcLKJ6OdZpKEEn9GvyeKSJ6NfNC2bbgk2XnBLAxWMsZoaAD/FbfCPnRj
 rNbn152rJnARz4eHfPZDacl+chT31y0OiJwS5lEmrLpNIeqvvp+V/RciiNsx7ZR5lsW9W+0HboR
 v6LaQLsY7G5MpexVE92bnzzXGfnnRoYLT2hgD5zUqWL/PpOrfWrYUz7RqY3WP85/vAaQOPqTVT0
 aHSEyISStEFpCSjW3aNQwvLen1J4i6ZegpPw9tBzWa5yxvb/gYK/M0h/A9Yp38YGDLyEUyX1V9K
 1EWra9YYVDdu9cHFk5FfJijK96UN0hepXfg+1z/XPSqrS+e+lbrhPIQ8GdDzsw3ldB/i15drLDX
 O49wDamYVQl6OqqgEVIzrLEHDBdJnSQqIvV6UN2FZMampRoMlpTbX82RLqohyI0YhbacNYd/yRc
 gtZmcWdW8J1zwWxt4wg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79bd8 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=G1H7ZIpW-Owx5wkvfsYA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX88XEiBilNiYG
 NZe7RvpuA6iMJ92NMtVCul2a/h5b63eWQNe4PZ4TaEFV8XFh5WXS3kaCeLWurUYCTYklIBbRPzj
 SS+Pn9Orz36wZoYQJ1km3cMM+Sl15V0=
X-Proofpoint-GUID: GwVLLhJSsms1jPH__4DRcigegnDzg5jx
X-Proofpoint-ORIG-GUID: GwVLLhJSsms1jPH__4DRcigegnDzg5jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..89b78e96bf49 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -205,7 +205,7 @@ idle-states {
 
 			cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "standalone-power-collapse";
+				idle-state-name = "cpu-pc";
 				arm,psci-suspend-param = <0x40000002>;
 				entry-latency-us = <130>;
 				exit-latency-us = <150>;
@@ -218,6 +218,7 @@ domain-idle-states {
 
 			cluster_ret: cluster-retention {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-gdhs";
 				arm,psci-suspend-param = <0x41000012>;
 				entry-latency-us = <500>;
 				exit-latency-us = <500>;
@@ -226,6 +227,7 @@ cluster_ret: cluster-retention {
 
 			cluster_pwrdn: cluster-gdhs {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000032>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;

-- 
2.43.0

