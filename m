Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCAA2BD02A
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744185; cv=none; b=iWaPJl9+7ofmjvK/LXhxkl9fdQCFBbY+Il5rteVy+Joi35X6g80IOG6g/zmq7ZzjkzOuqNt/TpCrQf5viKlWi6w3H/sXm7R1ms6bkFngklCIMxzYTJMXodjHkms6i8u1CxSkMQ3c47z7D017m/qh50sqddYAhuoRyj/5VzxcIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744185; c=relaxed/simple;
	bh=vcsQuhnDkL9+Iv3Dw8GBBDjaqeyoGscxrjNNos/NwjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8sWpzXTcLV2Kfe/1CuiHXnRDWGg0BBCPnaxAe4ct1gSk3s1I238FHC/Huer2c2uqRTQ+ZRhCX1MaiIEsr06jXUpdLE9Cnvy72eXVE+3u8tXOntWAOva2XogARMOEfcpAI9Rm+GIIBFPGHsemlIEm3gGDHU0B7iLp8jNuNuqkN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9AvZyWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfg/ZJLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9AvZyWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfg/ZJLa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KMgst21127100
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g3x0JB5BcAC
	cHw+7lDDPFrwz8h5C7XMe9uVAJ+oaXRo=; b=N9AvZyWYedSv63qf8dZfaM4W+Ul
	aD4SPOBMBvJl2VOzdPjd5UbAd2Elo5spATpWK/jijdDLiw8e4G7LAI3xlZRSt6nK
	jK7THx53r0VszrMxd0G51LI9gpKJDjCoya4D6Z7YnISjswEqyWYdlVqfWOmAtG5x
	A/fl2B6ygG6SKtcZ9MNSNrbGoj0gSp76sahFq5Zrtx1fbFYWcWgQWhlBTDYl8Plm
	Xnl8zNR8v7tmkxqjc3qPHj+906NPopZ/c9DPRAmEd64wbPd+1VL3bZyXRpviBx2V
	Md4k47cY9NlKDdED1mrzpdvfT9Ez6RLzC6owvDZAnqP+NrxFzwbFAPljrYg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68rspw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:02:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127876be621so3308618c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744178; x=1777348978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3x0JB5BcACcHw+7lDDPFrwz8h5C7XMe9uVAJ+oaXRo=;
        b=gfg/ZJLavNiqI/C9k7/vcc994gTKdFiwYKoiw5oP25eTbjqi3SZoxLMwHviPFGb1n/
         TxOiIpk5F5zMmggbtkBLs3umlCzVRoXfvTzYIK2IGfHVshcWUvHp6PdyfyAb6mq3Dw2R
         5N7mnOizMTO0Nb6KoQx7quV0GJ2BDzJtIThNmBVeLUKW5UANNxE8f7jCgCXy1fPn/w5h
         e3FEFrCCIURNS+xbgQUaZT7yzV+/gKTcBGqY0tN1+oUf5aUhaw2avYBmkoB4+SbeJvY2
         FjVkcOZWUyp12PICOgpQtqD+yqY78yTt+dANcnPHG2JyFDlr0iG5g1KfGgOKpGlPTzjn
         GGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744178; x=1777348978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3x0JB5BcACcHw+7lDDPFrwz8h5C7XMe9uVAJ+oaXRo=;
        b=biXESdYRFDI5EArGeosiDlwK/b1FcniPvPc6h5SS+8DqYIxBK1lqpf3kopjBTyXg7c
         FkWR6JVibd9ZwkP494stoF9T/DU0aZfgWXYgGwaizUM93m9ZpqS9xoL+SvnHomDoQZRg
         aT2l6QhvZrETxUVS9UXl8Z455PPWKf/0qY7o/pog14IcXZxJBVmc/hiBd8WPYU33M0S6
         EL/2X3MuSfPwvP4jjSJQwgfBub5IW1EWyT6tYgDokMM6oZ3LOu3q8iaAYN8uyQFNrPH4
         G0ddxbxj6nhCdn8Kh8qTPE7SFg4AS7YrPq4slr4d6u6tL74BMi3fXuwQckRb+WcMSxZi
         iSXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yig7NVJyqvp2xCCZ6gvjhyorNezfRnzMwfvOJ2oojkhdYFGEhbsLjOrkwSGHbAmFwiY+dJB4jiUlL@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2dg5OkDQsPLw+YZFpfe6X7vYHrFr55grPGqbj7axk8NMR/XG
	gnOpAKsPcwZIhzMAd036ImWUneow4vhLkfRyNS1o5u27tytGtcma2nY1wqFHlpFiU2VP3xg+hXw
	lEXH02WEYR9O19J7W5lvx9nnvf6RWQ2Sd7ZnOopw2i7MyMJOyQAHkGC7jk2KOJi93R1CNrZadnR
	s=
X-Gm-Gg: AeBDiev7c2L3luGYG1xpvSS4t7XTefaZZsTUueGfqPseAQpJmdiDlEvfcXMwcTBlmSI
	YZjTi3zAXkvKsaxjo3jUXBTVubkU9gNZ1AW0Gp2kyNhLfoMYIqV2TPETx/G5aOzWFR7g4wJ3vfN
	ZUES1l24jx/5qo/Lb9ZUELJgjvcpDmMYVNXzMOcP8IZE9Cjdt51BNNFXb5dEnJzKxCr4dJemerA
	uezG9UTSG96uN/CaPYL4vu88uXfNBOcwVyrsOytKX5w83TZol6lSPpLqbkzocpyGjNQvhnbvggr
	M6nHmqonYSTTgTHncWOsJX+/sIfs8GvZ528YZM4FUpjkqwVfz2a0AnAUQe2QmevtVg1I2vNV8HK
	CKGTZIUS30tcgvKCJo4/Fqf2bPufpfhsIJ4FTjVbgy4kyBaUaNRaRAFkY/VI6+qmV0RnxoCuJFq
	yWBLnIJozlTJiMqqWk
X-Received: by 2002:a05:701a:c941:b0:12c:87f2:90af with SMTP id a92af1059eb24-12c87f2925dmr2601761c88.12.1776744177608;
        Mon, 20 Apr 2026 21:02:57 -0700 (PDT)
X-Received: by 2002:a05:701a:c941:b0:12c:87f2:90af with SMTP id a92af1059eb24-12c87f2925dmr2601741c88.12.1776744176998;
        Mon, 20 Apr 2026 21:02:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm17386359eec.9.2026.04.20.21.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:02:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
Date: Tue, 21 Apr 2026 12:02:30 +0800
Message-ID: <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FPLGbudBEmv18qIu2g1DD8ysdSFoO4zt
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e6f6f2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qdfhL6B64FGM_Lu2SakA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNiBTYWx0ZWRfX6eKngXMU+2xD
 5zamtPebicYa7qi10MmxFnMQkhFOoiAcJhcD5yro5D9OVVXobzk0KKzU6AkTbixQqiSfLyjP4Ks
 ocJUmmCY8Oe/h6/PhT0eoeluWlrjs+Pmb2HI+fImGc/c8L54Dyka+8ti7YxyIZ0iuNXNX2EiQGy
 TqWl8cZbLdec6ityWTcSPwzQd74oU9Z+OjV+fPJEf+H05ocyjRInLBHYvqn8x10dPSfQkZmjTwD
 W4iyxJeb/U1Bx9Rc/Z+NgEkgu1CgjKgY7DtwEFQ5ewlqUaYQqWKiKYqVKwnMZxbDe1mhmNQ3TvF
 3cDiM4zmf2nSKYb3BLaLqkLJYbxe1/2TmBJdygdLlFdOL2wn5nZIkyM0aYXfaTjNMvfY8e5vool
 AyJhyeR5JSPRfOx5dDOMZKSalBoNAmTOV6V4QZAXoqpY0eXYTyCBHflie64ib4Wkpoi8ShB2+Ja
 VKjO9QmIt7ANgBXQv3A==
X-Proofpoint-GUID: FPLGbudBEmv18qIu2g1DD8ysdSFoO4zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210036

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series.  SA8797P is the automotive variant of Nord, where
the platform resources such as clocks, regulators, interconnects, etc.
are managed by firmware through SCMI.

Add SoC ID for Nord SA8797P.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..be4657417192 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -297,6 +297,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_IPQ5200			765
-- 
2.43.0

