Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A8538F941
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640923; cv=none; b=mUlmlQc4rRVUJXfFHwOa8Ho7Fd4fTd0kxFoKTZshnqaMyX8aAQzRMmskr8EOU6jFY6Aw7YVn6YRPdKfYzTFqtXlNzfmRpMqO0YmZri2JZt1wVs0itpd3NKav0R4lnkbtoy9+w2HYKumvzB5XxW3shR1vzsWLyXNbMOJhMHN2b7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640923; c=relaxed/simple;
	bh=BfsWCD7hTxx7YcBl8tJuBnMBQqYRlgms82Zq0fuYUag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6AXOphoIdv0BxJ7dfzn6HJ5beNMmqqTDeYZZ4mM8a/UdqTy4h6X0AuagNw2GSdyBpwmz2qaLEjxFKWsgjAy+0Ju0PT4xSxydyxJxFzYURUvTL+4YG7AzVfAVWwxk5SkZDUKpBvaupPeQ/RZQSPyWFP/WfIQ25X93977kD1YdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoY+oKxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QR4+H+tH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoY+oKxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QR4+H+tH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOVaM2543620
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oQZQNMndCdq
	B1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=; b=AoY+oKxNpvlWd+RGp/nPpjwLuLn
	xUL5GtmCtf2Wc3OFcOhLeIDPu1E6w/SU9gh60aeEPbOdGv5paniralGCQgRmv81K
	M4JBClYL4FJ+fE+tC1DrTvUZ+23FwFGat1fMFYLxCQZ8GeERtu/gp3lHXXrVbm+M
	tDWVSXHx7YQKdnR4SFTHplVQEc9VCpJp9V0Uwd67SaFepLV/Z+qyzL4ZigJRDeti
	1aAlC5z7nC8kfxPvlfhXqVDVguKlh5LW58SIRZxgXV5+NURmwSMVWkPhjsCZ0kEn
	L6oSszSiUSRJiZFVq+2AogEFRLBmN2umWhU+Gp1XCyQ1LyLAL9njCS6NPug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct33m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c69f08f527so8728875ad.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640921; x=1782245721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQZQNMndCdqB1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=;
        b=QR4+H+tHl2MWwOvZ1UJ2fRowyHL8MwkRvFGxuh/CODnJp3lTD3afTxC6kNei4FmuYp
         AvbsrqexO8Xw9EwNRRfnjUUZfax+wsWVgb6sKrpYpkU0XzvrysftGIMH/zlbx+3Vsxit
         ukhiaU4A+9Ky0NN6ve5LPdnl8xw5ABGHBT4fVhNajjVwMBhaufrLpGVx+bSF8ZIIfcHB
         NKjTE9yqxbIyQAjrBrr2jE7ZeyZkgZbj2rPb3fBpS84R03cyP/Pc8ZdZVtb9yQV/fWYu
         1fj5d4f8WFZirqpwz+K7HyYEhmlr1o9WIVaFwl8UyBUE2UQPWjg895IzVMtSMfoIzMCR
         c2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640921; x=1782245721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQZQNMndCdqB1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=;
        b=aMrRhd3INh4TkNbhBXJQu6JazTD0CFkY0lTAjkS0njQlgbcpdZcoFjO8JHmz1sKK+z
         e3BbLCEFh0GP409XHWwq0SEKG+dkTVwCNGLFhx+m2hnReTd2Ft8m+76DOwvNr0yUQOQv
         jYpaT0ql0qKdmewzWy6oI9na5oajs7rUyLOU/d8vgYmpNBk/dg/q70gCU8IEXGEHjQXD
         XnD9z17PDljEqNH/Dkr+BQmON2zEbew33LtvfoC2NLb45o9jM9NiHFaTzjfl76Wqx+/1
         ggrg+4/ha/1L5+FQEt8Ocn5SgwhNKLzdsyKtVfCmKth6s1Phk++M5Y+vXvoBG+R/yS+g
         FLeg==
X-Forwarded-Encrypted: i=1; AFNElJ+hP2YBY8m6ouRYAo0O97vTlhFRTaf9Cd9FBPdZUmPSzrg5dFZD/GVoOxBfIdbTEcSfKj00k7qeRwtL@vger.kernel.org
X-Gm-Message-State: AOJu0YzHByEKJ4B8pDRY9s2FrnbX7ssdZOLLCs3r09G//ZScop99Ka1b
	wykUXgUzYiyom2uWZRjNWAc5wDIjWiQPATNhpY+ahSBSylc8LN/ZxwITwYXXfi51Euc0vYZL/hB
	s/VWkpdA+UAyh2YNfWPxKOcdUZMBnQlBwBJFvwxU7CcB8FGAOLnfUCSSGow4VcnWS
X-Gm-Gg: AfdE7clXGWKy14pwiKFzmmHlHAvWs8P4r21CPvpNIvklGcjdzEO22ANupw6d1x7Qr5Q
	t066L01MSZ6a/TJaIhbWG+m72oqgnOSm4drmDQHzoZzDanCNLESGqWdwOIOXuwqwDP9Ig9hTPll
	xtL7tSIRNBlUTLUxMvmmCyXX2Rorxrqvs/lvZOpeO+RKfiNDqphhcKSvkgb+c6aSxXPcXAYqSWa
	vrRYTqloU5iIGvh7ilb3z/1rV7ke9vTaLkmz9R6tDIbBs7pqogIH9O2//gk+sTlNjwu4QdoWYxN
	K3OfJW1UWQxoW+xQ++GcstDyb6viCAqFAl5YEB5CG7TPP4wBz7Ho0gf3mI+25r2AXTArJvRJ59z
	W9fXAEe0Sslhh+AReSGuqAT8cfVt/R63jqnwI89kYobOG6Xd0/qMnPQ8v6Q==
X-Received: by 2002:a17:902:e548:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c6bc0e999fmr4915685ad.20.1781640921049;
        Tue, 16 Jun 2026 13:15:21 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c6bc0e999fmr4915415ad.20.1781640920601;
        Tue, 16 Jun 2026 13:15:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and WSA885X-I2C drivers
Date: Wed, 17 Jun 2026 01:43:15 +0530
Message-Id: <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a31aed9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Y4Inp1xfyx_JXr0qu3kA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XhcJ55be5IO6HZCPZaq_LybBUnHT8BPa
X-Proofpoint-ORIG-GUID: XhcJ55be5IO6HZCPZaq_LybBUnHT8BPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX2EBXT36ZgBlw
 cfwlNPmSV6tqxZiXI/AylpXFBhlc3EXhXa+NKzoHO6pzwAM+453qUODyjBrKtK5cXV0GvKBZSP2
 rxZkigzHImXkT8dH157URyNNaLRH0a5alpsBKRFqKRc+stER6HpuZPd8utu4n89MPo+JZRfW4ih
 t6hGmuKKRWCEYtmZEREzUCs267gB+J0GbYA3HWEQ0xFaH4rLEGGFCdiNVItnEHpgzQm/wkNa46u
 BobuBcFugjT0PGpKx0v6G4W1PggEZSM5C9hGRD7NKYGiBvFs/FzAZgR2nJfO/UlWzW9zsWMetR4
 89z/gSB3z2c3Y+hMONXSchEyZw1h6q4A4rs8d5bjN4B5+abuePTxV7WG0DXwg9qN/ylA2rXRR0K
 dNGiYpoGrG/y5B0kaIET0W+Fmn7UM/fnTTG3Miw9Ctz5eskmdtC0+jyA1YKTO4wFScOQr/VIIQu
 74/Wa6BwkCZU1WXy+HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX4yu16BlpTZ86
 XgOwN2zcJ4aopxH6z0vYKMONtltGFW8sro5KJFSo7O+hPw7f4Ui3jl4nmRckpUoKmGq2iNkAOVU
 nH7nHQBu2v4EI1/FQLYjD6ApXShQuuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160205

Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
arm64 defconfig.

These options are required to exercise the Shikra EVK
audio paths enabled by the preceding DTS changes.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 271589322efd..067f4ecc05bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1099,6 +1099,7 @@ CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m
+CONFIG_SND_SOC_QCOM_QAIF=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
 CONFIG_SND_SOC_SC8280XP=m
@@ -1175,6 +1176,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X_I2C=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1

