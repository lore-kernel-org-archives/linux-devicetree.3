Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065240;
	b=tYlESwyw8ZH4NvzHm3wN+bJKE4ynrh5GqI5B35/Sl3dhJluUQA+GYFCdIhJLBTqbyEj0
	 4OIKXAnFSG5tQmi+wZY3OEA3WD/I2OHGgXTNRyijnX0VR77bMpeE1Lyj5DAXjIFqA217q
	 Ziv2+qwCMC3xVn13HzbyZpIBxZMZ1NvG5DCkoIxzNV+QhFCyu9gXjmCd7vMGAJLdGjHU2
	 F04OGoiPxFE6o1NPlW0dpTMqb7m760lAkXRx9x8DooQoVe46ju9qWllKMwCxnOv8ocqfN
	 XrBPiXs6HUQImAeAEA0HBxOZYDSsgW5BrS0e/OlRdP2d+eIJ0MCY+eQUKqSBQzndIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
	b=MWEFkQWtXyeZkVxrtkOMyL8sRzrxtNUV9fIWCWDTFY3RFABLUtVh3J0yAarhJyJ2/oUA
	 k69RuZ2t17t/V83XPfvXNUL858jDJHgfMfu7/30Z86IYJ55H6DEok5jkKQPvNnQkld5Yo
	 EJEQLPgVh0B2bO+LKj1D+bnpCkpwJPo6jlUEFjXSrAvByS4wevGeNS+nb8X9G26ewyG0M
	 slNlsvP8ftBW2fv752OroBA2ViAdWXsQaaxSRG5w6Wnq7/w4HEfSrjF4cmypr9aq3TkKZ
	 fhMZ3aZj5JlmSfttxsVDeVRjW0Iu6nIbp3i0+tO3f1+Zfn6rul89yxv2+qGiq4wjrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788060A3809
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C788060A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ4Pk7t1228185
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=; b=fP70baho5vi8arhx
	Xn4biNEzc/MhGKMFJnVti07rCRdz5vNjrGAMV6vIhZ/JZkcYsCaeWovz34TVcoz8
	EVdtZcz8Befjj7BeBpg3LAzw04vnii5b8EAJ0MEOBGt5JOO+yhAi12MLRS37qh6l
	5v1MXk60Nlza8B3FLEX8UfI5YOsxWFqMldaAP2SAaqewnP2aW4KRn/VzmRc7D+ue
	D0RuUiqQi8sDrb+ISDt1UC9fLsd2yUM0XAf32MacpPXecJlx5tm9iz4lR1L6u3+5
	X1JfEYgmj0JfD9+FL/k/IxnaUzIaCaQbGM1Cy7mNzaGpVCM2kFyEoX9pWRJjyxet
	++ywkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg2xfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1332356a12.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065238; x=1795670038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=kmcRvppDBhlyvg3obi3MlgamgMj5hQ8zRHeuMQfjoJuHqs97NMTGEcquY2heDTEG9x
         gTQ41XkDmTQpWZLc6YmeMKgSOJWwkHDp5JpyrxK8eSBSjbo1TcJKDD+6D729yU8EUQ+W
         RLKquHw4rTyNzPdhq+1k+YVI4USX9memYMhuDHzQy6uggKSNSglmqCCOIUA5bIDEvMcS
         //uD4vR9Rj4yUhInwVXbmWQeeNv96/LNz3U3VyIrnWvBzQkSGQrSdoDwOSQEp1pWRSKO
         CU3o/V+dU3owtCSGMZZu7tgHEKtZh2QQxMQ9a/XNT8D26T/tKYT2tPqRc9K/4cTzN3Xe
         amPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065238; x=1795670038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=BjXDdQthGlhvXrbBuUsJZMajNsA427HuJCi+5zwR39Ricz1r0xE18430cR/awTOl6C
         qNTWxp7gC3eBrOL99DSUo515e8OLNUbE8JrdEYu+4Cr2Tr4lsn5h2vw1rixlAps9JSqB
         aHSX9CYVmxNeT9sAcZ9KOoA8WycBVbAWglrBGF6LMKM9S5lFQlGSscoMhSm5OOpKZxj2
         GUmv6CvFjG25Dl4giWhfXQZnPDKAbjcLhWpfOtFHM1rOR4sEsU3UlZewhO/KK8MEYgzx
         UQ235jMVoAQC4e5y15ut9PO7Bg1LijV9xVOYZ/N5L6mXXCDsyBZ9t7jIDERizMfgAqVd
         p6bQ==
X-Forwarded-Encrypted: i=1; AL+hErGYceRRmYS/FXt0kK8g2zFEvVNz312ATVPq4767PzXBD0mBOJ/qrg+ZZs7BqEsRgHeTD+tJWLrczUgH@vger.kernel.org
X-Gm-Message-State: APuU4Z/68WWEcF5e8nP+AV5YHM8xGRjow1rp/nnq/wEfyHUVljzi85Rn
	7LX7KPFLp61AON6GFsAGtAc3Wlun9czB/xhVZ9HaQjIM63roFDSlVw6ltU67t37wjK3Pfo6fdf6
	GdlM7ujzADg9MrrblYDgvI/7bBhUjZnge/atwuRKTsb51Pt5nlAh1C+bm+oAmUyvK
X-Gm-Gg: AZFdTZcXAdGHPoSkUx4Z8y0Y5t+pW1rJ1LMaKmxPGbDVAGwgjxNuX0z74HtxBixYzia
	52oydD2p0C0nxYYUCISnLNIBuA+zI5edMumSwcWJYllWnZrIzCO7NFXvjgyZJiKcvtFf2eR5DP8
	uFKNQgRlEnaErkRXPhDwId5yr/JeP1BvVynvgMtEpgTf4tc5Cj+ysm+3jN2gJnTWpEeJVfIZCOr
	baHD5ozQMDu/XOqR6F61+PHVThyqITMFqPWCsK5LCUzYO4Hh6iejTj7Fn39HY943IdeBeFiNDdL
	mUeNUeLmYiXRMlJDKqndXPrF8rnzK3KjFK3V6vqrDDNU5LHsbeWKEHsnXyTdA00jHFYhMFYrEBY
	uxgVAsVpEVzc1QmZw0RmY8M7uKOEnVRDyOhmq5/yVpf1zNjC6Q+YPvBHhSw0vUJOvGdZDdTvLO0
	66gh57hJu8TXwgyzLMqtZ9JN1qeGaLRO/pJcc27yAsd5HiscM=
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127645ad.53.1795065237711;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127555ad.53.1795065237254;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:56 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:28 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: maili: enable iris on mtp board
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
Message-Id: <20261119-add_iris_for_maili-v3-5-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=696;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lhLLo1Rnt29vJGWnH0QVhbx6kqyGmQ/yrLNPDy0HyVc=;
 b=Cf4U79Rz1iV0SKlFCxZpD6fjFrewyq2fm7axjX+nag+IKleAL5x1/D0JHHcfaXjESCRyvrBcS
 LHyetPcgvLOAgraKKTziPADLagUkW+XCusmO1GY0Kw84np83EX/lRUI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: z__HrdpDXUfKSWUOrhtp6fsyjAxCyBFJ
X-Proofpoint-ORIG-GUID: z__HrdpDXUfKSWUOrhtp6fsyjAxCyBFJ
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe8596 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1_ts_jfFenCfOmJzNDUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX8jcm+EJzxbpQ
 c2rsEVgvue14vLEob0MVjHE0l12/F0HmD24W9uDFqpKjjkWo8IEdIJlLhV9krGA76kfW1Lc7i0B
 FoXHR8CTicw20RAphKO6j/qiAo5J1us=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX529YfyUsjehA
 itVK4F4oF699r2HY+/IdGLTh6Og/rcqZyo7+M84OBXBvIToLAEKlKHG/N8m/kS4oag6TWtcGGZy
 XceDkHthAfpiIGWPkUeLPg+bC9c2dUp8GcIMO/ZvoOm7Zmb/3KF1aVv8o1bhhRH64pW7o7ADlj+
 LvHzVDhRJRi5PqoToOJ+iOrSKHjULhGkOmfz7sLkZY/3+K5kJSdzRfL0EFxXH36hWgiHiTFTNoF
 2iim2IQ5bpzQqwki+TpU1FopxFEuliP9Q4JnNcYP374f+8JohZTHXunxorksy0MNdzsCwbD6Q0U
 iJKcoOYrsL1wbPSaaM2Fz4075Le56D9rBVYVf4PMc/ZCnYOxKcQ9MtHRDYTn9GNDiVVNv4uiC7B
 HISbua9SV1wDJADSWN/SP+pkqR0F+oCE1ZGU8B6BR5C7UaDdYaLXLf6PG2YG/hHbIJ144n3tTtB
 MbIxJBR6jUN8GfMlEUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Enable the iris video codec on the maili MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e07f1de9becf9aaa8b92db6d33707..22d9a420add7773009f95bc37f46f5201af7ab74 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -743,6 +743,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p1_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

