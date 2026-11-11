Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416651;
	b=Vfi9K2rt9drvo9/hgri8L1L5LxkI+k+luVXPfaxK1+yF7hoJvdnygPqbAfxgpv2Qd+KP
	 3KCQExKZHrOpxkGm27KPBw1QG3G3e6cdIZDVnZ2sTRgbW8YvxiM3/TEQYw/r5qnoL/okg
	 nFpX3Fa7Vfm7TS1+o+q+kNq3YcvoXFG8odfWJVOR0Tr1PrvbkRLKgdOY8dxq47NwdesmI
	 3TYxKNI7cnSXP4azM550bKdiTy0OLyGIjUPRN8HNnESxyOSPrG5cDtXFAc9jviPj357Rx
	 HNy9PDwlwFgKopwh/O2uq3bfzW6ZiEIjvxkwLH7vLDOzx0T6tPExKbmOwImiT/7srHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=aGYMJxDt5mNyX1ythJW7Df8v2/MGgm3/uq5IXjw5p7ymNkSBydOTUMnAT694sN1Shc9d
	 6Mz9LqXiLL3LG6hdHLiY0w4+GHOmPKzhgsMzvw3bgJ83tOWQ8LiPklHc75VPT6OjpTAJy
	 0uD0sXLZ9gwMShLsX3njWd7bTdQ1785MwPG3/M0BWTHCDd65Ny16Khwjl8F1L/pG9Lv6I
	 R54v48ihV+jRTzPltc7eGfBClz/7wp5CnZBRf+TiMOl5/r1sztyhvzlUJQIIzanwMm17W
	 u9jG/P6YB1jrhx1o2+3tIpSeEecpkaYuZ6hYiDGtNQRQBp2SAMFpkfD++Wnt8086sxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMrv5y2S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTRCdbup;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53406606A330
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53406606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMrv5y2S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTRCdbup
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0N202665091
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=AMrv5y2SDEj1201W
	DsPJqv+W7HO6XEwF+NSlGw2wfde108At7Bq4KcuYbTml1XXLLOuh06F3o2BUuGQN
	BMp/L5CCvnnEzQaBcH20VUH0FB/GVgWbYPAqngvNfMLMMenxSYpygWDPC8v1jlpa
	SO6I/A+sb7kphRbAN/KOzHqTdEDthKjoiSXRHCmmjQCGmvvdEcKUQrLQHemYRUdB
	dxLQrIqa6aDLx1KasgbZRKROrInvRw+Dn35K3TWnnsvdr13ECX+NOb85Ctqub+hs
	VGpvkWul4tWllN3DEM4Zx50wVLr73mrnWhu5vp2slNkj8pw9bKri1e3Tx5AuYvML
	+C6sJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjw16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:04:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so3153253a91.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416650; x=1795021450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=hTRCdbuperrJlE2nKG5TGEjRpkD3exwAY6wxYZY9UDHtUu3LGtxWUh1W6rywmZ28up
         yzXZzz13VD12v/kPZK5FxCH582baGSgKh1rVndHJeeGLiOXLezj1d50pCrd59rQiZ9wA
         o5j2IQmlw83uc++CuWtFpgOtoOlhpKAMuAF5MzWdNAlFa0rVjBIfeM2zFpNfgdROBaV8
         Dle1EXa5YM5bBnhaHyemPqyCqLNPt94gOkvJu2SfNruF/jkCipsSSx+9J3ciG2rEQoi0
         j/QgoHWqB/53Hq2/23OuR86hm3LDfW3QNvED3UruIMmi7W5ZAtES13GTEuyd2jUXWV/C
         +cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416650; x=1795021450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=wKcoUO1hnPsTYfKtfChQ6Z+oBQu9Lk5zc2uQoCIpmbfTnVdllzqZSLWbIbtnjeLo+K
         rATY5jHCfwvr56yVE8B2RexLIc4+Jo57e//MBakAe9Ex4Q4/K26H5bK0M8lwgz3b0TNm
         IFipgWnwGd8EdVucWpPyAC2B6mK4Z40sHER8Lvb6fY62SRsZPiNdgqVINdpJAE6HPXnm
         tKe75TumfsnyMKp7zv7dcU7W7fkxwFI9bvk23oNRUTqAAj6/Ljz+DO5iNdyAhJd7QlRM
         sFKxSanikf3v9OfdsICp/zLaC38uj60rGjOh+O428mzfAIfTzWB63UxH0D0j4j4c2Jwy
         svQA==
X-Forwarded-Encrypted: i=1; AL+hErG4xEHKMkLGbDdxJDl1rG+ylO1hzD5nkqkp3NOqHBRfF6Ksfp2fD77NKDjO5dDbr11u+gh3Vapy0AH0@vger.kernel.org
X-Gm-Message-State: APuU4Z9BTioTneXJIsh3uhbLn+CDKwjNn/hl9MPgr4ro0jYOp2L7frd5
	cNPwBAE+GNkNY84qRjpntsN03mbn+waigAZbffyNiGA0qY/84+d/+lf+FP1lPJP75p58wMKDXRb
	Q4ExEzganSFbFRrpop3uB600ACjQvynl2IWJMaf3w+/tcWIH5yonr0ldCZwghWCkg
X-Gm-Gg: AYBFou2A08cpLtdMBptDmm5kGFRbDtB4y7aHDSfEZYkmxm9XtxpdZ2rt83FtJnZHL8p
	oeqVnBla/Y2vwj6W0I8esW1lf7d4bo7LqOrpIDl9gqEHMg8ImzqfUMd/6UcLSBJz0QLkkSIp3XL
	jaYYv9yRTdf7OZWqAAQXIdTKr8ToY4wiiMgRloVev35dtMyWqHoMpAjS43r6Cyq3Had2X91yUst
	tu/AqCKnA0YT7uMWnUFsuas5RGM6pFlauaJl6HvvAQTXxwCuBT1OTfF38D7qLVoyCQWVogpoXKd
	FTlvShgHcmSRQDdy1vakiWYMPc4M3UmYNx0ujoTQO3Zt1Cv9FSI920390ZRUROXhKg3StnJnfZ9
	3gPeulxr677iafZLHjVRri0q7fqhiAH4Br4UNSc4rEPArc0GUsXJ8bmIR1+6Wpqft3J8=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr2767191a91.43.1794416650132;
        Wed, 11 Nov 2026 09:04:10 -0800 (PST)
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr2767168a91.43.1794416649690;
        Wed, 11 Nov 2026 09:04:09 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:09 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:55 +0530
Subject: [PATCH v4 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261111-pm8010_i2c_support-v4-6-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=feaEG2hkVROaB8EYdcswFevmqiFEx+Eno2p6KQHNxWJaUuvO3Xl0tLWruMpRpCxJoNs351DJ2
 on6ScmDiLKWCSqCwaIOFYwv3fHlMaGC3MbVvmDjeCliAWY2/RmXm4bm
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4a00a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: N3zhX5XJGtZKQ-oziu9jigBVH8gN9045
X-Proofpoint-GUID: N3zhX5XJGtZKQ-oziu9jigBVH8gN9045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX5KqVPPcKJ0wC
 LtTo7XqMMr4/SeNWr3WJXpmW+yxJXDtGFpjlqmuWbz+9OyW53xjaAR8y/6EjK5Lul3/vVrUu8LF
 YX3D3WRVO0wa9Vfj0RNU9RVXBG9kiv1OR30d7oPam0gHckYPSRjnKd8QoB8E4GxV/5Q50bj03wp
 Ig5aArJH6SWzTOrCyvJgKOaJ+fbYaqaNVpMsm0WaV30xJoyFhkAgoG4beTsrf+wcxp7mc7TZwRQ
 6eePGyZMMzKNQ3NMo+aQnTdgxGz3WAOxOspA6rtz56sT3nNo81szDa7CEYa5Elo91zSsXdFxYp7
 cn58kUrfrwgIvSn61UaBG2HNsKSAqVYsGi+akadu5R8TYiQPsfeLKBxVxFMqQaLqOcyK1wiHCbs
 ZA9PB7Z7KMGO3mwL1M04GLJHhdAevXj1CHRxXeRRVbU5uU9yBN6ap9vLLA5I2rBZSncvaPL9Tiw
 OXvvWCYzwD31iBptesA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXzqWONdbuGygY
 N0dxGS2B0pLmw0zm91rJBZCODse/yyHicgq0td9XAAd41yqlv4nv5bgzs5FekKbCeWwxum86Go5
 LWAOUYLy6RnlHZ4jqrnsUV/wrdvcnh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

