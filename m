Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166429;
	b=mUJokJ1kXxpUSYexBkcFVKPW+5vbbyVi8cTnwPqfNzmzv+Tn+b5U/cBgauUGER1YTOV5
	 9YwkDIHNO6yj0w5DkyHp4VXbLc5jyTDTBr1lrTA5cKKd65tFvRYJOl97HKFToy/0csDa3
	 WzvFY/Mibsf2K7WRoLBKvyw61rmjYQnaqTokmrCOROJuFcIaHYupHey+OUy+I7O8Ok3Qi
	 nk7OPRIS9BXhQUl7EXAQcxE/7mXQ5xsEkx8rdX0P3WH1x3uzVLG+r+F4Ltz2AOqdjOL6P
	 fM+x3zTe7eabJxVPBX36BhbtcL3Fhmc70u4eTSHVg/SVIuWqM4pysEDWUN1IuHxEzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
	b=DWriwfaA8rB47kPWK6cabavRZrf9BcKs76zlPr+4p1jZkLcs2LOOLWjhjh0ZOZzDLsfk
	 iHmw9rhulAbXFTbw25zzu+HiXGJc8vPV+hBETkU7+t04Fcv1h1Fu3P0WJr0O70x4UfdD5
	 t4X3jw0fYmv9is5SuzXz1QYdCmg6jeQ8neuBr+9hirbpImBAYNT2n3fX1RY2594sPsuvx
	 nmg4hiIi+ff6Yh2ibc1MiRuj0kSxqUh5hZ3X3KRu4jmnhUePv7G5bcJYbZAzLKxuzZQr7
	 yH8P+aHGguISU+9jojxt4XY6boql5SUl58brGnw3gkDbukIgRYVPtFBgy/70B+Q7Y2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sxx30HjK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAqBq1eC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A4606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sxx30HjK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAqBq1eC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7evWf605903
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=; b=Sxx30HjK968a0r9i
	nN2cUmnoXw0Av8mzVOSMfRp4ONN06PUjpqFbEgR04gIGoD/LnNnXxPRLsxQ9Zq8i
	4P+unKEz3BRJ1/Pluhk5E2uw7MDuVCAxAQC9+F/esmcAwnBHl0zCYxZ9WYyHRvQh
	zq7lweKg1PCP5nHi5rWCLG5VCikm5xbXYM0hyroXWavY1DeejKB2294VGac4IpHj
	tQULnoB4SG503IpKnARyvT0erRPZDVOSpkDBlF1uIwOy0C9BwBwAIIFfVqlSDmxB
	t+aUkNkdDqWNohc+X30+8qDIw/0Z65I2ssby12ElIMQEkJcVxVV+1lL4GGy+ETJM
	cxvavA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrsyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b7614e9762so657638b3a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166427; x=1795771227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
        b=SAqBq1eCWBQT/FankBbIFETu7bCbhxbSFxTuTlKkJ2TZV5hjC5sNdpLmbScKXZw42p
         wO4OTi/1ubBwEI1Wds/s7Av33pqAE3nYGQ9sycDkZikYUQUW5ewyGzIMejXZ9Xkbk1wG
         sHbtJLqo16TzPWFY64SkHiS9nLtbDizRbavJeB5osX9pZyPFMzrViJbB5LPm7C0eDgZa
         i4EGvyq0yGvBZRWor7fud3Z0lChbPSMIPSmMTw9aGtxpdHnjpfH6n8jrCmuzXw6cuMfH
         f6m+L3TOs4yFpMs3CqnVYJ21JoGRmgjLFnq6VHLC7uwyL3K6qECb+YU7PC+/J+nPdaYT
         0oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166427; x=1795771227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
        b=1ZKcYdmRpMTpNDwb0vcyDFPFBONuhbb3Ok3Fd65/LsOM68ftl7qUtBQDzhMcpKqnzs
         3JVz+Gj2gHvTUVdySf+2nFlEOYOE0xNjZH44M300+ZDWJvQok4TeO61nIAcI9tUrYAWQ
         DHQKluzf4CKDtvoXY8LMUyKaNtmJp3EBbTnN41HSfZ1WY3yE4QNEyaoUD4PUUBAZm8Ik
         1+teBXo2W3RB7MOg+BWj64wN20wOf2ohNaYLYgLGBQmwcfnQcDeFl7WVi91pFW5Latj7
         GnoJLf03MKrVxzXNyZJvCY+Qq48Mnx+pn5t88qycnaIrnCqYG+VuSK0UDKP4yuS3QDyF
         GyrA==
X-Forwarded-Encrypted: i=1; AL+hErGxSUIqOhQcbG/HD5jpk6esDqfV+VB0CQMu0QGPCQfCkKDl17IxwCRdwzzPgojyrinikYMEFrdDLzRZ@vger.kernel.org
X-Gm-Message-State: APuU4Z81AEhdDNGqdmGPl2BCY8jTWrG3G/pIx2Ibw1QljeD6x5DArXJy
	QFuh+MKNVv1Y1kCdrl2h0YiV2oNJDI846Oe+zwkEW/MDwgSkaaieORnFcIFXU7rZE/sxIygJK68
	JXlKnLrJZesZlQcZas5wq4JcAhXAuGxlpcr4+vZiqhaWOaLyAc51vCFkNv/Lga8e6
X-Gm-Gg: AYBFou0Hxu6yT48jz2oFoAPRwk09tVSonjC6WQ+xRJaoC+0Gq/Io2yzpuM3FmbOMQ1D
	GpmOX7YjO7xbNJIiVAyeO1vPTXiVO0ACX2nV+1P+9b//HYSz1e0hosU16qca/OoEe+Iw6PSWF4D
	csBnSnYCl/s5NInvfY82oYlJC6vR+DVnCCyfMYFpX3pbquJUBFnHhgVMTQjIzDxOKS6nB7SVDdY
	glm0+eXnf+PBhCWiX8oYWWxQ1rHlgnBl0OSqFNjga8ROy1XXIIfQMaqDAaOEHlqagdU09+XRTF/
	7evJp6nXyF7wH78hkmkxaDUvNLJpZWbhQhaTRnBu1N6CoM82YprAgsaml0LQ3XtcyeNiy8R6yVt
	OT51/Yg3EJZ0gb4B6U6i/uVIFgQFpp6MmivaC6svbRf3Fys1iQSUfSjkMGctBpl05L/ms
X-Received: by 2002:a05:6300:6bc8:10b0:402:13e6:58b with SMTP id adf61e73a8af0-40213e6061fmr373906637.37.1795166427440;
        Fri, 20 Nov 2026 01:20:27 -0800 (PST)
X-Received: by 2002:a05:6300:6bc8:10b0:402:13e6:58b with SMTP id adf61e73a8af0-40213e6061fmr373886637.37.1795166426985;
        Fri, 20 Nov 2026 01:20:26 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:26 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:41 +0530
Subject: [PATCH v2 1/7] dt-bindings: iio: adc: Add "qcom,adc5-gen4"
 property for ADC channels
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
Message-Id: <20261120-pmic5_gen4_adc-v2-1-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1979;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F3jVIKW9NilXKZEG5EHwwNF+JBuq151qbC6+MY489TM=;
 b=8ENEqOoPLDHnJzh4eRJTEVq+hTwbYAEvLcp4kzvlcSiRgRjVSn+k7VUXrN6c2rQeOwm94xhUF
 j/xnvYGUOlUC/7vayoAhBUPFpJYPfxeB1KG4OvcYZ/AhxcJRN8Va7KG
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX3O75mjtDx3yb
 c2DZ2doR2k7CHx89Z3tHVfc6dSQcQZPcNVF6mH7bfBZFGr+HYkCYxnctmT+PHV4b3emfp9Q6t59
 odf6gB8gnC6IgCYxcOANbo7a3B8N2leiTneUgGq6z+nmUoZ18uZUvNE2VO+CEdOqmooAwR+oP/b
 kA/IzDsqkvgui86jQOMFQa0jJmN5ChweKZITOzqXsN18jj3lBCMIUjg4NWgU65MAnq4qKCF9Arl
 Y0Nlg3fWihB8smSqls7EZO3tddeWlvlzybvwgFl1skQAqQPurQDnPwCwwtCov2uEC+01/sg5zLi
 b3T3C1tkQC3uky7EvrRM6Vx1zqvekqtcq4gJ/DqpRrhm8UPKPtr0sFRw0evk3pEQbMVD6Z4e+o2
 hWk5x22bgnoy+h3CTPLLmGqzvjd0pSUnH572Zaj8El0nB4bA4Dd3eFVyG0idSNOJGghBs6XUK1V
 Nwp76UT8iSHO9Ci6QkA==
X-Proofpoint-GUID: bdOkGbZtHPb2dy_AaS_kCd0biNN3EV9V
X-Proofpoint-ORIG-GUID: bdOkGbZtHPb2dy_AaS_kCd0biNN3EV9V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX9j8ILoMUL2dR
 ykTs4X3nFfA5oFPFu8lrrkypzNrP+BimQaGRL5hdmQh2/61XtxliPx1Mi4mbS//AyrPMu37RFon
 MxKWqx30mviAirexkSl7H3RoQTHnJd8=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0010dc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AKg146UrkyRmMzRSXpsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200036

PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
improved performance, mostly at the hardware level. The main differences
are increased ratiometric conversion resolution (from 14 bits to 16 bits)
and increased bit field width for PMIC SID (to allow communication with an
increased number of PMICs, supported on latest SoCs).

In the Gen3 ADC topology, the ADC peripheral on the master PMIC
communicates with ADCs on other PMICs. It is possible that some of these
other PMICs have ADCs of a different generation and may need to be handled
differently (for example, on SM8750, PMK8550 is the master PMIC with Gen3
ADC peripheral and it communicates with PMIH0108, which has Gen4 ADC).
Add the "qcom,adc5-gen4" ADC channel property to indicate that a channel
is of type Gen4 ADC.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
index 149f4af8f4b8..065b82c41e86 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
@@ -83,6 +83,14 @@ patternProperties:
           This property indicates ADC_TM monitoring is done on this channel.
         type: boolean
 
+      qcom,adc5-gen4:
+        description:
+          Indicates channel is of type ADC5 Gen4. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen3, but some of the other PMICs it
+          communicates with have ADC peripherals of type Gen4, so channels of those PMICs
+          need to be marked as Gen4 to ensure their conversions are handled correctly.
+        type: boolean
+
 required:
   - compatible
   - reg

-- 
2.43.0

