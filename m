Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB55543B3EF
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121992; cv=none; b=DFaoIICwRHaS70/r9TOJezkykqeZYBPrVNs1hiy0x4R7xHVMgXq+Y5c2ZPLKUlzoTCsEJ2KQQw1qmmoSxCpSg0r1EuY1otsrHi9tohum8kC7UAdueZ2TMQ81aiskrqnUU6Be8oQMx0rrP4JtwhMEbpiqQvNkLv36zUM5vvRYysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121992; c=relaxed/simple;
	bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdBLEIOki+Hb/uwfkfvE4TJQJniYFUXr/4CMrhwGy51De468G7xjU5C1CbtyPip6Mb7Emy0yfCJC5TWfzzREPACwz7hJi0lpjQIHoHnGWs/cvGuNCveTxESP0aH2lNyX9crurScvcUrFKgeYcZOA9qNLtCxheoOqWukG99Ugj88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGrHmxuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aotEifB3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGrHmxuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aotEifB3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbAf2831862
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=; b=mGrHmxuZgXMkVtCi
	8DlMRKIh6kDJfzNgMkAUsAqMAHbuJTVOX6PD1ei2I2S1vuBAMmPgDM8XwEj7tePo
	upaxFnyDlMp1opOpejlbuW6qZGz6TMpCcxLirPwkKnkvPy7bk2NIU8c6UAa1ciyO
	l3aDWtsiOpAZCAjWNZMusuBA/49fjWixQbQyVkskoOXFDuEVKRLCHfd9S+9e1MK9
	qh+DntA7aE73/EXhN+Z+tYMEWu+sYf53Sj36LsebF/2n0YNEQ8lyy6IaJTrT0BV+
	gWIYXicRPID8ddkTTPkbpJh5lGGliJ/JjWgCE+HIijbldBuLjiArO+uIvbZfo8MH
	P5FIGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgvpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:19:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f248907fso28942685a.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121986; x=1789726786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=aotEifB3p1V+UxxlYE/Qrq0IJESkasMRQWu/31Zh2OTbu8aipIdN4++vpfmOa1Zp7c
         w6o2zWEVN5XMxrQALmutnQc+MvqQclWPxM3br1PMkoexrQzi1xm1zIH9wmuz49DCGm4A
         KhBt3ozwKSO7/uAluzdfQouZx8infvVwJXgNSIFywcBFx/GsdxUQBlv/FD3/hE8t0q50
         0NAMYQalJEyNy1vfIqmo6UvhJkUzThSbFk5tnJEmR6QH29RjirF+tkFGobrslPTCGt0P
         kvi/3mxyYTGyXnKMPWDfy59MaAgSF2NMmvyTfRf1XDvoBdGdx+ivmajW20N+J2p04Lfg
         0Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121986; x=1789726786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=DDUyfBjXrCKdyT67s8aPkvLEuPjshnjhxxBcaZ6Sr+t1tmCKYRo+quXq8ySpz1Yh5i
         p742gDUVnnOz5K5ZYRIfniuHdqIS69aSieblawbBcdOG/PUxiXhoLvMxGUUhlWlgLrcL
         QITI91bq5czGPfuqzuuecDi9EtSh32ia2zexRCdSeT5aYrIG4Mw4U6/BKGR6l0IW9Skl
         J8r+YKCg2oRFYhttULdx+RL8oD2FsMXzQNTWho0xKlcxh0+vxGBY6pNlC7qUjG+t0Iuy
         rzVahZoOfZ8ZrBOKA3slNrQdHmILrsz8ZQDzSLqko7GbcGgjcFWorhCJ/qXzUZuFd6bm
         IZrg==
X-Forwarded-Encrypted: i=1; AKwUvBxjESJ5QeWz79eydgjfotC5d4vrfdnevCQNegvOiBtlvT1lg/Frgks9LB90T1ML4b7Lj9SnKwOyHJBJ@vger.kernel.org
X-Gm-Message-State: AFuF++l4Q8lRs6x2JvMpEU0OwJ31jyacE0xXYDeGr6Gt/ZpmDZeQGN39
	YGDuB1txg9Tbb23YEdnyWUtrVIqNGXCIyU+mapqck3j8VdY3emU9+sCsFNzpX7oP87BYk6WIiBT
	6IFQkia7P1kWxs08rEEc/ollmA7VV7FqtaAzoItnRnszz4SQ/0xgVWXUfAVKAnXIq
X-Gm-Gg: AYBFou0BbsIpvse+ZO63LM7Kensq+8NCrPtplO+zjTnZHQ4W2juR3jT+3LQPYgbtoh0
	x7CWxb9tgRPFhmcF2QP2S1muGAj5vGY18F+0V8EryvhJS3wqNSPa3nffSsi1eyIq+Z9kHEM3Tec
	fNzhS/LjHf7OoQcYEKbqN5YQXvkmEP2SwtlVaMbeA3i2XfnqM+UoZavKlYAHNdLgMzUvA8L6qR+
	htnvbd9DxHixTppcnDM87G1cblp6h5drVyLfW397qPm6JGY2IFTo8ZNuvErT7jZ8X03i8IC7Vx/
	R14mnZ3KWHi4YEWylbFAzMTDOHt2avsyeTvWKtAbEAIz8bj1yFzOhayU8rQFY9aoMgmN9fMzu3/
	N/6/XQEx8KmKnbPaJsmDSpTI=
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438844185a.4.1789121986316;
        Fri, 11 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438839985a.4.1789121985851;
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:14 +0200
Subject: [PATCH 06/10] arm64: dts: exynos2200-g0s: Re-order properties to
 match coding style
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-6-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wr3HcGmsAwVxD0+CL0kWH34cqmPGClsJVqn
 IvuKMIV2mOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1wU9EACWsjwmfkQv7ieRcIAag7lPpS5DcrTqm4TRiK2v8XxLoZt8D12U6YK+Z+cXJTI0W8QTphY
 czKOWH7V/JYVgmBpA1GP0As60ahUJ09ezo9KINsAwGz1ndkD2OK4vPmSA7hhWNtJQBmFZ6x+O03
 Hf1EZKtee/BrR4uEAxY83KMA8IeEev5sXD95EGdTwj/vsn2C5KfKMIi1zwDI/13mK42lh/KjcLH
 +1zx5UexwYXulkzG3DbQxLC0Bt3A70KKSttynvc/dUiqRYDqipMRYc83xwiQ0FJnEGyBCEM34FX
 OvFJ46MGpWwDVxo2uQAQFoEHOyeNre8nHY0hI8noRC0qJpsGR/4nNehsXPaL80RVSx93c14yAFs
 9mXgFMRrfRkvLBUUSUuF1Rsi8tqoa6Z8f3wtD1ovE0xeVz7gqLqaKWZ3IGP+lNACKsCtFbLjYQ7
 NAfjXPbRPLz/3pWOezTZkP72wHSgzjWuSpRL+Xh7e7iGeSc+OiQmYbG+NlbQjSBpm6CRbCQQ31w
 nwmnKaDaVAkEhvR9u/tZgOJevrFcYMCZUeT17hRQTBKiNYaXuJWvYFSAYR80FT+Qb8VmxdEHmO9
 L/S4sHaQh/Ahbht7OrfrWfE0EGjWQNED0MH2jz8sHGqKUZ3CTRsRREZ0hLtYTSZm9PPEVUpZJmY
 913o/nlTqWv0/xQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX80FUFlGfyhaB
 lLcJXwAVZiwSU/TlNontY/BeJGpgWYrNAfxXSc5iOjpyUXSSBqyzp4NeahZAlGfLTx9A+vN0pOc
 s9uxX8MAlsysHdTEZVS9Xz8ilZI3nj4/xttFDv8Gg/q9IEXwMbKIOFViHRLRpj6x7/GgcEUBMQp
 2GBCsbLdSlwAo3/Mr/SRogV9juhksd15Rf8G1Hw1V3Jleo4tgEr5wMCCwcTTAYTVZLa3J4c0Tuc
 bvOmTvNjZnsyLrZjsC2VkBoc3f1XfD8aI0AHl6leZ5frsz5/Vpm8dXPPDaq8IjHg8xvV4cvtqnG
 kv6LH7ECHnN+iqZ7V/pRRWQfKNEDiCbWioBsgSH45/y3kknPPzrpvYr4PeVVuJCKPtGfq28EbMT
 /nj7NwNNG9wsOBUnb7u67y44Idhds1RFkw4D2hdqupYLsxOhca5cXBUG/RymTzbsALvgf0gW11T
 pCpZ96Ofo/vad3w/Ueg==
X-Proofpoint-GUID: fV7jHxYVJvWiowm1nPULIs66r2N6FvwV
X-Proofpoint-ORIG-GUID: fV7jHxYVJvWiowm1nPULIs66r2N6FvwV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXx+5ERFtWcxA3
 ND+QKM85Mbu4DxGSTsQKBpq2mun8Yk2ztkdSD4XV0jART8Fe/bGZvSpQ8z9KyOv3Yh07IsJ4A6+
 +sKxkLEH8G/GuHClr8gg+dDWyadioDk=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3d5c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=webegsIPGkF9SanNryMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos2200-g0s.dts:72: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 3687bbaadce7..30772bf77252 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -48,9 +48,9 @@ gpio-keys {
 
 		volup-key {
 			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&gpa3 0 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
@@ -67,9 +67,9 @@ reg_dummy: regulator-0 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		cont_splash_mem: framebuffer@f6200000 {
 			reg = <0x0 0xf6200000 0x0 (1080 * 2340 * 4)>;

-- 
2.53.0

