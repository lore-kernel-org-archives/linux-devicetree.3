Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A947ACEE
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875416; cv=none; b=qD9Xp7MZ9HQtA58cbmerlThpwXcTkPPXiodUFpWHJqm8gwmQNk+277Ozd2/UNE/VvqoRw1kKJkjIZSNZSM11wpFzz64GnBH/rYaUlcxcT/0xAZIif5fIEGTzRRuKaWfAsqLENvH4dvdUvF1Hc+iGuFQkP72cB+f0EpOoh2em8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875416; c=relaxed/simple;
	bh=uKLWTrcDR7c+0GER3Ovnt8iy0jidYHa0ZNUnMq1N7iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKjcTik2EaTjDu+wiXmdePn4huoLF8FXFAdTnNthy85+u92ixSyoIA1Nzdz2L4EkyWWMNhILRAwlVkOfIIQBiE36f6BiqdzvzWZnlWNTBAd4f9d6BMxGzlrmIrRdWMbmzQ0UrRkG9wXPH+t6uqwKQFZZTF5bV5YZlB6dOvSRd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwIUozhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDW8Ckxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwIUozhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDW8Ckxi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21DEK3054908
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=; b=nwIUozhnlodgFMfQ
	fTrYp4goMiGU85bztPsWLGH/E8v2BkfnbUCRm3z7mTmbHApk96JFSSlODnC3HT0K
	v6T+VezMNnkAS48ETfQcnlQ8sq4eTJJ9xUsGKXBiE08KnXrwE2Yildj+YyISnzo1
	2ETyBIGO1GJLm2OEE5W6+R7bTPvqJQJHreswJob0ZiaInHtYOSJ7h68GNWDhgjZ2
	SYZY0znCcoFKqc/YALmwJpXtRxLxJsKwDdX5ziInM6D0HZ2DHhaDEg47a+Zx6hb7
	KCyJUw5L9Du13+rgbVSiHpa14tJ5P0bMw/SOBtj390Ph3zHcdgoH26USG91DuE6V
	GBrmlw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aetxw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2072406eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875413; x=1792480213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=TDW8Ckxi7B1ufv3nu/q7bjbX0y+CLiE+8D5ujcHyWS39SfkzKOg0L0qiQtKcpPzOOK
         z+jxIcnWyfgQi7AkOXPx/JzcsGQ71/yeIwJhHv7MTdElx17bsDTvgQFLnYOvJo8CjYtR
         u4dDZxpfDS4ZCew/RvGcAEQvGV/i4/XbH4Ew9qQUhkL5rj/J4lX5w/qnTghZXA6siGoV
         P8H/T9tKctlJmQXehPiAnBh92vIKs4kgU2Y683ikTVLWAkuzeqRSnmwAlaP/wqEregtJ
         n5RX69yVp99lHIK2vU6OhYT0U/fVwum4N/V7TM4hpeeHf+8ANLF9VzEWNMewA9tbtuoS
         KDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875413; x=1792480213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=wCZQh3H8L/VgujaFX9IIB0Wi0DwyGafJHfFWr8QgeC/G37LYyOs4gVo4hOIiGbeB/Y
         qRqTx3cLLCL1fj3hja9x0MLco14wkaBx9ZysZIR0t/krksO52DYt78VzPhi1VNp/unGP
         VCeZbrHZSbStbYBhw1IARWEIRDO6v2N5XoUW1wS3G6j4NqAIrL2L2hHy9BXuwhDmZYmd
         pEQMxFBvBKTHjXkwN+0yUu/mOA0zJVB56BF6BuZQ1DgYc1KwpLQ5Fa76WXVw6ZNwK6el
         gTHFzkYjksjAxsOtsouDJaF/z57eXzvWlaUb1s5xvGguvhWzkvnB5akDc8X3aUi5NJmV
         BdYg==
X-Forwarded-Encrypted: i=1; AKwUvBwl6U6lvz0luRd2DgJJSWlKun1a5bZGHXhNiVCPtVk4Byv83sgh2iBQFN+3mOmL6/JoisTQTmbJqjIL@vger.kernel.org
X-Gm-Message-State: AFq9FYLO5EHf65FxOZY5m6v6PLQlHf81tdNbIewm0LpyTUfK6WRzth3I
	mCc0BXFIzLuyxicABFmLxkI34SclAvDcZsVo0JJQmjnnTcIpA3HpNnLIaqfYY8UeeG93TfmObGr
	BVzQ8hNgFrzSOA4lHGwxyjbJGIV+SRbwF9QffogGaHfbXs87W4hm7m2P7n9JcrNkg
X-Gm-Gg: AYBFou3eYDkuG/rv5XwMEwVBTg1EdcbBJ+MwDKiEyxXcwAgtNEvP/oFZD9/vqoI5H3A
	i9QE/Tjhdha7EVFNMavncB61EMjSfqRlTE3Kaq0gVm52z6oOfKsG2OGn7Q6a1bNG9C4606dzaB0
	+jP6YK8HgrHitak4aA0hS68IMbi5pkSuJ0l1B7RyIwAAiOOilZFVmrvuwaiDBK8bVL3P61fK0MN
	cRhFBWOggMJ4WWnKv5wPmmegxHlfRDcuz10lwWH5HQqc6AelRj5i7wQ32ClIuGnOjLX5boZVwUf
	ImdnbIOAc+H1h7Vc7x4MptkIyBu+nMejz6rZBjqUBceDJG0BwJrWadkyoq03OeG544bMTxwDfB/
	LUv6koj86o9F8SSjdH8TwcIjxEAf9XZkc1+Ew1YH7xvbLyfX11nMMKptq517Qb3gOpu1NhUXM67
	HYm3EE2CxklHl44L5QGvsrlkQs7qcEFw==
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364102eec.5.1791875412995;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364064eec.5.1791875412510;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:45 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 1XEviCjtFE_CezgL8lFDIxp1CfNXNpxO
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdd956 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JR9XVsisKQFD673mhBYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX91x+Jd98PG7H
 GBWSSG3w2gVjDZFVahR19+0L8AAjSTob67adMzBtG7BczkAlGPaZop8m6akPe+ezuFlU/zr++R3
 qya4FcoYZ7ugKvBuj69mr2OlSontWvI=
X-Proofpoint-ORIG-GUID: 1XEviCjtFE_CezgL8lFDIxp1CfNXNpxO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX/8YUOvD0T5X0
 yUh+gmsmuF1sEOjdIbxCj+nlZWuSGNqCCX0IRzwlMZ6kcIGNKL5c+I7f+XDboYdeDQtHro14YSY
 Rdu2txTdltoxFqpX0HNcpD66dv2T0ht5tKG7imR+N22xIa8HI+K/PJxIkBr7a/9+85CBR483PZ1
 RuYkRutD6Nw2cQxePTmBogFDwoam114hchpMoLa5F3SSehitwIZBFTxmJdxWfTj/tkZ5dQ9/3se
 WI1KVWpb1c/IjO04fx/BEkXIx8wuB8sSt13Z3TpdRwyBzFB7uyGxZ/CZDwsfbjZp1IPmflpk7ud
 1aMi5ubNvomtVfQHNXyHMoRTnhfZxrKVMIGlrybEG0POthDn9PNO/5q0n4kPgvqikTAwslnweMV
 73Rvw9lVzrFpRYDxRXJvYU3HtIl7qXodhhcTcKUCS8S3chXZ93PItarw0qJ7iMujTxhdu2iQwDK
 Yq4h3tKD5K+C+Kp2Jrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130028

Add 'interconnect-cells' to the clock controller node. This will be
used for enabling NOC related clocks using icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..20e8b240642c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -152,6 +152,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.34.1

