Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F583CCFDB
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618303; cv=none; b=LbyYXXI0/47MIOHH9QYxYZE8vjpOOGV0wwzGZyL+EBQARrCoYkn5ZLFbWMLfh7LJecTksym3T4TWuAdGMjhA3dTlp/wrQIXQ++LzEnvTr0iLRd3pDCGbjQgfr08sniufhLO56CZEWgPmxO3hvyVO6KFFCySuN0smlqgyhG2rCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618303; c=relaxed/simple;
	bh=6DN3cudpMNa0FqXjzZDZ0I9ZvjzIIoYk3vLPfHgk8cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6ePkzYbIpK3IMEpXnNxl8sWjuwepWnvrzDe3FkpG7X3URU77+xgidGX98Lq3N6Op4UOwmp8dDpPqYn8VG32ov2hW+lr3miUtDP4Hr7nHhzcxvByGk5+eMN3LOwtnETSdS862D5dTYGSdoooyuyLRgzumILvh5OB1D4BXrLyIUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxOSwa2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyEggvDd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxOSwa2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyEggvDd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxWvv3562618
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WsukewO0eI0
	l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=; b=OxOSwa2RZu8VgvP1SxBspK6/ltX
	uJnci+iDcyWlyqdbrbeMwyDplbQviOW4QZths7lULAcpnuq9vk33gGcMBnlDhJCB
	KAWg0pdURNqzLN75VfoHMtS7nz0kksLBwO5JL//RQ0JGMZcl+LzXtNaZ1L30JrsW
	1UPORUlqClE/6TEDoQPJcWMgOZQ37zkqGPk+UkD/luI/lAmLUVN/TKaKVlbgbgK2
	d+gzjrsc3FcKbg4Wkjmml5nWhknTSLvCvtny0BNdi9iMZTVZ88hTrcBNoCKETFmf
	5OPnquzZEU4SRPKaiwW55g8ODZssWzFr0zr89OqJAnAgq48OeE0Ksq3qdgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9669mwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:05:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so22043751cf.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618300; x=1786223100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsukewO0eI0l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=;
        b=fyEggvDdSVkp7AioYFK1TIH5t2S3iYUJzP3xcjU55+V8GcmxQNK6Auu/EASFqaver1
         /unl6VWQ0dWMbPc94wOnSjbdCJhcioNyZkKvNxE9M09BYh0QZGuTvONOyWEUalkxRWdM
         21Aw8I+V6Yp6TBu7d92KgaLDCOOrjPR2ytyKeVIwH5sBqedPDZ8edMCEggh+pafpQfpr
         7V23oSXvWs5iFLMvR4DefIumgFsQZjxe9gR32fI1gJV1mhmxf4TSklTRBZmt08bpzfgo
         ddVFJEwMtKR7i2cRwZZxN5BtcDS4AgXNjqQBzkIRp71E4ZFBrkSYNZ+UQ/l4pmFuw2G7
         LbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618300; x=1786223100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WsukewO0eI0l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=;
        b=piQ2+yzok3kNOSkcZqINYS6cX+rDXlMQlGvSUrFvA5VLt3KmURmsi95eF/YTpjVjuh
         xXrwwC6KtOxzplcbI9q5bJowJxtqdnw70qANvIxqt0cW6LyC2RgUd/Jy/b8LIq7nrk0x
         9SZQ34vETGTg3Zfzvk4rafKVXZiaQgbvu+ckg4RGoEyDT4OFxaAJ866LqPEfnsSLhB0S
         /xN7evdi4D7UAxFgiIPSlPBjuzKbbYLv9RDKzlW8QOhiGzIyJfwiAB9uU8mj4NSr3svB
         mz8huN4eVHbCwoMAh95jpYldp6YyhWaZzs+45+S/UjboOUTPvdm4lBAeehIK26/syfaR
         8bww==
X-Forwarded-Encrypted: i=1; AHgh+RoDboqScJz/EJZxA3m0X7q4ujIxXMpJ/HyvyzE3xtVedr8H/EtkGqr4m4ziTwXe7gZwyT6AjM5lYDqO@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGkoJdNGrH9i2WQlz/dos/d7/jd9phUngXAO9GMfJ1WL7BUR5
	Uq3YMlMo2uj5VHE0EkynGP5b/oee3CaAR3LwoAgASDQRyshBn3Gtgn481KIBKZjkQv7YEh2iKso
	GbNxX8Zv83v/C7YDj17cRUT89sGCdAGDQSVllUUZEKmANeWvcTgJccHnVAUGFH42WyI71812+
X-Gm-Gg: AR+sD13l8RpHQLFbcYKDB3fFnl/UbdpDBbU+F+JP0jABkQup5XT5a4RCZ3nVfR8H9oa
	5C9trsp2zLcPJRRm9pAf/fsmigWFeBzOpoGOW7TR/2vZVafr5Pbb0XhDNDcPR+uw3PH4QHDJ4K9
	9Hr1byMuf34Blw2CPdcoowgoWAvgvK+aphPUl9A1ClsDUrmMPP/GApV0Po+CUbqHTEenqQF474u
	qpAUyss0srQLG+329cFs32DD47v32pMK7Oi4pmQuZFaUocWNsA2PQe6Nozk1WEwITIIrKdPxd24
	o8FMzH3/pTjF3Msmsh+L46X/uXzCkEgOiMCKdW66uC5NyR2rztxtY0kwb0r4X2FnWamwxyymAto
	Gyq3fCgJsulmGGwiF
X-Received: by 2002:a05:622a:2b03:b0:517:72e0:612 with SMTP id d75a77b69052e-52b567db6b0mr106495811cf.42.1785618300381;
        Sat, 01 Aug 2026 14:05:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2b03:b0:517:72e0:612 with SMTP id d75a77b69052e-52b567db6b0mr106495521cf.42.1785618299991;
        Sat, 01 Aug 2026 14:04:59 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm18005029f8f.5.2026.08.01.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:52 +0200
Message-ID: <20260801210450.384087-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4623; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6DN3cudpMNa0FqXjzZDZ0I9ZvjzIIoYk3vLPfHgk8cM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9ztNq2fXddHDX8u5HqsNSYYzscFtqNoJUyc
 9XycnzBrz2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fcwAKCRDBN2bmhouD
 1y18D/9nDYUV2DWRFcIMycfAUnMUchXfs2U/i6yZ1NOKag8nrJRkb628yagdboa/52TIREYitlR
 CV3Id9WfgwVN8PYq8RlpcJzrq6g/W1hKgV272eCF31Ck8HVi1+mVk5Ko3LYCT64vIoTveTd08XB
 rCxFYYYKxyQ8o1a83mnrvCHZskbINWqQd3kWKO45pFfLmdoiIMsGu1bdcmQC9h761cNUNAjfS0Q
 0CDHZqWd4Y82mp0LkL8Sk2lZg9chEqx1gutQCr6JLb4lummafKn2RLaoi6Ua63pK+R8iqStNM+K
 fI88lb3sEUx9yLZ5/w7thXenucAjA3zbDoS4ZKkm71Wj2T+T0q5ctvq91pJz0mzFmvu3vPt4DW9
 VLJScoLSPZHOmT3z+4gTJ5cYHODfL5LwQgHIKfE9qBGtuMvvrJEIN1bV4yD/E8e+4eIgZwnFZQS
 kMpstjsn7yNnYF+aPyTqXEKCnBrNe/q8QlvdCJO9vFZNuw6GuADpOu2GiPz42WLiVFMS1W5T672
 Gkn3ZNY2fJpGIXIakK7ZyqLZq/MI3je4t9OKKVyVnffFYd1mFxbM1+FOtfP2/jkYGzkrHkku6cU
 d9rlyyPsYu/BuMtCFhLrCEDO78olXGWSxVZffggURAcGe6QCIgcNn9kYuP/Gsk91b9kgWKzihtf UNOABoiL6KnOSgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ac93gy-grIaaXbspQXEIt2vLiEsAYBjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX+q4//xXGzhAQ
 XemcRbtqKFgPirxp/qwIlWehzxxAwajBZMLQWkmo+41Bra6ODVpEweqQQ1BtGAEMLBU0osMsRRJ
 ibgleJ6pkpyXP9J5iX/uJOD1QHHwOf8YBDpwT10hj1jsxHHILR92UcKmO7IZnXtX0nbGPTekKT8
 2IeRb/bJXltm3jgFBxr0CdHyByRc66V0g8Ant7rSQFRxH6K8THOP0nxO8WmuLECpICcv0jlvEH1
 JYM+cSpVrXSsmoZbIe1zwJTFVf5/z4DKtHKByGR4zgNaZVCmNkzozhDHY2Q+oXhikekPLd3aCeQ
 e1YSQmzLpytcH/n6tOeNMRIfMZ/CvRZjFUFoFQBIzJC+L+Aa6Hf1DVhAnfMHIV/7e9N1z2MV5CT
 awByP12ni6UiCmng63ZSfLbLydQPUbm4mdYhbLNWylKvykqsJEN0bx6mYI30kF65qJWHxAcDyvl
 Y8nPmbVTPP860o/Fkug==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6e5f7c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Hx2NUBF34izpMPi2HQAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ac93gy-grIaaXbspQXEIt2vLiEsAYBjP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX7s5awKlTx+GE
 nQsLf7DuGhTpWnyU9DdmknZZOKd3tT+3UZ6aOPZDMQPYwq9DJrBbhPhE+V3nG0w7+X1Mt08+PWM
 KZaXVRux9nyX6Ar+1cailYbvS1gR1xk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi            | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts        | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts  | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts   | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts         | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
index 6d78a1c98f10..3b9ded8375dc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
@@ -49,7 +49,7 @@ axp803: pmic@3a3 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts
index 6e30a564c87f..5627d2828fc9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts
@@ -48,7 +48,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 0f29da7d51e6..6e57ee19e799 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -191,7 +191,7 @@ reg_vdd_cpux: regulator@65 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
index 3322cc4d9aa4..f9fbaf6df237 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
@@ -103,7 +103,7 @@ rtl8189ftv: wifi@1 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index a8644fb52b04..0d3e761f6466 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -99,7 +99,7 @@ &ohci1 {
 	status = "okay";
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index b340bbcb710d..ff9b40352a54 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -149,7 +149,7 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..43e8674bd021 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -403,7 +403,7 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
-&spi0  {
+&spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pj_pins>, <&spi0_cs0_pj_pin>,
 		    <&spi0_hold_pj_pin>, <&spi0_wp_pj_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 055be86e5fae..26ce579b42bf 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -400,7 +400,7 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
-&spi0  {
+&spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>;
 	status = "okay";
-- 
2.53.0

