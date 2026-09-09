Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670CB56C648
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963490; cv=none; b=U25nthmxlKqZboIZLHYxpbJZBioV755X4ubM2uGZaEBfirH4w999R4hPeG0oAPMp/KdVRtQd2J1v3mqABuXTKR0We0SWfbEmgiYXly+o4OlWUR5dEm0gW2OPS/t9JttyxP3wXTBXyHIc+XhELbWLRopo1VqOBDzcaNoWsnsvYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963490; c=relaxed/simple;
	bh=7UW5GwmU0Z8p/behDTBZPr/HmZL2ZVIKFtCLBQ5P1oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsmgbWm2vvPNamD/KRKCcpx3XGmLtodtu52NYh0pcc1OtEZZDVbq7vdrFnKPtZ2xInKHe8KDAgu+ifQj8KugoP9wHjotLJivukcKEoYp0ApDYxhFkd8fQQdv+KCM/q9E48pxwN8hBr3okEfg5YoxL0aZ+Ji3lYq9Gp9TNMfgw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/GhkWED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doW3p3Gy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/GhkWED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doW3p3Gy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIRk12080978
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=; b=b/GhkWEDbPpNPr3Y
	CGUAzu5FTmHKpYQzkojlS/Y8cVa89Sa2/T7L2ck5IkuZwvSJhfERj3e87/l8LWQp
	l9WyRh6ZXjyR+C6Fqk4GFA6iF6UZrfkypulG/fVrHZD0nS2RHjsJkAOX+VkRn1Az
	cNRFQaH6DbfrjOlDIhoDQYQ1Aoq1MePILvxkBWBVtt6mHK2H8AmG9DH1Au1IRimx
	4k5fvcqSLSEVXTgcRuH7zr2vWTaQWx3HxSF3QCCkw1q1ZkpqIHXTMDk2n1wypyUZ
	EI2TCx2EMJ+KlhdbKDgNvvYEZIu/iB6Grc0M009rPMReuvRhxeiw9vxKTBHYlKOF
	oWklGQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r09y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:18:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a6d5cc851so503641137.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963488; x=1789568288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=;
        b=doW3p3GyirM+h+zciQ9+rwR/vZ5frQNzB/K/DXHwKjdhyWtXsN4kRPrqJ08k71mids
         XJIR8OXy4vqGZJSXymwNu+i01BbMHqVdnH9YIq0aivLhx4jzVOdNkRh+WOVGiVWV2tae
         OV/J5Qqmk2Sk8pqt9m7Bo0JnUA2Fkucq5tMrStI/mrNJ5CvVWKOQIshH8jmkLV2Bew/U
         IQbqDYugdhvfmns6P3Iv9ZBhEIQQQHJu9o1BNClXijcLbLKJywIT7G1/w+YHs7BpCYN2
         J7Lhckr5fD+ntmnjT52YjUis8z2SEKDcH0yJrdeAw6GgEyI8954smeMB+rwNH5VFht7a
         tw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963488; x=1789568288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=;
        b=Ggr2MZJ1KciGzP3RbRpdVYspJdSQMc6J8dQcZbFMe7nFEK7a0Dt744fA1YjpdHBojy
         KJWacC0Ssh0DLH/ZulADwhSZ4UK0HGvxRZfHLXUZ5XXSCnVe8EFCmEf/PdewOeIa5Gqj
         E8pjKZ/eoSnZn1ItNJUNzOTaExTem8NfBmXgmjYJqXSVY6/5ztJXRqEzmnjIBVVLmQhn
         eMK9Zh4sGRffbpu9S3Fj/T+tj45Qs11mXW+8lFQOW+07qQnyaxJDN7YnDNDCB2L8xeRB
         gYfHTKdbbyL0OGX3JIX8W0kEln+54pEf+ZEsiAEpD+/gEfZ4M0rk8HQV7loFy4YVGQlp
         h7IA==
X-Forwarded-Encrypted: i=1; AKwUvBxsL/UNJ7NGdgC/O4DykrtERHzBgnm/3nE9RCpFDf5sdg/oopTirGxX/LnfR0OIphr/5Cez6MeBhPh1@vger.kernel.org
X-Gm-Message-State: AFuF++kaTryQCNS+5cTXYY3+F/iVUA/0R9EYnWMgA5mFI9/TywytvFFM
	di0GiUdGBhV1HzNhuIpRCVtxRymT7f1A7RjMz6X8Q7DD2vKSnpojBo9oLoZtP/VjbeS+oDd0lyT
	3Cb8y+GAXLgl2PSh8ckYD37cZXmbrin0Spw8awoIdWaoHYeWn3XBKsUxtsbREGw5E
X-Gm-Gg: AYBFou1trWGpUkZsnWzd3CfQcYhCiFCId3wLawBj8fSxRks6i/02CxvpGhbYMabVSwk
	jH+e4D7jbbzJj/2PTvhgvpbO+pk5hSyt6upDADlACFw4MkRwKd89IPiBqMXzZQaNIP88ZxnSDLT
	8bcHpwMaoRkEXAihAcc/Blvx7I9AXP9i6/jGsE1MSRD1wxAtMnEoRdoLTkHUr1RD5eaMweIf/bM
	Pp0LuVuoHi8VV0ifJ9Y4BDFO6AVIj+aNYh1ym3B1tqYk2vrXoOhGTF7RGN4koPZ/EFXWf9K19Bq
	m7ADkZxwJNEQvrGK6E3TceT9Vr+ocLEoJJZs7d3xA5B+aRB5kJLxpmnKiNSa1vWknONodbRfx4S
	nh2SoGuzmu3NDnE0D2Uie2v0=
X-Received: by 2002:a05:6102:801c:b0:785:35cb:e64a with SMTP id ada2fe7eead31-79075874ac1mr927895137.3.1788963487859;
        Wed, 09 Sep 2026 07:18:07 -0700 (PDT)
X-Received: by 2002:a05:6102:801c:b0:785:35cb:e64a with SMTP id ada2fe7eead31-79075874ac1mr927865137.3.1788963487469;
        Wed, 09 Sep 2026 07:18:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:53 +0200
Subject: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7UW5GwmU0Z8p/behDTBZPr/HmZL2ZVIKFtCLBQ5P1oo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqTW4C5Wq/U5QqNJNk+i4/mlCYILEsx8WMHK
 J2Arf02cvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkwAKCRDBN2bmhouD
 16cnD/4t5mlZm0J6t/3v3P6A6O9xytJLgafTGrGvR+MBKYLd8Ejv7rfoqYIr+1xXo0KHcVaGdhg
 sri77d32eeOEMPPS6O/ksKJ8Dxna/VhQT3U+0Al5pm51f+51mdCZO9dlnFAgPjM8ZTpjdGIuVPs
 zeNsZ29gkuMLfcyauXViiR2FerOEJXsPn3MLcZpLMoXQD7wCzSXkLRnJ5952U/4t5Arnasxd297
 vJsp4p3nAV1FuD7iIYKNAIdhQP1lZamO+e4y+xdln9dqcUpjKbJggh68EZYfL+3+mcdOvBr2j7L
 M2D7X4ltm+Jk6itQZM2chHuvMSGrASFzLXHCqBgIwq/3XcJ5iHOYop+yLQYOBWEmbanUbTpPuLW
 ovgLs55zxGPXtZLXWIxubIhi0UoFjpjlBxvoSWl1MhUqdAFdLBYZ9kvsSy+3EpvwlM9W06cZ8LM
 taPkgzIJNtDGkWFpVpMBCdkCu5n4JopcEzf3R5XS3APhBLdlMf+U+s9aWZjLocnlXtxOADH2Tz1
 vqhhHRWWpp4GFeZoJM4FNhRRITksXOQqcqKu4TPFiJNBetNF7HBeqnkD49QcjR0N0nHDblXj6+X
 /taV1K3ce/WCPu7yPM8gTDS0WWpRrYA1Xf6ijkENCDHNxeg9MfjW+hiS0mcsxlAXjmE6AEmF6j5
 cSCLu41KcofYUKg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa16aa0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CUSRVOmJ_5qU7sUgHrUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX69y0cX9N7Vet
 Xn6J4EX7yapOVxmPZot3+4JVbn+vVN+84mJQ8u/rJpBc/G347z3RBabhq/tahWwCMGV1a+tk/Be
 Uo/qQsLJa6rY+ZPfEBHpUOwSLt133AsQpTv9mfAZvvWwfjiMzLVX79tKXSxUFthtX52BcMXVLLV
 OmiwdOSVWJwrrROd7SEClG0VomPx59Ge4deNkKdApeSY9vcAmx/ECo3jLRin20U0iOdEgofqMtc
 8FQcTxwtothyWSdXz6HUPvuuPD5LSHuhEGm4+IvxrZZ3pSXCsgyrTzieed1cR7qDB1AnlhVvIjv
 mN568xpoKiN9W7busqQ8aJXb24Bno80WQ/eY98yAcDNkItdpgupp8EOaUM44wsakTBZ7/gV6Qmi
 29IvJ26k0mb849xB9+KfKChtmHFBS4U4E6Swv4UBywjapBWHeK/9QErLSFvuef6uYlKR/feSkhP
 g4hAC4tf1GTMI48W1gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX2utTYUvW0SVY
 2LNQIluPPUvnNBhADmmow3WgS405YOK0jkArcTa4eP4BhK4PWe1bFAImmbQADd7bDJhvmSUTLEv
 NWGw4SASKSy+iGYiFyhFnrjP0a+y21o=
X-Proofpoint-ORIG-GUID: TsRPSuCk972AWVyOw2bSXam0Az0_hHOR
X-Proofpoint-GUID: TsRPSuCk972AWVyOw2bSXam0Az0_hHOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160

Order nodes by name to fix dt-check-style warning:

  fsd-evb.dts:61: [child-name-order] child node 'codec' out of name order

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 503abe52a81c..a1f3d3fbbf8b 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -50,6 +50,11 @@ simple-audio-card,dai-link@0 {
 			bitclock-master = <&tlv320aic3x>;
 			frame-master = <&tlv320aic3x>;
 
+			codec {
+				sound-dai = <&tlv320aic3x>;
+				system-clock-frequency = <33000000>;
+			};
+
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
@@ -57,11 +62,6 @@ cpu-0 {
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
-
-			codec {
-				sound-dai = <&tlv320aic3x>;
-				system-clock-frequency = <33000000>;
-			};
 		};
 	};
 };

-- 
2.53.0

