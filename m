Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B502738C423
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131332; cv=none; b=dUrjUq+ehNzdlAR0nAQK4gAL9cMR01u3fja+kqp4kI/oSojILi4uIVgt5MhhdNq78B2GY7/avJHlX8MHYUpwHwty4ai9sj36VxEVrM/jppBOl53VXKXzV/SJ+4h/1ct2tqfCvdv/lC4LGqKxjpUKE93/wN5OItihiVyr95P2ORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131332; c=relaxed/simple;
	bh=NIhNVuVEby05+ttPZxNAlBHKKYzqjKUQzmxJtSYqNIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAJxq9ZBflNQ5gHC4umvwgMoAiNx3gL+I2Pyl8m9Y+Kt05n/LC0BcpDjVBLVuWBUYE7Rv4YNyFmlmaLXN+lHD6KHB8UyVS6z6l9s0Qk9mYdcrZjUXvJJQ1WzZn9yzuB7HLOWqccfB3xX4hHl7pl+6IS5MQXXrm5Nbwpj0c4vjGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0NbSzgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWN7sBiN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0NbSzgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWN7sBiN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBj203897614
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDCg0tf0ecoYoF2837PPfGTHEgxmlnU2xZXRZ38KHSk=; b=Y0NbSzgp2pj4tK3Y
	qHXS3CYhp0ak1Ph8qCsMekrwI9HvS8NDedSmubGdGs4bPcCZiRp+Of9MSfPjf74e
	mgL15cwmga28YSC0hZPKk+Lo0PYbWEbawR2SpGaH2lxy7jCNpk/AW2GvLugr4ukx
	DCQ5diAKifq5tv1MqJl8c8C3CcdtedjBhHTX6BvrLtsCy9oYr0r6c8T4bfRovDlX
	Ur/kQPhW82fw2wwR3fdnw/jdbbkbGWq61QxvIBBcgg4bySql1sumbtvUux3Wmv+D
	fuILK+3SqbHf3MHIketGkp1g9GrmwWkxdU5+Abry0Au0vpXekThGtliZIL/2vIOP
	5SXf6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1m9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1147236a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131329; x=1790736129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDCg0tf0ecoYoF2837PPfGTHEgxmlnU2xZXRZ38KHSk=;
        b=QWN7sBiNvkS7O3f2CRKqFzS86EhTJk3BoWIU4BcKwIiaNtxwtvbkTHL2fPZ6cLuWlJ
         B6S+jEk2V+kbKkzur7wb26VzfHFd+AP9CfSN8TiJLFA+fQdtjw/oZjfezURSgpmLq+CU
         oTDXmU4ihdxtfYNwPPKC506RtVDGj8vdjjfBOTKO1ugysfIqDO2HgbOvnRaJiPyUjfwe
         X28erIiY7avN7wzFs1i5mhIo9IgNzT1tHT0b19xGzv3bmCcJLMRDiWDPILJrWIDyMy5L
         ruzzQ7cSt6Ujt8hPpivoKy1a/dJacc4JFtrDgkHcLPGXx0L7sGxJ1y81bWrdpLQBWR54
         xRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131329; x=1790736129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDCg0tf0ecoYoF2837PPfGTHEgxmlnU2xZXRZ38KHSk=;
        b=QS/Rxo8XJml7qx3AwWZZbYLScXrZqyXEQYihiEFsqjzetUAA1lgY+IvcTAoit5GeR+
         28czoNAw/0YaM7trmIhwquBEb2rHsrDSXQ8U7fQewTbs/Xf7ErTCQ8CtEeEyEzRNKlXA
         YGUysHb1+GnMmbfPkn/ARwFby8AkGXWZggvI+ZSYSQ7zNIB8DoYkMi3H0NdgH8NsPVDw
         fLTVWCQI9in2AGQR8104kWsKoPidsXYbuzH5VpDIg5ukkW+apGA269uyi0Imd29EQGy2
         UCsO+/BiD28UD0xPT7SmnPGdIE0tQcCpY94GE9lST7b+/4US/YzDRTkkoU4oywkX2O7e
         yVpw==
X-Forwarded-Encrypted: i=1; AKwUvBzwfPP2S/9aGF7eZYmYKNNnzmN9JKc1u5P+J9j0j4kmyNFdIikN/I5plujVYB8MrYRIUm1mRvZKS1MB@vger.kernel.org
X-Gm-Message-State: AFuF++mWLyFVDwYfB94F50ytNZ2gaOINf7QwmSHzbZW5PiLaTQkx+wxi
	uS9NQIRVu8fAQfVBukk3y0YdRRbj1kKeXJlwcWJkLFIOstvnzKTw3DRobgez/WN+7mlkVxKwgvg
	yY0Jm1zFkVrMtP/ipKygntoeYiokrGKRD+WqzLoSv8ZLjnqwW6sBl82i8LdL+3b4F
X-Gm-Gg: AYBFou0nwJo10EG8fOLiLFggs7NbiAFNrsLej/KUj6LZEx1F1xU5/JEolArYmaaQNPu
	p1aj2Vs+Fw6UUDEZBe6SlxN6EPMWRWz4O+bJ/gyVpwLMrThU7Erp/mKfGvQ9YfsgQLC5WbL8MCq
	jGXJFtU8ol7bg/C26HPvAtx5xNDi8nDoiWcjlkPiMK8Bi3tgpOrF9q8GeWzzkxu7fXEmk9sUO78
	B9MZizBbWQgdEWsUx4UQEgv4qumLmtJReHdv1Jmqdilo8wjUcOxMCRrpghmZs08g28au+on9Fkq
	myQukeDVAJ6zdiRfS6AL3oeeS5kFMWPbO4u//5m1aWpzTssWHZhl7IKxX+fnvQulb0kib/OBxwO
	Wd+WNwBen0BlQgrBzVCWJFRvtuwF9rRNE1/fror1GY1NhjHMUJfuLGbbX1J+lqzuK5QVMQKzds5
	sCXlZ4niYp
X-Received: by 2002:a17:90a:d60e:b0:3a0:4444:ef1e with SMTP id 98e67ed59e1d1-3a07e567098mr1177575a91.29.1790131329392;
        Tue, 22 Sep 2026 19:42:09 -0700 (PDT)
X-Received: by 2002:a17:90a:d60e:b0:3a0:4444:ef1e with SMTP id 98e67ed59e1d1-3a07e567098mr1177531a91.29.1790131328795;
        Tue, 22 Sep 2026 19:42:08 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:42:08 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:16 +0800
Subject: [PATCH v2 6/6] arm64: dts: qcom: maili: enable iris on mtp board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-6-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=644;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=NIhNVuVEby05+ttPZxNAlBHKKYzqjKUQzmxJtSYqNIA=;
 b=8/EFS69F1tqXVU1ZtSteZJh7gbva4OFxGkVdb9rJGsoIxjNhY53t/WOJdVvpRqp6kM0A+qLA9
 VRcEaK06/fVC6gDNToxw6WydifR5TUoBQ2mQc5+ivy8ahFXMvEFxXG+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: xKNNXnywXCAxSPFRblPlV9_3CMXICAOy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX/AR5puXtdw+I
 xaujchRClccaSN5xwfgHlFx6gRlJ1v8KjuG2JoGv/3B1vMDygI2MeVUbkdnI5anWe2MGZkC9f9I
 AbWm8EMCDL0rb3SUn2wFaJfuZ1MO/yo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX2UqG2NlT8DRC
 eRiu1v3K1xM6sCwv6hGOnTTNbhecE6NVKI8NYh/qhNdEszRhr8xRDVBjV2FsiwVD4H0K15UsS+B
 f7tthLEvRcmO7LFS44dT9zsM/4WBE4PI6BDVQkVfoLI8AQ+sHc2WctljVIfNk31mjrgpVbJtt9o
 R7yITbjqPKOzxqY11MGehvvP5wkjy2yl2JW46rhY5JNZULyUW3TesYnSYbW0O7xEwB2uOOA2meE
 OSQMEH8ffThg75as41e74EdRTGQZffmZJKH750owoPs8AGT0p3BHgpvSkfx+r6TtrFqHDtaGEys
 Bb5CeVYB1v3uKAr8Gn/8C8GSXjfYYpEfvH7+wbuiHYKVfK+B5+j/TVCWI+oCqHHl/yHWEA61Epo
 RVL+VYbF/JocZGIl73SKidbwdHx3Krohkpyay/v2iKxGflTRwH3cfBbfhtoav0JTcLqSQ3XATrM
 TEFf94vO6KghD563qXQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab33c82 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1_ts_jfFenCfOmJzNDUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xKNNXnywXCAxSPFRblPlV9_3CMXICAOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Enable the iris video codec on the maili MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 1fdc91e03271c40640910b57f3187311b6077ea9..88b452ec7e985dc1f1b87a56a16aa2e5dddf96b4 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -743,6 +743,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

