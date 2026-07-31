Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8E175A85
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480346; cv=none; b=nRR1wRVItvy0M477p1n2ejXRYwPRiY7cTZqS5GXswaxMVgeejdU7Evf6KUCPIVcNfnVDJ5nxb9o4yGFZoISrYDTebc/yRdwXxqHgnPp1YYHMfHzmWjhak82mRwIiCwmXXle8crIkgtddyYLbGTmjpT/ZnS2207D6QUWG9PRQ1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480346; c=relaxed/simple;
	bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHUoSO/9fTPbXaGiwDYWJ9zkOV0reZ/4WUZVA3G0u07NqJUA5CMWCe4TXwxNW3G5Bx/48FaxNZL5dyJC6tvMZWM98oull9HCwJIJhTdiuyEMQ79c6CRSe6sRqAlwFrx8APfpprfHPbEPJZS385a6+cmm8SPEc8W7OQ6E9Kq64DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adWYO4vO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YB/9AkVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adWYO4vO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YB/9AkVS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6BNO63310204
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=; b=adWYO4vOwJgRdG/G
	A8CKQSxXdVGZLUX6WWrTyQJ+g/QDgimY57Pq5Ug4RAlTsvdKWjf+l10IsRYRWIRr
	Cl9SjoE6BB5D4DhoRTkD852YbG3nUijwtIyHxO5mhychWgP8bqiMMjw8SpuOOUzr
	64FBwWwIu4g3VfKokQZg0XweK9dbi0Aj5ew5XYDjYZ6gic6veqF6g4D1P4DhA5OT
	ZrcQSOv7fZEiDF9UggXD8pSXUT2sAL+RdLF+apZaGZsHRKjGhHrgdYny09anVUX7
	ckqfSOz7HNRLoCm3l6PeE22PMOf5sHlOGLTWX5irfSn5WX3EVz6ROeYcNjQ7wUOU
	mCNgOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp7g84k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930f5da3467so62911585a.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480343; x=1786085143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=YB/9AkVSNz5hZRBv+pGmWfHWuKinp4GEyoZLewhdNFrMiso4m7MapbeTFdhejwBSOv
         RU2vO3n85ngG7G1KwWwO31e1INh/o2bw+VottIIlvBIiEwGTHmsQ+s3w9sehulwZED2v
         3AqCGjAQohDgzMZ9Wti4DbGTdYdbhW/t05dDrBbSYI/NqQxDnOmkz2Ivu7OwaRyG3aEF
         jQ1PMeiKNKWC54TTrr6vj2QR3s3XCh9WUvOiG8reo7uc0SQw7/Y96+qP8T5hyKDYp4aT
         KgywYPXJO3gMF3aa4PvmzEmIt0LVGRftA1+IYAmncaPtA6OyREv0f5AEMAQ2oo5i8HjD
         uAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480343; x=1786085143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=JtMFrgZAReb9KKNTgcDquL/Z8Firmm7+Z5XfuOgBPT+JWSN57T70YTlVsxKpgKXGWt
         MbyM5UqvO7Fs087WcK9npTrKKHIhNM1LBIs1V7CayfpRQbETllqlyZsM+U4NbBI5h43H
         rARYUZraOHwpvc+1tXilX0tE/f9JPVi8sUC/YxqTf/hrJ1F+9UviAILkWFsogRTqDXbN
         piDg0YPegwLzhDLBviSD1HrFD0qDpA/9bxz53PwJY7Z4H6yU+DNF7erbH5aDKMe33St5
         MUYafbzzAhZ3daqYyr4XU+kLSqSk7Z05r/dyw0Y+AHyT3GxKpsIsHUhVBip1kpO6+Fkr
         R5Ww==
X-Forwarded-Encrypted: i=1; AHgh+RpwmAtEWqJ7ZLYFOLj6pupGsPwTDuMSVeisQX5YJvIZXWXA8DuCaXVaXk55iXbBSO+w+rSitEwPiRA5@vger.kernel.org
X-Gm-Message-State: AOJu0YxniJTPbvZ5LiOIWzho1zpOsLLH/GftL4w+i8EDFwxLwL3zkw+X
	Rp2bsrFsDKaxsRMi07MbIsQhRWV8leh2gYnw1bNOlqomij+SQ9GKEFtIeZJpCWwn/qTHwyn9OxA
	/7Ktcr2CAvze9UsxkHw+9/BXlPpWj76BMF0byVBK5IrAbwW7YL0tqM90D1xtkbfKc
X-Gm-Gg: AR+sD12gupwGBpuy1CjX6WyUo4iF7ioqMh6Q4s6BHg+Hp/4fRbPbnImqEsqXH9UmLx1
	YurNd8ow7ah46H9CPQw0W9GB6Pqw0MXfYGB5ctiblQQh/hqxAR+vm//Pa+weaTmu3EXzIEtPeL7
	VSX3rMZ4N5+Qwjf2zZt2UB1iMxb9Kk97fhPinf/aexx1wrx5R8nr3CMyMN4VThGJOmbX4PhJHsl
	Un3wyUPiqmylnxhVXV2xB0PAWBanIQQa9uLiOV73oeC0at8ZHnjvccxF0j+Kl+c/gndxxNnG9DB
	Ie9/PKgB/86/G78AwfDcg1snIKZRKlU7x/VM1hk52Q/VshS+nh/JSixyQxIo09Ww4Boe1P0zGNO
	T+flf52cXh4E6wiDJDkdxfvtZRrpGo3oQVZXPIKmJWR+7hUjwLV87Hf0F67uTaIqZGbZc
X-Received: by 2002:a05:620a:414d:b0:910:bb22:d426 with SMTP id af79cd13be357-93499b29b89mr44159585a.33.1785480343119;
        Thu, 30 Jul 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:414d:b0:910:bb22:d426 with SMTP id af79cd13be357-93499b29b89mr44101585a.33.1785480332259;
        Thu, 30 Jul 2026 23:45:32 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-934971773ffsm46107685a.29.2026.07.30.23.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:31 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:44:55 +0800
Subject: [PATCH v5 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-og0va1b-v5-2-c2b90b601241@oss.qualcomm.com>
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
In-Reply-To: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785480319; l=842;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
 b=2DQRx1++4zk31hdYTsA1ieBxVttN4ZS5A49UTh3/vBvU3L6iwD81kRnk66/xlHdNmScErKxRb
 O0pWAgBUvk9DQsXiM9527lpqZkYC4xWwj2Iff6WEWIn5a//Y4XNAwX+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=6a6c4497 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ni8zlDty7YU4e_isgz4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -RDRokEBro3yom3ZVnzFO-BJbIm-EWqH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX0cZNXbNzjJLP
 AtqWYSjA9P4y5xd2p31pHBHEbEyFi4uWNOx88R2nmDeaH8Ro16hjTcXuWLWFQNptGuoX/FLI0SQ
 OKSzvWtFoANSSJy989Jrk/a7FbgATAs=
X-Proofpoint-GUID: -RDRokEBro3yom3ZVnzFO-BJbIm-EWqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX8XklmvJXT/EY
 Bs3S/ZlkoBWUlzwSbqahoymSuokgXFBKRWan4gcHOhzqOBM4GQb9KqamrwvnFCFbZN+G0J67EBk
 jf87IXLIsJV6N0nPW1gVysotUaZBUvfqPSN5d4EtRtX4Kum9uMuA2ylTC+lGnZ3q9boRy5IwIDV
 /1RNRNiTm/+mDAxWbiiXxmpiUy0r/sCyY3fdfWA9BQZRu7O+HqRte7fwZrFycXau5PFQB6Ch0c4
 ZbYpS2rVfzfm29/5zG1IjJjyzkojXJWlQamXTKvV2b/2k+myJTEKdg86cjfpkYwoPlW0SooRV+g
 661PM6T7svb7Fdk2P5r73FkGhwwT2WDZW5n2NyYW4yT/oV2uPeLmkCi4PekNFjEsJEZKh8NeFFJ
 hSXFBOEln60ABZh8nKZnqqxHZ9HRtpV7Xx9UloYXMAeZATQKsPHP4/rEiogZMn4jCjbrrZCT+Hv
 cx3/trKJwSnQdRo84vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310045

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

