Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513843;
	b=j2z8oGEzQZm5ttdcF77MOIwTeqeEiWTTypIJIbdXk+P2vX3+g68kUY3v3a873kgcu2X0
	 uKMcsj2NApmBRRlSbBHTs1d215t+d3eluMUpkpYXTtw1cK5xekLMoOjQLslh9PKDLONz6
	 HN62bRiLw0cnJeR8o9KmaeT1tOvUCYPhr28VdgtQxB1mTFxBwNo8xplOkflIbF5ONMZui
	 8OJVZxCL/KwTjcadcCj1YgPq0opDEUUT+0CdPU5+4kpO7DHqhrTm89/BZThovkAxfmrbP
	 xIhc0taQqs4KmvRykVxwyT6tm4/gYe9NGxy34fAu8/vOMfNwwCKhHeaYgn0Gay9tbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
	b=s2AasAJWtL/r7ExRrb6Gwb12eX51LHxkL8E6bPAS0I7ieR5+/q6dKoVOP06HcwSDwXc2
	 pt4ZPQKwq0AzT/spBwSJKeCnmkhL9xfEhHDWYbR7QFAzwTJnLObCGOSKRDJaxCNNwgk1e
	 /ZNTsoUIk5N5jHLVXi1yPhjE50F3RDDTc56S+08Lr4tjNhayqmA1LiAe2Hz1MtdVq+ZJZ
	 cpR764Bc1L5yyABXQj2i/eoWV2KVpWk8HQzJESFv1nNaOJ0PzmTJ/eaIATxPKLtcFSxf7
	 kwSII6gaMK8Wixo6Rl2fUhZzN6A4uJ5geDJyQNe9+KmMO2obKgS/ZO+3NHfiSKJiryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIJ7ZpY9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Al/GRjyF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7E606A33A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA7E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIJ7ZpY9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al/GRjyF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KFa2wh2052857
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=; b=KIJ7ZpY9/GZYO5vh
	nbAHnEvozVZCM5/Alvz+UuzmFGMK14rsM4mu+w1I4OgRI6pWBpMlzHwKItFk9bpY
	j/KjQ+dI40CebGkkpfwechxRV3v99ASaBhBRRn2GyaEZnUbRrEwNjtSLVOf+EY2f
	IQAob8W+zRlbgHzKKHCaGTzpJPzbw2gqbc4xeEAV8eCb01ow2WkGQNlPLRM332qf
	YpMvprbEBsKxdEIBwa0d8QNkJlUvnaAU2f6LdvyUzYYZz/Nywny8EHoVwxtnH5mU
	/Mp0i5nDMx74wpgYg/9fWCMblhinCh1uRZdmqye4u2txA5LtQYM74hXN+OdGM1dH
	h8TcXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n3dxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so8377321eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513841; x=1793118641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
        b=Al/GRjyFnL8rNEsnbrnS0C9+lH7BFKX4rqwtVDc16SAEoYSubeXcqz4tgUDoFotgQ/
         OxSzEkNycUTf+wuZAt3RUKRCmH6k4spN99RfetZQl4BK5GFNasPFsDQe8G07PYR+9pJm
         N9EMtF8JM/s71rP+kC4dosEDlbQUISy/Z3nuJ95RHxtCIX4HVjTRNG+J6HiJTdeWpfcF
         OHkuVubizb9ShErADL5260f7gLUuVo8W+CODnXqww19Tp9EcO+QOAoQ2nJIGOtADR3T3
         VoSGxWmmGAJ9QnvzzRzj0Bv+CahxwVVIbSLyDjfaU7PjsbGBIMZNAOLV8Tt8PCVziLOR
         8dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513841; x=1793118641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
        b=aDbdhF1NQhlPyQbYal2FLb07LXVyyskvyfCPcdzK2uzlG0U0FgRyDhimHQKiiYXzRs
         cqrcgxEkCC/tDjC0R0E0i/arU+epTpy9DE5dR8W5C7gR+WHOhT4w3yKWnpCQF80CgMdy
         u2UiJ45145H7ocn/IWI8wfxgs+Jo3wROvkKPzIGePJZ7eaP/Hd4Uup25KadA/rwFh5gw
         wIta8+IDZCUrjHZJyCHwIWvDsj8pHjkzmQ4smuglscpzX4TJ33JJWlr0k81LHwUFnVWX
         oK8YmtUoLs1TRTHH45dVL7jsPBRsMJg63nbS/CTJfGu5auPd1bdLVeDt059gpvBDiN4q
         85vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGymRFMNXTkSyahgwMoBrBIB/yMIuye14xCtwwC33VYjvFdELLxco5qrY3MoeCYfeD1UYpXFvvc6I9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7fr1S1qQIjghtkWMjD1+8g/cxfznruhNm8fSe70ka/sFewvni
	8ElHqP9KeDeHXcowujEIbtg1MCWVz00BJ/Y7HLLMFxKOWyAUsI024aEq/3fsxbirxO21B88RzhZ
	Cxt0sY1h7LJpb9XypGe6USaVze71su0uZ5SCstZRmnr9DkwpVLHBlvtwpsS/NkIBB
X-Gm-Gg: AYBFou3N9ZDSKn8odC2Yr3gTbGyiX5CrjR2DLO6L0WJYYRCAyjNZOGvZAiV4U3u51Ra
	2XIFt0Q232JTOZcGQw7Qk9gD4y4NHpSZbCHOjnHh4TOJ6H/8XC1k960QkkEDiNrAlIMXZPCW9Tc
	Pu9LIOzs5KFb/dtKqynqSGhC74MCib4KkDIISyv6lFJWZFks7/T9Sdim5UTInu6grZMlE9cGkxr
	ZgcG0H7ER7H56d4iptv/KiUhDFu2uZvQ3T/BDEs3pcQgD+N1QEMGLmx4RwUZwIGJCCxSwkMCZoq
	hEtzRGK1IVzCtHV45100xLFcrRLSy6nsbTXMzvxQ1IXQ6P2LlTdNpYK2xAlovTA7QMwR5oiPw9v
	Tb/NGg5mnzF9yMOUitRGDRX936z0P3zFwfgyeW3tFumPRa2YY/fQNjQXLCTzkTy+wXHCM/6+Vrs
	WhHdp1hr7iNifHiDfsv+dpMqAAidH0/UFTCms=
X-Received: by 2002:a05:7022:1706:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-18514729a89mr14434001c88.42.1792513841102;
        Tue, 20 Oct 2026 09:30:41 -0700 (PDT)
X-Received: by 2002:a05:7022:1706:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-18514729a89mr14433959c88.42.1792513840461;
        Tue, 20 Oct 2026 09:30:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:00:26 +0530
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650
 compatible
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
Message-Id: <20261020-ipq9650_llcc-v2-1-e4c492acc8b2@oss.qualcomm.com>
References: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
In-Reply-To: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: dFeHRLO9vbeDLD63eoRZC_JSAJzddI9E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX44i1RRwdiPS/
 14RRW8fNEBpu15N2hKMgzu3npjhZt50SqCIYFvyk6cUgBuTJJubfw2FjTcx89VLryHK5pI60Rk5
 LbYbpzamy3ow0KKgZVc9l50AvsP/NpQ=
X-Proofpoint-ORIG-GUID: dFeHRLO9vbeDLD63eoRZC_JSAJzddI9E
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad79732 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX5EbkXwTdmBWI
 YhEJnlUK1n+14Ny6GqRGabg9s6TFsmEPlBQcOhV6fbgszP1oNUDqyJjxr9OsoRlnNVyffoXsCZc
 S59zVTDgoqKivBFgTsxkwqbdFjgkBxdlcsJhY4nTKIU/0ndCGwkJRH/YAOLxQ1byBKC3vTApSLS
 4EYmIp9qw3Au8qLT81LpgR8ZjHopNYtDodC/oGsU0pjCX4sbw05oY4VpikLAcbLaC4THNEaX4CW
 wopDY5jm9z/NPx4TUdCWF32FLITgi5A13QkwF6AMAZQ19thOEGRtgajSKDoLqNDGne6IMaBBA6P
 51Dj4PeUOhqRSC2exByN+MtLIxW5hQNRDVlY9mCXrhaLhHgj/+7St5SlDwI9d7U5X6mUiOg4So2
 hCM+p9OkSF5mqXQDlAQiAENQXQJWzsXEH50t12OaUm3mynfqkoZN+6uo12zC+UQN1TjdB4EVOV6
 VvzBnDPO3Q5eQVd12fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200065

Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
IPQ9650 does not have a broadcast region, since there is only one
instance of LLCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3efe68b08d58 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,glymur-llcc
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
+          - qcom,ipq9650-llcc
           - qcom,kaanapali-llcc
           - qcom,nord-llcc
           - qcom,qcs615-llcc
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq5424-llcc
+              - qcom,ipq9650-llcc
     then:
       properties:
         reg:

-- 
2.34.1

