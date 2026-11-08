Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143972;
	b=bZ28vtv7tqenSrfDSVFC1Q3F2V15qxHHb1/uGGF3GV5k5veXSc52tuHlRsA8ojrePBw+
	 zmQEbzHS64TAC4CndYtxp+9sbKTgEwA5aMLF6xn73+Y79e8eAddbw2iYnlRRhHcbtHR38
	 y91tHT05qFP4ezDv6rFw7LdSta8eTuCCZh0ETyMI1ZzJbi4qSFDw9KQQYUxSyAVE1MkUv
	 Y86muqDSbVjWVfvMiVb0Z0RGpaScQ3yGSgvS4XYrwdxMSq67JtH+cH0Dr8ZnuFnnpwuzV
	 xN4RO7fIreks+U/ZyyKkkcQfi2mtX6HZkhcc1pndbyJt1IGtWrcieBABV+9gIhfCzXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
	b=vGJmJ1foJu3N4ZVQhCk6/SPGAeQ7kHRRl4FEKGBhuONyHiNqlI6Ai3NS4m11154sHzHX
	 srD0Sq5qgl08nKhDK3VmvfOB6/R5o7oRA7LSt0/gJlAYmiq84l/pr9MC8AWm81Q60lnJ5
	 O4rHN3SBjbYAtV1jarZREXTrV45ctgq4sxgjJujRJTUha+y52wYOZ9dwv+lgV5a44jhv7
	 kYbkNJGN1drO8Zj/7oDPZTFdMDjJ856kT2amJzRaMfQyTJop2aV+IP/D5yMkYFThCeyzK
	 aQaPpCDlWkYdRy8B56A7+qMe0pI94X8/6uRcbZeJCVlCvmcFoC/m9eXCqFENeXvY9Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lp8FAaoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lu8D+tRO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9E606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC9E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lp8FAaoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lu8D+tRO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AmFHc1872498
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=; b=lp8FAaoB9SkKnlU5
	6b9lscm66V7JtydxZcsJ67meybrZr6iDzXdbllf8cV6231qrNwTK6+WqrLQHb7Y+
	EnHh/+4lnMxSwSU+VBWena8DRvxNAdRM8/+KrMWqIu+RZXz7RprmpRcF/vV5/4WD
	pMps3aAMxhRboDy1xj/fgLuWgEeJstqgzUiKUQKzJpCZaUNj46PfUTq/rxXIXlA6
	7dXA08BLlIE0O1R2hbFn7a7kZjn4PIuUpYs4Uzfsl1OHCoRoP+k+iU8bUuyvpOH5
	iuHF5IRucm871I8wL0C9oCNc1gfa5Xd8OUMxOzkAX3Hw4hvcK8dqPsMTEl1/xmfN
	+Ulh6A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06u439-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:19:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so513677c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143969; x=1794748769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
        b=Lu8D+tROfMQGOAA3pMZ+EZ1tBV41vijXM/ETrvZOn04mnnzr8HAxTyhq2lW9gxsUgX
         EUCeulMRzofnc9eJdfTFtMKTIPJz87sgQz58jFD7YjQxhPHmSGoj2BU48iTrRYuI+1rx
         quiCXPbWALKJCjasMu01GRQLqgznpFfZD2W0oo5SxGwWwQUtuZH8wF3CDCcy2zWGIMz7
         nQtXEAxH95Z30XQoVvjujyjxZtF2pezlf9gBfmXCPvb/cSe4fXBLHdJwwPBRQPemjHlL
         rvWKfCiPX/By6Tg42gIiAacg7Ket92nFzha2NtNiTfN3CSAPLddNjMZv1B8uh8E4GqEm
         CC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143969; x=1794748769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
        b=pnAZTYj9MqoLY6pgWaKhYk0LRPxNAUyyXns83ww5YGb7F69QWjUGgw005po7AbNhey
         mJeqRwr6x3oUKU+ydFTUDHWHiBbbJ9ymWXkP53Q16hsUUx+OhJHIRBz0bSsSYSqX5YE3
         9me7z5Pt/smVKuXpO4bWl1AAPs0pPtfFLKwVOAO7TxtZvlQZBp7Ay+7njuR/1y40vglZ
         NpCFMPHBzyHcdvJjOVSYz8NnrFEGEkJR2PTuqYIZNXfiauoWmBvKGJXYa15/dOM8SICd
         gFfY7ItVZH5foIH9tVyF0BvNs49H1bC34ceUR4+SWPjKqwakgou65OfBivV78+Jx1kBa
         NGVg==
X-Forwarded-Encrypted: i=1; AL+hErHaldbl+z/MaA4Wqzsl3L/asP5BV+EheFH/tpQFomCELVJZ1ngYNix6wq81Ss7eDa3maJvgwe7RJLUH@vger.kernel.org
X-Gm-Message-State: APuU4Z/Algyn9X9K1iTy2QKxhD5sBM9xWW87xHPTkMertNBL6NKntrOL
	5AeKIbWtrPZm0+u0W74P+ofhEibJizAe6MYV1IMRWrKHJBNmMuGCavw+pgns2hP8RBnVUblN1Id
	mcj0apsPqcZatqsk4YLeZpY6TKugoBlwkJPQumvsGUPDs3KE87pCSY6DLWmz9nRKT
X-Gm-Gg: AYBFou0ZCRB5OAgMQvTesD6uB5GjhpguqmikVWiQDB89lC+Z6Sm1/whOAgfk6SDjRQQ
	qryRz8HcjPg6GZMz85AP3nCkoex0pJPGKLQ4hzn9dKPPqSW5JZorSBBNV7N1GHFWEkHYBbaHnNH
	Wf7S3W00fp36HCiiwxCV6G+yl6GUZRIfGsbs7+N9ahiw28jmxrdUU0gA+Tbc8J4ed817tSl+e4z
	rJicdHQIj6eAUbeqLHjcZEIBmBAO8lIj7HpHDxn8Zg0heuDcZzLAHVwrIQq4AOpZfsfrO72s++Y
	CXs3MAGpZhE2Am1EJP0tLHNOXPYLNolmJeaUCf4tj5PyIJ0KhfkvN3qA5CGaVB9RVwiWE4gcCFy
	5T61K/Qh3TafKCOXicKZyA1IS/8jhcEHcSNZVETVgbYJ0DPdTvoHyWq52Znm9QykUkWhJDBO7jU
	vkVUg=
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr1867713c88.10.1794143969460;
        Sun, 08 Nov 2026 05:19:29 -0800 (PST)
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr1867689c88.10.1794143968780;
        Sun, 08 Nov 2026 05:19:28 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:28 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:30 +0530
Subject: [PATCH v2 09/10] arm64: dts: qcom: shikra: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-9-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX7PU5f110Qb5F
 K2EQwFpUJU1N4bBi6E5NRrgAJO/cPCBNBC69NJ1dltKYjRAJbOd0ZoCg4LSvLd2lSP8dyZ2nyOo
 dyceLT/UJzlGi3suhExatWk4GrDfl9GK3gGHxfSp/WW79onUkBkmrFmxvV+0YDdffaEJhMW/h8J
 KSvX3ucFbfFiGet0zTiADCw903BkmKU3rfNTONMrK7ixp3Jji6HagMtGhgTFpBWeL43/v0hnah7
 tkQz6rQWv3L1mBMaZGRfk1T5g3GXHQXFYrUPicmwNHbLRG2EyLZPGQCoB3SwOYnj67338aYxHee
 AYxmevaWdjR826m4fxopzgd4RX40gp9dCzmu90sSiBQt/lO1H7t5hc6Qi2Tqq00QV8PvZoAAHnT
 W0bX/sA5zBNElAKVXO4dUkB5wIiGbEwBjw7ElZCaGjx67/JFpqhYTtXIOB7QhVSb7UEL6UJYjmP
 tEoCg+lWTwkGuhZfNRg==
X-Proofpoint-GUID: BtHOAU8QXbu47IRx7XBsyu-hgeGzMt5d
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6af076e2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gfsEk818mMD8xhq9cSEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: BtHOAU8QXbu47IRx7XBsyu-hgeGzMt5d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX7uNm2VKSiLXe
 gpoLSFjevR63xVCaB7o/WigqjvCe0ANK5ggoB7Rlqb49B0M3aX+aPttE2pQ2Gn2BPSTrEBuMKid
 dR2vEBN78G8KGGvhw3atuJexhRb0ezs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Shikra
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..09aabbf447e0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2481,6 +2481,18 @@ compute-cb@6 {
 			};
 		};
 
+		ptp@4b00000 {
+			compatible = "qcom,shikra-tscss", "qcom,nord-tscss";
+			reg = <0x0 0x04b00000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_CNTR_CLK>;
+			assigned-clock-rates = <250000000>;
+		};
+
 		usb_2: usb@4c00000 {
 			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x04c00000 0x0 0xfc100>;

-- 
2.34.1

