Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595888;
	b=BSj+VWE7RXOBy2zjlal3h+AOYgLIoG47Wm4+xN/9lLwA2mAziWhc7uu86ZY0qxyPNEo/
	 YFgzcyNZExN3xblhCdUnYCkmV0gzplv7A7Rp6agIx+H5YEVTJ/5C53DaBsYqoa2n71dXN
	 9pJyf545cZhcOScmI5LI80ISwnWzFZrpQlAUMHjLok65nqkJAx3Q5UU/P9KI8Pf3tY/Y1
	 DE6hZwx6tsav8gOJ9cg2b4HbAGxx2Td6GB77vRWDQI8LkhFpHBWu4A/TiRypDprEBLrdM
	 8nAzTbwiLvU8FMVgsnaEqss14j5CXvQ2ZdHMd/6m3LCfKettU6EY2bPzr+KHxnwkPDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
	b=W8jl5coZJMqYLD687EfaXabSs28Be9/x5T69AQqsJCYZps7ZbBN1NFCWEK6WI86S3COo
	 ASf/FMFkFYvzKXykRKYMGlFjtxtUimFDH0dR3Xcr18FCzy2OpTZRvRUacFIgye7F6hzh3
	 tmjZmAa/b5CEiawYkQJGs3AoWF14cvhySDeS3UdT4ByOJnYkLtffV/lZ55PhcqZY9Y8zD
	 7Q/zbfR76JnCY+iOUuNk3yvcDaGeo38w4JI4XDMIp7Sh17mjd8eWmlo0GB78xm3JsecKY
	 xIUdsLkoYt1xcymadpPqWr6cvzTogtH0euw5g+k7NTm1mwIRBnOA+NRLrYK2rtnDsdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuC+0OEB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276360A381B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7276360A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuC+0OEB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEwW9657190
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=; b=juMBFt5fQg6G/ln9
	RkrfhmZCpWEYfGry4aXOj4/+pMiGw6UMNV/pX+x7BdIxsXxxbIZOyKvzH4/HT12z
	zFcBgJpDibSmsig15qm7ZJyPW0jtPmIJ1ZW4Y29pWbPHHrQusT4ViQTTSlOa7BNs
	JDSkcPiMEBa2DhxDA6WAes9SwVwQ24l9XGAW24OeqKH0xVXI0e4l8OzNzgn+YHz2
	EJLtDt4yQO+2PIU+rZVNpc5PnDjyfiOsAK7LlfllYuIFahPPL5XkSvLT42lQcAoN
	DVKH0drXCZPCOwEUfLATZUB+rVeylG2f57P0W4GkJg8gdEM/LsSS5QTjTK9dGr++
	7f1DQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4p13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:18:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1386194eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595885; x=1793200685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=PuC+0OEBcTxg3Awhw3aX8SIySTCnFlB9TWX2KpyySf5U+epwNtwaqyhlkq/jHSxBCI
         CRe9ER07teSMaIJhYKZNrpKd71BMDyr1rHp/zBLGra+zFNjqXa/OkMWyDK8ZvZUW4Bhm
         WkXAchSJatyBpEPZ/DdIgN0+91VwRspvMzdGteMWHWg6EpigAIEMlCnW4T07HD4qJLDj
         c6OCngaqpWNTWfeZB2+1QeJb43e6TCEw3RUIPTOd18uQFspPYPOYQwtld/fto4lC+9Fy
         Y3IepwNdGxQPHAtN35qqHVPK345xG/tGRb9uvWRmun+bWePv5Z1znkcKQybPQlr/X6sW
         dBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595885; x=1793200685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=jCkJG4yR3BQ7hpgWY55mDPRoNrgT/XB5qVKXsheNxHtVX/0ptj7jSvfYMXVPjjpsEI
         F7DPkCN2iyiPmAYM+zwAu1TWmJusIsEFlMPjjIp8M8URD1Vo2mpTPh05Tjg6Nanr8rn9
         rTHWwuOpT8uYZ6vAzK05Vbpl4cwltXNHDsO1NhQVDRElW3ABW6mW2sK0s5irkcR7cmkY
         sHwfPhW4bsjpOaT9dj12LAYty7KfnRceQqO4fkLQzq7FIdORHABF5x+ubuYjKdCcuuSf
         ElAjRQ0NRunOKgKY1vz1fgdx1I2zke4UXvO5/1kM9u9MiWSH0+wNI4tcZvRiu6OxmSIm
         AdTA==
X-Forwarded-Encrypted: i=1; AKwUvBxL8smZp6qLrYhTWp7WUVib9xrQrD9Gj1qwZSt0w7LzscALu8BrZY8FIJzpzmCVdg8SMXz1Jbu1wi3X@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9qtcuJb8FhomaU0jg9qtfiUEMf7xbENpsP1fIdJaoKF2wvnZ+
	ie2GANqNVTY7Ew1nfyDPSOW0oqeDGcv7SyNmiPL4ftIOJlbiFVuLsIe90D0ugydm7sSaYrj7sX5
	iNQfc7plVzvQ7MSyfeS/2omODRr8farPBl2mWZgmyFTvoMarDEiNqzTMr66lfBXKf
X-Gm-Gg: AYBFou1ZxWMSeTsXjQjCGGDxrnNTVeEzsgInlPbxOgOmZeda7YAS6DI215pxULC53Sj
	pXuPqSNA2ScZbvOHPCph8Gy2QrvGaoa9fCtnd6hZE95fuWEuv4rPfu8+tdPmzvF2wys1ZC1KkOq
	6J8AuM5eovmyTCKeJMp7JiBgykYOUFWBwYmfSF4mMDfjU6GztV1B4z/7U9VK9jGU+Qhm/Vlg8FD
	vESlPUSz0qo9dnFg2pfKZY8KCcmO8IUFJwMeIf+W7dRaXwJC2ExYcTBw9DxQJepUvTiyjjYGBjS
	XnYK4t6b9fDgN05SQXxiXy4bR92LiCDFYNTCJcV70PDsImTUsxO9Xyrr6lcYDZ3O+mbd9TCAI1v
	/18j47YfdBbn67JkJnXbp41mA9aPpoTN9
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341573eec.23.1792595884449;
        Wed, 21 Oct 2026 08:18:04 -0700 (PDT)
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341545eec.23.1792595883840;
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:29 +0530
Subject: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Message-Id: <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=673;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=PvJgpXbjwbKmN5hdDTOHLEi0wLguTf8dYpZBKf8nIB0=;
 b=QD7bkVOSV9SdvGpM2J2FTKAwcB/SWheGW/3C0KQYWHaSnIMXjLZrXgJmlttGvhy3Chng6xe3x
 7tOviLzTbojBgyDV6TwzXknfvvMOCGL9TJV8pOjb4Qeslv3iArQqBfr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX3SFFdfoZYHh1
 M5MRL3m8Ge/2PE8DVc6+VErujtxirSXbJqbBGYc4mqgFDMmzV5YQXpvQhzypc9dJry+AZ6poBS2
 s77r5sDyo664Nfjl54TjS0MAh/sqhq0=
X-Proofpoint-ORIG-GUID: bC7PrmM5L8A3IPkBa0Erm1pAUzHJQk3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX8RaWZA95NBmq
 6nR5OCY/mk4l4B1DnzD5kWQGt+67cQEWoX3Ulh2HiEaPd7aeX3X82RVXU0sw3aOopphpdhQzz5v
 AolYzace0RMqQxqQzYjZnuI7QvZRNvCOVIJdcSOGZ1y4HFjo4iGk2+SUI2yVnXi/EUXXk5fJ9Eb
 k1g7QzzhXWpzrwciyNQqe+wAJoxxTO9llNJZgWs7wzEgsaP9kh0I/IOlFFXYuDPOtXgv1VJ52jo
 V9dVPfE6LH4kzT6Yw14j/V/YucbdjO6khchLkAh1R7eNaENjJIMt7lTmWX6TpoTBdjjPds2DTi+
 UiRUIpM+YyUZ3KgqYOXLSjYwCcxvI7tiE3Xe45pk57gJ7e3esB6UrOn+FcHk9nkG/ddv1ZNnbB/
 N+9tk12+FALTzHknkLYyz2c7+KkfboS49yadHyYxa1np7NuggZ84bvEbsuXLdxNOB2AvcYikSpm
 eZC1XIwoNwnwq+X5KQw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8d7ae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: bC7PrmM5L8A3IPkBa0Erm1pAUzHJQk3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Talos Lyra EVK LVDS panel overlay backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

