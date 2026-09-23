Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504939DBCC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134136; cv=none; b=OxjEapveGwSUxsfE0zfYB+5PaB7O50Sy1ZfZCQN+owF/YFOyLg+sPNuDEfAgqQF6rdqgfDO0HUAun1pxlA6y1mHQov1zy7876GuEb5sRrcg9J9lbEPm8AaWJhKFqqCb+aBAM3Jk4cm6DEXMqoV1bqttp0OJZcYbqD+17n/+iVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134136; c=relaxed/simple;
	bh=lVtM4gNQhK5diSNalLrFRgiXw9n7yN3qfT1UFSHTtgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+GGt6MZG+jM8CMY1V7CSnA/awej8Qse5iavQfbdUE/OUs/c8rj1VWYdeyiXxUlt71TfzevnQ5VptUH/ARUuUyBsXu1rrrY2Y2PRvjmcaYszUBYxZxPHhb6DUBd3Fw7IWt8qCio0NfKlLEZWPhx+TITz71m0uGq/VX4N29vdCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSOHTU7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcrH878M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSOHTU7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcrH878M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJD8Gi1166864
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtMmYfH53gR4AdhKWOmoFIiBUnMjy+NZFN/cLLiTJsQ=; b=BSOHTU7pFuhEYs/s
	YLTwu9uZD5YigWvPekC7NNam7057b6Vdz6v6OqwWKU/ELcRnY/SAXvgbtu3iSx86
	lpvq3NsWJQXORsDCfjA1V1O3CpPyHr1LTinvqEOruJqs2NhRu+jk/E/xUuQ+oOdT
	/Tpkv68Gu/8J4QKqEC32fdiUVSNnY1MMstXQeAbPNM1etNg3PpaYBex1io8+wivY
	29v5hh0tRtCHNYXka4FLQfiTS/w24x4DZnfuZ+Hkll8eBrwMokEy3Em8B1UJP5cn
	LaLGnYimmijtutn9OG4inpaQbOyKTR5lfG3C9Hw2D5J2AoXuwK3thBms+LJh5Rap
	ZyGIbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw1t1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:28:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso5410785ad.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134133; x=1790738933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtMmYfH53gR4AdhKWOmoFIiBUnMjy+NZFN/cLLiTJsQ=;
        b=KcrH878M8FGB23U6eQlkdJXrG4Se1Edw9GbEOvfxCfMnSpHQY03QaxL4aJSNA7LqQU
         Y5aWt+EaX3+yv+31Xagyq+gy+8kL+mXMAHe4QKRRRmkjvl2C+C7sH92muN4s+2nDpVnv
         vWlxbfs9FbeJ/t2Um8kbdUjFgDMDwNQI2tZ/uePa73OTHfDqVA9byzw9OUhvh72iDe2p
         X+Q1/lu11ZuZBwQy0k0C3qy68cuLvIuFVHBsEHMjW1UzDtOkMaKd6rPmvGYq/SfaA6fz
         AixIwPM09xGp4QCjyCqlW/KqfcLX3NbiWUwHmz+9zA4TNtOa8rCxslVUMwxC7NHdoi1F
         Pqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134133; x=1790738933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtMmYfH53gR4AdhKWOmoFIiBUnMjy+NZFN/cLLiTJsQ=;
        b=FPvme1j1DpDy0l2cOHtFOYGUDZBo59RukTka/GARFrsbkXqWKv3s8PkSiZrDhWydyf
         AOLsFZI00hpds3sQe3oTLBmeWq2hB5wlvQ4Ugoohaxz5hU/C7qVYLbaU1rn+UsHUbsx4
         pqsaNSSdKS7WsPlC9NFMohSl//fNQIpx3myoa0Eqe438GDLUz+EyAqg7hWpXeT/Pzqcl
         IRYStl3k5MVaSNrvyXyJ6ZrLhzffGCK3ihe55NhxBXXvxcboY7pCk9ePmfxP03C4vclO
         qbfgA423wMiCJFiDRXeQSZf/ctin6D8vf29G3tXweml5xf1JKtC7tLn/WPeOYj8uQlEw
         QYIA==
X-Forwarded-Encrypted: i=1; AKwUvBxC46gpHij6vHdfVp4Zxcx4Z69X+g6WUsOGk0DvrhyWU7pmw8GmGcqm8kiRZCGoRUTt+PlNt93e7+v2@vger.kernel.org
X-Gm-Message-State: AFuF++l6/snIYtZD5L8DuJv5gwcIRLR3lu9hvjANv+3gzRJChJtkOKxi
	FaDQSo5E+DMTm6wfayD4xKdX/1BW9UKtesF49Z5Gg9q1W8VUxDJIyy/qJ0n+PWoxVl1Tvdl6Bt/
	Seha9WVhP5AbU76PGON3JvkkkQTWrwMVKVDTgZvU4qjp89vAHAYfZRqQmf3CMlwNL
X-Gm-Gg: AYBFou1M3li0lA3QHR/o8neUS1shUYi8c8rlE0otV88h1HZ1C3nwIzMbogh+gDSH4nD
	UOid62op7qRL9l9vmkq9FWNwKuB7b2gteohjnemL+leDkb7/LCxwTiabzUUaBRBk42R4OTN/xkO
	hWnPihh9ddqwWMQjBvBYAGHdzbGmNrwAsz42VUTrq3Vb0YpNO3Yq0p7fZUVpBmxmSDkgXByY1ip
	8maEFfazZEuHAVn0SZ7BWoyq0R5WYkIvJfSb5SXddaO+FN/dJ6B7MLb6hcFaa0/jlhEb/thIUr+
	HvbB0PZKgQub2DS3rH/DSTjZM02i6/XiX6gjSmkVe0+dau4TQ3H/nbZm9VirQ50PP7GjpwFmhvt
	mfX/aNOKIN0K/6r+H3zOsodLO8hamnIIiBbdbQPWeZy1O5UP9Rq6lfqT+ppq6CyFeRPEhKZSPRQ
	==
X-Received: by 2002:a17:902:ce8e:b0:2dd:c053:ec70 with SMTP id d9443c01a7336-2df69dc7b77mr11286635ad.35.1790134132981;
        Tue, 22 Sep 2026 20:28:52 -0700 (PDT)
X-Received: by 2002:a17:902:ce8e:b0:2dd:c053:ec70 with SMTP id d9443c01a7336-2df69dc7b77mr11286495ad.35.1790134132491;
        Tue, 22 Sep 2026 20:28:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:57 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=638;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lVtM4gNQhK5diSNalLrFRgiXw9n7yN3qfT1UFSHTtgk=;
 b=//rqu5HQQtquSPF4r4bzuxK1mF38mMhJ/UBBRtYKaUQ1NeAzTJb1rFds/rxI7zQ9T6sZpGovL
 lnf9Kyi0FglAyYnzaH2youZIEsV390V0BINAWqGKvs6L00HawZa+vcz
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXxwDuMaP8CEYi
 xjlvhV1BgRFAXHog8GOza4mYpFFIbV4qxwd8jTf8C0DJxVBU4jGtwMtH9GCNCMiYjn8YkN99p1j
 0y62eAKItoXGQp5OdPwYEaOsE2HC8obQrKzz440ic1Ked0OwJSTPQ2wmX7Bs2PL3IRi0qoao9i4
 r38a4uibKNIxJ4zVVaDTuIIS9Ca1NFOsuPM4Xh/yzv/KKlelzvPTbxaPxxnxJlFyVRwpv12IPWI
 s3emA6CxhpRT8dNAQVs3UOQ1j04idfsWnXh6rvE7xDr0Nhy4Dzsex6VbekY7v6gYKHykUE/wadA
 iX9SWCkvlc1V29kjyf8bjnNZYBr6f7W5WfNGCeb9UqaKppLWndsVdnXIZesXqrXOlFQItKjBR9Y
 ofqkIWNbwtQ+CoDaZBjsOpH+8TIwB9IVxJOEDqf9sNDZ1B1hvxsXfA1J31R++60+2oKO6Oh0Gwl
 urH8Pi9Zsq3Av06XAcw==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab34775 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZfE5abJMpLnrTF1vLU4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JS4iXEirpf8zLbggnLMWeshrAvcUEb3B
X-Proofpoint-ORIG-GUID: JS4iXEirpf8zLbggnLMWeshrAvcUEb3B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX5hFNEHSkR9gJ
 vhrkDTdLBOzE8swlbVG6Qf0yJAHRtPntZeWIG498H7owxcCrmRdpgMEQQ5ODiSY8+K8Fc8lz6/y
 +FMsdcrtXX6vmJwQCeM6r6JPfHCLyxM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

Enable the iris video codec on the hawi MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9d426886a6afced6d3706b629e620..9b8616221b9c0d227f2ec97363bd4c076d8dc247 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -781,6 +781,10 @@ vreg_l7n_3p3: ldo7 {
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

