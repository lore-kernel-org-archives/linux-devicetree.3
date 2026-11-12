Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468023;
	b=4XZuNR6+PRB9bI6h9VV6tG04Aumix3n9M/u8/NXD9VcEuvhROGiIsMJSJGwYSS7v4Olg
	 ea8KE1QX4NUnh3eIULwhGV5NeMHSyIWpLDbE2djE42S75HrwwvzMOr5ZAP1GToW6z3G11
	 dEn8HlYafwFOPD+/Nlgh6gigOnHVu4cYJDmN13g7LBZvmCqVHI1W8zfLMzhcwsZKeitmT
	 TA/1+kr44Qb7JsG5KUrAHrxumzGfpM+oWJSZyUG6ZPFF2nWyoXj+2OUvIacf5oX+9NKFB
	 cQh9Hd1ON0zy258LS5Wwwc4LomvKN9YwAKqDGnI6gVuZTNFGtCvM2y8WjreLBhw14Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=i9jbtsLDZsS4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=;
	b=qM4dj0zutDF2GE5Q2C4vkSQsNJO18J6/GHj9zq4BZ4FZ2S4zzjLWGgOLo81wl3/cld2X
	 tZEQQvWemDhgahEWQonLouChu+ThkXC9lZeDikGaUARCLRmqGrdNOpEpmmbdLTtwL00fu
	 7gdNFWaBDgF0gflqZpOam+7c1oqaPefu+9ZTDjeayLLCzEzK/NluBMB53yiLtjix9s80R
	 AuAlYLTvKMAp3EWyj+5yhx1IKeA3knavlyMPdmtj77P3OVMP4svUN/YLeTzzMwPhAlJe+
	 86IxytHIxhafQwejEGKqJ/mbVlfcjsTtYi4zRKWNXVj3g/HWatyTkOo/x8btDbtto2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKCBwgYw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwykinUd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E86606A336
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E86606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKCBwgYw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwykinUd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ndCE441531
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i9jbtsLDZsS
	4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=; b=pKCBwgYwBrnc/LxUl1E/mt5JksF
	tdlEVy+2HRxQhIjIY79Z7zmU6XbZp79c1JqTYYCF7IFim/q40yJ3b2+64HrLpS+T
	UQKlNTUsnCx44Kz6rK6zeTM0hVAgT2Jx8kCO1GE6VPbTpnsT/jZuAqZU4PmWc/Ir
	2ql8Voi9P5wr9oXDF/HmNREpFBDzm+yWm/HhS5fpoxaAFTxZcBiPjZlDjXMJ547u
	3XRMh1JK3Z1TbhiQA6zwonZIenU3qIQ1HbgAbbirDaTXcaF6eCiqYhY4sVWe3LSa
	jfCVWHKJojLfdZPlj221wCCfLQuAwdUbXeuGf4JC0AxbStE26VC4TfpQbuQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0a6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed79b01ef3so2356985ad.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468021; x=1795072821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9jbtsLDZsS4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=;
        b=ZwykinUdbLtRi2qdcSWDBINHpcS6tBsTqcvPJe1gYyoO5ndV2/Rs+vCo5N2is6A4/g
         jWZkr1nzaJj/x/6v52qVAL2ZM7Hgr6llhiOqT72vHbNpnzpIXFMZVGxNxzNahTetNS7N
         8wJZx4qm6bSqoL+U7mxrHgl7F9WO+dOMobv+pl5JhAElydLDBp3N/xjQwi07MRvkFX9I
         LRgMlacLt2SPCofncLeWcdzTBEOQs2wSUHHiorSa0KKM2vK6iIGX6uLZkUsUYm/gZH4e
         0zj3UZgLS8AFDidSh1YaD0u8BH7pcyGbDDrJ9J7XZ935uortET3JZ4Jj6xEfR78pel82
         uaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468021; x=1795072821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9jbtsLDZsS4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=;
        b=v6kKij61PoPjBPtbmss/FgfSG3mhxnaU7anaVNFziS4rTzAikG511dh6PYCNnP+hjF
         HmwCnrM4lTQn85w3bONS6z3bziredzFZbVJ5qmEN8AlGI3ONFfSfKelnx5ZylKaI/F/g
         rqTgXtbk39/Fg9RTP5jK9Em49tYLJ6ZUZZ9nedi+c6N+bgFgwAk4Q6OOvXTgxAjvEyMi
         yXKUb7fyvgzv3WbI52Eb5IbgnpVPY8HkjBilWQKGv0B7lX3+bkew9g6imuZbQXadfNDm
         OsnR0/3Q/XtIkpxGC0BEeF//iBoN5BEs+97ua4Vg9GMzsU5tISJi37a6SLQ0ln0Ae4Dq
         wykg==
X-Forwarded-Encrypted: i=1; AL+hErHP96/skxWTThvFltURdOKL+BqG2ya58u0CgCDkzYDrTzUwPyUK1KJUxhDnqr+uIqa2h09ipUQ6MrE2@vger.kernel.org
X-Gm-Message-State: APuU4Z/F6iVSwZBlWmD4nPbEQ/OcIK9RlmBFlXOGFgwCbqyXgqfji/16
	tKl14r+5yOmUJ3NZBZdZKXf5F0NOywZOwdKUomDsC10stL+fVlKTUge0UF8M4oihAIPDIRlgO1g
	yKHWQm3pKNR/G2Xo0cCfiCdxMHnmFRPx8ahSuzHch0qQz/w8xb8fONdrtB58UVT2z
X-Gm-Gg: AYBFou06F0KGaJyGSgkhEY1UFPhggdmK9Fmzcrp+8q0xgnjxGJW9A7Q7mqXwKodfn3g
	9xy6zIBNH1xgwHe1ptFOjA6ga/1bQxJ9jl+1fajhZ4KhDGCQzfRFh8CO2yLSxkmjUd2d5oawO43
	l5UR9xZXussZ+Ty1CYMsIprale5j0INtjjQvZGfmskq0HL0MRVHaYP/EcvRLI00TOShdyKXzoEM
	NsXPMnM4k2OYDTF3hJ4bXl27wWcG8IukbGpUXRYriRu7DYjMBidkuvs1faHMAeC4Z/rpvNsN/s2
	rnDntV4hFB2mt31O3O0BZPme2a6RDI8aF492Wwn6AKyTOh1COK+tV/JGp1Ewgf3Q8BNlXkSLoyq
	5lF6Tp3by0l//fxm0SYBbKok8Mk5QoT5JWAmNfih8H2IbHr6S0uH38dr7ySptOdXkwq8oyQwdPa
	jMSQ==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3b182f3642cmr7324452a91.6.1794468021431;
        Wed, 11 Nov 2026 23:20:21 -0800 (PST)
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3b182f3642cmr7324412a91.6.1794468020967;
        Wed, 11 Nov 2026 23:20:20 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:20 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 12 Nov 2026 15:20:06 +0800
Message-ID: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -TpqlxC9_JrmR4HlkaPMbihF48LKtwK4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX0fRFaFyFVsDD
 OYXyHhFVkrcVoKfKW/2iqX0DHcAmxFZW91pJsv+FPTORK0xde5XZq/yy4QO64IC4K57Tmgo+hNU
 0GrZS0KpFvh+BPExaZu3MVJ4XWapcVY=
X-Proofpoint-GUID: -TpqlxC9_JrmR4HlkaPMbihF48LKtwK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfXzlilWsu4j7Co
 IUrDO+jIC+n1ZBOP7dcGxvsSCgDQ/nSTNy3pDeueWUIVC1F17nmqAkzQnAgpKzgPl3j5Nq+BASd
 cR6HU10Qcb2ZGhy6eevY40ugffTZr9Jt7zkoMa/RN6Xgp0OUHtXOCaPzTufWAAOIDgDqSENKKtR
 BzzAwPa4TRcNgs++RZWlaShuhpxQkinP0YMiimw8mf7skPkD0y9dRdP/n7jcokqAfoOJgktr1E+
 YWhSsJnXm6L1bEr57YEHdlRqgaipbx1VJQY/XoWNnxsGzbDrenF+bIx7iQUipjHgpdTRZUYoyNW
 I/aPe8jOwL75/tnrwWL+M2aJMOV0xkdQd0TIry3Ml27k6rRuxzef3w6mI6LM4pdaFD7JE1knelb
 KXQSD51POfNymQWSqaJhnMh25Gkg6wItTBZwkGSiIhQt+pVIwUpjRNIzRMtWiGhjlpPaopdx1yj
 /MGEoxvLs17/X+gAaMw==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af568b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=FZ15NAR4OWdYCF8lCvYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
resources need to remain available while the application processor is
suspended.

Teach the Qualcomm WCN power-sequencing driver to use the existing
SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
as a wakeup source. The PM core keeps the IRQ disabled during normal
operation and arms it for system suspend.

The series documents wakeup-source for the WCN PMU binding and enables
it for the Shikra CQM, CQS and IQS EVKs.

The series has been validated on linux-next on Shikra hardware.

Changes in v4:
- Rebase onto linux-next next-20261111.
- Revalidate the complete series against linux-next.

Changes in v3:
- Use the "dt-bindings: regulator:" prefix for the binding patch.
- Drop the RFC marker.
- Replace the "must" wording in the wake behavior description.
- Report runtime validation on qcom-next and kernel 6.18.y.

Changes in v2:
- Derive the wake IRQ from the existing SW_CTRL GPIO with gpiod_to_irq().
- Drop the separate interrupt description from the binding and DTS.
- Focus the description on the functional behavior.
- Rebase onto next-20261014.

Linghui Wu (3):
  dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  |  6 ++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  1 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 36 +++++++++++++++++++
 4 files changed, 44 insertions(+)


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.43.0
