Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305935;
	b=d34Yow8xU2R6VRbL3ge/zMOzl9CoG9h05W9G020pavib5i9OeLzcoVNpYgANO11X8PO2
	 yaxLRrg3d6uYCXAjIjCB0M8T/BfACap3i6albPRGxnn0wfuEgeC9k5ABxDGBtcyNALrad
	 hyp6Fbia1jFEeyD/3tPWIQ1odTKevjZP75v6YUJ12oZPsrLCl9SnxAszAZ8fM9s+KD+KS
	 3L3e1csg3QZyRKT5nQresDZZEJGJUwNm9+72JK9q78iTXTSVGGX8PJvvqkGV0KnUuMeOg
	 teF09t/T92iUC0XpYCyJ1C1J/ufyXxla2x/p037XICvTlQbCKH4B3/2aLYtaGq8ah3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
	b=TDA9bVgHQ8iWpYq6XeVrC7DLwXK7YvPcAgWYMtDQ1ZxIZtpdO5qtE7sYSDD9FebCV87L
	 htxnD0BicUcJ2SoBgG3atKmDQmBg95Qm/Bz2nEtjmxGODRJtC4gUlOMM7NnFRBBM4wNWr
	 qMsjUmjVeRKICL06/TK+H5Tc7M228FMyUPAF/W2iK8q8nFgj+swK5oRUfbrWElNM/FDF1
	 utycQDeAUxEZysnCsqrmdYzMFWXA5cId3ieU4n6xs8qcX+YxcD2Eurak4tgh1ikxHcch8
	 Tby3M1W3k6Lhc1klhkUSEFWViWBMUlV6OVIbIKwPJCbgCA0x534YYkLaDvLLTmRkwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0hhAM2B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1A5606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0hhAM2B
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8Z5i93849686
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I/EFu7Fs/ar
	oypMjEq5BPl5EvpaGvb9lezW04r2LTCE=; b=Xgv2aIeX/aafN7Ei/rMWPqmcw8/
	1xTLyJHBiscFRwYSoOsDxc9RZeUw7seu03C1GVCqSyzLLgRqvzzVuBMaVgNOsaR4
	+A765VBXjklqNTRJPO54YRoR5LrFjdqGAwEmJt3ICm8H0yEAFKOlSYjhDiqCqumy
	IyfycVeSYxFxdTQAUI8ghyh19PeziFnYaWhejUdrSc276ZLEWAqimz37itX3B92t
	vzNe9J+labWkSN7nGVQvRUE1Li+QUcmm+U4IAiJ/3S7f5Q8y02cttfvq28uXTSYF
	hpPG1EWgvRQNQ7UxbDrheFwch+RaQtbtZkjAJkU+12DjRqp0dJCFThgEgMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgca0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94607500fb0so314971785a.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794305933; x=1794910733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=H0hhAM2BSin6OoSYGbeHKUNAqzlObCheQ1XOkBXt5UGMORq7RJByImX54Wzwu/67x5
         tg0H0vCX/uuJFAd95L1ECdEWLniFt7G4NSkzed8/de3+zHBM37kFnVb7bnzj7a8V663M
         8klFjzOoJuoaLkEqn+Lkh470xDNoWU1I6JIO1brrlJS1rvtB53e5RLJG8fbP2oZQdh2w
         Sq017FP+GAgFJzcNFQPAvssfTfY2ttAqXCLsyfAxwydMEvEy+Qu8hVYPBocZ75dN9jJk
         u0ezET1LA2qfVN8McJpN9ZndQ3a/0Sfpr5DsHWt4PyQUUzjAOkiyeeieZNnUJmmf75km
         CdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305933; x=1794910733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=hOrZCxlNPnKFlDy1akEHXvHntTf2xWzKJRFQR8X0n1L+/Y0h33QnY+0333n//9lSJ7
         9sehNKFLYqa9moqeUIOT+aFeETPAbNJRjoTAajFTjSZBNycM0qFBB6gvbTDE4neJXP/b
         Puy8zngvFIyWofK0z8Qf64XDK5xXXbiPhNFa4t0IOoBkEt/GqYePHnrIjTg/Zw+8W8zZ
         bMZ9/IiRn6TVeo7px78aX/b+QgJqB1f2tB2tFLDhicgSm3M2uYhetPvrUsWIaYYKuNet
         Cbg56+rSCa27mmVU9r9Zgk7ZFIx+iXU4ZHQprTrkFW0tYgrdfM92Iy92y+cCVuBsb8C4
         IDOw==
X-Forwarded-Encrypted: i=1; AL+hErHb/KHy1BaaeGVJlkRxTJLlma5zYxwNrN4OBqa+ZxdbGLbMrKrnNT3IsCEMHirQkd0IlTAIt/suYJxP@vger.kernel.org
X-Gm-Message-State: APuU4Z/nQ4C2aYgmQl4btsloLe74jt02mHB3CbBLGXmbaDl5Um3SaGmt
	Xdwm5NCaRoRAOFp5iKSXVHzSzY7ICfAQzuzeRjjOvl0OpCaEdBA+0maboGPHAtpgKVRGkYU9QXR
	OYaRdtNwhw7WTvMycctC+CWdq1J7eeNbOQM+3W7eVJG7bB8ejqjOIDgklFfbPK8mU
X-Gm-Gg: AYBFou1wVSza0+z/5z0a/+MLR2QGLu+4aSYSfQIZm78mRitOhrx/CA8VpH3e4Yz9VAw
	DZgBHgwVNaxqTO6SCJpHSFX0ASdjDNwCiejr4FOdcr9qEFj0GEjMPO3lND5bhLW9YyHBQgYdSeX
	jPsdPqGLEYbV+PTGpWzahIgYxC1HGTAOdiAbR6a+WlnGlyR6Y0cCt/cMKv0g19UYoAvnu6xaQvE
	SUCxfl009HT1eHZ8qIhsAgOTFvAtw/pFYKg8kw8l2bWUxaWiUsUL2B8RpdaPwcWpHGsv9BJZrWL
	mVuk4zxt/KZ/YnLIUChlKh2WCyq77p0Gc9faf3RKKJZht/MkqcNHUTR5kFx/Am1XeTx1NOAt/eY
	CdR3DpEs/q8jmKVjT9dbq8+/6/2+GdXH3hrf6Amk7esLlDDxY2lMnuF8YbWcAqVylEp7f2vi/Jw
	==
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334980085a.17.1794305933415;
        Tue, 10 Nov 2026 02:18:53 -0800 (PST)
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334976685a.17.1794305932853;
        Tue, 10 Nov 2026 02:18:52 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm63168165e9.4.2026.11.10.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:18:51 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 12:18:49 +0200
Message-Id: <20261110101849.3768125-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106133143.GA2705755-robh@kernel.org>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com> <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com> <20261106133143.GA2705755-robh@kernel.org>
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
X-Proofpoint-GUID: vCLAWTyNKi-EzWfD1mBOprTk361EKULF
X-Proofpoint-ORIG-GUID: vCLAWTyNKi-EzWfD1mBOprTk361EKULF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfXxRov9zIc1CKs
 T64Pw3lM6enxTnTj9OY0SXppmHWyXwUqXR6wYIswL7FcFnn1ezFvDmvtu0xOmo5o/gEll30ORZO
 AQQwc5irsTZAfQbhaJf/BRT5JIDsvBg=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2ef8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cRrya0eItvTHvl-yL4UA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfX6ItNoHWJrX8n
 L6EEG2avonIIZNat7H3ii1kylBJTll7cV6vW+yfv7Fo5aWGfpdlumCg+s4dBfnTqVP5Eezk1Y/X
 YS1bW9duLg3+8jV8iWgo+DyFENTtVm/YjnQmQg80N+eK8t2nFsHRzqfMbKx7pUShLmQwX5mfJW5
 yfZrUpWFofn2UDJFy/d4AhRWO282WzF/FXSV9WHw5Qg2mfe4BcA+FCFR+PNZyEJmAWkkC+OY7rf
 wyZ89XpPUelPQVF/1F9c7x6QvdUjL5rkB5nXW/vySWOmVf4tja0zdVomtgXqMPXMqZhmrHXEAKV
 QVopDavo95TQAnx+kO7LMyuTrKS1khzH+gMSduRiitU/MK0A/fD9O6Xtw1h0ClM6yjz2IponYnA
 4symJLHgc6y2XoGVB4cMR3rBRNDcj/x6hNCSDslcFTzpIWCItXCqYJf1EYaOIhG9e4y4MfXKDhx
 GOriKejnHlpcNa5Z6oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100040

On Fri, Nov 06, 2026 at 07:31:43AM -0600, Rob Herring wrote:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>
> These 2 don't sound like clocks that are part of this block. And 'src'
> sounds like the parent clock? Use assigned-clocks for parent clocks (or
> just retrieve the parent from the clk api).

Right, camnoc_axi_src is the parent of camnoc_axi. I will drop it from
the binding in v8.

For the encoder, camnoc_axi alone would be enough, as its memory
traffic goes through the camera NoC. The problem is CAMSS: on SM8250
it sets the rate of camnoc_axi_src directly, and a rate range on
camnoc_axi does not limit that. So the driver keeps its minimum rate
on the parent. In v8 it gets the parent with clk_get_parent(), so DT
does not need the extra clock.

>> +      - const: core
>
> I would expect the main clock for the block to come first in the list,
> not last.

OK, I will move core to the first place in v8.

Thanks,
Atanas
