Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156504C9DFF
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578396; cv=none; b=DgYcW6GDDy0nuQ5L+OKbTvIFjUIe8p5Qa6i7T/JbbdNeX5e4aodpZgMsfM1JDlX6eAEfsJDOjU0qErL607KdSVJQ/RPIgEUGNrRYTkVSH8vpUul9R35M2ver9ZiRZTkOSjI/DetdkcZRynN4DvsW4I5xL4Wt5zwV2b4Y+3Abisc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578396; c=relaxed/simple;
	bh=DvDRUmbdA1hNLtbXg8l29Y6o593XR55fqEPA4seYRpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RjOnr9FJMc0sSJd21VNz3zkFJpYgO18VeG8EIk9eul8xJBBbJl0BRweua3N4em/0n+C5vsJM76dLeyPe91suFZHx3R7PTUFcclTHAprPwhMvar6jUj2vrLHlGnYKVztHfEl/HswHIGU+rMU421p2IpsUOHsosnIDaqI+bDrTW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6on4X0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwCBwhOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6on4X0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwCBwhOL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFe2x12430502
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8MN1jUSDFS343/7fvvAHk
	6j8IvEcZo9/KawqASQ3kY=; b=G6on4X0/Mla60a3HI91EnVnQVoH8GaUZ1gQN2M
	vYHlwg0qvlPIxzsYyZKr+NJGyEpZcAxSPIlynJan9+qlQsIyXnLXXpEoDxAZQVXU
	CfItnzMo+c3QbHc4HDE0NunTVzkR/TIlKZbzlI7RT4VKrjuK3K+Iw1VsUQba8k6s
	9xGOggaDlMP2vGz2Azs6brFm2cOcbSuaOuMXNYqt8pJWmsHomFb18QiPdhr85tZh
	XE0ITtFp9VQA20WqdIbd5+tXDeJNGV189eNBugECl6id0xFfmRmZo9xDZvAR/sRj
	21/yzWrDofJcQnN3RIs7+8qBUpdf09EQNYQ6BKc4m4uhY8VA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnsfjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso2573471e0c.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578384; x=1790183184; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=;
        b=BwCBwhOL+RdQwzJ+q5O3iTRdVoM/iZtLPBibik11t7152G9AygVMw8fB4W/Fxq8YmE
         Nh/3uFVr7ZkJ+XPoQbkrEgB24ECSrMvX5garJVZvAiSE7JwE7/2uqYB5qfjLNj+/rPGw
         ugJQpLqHjx/Jdpq7dZ2qgwzNEmYOxKQkc5isicSBZzEHNk79TYWVYORNd1pblzQITnId
         yumzt3j3mCIsy5lW6eU4XslwZJDxquWIIZB8lG51zqYVo38vXRoz3iDp7rqtjxdPjA6y
         CBs4Pvtw8sHdNdbzHCA9iFjkc8fVXgDMxS1hKzmEERa8dsLETvKchQqwzIh3/mgNDNlL
         rclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578384; x=1790183184;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=;
        b=Z+uYpBJKmIirj6YoRuZi/OWBCOaTsT/fI6p8M8Pg4FtY8EkeGGkJqB8a8vvvJl6dqe
         4lFQrkpIjSMT4L9wYZA8XJpg9CTxqttAOM3MXxRudcg2fuVs00shudLTelgJdZaiNOSt
         gfb8hISnM+RPpOCNK4qf/YMGfKepOf1tlmfQf5iG/20Em6hwYtBdvnRJ+2m+BQwwACBW
         DipJjBLqRBbk9UML7S73CS/s5Cpb5k6qtjZze4DSpueWvCZ4jEGiZbXIea+CtPtavKko
         NmjlZZzIIjR5Igw5Dogo9xyh/PqpRgQP7oODwf6SlvBMwRwXQ5dPK/373oJgvoT0/yQk
         eGXA==
X-Forwarded-Encrypted: i=1; AKwUvBw6SEUaPGnJwTWWW4MIdoOA1HbWNFF/lA1p16r2/AiETnHYJr+5urbd41OnU9Z9+m1JtjOfNMRL1ONP@vger.kernel.org
X-Gm-Message-State: AFuF++lrDR61HjLuhwejcdrr9fBllgekv+qwS++LEFT9J8hmJSyZbDH9
	NB4uGYoJRAAnX969/5guvqKyR4SsLasw05hG6hZ/v9cljTlRw/IojHR/epgTj744JPU+J+FEfEo
	wJGx+j2t3BxVBYZ49GRZLkTRVdF0QyzdsBhWHqQr73OYCeYpc4TVp02r65mk+TXFd4hfTwWdN
X-Gm-Gg: AYBFou2/BANcS0py+J4w5csZHvu2YVIeIN3S91hqRWZ7IKk1HlQYjKTN2kxOYmI9epZ
	k0uGFncV/S6iUcSvSE1Iu4A5cgBz8TKCrOCtXAwZIbsuFiD3XtXgPrg6+jVwBBlLoKJnpfbXACd
	eacbOrf1mwxmvEmhVdVJheKYq8XW0k+h9qG7N0Rl0qyUNT3OGK2WtCLU5EGEc4n5jJ7pq0Cb9HK
	/NmX3pfRqvVii5cXwq5xgWa672ZfTh6nQqS/Q1RKfQK0JAkc+mf8HTqPO1JsJQkJXCrjj8qv3Iy
	9fU5e2AckciBMRF8MlaGoM9BbhaGlqLIhBi7tl2xuKWItnXRIisDgWGOCEoXuPlp2uv0OApiyii
	mSeMRZnzn/Jl2VoqT+P8ALSo=
X-Received: by 2002:a05:6122:6314:b0:5c7:ea14:4fe7 with SMTP id 71dfb90a1353d-5c9a574a8acmr223986e0c.9.1789578383748;
        Wed, 16 Sep 2026 10:06:23 -0700 (PDT)
X-Received: by 2002:a05:6122:6314:b0:5c7:ea14:4fe7 with SMTP id 71dfb90a1353d-5c9a574a8acmr223943e0c.9.1789578383352;
        Wed, 16 Sep 2026 10:06:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Date: Wed, 16 Sep 2026 19:06:16 +0200
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBSEr2K69hFawYgr72FY9OcJNdBiX0s0h
 Ltb8ARuJvmSyTezMMJgkdj1sLCAsyXrXQZxPDDdS9chWJOZiVKcy4ZzUBWYSEBypOQ60ANKlya
 gGKyOoL2L1iU0gOYijVHayBNn2TYFfNj3vnRvf0xJPVHHTb81ekvRh89+ZeZb7//VmUMJjZR1X
 dZcV0LdPFHxSnLQfhyLHKxd1/ULDkYRg/cAAAA=
X-Change-ID: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DvDRUmbdA1hNLtbXg8l29Y6o593XR55fqEPA4seYRpk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyK0nTkSriwe/0MMAuYN/f8r3VaRJQpQYSlC
 XYDy3ELxdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMigAKCRDBN2bmhouD
 1wmHEACWWgibWkjIlfqAt2MKy9hE2yYOPIVsZ8DGJ26S3kKVqOosYVDeaZk9FLCPPdT2B4RAbs2
 j0FXA6Nw3bX6XsRI64oIWE5z004fs/SitB8i4DZgriK/+QWFuwtFuk7JAmdASf6mV6yaeMI4J2q
 +s7TcTkQzqIMGYn2N3OyJNVT1H6axeXTi91VSZ8theoYSfKxwNE08lJoZEYZraNfOMg4fyKsRn1
 K+Gg2mzWXzwHtvXdzAE7VS4QdgW4aIsPvEwI7nAXIFNo1/+Nohfp2qmV1z9W2CTcLXo6YLLLKPu
 XzYvxdlSiFSfQ6xIbSGYyw5kIyRyAkp7Lpx565zautGlFaBhnZDP+ll4541fd1h+m48aW+N/xYq
 uvGr6t35lybnW/541vys1fCdGLdkeJesQsgrPEG8bGvblCEC0uPgpsy0Tla3HAd7vFm4OlKIYQi
 6HxHqbLBZKeb/Fz+aq1aNsWeYiA2xWW7diaY6bpCDY2r56calFBTZDRZx4KMRY0ropOo6bFKJw1
 DE8vozcjKQ/zDXCQ/FyAsR98/zTJBasPJGeurSyxSVOtuLLZvGI4vBbKqRoyaAI4XAnzqA1eDeg
 NWanNJg0jxQ2eAyDMZve3tiBJrIciBJ2iCr3HIM3qhKK+XH9l6dTzoiFlSvqIr23srP6mYi41aS
 Ge74esyIK+t8Hcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: c16zufoQN4fN_2l04SAnYUbYr00vJ-ql
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaacc90 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xKH-exNoj8ZXVN6IjzYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX7AEmv5pwvAed
 s8aNkIrlj0TVKGGROJ+vn7Sediwz4J1UkaUuv1RwKjXKV6eiDLfB/vcE6yUqusTnL+g2L2026DI
 HPUUXJQmKZaJrgGQ2ZhZXlSb7gI+kBxw0pdQ6r+EXic9JCVBDdS1+m+5IyLxVqlhOCfUAvzJLtn
 qiYQx5ErJdqby4ZH3jZC4vha5Wy6l2AMZaUDEfbjyw6DfQ4R71y/6w2WUALgXil1mLgJb1K/5bu
 O9eDbFcn+HvCO7jjDGkg3ZOT4QuzRJIHA8milJVsWFsdTYFhPeV6uUbffCZfbUdRc7oQGh6jokZ
 atmITvAUxM/jJucJKQ5tn5SvoaMsswHFnRLJgredDIR7fvC4F+rXQiVFQZe+5dbZPfmXdtMnhBV
 twsNcU9w3hMMNDnApV3CRxByOTynrr5PQTgPCYdd0Yg+9VvU2tRe8DoPA3XFUy0Ci25UNRtIPK9
 1SMj/ofBAOCJ0yaZvrA==
X-Proofpoint-GUID: c16zufoQN4fN_2l04SAnYUbYr00vJ-ql
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX4gktd/XqlEQD
 nIy/AAAabjIXfdtd7d5iPoc4HMVJweIe56R5ASNyHGvRNLQq2flncIKaltZDcNwTVbtN1LqcT8P
 27wWZRUYxP0d8H7/qHNGybE5xv/p7rM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160234

Changes in v2:
- Do not reorder CPUs because cpu@4 must be the first one/boot.
- Remove applied patches.
- Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com

Not yet complete, more files will follow. I probably won't re-order all
Exynos5433 soc nodes by unit address because it is way too disruptive.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++++++---------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 108 ++++++++++-----------
 2 files changed, 102 insertions(+), 99 deletions(-)
---
base-commit: 9e8494291f765bb1a8f43e36fb6b9146b20bc12e
change-id: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

