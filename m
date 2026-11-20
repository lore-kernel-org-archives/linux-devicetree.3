Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171483;
	b=sEkQOnrX3909kCH/VDyI4AGZVY7OxE0FQiBwpnoqbNZepJ9UGVp/XqPZGqMuKdoyqEMd
	 sdlVVhYHxfu2fERkQHgwcxaMLkPVLgWgcUx3gZkK4UcA11rkRfeLp03kAPPm37LP1GR3N
	 7HCdwkwZQ8YDGYKnfY8H0m1Ev6Xpek2p2D6Souz3SvCTwbDTP7m3SXDcCKiXPjAS3xd/C
	 XOYnJeL48etn2wrq78MbmUjDPiUUSHj+stisqCOjHReDfrlYWJydGkM64PMNidtgs22+I
	 F3ERNyUpB598aOajQq87jr1VbBzbNmfkuktAGRti9fJjw+UMq8LiRZ9tby3QU53OHJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
	b=vcRrEK1S3VgDUPER1uZ0Zx6gZlIsUS+dAYtGAvonw0KGtvddU8QulXvw9TEdYy46IyeF
	 WtuFzHLtn/bo1s5/MekKBO4V7e+TyT+jx/0Z2CE5V8hCo4gaOUtRJ+RDGZpPmoDr3250n
	 cibsVN55/YkgE1g4EXvzgyn7apm+CEwZ8zwqaa4G9QHrYzf+yGQKbp2dzrgXoKfPZQMac
	 kFUvkXTO5bQmMUnxmQLCJ5N6eetqcNHQ0/JVC26U1xiJEElN8Mjc+800Hfcu+7Qbk8Jfn
	 2nYgYfWx1UzzVIYtZdRk/gWX1lQmzzjlLRhAcFP3Xme5Kaj4g/1lS1sCfD8zUYWZzlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EeLHh3/K";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CE8oAfV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E827606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E827606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EeLHh3/K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CE8oAfV5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f4nU1269902
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=; b=EeLHh3/KcCx/WaWm
	LDQmUDXJ7tCRpkZhlu+asror4GP80v49z6ML17TnNySbeuVcjdnCGlLzQXn+mNdW
	pJQZIGUL02VhoJj9hn+AlpItEXk6fMlLdFZLrrjUeOqfN2hwiWNE4LVNOj08N/qM
	QkZmgSjmbi0VETXDjnrtS2OaYXJsqT454CXy+tSI2yB/vGBScmlSQT6lewPN+u+V
	QeHbynTqqFmS4dcMQtTrjPLJyVLbDl4AoRwgvmqVjM4nYhusLQjmbJimeW6Lprew
	cdSkl7MDtPC6mlEGxTD0t7ru66RfReYEz8jpDI6xTyv/dSdabfy9BH15OEQT4I9i
	/QihWQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t15s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:44:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383f2d05c73so2302428eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171481; x=1795776281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
        b=CE8oAfV58qYjjMqi9g4y/7flkeg8pDeDJMjFgWbtjXCrapAp5BsV3KK1VE3P5JhPlr
         qut+VH/IPsr9K+UMo1U5pn5xnRiW/vHhF4Ik9ox56LDe8c8g7KYQZ8QYhr9lxw6AQ+Bi
         VDmE3zyCV1K6r3toJezZ8hOGnekRbsJrD7cEvYdvHaCOQId3ilq/mAzV+Mu+7YAzw7QA
         QO4myF8X77jovf2jrNc+w1rmhBHUe22FBR9BqsNBl6IOHVIuuCCsWlt4vfClXW1bOESf
         v1AxQCFUAvHrVPjotnvA21M6Zco8C2V1rZpay6XjSjDL1PKR2jcOiSAUDEMOEwes5b0G
         O/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171481; x=1795776281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
        b=TlRe56cBsezUWW3wwADsI20VQUbGU+OXz2h1R80jsgxwFjdFqUqPCFIcypQm1zj42s
         G9zH3uXc8ICGawYJ5bJ4WArlsz0FyMrnibAA1Od/TnesceGPePb0huMhuGCyv6k1ep5z
         aTnN9bq7K+WX5jzynXzEvTFiPqs/LGSBZKIiNAjfWrU1YU3kW5VFNJxUqhtp3BNnXWnA
         HsX68xctM3/w8e9t38S1iYDn7FdSGh/nfpjDGdjdFHf1naDT+zKRQXrTCMNDPAU1/WVL
         J2MtjUFsQnRQ2qLATgY0YMoD/tuVCoHgrwR/tv2vf0n3qpDoeyAHvldSI5l4D7JePCWP
         FUWA==
X-Forwarded-Encrypted: i=1; AL+hErGfHujiaGXIOaRuzcFyYbxW3EWfWHPt6Cg7zPCRsDzofBJEDmwDrQdDmpNDJiLYNd592DIq5CAJV1+v@vger.kernel.org
X-Gm-Message-State: APuU4Z9TpI0mZ8SrzzaWu2ZSC7pEdlMy+9ut2ZBxAS5hzS1AVs92EjOI
	whRmqJ5a0JFPBnxPwXnD4Ms3PkIZBHc5E6YiQpzJQifMq4TXE2iSZCu9GEXmdhA9sO36GbA4sT1
	8gaLba1k+zIGReMlUJv4j5ysJoifRUN2509f8YCUrbGZx03BwfrjqNcNT0Iq/mOxg
X-Gm-Gg: AZFdTZd7hwO0p5BurL73K36fl2yvBaaz6Zan+yhflp08BmIBT3S4wFDdP+AniAaanrh
	ucYa50OaZx7PoqnPXHVurHKU+9wFPH7qmRwJ9eS3KtMOcJGW3YkSlPtvTuZzuL1G/Nx04ly6XOq
	qXYlYb8t0RrMmsj2iv0nedaATaMo7qhK26OfRMFvqZ1vj3vVltmtL7K9UX+TLm5XWLr3Hsvm7s5
	Hr9naZeQq1+FWy9dyQ7lDaPSpyPDlRfMOtJcyk8bh7LvpUdII7hbmHBOqIXNXJDA8Ccsdtiiipe
	rnh665g+/z0dDbLhTKOLIjispg6Mad2aV4kLPULqV4ec83vJkErBvLGKc9mNeGz+8MC+9GNaI+b
	vD0nm3/Hjff2M6M310HX8DjvGHd6rugaSGZ7gFTyJQFWACcsCvFVrzNuq7Fv9loL6ybtElF1K
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr2694721eec.8.1795171481169;
        Fri, 20 Nov 2026 02:44:41 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr2694698eec.8.1795171480649;
        Fri, 20 Nov 2026 02:44:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:14:20 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks
 for Nord
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
Message-Id: <20261120-gcc_i2c_tsc_support-v3-1-e631872e670b@oss.qualcomm.com>
References: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
In-Reply-To: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002499 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: WYqJosw7YsAMaV0VmkjS7llznLUKYPUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX2Xx6VBhaO3G8
 eIbjvD1jhONCCZHnhY5hvtSHUwU1ws1Ozcz5q+YI9219vk52eUIEBfyD3FS2la2otqeHtJ5NwHR
 BrA6aGGON9TNBsYP6H1eri0gABZxGi72FuVEQzCTigUpAZz3Rrrn3npR065QU1wfEAAgNbWcikJ
 S7kCyTELguoQOR+xlBjlRmq3TrAZ10uJYeGnzvyE+qLtVz3QNZW7zbTCLtX4BOzZAvuYU3HKdkT
 ClZWvgYqTnhd6mqII2xJXsxkwbitfsA+jCtVU8ETrQxpaAfNL6yrzOUfJNwV/YZAxI3743krhGF
 hFwIR1hk0EOMSWvyBKu0Scif47P/HAZcE5+aRAoGeyRWT2mt1RExmMnY6sTgN/uXntdIwdQYQSV
 p4r18oPiXNqRnzkOvgLC5K42kA9i8A6lpbE2Q7kJ4Wc6iucjj4SMUxDLtgd1jUIu7vRb1mnxelZ
 bACk+iEgxpe8YNqY2oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX6PBVGiPT4e0R
 Y0DtUBNiagz0B+k+Ith48McDamuDeswgatbtyv3hKicjKDaT+6vtn9nhMpmt1b6BAXbOU5PadZl
 0CTUOSQZbPJZCcTu8FayUNuJgZq6usM=
X-Proofpoint-ORIG-GUID: WYqJosw7YsAMaV0VmkjS7llznLUKYPUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200042

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..f8d6963f226f151d8cd49aba9ab98f9972f8cd64 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,13 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_I2C_SLAVE_AHB_CLK				79
+#define SE_GCC_I2C_SLAVE_XO_CLK					80
+#define SE_GCC_GPLL1						81
+#define SE_GCC_TSCSS_AHB_CLK					82
+#define SE_GCC_TSCSS_CLK_SRC					83
+#define SE_GCC_TSCSS_CNTR_CLK					84
+#define SE_GCC_TSCSS_ETU_CLK					85
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +103,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

