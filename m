Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145319;
	b=ADTNaJxUGUWFRi4IkGpKg3rK+FkHNLc4luPPAeOmp1K8Kgp7AtC3a1lYDpaiUOkVZt68
	 KLWX9a1r1y7FkmdSSHZMfX/GcYkcvYSaZEzvRHwJgKcTChj9gP/7wIZwXk8lZqH23gU8S
	 vswjRnZU5XMsPgYkPZkI679zw/0KT2vQuOCRpB911TOIHSZgpu3lZzbfDsUr3NWhtmzvx
	 Jo9Qhx3KUJ4/vpkyxbrhENhkuJqfJ6g11kQ2EGrWAdf9Kj0NMrw95StKDylfig2fAp9LD
	 0AXK+R+WHz49aKPtFAmlpAwk5UGQz0j98FxynsCe4z31Orkx2WikSDJk8pzrf0rVeZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=wQNSP4W5nusPZHgdOmTCvLQ6UnX9yT7PtsJwEzjtv9FpkDSorqPGm8AArHhUZ1BUXud6
	 7o4MNm2BTjiMzHHsCtT6nddCQ9jgRLBozxr79H/aTuU/NJLY93J4ds1x07eWeRLxA8hkj
	 RhrJh6KzANOC1wq4X6TWKZGxpCY1BhizyiriXbn5KDrgjh8EzQfg+1xEkKnN0+L38efqr
	 8ZnAX6rf4sc4si46F91FBL2vTpTVL6gRY17dOgLpkOPckNyHGvhzh3q9XNWDHSD0YLGXK
	 BF7jwCK3jhBTlfxc1/axftga25eTPw1mi9tFkfnGT3i9anAn2yvpFO78iEXkuY6MPdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeS22c5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6560A2609
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F6560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeS22c5y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GDFN3825932
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=GDeISYqxhLpiI6ZT
	/h4DSsdKrFb1/tGHg0KZEKVBTogTGlp5Y9yFstQKcw7FV70qzlJflik0NpvQpb+w
	2myyabskudEXvvVQZ+3lZmbctOif+sFbr+m/QHoT3YZM8oafKTc0BIPzGSfcF/wK
	bN8MpisJsvqUlllFjs7gp39eeawYaRtydA0EcPhm84CYCcbJS1YrdhQ5DFE+kzPr
	LKiZKyui0dbacYuSCzVjqdgyLoHw3hn7tZbldtYHILiUFPCddLKN4olbLB5YEuPV
	TNdpcZWHBFzNFtAPOMNE8T2tPlIfjUDEir31HGNON+dQ1p22qztJTeu/XcaogiD6
	JOsb+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx6c1hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so904101a91.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145317; x=1795750117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=TeS22c5yjgARcQcnfqvwlRNBPd7s2Gjr3JwrVSp06wtiCR2mBNIks49DInf4wO9FvH
         nBlrJyZrJ8yPZytRshFhqZ+cu/2R8DxDBntmZP6qDygFA+Tr54iLBComfUpMWW4TYGEM
         zZ7Q4JWkXoeQ0t7NNQ04JBr2/xuR++5dZXyu52SYtF6neFlep9CW5ln8ISwxdJShhV5R
         MWwX70JRaCpvOmPGGIfFRRRglO8WsYogt1H0jYzPLOXvoOgMwO7P8013bvvgNhIQImu1
         aQTnfxeEQ24F0v0+pYRe2prW9j0p4onVF5t+3ihpxfjEfQso+GuQ/zcl+h080Xm0hyjQ
         BwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145317; x=1795750117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=Khyex6+Fd9wQmvF05jDAkXtQD+2g1QL31VednSdJb1ItolWaopLyBcPBAjOp2BuhJA
         FRoSk/0k72HoqNy4r4E88T0vx0CWdsjHzt8X0EBo2SPq/ndz3lewPDmlUYVtRYTl7yHP
         3MKNh5c5/0LA8gE90dGipMo3HHNlxWccQKJrpGSqZUGCB72LcpFlkzokrvwLm0rJ99Aq
         2lwAJTzA+KC1KLP9/go6I19PPvdWQljQtiRNzTMZ2SKGKX8oaizhqBeYFfG8I8VAG48N
         OjNnNL2FyW4QH6ShcIyWRVTye1ZK4ps6W/HtbAwDZ/Ctwh02NSgMRiYemiOSof1rKpKH
         Uz1w==
X-Forwarded-Encrypted: i=1; AL+hErGyzM7TCD2ZzS7uqx+FRciwxM8Q33ryvWOS0IAmGwkuYcGQydhGA9z65gOw/hOSXfC39UCD8uSLEC4Z@vger.kernel.org
X-Gm-Message-State: APuU4Z99mfEIEAh1ZM3EotorQO4lVpEPh1/xA/5el2YPcIdsQkuniogJ
	Ec4pO/QDdg9OjwEuUK6RjWQiBRKi3b+s+AtEXh0iDBLh5x1OkoXZFNVwl/DHVLH7R3lnc2puNgf
	m2kHydSRed9e0lHiVWSXQ8CnNiHgnv9Uue8GFSPrPj+q4vwE3ElKkDdBalynVOtLA
X-Gm-Gg: AZFdTZdpS6KckVUZ675M2aLgvUZmjfdPDKdNMsKhKO/A72pjkOJ8uUoLFKpEgSWIrPP
	eKNZBI5cUBpyWS8Z8SAXGiODSuFp6WTssUmdEMn0p8hn9LfNDocU1DVweT24XTbhAAtoVQgjx97
	d0wjteH8nHD5x3VZL1NK7sW2YJ2PyoR1wTDR3gqF7gjmeU+12d/aAyk06eDfX/T2POlhi9uv25x
	NMQXcuQNGMSSjohrAT1R5/uTq9xEtglouE0SktodQAJ1oVSq6nLfcOJ774/2J4nnvhOPJqxrEZl
	Dpxz+GZzwuZHBXLl3mlaA5n/qaWvdDfwyGaIP+ph6tVb7vTWBP4BeLuKzqXO4hCjvmLaYsw9314
	3A5Ys6j/ogZwtON09oy2WIi/2uV4nVTacJF7vVsaTvrS4nhOfn2Ki78gqXMT292YEICIlh0AiBP
	JTfQ2qXvPH0i2ogbFFgQp20Jf3IQZ2V/tZD+A=
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408371a91.19.1795145317159;
        Thu, 19 Nov 2026 19:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408334a91.19.1795145316683;
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:27 +0800
Subject: [PATCH v24 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-8-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=u/eNLPiVv6GIj/TZvX/nOtN65AZ7hldBM0ZBlHkuJ1IXZjkOses6gu/4+KMJnP0y8AMu8IKWV
 ZuDjkVOffhjB6SFchqtyVHPdp4eVjrvGCoWJMfiwPCAs1uKEM8zh1ZO
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: TKu6UDWfWz8JcPz7l-6QtRxlg-ADBfi2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX+PfTLhA1pbji
 GOjFAwQmO9aG7ecxa8QSK5k0pmyOWO/frVkdW/9hBMOYcsH7fXGRVOAabEYOdFEY4ngnNRv/6a8
 g9ttjJVew8PDKIK/fITBWgYnr7yl9p0=
X-Proofpoint-ORIG-GUID: TKu6UDWfWz8JcPz7l-6QtRxlg-ADBfi2
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6affbe65 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXwr9Rn1A49sOZ
 vmFoG8DqKHXzPIwMwuKra9UcZoLqLMYhHJ7no71MhnpcwCQ52pXtTU/OckdEL02ARcLu+TEYyVP
 aht0KF762EL/kZS4nYhPNZH5p/wIOoGzJZpuC3FbjIEYHFjqhC3QEqnHRS/DtRunBkGsvWHVHOP
 taBV4tuOiXFXoJR+Fu4Q/Fj/s3oYiUFcjmVZutFZ/gQDVft2P/71Ga5+eoUxOA/sQdF6p8qC3bW
 omdM8JAc6lJ40gqSRoWCIs8/W3MEtdNecOiJOr3+Yv2iBxlj0Grx3viSFEnWE566cfZY5Pk69rK
 H9+ISSqoOZqRodA3UD1yEwU+3RnDIlQFPvTs49i/4n+V4qP2LZfKG8dausrHBT3kJNnWIyCwI+5
 FOkzijBn8Ghf8dyLAi6CO8O9FYkNJZfVpaJijdWPXc5RPmojC7xhQGAnkn8aoQHrhDw3LXkoHjV
 ooovYLZ6YR9WNi6Mn9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

