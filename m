Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470596;
	b=zg/U+HtroVhPuTrcaD7VppgoXRlHkscueMdHIC75eQpn9N7wjIkFNl8Xn//REECAjTji
	 7RgJQYf8PWqIANcem0d6bqMThs723nCfn87PLukcxn2bB+8BTmepSBLmZ8cAzhPbFnEob
	 vkmgV/2tJcoHqUl+9FGfutML2EviDPxMiKkRqKZh1atDLcVZcxKE/6NBnlgsbN6nGyOiD
	 jTb3GmCwzwwl8tyvSLDRv6qyQpiWecacUVpk4D6HtR50eep90TI4a45ZQazY/j5gSMPU6
	 OMWNSQ+YTj2VQTcu6SCyg5Y8LmLIYAUr0iXKNmRi3cHFI57tebqEAfuUUxLUZV2zIYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
	b=LSbjU7lOcT+DA5KgMcTkDq9/WikK5CUABDOar1dPdRednWC5aTNbzEqWQS+l7cRCPejX
	 AeFcrOZgIJ3LjWTkd5u1iZdM75EayAwEJl6tocitFWoXcrjTgCR6GNn9b/VXpU0a7oOQa
	 RPcPsuedigEfn/jZ72bAqx9SjgCGXDVKC2aCDH9z8PBuQS0Rv/lmCg5hcwgxaoDX3LfLX
	 PNRhz0wIDvzT3nT82e18rOI9FsimE8b/0NVqt9YwRgbh4gwMkJEP3Q4E6w6RuL6OKLRfo
	 5CR81vQwhcTwWuGPqxYns/cubOjGblRQ2uKzyIVFMdBO7R9HwgZhI/rCHvVc2xgmDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CuusEMxk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXTQ6VwA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B3606A8AD
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213B3606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CuusEMxk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXTQ6VwA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7ofBW2819061
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=; b=CuusEMxksXfXgyIn
	WoPG2hxf7/JBQTeFx2ErNE2OXdZDIwHphHilagmUVI6TvF4z+erw1EbBOu2CxRsE
	Q5P1T6Op/69dDhss5SsjBXSMk68N1vXZRfBedF3A6wO9S2tHH5kYMs14cJsTUTGN
	yNNseM7E6jN8RmgsUWvxUfmIJhFKZb8nLe3mGAcyY7wsmmzdV4QMpaT7ZliR5RRw
	zhIRgTAzhFIe4ucbINfEKnlmugh6an8H494YR11uz/8Z7GM7UJtnxfUaKhl0OmFq
	dTxv9rTvILtKBynQpLsNMq5Wx63thd2NzZUJU65Hqlb4RY17faMQ/eBuaM6y0oWp
	LBS1zg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e181j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso3624056a91.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470594; x=1795075394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
        b=HXTQ6VwAStXGWEngsBtifzHRE12djrgYbeX4GBCWKRebb+slSAtXJmzRUkSzEQC3bV
         MOq1RsC4KSWcWHCk+6iIq9j1nrcH+rjYHNGzncYs1sGkIjB297APUhwzDjAO2Asahl13
         lJSZOrceAEMx7eKzMoPxFANib64+rxepq7oDq2kBUf7283PPXD/p1faFdP8U7vQXlmqp
         veNwwDOZP4rN234XuzJf6Pq/e/tvmT2+K8B9d66v2ByhU+ttkYYpeykdmqO0qPoTb0i4
         asAJ6MBt1+ewlQQO30gWIyWNg/OT/85yWiCUin/qy604VBaspihNvCCg8Vh8N/9l8lLp
         enhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470594; x=1795075394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
        b=J11Ex4k/KHvXXpYKX5vTrnUroO4GWiBD0eccylmV0QmKooS6ZSF0FNXkZNWEVIi5pr
         3i5LcP6/s2/WeW/szHhVykvIq0doPR8clSd3qolOxgrIbypoW9IT+x1Np5kCQIfjMzWV
         Dwcc0gzZfqaOHJQnjFJdaaEs6C5VqiqG/wmRBZTLDSwTm1AN0N8kDAdAfHbKKD9tOEiH
         VYixTP+WOAy+yNse5I4T8Rl9+eV7RrVjRqaqoqCI6ckcOB7m9I3hc47dF5YPCDYrnF2I
         87OwX43B/JbcYV0TSrEoljAMWU1ylKzr14w0GvTIXngI/oubJFrBJUjyETlk2Dvik3za
         q7HA==
X-Forwarded-Encrypted: i=1; AL+hErEFu2//MbLTdffEYWxHHuR/c7omU90Hw42sU9to3g+tydZzeZCiVwp0A6s1y/EitREj+rGGQx5/fJ0c@vger.kernel.org
X-Gm-Message-State: APuU4Z/cgRrY9zzMPrWK5+XAfo3fiGsTozg935zPiF+8bDGN4LJEeoV+
	3dzdiZSCCccxnclq3m87kcTkvZA013X6N/oyxqXi4pHnHp4SKpvtd6lqFPMSKhqLnxQbe7PZVc3
	PB2UTkaJGNUEhkj4jRzXtOQy9g4tlxXD3t7PjpXv7J9D+km+ILOPJauH1AnAGMFN4
X-Gm-Gg: AYBFou0x0mdNBM1UV4sUT+rTXpnR81Ybj6OgpY+6RWu0BaJfrugh+clVsgiXBUfDj1c
	FG+N1GhTKWkH+wu2Ah/5vyMfs0FhdmkmM4hcOB5kS7vhwEIZXSa1qwQet6Ti3eA5af1FseBkze5
	PyAIPb+YILDM3VP2rjjPckO3QTTYSEsB6fF3x4dabRz7lNoIWngC8K0nCeO+hEIRXTrHWRZRQZ6
	EALpdnugxpgHHat+WynOG98blIFpkRnk1yg0vDBoJq/mTxLKZDA0dkCV7MYsZxx/CTwUtKCUcEd
	RDm8REUS2EEg9gpLvu36rzfPka6jvCv7d2oag67Sa/FgEXNa4mV8HCFPrbG4Dz8nlZXlzK8E+jC
	mvrrv6gimfL7ai4MZ48uYo00s3Zpa1SmF7n84a5AYre8qwJokCRdaLQ4Vx9VCAs8R+XzWKge4Vr
	03ytbajbNi
X-Received: by 2002:a17:90b:1fcc:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b182eec07amr4432269a91.30.1794470594098;
        Thu, 12 Nov 2026 00:03:14 -0800 (PST)
X-Received: by 2002:a17:90b:1fcc:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b182eec07amr4432241a91.30.1794470593636;
        Thu, 12 Nov 2026 00:03:13 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:13 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:52 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded
 board
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
Message-Id: <20261112-nord-soccp-dt-v4-3-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX8Ny2RJFoBwIr
 v/tNxMB//h+AwTF/6eBa/eTIjvtXVfcw+fYwFW64gFGL8qL++mHq6WAQ50W8++/vnL0/93SM7En
 AJ2QYXjw9UYEeb2XOa1NN0EeWtKHiopZ8nTxSgiCds3/ZSlgS43keyqJxat0nYqKbFy3QrOPGyL
 tx3glck0iBVq6toZuu9pHAZ+T67AV2FhoecWYeET5Rmmd2aRLr9iCu86ixoCTaD5hUw+p5N58YA
 NjEwi5b0LxNMjCEe3nDR5J0qrcD/cZbcLxZ6lhLpJl36pQ1Iwh+t45mxAU9+aYjPg92Qbxi/CfQ
 aoinoo0UFwQhdkSfa6Ws6K1nfXTwBBFJyzJ2FsSiV8DprTGvzNk2yoltCi8g7kZlA5C/od/kYzs
 mEf59edeEQRUR50QBJSYknAeBEPSVzBbWsDc9OhpxuCKnaqUuwOljN5OnWY9cHFDzCo4B1Buw46
 sWKKk6IC6G44mPRT5WA==
X-Proofpoint-GUID: ddxQDi66TrvjNz2P1yxzDZyr5rX3HwVV
X-Proofpoint-ORIG-GUID: ddxQDi66TrvjNz2P1yxzDZyr5rX3HwVV
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af572c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX5Y09NaKhrjHA
 ert7FVEoyyai7g6TqGBZ/WHeVxnotqUlaXHiiqd+VcGMKXpzk6uSbBWp8bWFJplZywf2qS4Blwy
 79C6PB/bxsHKBddprlZC3wdfrtJu55A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

