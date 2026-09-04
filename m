Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C1446BF9
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515033; cv=none; b=bm3VusmSzUIERoyJe4b6HkiVZJ23O7kjBgyBwMjod1B+tjLuh0erZOiebr+YPUaJvA+O0UfwOZVF2xAlSXA+k4Tq6ZJEnp9+FvBu26zbeERKY2TIAGPHJOj7wMtgu7SbU7QrOYNf9MzLh7sSopMmFH7YeoU56A19A/qBRkvGS/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515033; c=relaxed/simple;
	bh=BUuamkW7WyQdHUFUJxPa9rQAVkw4TDZf9p4h2DUNuew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPg9J9vmFFGpGu/EFI4gnUHbgftADiz9XilzToeGdof+ve20KfbAfaA71+ZHSkV9qpBWHv7XgEHLbOethsAIYmmkM0NXn5inBHrzJEoCyaAJuD2xx4FkIPlvZQMKtNfiaIYifTzUzbNadvzanG/C1Y1cUfnHxaZD7t97UgVKmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4cyti5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G292HANP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4cyti5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G292HANP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mgeF2945695
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=; b=l4cyti5f5jb4QTjx
	0ZyI9QA+6Soc0sC7+UGIua1F0I8Dz0aWgQcCuerJY5yP0tpCypODgTkuoVAj9yW0
	2FNQOkF3BnJJCc3VJtESD9myqnCloZE+draM0s/qhjwleykDUQltrngnCCTtAJsC
	MpHrBIBedKFlks47F3qBtkLMsrN137RBWtN9ZVy7Vz5Guj+XNbACdMD++cJkAaRe
	FBR7kQtD9/fjQK4hztk25nx/vUzhZl100Y1Ozb+oV3rQrSVf92YtRUg91oYgjJSc
	xZBsqr9o1o8+CHzV9HtnnzGb+BJ5S3JR2awIJjWkYNXwW/DG234f/Jhcvg/L/jTf
	fCfXNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd0uwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:43:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90520763ceaso1673536d6.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515030; x=1789119830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=;
        b=G292HANPvVz3iu2AsTF6QxZePBV2iJCUb5ik+RskeyryQy2oT7da0CCHPfs+YxE+LC
         +vCPZLpHjk0sNERD+mzR76XzPbTRnEcYaPbTQvPGRZf4kBL3yJmwuWO0H9MHLn1/Bnl1
         fvHRnEJRipERvQS0JloEjz+uLM22UjfezIXstVIy90HifVAfTVVmeKtrdXs+ZUIL+OI+
         avIVTfuitdfm4G1bOJ6cMehneI3zFCHv9G0QfQ7JvsczN0I8oPu+4UObWIs92T5xAWhh
         rg18VzO3bTsv+vCC915bIu8EPi6PsG07FrKfzagLuQ75yRZ/jw1F+sdGeuXIIFpsTnG9
         rjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515030; x=1789119830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=;
        b=O3CUY5wWlp7Qp5Q10ccCHRvYL9/+c5FmS8EbD/DPapQLlXAGBLNaKpy/HA0VZWVefk
         Zr9mqNOTNW8nyxnDOhlluZLaHYLBHQS64nCSLFcGm7tqlKXiv73rgt6TiNsrwbKAJxrQ
         TdPwEoyteVfX2ydXyT5mxi8Tl2f35tcQ0CPfMCVQEOSHwkVJf/DwFvlYJanaGJzgA2rv
         xwmHC69y3CHRmr0OzSFrmEdnhji7XefyFc3E+qXu+jr7ahQGPYW2deZVCWOfbs/kOGur
         DPGLVhXbLPgyn90EuwKeAJwv3GyHTsPgxvXw8SjU5HnxaGUkqU0fpJZYjeMsoqn3po03
         Z4Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwBK9Jt0VqCSKjeZKvYKKPMAs7LFP+u1/BiQrlywEkOmjlMNK7orXBU9N/w44fW6wStOheidpSkoXd8@vger.kernel.org
X-Gm-Message-State: AFuF++m1KyJ2OLUwc7i0/Y/ueuVeBRhyACE9XeLv2EZYhh0OfHNmPExG
	3b2Ngm062ycETgzAN4EVu12rLLQEsvBG4jgScbhp+DW5LL9T7uPu7z5T/Yv4FThx0XioXYq9uLD
	r2Z8ZJeCwZk+jA1e9uYUnqPLOsSS9ffigLY5U03DesU+LJv2EQjjjkKu0EJ+hQ6EA
X-Gm-Gg: AYBFou3dO32wILeuyfOAGq+FrrKJGrOSc9/sS6wGvvoULVMnf0Z5p/3D4vncWg940Qt
	vUAq8Y70x3Vbge9Bn8T/e3jCs7vdMMe6sldyXY9XhFH/rc9HuvHpsszsLZPu8CyLdMsH4bKFuH1
	/yryIxvXK11VoxQldUQOyYYEyJabhvWI7+Cbxi6tcchwQf+zF5VB+v4/nte1fIBVKYqpMSfaVue
	gIKZSt96AP3CJjTK46XZIVx0ezilV1gxMsTcpIYVCAEzmgWKZM+hapuS1aNzf6J3XxjpUDW74Hr
	kVV5LmxjmHbuYYLLBD8L1659hZ00GZDr/WNPLpQBIOD7+MHg+lJR8LvH3r947GN+Kn35+/kykRp
	S4UfHhcZppNrZx7gye2IGoU/VBKI84Hsiqw==
X-Received: by 2002:a05:620a:4709:b0:934:95d9:85fe with SMTP id af79cd13be357-939806ecf7fmr302184985a.3.1788515030040;
        Fri, 04 Sep 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:934:95d9:85fe with SMTP id af79cd13be357-939806ecf7fmr302183785a.3.1788515029655;
        Fri, 04 Sep 2026 02:43:49 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm30554755e9.11.2026.09.04.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:43:48 -0700 (PDT)
Message-ID: <45e238e2-4c02-43c2-8050-cba0862f6be0@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:43:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
 <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
 <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4V0i9Oss7mWI7okqJWvaFvK_ht482Nn3
X-Proofpoint-ORIG-GUID: 4V0i9Oss7mWI7okqJWvaFvK_ht482Nn3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX8z04abD88eTs
 H/j5V0h5XFzaPGkFlK/avj4jL5khzL07BvWTxLPeJcKV9ikA52VY1HScYEaZGcINbHwNKVsuoKC
 EiZrbFw5OZ3iFMs9PNXeNpN1X5SKk0I=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a92d6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=uepqBgb_qm6DIlqMricA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX1zPNK6Y2YEtV
 3xfACGz8xHs5g0AfdskOTMMMLPSJVIeULfb7C8gdSQ+GaSPg7KJXld8/UqZrBvEUhr1xWBRutc3
 YY03eRHpovmRhIqI2xkFCrYhqCbkJxx1G9vQaVlxf0Vy8FxPIvn0UxgueFgXsO2A2bMnhZRP5pf
 EHGG8I+imyc+mTvBlKfT8YPoqmsyb1X5p7Ern2mVMf39zO0oJXAhlxmg45Iry9K5U65Z0BbrEQO
 7Guv6i3CV6tvl3I9MUH8ckgc0OtaghX4zIoBl8MmV0uqFGIKvfPHzoW1TpUizBR6OpA0GfnT/pp
 LCQxR55cgXcwlo4qw/dy73MVfvTI3mv0S/Y38FYh3o1TVY7JIygcGHF8kH0V7EiXStozWoaoVgJ
 1umDLN6pUfaEuKfpcvFkQFyLdsCJmwtv66IPZW0LXRQM4b0jzHPz/lv9Bjt5Ce8N4YfrNm8fZfQ
 KjmZ9PAW6EZSobfP9xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088



On 02-Sep-26 18:11, Muzaffer Kadir wrote:
> Hi Konrad,

[...]

>>   must have a matching mipi_dsi0 entry in the GPIO0 PINGROUP() definition. The same consistency is required for every item in the table. The gpio function is intentionally excluded because it is inserted
>>   implicitly by the PINGROUP() macro.
> 
> Sibling SoCs like msm8917, msm8953 and
> msm8976 do leave them without any PINGROUP() too.
> I don't know what function index they map to
> and I don't want to cause bugs by wrong indexes.
> I don't know what to do with them.
> Should I remove them?

Apparently, for 8952, someone took their creative liberty
to rename function 0 (GPIO) into what looks like the
assignments on some internal devboard. All of these are
just GPIO functions (i.e. drop the other definitions,
they're totally bogus) except for:

  Function                GPIO group    Mux index
  ━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━━━━━━  ━━━━━━━━━━━
   qdss_cti_trig_out_b0         GPIO2           12
  ──────────────────────  ────────────  ───────────
   qdss_cti_trig_out_a1         GPIO3           11

Thanks for spotting this

Konrad
