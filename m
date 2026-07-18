Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697F389110
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379461; cv=none; b=mCEgBQ72rq/Z4ionI7X8kzjTj0xavGZYCSADGhw1XxExtfJGo1htVFTqfZn4BKLjHCynVLeUFAnYYlOMpspGt7phs0WmnoD84Eor74sYbJMOcNp1TgSW9P84RewOvSlrG6romv/onnlNRRU/8ZUnuxymP0kQ+8TeFIdtzL4RzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379461; c=relaxed/simple;
	bh=7zqjKQjjwcqqiLCbxwdUYnPwDrzp5EXyryBJEanwhlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RgYZCNZUdVmF35bKVeZlqNscDaY0vkAGjBRdcOrN6QLNB1cYxvzRZOOiOW2z3XF8/PphsMrrm0siTq67u6Lyg2TUZCSPdD0kOgujiBH20MP/MIvO2y/ubHZAh6cckxwTa51h1bb0AEjujiUSAQsx2hjTRJCIijDxwR4XyiJ7/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDAYGcMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUbDcyGY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDAYGcMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUbDcyGY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAJOwx209412
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOSzJQ9XTNtgoqsrOxiR0v+1ke7z3w85vhhIIZ0sDfI=; b=cDAYGcMwcTkPybnA
	HeMNrAx/HSU6rQ7Wtf2XffJmUMSmUk5dELsqAS6BpoRot3Ob0gafwhg4gWrhCkie
	Z8l9JpDkGa3hNziADmA/ehNChOKaI+DMhk1q8bJ5hfk1IHWRolNg246Bh/gMRY6p
	wnDZcVbGSt2mdMuc2KMmEA4Tm0JN04GeofNALx+BDUE7TOGW8Y4pbsbFykxoLFkA
	0yGcmZZH/CwJvRXaJ6psAE6lxecYF6IsJcKfbFXd52Lxl/RMInO4wqJqyPIfl1rx
	MNtp0jvVM1NYoQtahqGUN7THK5VT1uKsHXrmUR5kLwH2nppaqbv16Fj8W57Z//7o
	h6S9Zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrrpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so8103133a91.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379458; x=1784984258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOSzJQ9XTNtgoqsrOxiR0v+1ke7z3w85vhhIIZ0sDfI=;
        b=QUbDcyGYqveRnn9in4rkQacQsIU1NVnD9mkn0yG1S/cyXfzIkcJf7ZCYVsXBicm2+0
         CSILyNguyCE8jmqDlqNelAwtKh8P5Tgsh17+kbKI+RMfq41+Pa3psS9cjWEF4nGaY04C
         bRH35xK+p4vLdhBT9favnToQbyFiMunZMdlI2hF0bRCGF3c+42NEKpzfEa2WrMOA4fT2
         gRtESSgoYopStUMoeiFsU3SL5xY2SAlN4Eq5Y/JTadLK25tI4O/z32aARYJClR7iSQLG
         /LNGyI2XHO0umOGpv/xST8o5W6Opbltgww7BLpIjqPamEhRiZKUSxgzQ9yco255wj/5i
         O8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379458; x=1784984258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOSzJQ9XTNtgoqsrOxiR0v+1ke7z3w85vhhIIZ0sDfI=;
        b=asQTrVH+pwT+usgedmLVsLsUrVA1Y9ANnhFZPlu+0U/kpfP2KZt6772sdfFR1KYZpt
         7MZ1aKJYTr9jVvn8l7KVZzJ4jMKDTrJEAiqP1QupReST/otDZyTuTmiBXLLftdSRZJrh
         qhSiJAyKRyXqMcb0hlBgK6vI2ToWMFuRswVYnpIIyArb+9+mOdGWD0nJB3lDZiwut0dz
         pG8iHr/MDUkmW/sKjXXknwKRxB4CqZLeGV845B003zpUTlL059tDsm+H8oex27Anvut+
         tFLuM5OHCTkrmngRSGqDvXsmSIVDFRpVFNTNboXnti4EwQxp3PFKBt5boNdhTsWH1mR5
         LfIw==
X-Forwarded-Encrypted: i=1; AHgh+RpQOcGF0O6kvmvkggIjbgVnT8HxGkW3A8RrEMPa73Dn+JnOC6EOlLioOFysx6U4h2XGkJ2dZeC/NCU1@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBgMr1gc9H3OSA97HdL669V8uHdxkTjjZBMm8p8m0DyR10A/b
	ARSQLfR5aSqGibMZSrLAZcTuWl/sWN8RZM1ngbe/cGFBCf/oKhE1ch+voTwvDm+4GJm2l7ycOSn
	paL6fV9aLh7nLL0CyXl20EnHSrFLdbpF1H0z+n5yJ5VIfzVfuYb0a/dxIXOi2Bf51
X-Gm-Gg: AfdE7ckDMRukEfV2wkQWUkBr/Vf7RfYXOcHu9rf7jforQt7Y7ooOpF4c5lzrhED7HR9
	A/jT9miANC9tZOFAc8hgLlIVw/nVWYrlnB38tktTm0qXYbZ5phf1NiL2T2Qsr5yt9CqgYkLtDsI
	b/kRbyg1nyecjnkZu60K0hCKACHq9MmMkbaKJVY/0vQ7k0ZMn7sBWhYwFnPs3GpO2CGXU52dYDs
	M83tRDWyZS3A9FlvbQu9nPHGjUMUgqsZRzlQ2FuX62pcBDsO9ugIADTb90Odz+SIho5MGTYYEKk
	20V8aBdHi6TIBV7k1f7W3Wg620j8CFns0ABScQYzjB3IfXB2MjqMeUIVVC/PjVp62COz6RypGmN
	qXIpvh6dVfnhg3qAb4wV6Fy+fdmW0qe4=
X-Received: by 2002:a17:90b:3cce:b0:381:96a2:14d7 with SMTP id 98e67ed59e1d1-38e4b538f85mr7358328a91.22.1784379458238;
        Sat, 18 Jul 2026 05:57:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3cce:b0:381:96a2:14d7 with SMTP id 98e67ed59e1d1-38e4b538f85mr7358288a91.22.1784379457821;
        Sat, 18 Jul 2026 05:57:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:19 +0530
Subject: [PATCH v6 12/16] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-12-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: GdvdYhk-haJWzsC3K0BZ0ge-DepErvV1
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b7843 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jPm-3n7eGs68fwHgNG8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX/g158oejAFW0
 yUC/AIv54xI8az9Qa3Zky7TXzGP2RfafW4+7RcGP3V/FthJVDdCjV3diynxtbevmSS6Bgl6VzU3
 XlyFROPjIzo2wNRFa3X5VTfwReIWR7bAuMj7ItAtooAWWMmGCAwC5UcV46OSxe843nPr3zK/Hln
 V7Qiz5x8Xv3tF687VYbd57Rncv6olbk+R9kyXHzmLzn6tiSai+BB6U+jDaaYuXAnTH7q5OltNVM
 4jnMZ67Jnpiot/qcAevPFScf7yrG2IC5uByvv7pCC9Du5KdvAuRC8Kh6B1Cz4bQv2WCmkMA9BT1
 JqCxFyuoXAm4+tJPsYsg5SRhwheaZtnNyhvNFeQ4kH9LEhTq5gXjrchq27nsfdYCfy7WpvH+SX+
 rqVGZ98j6HFs8Sx/Qd4y/GW3eInQGIxtQutwPI0dDGacNyvD9vf4jYEechoBPWlogz30aot/UHk
 QRMhO+keVaz1aTq08xg==
X-Proofpoint-ORIG-GUID: GdvdYhk-haJWzsC3K0BZ0ge-DepErvV1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX23xpN6HbQw8i
 eYMkMMlqKk5gAg16NbHAgP3QCuh1J7CE8ixY6hMBd+q8/ChF9iAl5cs/rP0NAv8n3MCKBByffbn
 5cNXNndRnPzl25Jt4INzkxX/toGE2N4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Add the missing power-domains property to associate DISPCC with CX rail.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.

Fixes: a2b32096709d ("arm64: dts: qcom: qcm2290: Add display nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b81528a848a75f6884f1b27137d780f07..590bd2432d85ba80891ed42df8afa317c869daa2 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2197,6 +2197,7 @@ dispcc: clock-controller@5f00000 {
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk";
+			power-domains = <&rpmpd QCM2290_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1

