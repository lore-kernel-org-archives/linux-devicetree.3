Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612885;
	b=YlM0xuLHEgpyNb/QZL32LDIWMXiXi38CHD9tRhSKNL/jRo8VeV5/eWMn8JJVW1iCzyMA
	 dbJ+BAEZ8zfd6KEHfQq216dgV4qqBU4SNMVtC7vUXUmeNhBq5j1LDM8KDLbWS0tAl5r2h
	 uURwpLnwwx/Goym9fRX1xDYXpyulweMSdvNUllTwkm0qNHkFXuXRzWT21B3aI7ETds2NP
	 zCh6P3kKtNP9fFBYp3cyGvageX19us0a+HsYe/cSB/gTtoSKY5ybiEN1QWzwnk77kqSqf
	 UMVqkYoPuI6gvohQRZhr7QNbVQNCN4DnpGJrvyihdO6Gb2uf9KEVwKEjXBlie7jZBgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=MHD4OfPfgHJxY5XwZluqIxCjgLnZbUcuOdV6H+SGu49vXenOGOsXmMUbE2NaVxrB3Le2
	 zOkQygx6odLpWOYwkFunJtjYP5lou46X/8nJkTQMO2GWm6H1LPZEM488fBWECuZvG44av
	 BffbbPppBKMW176y0s3OHH5t94HoiFhT8DugrpPDcup/VvAXWvvNId0LxKp1BXtg7+NFB
	 bh+7u/pHiT0AHcH+qKpTShT7b6wzy7dk8nJmhz9dyPpJ4u57loZ2VOC/ENOyEwRORpMEe
	 j8KYefsCxPvcEz+3FHjE/UPAZNRYzk3HB3R55GTlIn/fLn21MEM3WRdDxXRxVSYW6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHgVmN9+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772760A2604
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5772760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHgVmN9+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6f63403333
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=EGRk0PUwlYLATkc6
	inuDWGTCv+5a7aJVbA4ChuyMdjE/YZYmbLyR6AE5kDMoE9BOj/Bw8UzdIpfR88EK
	iH1A4N5ZRWPTO1lgS559yHa/F40mAQiI/mJV0wTVQZRSVT/EgQ0XCepjm2pVC4PH
	gUhiN3hw9SDr3udADTbD2yqtc3jilFY0K0EW4rjPyPwzvXTpZnuUsGxCfZd8sgBd
	f9u4/yoNRwvmxnkn81tqokqBrtjtDdT1djJHIo3faDQle598G1apcTxHfaYCURUQ
	9PVk2szIsp1sJVkDkbMPS88R6oSfplZhAaibVnp6uBFM6Xvk3LTZCCLuNMLXPoTD
	DGoUYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8gfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:48:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso196543a91.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612884; x=1794217684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=AHgVmN9+Q4WjWhDE1vNCwLFIDJabGLqJp+/MiQlPQDnM3SlffQDI8Tm/NXURBFCwHh
         vgoSR8h5bmHkJxKnhQlgyCEr2NAvmeUgzZHIJWJhj6U1W8Agh55bW2cUyq1cL+7lRgUh
         5lEdRI9/AZF4Tzu4+aZTuRAAq6pmm5R+UhrS8hwJDHSltmvc5UgjrekgHrTvgMxIwaFa
         35kTPF9ggK9lxLXLmbmQWpqRD9A9/CLwNY4XhNGv92pbklTZbhu4xpqG0WGG/dU4VJq9
         1j9YpeNaEnnqlt1MQDSVwhQiMt32fcBu0LJbT0j+QyJ3I95jFqJgeCa2ASxSE0yuARzs
         pu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612884; x=1794217684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=d7MACNTNNyCiQ08/q3K8O4ntMD6qSqYAj33gbXM1l1C32p/322zE7Wi7TGlZDIc4NA
         MP5pSnH6aZHg+s9WuFOV4er0+uPd37xEjuLuEj2bNbiRUWlIRm3JPc4q5ADOlBqHJ1yG
         NRHIbVgHl9QjFvuf6sQOqiS7umeT4B9RQGhbH6/oNvBcA/GdFiled9abyBsPhp+TpMj7
         FkgWWHd/YQxj8kyOi1/bTNzetJRKhYcVRSiv3JShaDanokqR8z/5Bni8EhL3wjseoFEF
         zAs8ZmGFVGCvTrlmeF/l2hvXW9QznLUynkkD09eG7JZf62Xwwey1FFOn8TvW0d4bwmNo
         9nLA==
X-Forwarded-Encrypted: i=1; AKwUvBwr8P8imFPnO1vz6dqhICTGsMPJV4B4iMbiUXS7JNtc9/k/YkhfBAmDHzAYzUcC8RZnaIFFPwPGi2kS@vger.kernel.org
X-Gm-Message-State: APuU4Z916JNPp6L93lvL4OoiWpI0RvQ/VewoK6LMPw3R4Idn0s5I25bA
	JXExoRcVBYo/gPOlrcGq/zlkzqB/WzbHqbcQXTAZClYyILWLE3bt+BWDWsSc7x+f2WGCb6zvt0W
	7H91AT/DYanwGbJC7qjuVBkezFXV4b1BGy2rFBKgH6Ydy1+YrCukY+jBeyO1KfMUK
X-Gm-Gg: AYBFou2eLhtamXiRNRhC17QftAnwFIajXBuURahiepXUfkSxFXbu8eSBfM0Luk3Cbhg
	sGSCIjvx39+5eRAb7n/39gAZHDTJR9q+yndpOq4qL/2UuXCfD5WBHQIRCxB6jWDseZ7+sGqgKUe
	A4yFQxUCumjGEeEpefYJ4x3d0PTeyD4gnan7g1kgsOiOcuJrkHL4eoBJhOYnxtU9c3UBZdbyCCm
	H/m0WQSJGKJKRp3Tju+kL4XsdPUKJyzK/uZEPpK03MmlmAi04t7mHYLmiLO5guwbGTXeAXTty1N
	jeSh05B+O1BD2ubJF16P13mU+hJmjSBMA7EPpgMymjWLLfUpKOqZydCn52dpbDUJFus0Oflcn4s
	cthTmVu7mCtQrJ92iVVJL+iDdtafqONsLchSohP2bLV9rBIDu498HRZzmFmPoob22nZNYF+NLdM
	CcE0zpqWpKxR/9r4xOQuDYO3zraAJ7TyHiF44=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382313a91.26.1793612884087;
        Mon, 02 Nov 2026 01:48:04 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382305a91.26.1793612883592;
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:36 +0800
Subject: [PATCH v21 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-8-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612831; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=YVXq7+0T5BuSCdV213rRQvJ4+GN2bAvUYub9zWuGive23qGSHFZbkQDtYyZzBpQgtwIIHF/Td
 +35EmNPqL5PApKkGK0WqAbW5yI7cW0wAAWzpo5mZfP4G68dKcWDZtIX
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae85c54 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+mvzi0FpL0ZU
 OFARPNNtaajB/Wi8gFMQmK9esiUO8p9KruuPhcszqdeFUbh6IzUBQj9gs6q4gW4cAakTe2VrHUw
 F1wjlxjMtnJk6kqVY7ACaGQ3ejxKJOZZCkHGziA9dXlvgl2FPHE4Bh28CbkxVUsSLeNUNTToM5w
 ZoYxjSOajmhHQDIUTPenRfstUPFsJBbo+10ugk3GH3/q2ISHVyEZpHTv5YODOcxTT7/hALwZJ8m
 RjZXFVvmBWXc2ZSw3IGafBSzBj6pAqcTJ3xjKw/0KjcfISUlfoBUXBfqETdaTY6QTxZqNcBlvLZ
 76O5V00+Ia4mLS/Ym/UaL45YgSarmiouEoUF++7MewP2khdqGW//ZDHqoLZl0ZXIkP9yxCt0Gzf
 hW3nfliAMXO0ytNTfrifCsflSKKRZhW1papPdGXXMa3haX2FFUbETRMrN+L98ugnoqxJ7rQn8qd
 8xOmX+e2TKISeIDpfdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxF0ZxeJ45NtX
 o/dBo3F/ibcrqgrcd/6n5cVxaiVH41JY/bEoECl6lF7GbxoPXJRSzObqNEGXp8BH1ptDCUPVdfs
 NDS/fr7gmCQ3ldUXvJH69FGmaxdURv8=
X-Proofpoint-ORIG-GUID: 3_iYjuEZ1aquzm9c1Lo3Q9T8fTxIDGBX
X-Proofpoint-GUID: 3_iYjuEZ1aquzm9c1Lo3Q9T8fTxIDGBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

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

