Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A533736A350
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064104; cv=none; b=HSY2LfVkA8QcFQ0TrvqOqLJMFMs5sHJoVvUAcOjjBwsCIKSVXikl4NrsITUaMVzGbzdzSED1sZR0VNEs2F7vxEZqdu3jJc/JeQB5IrsxLWhc+wulE0okRfcwfz2K+x8w5r2M2t3A7NWx8cLboB+17Eunhd4SZXeldZPzz/peRQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064104; c=relaxed/simple;
	bh=79dVNdfYRtUY9tNY0FkFa+R7mNAh8aDGXsSsSqtHx/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=czZOOS/mBxZwHVnOr11NXAnRSEdfVsbOq258Do+vQosKAeYUkJ32RqaAChY8co+NfwPx19gOfdIwZfMKRKMLrvHglWevDWE4zFa69ZBwiuCpc0aW7zdlMQkniGc1NG59Q3qEc7IggOg16pDvT0Gh67PcQbKCTya/sTn4KSFy24U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKMeha4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvw61o7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKMeha4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvw61o7S"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IcoL3195389
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zb6MyzKfvre
	hVdscWJF46oi4pZRv52M5v05PzB50DE8=; b=WKMeha4wyLs8teAthRIIGWiyTlH
	XgheJlbO8RRygwbAQ7/CDurXvetN/A1Z/3ItUYXZ+MEjyAFGG+2ZOlDkgNQLhLiO
	0QZ3Qh3uAqw5UUEsUjuHxZKk8kpoSlj13DtVDNt2lVXkUfGxJk2qtN2+uG4PBu1H
	UW25Si75JnT3kEMPdKNHllNDoA3tWmWF7cuVcDEZfcDgSWHHO7AAtqUbcVPl2jJo
	OAtRlHNcXGyGmZnh0Itt9bBefEzkbfScCWv1acwML6pH1koIlMmy0I0DB2gkg8Nx
	/Q2BFX5g3gJC8DZrZzEt+OfKUNfFyBW2CK0ED5ZXXnnWNm9F6LFApVh88Gg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyr25m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:35:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacaf479f9so5900145ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064102; x=1783668902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zb6MyzKfvrehVdscWJF46oi4pZRv52M5v05PzB50DE8=;
        b=kvw61o7SdJqghli2ykSva9GrymIt2OH9EPHqURWUNg2GXbnwYAj4+TPGJ0qdQlxG2z
         rtcQs7ZqM7PPFK5D2VY8eehWXdDn0qJGoK5YD/gw+JgjJzk+nkrPyj9zahW2Wm+5GeYA
         b+utjVKyb/yqADKefBtUYM+f9E5whZEzMxvARN2pG/Y01cD7Nvy18gzkNE+OGe3nbBG4
         3UE5kipvMK8z32X592UUOGlDHwydAkWMdi9KSyv3qECFl8cDqkTaGO98+jGjbJUcu/f5
         idxWgqJ+nGwMCRHlhB1+VGg2w+WAaluzWdcF1m7VCOOasBjC2WzYp/eRpsSpMcWBvffK
         8pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064102; x=1783668902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zb6MyzKfvrehVdscWJF46oi4pZRv52M5v05PzB50DE8=;
        b=HJ5JaN5vgvnn8Xmxk/w+jnfVt3cSw57Eesd4VT8nmIYi9XhahMKvmCHMuYVBZMxEHs
         CkQoaNkKdqmyx+QMe7P+VQsMHyTg3vp5vfS3ocmJMeCUSuuIUdhKhbqBky0D6HuC042U
         b7FQdViv0dXrSzFO89Fru6ntzgfS2/fElbNlGaoWZi8ir2/ugSgmC2c3xO1GjdUbK8mJ
         PkjHe5pZS/BLrlslheRczXd8jGZryMYaLFV+2PrwmJ3/MPLIsAO0CfqhrQzJ8yTaAwr3
         T1rY8m26DZGRaBbS+yFQ2Mk638PlJMqcw4bz5GYxWcKArQe9AXjOFfBN8kKCd6nlFbed
         9VmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrahXrtRo4zgsu41r5fE3+4S5k2CnLLivwcsXULxHCudS9NO0BctWRQJw4Mul8O79TshjbOSvLX+8ph@vger.kernel.org
X-Gm-Message-State: AOJu0YzhM2Q0WmMJdogaCumswFgPGEgfe3OhnbCSdPcyC81Biqv8S4RT
	rNB/tGUekoNkls7G5Vz2UjSK+MJkRstNlZonw7vrDYpmQDb1KY5RdHU8PBV6ew1VTVNVbHW3Hd4
	8NdNiRZ66eKpp/43mLnMXctlk8TZKugn+ctt1KUKczpIBxKhY1NRf/19NjumegikxMPBR4+R2
X-Gm-Gg: AfdE7ck8A2XmfsBo/xMl2S2b9YfhT2woy4C3gxdhmINX1fmINt3TCaJLjipRRG37kRN
	VTOjC+wuvvwTpjxGLkvOBBVNE6PhUHnVdl0kShJL540Nwb2ws1GII4Qqn0fVgMIE6wA8vjy6WBj
	TWH6bGyqpcjvIes9Qp2asb58EHI7y6SKMZnHBbW4FYqKWX28BBlmmBBYCl6n9sFsBJGmehGVWl+
	cVpN1LckoaoCf4yRvFokJY/wxdONLjwe3pLLlj4osLm7hjjdYlyBgVDvWKNGhYyXGCTpXxb/YXj
	7Dyk/zplagIMLEv1MhAMy2EBkDxworbpdfY0yo2POjCUERk1EsGVAoKXSYl4QiLxxMEc5CkNDGN
	wjSf+y7H/Rq3yWqqzoGJnn3D11YviKPITCfne/l2V
X-Received: by 2002:a17:903:2411:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ca911de5d0mr89041135ad.23.1783064102444;
        Fri, 03 Jul 2026 00:35:02 -0700 (PDT)
X-Received: by 2002:a17:903:2411:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ca911de5d0mr89040925ad.23.1783064102008;
        Fri, 03 Jul 2026 00:35:02 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:35:01 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 3/3] ASoC: qcom: sc8280xp: Add support for Eliza
Date: Fri,  3 Jul 2026 13:04:34 +0530
Message-Id: <20260703073434.2589657-4-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX7B7oDqiut8fT
 q0gFWaHEBQLRQbPcG5Z8fz+i3ooogz55X4qFcghO5lG1xjau/kheThUDdli+2b78Q5nSRJHqF7C
 tizcqMbgitoH3RqxWCQPIilHNmIhtZZ3DK9+6PswE+3tlEAz0aBkDA4BV2jqjPM05ECelLuBmes
 izCzzWIUqUC8VuP/BXjpxEaceLIidEnji5BULvoXyR9dzzBitVOvjVrAx/vpPOD1Gs65++G2JAS
 LML6j8o8+j6sS2J6N7G6ykJzXr4v1wQ7Q4FHHg0jkx8R2FSZPD+w24joxEZtLNU82YuiLnJXpCI
 vI+Oa4TdU1dEjlUn1e+Nl2IuR1gz3F2GbOd80DVlCEb5u21STLzDh2ziV869t1AUT7f/R09czIt
 Tab4iBvQspX6uRh18XpYh69XpcIojUry3700oUMnosV3Jod0jZ1mZ/oHC5m/++mkey6pT7EPh4I
 Nvjb/MdFEOZ+B+Y0vig==
X-Proofpoint-GUID: xw0v3lvou0klCx5Ejo92U4pXQLowxfj0
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a476627 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TZOEHHLujcuKf4pbZmoA:9 a=zgiPjhLxNE0A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: xw0v3lvou0klCx5Ejo92U4pXQLowxfj0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX0pXeeOY2pxCq
 83kKN0gjbOEKxtaydjbVSd8yGaL1z3+9f/MQ+vWkbQx3XK5ivT3SzXCqyQXUBiVRtLYmGoe0kIE
 lfActOVQFLGUlDtg7HZqgxaAWvBXDeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030070

Add compatible for sound card on Qualcomm Eliza boards.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..98b15a527e37 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -164,6 +164,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "qcom,eliza-sndcard", "eliza"},
 	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-- 
2.34.1

