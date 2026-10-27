Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100728;
	b=C3b7B9hau8lGbT7Ie8uq/leVNdsmMbUm1acYROOC89OWVJDc3pYuWOBAg20m6U1y5qDY
	 h/dtOm6HsuihxBqJ/8Yo6NtexLNIrklO7YynICLMgp8HYrdIJFOfE3mbhlNV+M7YSJQUW
	 wnTeldcJfcluHHu04GUJC5nTbKf07p2XJJhk7fzVCzKCMdW4iYPdS28NPwBfj36pkALBo
	 eo3KGwl4WQV8KCKTPc4AJE6Jeqvs6emPt7NiX8ZaSNXHHV+fdzDB+A8Xsck6FpjmPiH0o
	 tXRx7VHCyfHqaTooE36SizvI3gWBmnFoxB2gOvwUddCRoDqLkLJNNxbt1nxoPTSMQbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
	b=Zb5ANJz2+f6rbQLdNPWoBzha+gK5blU/ynLzbigGyFLAR/EMpyyHqxGfRRFOL7JxfhJn
	 UJdRPCU0YlXQNFgbq2sJbKo3QQZ16f7zlcC3QInfoAtWB3BQ4Az4YJVP1ALxLqlZi2ZbC
	 0vuyL12wjAk5hP+LY6qzt5LxvFyBkY0caAwr2p7KHgH1mMX2g/Vum3n81CmLquOCRCO9P
	 ZD3+1rkNc6DDKEr7dqSo4fWkjrkk9Jx6xghK3ru48AniPS/QPFDrslZ2JAoizrXjeDwqN
	 FBYOw/5oGmPGmjL8u1Q+5FkrXZLBgYNmVgzJRAC18ETuBQFuK9ggu0rcEpFM1is0VWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5FpOuWz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxQgofhv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00DF606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00DF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5FpOuWz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxQgofhv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCeZ3012104
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=; b=g5FpOuWz8vdXEU2N
	Qke6N/ayibqk4AI0fe7XVe81oPxsapqh5vYX2UhEMJVKdQlQPU7N/XxWB8OtwdFs
	flr/zgERQE7KvsRkwx7y/+pEyqKhxbelckvwr8orGpaboLpMfcE0fRIOQYw51xN0
	uXCrDqdE3DtjbxiFUistNQ6SWa+q3uu3FvYoRYzgnf5en7F0oBMfGSw8Uq32kwtW
	RF4/zgwh59QnMONL4mQVAsCcXp43jXtf6GzJRRJIOgzy5d9S0txsLkhe7MQgZ5lO
	WSSdIW5qk8ddnrMb7S/R+TSOQwzX7tle4IjbCqyVXGqy9mnJo1aiuidLVl3On/8V
	0k7p7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dasf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89f84753b43so2801666b3a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100726; x=1793705526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
        b=KxQgofhvm6LAGEhG0C9tFbw3MPtoAYV1GesAzMDkWmJuSHVOR548THKqGyPRrGDU0V
         BONkzDa4A4b9mUxjeC3XZ90DKjw7NeFdV2rDfEVa8ietdk/xMhIPu+cOgq5Psac0IdUE
         al8EHS5piPEOW8NtN8aj0sxgVruN2ZxOsdYAZTESuyUjPvd/RMtEvM6Fc5mYc0M5Dkhn
         AO5Eath7kYAE3yUpwnGdoIaBBc++4zl1X/iPSg52GFfklTUTdYmpQ7keFBg41bzslybc
         Wqb1I8OTmbv+6wDJ5pgzH323XwDIEd8H1F/XAc40cTmzOP+/lwrHXfg4HspEsZX0rm45
         IsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100726; x=1793705526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
        b=w6sQbrUq94BNgdFboMRh8TWHbaWy8rJsQ2x861+hbKFeMqVuXibAfsWIwcH7dapVQx
         2ihKDPl6n+GiCSiKZL7NJakyArucR3DUOrZLaAjT4+oF4aW3OeN3aqc9NcNTTEKNJf4Y
         h5WENTwZ4Hjq81I44FXNLFRTMbfC3axh3mbsR7YlOC8EmOY7f8NnVdITwtYmKX5ZMNmx
         PYb9Q/F8seH0Iwqrm2GaETKecijjs7bqZlc4AMkB03qZKffawFCVb/AXSJGYb1NaFK2x
         Q9dcVWeJ4CDiLCzYHSCooXDzSW94FxTRqdD1XAk9AgCz9+gvgsmz0NsudkZ245ZoS+Eh
         07Yw==
X-Forwarded-Encrypted: i=1; AKwUvBy+YzfPGCtDE0lBk6tDFyQfjTZYsBlPv2W3ZlB54eZ2J+DlWlEYbetm1/0Wo/f5TThh7UCyGEVWBJig@vger.kernel.org
X-Gm-Message-State: AFq9FYKDOxNIs7kJnwb9G+XodPK+yl7Qdp/yYcZxxKofy+TWI2+3QoCu
	clUeyC3U61RpEXtZvDejbiAfS//uPKyJ5ToaPqf9UzOqOX2/yh0Xklci4wFr7abS6XDlIfniDbu
	Wqe0/ejj5toCXxr2MpEVOq0vrtG4bXcNviUUCAtcv/7qfOZOzz6Ljv/QKoe//KmJ153HpJZRD
X-Gm-Gg: AYBFou1OqJDNvS1B63kOqwCyMF1XNCTrhXneVuUPqfufhoOVBdKNRSIFlZiJSdW7uK6
	ZG+QPGHitaRfufHQ4zuq7QOWuQ9dO/Yq/LXVlONYLAG9ZbaItFqITCM6cCW1e0UL58CEms4IQbl
	8WLKj2lnRlmr/KZajs9/pp8dy3F/MPiWpVLRfi9XXlmhJKU1V5uRzOSYDDUvVUNaYjmNUTthsAQ
	p0JVbpNl31nMBTauyHyiEg9elw+/zgEjHm9nWm1QyI4NbuQw6Yusax+kOlKY0WS59PjmvpRPNVw
	5k3GHFAvIxKubu9OE/4MpxS/aD3Gi8G3QjKOvPtOm3WR+8Je4MCl3puH9Fb2vgNh8Y4i2RwgQLn
	FY1h8I9S2qzd84VG6dWfL
X-Received: by 2002:a05:6a00:1394:b0:886:5938:cddb with SMTP id d2e1a72fcca58-8a3665a8f56mr7429142b3a.20.1793100726465;
        Tue, 27 Oct 2026 04:32:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1394:b0:886:5938:cddb with SMTP id d2e1a72fcca58-8a3665a8f56mr7429123b3a.20.1793100725965;
        Tue, 27 Oct 2026 04:32:05 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:05 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:01:55 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
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
Message-Id: <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXyA+wSwUcx6AG
 YA02oe8heXDlzy7W7reogCDWlfGrAZDF78abTJMRMb58W4y9HzCWUOJMrkc9rfEa3/eBrx+XLZY
 G2O3RvVXtY0c6oMqBv3leSnuBWaTECA=
X-Proofpoint-GUID: s1p5F0gzYvqHvnXMI-IxFYbGG3FAc5Ah
X-Proofpoint-ORIG-GUID: s1p5F0gzYvqHvnXMI-IxFYbGG3FAc5Ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX3QhN2qGaT2eU
 bnGo/RC3plSQxqCvCXMvDOABV/Bd/tB8Y4R5nG3Nq3Llq3qmJBv1bsIVv8Ld5afV6Ud2ZKpezMa
 OFD23goQxxeLovntXXHhirp6K437Zslqi0c91KyYp4xUvcyV8TygyP9b0YiaIOoLEIFpRJKNimV
 He8JrNYMJHKm13TOV/UastDgE7CZAWbsiJSi/UERIdm5jzUWaLIMbRSG9O93h9vwU9SuqG5R9dt
 Tp6PExco+pjT5uTl36dRe69a5EEXU4fYkBYuMnDe/tr9wbbP9bMRdCAuLm9FmRLfXHs5fKakljt
 1NeGadFLkkowBsuFCfJiw2beNV4mtdl13lrZLzhFGqhq95cl+87JnVuq45uDFAgaPSCaGLVcTub
 dEClTL5eDxpjh5P7J8a+LvkSrYP7/h9EA0SAZp7yZeI38IzI3Re+/FzQlYEYuDFxlUe/RLLP2Sw
 tqvEMtLBlzfWxDerFgQ==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08bb7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pcj_qY4RVFpoKUdRnfIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
than introducing a SoM-specific compatible.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

