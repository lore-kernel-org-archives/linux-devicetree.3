Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699478;
	b=ZMBUAD8OR6wLaot8I+Y0UAbSH+gq35IfqxI88fd3W4LKOg9VUor4ov7diCk/RjX6DHZt
	 8lVcuXbY68y7rugZ2yCgUwR1/mbkYw6cooJWK/kYbE9Hngi15WIbGIHwcgux3qKaYQ8q0
	 9exllDa3pBgDiH2ai4zjIJRLFdUiU9JrGJqkCagNa527FwLhIvCxRTiavHFYsk7uAHAO+
	 0Ok7yHfCvfvsWgc2M232ovMgi9iUkzMuLBavX2Js5heetK+fmZJFVCNmN1gD/l60tkzKa
	 Oyl9N9mmfnSvOHZVuyeeTA74VYbCQLZPr9nKYdu6IWCV62VZg5K66VtyUJkNzNjBfoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
	b=epiGZ2pwdNp3NPztUH1ONSyNCxjVrdohyOdqo6yn7UOJTNJWkCAdInR/YB1fuDEsui6l
	 dEMvFWTnd+WCxr92a8S0F0y+2V7ghf6/nUSI28Mb5qnSK3OYaNNd5xp9RNy3QJLfjvdqD
	 0LGIdpa9OOQ/3EHrXS75vBjZ4EewqmH+nwnbsEI2mE6GKf+k3bwrT45mzL3hp4Svsu9jO
	 wxXf748h+Vh/c/Lc12uH8XnXXhZ/ug9RZ4ZhMkQAWzqRjWq2sf0VQimxXFkfFcuzLSGJ3
	 fN3kqHjaoixlV4tQ/WG1jrZ3s4AQvVaSaBDbMrIg7PKhX302o0P4aKVuPis33LOnHBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfhKrri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP2vHrOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF7606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfhKrri;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP2vHrOa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQor2785104
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=; b=iTfhKrriCluy3bWn
	sBZpQkHHl+Hg399tLvEm25/XO7HlO4C+hKRNbyEHa5g2OSMvQBt/k4avk2Qkv/GS
	wEXpMF9Z4LgxyldeGf0n5cTvs/YDaDDYpqDL6V05PRk2kodZKfPdd9bfySK78zTp
	FUD+tmRL5QpbMle++YkPJtrxMxznMVMrYM2FrBXBnB54YuPnKPBoevidVszjAqWa
	ZPOFGeWMMc00U8MwOQ/tchUk6hxQBISiUCI5W4eWPB69fnP/M+RAtBoVO0GwnOxG
	5LNrofiGOPAM6IpsX3JvV/N97UHcc/psA2FPsIhrs3wdC93DGK2RgsV76DoSVb2g
	uykQRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb37g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso6042655a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699475; x=1796304275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
        b=NP2vHrOaVqqzZ4j0vxmCrTUUkSUo4Tir5fdILX/NiN667db+3XPT8Dn91zx7BoUYOn
         y2PWiibfc4b3CX9+IEIcGwitIxbC1Xbk/Cg0SsQManf4zSlxhioCTlRZLtqJaIkASroQ
         3LwGSwyV2SfLhXrGIjRVyG0YOe4+3um91XNHG2a6GcMCsCAEhVB1yNi1Kdrt5e9HT0Qh
         iCEdM1Q4gp4N92YCB7yZUd5rnc4cUVCN98/nWE191H8/9JYyKpsUCreb10GPUzifwxlb
         fQCR2T0G4kflisLwI0aMJCyGwT147EBatzMDulJMgrwSwLHHOE/N7BpsgQEjxyfvuu7e
         0Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699475; x=1796304275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
        b=TVopCtYUr7Tf90bFfO/CMnbMzwdVFqM1eJdiO6AVXkntnQrj5x15Zu7hu/gqybXLr+
         WK5Ev9j/2SAgDtvh2Mom3UhRKFgFzlyP4EAgDEqcNDgh8YPKwBK8V/qDTyoh6/UKFPCq
         llrkmCrbbje9lNnnIUwD5uRWPRtGgLj1RZnOWA3yFu1mYWiLSD+eN3fi5rLeIxkSjd78
         skM6J7iL4j0Fy7lBbIR7ewyp0LAVV5jf0FdeBc+0WQ2JR+JcdpXz7V2o64nPdTNzMy7o
         JvZTPLrNZgZuJr5qwsXwK93/PjNNR0rts012EWtg7SGidKsoao7qrAMNL3qo8dKw8pQg
         pjIw==
X-Forwarded-Encrypted: i=1; AL+hErF+sHgLUrlO8KGkPyR9dUe4ViZNzGIVEASumQ/RhNbXQvEMorDi0iO/nNhBwclKw5hQV6pPR/T9oHH/@vger.kernel.org
X-Gm-Message-State: APuU4Z+S38ceQxMOg3zEwUGC8OROBpNn7/+MnBdDpSj5gdkmAgxW4+n9
	9gqrXEV2KV37/a+/AY7UU7HOAg2LfSgDJKCzVig00VO6wc9CCrne5bEKqQH3uXFpUmGxnPekQwC
	nRg7VYER3SlxEwoAxPlcf7aqIPCY29Jgp84lPm9bPMVObxS/WlSF8B4l3g7pGVghi
X-Gm-Gg: AZFdTZcjdFNNlNvdPJHflPSEAIOUlUjbiMy6K7RXGT5MrXb6xATmEAHm0uy9zEXmv4q
	RFJPTUlJKIbHlsBo36X5njg90UI7MOl7R85agaKPwYJRcuBT4IIi5mMyUGSQm8w8j0M+MFK9UF2
	hXWPqiPQguVZJfCb+8aks3XEqf6xyhD2bu7won68AadezXIGJlECtkKVQ1pMLxivWZSJoibzhRJ
	Vjjw5hOsHa7OhEspT3uaVEMzSD56nO3zgqsmJbhp2mNul9S8XU2ej/FL7DaHJMfuMtdsQZQvG4w
	J7IbEaVxpWGMypNK68DDOBUF4miFybgJnkmLZx8VA8sE5xLjMmW8+kUvA9wX/1lUD105ekDEUy4
	zspnwXQ1DI6noAXiz/ueEB6QIjZ6h6VTGoPlt/BVRTzINSjjM6iY4loJJ6hmBczFIdRofkleaVB
	cop77O
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20647070a91.23.1795699475326;
        Thu, 26 Nov 2026 05:24:35 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20647024a91.23.1795699474813;
        Thu, 26 Nov 2026 05:24:34 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:34 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:19 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
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
Message-Id: <20261126-nord-iris-dts-v2-2-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=1022;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3f/TKIuHesYZU9TLZcTkUD4yAPks35/nwbxYhtbY9Ko=;
 b=bLgk9I8gxP9rgBQhX5TLRVkd0Eptf3ULvxcMDiBUL+h917XghBNAMYIV4pPJC9tZgw+ErEFXh
 S3iFXXA+LU5BUnejZei0rbtbSHV4Mymy5eOQLRyF5fbGUrPdRS3x+y7
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-ORIG-GUID: aWvgaz2yxJaKVwaEN-292rV3mfLlihes
X-Proofpoint-GUID: aWvgaz2yxJaKVwaEN-292rV3mfLlihes
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX8EJAd/rT6mDR
 EVNNorxP27utuzgI/NGEa+Tt4jOl13HCDvERBt+RN8Q/671DDuL0rBg9v+SxiORuWIf2Tb5Z27C
 j8Lams/GwLMNPCRzPaQH/VgTiF6RyjI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX/S5rjRqystQa
 HqZgxEhJ5Lg+JaIGumuB2UDxDsG0byM1aYY90MBPwMPzq1HPTzAKmWvWh4naz7bKFs6zIKLgkpw
 qV7830Zj9oErMq9gA2X7jud6nw8qesIFzrjjn4k6ySyeGI/JVbu3ywpTzLbjRO3C3wLQfKULy0t
 1Rboub+g5s6Ku5jt31ywnrmsoWcUdgazbnL5V89KcAn14Ly4CE0UpJKBGzdq+7VHBV19grkVicf
 7VOt7MXDJb9RDh6RTUC14AKNx/vzAyHWhJSR0GtOMm3nW/J7fhJBezWj9BVO71fT8DezrL+C5B1
 ltTTv5FAW/q8cdBLnEXNJd9ul1y8Ag1W0IVN1l3LXrcSRH5XkpfoAtTYx2GjdXMJrujxIOW6GpV
 WEf/1at4DkvYpOpLrhznaYB7hKVsIA/wfAcZ0i4ntR3GQLR1CScxI7nIwDxTtvVG0OnbKSiE9l4
 amKpffY+5E98zOAK42g==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083314 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2Kdgl9tpF7yuq2k2qQQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 3f764069bf1b4..b31c30f460b7b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -464,6 +464,12 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &pcie_phy {
 	vdda-phy-a-supply = <&vreg_l6a_1p2>;
 	vdda-phy-b-supply = <&vreg_l4a_1p2>;

-- 
2.34.1

