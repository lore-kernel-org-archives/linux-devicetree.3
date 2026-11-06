Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973335;
	b=G1b7m7mvDiTwx8VvRmjPCLndx85W44x45Y76Y18E7t5FCJZ4nOo2Jl+zwvit35ZEbpbs
	 5shcFf2S5Lt6nxjOmQCfyS40KGGH5VxxbvC6EMJDHjeYyFgNKWRIygarFz7zRvD7pvosm
	 9ZZwhsSboL6g02kdUcBGufR9P81uwNm9Xuw3lDmbM1I3xbsN7vWHRjovJP8m8XmqKaaf8
	 Ygdc7vAjoJmCCqR7OqmFCpVnjEIwcF2Zvg4UqY258mmETtKpGPx4otES+6bWiKCGUeYzT
	 MVass1ShiXWjFdTXsR/HOWz9L2t9ZNkWTjIfPR9l0h6xbrpmV6DwqkrRVpT0lhk/Rmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=nXzXvCrGoCvK/GZCc7itX+F+/L5hAuJOB4G39/q+WOmTOJKQQ8Lul0sJKRIE8l6p8imc
	 gag/ze7lNz9/9VA7qZgGIgnIMTHyppuRGIqn1nIMc089mKMEAQhDQu7x3Uusy1Nit2A9C
	 IgA6NOd+FhdCufdXBHyeXNSd3YcNtLMS1NpzQYxtEPnPPIwPTFxsnpXJCz7xAX4niqkQ9
	 xAwHfte/BRGEhJkJ7nsl93xSECGc/nDxF69e71nb5CNMFkiW9Bz9OBO0JovKM902OnoWw
	 GLgFpktkY4f7BjiXJRWsodLTZ4xEEtv1i/WI2K+0/y6MIBRDBTlrNenWa86eXAyslTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3596606EEB5
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3596606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Do5uW3173615
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 13:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=NCFwPK6fDMZUeEWu
	t2YavRajsMg7gc8nQ6+sZicIILKC65pRTJ5e3G/AePMj1kccWyxK5LcA+Ag4Xs4z
	Atqi5Fg+6AMPROVKn47l+9r4e/FzEdBz8/wU/HN+YZnPgLccTYi20HUWyobeUGXw
	dYj5mqKL07Gr6TqDIVGg9Rv7vM6mPt96fDixg+Km7/wyGSCPpeTfH0daw1pESJ2o
	oIXC7QLjczJBN29Ofw+l62rsRYvxMVgAtDUqTw8JPOUjodR/eZdbra9zUSSs8HpB
	b8gxCfbaftkWY7W5JMlHrv2oQlTVXfbazT7Mo/5oR9UMhHgXp+7EyMNyx5fnXRHD
	sJKXGw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9b36p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:55:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso458903241.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973333; x=1794578133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=bkjHaswQTdmQfelP8tvgty8CPdkWVMxqsvNDHNIOF1ljLc02MnZaE3RMsGCmP3Y2Mw
         V/o2py+3OK5xfngJYd4b0gF68AKT7Gi4sCHaEBdhDeE90PlSsujnyozWAVoYChg+yE2S
         L1x+/Novk1mbUGdw5yN5NzNBRrlKJk1vnD+DjKN4GXwuEisMHA5yPHHhdVPwuMqJv2zS
         35ts2FidSCcedTEj50FWuBpbWV9RUCahw0fEm7aMIRZHKKzDfI5OAi13i935XnvXc6xC
         gyfoEXrVMMtqPt8t8O+iqS5PjI4FY4ebz9peSrAHU8Hj3Yh8XHSnYQCR4PICJuCn3Hvr
         wHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973333; x=1794578133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=yKhJvCDR72nW4yiCZJrgVBIlcg7aq53rwuSFyb3NbFX9KYaQFrc0phcToWgBCwAV9B
         hOKoUICg5osI4IMUkppwOAuPriUM3kvAymR1OImr/Ar4/qXEbKk+wQaHc6g7gTBvoXdd
         NvtTwQAM559DZ+5c8Ocqphd6AJjRnIelHD1aOrqTpLXjbVy0lI85Z0yhB2rTSLT3Hezf
         ZA/d9zNOpWlPexOBNMinQ/DOt4hEH22dCPx0eK3YAewR5VjVOMlKptAdQEDqpLO1+rxq
         /eyvZygF+5DeO9aWEDkfcnSaj3sq95PcPGY5Hsh4iWI6VofHHJYQN+TYaf7Kb0q6kEg2
         bBeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcWxAKo4b45Xwbpy6BSJSF07gkamsmfLi6sG74Ce3MtInFaqttUl3s38yS7jUimktmYZfOkV78J+mK@vger.kernel.org
X-Gm-Message-State: APuU4Z9AWSlf2/z1fLH18yEQXIW8x2IiUZEYwPy5nUfRoZkMXQ6m5LPj
	+xCfDBz+BAIFiisRm0HyidZx+Q0EFlqYn/cZb8ZHVdl3yA03rqy6DRMsFnp9qV9Yu+5BSaQQzL1
	DOV98WjKxhmfGgPoBZ6d1q0S89j7MprNj0ZEuqRwwPYwUa1XQWv2/RBau2MtCV1B7
X-Gm-Gg: AYBFou343hNM2l0dIUXybJo3iAVqi9fca8DPAOeGFbCgyeNa3AlL47CGwsHh9vZskrU
	lfJdwygfcrtChRKmBjWxddxBTiMVbPa0kmGUkODbHHbfRA7tVTjGE4+GcbMJvaGK0y3U7oU6S31
	n+NlK6uujWsF5S8m83j4BNeorMlwey/VcvahNp8fzNqP0dk0bhvYVo+aKHuIwZMyp7cN2BuwHh3
	Ymt6DT6siUwcl4LlSwL9cb2J5qGbv7LfeibpBA2PVMkNcFBL556s16dVB4dZAGYJBcgeKrXrV8u
	/auRzDSrrcZQpJOGdF4zxba/wWsVVAWD/BA89ILJ2Ey4dIVxQG08svkPr/kzds5pXm9lDGRB6NW
	q0UuBgTsHgO2MxoIOO4KU05bFvDL1znZqp/8HHrFTRRTYjcyCDjgUZ3JPqF5UdJZfxGAfZJiaGj
	1yUzn5PW8PZRCZzXe2kz+OARbjdDh11E5kKEZ0wk/U3MQwIZf2iJCLmymPadcUBomZAwsoqw634
	F2Vz3Ll4owhHv5bKxgzt61Y98Tc
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093480137.27.1793973332891;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093455137.27.1793973332363;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:19 +0100
Subject: [PATCH v14 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261106-camss-isp-ope-v14-3-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: OC6L5laplJC_ZzFVd4Z0IK23P-9CPR3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX4Bz9MzRCz3tq
 aLqTCqBLmhumtTx6Tgnx9umpQ8qn1OSxLyxG6lddiaGJ0j+tlOBy2DRjvmrb9NDAT1W3m4S/J/K
 CFqdr3H7p+DtN4R/zRHzCwpY9QOAEMX4bZXA9GS91C3q23NC9Ua95mKyQFA4A4AY610aRGAqWqV
 KEo+hM0dNlY3mSd0lORjhJBMY8jYG1oeFYbB2BsFDRVYodpDAkFOqSsxDXftEHcmzBtDqnedmNG
 aYM5qxUyQmbBSod1H6qUJcQw2R/cIAJTra3jWdc6VfnYI7UXwqS2e9e5CbDebXTaKDzX+1U6sEK
 bYxBzyxV9QdDHMyfC+nj3iQid6hQuheUOphJuJOgmH2TV7+PA3Il18y4c8yhwQnoDY83Fb3fgFO
 LEGC19mQBwNYNuSxhwAipN4hmmNTESgTYBtCMALzz0V8JWfXFJAMBoec0t2GEtS031ckWXGs/ZN
 z0bS0M+O1Nw4XGXqepw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX8R2orpQkRc1B
 nsro7uMApAX1L/uJY++Vgf1/k8dr5sn8lQGdJJ3RDWYg8XlqLPcNMgpaw4FogXOarqvUcWAfbjH
 37ZYFT4XWshC5KyTechjxlMBGwemK7I=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aeddc55 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: OC6L5laplJC_ZzFVd4Z0IK23P-9CPR3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

