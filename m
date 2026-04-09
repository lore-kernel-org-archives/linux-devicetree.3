Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDACD3B6BF7
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726540; cv=none; b=uUTmCDDmdYqm9CUqal4uFYjG7e9N8VXxDJWTynC6/uZbuUTnPpcWJHFcZ9nvbt+oHiLJGUKqyHdzcRCdR1QcTdt7Up7MrBGcZK2rGaAK2mwDzSqJauBiL/gWir7iQBtv6HAbWxD6zQc+BGG0WTwTVtkXKsm6y2blHDRm4w/fK44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726540; c=relaxed/simple;
	bh=UhvS06E/0zxHH+6YzYwm2XqZemBnbJ44byW3vy0sff8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhXYXljLvI4y46aBgtP3bRYX6tzafJnfyU7mH5KEzk1ulaNsW1t0kSHgeyUNXzde4q0os3DzJkr6+v+McMTdRGtU7eOYd/4Ng3Zk+QHtd0uPYC+byRy031+0JTHdWeu3100VrFhYK0sUb/wdx/HpGMV0nLFuRp9ERW0d4bHQvng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vnr7Gw4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1YIeI6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vnr7Gw4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1YIeI6Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392uqgD2247132
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=; b=Vnr7Gw4gJzMFp6Rs
	vuB9mR6UHq36tz+FqJ5cdv3XoyQOLXR/HW1y4wS7pHkHsVXNDIwH9YJzdKMeLGBz
	Bfyt5m4pUa9LMAkQ39kl26lZweml45QOleGkQquWqs/uI4mmo8FBt9+UTaZVPAXU
	PdhjEAquALL24A3mnDeBEt8g8QVsgiDN5mZ26+piNk+5hfOfQkjHP1Gv2BByDJVM
	Dh71r8XmvvflBhQS4lA4KyXFdgyFI493lmoi2CgMk2BR32wSi3IhJBtZz1gLcf8F
	j8/PE2chqbV5llmPJyzNtwZw3QqMjuPt0eUjmQDJ7JdFG0+1DH6+Mtn5D5wefIpT
	hzX3Ow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6s91v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:22:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so905205ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726530; x=1776331330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=P1YIeI6YIilJegxRvX329LWfEc8jFl9lgBOMG1nM6S8paM4D4+nPUyBQ1n/9RbPK3u
         d0Dc4PjIWMXJ7dbV7kDpcGbK4AfskjdiI01AUThxZhg8qQrRRSVoM4KtxBI1sa9UrY+F
         9YP/Jxj016IOP7wIz++t6YDrdw8bluGLFrLkn9evaUr4CHgBP/2iQKSZQ7y41T72mdx5
         dXew1/Vqq/ZF8MEM+Y6Du0+4q6FCK6Ude0N3+6ajENBaYLFc19HHbKf29AbNa+xWV9Ed
         mbsg7L5c9A1+CBDvut01w/wrZoAjX7Jssd9gRlPab6IpJqYaea2EsWP3co1Nw06KO1bv
         dyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726530; x=1776331330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=rP+wOnHrlax8H5FyHrWt8gAOoym5whMwvkmOOchoLUvpLkcG9TJQsXv9nTW4rBbHjI
         FVf39sFsISTWe8KMthg+eg7QdNvt7/m48R5jv+PA4H6vl/Yd37b4UsWNNOXW82dxwEOh
         nVNhBGJbvAAWgFWx68N1V3+F5iHOl7VrIfsW2SLFnz1vqy6360FijPWpalJAR/4zUrEN
         Zeztk6Wxrpv0n33s8fDif1+eVX4RlidM04aMPSUktdQcKC6LA1P2UJIm2y8axabnWMfw
         3crq7xIJOIyxav1WI6nl8Ohhe3hZPybHc3yKMjS4LRPAFpUt4JhiUZd1m4mZ5oJ5EZL7
         xVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8AMu3VbMSD832rYo7huBe342yg+uNQMRrqZ+hebDO08r0DS/5UwW5P4xbNIZ5355kJD177T6tHEuh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv04nePM31HI/jCWZq8vC58LSfKGOP8/7bR2ewi6HgQmN4VEVc
	A5uBBMJcBh8OiVkZPdGCPX0p/1+jikMMa/322YCGq1EDwLMMkUGsA3qUfYHWiojF2FbBkVi6/Dl
	oyfMawik1OTu6kMuaTGXbMdqItrxEnSTXxkUJSNOF13LTR3VvP/sIEwr4BytZMwvo
X-Gm-Gg: AeBDievUS2CcitPAI6PV2vNCJm1TKYpvxvN4L0jkK2rL7bgkCYaXA2Z7CoyDP8SofBf
	DwDeBDFhd5M/Vq9n9rNQim92TrXuietYTfG1f2Xk/0AjbuSM9MkaxZZ0vRMQzbcVUZNiKEiwnm/
	GyIH0DTECl0+Tt6j6k+nqGIAMB8b8Iu+x3dCJzjMh04lX5EWNfiEV+ODZcW5ER092SRj1IPQVLv
	ZiKkfeEzJP1HijLOWMlp/RoiPTClmEaFPBrSBlf1vXQJOZPKIbxZn7mRwb2jcCOi2FS15xjk23W
	z+psT0b/SE3CoR4xFNmc/9fIANMBRh/FPsCF4aZzEYEmZxUERm1fhQmesBjWT3nAgTsLc3Ab/4A
	QVl3Ki4zfI9h1TPThzsMF2pLHQoaYfl+j0jN+K98TK91+FL84CmIs
X-Received: by 2002:a17:903:1ab0:b0:2b0:59fd:bbe5 with SMTP id d9443c01a7336-2b2818280d0mr272631825ad.4.1775726529697;
        Thu, 09 Apr 2026 02:22:09 -0700 (PDT)
X-Received: by 2002:a17:903:1ab0:b0:2b0:59fd:bbe5 with SMTP id d9443c01a7336-2b2818280d0mr272631465ad.4.1775726529244;
        Thu, 09 Apr 2026 02:22:09 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:22:08 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:09 +0530
Subject: [PATCH v4 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-7-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: kNxRGAm_F_gRGjk7pCiyei86AnF3Aa9A
X-Proofpoint-GUID: kNxRGAm_F_gRGjk7pCiyei86AnF3Aa9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX0FgfgivjPk3d
 hmfmrkTuHSMP267Es8rM2QsjiHQcmvxk777kmzdd2oWD5vo4csMRf+rsfB5/HRgwK7SIQGD4/+K
 QlHu8fGD2ZhvtI/9YUuWTxMDshG/RCH3S2luENUTdq/g+ZkG37yKtYr8BwFLfkRNSdK4HM9gzY5
 rpdWzaZ36DjryARO3HxRbcQqgABZ3AMdBj40QEzJiVBh/o0eH5v4VdZUSYj/vki6yEBA2GGSDi5
 RP1vqUXk9arbZ6kGKF0zEmMxU7ByflbuaFV5u+9Mo7l0WXOJAsNGt/VDY4sys1lVySNzrfqPjWx
 M7g9dj5Qcba4GkRNQ021amhlcY9SAL3LsISYjDHTaYc0QG3Sa/PqVf4WYfo7etNxMA/gtuGT6f9
 XnPAweHg0CEOtONl1FrWJQeJpOMwDQA0aP6hdHeSgit/BVraNDX+uck+5LBnVZ49rcaXygHwe8+
 8CHZz/pN3hTxi62B52w==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d76fc2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090083

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..44dc5da9805ef01b30c39ad2235f9d294515b360 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1492,7 +1492,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1

