Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143965;
	b=DtmBQGfwfa39CEN0z3b3KOda1izG2yHWhCMPm+l+vTJ+Vp2r4ZzOoKwY0ss1aJqDxqQ9
	 VJiLKkvQkfrGm+tUFjUMdoDepSP8TDcErc46xY0xyzlDV1nE+N9zyvdTeW9h/qjF0Jf/U
	 McTXnDjydEPQv8h7HUj9YciVrqbwVwlp6j7vDYmPlLx+70RlKl/gohayCIjADUqmMh405
	 mlZATSR7I6jZSv8xsZFIaXX4SqmNz3XhRY8+z2HJnQ5LLHC4nknOf9UiRbJka2qnTbvFl
	 5azNObmFvraUachpSgVfIKTwsbj05X07YjMnjVJh5uNhbh0kXZi/D2hZhKjtaLS6+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
	b=A5iqM7yjRISJ6hgPtL5CXSVJvWaZuX7AAMO0pnTAlP3/xDOsE6k1kPKEAcesyfz2CKb/
	 0rnvF3quME36lR40zbnABAv35FNmZOOXY1M6eCGN8zy1+xIXRpoIvQZlGugeD1RidAV/G
	 cToWEhaNWCp+N78X1xpo6WMvdiyVlzMuNnl3uDk8qeEb8aZvfvZWsKFR3s5fauvtUhSlW
	 NAOv+eyRRPOAR8l1lZa9m2hwRV7J5/aBwBYz94MClDWrHfAzDCtPo8ycd3+FbkVvWF6M1
	 Uoc6AjNJ1j8/uOuhrs6AQ85m2Ad4h/oQE+DzlNiDGHr1NvhE8TKjZLKnYBHpvc4G/1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJb+vQAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cxvu3Xtz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E1606A323
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03E1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJb+vQAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cxvu3Xtz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AfnSp1199076
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=; b=mJb+vQAK+qKuQ5vs
	Tsruf/KqugQbkXCuoGn/evxlOTchE1/QLQHwJBXXn169QltrYvv5wreM0ua0efwk
	T5vmFlSCSynprOjKS8/xdzHUiU7QlKIrfo/2D8c3wmvJvu3LTZ8hxQB0CESQYxBL
	nrBconEYbjucACCcu4HDt1c2eIVpbMpIeuU7/3IV5Pecj8MEJX0tHexTBS3vXBE5
	11422AiNv6kTlZXOBxwq7jyh/XhoocDCLOIFrmC9yyUXcEBTVI0vKCKXPl7HncCp
	RcNRA1cTFcz9PjZdJIuXdBVRgMWkacbLqVdWOJBWIBtwQO3Tvlmh+L40CsAB1ri7
	LI+zWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732wk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:19:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso243100eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143963; x=1794748763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
        b=Cxvu3XtzGCc5/7HWJ+EPA3OtQIY8A3fLLHQYSqEj+71QrML4dlQOF9kVArEoWjoKWB
         sB+LwtbxvvAEc5BUmGulQTMN72JkfZr0iK4HK4YUia68tXXuaqLH4SzcbsVxl1hr4oxt
         Vnqs2gDFKsWTmFKMlDN1auQAvptr5KCMNAn5IpppmOOSvdMXIHCIlu/lMaTLG3VetO/d
         6c1rosYtouuYd1fPKtN9s06USdetZrBk56wcwuQo7lTtMBQjeTcvbAYo8pP3cl+9SdMF
         +WXA3Sea+85gB5vIVrHupEARO5WWcp+2T73hSQ30RRcx4cz7+soh2TzHxUC5l+ZiVHAb
         1fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143963; x=1794748763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
        b=iuY0VCHER89gG2lUkqZIbFeR4fAwjlkqk6joh3xtm48QVCO0lQ8lxtrxIHWCZwe05M
         pdjdZCpd3kWQJuNEXG4d6Fz/RAm2NsCJBRcocX9yIy6lJ5TXC+jOzE10egSkkT/KGog4
         mQqKmYh+Xg2Ywyyu5nxCZr3XDivcVEZNZJZEt7bhc/04G7wu5Tr9qRGpR7sIIQJjoFy2
         9TdkuBHDC8TvRP7uEDeN83vAuu8RQTsoBypobQzSJQh9pxGGzmSXY+E/AeWh3TQi0wyi
         AhuOGBrzSNLZVtcN0CG2WTVWTgu+xMfhxLaHJGWzNuNdMoKMyBhkirS3ZyFe7dLhOVPW
         CFcw==
X-Forwarded-Encrypted: i=1; AL+hErEBwHCuCV5UM+uCyxyaWcRvllRvMsMfIWPKfcKYUCKf2FcorC8svFn5tdR4Back5kymUtDMrROdbMFE@vger.kernel.org
X-Gm-Message-State: APuU4Z/SL8t+7fB7MYzMo6K82EW7Zvy0p/DCWYfjcrBjTeWkyXGzjqI8
	2V7FQo7PnOMVkAyeEUAJlrt0/hiocGsWLP/PYhZdsCD7Brw4XL3VrV96BP8Zm4RUgEI8QlE3KFk
	V2l3Qu+JJTjZ/Vvxd859B0xqendfTIpWWvkHMRRLXaI0MfbCTiMyWAaL9oWYrqQe9
X-Gm-Gg: AYBFou18ha1VT7kcPpsR3tDIJAIcRpKPJU63pkGF/3nZ2hGOyCBaJ5Ec/VNu2OokIBo
	WlCoW7WrBS/Zjw3QCbKHFqrOGyhphk/jiuCNgzF4ArtBpdCqe19OlL3LXad5Xt3khaIpDYtwk2Z
	h8kqqwHEv7bKncfS62dB5QD4VW4vbz3VZX4SVri32G9VxhRBAJZRvI3VsVsTRPpfE7zMJ6ZGh0e
	9a9yjZoidnoEf3MZNFk5ZxuawPVZPieGlUUHCLnqWzmGu3EgcHPcKZkK/5HscvI14XICtby0ymZ
	M1Axi9jiTtv7746cTNudpGEfrgqLMzIFFL91p+wb6ut+QIlh42XnwaYlvf1rBuwWIcbNyL5PbJ9
	mbq/QuQbFVFj6kf1rSbNok1AggK2riD8yOmmKU6sLat6wyF2kVNwllnMHH9T1yesfPPmXkvdToM
	R1fLo=
X-Received: by 2002:a05:701b:260d:b0:1b3:90f4:499b with SMTP id a92af1059eb24-1b39fdada84mr1929525c88.0.1794143963100;
        Sun, 08 Nov 2026 05:19:23 -0800 (PST)
X-Received: by 2002:a05:701b:260d:b0:1b3:90f4:499b with SMTP id a92af1059eb24-1b39fdada84mr1929501c88.0.1794143962553;
        Sun, 08 Nov 2026 05:19:22 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:22 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:29 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: qdu1000: Add support for TSCSS
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
Message-Id: <20261108-tscss-v2-8-d5f575010427@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX22L7i/LUQa1u
 hD+Y1TnAwSeRDwVYBH1TikBBm4dTcBcLA81IZNXNghy9sPQOZE3v9P2BwC9MH94fEZ6M7ht61v5
 MLeiXJ1pMuhpCYxP6AJcwN5njULXBtJJJP2fFrIkBh6ja+tgk2K9wSJZK0iIOv9Jg19fNBgKmfZ
 n0HFK/p7+lCO3bq0a9Djo2qhw43pOBUW4ZT9+uSd+o7cavFK5zAwoe87i6QnzUte+LDfHFYrk4e
 50RJdd+BQ2H2Pd57ONo66zL/Rp+U8t+RGsAUFsIgT4/Q2qASMJZ/GV77mNfuAnHEaka5JvjScwE
 d5o/x45FWP3eD0WwSK/v3ZxV6gAqPBOTRRTq604BZvGAMCPjcnxv2n6nE1H22K2UsWunw0+rGVi
 kRob7OCVusvz3Q7GbUqKyc9xj+DjqtCk4Yb/WqpqQfbbtZHNhLwzbEe0xIWoYCS9z1krfLytci4
 z6iM1GKrqTrZj+q/7/Q==
X-Proofpoint-ORIG-GUID: E-O6XwIwJTFP87T2-hoVG09DMnyYPG9u
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af076db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pCDFdeNEuqTB-y8mxvIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX47mDhW/OBZuy
 YSNHpR3WjNtM56d5bWwbJaiA+yj8ThNoLoOC/gULeIiymQss8sPgq8Z8gibHUO7fg7gkUX/p1WW
 GQfXrPd13kWRrDazsjU4c0VsJpmmF8E=
X-Proofpoint-GUID: E-O6XwIwJTFP87T2-hoVG09DMnyYPG9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm QDU1000
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 3a25b5100836..0f4028c41b2f 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -877,6 +877,19 @@ system_noc: interconnect@1640000 {
 			#interconnect-cells = <2>;
 		};
 
+		ptp@1da0000 {
+			compatible = "qcom,qdu1000-tscss";
+			reg = <0x0 0x01da0000 0x0 0x2000>;
+			reg-names = "tsc";
+
+			clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+				 <&gcc GCC_TSC_CNTR_CLK>,
+				 <&gcc GCC_TSC_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+			assigned-clock-rates = <500000000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x1f40000 0x0 0x20000>;

-- 
2.34.1

