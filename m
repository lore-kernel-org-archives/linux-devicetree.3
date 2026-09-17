Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B93C109A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619914; cv=none; b=Si6cO9sx3aSZr7KyXZvty6F8dyzpvklnVyb5JwSjnnN7mj1Of3PIJB+l+3Estf1yCJHstY97AuEijfw1siageGkdt5cu+ksiAo1MMIMpYSB7XtvHXK2uMOqXJJ8a8KQA6joeDBE4TcwJpd8o73CvUP9pD3bfjmuBk8FGi7NB0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619914; c=relaxed/simple;
	bh=8kaMCvclbLQw9S7ZDklhdwNqhDsVvgFTFLKp64qWZ4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eS++AV+VtrEAx0LtDKm8fGeJHrLZoh+Lc6LCVtz8LqAnV5HBpnt9QpwpNR9LjI8DRGXlSGbWSO/WVEiXjLmvGW4dHuxPAZdAaMyrqtd25n/AMMTBOOPaGnUaSQbDUu70X62RuKNYMQz0fwgkcnI+Zy7H6uCaCNqXcI6RmOXZdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0quwsQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZc6tP9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0quwsQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZc6tP9C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0YapL3597301
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sj6fK4VlMZisL8kp5PhpfNHu+n3mB36nthMXIo2bTEk=; b=a0quwsQJpjqq/rBw
	kDQ2Gdi0BM/T/aUTGIm1qLIRSYhFP2OotE8HIbEiGUvuE1dz3hGrSkyKiENzyLR1
	91TwdWUohmbb19wzaTXXtPoSaDOrfUHdzbomESQcxFGIQoHBNqh0J56s3JeDW4Dl
	0Qn2LO7rnLt5bE3C5/XX96HgBi1zeIGU7I7o+qHuDKiT9y+BcpJxGMPwIRoQc69Y
	YY16Z2ly1KZVyvp6LrJOc6upOFOpaQDeQGVxl9PUgkwtVMxXn+aNuDk2Iq72znO0
	4jJdQaIdCFcdF+Ff8WLx6FmqoREswMzgMSXfgg1/XIh7LLZ5fVRi4cYaTh1Fp2W/
	wzHoEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayapug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso841069a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619911; x=1790224711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sj6fK4VlMZisL8kp5PhpfNHu+n3mB36nthMXIo2bTEk=;
        b=VZc6tP9Caxm5dHNvehKR37/5NTe7K3FHSpkogg+6Mxs+pD6YsT3E+UgrfmAKgnmP7E
         vGJN58FDJEjMEHRhe1/lUn4jRcwumfkJZjYjJrdA4+nMuChH1R7hIfjYjswX9xad7GnL
         3HP8V6GAjGDHlt3HRZz+KbGdzba7k6GMvit6ZH6XRJMGyPYdop/uAQiB65shb21rEP7V
         Jnxjtuarsi4Vsn5ahly+/g4aXtVtWPFga/V0TGTkfgKCwVJNvrOxYhRba6FLodDabBb1
         HZyoCwOfmPYxRgRhBJ9ORpredwIfZ2nI+d++zNcg+ZXuaIVTWPIdymA62ZEWcTJNU8fp
         Of3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619911; x=1790224711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sj6fK4VlMZisL8kp5PhpfNHu+n3mB36nthMXIo2bTEk=;
        b=s+caueP/5+flw92FmCVAqAYj7UbOYgSXa/Tyv/n+fVSTxn0AHmY/ly9RDWK/U90ypg
         HdjWZ+69i0RG+V8ituUZBPrn1HoXMq6YuEQ/4xoucC7MYzMBKmZbcpBMDQj3XPYnPO1d
         pZvZjja1QV8pSZbbfEgUDJiIs2tjCpqArKi88MA3TYdN/3o+2v5ZUH7wIr7nKy+mlg22
         c6AdmISj1VViKsJaxY8Ikwi1htGxLh37K0oXsuye0bwJwRrfB25i+paTs9gZwDEfmDtf
         1fMt70d/NA1qsKvnqoPvuVfgNf/KQdiFswwNJZoankFdjCEkwgZKqMd1qSBE8NhVfdae
         4xrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2zvcc3M2fuCwCKP3zJTxcdCcXB5CWd2qZFNRKiF0WZ8byQQgxLodo7CBlPUCJjNgS16ek78dGO3cX@vger.kernel.org
X-Gm-Message-State: AFuF++nr70jHLkMaCaQcRrDneHV7wEY+2YWdBumfJzyOTnhMGlcktjd2
	JmxDtP5hHMPs03SFp4ZR/AwopMEzE3Dud0A6GzdmcxZr90hpeW7QYjONt2j2GjMgC/i8Z78l/8S
	TkzW1yI6jETOWrrrrREY6mn/vVJBg2tcxSpPtzqvCNKStQXFPAKWTjNDa2qgnyXyX
X-Gm-Gg: AYBFou1YLzGm8voSISlGJMHSKIVCFX2J5xLQyeRXXKh97XRmSfp14mMJx83QL/Tq1J4
	KtA4VUJq8RMx0Jq9MD4OBDLr9PMAXacIDaJUz75CqMgqPfvRJ4kAfFngpV4M9WftGAg3FBY15Cw
	Cpkj6CE/QSAOiILNrYYMlGyk0hAurlIs3EdVpfg41wG+CY+pBEwTN86LraaXz1D2iRp4dKpeHyD
	GuXkNnUAMhND876nzX5qOb90d+L9mM21RAWvE5Pd6/euEf7W1ZT+dEQG408dLDi3CfAqC/imiTd
	jhh2OHXMKHC/98T3SF91pcRrG2Txih2LR7spufm/haDRMaX/e9xIVWBwUv8lrz7l99oZcUCHhFq
	O94q+vMue3Qzgp3/ox82hwMqJmTuO2B+vmzGj
X-Received: by 2002:a05:6a21:1f8a:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3dd5f3c194emr14296914637.5.1789619910690;
        Wed, 16 Sep 2026 21:38:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f8a:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3dd5f3c194emr14296872637.5.1789619910298;
        Wed, 16 Sep 2026 21:38:30 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:37 +0530
Subject: [PATCH v3 8/8] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-8-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=1168;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8kaMCvclbLQw9S7ZDklhdwNqhDsVvgFTFLKp64qWZ4o=;
 b=2wszZrKCrkhKDPuY4Fr7BYeiS8xtabwHGYisO2WY88tvo0JOz18xc9xw9d5JdzaxXWspkGX6N
 dc+ryicntvzDR52tuS/vdy88OdRvqdHotWZaueGm2R9GoDmXlE5//Lm
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX510GA9sBAkFr
 TXZ4fnS/FtGvMJXVqBtxlfuUxqY7k76oZx+jzoj3HlcOIIlzE0gE5x+3MAfaAHLn6R1dtDWowG9
 kkKskTzmKR0pTV0rG8l5/Mbrb9DJSMRQ4C2p6+mWkwqvdijAydvLOk8X/oP4gQbkJ8PNm3XWiLT
 cBbFgaEr8P2ELnd9fRKvemdLmybqvOopB3RzuRYuwT+6s/ZPzHPlKzl08/iHEkAvAccAGXxkTW1
 AD3iE+sL5JprAvaZEsLH8ZjhBXuxkapzwzG9UtmZl1Ljay4BWP5jlgoqwHTUduSPv7RHPdNk2TR
 SWboxEFhKtpCytob/677539nBluKiXZDd0lPeTjsksEwyl8iMP5H/JV8DLQ5b66EAUa3HVMl/cc
 MwxN9WWeStOPppXmmBffAZoS6+Az40RiFoqDYVg+42mqrcKxeurmAe35LdWXYOwZ/GxrPXCvm31
 ib79wBUf5X0FEubeqSQ==
X-Proofpoint-GUID: BESBKem1ZYZfdpEGZ1GGRM_ByaPixOfK
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab6ec7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: BESBKem1ZYZfdpEGZ1GGRM_ByaPixOfK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXzu8tsiiw0ybL
 86zVHG8CgUAHlRZ/fzLUW2O86MA55Kvpi/rqOF2R7h5uAlHV0dsX0vUy7gVwkKVof5EWNDeyF8L
 1W4HycEfcVT8hUh10LXAlTqNesrBUVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170056

Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for
headphone playback and capture, and the WSA8855 amplifier for speaker
playback. Enable both drivers as modules in arm64_defconfig so that
audio functionality is available on these boards with the default arm64
configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc..0bb07c0f4451 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1167,6 +1167,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1189,6 +1190,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m

-- 
2.34.1

