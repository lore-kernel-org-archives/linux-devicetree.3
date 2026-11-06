Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973359;
	b=3f/jucQ1IzndzMNrFJhViVdpp+mP4SUeJ2YxDJSmy44a84wDGHegRcj17A4M4Lt829YC
	 EJUjo5VqcBkJeQdqmLwsE7znGr8w3Tg+L3qbs+ZRTuFY7SJ35Cy8PQ40Q7DahOcOCSDMM
	 Vyg7rKhLjOXdg5qS7n7E/AvnglbcrYQb9rN0BbNVk85CN2ZP3L4ox6WJ/hGCH+sDyVwEa
	 ltVEgv69AZHVtyz1MYxTsQsXmyZwRd3kibsuKN4yZkFhnHuOWnDSDoMvH92IvSI8Ybz8l
	 Xf999a/UuicGj3ya4ActVtz5GRKylSWZ1xaFHDkmcFfk8gLf/TuNjZekmBKg62HyUUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=vTCupBwuZ8mzwcHc6InGWwKyZcNMCudl1/3eoM1hNvJuQ3zQ/Vr0+Um+cq6zL0+09AJO
	 ETPnJN9fjhp8IU0NFhnNvoDMz7AndgoYqNyDXeGMv7/+bUWp36Yl/tbh8k6Pc7EKbFMU0
	 cN/1K9HHnehm6weCMlio2CnRfKf8haiBIoz1cNOh9grp6HTH5yXAgq62tz6y1sxHieiZJ
	 +k7rOcDTmchICJn0m2cKEyWYZmFwtinuJDKsPDbXiaXpSb2zKkEDdVOhaBhM3BbDoFZkP
	 FVArJ6H/KRPRrMKtDVIA9c7dtUA0N62Yb7Xa5aDg/3tx9PZR9bMhbysQ0504oXg0vQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5A606D801
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C5A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoX3e557995
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 13:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=US2nmvah1yJQhPOR
	tKx9LUKcM/vHdZzQt0Phcfi/T3pbV+zRYzwXi0q5dvCA6MAKy3DETyd/S9viuPZk
	idcXvg2enG5VSWdwNK22WeaSi28jLTvsDVjQZRt2v+A6MCAswGiBOkHqP6UH42Tk
	+3eFXZxFY6mKE9lPUd9sn2e9h5kymEf2vpIq/H0H51rU1sStrMoWxaOHYVYDa+1D
	PvmniTx2gfwR2m/ueGBBxGrs+kKWxSk37d6Z7rq7xkWcOrJLFZ4YjNJ7mceLaum0
	qvoYnQaEETRqARToLchkLRUUtFrvQxRNQxkqQ/e2oSYK2pFbJUF813x0hcHRANpI
	RqShGg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pau11f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:55:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc694cb4adso102984137.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973357; x=1794578157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=L8KV8Xf6To1qNWXhKLDVWSBrHCkj02pnREegQV/Z3bNQAT3/bmWN2E5HtwogiE+2PK
         cwNueCDlPrb+eFWTJiG0u9REle69greJajGEL0uTlg9sdEH05NnwRvMuXOK4WHc8iZC8
         cpEHl/9da8Iq2miRu5XxmiilR6iviYKmtTokJOtk6OZ9JwOXBzKlOjn9KCOrV7oI41ae
         tAU43Folq/FrhNbXlE/OGgnGIa6iuyS+CvDeJS4vMJD81L6lPVaFyYkRn1ILrJbgWkX0
         svzBykZxOdDDKfC1Vm1OHmuZ5oN/z4zZPJhgK6qOaQHoNU3m5Ij6cIUvDWuIBWn3kq/N
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973357; x=1794578157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=ELABKQPj2nO1tzi1dstjlBSHOsWdhq67vG5QcjwN2ABu/zxZlzp4+6liPhyR8rsP8Q
         y2Cv/6ntEgpGFdsmrZSIQkNXNlyNfQIUnc1ybEyiLOyxOMA2m8DQgq/Us7iSF8QvFMWS
         XdxH8tmHAQ/RqSD6JiZz2LpKFsaBesPe1lRX8V+jG+Ko7S5jkxof9OXfgzh2XAwufjSA
         2TwN/IJn2ceHzMn9gqAjoIoozLzGodqM2zvOKKdlhO2TxSjoQFYUT4TqzJcGxu5djGsw
         pF7YGZ0ZQngoSadCW2V7QId9q/7BwiDGHvkYQmV76wyRS0lqqrx43pvE8nkI6XqUz5nn
         e9lQ==
X-Forwarded-Encrypted: i=1; AKwUvByr2OV4aHICh10CJZ042hk1ub334o+tQzOWuJtH89WS6AtrSMkBhARO+8UA+ieA7N37FIM3DHhMUy6Z@vger.kernel.org
X-Gm-Message-State: APuU4Z8J2MA852TFEmh+4PRluIKzgODTkINvFYjoo03UbKFvihDgigdN
	oQ/tX1lEGbJ6DwYR0v4UQnekp8GLBiBRIJKonQy1ylYwbcN89IV2bWpH+QL+iESbu+ZdrDXbxZ9
	/UbqwJnxNH/M/o87pxGfC0srkmmMzjMBWSGl0ufDRTGk1a1PkK/2ynYwGL2Is8HtX
X-Gm-Gg: AYBFou0/szG3niG7Krm/H0sB1kh78nzBTj+HEnH9DaMXs5Kb4z/W988BEsnYHgcpPxo
	7e7Am2SU3XKc97jIZriwe8nNX7+9yuTIjDgY89AC9W6Tn+lOu/3/kSoRN4Drgi/SxKwetmWyLg8
	JJ75Dt4vNj95Jp7SV2mdXN6wA/5xNJj+UlAVbph/8Zygusb0+BHYPCOJIDGj892VRjHtLjUIBkT
	6hJ5XrAPpm09KZtn5CqeBUWXSbbn2CkSbC21aYyaZKLG7XJswOp6pyVfFj9w42VG9p26IwnPC5j
	V1S7rptQbo/rP+hdn1PhaTj3JhbCoh8MufuGRBUtZFrL+LVojrZih2g+6/YweZHhxvtYnI8rY6l
	j+uAt5SRz1XdX5Rj+68s8g3/pc5jX6lQ6dkzmG32wHfOVGOU8Yegg4xnOJGK24i0+dg0T1xQ/yT
	uFDSwawPmMNhXKDKteMvldXSzHJZCqu2so1IeezXzkpeVyndfXHQumnpWbj3MILBe8lPC/LNvDN
	mCrT4HoEe1OIrj6bi8JmIophZ4v
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297851137.9.1793973357099;
        Fri, 06 Nov 2026 05:55:57 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297841137.9.1793973356609;
        Fri, 06 Nov 2026 05:55:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:25 +0100
Subject: [PATCH v14 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261106-camss-isp-ope-v14-9-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX1D9oLBHiGz1o
 kxJKw/1X3YpJ7Cf8IWDyGqQ9M0rXl1nKqSGP/4AQh6b6sGPGZHnUk/1a1lreW9cgmr3cbpCKzBX
 QiV77jpaq7CR8rePsiGitAno+XKqGsroGhx1SHtGo6g+RDyrUx3T2soXLuIyDf2WVBae0VDjMGm
 tHfrPE6XnmpYmHbZQegyoxphaEU1ge3zM94mlJtu6/95+sexmNZwK+jM2ntrGfmC3uNg2w9SBdb
 m7QaEy2IiRhs+Y871V2qIknr/zMB5YZILmrDc5mLcQZR0bVH3p6M+lL7ml08htS28fxiP2fbEJa
 uPHMjw5wsCE7uihvSC+gvJzpME59NodxNWC1yWTl3Zib7Buhp8ucE1ACX3jM09ymnPvECxzxxmh
 lFd308bGB9QqBFlnuWozIXd0flVjhOw2VsCO8R+h/rwsveM/qyebCp8W+jxV0Wy7xNPuf9MyCPp
 Ta2R9QxMXULMOQwLbzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX4WPGRSRkW6PR
 GuRaWuiR+jFTLsaPQVttNd0n0ZR8Ez/OFmzSzV+JkJn42Rg+iYvzV0pkDgmpmIyfMZ3SFuUmwLU
 mLTYpdX6nI5Tn07uOYKTejHelV5VqXw=
X-Proofpoint-GUID: 5ZfVwMcLagAji2gcpC3OhdhrI85MSJ0S
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aeddc6d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 5ZfVwMcLagAji2gcpC3OhdhrI85MSJ0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

