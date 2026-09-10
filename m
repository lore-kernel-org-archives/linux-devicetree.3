Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F948EC99
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052592; cv=none; b=UY5VcvRczqbLvf+pOAa1K1xWoBcU8fnzUyPK9QrMyKHB6kJpEM9oW8u0y1syIx/nMexi4SWqw6Cid7yxRzOK2YLsjIN3oQxz0WWpDwmxGobYZ3v+hTUa5jPDhiGZnlBgnEXs+VaQAAJy7cOTpsCbBZ+8zkH5KHAYtkUog2H2JCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052592; c=relaxed/simple;
	bh=dHoNLuP/MiZX34znx8vGKptkQj0DrHSQ6SDhwKumKzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghT9BzIw6nmIBXzdaiz9EKcJ619A4TYvpObv2Um/RiF/7NIJ0DLZEQd0EpSzCXpuopetM7Rqzf8NjNVEhDLp/gXl5ADTKArE/gLhMzGLG2IpvyIlv/cbGYzBnosXywuE9+9L/++u5sjDRwUcO/ttAOo6iUrKR4gUfBqyelChBbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/MDshMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiS04r++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/MDshMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiS04r++"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADcAI51068049
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=; b=b/MDshMIORZTKmqw
	vJz8QN94jT0yokssQ84WcLV8RlJrZgNgSYBFcKW8TJCgcXn1kZ+srA4dOU3+zcs2
	2NeKQiPKiTT/P2NakpA82017WG/xE7xHZ48tSSl83e771pGo3BFEyBO21ZAjK+nN
	46xoakL4rMDIx9W7yz5JbHrbC3b1azxOyCtbg2thVZk6HuPXwGAwj5tezowTKeUh
	xgVdeuamxNGyjl2HoeoRlbgqTlSjr8gNENVFTChbAWAv9Z0+WkHsz5eanzQan8x+
	hFCsFY/ZfweFnIhoV53/WbaQ2vJQC28jtgN1ezbkD+P+u+FOYz9p+70PHV+vrssW
	lrAxNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8hff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a2639398cso1086964b3a.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052588; x=1789657388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=;
        b=CiS04r++FHPy0xuKrVlCI/2A60Eev6VN4rluUVCHKK5tht8uE2efzH9uzflJB0AFKV
         1RicKeR2ZTrRDnAoABM/WEQGtricrgUSplKjLsRN9nYGV+sqEtsQwWG3C57KlCv1o/eQ
         ApxJwAjz7/Coi2rnAJ6TQ7K6USGcMRxld+g65e4MEfXzBUGnNYUf5rztc5R+ZZNtoaN7
         UDIMACXm0pgP2EPZHaco+W0n1WgS6Q+CIePVg9Qbn+xnyTtwjeWVshjEmvSwIPVCUuiK
         C/yNcujaHPWUWax7Vqwh/lLbw/oUdi+ojTJIFfUTlQCBdoYqpw0TFj3lY54CtbJ3861a
         eudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052588; x=1789657388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=;
        b=oHoA6Fl664AsjkK4GihSJ5OqNd1olOq9dXrktbr5D7MtCqS/T6TSb0HCwztSw6JACp
         hrFnwry2P2Eiy356yilRq6gxUP/sjo/fqVslg4gY/5NYEwnOnv2nJXD4nf7m1t0bW225
         6DGFkSZOLBnei7XUnELncPGWzA6gkyGXY6hjlAqBSDdhkKApdeWy/P2j3BI8Ds+FWM5F
         aHeg2vy+3SMPOc7uIUiNTpcTUd/Y0VnmG3MSXsQR3aXJ9qidh9ZAG2U5ZnslH48c7sZ+
         dlV1c5SJk7cUDZ6qE/MtUDvFw5h4g2ugnomlOy0ywq2eGzNEazYo927z6X8rK3IsyOI/
         HGUA==
X-Forwarded-Encrypted: i=1; AKwUvBwsKtGlbl2KhzMCkuUWNjRRhzliDC+MWCRlxeCBHZQUQNrj1povzsIM1vlis1E/8dqoVQAkz96bRT2a@vger.kernel.org
X-Gm-Message-State: AFuF++nLgI24Zm+2dCNzuIrrdObhNPdUUZ2X0t/ur9eIy1tXRDbT+bzR
	sJDQ3VcxbLSxkokLAJikDcQP2viKMCP8R7qG0s4Ui1YFHSFtnW4oT/lkTd74nh9WUdmQoVAchR2
	eSToD3iFFkHadDC/1eNWm0RmUfC0grHvSvcg5A0s6rNy2RBcjJq5UGy3Hb0a6b9tD
X-Gm-Gg: AYBFou2eRb09slp/fILAvyn2QkjWAG2ophfM063rcE4h+5jVTyiTLbvV0GFJqMsOQ/K
	KJ+N05zvIX6QW4nwPBrMwRjWvCaUkerCFyOHsNP+LnWSGNaWnhlCvWXiUt5D8EIklT+XkZDAT8l
	YogkQurOoindDC5FImHAfTHc5W0sALlz0Rys6hCEYtcN37XAwSLanfYXCT61tiDu2VKxZoWzwKy
	SQyB+n7UJrWrewJSv55IZbxjBBz3wi8ASp60mPIcGQDSfIHw5aLlJifjwdK9Am+I+ci55nDB/vD
	ZB1qa1oU0YdbZNNEeBSnsavKTwKiP7zytEKWqdzVXRtoCn/uhvl08OV8wBhUQ3KdcFVTFEwtl/w
	Y4nLS/RGwYEnYCzkA7XOCEaXJHQsS
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3da3a08ecdbmr67376183637.17.1789052588021;
        Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3da3a08ecdbmr67375892637.17.1789052586239;
        Thu, 10 Sep 2026 08:03:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:38 +0530
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c6ad cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX04TMukAlnnZi
 /GqzziVOjZ5JvpB7z9bg33aIrGNUe14w0+2ihw6aPfucEplDoiTr51QmD3n3eaxDRbAvQ9SEqTg
 JQucVZoTcn6tLKnklj+XNTmdFgchEnk=
X-Proofpoint-ORIG-GUID: 6N4iwjpVWkx1WnGtJ43_GulD5iP7fw3R
X-Proofpoint-GUID: 6N4iwjpVWkx1WnGtJ43_GulD5iP7fw3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX1+2GQ+a8W+8Q
 a0d5+12czetNv4gYF5XuLGx61+H2hY9y4JMxEvWBRgOsCXEq/QWZdfCTYfOgqelEO+nk2BtK6zO
 7lGqCUhw4xDryPSKNyCmLO66sqDSlcut5U8hv3X08AI+hFKbzG+Lc5Dn6Nkq4BpSg+onrZax5Yv
 3AyKKUr2acl2fpEpDiDiYYqMdc2kZwbO2iYfpSSKaJ31ev8p1a7AEmZs3U/4tMWeYDu3NkLKp3j
 +FDbCRGqBipemyk6WLxSfzatqx9fGaSCuamSyAoaAQ7Qnuo9z0LB+OFS55cWsOL+vSWHFtFYIWb
 98YCPB7QPqtT0fOLXVPcPrcYAkWEwWCEa5WqADIqIq4Y1KjD3Fv9qQmZJ1lnxu2dbiROXehN0eX
 5ObczqLXVO38Nze7UvoZP65Zx83M8d6pQfZqgV/tuEQCPClNfEWiOU6fOzsqHPPUs5rJQl1eI9f
 C6lZjCu9l3vlZ6M2Vqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..0e7116d33bd7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -51,6 +51,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

