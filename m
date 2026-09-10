Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B0403123
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033652; cv=none; b=hhf80IrP10HO3OaJRBZGlS+OmXYR8rPoJfo9tPXDRZ0k4dKKNfQjarFDWJU5ixLhh3z3eymn1eAL5NKpTdjLzaqaTYYBVzRCHvM6nL3+SWWRWFJ6NhKbO1l6y6DT+27+GzZCePkQQZFltI5N7ro9Ww2h6MOFkH44QlsuyCZsuBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033652; c=relaxed/simple;
	bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDXaUd0SFnqLd/MdwcghAfV568yF2Rn9f+h1x+kKkq2YDK4Iaf0MTr1EWF9Peh3tmHqcuqQ6/1ifyngpif85dbk4B4jf/E3ilcBEj8CXg8Qw5pW/ifnISGHfAdOMU/ZgJqqzeDK50sKOzIzne7ysllveEa1Ud4AhtQW8KheHBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkve1dYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJAcXscE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkve1dYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJAcXscE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xPdk3468667
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=; b=Pkve1dYXS7qT5+tP
	G7nS5XldSHKoDXYb2aNzykx/yJ5BVL+gu6641EzSc+C0wcgJbz6cqWz6j6MFHvB+
	gdL5exdlhZivLZQMBQxp8807rfnk+OOc56VPthbsxOr1FE5WqkTqk1SZ6OiJWMkE
	H0HpwmV8lyS/CkMdQWGPb5P4Pz1d6F5HCIPh4tswlLDboOkKLsUt8nPWcVJKhbPT
	fgTQ2p1bYBhlB+TbwMPX4WxujimIIPCupH5Vyt10QTSYZpO8ctjJvLq6KaQQgTV6
	8hKAEKQsC07FGnMoMalki402iKxPfWPOlOkOEMvs6LYIBlw9xxAF9D6paLyIAAjT
	KwD8fQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r7ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:47:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso88889325ad.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033650; x=1789638450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=aJAcXscEbd6zGlg+hRGLPW4dzFuXZbJ9WvbCrBm+M8wpPqFh5PRFx0fDIkPfq6rvJh
         /5Q2myQ27OYwwxQaCpwHcTo4vZOQRvrBDdLWJglhyhoLnSz6HajS+/SXjAW4IUb/hMkk
         oop8qZjQvp8kAmN+if6VNhrukHCekjhYJXr0GZybAgBSO7SmHLYztagQSuSFWJDokEKK
         LKngGNEY7fVq5tEaAd9bcoodyOtK5NVQjMSaBXAksKBMxLcfTvaBIU7dI/brvOSz6n4Z
         9t8KDTFKgyc+U2jcqJD6EgiHjBrXzy7dsS47kkru8BxSaf8/hpUnURpp+3B937Ccn7YY
         sTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033650; x=1789638450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=QckWAZ8WIzvvvU410sTqA1rVO3mRsEG922AK+RCa8ENUfD0lNTkzPzUkjrZFE+21Rx
         6Qp1gM5mKye6w2aajxTfdU0hFIqr6dG3XeDB7gArrKr/c4LSd4qC3oCzHYNmH/m6mdWA
         uNIzutRJEWALCdBclecXJMUCh72UDWH41ThwmCyOxDvrA1IxV0sBIuLl5wwSVnN9h1S2
         Rq+Z7I7UEBu2jhDxeQXIBNbumMiaPRpHii6JFjViYmP/vEbtBpLL63JT8pIPGylKo28T
         8PzL8IKJtEUP4PEHncPxcSkNnR+9Czn/hWUDRw8MQCUZMLv2gbjOLEvYGEgZVqiFkuKq
         BC5Q==
X-Forwarded-Encrypted: i=1; AKwUvByFFOYpxSkIJ4t0ExO1+yCokRW6FZjQpFliQKKyzr5f+HtcxKdlO/y7ZP3IJCRPteN8UbrYbQxIQ1Fp@vger.kernel.org
X-Gm-Message-State: AFuF++lVm11Cor4MyJDcEUZWmxNkoLE1Y4thyR1ir2/3cdHXrLiLO+kV
	LNhPVU51W3vllX4IMgTNqvJDqbKVZvy8l3W201JLIiEoyN1ICl9ckGqLHOPd5VlJm4c3g9yWeCR
	7csWig/NbtzPGg5v9KUJ6ciHR7R/ufSSmUXwMqvnEX5oPOEC4yq5wVW23QBNOrpQl
X-Gm-Gg: AYBFou29oCui1Rb8HkYpEUlEs7j6bSX8mn1xGCjkE+RnZ+xVCKX++unOWsDU70qhI7a
	S4z0q5ePoSLGN2kawpXPgowIetx/X1V/9o7E3CbEo2zOgWLVztv1rbZtke8LxlWho9+ew+vGTSS
	9K9rJ+WgJxLKlQBCQ+WN6G3+acD3JcHfB0kyZoNCOMEkhiC0Ej7wYP5ABLN3QSf3SyJnGOZyUiu
	STswq1OFS+WIFj5NwOmLPUj3hy/csaHS3lnyUgAi4egT7KTqOz2nbEEA9DElOs1PT72bS5NC1Gl
	3ceyqF4UqUfXGRHZDQa5btEdJIgiatPcRPMUdPyei1DTczYG7isFgldtQD5L7aafJGqsYH2sF/T
	f48az3jtPsY3USXGd8VYSUIzdDcpsWFU9O2KS
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322565ad.0.1789033650024;
        Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322195ad.0.1789033649594;
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:53 +0530
Subject: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=896;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
 b=9vnuclAJhYWlGpQD1qQiEVG5tCtfh5GCTouC758hlLvHN+C1+1+7xPRnKfgXYk0OPdAJAGY66
 m9YDRsxIf4mCMgmlxoE6DTlAnXi75TswqDGmD76PIe4lH4NDKYIsNOV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: csdouZpjRNjtu1QVkwCbIV42HjavGADW
X-Proofpoint-ORIG-GUID: csdouZpjRNjtu1QVkwCbIV42HjavGADW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX66qmqhHcrwbM
 wXxJL1H9X7HGYB+xlEO2yRSLMS3cZBkTxBwBqqENSKnRGNeQMpCsURCHtawgv0jD5WZtI0Eb1jh
 +zr36keMdPIXJ9E12aPqV2VluQ9w71Hq/mW4tXdgfZ66d9Ulp8svsMYTAKupyGE2Xs7gd06QqdN
 AUKG1hrsphytB0axhzS3VXHuq5d8GOJOq7+UNIJffMLLJlglaCrxHsSM+7LiZqrYWtrdS9BmAzS
 Ae0UmICPLly2LFeZnbme8LBp5T3y7GHh/uJWtwmHV6ok67c8E/pjDMl3jnoebqyWhscP0BfRQQO
 jsCdjUAke1FS9ESBsJPkZi/nesQeQ6xMaDnDJhPWg0y3SY8hjjSd5QVLAFfNaXiuicvXwD5zyWL
 fgQnS3wV90CnL02C3UnPlXujABIQ0DThHP9OasMBX4+67u6QiFcnHrJXIVIBWT7ILWzJlQ9OsIK
 LkhY2x1coJt4QSK2Zvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX9G51BRm+7+x+
 a281Gu69WCYoWdV2AFB9Vi9lcaUlqBbHzfrB+0QJGL00K5ldAhgoYxwi1G51WmMhK1HLRmqZK2M
 Mpyh+G9ShEeXu6F98Xjr/24De9s5gfw=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa27cb2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

