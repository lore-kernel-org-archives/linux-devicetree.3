Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994943;
	b=R8elmIRH6p+sR5SwQvCJF7259rNDCEWT9+ASO4sIrJ4sS26a4PhPtSNMs+tYqxOMwRR9
	 +OZceCZ81s8ThYysur8570L9V7/JT8ST6dIc4WwinUWiW5jCvSOxUrt/rcJlCBS00J7xj
	 I2dh/f7h+s4+n+di70hHEsu6xlz/3udMVUe9ihOyq1BO6piICGSSYpUYhDQw/iknbXh7v
	 5AhmeMuPqXqFtOPzPC44ExPlYu1eb7LTZxtfNB/BaKZmKfPbqOP6/dls82JqMSv8Oqklq
	 t6HSvVxI5g54rHzhO2CqxZ6mKKgCJj2eOogKc67h0OGHClpDLVStUtN3nh9w41IuoTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
	b=3jQOXv70O3MYFsoMWqkhml4Al619ioq+1DnuRZkWJMZCAcNDv+Pv19RMg3ogbEEYdWVh
	 Sa6fM+gSKsZXtHl0upoosTpE8Gzkjz1wJTdmCzs+vylx2L4dRAZkHVudZygjlb0tCzeT5
	 stMw9jBpo2giDE9IgII9OdGjoyjiiPdO+QxeB5EZoElCAY6YNjKKWtDssKL+w2HLyjgbd
	 iDuSsSh4iD8zOn0OoWtJDH6E/Pw6sP+IUM3kYzJA5fYjST0Edb3MPCy1Tk+ZSGJFtkLxs
	 ZhSyjewF/WgXT9kvvD3YLCU5QIzTuC2Z6EYJZGQaSYg9gyD0l7BJd18bE/YGmNJJ4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9CC606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9CC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8Uos01430549
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=; b=Q5eJlKO28//l07wZ
	b3nWG/PG1RdmwVGoK8S3TG6A954ySkiowyrb7zwe4PTjL7X1cziTjApUVpdo6wPt
	B7XPLvkSUEyY3I8d39P4YbBUbGq8vx7ksD8t1ZC6NF+8lNYnuV3h/NLJOo15ruwX
	u52tyiMiUdJEWMP9UFiFq9r8EjYWcbpS8M0QmCXHXM5yNPxB+qRc4LS1KK0QA+KV
	q4S4GonJlx07XGCScxtxpisNffdm8SICERR7WQJXtVGL8/N88heLscFy92S60WWv
	PLVbwpEhRmOTXjFZvJKI+zYEJOqy1YL1K+AqZBxXW7yCqJrtv9gVWYN6XwA+fztL
	mYAAkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92ckp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efda2c6605so5256425ad.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994941; x=1795599741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=UfOhZUb+KWI7i6HdYBRl+Cds7oyirooK1EKGbTp2FSh3QnUyanIDx5erShuYNKpSL8
         w1howFFlfWmK3LiX2aLU07upg07RfzA/pJFumx/vcDWY6sLA7NNZOdYng6gNmkts2cOo
         iPN5vcJLuQpbtY1tEBj01vZnZy2PeD8d4+hzxO9Ao3ZIFybVDk33rfBkKNVqN2LtLRUP
         Z1QxajGWN49NdA9OeK/hJ/Q2YLbiEQJjuwKcK8te3kBcVPviZnfdq9lJZ4tBsjtvIZye
         PysDSa9IKoNzQewAF7bOjob1EZJFPJ5RRnIUMSZXdPypxSKKzLQvD4DZS39rsuuVF86S
         AaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994941; x=1795599741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=QNgt4Uv53ieBVlPnlbVFvd3BqCsmcHD7IuJtFAUhb6AHTEHPof9bYe/Ki979Ostwo8
         O4sb16/mRbXk+mxZghtL619o5HHCeEV2VFPvBVOpexDEiwOQprbBRbnU2xnBEXeGKcu2
         4aLfSliE/BmZ2y3mdbw2GaNCHRHuXiVuyufgu2modr8g45NJsrv1KIwNxFW2GQmBWR28
         hqrMLRjSoHx3DI464Lqvwtu5JQI9RhfUIkOOs7IksGNFGx1SU57pDTaUG76YFlk8/MgQ
         3fJx3TpAWyBeGCr2A5G5bAY7ae0NX6/1i5D/RAqQRw56I0BxleNW9U57gwYAjeZ+3n3f
         6T9w==
X-Forwarded-Encrypted: i=1; AL+hErG3qNTeTuqFdusSZQZrL1apPdYPC31b3v0WhVQ0Gx5y7nXuM5hDk780bcpJoWXPNE2TWt4ES6xMzY69@vger.kernel.org
X-Gm-Message-State: APuU4Z9q1qn374zOnmWCOe35IX6n4y5U/ZdyjYZjyO5qe1c5g2A7CONx
	a1Ux2nl5NqF1j0AnFl26j8ryGCXUUAfyadDh3lRkjykrhRI5izlzMMT5BQjYHw0aEpetka3yxz+
	CVbabwPQdgL9xCF61MRbiUYE85KLlVkbV4nqA2RxsFNpa3cbXnVqCJYuPDxrfvOHr
X-Gm-Gg: AZFdTZfKZRWkXFeUrOHZhDVi8+X36y+UGBq9dF+cZ5ZAF5IX6pkLWAo6LdSsvdPPICj
	Hjo0yqbtUFQFdH0ZKSBl+DhEHBVwDlUgj3CZAKPBr4VSKsFMXXDt9KLZfiGlHt/H3KxL2oNfiri
	SJlKhpQhO0Nvy4Ivv5woNv48qrIK78c4YoxzFMSlN1hG550NcFfLIM3WanfpPmSnlR7qTIm1+Cj
	4WaXxjWeaIokZonvw4igi+5NaTXCLTG4ayKglWEYg15Jbnhoj8hiVtRA6GN0xAcWvOxpgQNswk1
	Ukh/vAHD4C9/qC4ydaJOJBpujaFaD0P3hNccM49xir/lDm17GKOBQG3qU1Cl44hrdg6UAlTth7m
	ocCUSGom2oMUoQ9yga433rOIUwAiaSvLsMlvQFJp7J+76/5puv6TOh0MOsQCLrRepdzclSP4Op+
	LiS7Oz0RXsCxYweZAD1wHbsl+b30Mx+x78Wq7Z5qnEf/uWwBkD
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417475ad.47.1794994941350;
        Wed, 18 Nov 2026 01:42:21 -0800 (PST)
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417155ad.47.1794994940856;
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:47 +0800
Subject: [PATCH v3 8/8] arm64: dts: qcom: hawi: enable iris on mtp board
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
Message-Id: <20261118-add_iris_for_hawi-v3-8-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=751;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hi0+kT+lr/HaEbt7fM61FG/66VSUjQmHQXby413mJ/M=;
 b=qjHYftw8gx0GgWh5AIpLAwCHCx8oongqALIKBEULzF7IBonNqGmb1T4u6QO3VGhPcoInHcOMa
 Um8GqkHQqzDBtPJgDSeWe29qPjaZJuF8hsb3vLvvDtzzTBg/ZoxAKHa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxSAg4P80fxB6
 xLZI6aeL1pgcO4PVdokNkprPCizlRVWP3QOcze+nNiI7StsiPwCff5RB0XaUGQYlerXm2JCGElD
 JFE938WN85o+CPjzwkMTzUUfJhlu72MAq33LmONHIi/ykPOs5mdYSdG5xMjT5qPpG7dazwf03IJ
 7dmJyqwcnP6zuudszoNoBNBXpyEpee+mPzk/3KqZVUrCLCJ8Sl6bHyahdjDh+OcNaABtz0y6MK/
 pHn5ADapQqzE8pj9kB5PqFX6VL2fMQD8Uv7Wwp2YI0g9oQCYV4aum0gnWQp+J4Dpzqb39iMGxkV
 oOW8oY5M/3CBlOvM4r/vmyQpfZvj6GgQHZAybcFameMS4AAf+zVlJGrZ4otJ9jkdcie9QhlRmZY
 QNowolr8yQzyoz0uEQo/RIyC3JcdjZa6yHKob8uBik4SV4VK20ARpo3P+Y5J4/t3F5o/iaPQnWq
 GxMKB18wCB/aWPPdLtA==
X-Proofpoint-GUID: yznVF4cYIMO-nFfh1ZzENq9BNtUC_Cqu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX9UqCVA6Qn/Pk
 KkI6eY8F87gjtHWGWRFMPdB7DS73I5oFrMUR5O7Ap/YKJMUY9zxj+EfjRIDdpoOiAFa+WJbbfO1
 eeNvYKoXhpudyApqfHs1V2Y/BJOVdx0=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd72fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xxM_nQ0a0dx36OX2A9kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: yznVF4cYIMO-nFfh1ZzENq9BNtUC_Cqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Enable the iris video codec on the hawi MTP reference board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2cb29e9237c634d75c6a687a988ac1..a8bdf53bcb5d6cce089f069cc8e91ab544c05d8b 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -780,6 +780,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu50_p2_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

