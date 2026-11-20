Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166471;
	b=Atw0rMcFD2oap5cNwja40UxgAJaajX7rzPJ0W9kY+IUEft8bvD8NZuhJYmuNa2pb9JMo
	 yJ5UL//Fr8xCInvJQ+qwJyIfL7T32pbG9yw7XpqqWXNrj+BzZ3jM7ClTVwPXTWF65iF7Q
	 uh0QTeLUZdg6GytJNRM9OVMTN0DcbqkKqDTsi/WOIVJhPdFZsoXsg8xQnRILOJbtDNhDp
	 FYxwGpgknwyT4Xgjlf4+eNfDvrgYr61P06hgbg5n2PADVHAJdNtKX0Txd/CZ7PsWpI1P6
	 xvWf/dhr+voLIWbM/ftjvzN9F+WMIT8lUoYeXceTp9vfs0bFO+RdhvsEdMOIyRbWvSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mahhSk0PmR2ezEj2NwFomLCrdaTaXFYTI0YszKpQWiY=;
	b=t8MzU9N+20EMrrObgnWYBcH8Yv3w29lP0KlEzpq2epp+603khAM7Af5stLlttvpv+8yw
	 jmthgUy0Ebmj4hFWXJRNaxINj5EdlNbXVhGgEHUQLlMtAhxJ9ny+BSkhm3ccL4zHK8g9h
	 3XIDSGhXEg3mtCLhz/M/yiSpb8A6yIcjF02fuv9ph9ClwbHg5pgoPh1sSRwK4McIY5rZW
	 DptinNBRaTCXH8sIyPntSNUnUYKrcV3Q5n3Zwz/XHxC4ibeSMB+VwjdwJnBnUVyzD47J6
	 NdOUm2imkZP3tsDe1kn2BUQNltQvuMbV8foxO8tljasFev9ZY3TwJrMoHDhNWkTzyxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFhEPrN6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NqgzgaSM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75960A2607
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D75960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFhEPrN6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NqgzgaSM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEqt758281
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mahhSk0PmR2ezEj2NwFomLCrdaTaXFYTI0YszKpQWiY=; b=pFhEPrN6iFGZr7FS
	VvJbym3P0aDFC5Mm6QmYQ8JuMe/VB09m9wlAzsRa6YXsLv9lQxEcdrboAUZD/FP+
	lSI6JC7Rb+kVErWHaE+h0B0AMvwzWFIpigt3Lcz8tYuAa3QraZgVqROZE0LynpG3
	0MiUlzT3RGFGqGNpbcstpbV6su1AOdrH8Gkottn+AuSS+f3Zb0Hn0kG3361s6+fX
	zojyQky2l4mhLXaSxt/XbfupAvTyws6dpx3ec5nJ8+asBghjUTN0R4t0ZRsaVP41
	x9F0nR9w6T2uQixjZTFmtRAoHs2N9rT2xQIPjIflbnsSKBqH3NcqGb1cekVKFwq2
	VVlTrA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5u03r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:21:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065e2933fso967336b3a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166469; x=1795771269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mahhSk0PmR2ezEj2NwFomLCrdaTaXFYTI0YszKpQWiY=;
        b=NqgzgaSMvMKItkCV353z87f29wbYiq/T7WdMxZVKhxWSarZZPDjFBGo3bmketF6U2/
         b7LtGGKC3CzdTz0qLh06aurC0I8P0poVho9MtfeUUR0rpcsPeDMqPTAqaN5q3dEgYgi9
         4vCc4G/zUVb4yPni45baGh/SiurwtCDSA9zNLROOCpGBpY+tp+qDlpSF8OxskRn16g0d
         yC4wQntfXZyYsGIuGlH0EOYkjZu7Onpej/DzG38WSwsDHRALfrszLKX5flqUuMBK5dyr
         s/hD0mkcqoRx3z/5QLmCVObkD0cRjAARUjeRLwKZrQEKPzQXGEw93abQpq51fJn4Zda6
         AqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166469; x=1795771269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mahhSk0PmR2ezEj2NwFomLCrdaTaXFYTI0YszKpQWiY=;
        b=CvMrbs4dWZBfs/Or0B2ZG7F7ppT7WiYleeqShVwn3m2ljEozNnjvrb4QReqd0itjuX
         WU0i2zAxCzGqeDHu20IBnsTKsJVliMzC0dF8SbxpVm8OJ1EoJ6eUey5Fktd0wThOebFJ
         +2t9Qmwh7ZRVGqMsZZdqd6Kq/xh6cX9F7zcAh70Ak1qxXEaNRCzgMdCB6BO9FN20p1ID
         4DRllLG71Y9UFtMnGwnQarV2+HmuxnZd6+BwoGkeYdmUuCg9o0JsuupBOiI+BYvn4h1h
         6BFsNS0v7DIwhT1OS8JgfbYg3jbkQ1eomEa2VY9Inx7gS4P/Daun+sk80TujaczJY3Ox
         41Gw==
X-Forwarded-Encrypted: i=1; AL+hErGq32sS4R7z/Woe12xrSIlif+LZiDmWjiMBQF6GlPvw+La9pQUEviYz6K71peWciRv+nqpg8Z7Z4O0+@vger.kernel.org
X-Gm-Message-State: APuU4Z+pR07uDbxuTjw14r6bDkTkGqF0Fd5jlNDQrK7BaPBHh/NjYm73
	08Fk+kvgc0P6OatnB/bAr9RuQ6d6hTim0F/rTeL6G0l9F2fxZVu3CkiloP8fUo1136ZX61v6n6T
	15tnK+ZtTfYCvlOkN1vcaQnwRXz8kn6CNbuHATZJ7MK806bbDXrlo06S0d4hk1lzY
X-Gm-Gg: AZFdTZdmVieV8Na9/j3oTz+HhKqeidMPuErkFkWopwqZaU9TEpnHWPjxux6ZcFBHH/9
	CoMn8Zkj6xAq/Hb4gC68K8QacCAVyOA2io0YuxtuuGEW776lGli9LTLmwS5AEge8wFI7FxaMEcw
	fWxK0u3Pm65xV6uEZvE8BFyfXf/Y483P+L/5Hx50rgPo3/reZd/3WkN5E+DkpYFFTYe35B0dG9T
	qFp63B2WAo/pdvj+EF8MPfaY7xMuf1HHKS/k6AM+mYQ7Xo2wpQVl6iQTbOEjUWzzUyQiqBN96s1
	sZqmcvFXWksUnhFXwjc5KJLr2QmTWJmDYrSn3aS/8VxYO4jLqvN05Nl/nQeWfGUpzYPSXk8q76k
	O1T3+mU/QQwVYYG0bXwt2AxhJGLCtPj0GmUrKKjdRPZdgBUOorpqLU6XhnGkgNP/ImIvP
X-Received: by 2002:a05:6a00:13a4:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8c8792b5df2mr2197431b3a.3.1795166468766;
        Fri, 20 Nov 2026 01:21:08 -0800 (PST)
X-Received: by 2002:a05:6a00:13a4:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8c8792b5df2mr2197402b3a.3.1795166468320;
        Fri, 20 Nov 2026 01:21:08 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:21:08 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:47 +0530
Subject: [PATCH v2 7/7] iio: adc: qcom-spmi-adc5-gen3: Add support for Gen4
 ADC master PMICs
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
Message-Id: <20261120-pmic5_gen4_adc-v2-7-94d0e1fd6847@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1816;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=8tKiHC9A/M3XzU0T08Uaoa2wdw40KkBqDDzliwqYNnU=;
 b=BKiM0wm2FEu3QaMv6oPG6DNGe1n0UDqLZHy1I0BEjBtQuV7N70QOdKz+q2TF2AotRmVplAnqC
 nByof0nMIoGA1wh3QC9cGllTN1Cfc0pQV4XI23sX18Mn9k1isyv2Rhn
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX0cwhks3JDzRG
 U1cY1EVSqsscwGsUxBoWqkvRLNeO7oxP8eMsrsHy3ElMAf25C70WibnPAUWXEYCab8f/syzVYzH
 MTpW7N/XvSFQETRu7n48oodpKzhm3As=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX8ELvErP83vPG
 B/FN/jZEtOZzuZz6lD1CG5PNY5G5ajxi85w+kPEuixgY5BgLNZL/6OlJp7h5ks35nIebHhRvNi8
 lSQsHQd8TiJUUAMp8WZePm3W2/pbsu1BiqCW9Q6s+WAPEVIyBy+npitpnPRTYFJdbN5Fwz89/ph
 9p8R1TM7HU+UVUAwLaQJa0VVpUHaHnm9njMd6+VL6iIrNkT4z7Ok2rdROapsYxL6mNYMVomeC//
 JqziA5RM7aAGvuV9qfO+BE2YKIXobbKsqggGe5LPxOP6QAm6xJlgZQbpWz+4it2Xwkf3ZZzsbb8
 vkobTj51LpZU1eb0T2rCH/r+9Wt8r9y0avTds5gDia0LsqViDVSCng0xPvJWqQcbKdFh8IQKh6w
 pJifRCc7OoDBr2rIU6kAiFg4bto3Fvb2e4+7tITJIUcuB3pbeXY27PHfGJHKhEt5278LIMxG+FJ
 rBoP/T1/dxwZtXWKSkg==
X-Proofpoint-GUID: SuABL-ky_gyYkNytv3AzGufv8RTXkMyI
X-Proofpoint-ORIG-GUID: SuABL-ky_gyYkNytv3AzGufv8RTXkMyI
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b001105 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=c7yoL7TMHuxufLz7hX4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200037

At present, support is present for Gen4 ADC channels under a master PMIC
with Gen3 ADC, through the ADC channel property "qcom,adc5-gen4". Add a
compatible string "qcom,spmi-adc5-gen4" to support a master PMIC with Gen4
ADC.

For Gen4 master PMIC, add a new DT property "qcom,adc5-gen3" to distinguish
Gen3 channels under a Gen4 master, similar to the channel property
"qcom,adc5-gen4". A channel without either of these properties is
considered to be of the same type indicated by the top-level compatible
string.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index aa06d4d1083a..6782e0ab3993 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -521,9 +521,13 @@ static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
 	if (fwnode_property_read_bool(fwnode, "qcom,adc5-gen4")) {
 		prop->common_props.generation = ADC5_GEN4;
 		data = &adc5_gen4_data_pmic;
-	} else {
+	} else if (fwnode_property_read_bool(fwnode, "qcom,adc5-gen3")) {
 		prop->common_props.generation = ADC5_GEN3;
 		data = &adc5_gen3_data_pmic;
+	} else {
+		prop->common_props.generation = (adc->data == &adc5_gen3_data_pmic) ?
+						 ADC5_GEN3 : ADC5_GEN4;
+		data = adc->data;
 	}
 	prop->common_props.data = data;
 
@@ -596,6 +600,10 @@ static const struct of_device_id adc5_match_table[] = {
 		.compatible = "qcom,spmi-adc5-gen3",
 		.data = &adc5_gen3_data_pmic,
 	},
+	{
+		.compatible = "qcom,spmi-adc5-gen4",
+		.data = &adc5_gen4_data_pmic,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adc5_match_table);

-- 
2.43.0

