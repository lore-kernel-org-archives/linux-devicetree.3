Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89909355803
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136468; cv=none; b=OTx2OV6To25gd/vbkwOgkmtILt+BDjd7DnjEC3a6ttKGtAsIQDx215TSvut/pkW8m2l2j52vU+6PegWV2RODwwDKRqAzhSi9tdpG34d4G/bYXqj4+dx2yYXt+A6eNOSVILhAD/sQLHBPLdXK4oxcGMs2JUq5bXQ8zxZYWNz1pd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136468; c=relaxed/simple;
	bh=BOTzSHBVyhqvDjlvFvqw3Zdmu5/vzVG84AmyMcCiDf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXsHH0B24sRjvUKKQnehpjlTSJPxkOMPKHTETQTd6jSm9HGxIc7fvTI0WknKZ6e3hWFRIdcUkqBn4X7+bjljnP0XPLKGaql9n4zQ4D13bfeYyVUgYi1FKlk6PYKv4Fer2UbeMc3QmzNVZ2K6KeDO9OkdKQ/kpifJdBUf0MSL+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPxXoWol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9nl9wWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPxXoWol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9nl9wWE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiYB23473503
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNrBsY1KmFV
	0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=; b=JPxXoWolDJxs5jyDVEg20nWOLXh
	95ScjEYo3ZMRUmcpLiLJfQ4oKJbF9ZIStjLTpqK55LDRDvaOgUVAlP+TL/1Y6EF0
	U8Qb72aXVb84P8hBFsiPqV5rM8YcnOLSHCayfIW8VjY3SyIWF/bRQPVwLxKrmjlI
	bm5XKb828E770rf4iad9zb6Je1SaGp51HL4ncuDXltgOxjHTtI9vX4AmfH7KW0ND
	kzKYDVIkFaVkvcZFpdOLWi0D3WSTCCFSY5Nvdwk39+VYnO7aJMcjuGHeiINptJ5f
	4e0oC9r/yC5MhZYFsyAS4RkXBUCgjqTOPFk2u2vYy8V3wFNie0CeLxI17Jw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729k25f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:06 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-881a45f96bbso13173787b3.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136466; x=1789741266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNrBsY1KmFV0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=;
        b=B9nl9wWEsD9bqF+MY0wEGbUY45EY+pGh7ju/WAkJEHUwxn7jsDekaQTwxsdwJEH3q6
         Hue530bnp4NZM7sUj0Y6H5LReAt1gWKRMWVkE7PcgXFMa37Qhb7nzDLbsu/zWNr8+zVb
         Kl1ZWTw/0JUv+5HOUZwvFDmVf9oh+yw5hmwBHJORkCKM2L9oGeKic44vPCE5hFN3qQKi
         UcA1XS1QfIR6sRjCTtox37/Vj9/W925WJbu1AEd/TrGZpdDMk10naBSpTrXidqsMLcuk
         lWAXZyYhM3YjlOS7SqCNEO2SO9H4fyycOFDhj6NLhrNskLeaSdJSujBi0JzGOtxy5T7G
         lW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136466; x=1789741266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNrBsY1KmFV0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=;
        b=e71T3f17QVb+D86Xt60hsSCPM2UgAcyBxspHBlLZHfHCQKZ2ftruzkFA6IYJGILRjx
         EY7+6CY2Lma/lrpO73kRL5yrGhySy25BkuEWNcH6PG36b94icLbi1F0g4UOoRLRIiDDD
         MfOo0fC611g3dT98qsT9XqQDznu25qaAFRVCLL0oxKNoVQtLFi0EEFsZurgVjFIXo68A
         IUYvU5PS44iDr4bDej0rL7dFfgaVniX7ZCjH6YweGbQ6hrv9w2WqSOWk4BzL5kIHXyf3
         qqXBG3N3d5BR9nNL5aWEWqyRLhD5Dj+2RwngnrObFGm1sbVgycdIyM1bIBEjkVs1Gp53
         qkhg==
X-Forwarded-Encrypted: i=1; AKwUvBx9H22sR4qRJsQT4lnfvHaAOguSgbPUScKkHkRAkg+bOPiz8NVltzveNR1nPmeK1DRxRNs31ymbo2fJ@vger.kernel.org
X-Gm-Message-State: AFuF++nptZLRa+0DfvR16DKd7iCr+nynQd4Bfr8tVS5P3MhtJfmJddqC
	pu54SffcTLJg1ILO6UTspa5uPATvqKnZYnLfsOs/nUOyB8ZBvQqeasOUZdzuKFHB17qYB4ZFONa
	dSrgrmQ/YQRuwEeUvenrt8aT8Tdwo7e6fcPY3giIOSo/HQb61gHmvS4pvkZan8BFa
X-Gm-Gg: AYBFou1LCOz2PaPY6lyro97KoUU5gDcRcFztoaWBdKgXTXCDn/Xgu0nH73f8jclJFz9
	g8y1/b8IWGzzqurnSORrq7Tv0E3mHE9Al0UvqdWJeBnEXvaIv9ldqCxTvSGQZ3Qb7XKvY+dtczS
	bewDYj3urk2nKacsx2RcKeIo9Hhc5zczS0chlNkcs4lv2PVDxl7uDCPFFm6SI5fm7pBwwb0MPzG
	MjtarECa9dz71JG1DX749jyeSU0mThQ1PSgDuQzf/YHVxEMMAyreemW+XrUrsc/uC/7RtgECTdQ
	HAWUlHfky/e7fXso55F9t5Tj/1QuSFrFLmRBKChz+ZmBcc+Bs4nhCslxZmWH3aWXq2bBJjmqK0l
	uF1Gc5Lkpu3ELzIRgmkQ49hF+OTkwTPhmKiwo9Ufn5JpZYAl/5R+uo0xzHAWN
X-Received: by 2002:a05:690c:3489:b0:885:28f5:66b8 with SMTP id 00721157ae682-88528f56fd9mr7614707b3.60.1789136465672;
        Fri, 11 Sep 2026 07:21:05 -0700 (PDT)
X-Received: by 2002:a05:690c:3489:b0:885:28f5:66b8 with SMTP id 00721157ae682-88528f56fd9mr7614477b3.60.1789136465135;
        Fri, 11 Sep 2026 07:21:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin functions
Date: Fri, 11 Sep 2026 22:20:36 +0800
Message-ID: <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXxwrbXH59lGha
 GoFP69Xtdoin/7tC4Rfp8lNN+e3SDWn/LKUfOOw2gQGiNgYEu1zDU5tFRXs6P4UwfuWBnjmW30j
 m0GOu7hazvbztKG/iCNBerin+D5iEjs=
X-Proofpoint-GUID: JCv8ms232u180-eA5nPwFdQrw3gqpK34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXwRlKVNWpdVPL
 ixHDE2ASlF6d5lhhjYA5GnlU8XU+XOhXXDmMHdh+9IN9oyaU7tEm5gbhHKcQ2UXzc+1Lkuu0O4d
 yxMeN2IE/v60jA/7xGqH/cNTZ5e0WpNO/HqCDoH0E6muEDNWpAEmnsdVlaLrCY/CDzdM8Djxjr4
 4Obb0+EJSaG3J5VeU/pKYU0eB91tqR8uxtwajhRSIJ/+RQSfLfBKY+T+DE/FPz2UjaVHDI6+q0y
 81hD2MOqMSXybzak6JDsvui0la1FMHgV5AHl5AmqbT00Ilj+hLpLjHTik4vIvi+Z8WR8/TDiihY
 xMBNUKEJayXREkWdUYxLvY1mcjYek9ju6ek0yo9UpzrrZhLUkW1Osm29jVd8BVO4LyCz2D9V/Ff
 DrEBCCu4a1+4t661yCgYPWi6rLjds0z638eHJlwUZVSnzXe2qM5mYCSir5Nujen8wd69+Ra87sM
 2LIgBM6SANbH2gTiz7w==
X-Proofpoint-ORIG-GUID: JCv8ms232u180-eA5nPwFdQrw3gqpK34
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa40e52 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=asaw0DWA8FDCBGCi_ycA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
indistinguishable from the UART ones and ended up muxing the UART lanes.
i2c9 and i2c10 therefore did not work.

Now that the TLMM driver names each lane pair separately, select the
lane 0/1 function for I2C and the lane 2/3 function for UART.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index a03ee16c9cff..c7ac2e66632e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1056,14 +1056,14 @@ qup_i2c8_default: qup-i2c8-default-state {
 
 	qup_i2c9_default: qup-i2c9-default-state {
 		pins = "gpio127", "gpio128";
-		function = "qup1_se2";
+		function = "qup1_se2_01";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
 	qup_i2c10_default: qup-i2c10-default-state {
 		pins = "gpio129", "gpio130";
-		function = "qup1_se3";
+		function = "qup1_se3_01";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
@@ -1461,14 +1461,14 @@ qup_uart8_default: qup-uart8-default-state {
 
 	qup_uart9_default: qup-uart9-default-state {
 		pins = "gpio127", "gpio128";
-		function = "qup1_se2";
+		function = "qup1_se2_23";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
 	qup_uart10_default: qup-uart10-default-state {
 		pins = "gpio129", "gpio130";
-		function = "qup1_se3";
+		function = "qup1_se3_23";
 		drive-strength = <2>;
 		bias-disable;
 	};
-- 
2.43.0

