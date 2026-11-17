Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920787;
	b=FRxD9vtQSN70gdlLWZ5p136ACgzdG89zVXJ2RAm4SuootOj9dwB2Kkvkwd43hSwMqLuO
	 +SeO02oOHamnCBRY7qu1ryGT1YbTT/Vw0KHToiLNmT+D7v3sx6bG48SMfla0ZEyu2zG8E
	 Xn1Ax4NJVYm7e2NqYkAcNskeVI/dgyrRBnAS2RJpeQ/4ZK7CH/0RkpSPsUR7qo6OR4Wa+
	 bDKUyV1mgWEbAQJRkbNOtGBg8a1HY0LkHr6hIPt/zuvR+ZW0+mcRNfoyzTcz2Xw2529l+
	 OQBww0ptr1KfZnKo1HIafuGNRRYDUBlnEOQut9zXvl/tBxmmANGHXM9zm+qy0/JPXJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
	b=iCQ/OMLBCQPlCBh/1+7w5UyoqQU1x7Qc5IyZSIgSusCARgwy9DWuRK5iLQ2Lyaxtxkr4
	 2hrHbxtSaPse643+gGgGUy5BC/uNdPt2hSEN89qzG5xFiouhQMbRw5VMqg79sAx1bRYaR
	 y6S5h/ZxUvC4pTTCG4lYaYaR5oN4jbVGCQQaB1/KtLq11Ui89CcJE61rbk7nHaBOsajHx
	 Al1pTnwnU4QRx+sVc//N80F7fTifX+o3+5IcW8tqcQfCGoguhlKs/C2g2XiIuOOrd86fM
	 LT0pgrYE7L23NVZ4Slzb+/lsNOIVcnKLG27jG68jopTko2VJH0CPmAPBtYLb+m2wUmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MY6jS2DG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F823606A334
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F823606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MY6jS2DG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3uMF2096534
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7
	KZKnHLwk=; b=GubjcS3WWE//GTAtNVooXD6Dfo7xWxMD0xQSB3+z4b/XkFtE2Vf
	E5oEAbrcgvPs6Hg2rFUlGD60XPEVEPezlRL5Go1CnsIKU1IQu1oBqb9gbtRWB26y
	/rmZOsQew60thQTNvoPXehcYgbmq2Ufxh7M1hs9LjHvrkRT21sVSdmBLv6YSLAIY
	w4JgPgVwvDwSkZXL/g75UBPuJDh5mbUl2jKnxBpHXpRoUsPE3JuSVsVR0XL552vf
	UEnIg2N7dWfx/FyMMkZauIDFsAjANGjP87iNJM4+M2RPvNmiREP5hvoKZv6G6fAl
	C3l5emmzK/xAYe4hSaQelPUoxAceqpcUfYg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2ndp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:06:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso624810137.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920782; x=1795525582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=MY6jS2DGf7bBCYaUMV58mWVRaw7N0QsxvvJTtb/mwGEbJTlyKJCHFBcnpuIMd6qy7N
         y459ewUh0gbgI2Sf8lbZPtT5dhGbWnrqGdTvbAOE5hviUYRZAoU9q3PFniYNwS04sexp
         CtkVPR31oYctXCLO39WL4pcI57/DM3p9bb4jNyTxcNBVSRb4STTEtmMq7N1yg0E0Vsg+
         7zILKEdHszbX5jp1JFIfPBYc+GpN4EbDOsER4fto0GDuGetxr2L02V8W/LlIO/a22f/z
         oiBdYl763XjFXafYYuBxAlUUrye9OjAPRHhu77elawxUk1Y29j9PZb4S55JZvFGxsGHm
         A+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920782; x=1795525582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=c9z8o5p+8SaxJuPvhL6pVQqaFD3s0fizlNu9h/uo8yuEBH2PjVQoJ55BumMxCtW7c5
         bVhC3CnTMfsozBrI5c2OmqI8tbCN1wt44vxE45aalGi3s4IiQs/QhJ6hFSXDt843DMDn
         LjJW522hVWdCv6tpP7/7qUek2yHyuf0HzG7qCn30hzLqZmoI98PYcNmiORe0ymqnjIWG
         ulqW947WwrEbvL2tW+5vTBIIZW78p2pBgz67V0anZXyYHYHW28yqg5JKpQKgxT0J1xge
         /oYQNtQmnZeLnFxfS5/peX+c3B/RYy+Ubsr4hpyNP9n+fnLzW0Q4a4dsG0IqRR8fqNxG
         k0Tg==
X-Forwarded-Encrypted: i=1; AL+hErHXA80vv/Djw8RaAhItuPfIGrrm8Vk+ZFMSErN5ry4kJb8R1a/hf8unntep5goa7WJnEu7dvQapvVUE@vger.kernel.org
X-Gm-Message-State: APuU4Z/iQTPrRbrXQe1BfzqHYTOOZo4F6TMqodtFxhqJirK91V9dBzQC
	t7DXRrd6ToKJChz1TPI4Ua8jIrh7HA1udQI09Lq4tC7Lnw0DOEUvLZzTM3/O0+F4T8PjI0lM4Kx
	9Ji2TXu++Q4HfAgurFhH3ircOH9n7EPY51F+Emjx4xYaqs8PBlpkzWhn1WSwtTU6k
X-Gm-Gg: AYBFou320SBmIqBKU12cYAiuCD54nl2kZUjoBaa+nEkXgen7TsS13ZMMNZCY1xmQHRt
	i8azkjrYvWXx6cISho3F/xo0woP7DvcWirkEWwn+pc5OoCZayLkv0tqT2sWcJPzi3GmHn9zt+41
	XILKYqU6VQhY+hsAaXNHny6nNjupccF4GA3aTLps2PfGyij4ylSHqdeRy9PNQw4A6mZaq7BP8UE
	RKFriBmW1KU6jrQC5jSD8qwAX4uPQDZHHA+hrKsDwHPXWcSmT831vbrYjC/sIEDxTsEgJ/UAvTq
	XBNobOytUi5dn70VVNiwI0pfPeXIMuluTKoiUSyxT0rwxkZkg55OPFz14dxuHcKY0HNDq2FQb5A
	5ZHrlzgYU2zhxpCf/ASwVzEbVKIS50SbmQgC9lgy8Cc0fzRWq4w3jFy49zXzdOQ==
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659927137.34.1794920781719;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659906137.34.1794920781161;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5835117a12.9.2026.11.17.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:06:17 +0100
Message-ID: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5232; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=clfI8+19pJhAA+hV4S1Z6XrUeG5urAAHKTU1TXEfHlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FFJYgi+OqbMxgoQ89jlVKosb2EARn5KZIaER
 f9mvb0IWpyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRSQAKCRDBN2bmhouD
 15HhD/9oH1BS9LqVZQUmtukQ4pBKCTUnveLA8banunKm54eECmroM6X+THHC/UIfkgTIp9t3WUn
 FSAhCkt01Vr+dQbCnSu8lY0JPjnuMK2wOaKZZZPHzbmUchlIfqpOjq4pwoom4AkX4Es+RmEXl+j
 3LJQNF3/DGw6d+YsEHxGCl0WNBqqCrIdTR5USi8kFXSbmIh8uFOo8iSvTcpZEXHhsw4o/m29O6g
 5fyalqopdTAJslaGkcPPy9E3NeMmGWWz52a+CAvcw+p111gRGN1W+j9JWpsEiJ09ukzCofT+zQ+
 5b4BmJXEOPUs2GkA1d5TTbF6w96/IsN0DNRdqHHOTj8EztnF+k2+Jvx4GFFruuDI9nCvIh0snBD
 x9PQTybp61IT07uCgumlUt4Hjfsl86eagESaE5Jo6xdDPPG38hvO4f60NY2r/sbayH6VETvYHD9
 Iz+2mdtArDeIRmNrl3G7LtqmzAj8T9IZ1yJq8r9zPsHiD5zemQ5gPtSBOK+k/7Z3qtjpmJiMJC3
 IGSdHVCHvrBRzXMFBS+bmH3TXODB+w588WrxwZ0Nr+3RMdUyb8lkWdsnwm6swZutHZsdrHl1+0A
 OtNrIpUmuNoRSr0v7+QrE+J+kaaXEV01l7HPe+6ltJVVgj/OfTs2Tfw1F3DcQNEtxEbl8i9dG/k 34eoEYM979TDAuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6NAgG9z0tr6BZKtMDc8qQHRSh24BYw_L
X-Proofpoint-ORIG-GUID: 6NAgG9z0tr6BZKtMDc8qQHRSh24BYw_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX34/3ifBKnSV4
 dTW6SmkEplb4izxOI9Z7k9F9aDuxZEzNtT54PC7Cc79SCeCnGwkeYS4O2zfNTTmFf+077dL73dZ
 sbh3NGoe0hnJpe6fOWIZlqXqk5OE8C52xWm09dx3jaabTBqvv0ZMJiUTr/ltnSf4xFREM/6Ywni
 QukB/I842caOP8oNoCFy34CajgRtjKwf87tbuOj3D4i6WryMyfKzCQnoEm4vWE6s+BekVsH7yVi
 l+bvqUpuD1lmZHfVee9+y4/Wtqpro8UihTQP9M+T0xhHfC9UN/2nBmaOOEhDcrZwPlM4o4VxvWC
 dAEbmR46cfe3mum36JtciHABAqXe8KwlazODYGgmDCT8rk7LJmCX58WRaROise47cCkTOR1foGt
 kvk0irM6J/DVVx1i12bj+jZhWDUQcv0unjjwLARqXbNKnoshRqMgSnyIs51oKaYPJIQdd+RQqbU
 ZyhXu+lRZeeHK9ui9ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX0AeJVNOebR22
 zoW9NQM0ydKXseKblcftgOovhZUU+ISjKrO9rQX6hMH8UuwHb5E3PrSARzbuIVn+kLDjN13FiEy
 Fh3BwoKV4hZjemq4xajQYh77PTvnicA=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc514e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Zz3YpKYli0cBJYq3SAkA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052

The atcphy and touchbar aliases were never approved by Devicetree
maintainers, because they were never documented as actual ABI.  Drop
them, because no new custom aliases are allowed for years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 4 ----
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 4 ----
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 8 --------
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 8 --------
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 -
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 2 --
 9 files changed, 37 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..9f0476e1ae2f 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -15,10 +15,6 @@
 / {
 	compatible = "apple,j375d", "apple,t6002", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Ultra, 2022)";
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 /* USB Type C */
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..1a745c6593fa 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -15,10 +15,6 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..3540edc56b0d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -13,10 +13,6 @@ / {
 	chassis-type = "desktop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
 		serial0 = &serial0;
diff --git a/arch/arm64/boot/dts/apple/t6022-j180d.dts b/arch/arm64/boot/dts/apple/t6022-j180d.dts
index f76b887429dd..0b1f1bc46270 100644
--- a/arch/arm64/boot/dts/apple/t6022-j180d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j180d.dts
@@ -18,14 +18,6 @@ / {
 	chassis-type = "server";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-		atcphy6 = &atcphy2_die1;
-		atcphy7 = &atcphy3_die1;
 		nvram = &nvram;
 		serial0 = &serial0;
 	};
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..4fc9a42160ea 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -17,10 +17,6 @@ / {
 	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Studio (M2 Ultra, 2023)";
 
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 &framebuffer0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..779da65a66e3 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -18,14 +18,6 @@ / {
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
 	chassis-type = "laptop";
 
-	/*
-	 * All of those are used by the bootloader to pass calibration
-	 * blobs and other device-specific properties
-	 */
-	aliases {
-		touchbar0 = &touchbar0;
-	};
-
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..5304a5591984 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,8 +15,6 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..b0c93788c72a 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -24,7 +24,6 @@ / {
 	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
-		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 562e7a25a1e8..31d8d2aaf30b 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -11,8 +11,6 @@
 
 / {
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 		serial0 = &serial0;
 		serial2 = &serial2;
 	};
-- 
2.53.0

