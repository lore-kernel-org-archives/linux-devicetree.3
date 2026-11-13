Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538264;
	b=33qlsOO1p+cSMpkUQGsHsdJ8IN+p/It24JU9Dg+gockOSWo8ZO7LGdr4YvTz8RgX4mcV
	 QGiMXCRbWI2HxX8MNCNTTRRAfq0ZiJewfzJjggMTlu+CsMd9Le72HI73hlYINzbMMaW+n
	 Mk7Tn9JBd8Mnx3QY5b+myYmb6S7npW3ycq7bq0BSMBDTYtoYY286FAFTprLXyXg8/RNgq
	 vYZq4DNC93qIq72Fm7lkU92wstue92q0G8oR0TIylULmDs2/LGSkSSXTvMfxORxFO04hu
	 JI3Kl19EttVgdS2JI+o+twu0+RToqBrjxfVonP3o9LjQMMAbA1IGTNKG0ogYWx4cmXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
	b=vQSKMur+codPIRMU2Z59eicWAQoVRzj2ZkpIxDm1JfAH1Z/RwXUynXD1sFytkA9QbTJV
	 gWf+ygmKSCWb8l/zfYZo1u2JYcIhkCMKR74ljQSbmeEOqn5d66jptiisMy99NRcbU/Gqc
	 jIx2IX85kxpqjPcjcS0eGYPRasIZjOIi7kg4JK6lGLXDPmlnAd2cGM+akcgnH8Im4exsW
	 cNJhI+vGs1ytYzvtkwMNJKvLhoZEbFk0NhpHMniSy4TIXWoIqnvKyEGK2ohSbsAy6JcKw
	 7h/JlNDl4bp6r1MJ+IJtnSidD9sm3UFCY3hJtZODd+yF1SDBYovw6WoDn9r936LZRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzQB+uAp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D47606A8AE
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D47606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzQB+uAp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2Kwj7538182
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KAm4KdCobwm
	m9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=; b=TRm8Iud5RorwuCOokFLouWVyGe3
	Ejs+Jnao3FEeMq/+YD3a7koXGzo7gI15ccwJDb9zzJYZCqWBEdgZJpDIQhrj45tK
	qfrsakbsc95Q7VxRdk+5brGdS/nCTta+FPpd+t6//L/rFTsL96U/A2+wQY5+DdCg
	PR47ghjCkso5U7xQJCz6rVisqqvQMaO6UnEhE57511zAvsCfv09P0rciTjSauNIw
	VRaGkQZN8SMWql4lV1Z+PIzgDLLLr7WSyyT4U1FkuMxgNtgSxwebxXJKcIwxq6Gm
	ma04+sdvrNWNt3RdhoqQXjWaQkeGkYOVS0+ptiYokmNXkCNYjSmZ4BJcvVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j31j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed276af91dso8883525ad.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538261; x=1795143061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=KzQB+uAp61609sez6uy/JvVPWDS8t4Q4SCDj9L6voI7GaMrqCeKTSIWWGKuHbDlIyw
         04C2agRt2f3Nk/XSsY7N52KKL1x41LZ6kGbOxNX8RSUfx7wCWqIgIyrswS5K2pOgwZMt
         mAqu9Z8Nd/CHRn3cEXPY6z1oy6aE3obgMFgNAm9Qy/vX9vft2BP1lGdRyGE1atInCKEp
         UuAmaVM/a8XSvl+4uC1HGwVLVQJtCp7aFVDH7lTTIKNy5i/tNYNSDA6Dpe14DLdI3s9D
         myodoZ5/OeEPel1uWGv4Jr5w57F+94sF9FQYPGnVDF1snIJjs9O55dhcGEW/PrYKRXHI
         kOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538261; x=1795143061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=aKwLTerU7stvwxP5JNhph9MNuIe4lB/THFpW6N6xeg4YRmAfH+V0xBGGp0cZhgGbTh
         JWB4LjE0sKX1dOzJC01B9i8mc/DXiSpC6AmDWH4YmU3HkU5tR7JX0fte/rUpQBL9wxox
         iH5NehBrQ3SwPV6F46zIHM5HapwjItXsQA4GwI5EJLHFnhrIpmDlfc5oQttGWmzBM/tZ
         Ec/JYaM0xrL98f/raCC0PKzo+/TmuI2U1AjqZQUgbOUApjBDECgp5ocDyb1hTh2oqj6v
         WFattx1uB5RCGivF5yPosyYiP96pwV5F6S0AWo2SzrUDR+HlijtDfms7hoVsAk9Sbcz6
         idEQ==
X-Forwarded-Encrypted: i=1; AL+hErEzq/dvfmnTB4XHBhcB9P3ybm8df5Ef9LdlU4WzRpQ3xEbZ32bZ8h4JtF+TL8XojKWNrEalXSkVr2u/@vger.kernel.org
X-Gm-Message-State: APuU4Z+lqOTbd+nVe1f8ji3t8UeOHFholaZ2PqSkBwfnw+tKdCu0XCbA
	sK4TGT5bvVzUtt16Z/9t//VMUTDPkqbMuZuC/kMFQYnlOjMjmSVyoH6i0onZQEtkMaHX+4uORUk
	vT5qZO5UCoQteQXzb9YbYCkPdFcHP9yEKRGFdYfXStpwFw7QiVJnGOT70rjupeekz
X-Gm-Gg: AYBFou0BgwIgtPJIdK4dRw4JjKyEcZB9deXCAZ4wl2m1OCgppi8c6bix73aRWEXaAop
	3MNebsHqC+owSoUIHPPG1xnFavDTFT3vCXdXZeDCGMpO0cdLGa20tu4IZ/M7kYVustGYaLMWZ/+
	B3xVgSM6MO/tDpXRU/gaafhHyI2FtkxK2bszNSPvD3XVAUaAheq8qBe3YclD5gTK43CVQ3oqkv1
	JIpZJ2Aqgx2VV8ssC0InHQqrqX+Q/FLNuM1F65ycFA7qvd65IIgXIwe34r3S8lgYv51bVIQnpD0
	pvKOXay130z3owJ44omNDAGeXvw6nf4xYoTfCwr/yB30mXRg7Ytbq6BzXLxNSmhM1e+MsWhZEjU
	XCUckrDOrj9LDJmSWwCk2PVi4Uuf7cAPig5kSH7iFVvh8PncNWBJySaOmymvAvTwuQUA7S+OXjB
	CDw7DQOoc=
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376865ad.29.1794538261343;
        Thu, 12 Nov 2026 18:51:01 -0800 (PST)
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376575ad.29.1794538260904;
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 04/10] coresight: Move CORESIGHT_DEVID to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:29 +0800
Message-Id: <20261113024935.3173715-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXwGDN7nDvLVUa
 jJs5w0JDm/fW777KXOTbNK/rgp+HBeGACQlXaSGLUJRFtkT1sqII9pbzvZsCs7koX5u0VzBAL7I
 LguBK7R6toD4crvcl7xi1Kpr0faVae4=
X-Proofpoint-ORIG-GUID: bDIfFdacEGESre9nzCo0r0TkX8mguW8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9fRFo3uRuOvb
 r0/8c639OTJvgKDzfYzDR7Dj0RPFRI9QlkgIYhMcsHz98p7pKthIqoq0o5bHJEbhJQ9SoqbwY4j
 LbmKUtGgf1msuZRZVsykSzNRVHDfN3Sr6krVALRsEnr55uvmTGcF5oelnBt9mE/y+qbxbJTTZve
 Agla/lomEX9pVtPhM6aIMmOi07lbqKIB8jAJktfrEmF4qLvdXy2jv+O+zVDBCJM5OvpqEb2WQ0y
 ShJrlslLxo7JwgNiRrgrneEp3NrUsAjcpom175679JQjTxXFgQZCfOVVSmZubFpZQS66DRrznzh
 PnOjEzwmTBXtoXQ900DhC2AhNjK5p2AAaOABqyDqBbQiNAo/xMRplDhcnaApxcRpIu2zzav5YM0
 MzCJTs4U7+ZoEMzZ+vNRHImpXFlCNT+Kc8CGo+Y7RnUqhHF7xek6jO7cNpUaEITF4onsww+jGgN
 Ao3TqX6nSFMWWYnwPbQ==
X-Proofpoint-GUID: bDIfFdacEGESre9nzCo0r0TkX8mguW8t
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af67b16 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=cS2XUTlU7a9WQml4CrUA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_DEVID lives at a fixed, architecturally-defined offset
(0xfc8) within the generic CoreSight management register block, which
is also present on non-CoreSight-labelled components that follow the
same convention (e.g. the Qualcomm TGU). Keeping it private to
coresight-priv.h forces such drivers to redefine the same constant
under a different name instead of reusing it, as already done for
CORESIGHT_LAR/CS_LOCK/CS_UNLOCK.

Move CORESIGHT_DEVID into the public include/linux/coresight.h so it
can be shared outside of drivers/hwtracing/coresight/ as well.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 1 -
 include/linux/coresight.h                    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 0d3f6229b282..a28b89d43291 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -26,7 +26,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
 #define CORESIGHT_DEVTYPE	0xfcc
 
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 0168f6abffaf..5286b3606581 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -36,6 +36,7 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_DEVID		0xfc8
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1

