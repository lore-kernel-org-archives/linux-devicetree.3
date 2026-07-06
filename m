Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7344211E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333178; cv=none; b=fgnGt0y4YwV8a13njHCDBKb3rGUNd7n6pyoTQbj1M9R2cNnZSM5l7Zv9mHXni9CzdgvFeyhzkuGWZbtyAqoh1NJ+P7KnzWhnocRfVB5YT8CcpQT3BDNG0MhUixsrslgJat2f69l4s+kVBLSvp1kVuvqn16H3TEVkUyb+yBnEfng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333178; c=relaxed/simple;
	bh=wd87wCk7Lo7YBoaYTCwSFGdDxSW/IhGXexaZrkSW02k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fv0eGVOuXhyLceaKfwDgmUB25KhyzcreOJXTMiUWLN5/zz/oGXxqd3WMA1JYsiEg5T7B32+yHP5qK8RfTEOQZBv8Nh3sZGUsabgn6dj3wVPNJh1Z+Pt3qLI1D+m5z8ypCiOQJPKnxRONuPwPCHR11UAgQ9aO+C7Vz+Zu0xPrA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9Rzf1dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsxv9/Sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9Rzf1dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsxv9/Sc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669phi5237607
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5
	URj9PLxk=; b=h9Rzf1dzATzkzVID+03XZlRJH/6EdzozbSf+FVhvyQ8mVxE9GKp
	R3RIrYl/g91EcSOZ06PUCNTGlfasdki4QNh6vjgcQKUY3mBsl9xMbuUG/+nYZmrw
	etEHIwEOQoL+x1pYAGZZPjmva1Dos8j8cHWwp/bj3giYqoI/RwBNJE5QXQXxUVa2
	OEOOCmmItOWuqGD3ZytWHua4xje9IuxAHMUS/RUSn0ppuc7pAL0M+P6aYgDKLOMl
	i9rjBCFM1an6ZP9t7HVPjlEwpeJbOF1RReL4HVwXyk1Vq+ik1Cq4dwUVedsSHk9J
	gzfgTDrXpaomzYW2sZKFaLF6CyaYwgPxQYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r03r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92da6f3cc81so352390285a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333175; x=1783937975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5URj9PLxk=;
        b=fsxv9/Sc8mjibQ561jyfftzdLBs2BrtRZCFPpaqyIxakWzPIjYN1sEWLtnLNpFVvRu
         AupGDNWFQHrUIQu3ZiXbVHLjBd279BFonSgRkegSOJJotBwpODh6gyHCQFzKwC+sWH3T
         GEwLJz9W/EtuaL7Ol+BrizKdiNMyrU1Uqu36yxAYY3aUa/THm80EWWoeQUpNPsXdpeEl
         f/i8tNpH3ys3tBalFq15AY6kLUpfy2YXZdHTLJSiAnZJaPRpbssVOoECb0DDB7ZVoeSe
         +Hu5U5UZ0QwSd9byP1nh01D/dew9rArtYrPHKENX+FswZWAJe7M6Vt7SBbfPoqDXZAeO
         ZSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333175; x=1783937975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5URj9PLxk=;
        b=mwljRIb3wEuqwJ7VSzOJd4en4KcJn19I7xKHdarMrf4DpkDV+SsrXarnNZ9UrwV4Qg
         3M53wv61XEtnCbMSyqZ7ZA2CHSQqNxwZQKRu6JQArwiVHnBEPdr8AxAfhT84PjBhUR0R
         V2iyQKEBQJVTsbH8PGZP+scJPCioQztDDbU4+amxDU64W1Pu/FDmACgPucvTIGi+Qjm6
         SfpG6vr6n9q+mnZRSBzcP+M8eMyFd34LL1GG8cEgurJKW/qt1s98Rktl88FUpH+tJPPP
         ZL4aEzDri77Mg3DhpR6noCwhyESKeK7xH4/hDe/sjnCNnIFnXbx1DwQmIAeI3I1LYF2O
         Rp1g==
X-Forwarded-Encrypted: i=1; AHgh+RpJuhNFPMYf2k5f7DuAw0NIWnfp3e09xuuEc5n5jwt7gENeBHSPatwqvWz+607wz6XBpKa+ws4v3zJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCYaZMIqd9RWMCR9wFcBgd6zYRmBJwAgsT+gqMatvy/V1umHA
	9ClH4a4ZaiZlPPRF1kAzbm3TYKJmVf+zMtpRvrIczyHo9B2GRh56nWe2h/C6WwpG9mSacwr2pcr
	kPRD4uuMQ4y5QV36NXKJAcIo4gwCO7NrSYk3Z0NLvU6lMPokZ+1efUYsXFH32RyLt
X-Gm-Gg: AfdE7cmvudxdU+iwVe9hV6pLVspTs8fEXr/ZS3AjS2UZFbp/n2xTvjQfip64xBCRYwY
	SeIuzcoU94DSaIRMXoAtMxHuq9jIRlQhxkBnfxT2DFGzxq7Kwxrmo/i0+YDygVBQ0EO/pJMANEJ
	4SGBMYrUwAlKi8E+HpqjTqE809KmKSTDuvJxNE27E7FO/Rhz9GYvapg9D22WL1Fo3n8F0sy/cB2
	sUGs8YZ3FoAGGic53r5GHJ77+d7klBO9F5NOWCrf6zQuyXrVN3uWgOcApZ5+iGezwpC4Zo32fQ4
	Uz7bcqipZD/pclP5onITsO+VvQ/G879lrE1VfgDn7FrikwqHGf8EnYEYF+5+mwN/LC9qFnYqCOh
	cO4SqkUmo8ytf1S8C+Jk/QaGUOnY=
X-Received: by 2002:a05:620a:800c:b0:914:bb06:288 with SMTP id af79cd13be357-92e9a3af0f6mr1369658785a.22.1783333175499;
        Mon, 06 Jul 2026 03:19:35 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:914:bb06:288 with SMTP id af79cd13be357-92e9a3af0f6mr1369655785a.22.1783333175072;
        Mon, 06 Jul 2026 03:19:35 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm24235818f8f.5.2026.07.06.03.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: aspeed: Correct indentation
Date: Mon,  6 Jul 2026 12:19:31 +0200
Message-ID: <20260706101930.341635-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10398; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wd87wCk7Lo7YBoaYTCwSFGdDxSW/IhGXexaZrkSW02k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4Ey7mYvVUNogR/yoIJnYevou5t+jFyQwPPXI
 svkZ7TevaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBMgAKCRDBN2bmhouD
 1xkZD/97bMDPwUqVYOtzzEefvUZkfdTtp3OU8gOXAMbAeR0VL/PXVPjdMPwIrwOKoaHyUQ6H8qN
 aEE2dpKSrWk2vNjSBE8z0xDCPUAAiYTaJ9h7wDzti4hkI/v+GZW3srTzNM1MdE49FmqWyDN6o+u
 clo4FzC4GdsBv6yHwBHcNA4eeYX5ThFuFcD8jCKKCUwuZ3rQZ/pZN4nZwfp9dZUIrzN/iTwkHHj
 NPuuq616+2CihjGVNhvKzMJx5sbBNMZhU0/t8r2lOFSg+4DSvIP/NUJeLjnKHdUR0S5ILKy5wsB
 lxOHdJWzsHx5rWu+eGJdnX3CvuffQLr1rIqIyrhGpVWZjUTx1WO44Ch3T7e4kd3TEjKbCYoKCXU
 Dn43LVU7L2t/Uki0lGfFHP8BSr7A4pZEe3wWsoxk0GR/mA/Yb5OmuBwojds6v6My9Tl1ahz4UKG
 bdsqi+Ey9oyMPZU34pjGs8d0AFKY0xapPb8tMZwZW/J3g0MYkpR3edqy9QodWJKfYhu0yyeqVcZ
 Q/Yh6+L81vhiuUtzJcayj5O/S827nugMvXRh7ziBwyu8QVoDXhkCBC/aAoOnW9EZpjM2bSf1ZRm
 whtRzEbpfeKzzGLG4YxwpaEkkV70OubUW2DMq+oQUIbtD0WAJDqbqSOVTyOg3cYuyxM/nvwsr6U 8UwYaEdf3fsbLuQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXxI+iT2aM5clJ
 bGLnoXbgwGICidsBkYUGGI0WyCUfk0htjl9Hbhm+Ak6D63KK4j4L+LnICgnIR+CfaliKSOi7jKO
 pw6IdLN0X0wMuCn0AoeY4/YZ5n6OzHwMPg32ItCwE2Itzbt6BWRJuk6hpJFY172bLJllXBc9g2g
 +0leEMJIPZ/abj7SOfddZ5gvwycAYn8C9OidAvPHWPY4yw4cjGEIlebCbr2boPBqKzZfz+inxKO
 PGLThiGTkmKG8aNEgimDLMIjsCF2dmA1LUxHMaKqGy0NThAWaOVDojaRLtHJ7TEWpXgEBdpzSuv
 ENau6Lkpu1fOhF0M77ahja0+E5zyWuBX4+IslyZrhmoe0JSUI/FGg5wL46Nn3dctG5vAy5rDZs8
 Mg8Fne8lXaODqLvmXRpmjA+AjEDCr5PA1lUep4JgYri2GE6BGK/rv3glhoDzH7BBJdCv/t/fLec
 T5IkMU225H8mTegmtpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX+x3TOn0xkdpL
 IenZqxO23x+QHzFVluwQBsT6w3bwzpJEFoikkT9J7EWpCjULwGFgzzD0ACgEZocbHBu4/lw9J/a
 EC/NxGjjKlf7niOgUZiSeMPBOOa/CB4=
X-Proofpoint-GUID: HPANRKh-_kRWauNpB-H3AwRu5orwSCuG
X-Proofpoint-ORIG-GUID: HPANRKh-_kRWauNpB-H3AwRu5orwSCuG
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b8138 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1noj3m8NxD8BY0cqL3kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 .../aspeed-bmc-inventec-transformers.dts      | 200 +++++++++---------
 .../boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   2 +-
 3 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
index c713cb7a6187..e51c726b4a55 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
@@ -13,33 +13,33 @@ / {
        compatible = "inventec,transformer-bmc", "aspeed,ast2600";
 
        aliases {
-               serial4 = &uart5;
+	       serial4 = &uart5;
        };
 
        chosen {
-               stdout-path = &uart5;
-               bootargs = "console=ttyS4,115200n8";
+	       stdout-path = &uart5;
+	       bootargs = "console=ttyS4,115200n8";
        };
 
        memory@80000000 {
-               device_type = "memory";
-               reg = <0x80000000 0x80000000>;
+	       device_type = "memory";
+	       reg = <0x80000000 0x80000000>;
        };
 
        leds {
-               compatible = "gpio-leds";
+	       compatible = "gpio-leds";
 
-               // UID led
-               uid {
-                       label = "UID_LED";
-                       gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
-               };
+	       // UID led
+	       uid {
+		       label = "UID_LED";
+		       gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	       };
 
-               // Heart beat led
-               heartbeat {
-                       label = "HB_LED";
-                       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
-               };
+	       // Heart beat led
+	       heartbeat {
+		       label = "HB_LED";
+		       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+	       };
        };
 };
 
@@ -47,8 +47,8 @@ &mdio0 {
        status = "okay";
 
        ethphy0: ethernet-phy@0 {
-               compatible = "ethernet-phy-ieee802.3-c22";
-               reg = <1>;
+	       compatible = "ethernet-phy-ieee802.3-c22";
+	       reg = <1>;
        };
 };
 
@@ -64,22 +64,22 @@ &fmc {
        status = "okay";
 
        flash@0 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bmc";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <2>;
-               spi-rx-bus-width = <2>;
+	       status = "okay";
+	       m25p,fast-read;
+	       label = "bmc";
+	       spi-max-frequency = <33000000>;
+	       spi-tx-bus-width = <2>;
+	       spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout.dtsi"
        };
 
        flash@1 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bmc2";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <2>;
-               spi-rx-bus-width = <2>;
+	       status = "okay";
+	       m25p,fast-read;
+	       label = "bmc2";
+	       spi-max-frequency = <33000000>;
+	       spi-tx-bus-width = <2>;
+	       spi-rx-bus-width = <2>;
        };
 };
 
@@ -89,12 +89,12 @@ &spi1 {
        pinctrl-0 = <&pinctrl_spi1_default>;
 
        flash@0 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bios";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <1>;
-               spi-rx-bus-width = <1>;
+	       status = "okay";
+	       m25p,fast-read;
+	       label = "bios";
+	       spi-max-frequency = <33000000>;
+	       spi-tx-bus-width = <1>;
+	       spi-rx-bus-width = <1>;
        };
 };
 
@@ -115,9 +115,9 @@ &i2c0 {
 
        //Set bmc' slave address;
        bmc_slave@10 {
-               compatible = "ipmb-dev";
-               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
-               i2c-protocol;
+	       compatible = "ipmb-dev";
+	       reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	       i2c-protocol;
        };
 };
 
@@ -129,9 +129,9 @@ &i2c3 {
        // FRU AT24C512C-SSHM-T
        status = "okay";
        eeprom@50 {
-               compatible = "atmel,24c512";
-               reg = <0x50>;
-               pagesize = <128>;
+	       compatible = "atmel,24c512";
+	       reg = <0x50>;
+	       pagesize = <128>;
        };
 };
 
@@ -143,26 +143,26 @@ &i2c6 {
        status = "okay";
 
        tmp75@49 {
-               compatible = "ti,tmp75";
-               reg = <0x49>;
+	       compatible = "ti,tmp75";
+	       reg = <0x49>;
        };
 
        tmp75@4f {
-               compatible = "ti,tmp75";
-               reg = <0x4f>;
+	       compatible = "ti,tmp75";
+	       reg = <0x4f>;
        };
 
        tmp468@48 {
-               compatible = "ti,tmp468";
-               reg = <0x48>;
+	       compatible = "ti,tmp468";
+	       reg = <0x48>;
        };
 };
 
 &i2c7 {
        status = "okay";
        adm1278@40 {
-               compatible = "adi,adm1278";
-               reg = <0x40>;
+	       compatible = "adi,adm1278";
+	       reg = <0x40>;
        };
 };
 
@@ -172,15 +172,15 @@ &i2c8 {
        status = "okay";
 
        eeprom@51 {
-               compatible = "atmel,24c512";
-               reg = <0x51>;
-               pagesize = <128>;
+	       compatible = "atmel,24c512";
+	       reg = <0x51>;
+	       pagesize = <128>;
        };
 
        eeprom@53 {
-               compatible = "atmel,24c512";
-               reg = <0x53>;
-               pagesize = <128>;
+	       compatible = "atmel,24c512";
+	       reg = <0x53>;
+	       pagesize = <128>;
        };
 };
 
@@ -194,17 +194,17 @@ &i2c10 {
        status = "okay";
 
        i2c-mux@71 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x71>;
+	       compatible = "nxp,pca9544";
+	       #address-cells = <1>;
+	       #size-cells = <0>;
+	       reg = <0x71>;
        };
 
        i2c-mux@73 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x73>;
+	       compatible = "nxp,pca9544";
+	       #address-cells = <1>;
+	       #size-cells = <0>;
+	       reg = <0x73>;
        };
 };
 
@@ -213,46 +213,46 @@ &i2c11 {
        status = "okay";
 
        i2c-mux@70 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x70>;
+	       compatible = "nxp,pca9544";
+	       #address-cells = <1>;
+	       #size-cells = <0>;
+	       reg = <0x70>;
 
-               pcie_eeprom_riser1: i2c@0 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <0>;
+	       pcie_eeprom_riser1: i2c@0 {
+		       #address-cells = <1>;
+		       #size-cells = <0>;
+		       reg = <0>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+		       eeprom@55 {
+			       compatible = "atmel,24c512";
+			       reg = <0x55>;
+			       pagesize = <128>;
+		       };
+	       };
 
-               pcie_eeprom_riser2: i2c@1 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <1>;
+	       pcie_eeprom_riser2: i2c@1 {
+		       #address-cells = <1>;
+		       #size-cells = <0>;
+		       reg = <1>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+		       eeprom@55 {
+			       compatible = "atmel,24c512";
+			       reg = <0x55>;
+			       pagesize = <128>;
+		       };
+	       };
 
-               pcie_eeprom_riser3: i2c@2 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <2>;
+	       pcie_eeprom_riser3: i2c@2 {
+		       #address-cells = <1>;
+		       #size-cells = <0>;
+		       reg = <2>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+		       eeprom@55 {
+			       compatible = "atmel,24c512";
+			       reg = <0x55>;
+			       pagesize = <128>;
+		       };
+	       };
        };
 };
 
@@ -260,8 +260,8 @@ &i2c12 {
        status = "okay";
 
        psu0:psu0@58 {
-               compatible = "pmbus";
-               reg = <0x58>;
+	       compatible = "pmbus";
+	       reg = <0x58>;
        };
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
index 8a7fb55ab489..5a3e8a3941d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
@@ -82,7 +82,7 @@ &fmc {
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-        label = "bmc";
+		label = "bmc";
 #include "openbmc-flash-layout.dtsi"
 	};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..edf4b74f5aba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -517,7 +517,7 @@ timer: timer@1e782000 {
 				clocks = <&syscon ASPEED_CLK_APB1>;
 				clock-names = "PCLK";
 				status = "disabled";
-                        };
+			};
 
 			uart1: serial@1e783000 {
 				compatible = "ns16550a";
-- 
2.53.0

