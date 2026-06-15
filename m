Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB3381B05
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514786; cv=none; b=t9UTI5krMp1J5oJCZybNJfHT8FipETPgjWzaOR5wVeKOx7wJKhGjm5/TNvM7rQO8s3FeBvqhKNNpJuUIu+i78OUzhTu3MP6ToY4FqjgZ8N8uqf3uiYdEmDnjKy6dsRVv/dCp+2MOUXG7J4pvj40tM1hKUwpu1V46uzaVy1ml50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514786; c=relaxed/simple;
	bh=Ao4k8UCAQ63pTsAXW+nwl6jaANXflQZYV4NF+HzDpas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTCKwgmUpG0+diflUrsQzc1dALxHG5wXlfrJHc3dEUeClonaiCS6EVOnujec2za3rygavBFSm34fdkf09HOHqSayzeg7inxhMvC3DS6bhORLyTag54HpicGA9lvD1QDh/uowyFq6JPTxEL+hs0BiSfhrlCOjIGdg9xBEvkyQNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEI5Z90v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4BgJfsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEI5Z90v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4BgJfsp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F99HTM035918
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx+tU+JavHm
	9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=; b=cEI5Z90v7sQGWvONHb8jO52m6wC
	fmgZoRLcJOYeNR4JlBUnoH1tAl9QUjvCJ7mfFmMSv5Nx5oFAyVvQzf3+OxJaQFOB
	+ppN3Ym9Jw3I2rfHBKVSX0fdojvi+nP4wqQDejwiqO94BEalzIaoPj/FkXWZJcYR
	8aiyBmCzQlrHOOZ0X/RxHz9JWGGoqFnMyXdxoj4XbYWEX3jjZYMUw7Ib7heFaJlO
	c52ERPg5lDqV9D4syM2fHYWM2xWz6+OI+XLVaDJL6mkAq4wZXGm3vc2cny5/kD/n
	DBT6XMGO7vP5dyJA6FpRQ9uKKe7Rpybx0npYWb5aM1AShiFNkGpSxdoUhSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegur0jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:13:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c20f7581so32481405ad.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514781; x=1782119581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=H4BgJfspnRauDaG7VACJHmQnuQRqF33M2r2onv2ap2xS0WBszVkH9UkWzG4cnPIfPv
         vVsHeJBRsmBGPW8trWsPCbJzhiOeLVj3KPiGYpzJp3VAY9kxqXJHkldCQXKatLckCOlV
         f6bghKNmDCaYIMoEvwTR+kUDkHHIWBPTfgI8hCMMgKZOtpQQzpEAz2uQChEEwwL6w8pa
         eoqU8LSTeKGHcAucIQIv6AN+T6LuKSqhDszTmS2ovehj39ObcHARYhCZX/mqAf1oPr2F
         ovQO7o8y5eUu+vomuTk7l3Y6eCO8SIaturSlJSSwB9pJ4tGTSd8tL5gkuAmkPSr7KDPl
         TPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514781; x=1782119581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=fPQ4NbAOmI3pvgUmgLMC3yTQ6ofzjegPWyqtePLiGZMv62yh5R9OwKw5uBm4Awb77C
         adbOKFoAPrer5//Fzeb8vUYysI5vp93lTI+A/OEDJUPifaT7KgHGdY6gSXAcAiNwy6tA
         EBwWeqgtKmKSRA+p1dvXH4k60al1XowHyLHI6NkLgaiT8mzofRUbI6eEKEX81fQ/O/CJ
         PYC5XR85ffifpc2EfyNt4YaEzOBP5OCeYoEbadnvTwMOqnduCf1xUTBvE1DHASrRTP8C
         jsDah/Cnz2Zec/8P5uhVgkJSAkCJcT38xtQmbQ0jPx6/ZxhZdJobuSW2hXhazDsFgR53
         bqxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qKj09eraVS25NBT+2s0StUyvGJTGu/gdu96laz2UzVmhojbUrVVSeCqzE6SLLmlo7cwuYliP3iSIC@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzDE4Fc2oesJQyRRhiigkGm02IXBTPa7WKFfIMlUrrCHPL93h
	1stXZ89K8/Hhs5S55bG2SQiTNo5Oe4tZvfhFW9bq2+5WWb+oYepFl0S5NVpxDJOSweP9yKQiQf/
	mRVrn1smPom7HFEv2+/jOgnwzEUHt38z6KzNlfU7YDGq2Qjx+OTAJymAdjWlmyDzh
X-Gm-Gg: Acq92OFXXRTfLZAUMBohoSD5hLcCJHkklXgmeHcgcDACAIP8cj8vUYrAyYRSV05N5eF
	qo+1zpNJH72yCPJV0cMzS9BzDLL04+q32S6xLYtScLgv0zil9ilp2TCLpvVbQqKertBO3bb/b/t
	U3ddERR8shf2wsAU80ZgjF4oMEslBuVIDOxz6xUyrYOoTgHzwUVOHpWUM1CanYLIG4y5udb6RdD
	3t9ZfQOKs9JwtfL3PGKqgFCuWRvn0EIngEwRLG10lSIi7lLpqPOnlYWGuD8KoNLMXZ6EB2ZY00K
	n3Ui0uqUlCfBVimpkLyO8G+g1BId3HkyuN+wDSoORk2umBTLSyC+B8+cI3RGal/E69b+FgftQ5z
	JNuz29Uyieva1nYEbghamaiCQjPDx8W9X9jsAJ21pbtQS7shvEsMmgg==
X-Received: by 2002:a17:902:c941:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c411d79d0cmr150200335ad.27.1781514781363;
        Mon, 15 Jun 2026 02:13:01 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c411d79d0cmr150200005ad.27.1781514780889;
        Mon, 15 Jun 2026 02:13:00 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433079999sm91669065ad.66.2026.06.15.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:13:00 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Mon, 15 Jun 2026 14:42:41 +0530
Message-Id: <20260615091242.1617492-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615091242.1617492-1-palash.kambar@oss.qualcomm.com>
References: <20260615091242.1617492-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX1v/vf2TTjG1s
 SsQWE85ugPUxnbOS5fCXVgE9Ju3efhNkTtn+PxOJov7mYpE7p3iyPcf/NDfoJRB7Ak6lQzNf6DP
 VqzDnsx0sV+PtojVjA9BMmJzrygmmRJrzDwnCgGVl3unG4Lna0PxI2pvEQ/nllJUE4PrNC9nLAh
 TeTHFzUqJTCc1zP9np/9rUdCjNQQ4qNRYqWkxwr4FTpxxgdgi2txELy/YDMYtYpiiLK/kxvFTk/
 F+LKO4Gu1mNqqDIT1i+u96eDOtFq6L4fgILPTU/3+nReEEd2KGO9+Z/EKgnDt0bxpMCeSC5Qvmr
 kIVB540aXcHNulVKyTeau6nCT0XfsTN2dQBWxgzWFrpKRBzDQzeDzbCtdmKyQ6s0OGu904QMyRN
 he9pinMSvgXJt+INnFz0DWhnnJPWRjMMPOg47Txq32OcyLZEbiqdfwqeb/7ck/3AXTQPKOPyNAt
 kNbSzdjsOvpbuy/IWlg==
X-Proofpoint-ORIG-GUID: puBej0tHsrH1GgVPwdVZWiMT6A0lzqbu
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2fc21e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfXyp9SDjENczlA
 j5vMSfYA8QaFNuy5ZwDw8feaXdkTsOQQ00sDBebkIOGTASgB64A8Zyae+511HFpPQ7Gigalf/pT
 FJiMaTy/4+Ccjj0gQ6AhIYKIZqwXX4I=
X-Proofpoint-GUID: puBej0tHsrH1GgVPwdVZWiMT6A0lzqbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150096

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index b2c5c9a375a3..4efe40c0dc97 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1

