Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C53ACA5F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126123; cv=none; b=AACncZskcT+YS1NwpBhJWPydNhVIrQfSF7Aj+sz/a7LuKVZ1IjP6TtGz50naBHPy/UiQ9DSDQesG8V7PTUkgUeRgtk7yWbUKWnIjo3oZc9PPyY2b1ayqbfY1pvFrnGMtemmFFRQY92M/4zEijVPR/DNqz5TXMK2UOJc77wtXmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126123; c=relaxed/simple;
	bh=rPLKs8fd2WeLpmZetPhd0Bu2ZR8mcdS7VvN0GDYA8Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2FCbSC2IQ+j46PQyIiWXcz4IaHxy5OinkdOoPCpvLHqqjjJFHVEGnPBZitBh3up+kO3m3tECFRA9ucgdg4zK7IoR3GQbwzBH7GYfcs6VzRh0qnCLvIepVDZr0M3GhIDcmszyTBeGk7aN3QpQJI0RVIi3JaM0WDMWDE8Frvo8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8smhcYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b59qPfNB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8smhcYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b59qPfNB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJZ1wg2472267
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaHWtK7eO2a/H2LXqc+Cs2jlO+QiA3eArtK5Kd7RsE4=; b=g8smhcYRoEvl6jJy
	bTNTujRYDljlYroPNYy7uYfwKbYO/GCi7OdOzpBAu9mnIfF/OcidtbosaZS5P+hX
	/IDC31esepve7rfjrmMkw/DAfLr1gamkEGQb8XYJQEuo8jUje8MnubKNYduTCh5l
	vWx68Fv3HGqa00XJAiIXAFVC4fNMIaw8dbfF9CohPxla6XrYMAPlg5am1kp/tP50
	1c0N5tpGHpo3wbas7u88rW/a2sEZEMYWhmi3L3SUY36zoEt5/jVtzetZCCkuzC9s
	qoh4hgtl4ckJ46Vbz8rndthtwki00JaPaj5rBM8Cv9Exv02PpshA3PVy2F7IITv2
	muNQ1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u8c5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b74447so5662489a91.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781126120; x=1781730920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaHWtK7eO2a/H2LXqc+Cs2jlO+QiA3eArtK5Kd7RsE4=;
        b=b59qPfNBvyboXbjY2+nz2o/cTfF+XOZRJ/D9ZHrgw2bEzBOut+8JhbVGRnGfthEDP3
         zV1cRJLiePBj3kKi5bB63Piav1mTAy+VA2MNmFv92PaJYAJ5orH8QxvqEN0f3gwqZ3o3
         KG0bEfyIazNWYCgiR3qlqT6pVOw8SbyOXf6DzhqRuSL8E4/2wBsZQiGxmtJdh2n2Ko3W
         2ieYma/qROkJTmeZKjRgpeNmVuAKjHx+DDXScGF4P0pDKLScFPUCPpf/a+CDax+qRfrN
         WlNXcG9lWQXxBQ/Y9hwvGmm5Naf7nxPILqJ5y3uemcDE5G6m80wH8HbxoHxr2c5kXLz3
         IaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126120; x=1781730920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xaHWtK7eO2a/H2LXqc+Cs2jlO+QiA3eArtK5Kd7RsE4=;
        b=lk8jbxp+Idila1I8w+1QLaCHXn+wI78hDYuR9HgoGK7L2vmw5dqKehGzAk+X+3wTLh
         Q/v1WFQq/eITvhPtHbgnhK+zH2YWV3JAs3MPI9pAFxKKz3TVTjKdTALVX7KSx/vtfhi/
         Q3HIU13uTT/m4cO84NDmlopcKfV/oW8gO51KOJvGCslcZ36y7/FK3GkEt8RBVvY0zll4
         ucRFkWi+RcUY01jdAnvNSImDDggv72TLf8wggXXJx8z5pQ1Z00feQeuD5UC7sbiYEisu
         hrQIs9tOGxN9dqT6pDSVD7pzuuUULFsgHkyBN7jDrlsb1ClRx8OsBuKCqNm/HwV8Jj75
         +Bbg==
X-Forwarded-Encrypted: i=1; AFNElJ8ru4nnXvlwLirLge2xFhoFpmCdZFQX8009AadsteKhw2A/p/yql9aQmejumP6sbEuCFEORL2C34PCF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjb03NXXiMIVgy26Kj9LOkH858FR7ot966IbHJ4GOa5M32ZBcN
	5SaCXnTc3JkLwcggcLhI5MisSsc5AOLpB+TOXtlFqxnc5YPotKqC/GvUZtG9kNPkVgS5fEhMry7
	nYZNCT+ZJGLHBTJ40wwsLcmcf1mPIFnTwd4lStbJI1toJ9xeBQM40bhyduNu2yAen
X-Gm-Gg: Acq92OFqot3wOgShCjTIad7X5O7qZclknf4fak9AlEM7x1/0kLqaX7Ke2K8EkK5XQm/
	XEelWu6ztVTidGNPwajcwvuGcJBFAHb+Ei4tZXsSc7/b4oC6tVQqsm+XCLLpZ6WLwQGzDw/dJPR
	fMx6ZiBXWrDhNI/+J1PPzU2gTZDr4gN/Zmct1c1NeY7rTMKIBAhAtKLuaPTU8/JarE3ayawvSgq
	aFN55r70PKIcQ9xOIEfGoh31wn++vduM4LQUuEWKG7ls2CtGgF17BCwIy+REGgmfJ+ixsJ/XGo7
	URWxixz4jgj4If7ACXz9MCt514X7o+qzofLE5yUk3bAsxYSyjGhnlAfrZ7uQge8blAQCEjqaGtx
	UYXFtCzd/j9fLxIVXrdipcP48QHM0RUmNpXDkcFmfe0J4Cf/VAZeINVsRoA==
X-Received: by 2002:a17:90b:390e:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-370ee82f93cmr27505482a91.3.1781126120064;
        Wed, 10 Jun 2026 14:15:20 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-370ee82f93cmr27505437a91.3.1781126119471;
        Wed, 10 Jun 2026 14:15:19 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d01cc6sm309490a91.11.2026.06.10.14.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:15:19 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 02:44:57 +0530
Subject: [PATCH 2/4] drm/bridge: lontium-lt9611c: Increase MCU poll timeout
 to 200ms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lt9611-b4-send-v1-2-42abbcd3bb1e@oss.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
In-Reply-To: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        boss@oss.qualcomm.com, qc-display-maintainer@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX1wCoHecDQw1k
 Nl1ODzz8K6bmmATBpWOulhg7csoQ0wTMLEmFB39EhRFuBqecPf28YsEt3OqkUn44LgWL71FbLIU
 Q6MTadmRlAjVCdIedn55v5/Cd0ja/cc=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a29d3e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kk0fxjKgInd3OyqQQRkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX1BoH4kQ/cJDh
 1WydrLnXGMe127o9CGGL1WHx1Zn5C7Q7Dv/ql2D2+MOPfnX2toqSQnWtNqS9EhNSfcmC8C/t8CR
 meE4O0eAIqmFp84kg+y17vS3JC5mqLQ47AxjStIzPDWFylCxlsA5Mc6pWgQhhdJHCsOcRALtJDO
 yhBKjrVYKxL1opOQ8IWTLbDQtfFtCyfE3j14RT2sY85BbtW15dUvoz5ASFQjC9RsmnaXN/cCIJY
 ht1qmmrqxh83Xfkv5mx04NI5EGQDYMOsqoexIswjbuuiAtjlzGKklUMAv8Ymu5mn+jIL3oRWgyB
 y+HUlK1di3vwEAyVj4zPd8Mw+TESvU0PscUmoMx6g1WwWjRPM+WGeo+dB9LbslOE0jfCszf1ZGe
 iY4AKZKLeXcnpzX6eKNOj4ubx51UEEtlHFpArDJkmEbq9hE+v2bAqUlIB++wzsA+xJLBSraAcrW
 ms3Usnk0Q5AkKxNexAQ==
X-Proofpoint-GUID: 1AEZbS3XeUkzIk0rXAGYzov_vV2L7pUN
X-Proofpoint-ORIG-GUID: 1AEZbS3XeUkzIk0rXAGYzov_vV2L7pUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606100204

The on-chip MCU may take longer than 100ms to respond on some hardware
variants or slower I2C buses, causing spurious -ETIMEDOUT errors during
normal operation. Double the poll timeout from 100ms to 200ms to improve
reliability without changing the poll interval.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
index cb584855fd8f..b0402726367e 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611c.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
@@ -97,7 +97,7 @@ static int lt9611c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
 	regmap_write(lt9611c->regmap, 0xe0de, 0x01);
 
 	ret = regmap_read_poll_timeout(lt9611c->regmap, 0xe0ae, temp,
-				       temp == 0x01, 1000, 100 * 1000);
+				       temp == 0x01, 1000, 200 * 1000);
 	if (ret)
 		return -ETIMEDOUT;
 
@@ -107,7 +107,7 @@ static int lt9611c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
 	regmap_write(lt9611c->regmap, 0xe0de, 0x02);
 
 	ret = regmap_read_poll_timeout(lt9611c->regmap, 0xe0ae, temp,
-				       temp == 0x02, 1000, 100 * 1000);
+				       temp == 0x02, 1000, 200 * 1000);
 	if (ret)
 		return -ETIMEDOUT;
 

-- 
2.34.1

