Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372924;
	b=st+7suv8jRMKa0/C6IuJVQBo6ugx269x47GGVrD8QCfVa9vxHB9qPazIQKf0TjcuEEsF
	 gQfLdphNcXXDkxVRexa5mXcVycS8Mh6u3tovaUnlheOfahTGlU5ZoZ/JY0WvCSl9O8UpS
	 Z3V+FJUyY1MIzemJXpQvjeZBWvQsg+1knYfx3FW5bpAZL4DmldRxU7PH4m9YrBsMcNtX8
	 LtKn0DsVvOrx06KLEWWXHiyBf2B2JdKmuvOpFwt50irmCg7eNcfOcfZMtHhvmFgSsdDSw
	 PiYvDGIFDqCrCTb44DBC+OdbNe0QHIyQoTwzrCJJll26ShXWvpNGkx5vnDZuqoHrBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
	b=0Y0eKG2q+zPmuQQNQVwCGxj7x0N0BefDLd+zW73gZih8lM5e4XL3VmyRA6ABJEZGGAkO
	 gNPOtLYaYnTUau6DpM7pbON+rzJs1ryeHESv6SD61qZRWADqhQ2DsUkqoyYmHmNoab8wj
	 RCNQzmd9WENSHvVxLak7PidlXG+btw32izv4RqBbxY/Tkacsd5aVO8yxO4IJC1vVx4XVc
	 VnlrJENZCu4bpGFP8wQ/p2E8O7w/nLr2rKIigdfRoljwRiS06Khatepn+RNk3BPCC5A9A
	 gccQc/ua9o+7o9THvpCEVdtmKyjwWkxDOZk+nn/TXXNniCT++3Frb9T4ot9XOzej9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJINvd5z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8568606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8568606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJINvd5z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVNlH1381464
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=; b=N884gzRysHbYDNL7
	eYyvrHAWLxssvbmjGZJYjEW1RkNykRyP5O4/u/dgWOK2y2WI+XzA6+7LM2ASPVg6
	tg3viHG83yZooUQwT0qGtc0jS96bKbFfMsc/NDwWaAwRtsXrv0UAyvBzNqYu6rGa
	nu6SO4AG0nO5TMYWp42/VbSwPGGmQemh2Yd+pGnpdI92bmi+ePcGxzt5HtiaAc2k
	WnqTekWv8rjEgh0AJMf/hhf3Y+qseNzWigL24D93uErFeRF5D1wmwuCv+9TWxg2H
	IxBP10NF/+Q0cWAbYQDrerp1YaYkxpwtsPcDEX6/TVwK7tQuKKKFX5ONDo4tQFoX
	CFRIiQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w041wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so1854728eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372921; x=1795977721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=NJINvd5zC2KK2VDLpbbFDblfvBxWreHrAD4sFpuEJPCXu4jHGkYERM0CWwve0nAiQf
         jvJnTw1ZrCHHorNX9glEvcTNOD5okPY6uQyWXd3sh1rDS75rr9pRDbrHuQzW6FPrNgf2
         P5oR31su4jpdw2Io49cV7unXzYP3yQA476B52fjFP1HpDi9ZO030I/kYDxG1G9un/UdJ
         NzDqF6g/oL7lN+5bwo+1v/Xv08eO5A6biIKzZh25EIVE91vaNJ9vRzDGuA+0lD2HxYxH
         +a6A461N+IhvZ40VczWYdgjGiPrvPg9IcURHKlXgrL7pXmbOw+L+0FhyIyEtr+ut2/8x
         MuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372921; x=1795977721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=vj7C2I9DHXg0xCXSQTN2hJCW3sUmkM/4/DCWFOx+Ih23Nw4r8aS58CuePZcEvYwRsz
         U9r2UpnLMmqxolxSRal4BN41G0+dHcVG49eFF90sP3gF3LEJWL/Oh4cIX5MGWdjMF3Eq
         be0kvWkyr9EOSyyJmuaxtXYZPC93Dk2a9l6wIbeQHgPCoXmg3lASHT8KmdwkHIsGniS+
         WrUBcBCwGQg+moKT7MZXLG8rFPykrYYNjirFTRtAkmBt8jBhjKoQbBEQ451MNO7MbooL
         vIPKCXtzgecemAXRv2iUXSWpLxvS2TrSw/v2QTOP4aSu16AZhTvpc6mXl8ESb1G3vaXU
         s8HQ==
X-Forwarded-Encrypted: i=1; AL+hErHW76lJ11MQ9/Tg/ArmHVzKOAyW4H2szKZxF9YxIDPhjvqiOEj2H01e5xmcfHzjlwqs/meFiXKDhjI8@vger.kernel.org
X-Gm-Message-State: APuU4Z9LboIDGF30aVzz/YtAGAeXG6/u0o2IfhHrEwmrvtNgadEGdS2P
	CXDguPneIp+698rSVj3MUxL4w+OJXMCIsbKA9OkwMChcoYKztrj2L2jiwzqph/K2rXqcI1Amkqh
	ZlvPvGALVyBkvZkHNb5dOdYZUS3bc9GB3M6ukUSWbiID6qRa9MexkGTWzOo+KuKeT
X-Gm-Gg: AZFdTZdawuZKFpg6QMbZnn01jiwVetIoIFuRH0RN8cOT8h0cv4ejg7sMa6yFpnHAHuG
	TRhWKXm7bzANAJztIsAI5DdYdHHhC42pOscFpYSPtdHrwRrbnmcEZp0mo3/qPcwYRC6HuUQnVcG
	oemzz7nRRlclFUCNpOY1jwY7Mp1GwR3dxXqBKtoxRb7BLWVktX7LRKsNEhoHo/SpZy8CnNfr1Hz
	lBU0Se+7VC15er2bABSmvoZVPe0kxcZHpEwpU9MryZdVWS1+75zJCrw5rJ4QsvR8dYAwNWwG/LT
	b99tTpEj2SljQIC6lEE5fX2mgWk3GbkID/Ij2XaOiqBV6FkaDQe1HdZPiizVqcOljNmQgAoTEbm
	MmrYY+ieLLrJa0Z0kOI4ld+8xObFP9WmofWU7YZpK2+UD/QczZmsQYv5gEt+WMnQ7/s9/COGB3+
	QqTnKZH7yoZQ==
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446366eec.34.1795372921429;
        Sun, 22 Nov 2026 10:42:01 -0800 (PST)
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446336eec.34.1795372920922;
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:32 +0530
Subject: [PATCH v7 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-2-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=1112;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SZb8f4y+c8VKXAmObSVzyBxPR3uylj62lbyHSZIa09Q=;
 b=uuVTYdqXCo/Q0EWrQyqZWXll7bsLsYN5dwGnkov6NB+7G2v/fmXfsrJRS+OYu/K2nFHYDy6Nx
 E4mpaje6/ghAjSZff3MxT7d0OAWMfVUNBrigQ6vcq7E36Qtt2fp8v+i
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXy6RvOENs7vce
 ZOIjdUWBCn/HuxOnukgLQJvCKG5wG1oT4vCXjNeBR2082tClqHfInp3w9h64CZK3EZUUvipYORO
 g+eFvFpnAwMwzan7nxPIhLm8XhU43fAXI516W4vvIdWD0zbhfPBcGl2CM9UHkXreDDKYLR72Jhx
 rysBcR+wRMqlLu7ogHhI7EfesLSqOKwT/xiTupGYpetvKYElJWQ0uvDfya3tx2ELKHm3AhZUaEV
 SQG5CHGWDUXHjkhGi7BXNy06oVRla/bURUkTnS8BO41TuiAY83HRrVSeIqJMj3BPxiboGvZ2qsU
 AFMgCuaIIz6+vK4be9ah6qmXjkagrVDfRnvHhpnLxTD5SYa7G2tjIAhj4jrvrCCnVITp7D9KcuA
 LqBaA4z/W9DIPjaQvMsp4UQTJBGkTOj2opUlAHwz48LclIecKVozM1osDeOGP2HN7YlMt4NI1AG
 GY3WKftkdeR2FfrBAUw==
X-Proofpoint-ORIG-GUID: talOIFoZCelwEKjqJPWHyTezn34UB3Tu
X-Proofpoint-GUID: talOIFoZCelwEKjqJPWHyTezn34UB3Tu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX4Ai7Objl+oXZ
 4NikdZDeDFzsg/obPfekluYkTekoXMbDH5ltVNzkPINYCHmA9TqSBIcPo4gZQm5y7E/oe1k+tpV
 RMoktq2WfMhTOTzssBIyLaIe1VJr7SE=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b03377a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Fixes: c73e2c5672da ("ASoC: codecs: lpass-macro: add Codec version 2.9")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
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

