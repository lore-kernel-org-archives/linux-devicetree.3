Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C5C3D3333
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447032; cv=none; b=L+EbM02gTSfm6gXeyvb8jHga+1OKsy4h3vzRQkJTSlIp1vfmJsHY7mKg0v0IhpL8rWGzKLYpEDXOkfqT5/ch4EioxRmmqQVzJeB5DGTj6LMnI5A5ntDIs7XokLjzAPiTNeD7nHAOygAwQYtYkQAuK26woLNM6ADEPQL/90fqUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447032; c=relaxed/simple;
	bh=Ss/xKitgd8olKTPkGOM+CzwTEm3C4JYbsOFB6qDCO+A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KMg3P8H2xyPYAfjzxw/HsiSy33Uwg0pYYQxVIWfQ+erRW6+DRVYWIH9X0r7olP53g1rIPexmBUg/ltWzaTRxDSOuHrriV6iTWNbPcehyW6PjgbhCM4AiPTt2XdKMhTzHAQF1RI4xUNkrEgsEGARzv0SiYLDZn9yjJ9W7Dv/D3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJgG/Wnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qjn1x1E+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJgG/Wnv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qjn1x1E+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9p11e312901
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rsFY2z5jc/JKZpx8doK+ltMU++8z2DwQdy8
	wREIH8mw=; b=GJgG/Wnv1s+qWiG3oXGUOaa1pE3nYhPIOEgIVW8P0VtrQJELxY3
	fg4Sf+X/R3lup7MyympNKaOW9NVrH1G7djbI3MkX/H1POWEcFtQhGfHb0FPzvF8z
	I1f9Wgwr9aHSWphsm/315RdKxCsQrKir+cNusEq6Dk0kJDFF5MJyjatY0npqbqca
	vdFBDRihDJGgjC6ewLhXp8UsrvNu2JCIo3Kh490B138PPXE7KX+yvtHboUx9G9Oh
	MVbVOaDJ/DiOsV2wq/Ofz2/BOCO/x+O6oW6YI1nhdZe8YDQ+qiJHZxUKODGBWvdI
	I9w/Sk2OpNn0TB0WEndhQD+8LfCoOUE527g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833f54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:50:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so72662875ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779447029; x=1780051829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsFY2z5jc/JKZpx8doK+ltMU++8z2DwQdy8wREIH8mw=;
        b=Qjn1x1E+wxCq9gG5lWlLIzUISsG704Vwwle9A0LJPq1Cw/+rDcx3gBR5+u6hqjR0hE
         3e9ft5FnxSJb1yRdpBWkPJfynDL/AnanIxDNyrblU6SFMiIkTDrTz5dM7Hl/PIUuxnaW
         +i2/TWBQszpwslr8Lj+pV+TpZ1nmsj5PYEdJLObHCFj6cwJrPOjxRJi6rMMXv9s8dHHb
         /5KX1bFsMwzfwp6/xqQm/B3lcnED9YJ43I7hONSUl7Z/XZGpc/5Cxi0VYt/HUXFV+TwC
         4AN3D4JkWc/1xVYS7RvDLyhb5G3sRYqwkVZzIkxXD2wk8o3/9excc4V2qS1yJgMpli/h
         /BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779447029; x=1780051829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsFY2z5jc/JKZpx8doK+ltMU++8z2DwQdy8wREIH8mw=;
        b=Ta0fk86ZX2FrHJW3UhOuR6dt+Yzv657ExTGhy4LA0wDH1vkN57Jg9ck/UeYZQPicf8
         Mox47sDERXb680+c3xifdwFim27MS0E5UbXlISEngPTBWGNfdt+TttxsCWEadlpmidAm
         MKGlfN/Fu6ArzbYmpVhlK4KnGZJBvSPEUuLLQOuKiuJ3BdHArysz0u/l32iUc0Y+nLul
         tFXDCQM8TlHhuypFofw28Rw1tRrdMhY4F8Ox6S+/LsQnGFjCD2BiHbJJ0nVx4pbx5Iz/
         poqDgjbrcIM/JW2iWVUFkRxhyYO/wAasHU5+QBh/g0jls4Hbuk2pUI3IQ5s2MAcwOfqj
         kZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nwaEE2rF6mSlPcOePwdN4PHclWBaMZ6sTQFoWK88P3j6PJhExoME5YAn4KtPoUteI6ywznu01ZFTM@vger.kernel.org
X-Gm-Message-State: AOJu0YybOwXqZWJkoyswrqxHYuZa3dJ8OcMSeLtw3YUXpGYG1R4bjRLe
	pSho2xpUavV3+y+lGiG8pzXMJT1FMsXg6lXdeDAUnfWUk9pylc7btWQVgjl5uzHm2HzLjaaQv9X
	rNQAyzXr0E+Q5+EGzoe/zpEWx+4c6OgDdDs+TnQqxRx9GxPiaOTBboGoz0Iy88amM
X-Gm-Gg: Acq92OFSHk7Uk8msg9ntxblgEJaa6Kk7GuyZ+ECfRk3hGwkOXc+Qx4SenzFOz32wdIO
	94wEdIlHhBq+lUQvF2sZk4dlrqlFSAcDXlR24PB3zmLPy2Jp5SR9ts4PMAy/EaqjwRrYbxJnggb
	Zhdwlio/YqswI9Zc0AB8Aa02amlMqd3DXEp6td/amtU6LO3eQR5OWgbGQ/RATytDjVnMwD892Qu
	Ciavn3UeXKjIZHLhLFGs0bfWb/poTRAOX1y7HoXokdrWlgrLj0eBY8iM0DPwJR+XV6N/6WPViG8
	P45FLUp6Rd/DHy2P88kfEoImeRWuCiE555PExZ/Edh6E5TZWkzrML8mAgyCL6/p5BuJPR6fEeh8
	iCALJfMe8EYKfGE1lV7z1oPcnVsvxxknzEmBOfv5ekjKqEuks
X-Received: by 2002:a17:903:41d2:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2beb07b77f6mr33920745ad.25.1779447029273;
        Fri, 22 May 2026 03:50:29 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2beb07b77f6mr33920325ad.25.1779447028828;
        Fri, 22 May 2026 03:50:28 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm19150935ad.79.2026.05.22.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:50:28 -0700 (PDT)
From: monish.chunara@oss.qualcomm.com
X-Google-Original-From: mchunara@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com, jsodhapa@qti.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Fri, 22 May 2026 16:20:20 +0530
Message-Id: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNyBTYWx0ZWRfXzDQAtxOWXEH6
 rh951bJqznZshmb+lDc7ZGTdexj+CZ4P9IN32bdeSNXdQWmx+e/lcf3EKqaRioaapK2o1phx0VL
 RDxvbg/cEkYduVg89Kv0RyFggAhMNZf/YUeehxQq1xrZeGAX4JHiWDKT9laFWD84xG/cvTynwId
 wCx2UO7C5wfq5w4X1KJVHrAkH8s+1wsNaWsbY6Ja6ALibFBt9CwQeC7Ns8MqymIhzZ9wuV8k65D
 7ykgQZc2IoploAfLttaKqrGgGqseYKPBmSedmCtkYzjCq4qmDZtvR233FRwq/twFNtrFQZUTs9w
 aEaJG86iD6qCgTHpbnFe/lzrlc0WMSULie8ZjZbnvT0V6zSqrrva/HPfiT+H0BxEPHPAjddCnic
 KWHCuHw40nX3/L7zxa1YJIbzMDUlzhO3c26e8KV543J1dIxP8jItFNcSLgERxKIg2PZf+0zGpua
 5Fzv9VOXT9fh1jDXWQA==
X-Proofpoint-GUID: amvLMbEjMWTfikr4479TLZlWZgF9eA__
X-Proofpoint-ORIG-GUID: amvLMbEjMWTfikr4479TLZlWZgF9eA__
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a1034f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5JD22pyS9HkwBMopzcwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220107

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch
between 1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 51b13b492472..047b4efb04b9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -232,8 +232,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
@@ -599,7 +599,7 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1

