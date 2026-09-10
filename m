Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1A384CE9
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082257; cv=none; b=IwpfYoLKPPRgd6ze4v25skvYnwkxMPPlufeEEoU4QsYguvxhByTx4W9j/mVD7vwlr9NMoiDixERMzHX80N23JdjSsL/CP5//4b0dcMgpIl+WL9eZjh4qOoCnUy4sxCgVehedip9+wnfsWW7Z/YOeABYgeujyFPjAiDrR9GvtAcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082257; c=relaxed/simple;
	bh=3F7NPfQgsBWC+krUrJrikvhpia14WuZ4NzVUTU6mH/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fVo96IxIqvJq0HJ/M+/FQGnuu2L/oqnYiJFNRV1UJyyGNXP8LQjIPDwKxJlD64n+wYNb5UnXKdTDm7fwyuG+7z5Jq8/LT9h2fXNPOwak7PDUheBNT9r4DR3LEVXjU3rd+JmZeDioiUcj6AtBDnGesKjz6A67pZQ7LXFSE8lQ+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWHk3mT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CT4RsaD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWHk3mT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CT4RsaD3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AMp4wp2677108
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6OvTwdyvHS
	f5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=; b=MWHk3mT/Stt9agPcJufyVA8+JYa
	tKAy12Ez7sb/PCD9YpcpYWxVjnSmoiNdlfMbHW0MnhQfOBoJqhKlqSwFmIEDrw8v
	YtZMsPt8aXXh6HFkHuIWMi+xwz7Mk7AOKzzb7DWBtkasJ0v/VBZMk4AHGvUqDs37
	tC8Je8e3+jC9nRUUdd7uvf8VV3iviU9ybhP50rGh9RNprDTN38udaHQIngzxEJbo
	ZjzPPS36gz4BcFojLduUW1eNflPpI9T0aCgG+UPw07SEV2yx4B4QrWMUxxDgfoI+
	ob+tzXMCg/llKHoWeHy7kF5p+OboEqz+8m323YlQXoEj15c7FwzidTMgkPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q402m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so4517975ad.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082254; x=1789687054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6OvTwdyvHSf5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=;
        b=CT4RsaD3zRN6fjRyQn7FGkSOdq4+hokklMiIi0SeCK8ysYSVJuA0Mh4/ZqyRtHUemW
         vxF2W7sUh+z6BR9kEGaR1kt6tQEp+9/41ptFnqogklqjcZsbKinKe8lJ4n2OvqxfgkP4
         hj71rEN6Y/FfEbWkh0jjJ67n0sWphslLKG2lv3l87lTu0+WzMOoe3kotdgM2qD74wyQX
         NVwiqgn1tJIcd9549a2cLl3vKOwkp+5zKL6jo0eUBuPuxbvwm3GNkDM3Nhxs0a2BheVc
         4f8YXoslhOSX9lm95B27AX2ZtQGRaKKvfkzPaBOfH2f9EpSb5KuEcjs3vurhmtRRmq2L
         oSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082254; x=1789687054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6OvTwdyvHSf5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=;
        b=Ityy4tZWcistac34Jb122TUGzLo0FR46Hsa0M+AjWPo/4fIjzHxlNs7ees6RlfQvZ6
         XHwccBHEjzK2m8jHTUIN8nWmF2mwkiu+defDX2Mbr6SwK2EG2Q4J4z0+6KIo7zR+7GFx
         DLl1CYM9mOTWPdcNw0UkUnu03i5SQZ85Y+KCkZeJ2yn5C++jAnyrRPrKGNCUeNqlm32y
         9UZXohhlcTcIPycFpFMsgJBqOplJzgLvyuG5qcwatJHWfgSEIZEOxE5kRPJ2M+TRCFUv
         +W2bCyGX+aSuPNMKoiXMqTwXaF1bGlVZWsUp/n1hbekKQHoG3mcOLZrCPaW3R7BQ9gYx
         JHXw==
X-Forwarded-Encrypted: i=1; AKwUvByR7i3GviPXwySQKIF0pEYlXN4OG9aJjHNE81x+Xxlb3lExlYgnmQVIvYn69XmGUfyIhyG3IwQCDVVT@vger.kernel.org
X-Gm-Message-State: AFuF++nJwGiZoB+meZ+EUfIyCcRjEno8wixBcve1rU6f9urDYDJSHXUV
	yKUAx51OmT+KIizAmbteMGrwsYR82ng4/7G0yssBcElF5nOrOyWnfk9G+rr9BDlbg2IGRmZwp+g
	8Cz5GRQ4RaNmnv7eYggvjZpgvnzoQcBAsw4ZX4wgHi+K/V3VEqE4Bv2g36CyPjJRE
X-Gm-Gg: AYBFou1zH/+/47Ye2wVPRzm9kg1hXeZvR7gU/oscmLyIQF/iQfSzQTUzgDDPxCQPd7f
	94lOSSOvk+BqjuXCTUPcxLKnAl9XjJCQ66vITBhqdAC6/wD7QdDxL9t71iQ7JVgXFIkYylfSQcJ
	qi7gvhpf553E0ChOWMUch4QySTJCiyD0Cpt9bS4olO84baFY6/fnh6mFAb+Z2yFhPpw1C9G9SFX
	z0aljoCLhUjoDzIM5WueXym5Exa7szBJ6mWvDOdcOJ1+t0Qk7Ui7lvRBaJImOtYQjG33gkD5MMU
	YJFB0P/TthGR6JZtbi/iLnal4h79uC3Byth3HOSevvKTv8TDFbqrnUj86ZEhzEtSl65zTIXjfd4
	URyoyvgf74MwAF1KtO5pW/BdGXX/alYQq6Y5t
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr35020065ad.15.1789082254242;
        Thu, 10 Sep 2026 16:17:34 -0700 (PDT)
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr35019515ad.15.1789082253829;
        Thu, 10 Sep 2026 16:17:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers
Date: Fri, 11 Sep 2026 04:46:42 +0530
Message-Id: <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1MDmekjQc-7Gr8mYcr0FGyXhxFDPJszD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX7vD90Plgtx1O
 KwsgYSx4cg7aPl3P6DGF4rQmRuS4aV8038OawzKC9ddrN7sjlRwfhsfaSq/KES9h8TI3qzrodWY
 nVRZT9DxChEqFLKqeBmqMAIoJ+/V63M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXzcIsxkbGFQg/
 lYbkgMy6U5BixPClE587S3/RhsnVIq/wt7OKff/kXwQ2/kzXT42jJWchoLGTGJCnyyxkKHGMRxK
 LfEUeRkv3z7GtOl8tEWKBxiFTGGRFGd7nn3ikVPTXkkzEEpV5pCA21YBRmgeh/FfBPBhth8tboO
 s1pBGQlj6rvKqj6mye7mDFl4or3GF+XuQy5BnZCguqugn8AbPT5jBuqHHWPrG6Ixv0aix6Btw21
 hWAaNuBXqhMTl17LU5/RPat6t7ko/KZjR5wA39lZ3JuGC+ARQLhYZPyIeiV2hnzeVDgYzZ0efvA
 tSu4TRfTxbrts4ASMdF16Qi08G+HTGmd/XciKOWU/i27oDe6fXSihVRUqstgnnAbJopd3AQlj/t
 avtIRX7dABIQL83ncyH0TJdQF02tOJLDjbmEEo4Sm+pcC3gXF6TwZfdCzeTyB47Lwwj5A75i+c7
 wKEoJcKxD+qV0J59Vtw==
X-Proofpoint-ORIG-GUID: 1MDmekjQc-7Gr8mYcr0FGyXhxFDPJszD
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa33a8f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100293

Enable the PM4125 and WSA885X I2C codec as modules in
arm64 defconfig.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f0947c8176a1..e8883d1c8b17 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1163,6 +1163,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1185,6 +1186,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1

