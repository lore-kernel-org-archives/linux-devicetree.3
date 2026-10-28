Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191682;
	b=nSUAgnBOJfdrSKXFoDdko2It9zJCwhV6faUkoOXtapU48iz1d+L9Nc7HuFv7FP0D1HKm
	 69oXtXDIstavdeThNOoz9qVyPg6w6fr6v4XSe2mcmbaUdDFhhj5qagRFKqh7OGb1Vgopo
	 0YFuPW5ZAbRl/DIVwAejCBOMT/YUJe7R/o52u6e1mNF6MHtnM5LujjYgvTCm1P/zadZr2
	 n81ncirfYEHSf2cI0/xan1Qcg2jcijp3iLP86wJrUcM9iKeblJsdlpqnhNYoXstDvKHef
	 CdM6iPH7Rg6Y06g3lREFykfW6dBB+yxD59nA8qTkbNBNlxD30v+JcYMUlVq9lxqwlzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
	b=XvHASsXWpX4yoR8pYpwZOb0EXhHY3qkPhxCn2OvqpuWGXtnu85mleG3QwHElUrh5q4qc
	 q1a0c+QqtoHxLdcAuwLZVDpIeED9ThCvnoBjfABy3FmurmVOWQCbB4TkDHMthJt3UojSi
	 aqNjWu+KG3eXc+MfyZsBBOysWhLs2F94RdYlFGYh8I8G8BVCJAhjhhysDkP31BqGPN322
	 syOMXblTQTIGVRdVJ+ftRIzBAIQYS/oAvM/UoZbIICGnE0Uek/RChpcTKuFqIw4W0VR2/
	 L7jueZQ1wYdDThWBcLUYG9CCFJtsO3ud6PPGp0pe9BtC3qSAeIo/tRpEvET+vp8NRqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/dAt4b1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C952606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C952606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/dAt4b1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4HZ3704248
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=; b=U/dAt4b1vCKJz4R2
	1Mlby663Hp00rQgi2nW3Y9jB6nBqLctbracDmSB6Xj4ySTHPYv0k+qeR3hhr0Sqs
	2UJkHfm2bHLBJWrY93IMake8ERgHb4KtnN101wVPbwczAOrvCkOHVtnUVTOp1JJ6
	hQ597in0/dNY9pA7VN82PcIFWTRvyeryckbFi+kIGgRvhmYOVuJ9mjuuPs1VUZ/x
	MmPd5zRT5uVpdzqsrgBCRgTIGlvVqnwmJPDEPYarIZ39p0UKr92ey1mqHNvc58W8
	X8sq49s6pxhvWvsj6qOVtmE8TvsyFOzI4l8C8ZENejDGYtgp+glLfzjkqng1kSh6
	Hb9uOQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7147ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so2614930c88.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191680; x=1793796480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=XdMEZhGsC08xa/HoM5cUlqv0b/EBViQYSs5FZlc5IhPFfYqC2xHwgTxh1gnh3fdRDn
         mKBEQs8RSmItWMxwaxKCCOWOQPojsbEfs9xTEmYcWZYYW6ZO2MKj8hN7w4HuufZ/NLhH
         h9r0HFAh+b2O1zOHtV2g/RsMG43/bpY8Y1xsJxaUK3u0yskLUBjiz1kj8GwdjaDWKzML
         Vr0acyj+EwqsykOB05JEzMQID83kM6TtpnE7p29Fo/4Vl8yOHnC23Ca/fFL9wQMXuLz/
         VopE7X/yeR/1MFUsjgzhDXfyo5R2Ce3Q0nLr+tL4QLDr0zeBms6vrA7lD04RqGyOluge
         2HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191680; x=1793796480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=H8hpmTRjkGzrQCkt2sh+L2OgaBffcStL8ezNE8Ptx/CaUGlzIAx+XMusAAmclpn3cX
         pmNbsi5PNjsqrLSlpTJAc9UbBS3fq1Am3Kd1YUEaldOtVlRIV1+xgmVGm+t0rcpXt9rB
         CalrQXzWayHqJG+kgw+N4usL2fCQj2711/Gqnk8im5evghck/mm1L9kzrE+JYeDGL1+R
         ks9wwHbnQgHIMqedZZ5w6IG6zQvR9Q2VGIzrna9M56DRHx9J6gLwE/sWPt60czB2M0Re
         dGlu+pCqO66yqnP8eP7ixxpAhiR6NaokqBJRyXL6YJhsCgH1U+H1jeWkQ8PAJM8nRmDh
         sO4A==
X-Forwarded-Encrypted: i=1; AKwUvBxMm61BVlh2NTbKW6K4gP9rT0QcDvbvIYEmNAgKtiN7SaRZwLHgLDabxodzs0PMAJ1nEPBKiFrzHHFn@vger.kernel.org
X-Gm-Message-State: AFq9FYLkbhRk2DKju+1CHtzPpjVXepc7SM03iqaagESriARICUNFkQUp
	nlym/jzNU/xgEjHzMRld8SNK8avaYBhUCRl5Ujz5vzX2Z5W3+bicy2nD9kI2L/37iqtBwlTsJvw
	QIL6+JxYke1GtG5uv8oyzWrehCsyn0zKfqMuUV8HOYl4aryzXWUkRYvhymeRskAuV
X-Gm-Gg: AYBFou068z9HuLhJXDjTS/gFHeeAlxOWSutHpQlUWWPJy8Ij02/PdXw0C3Ej/uF+RLZ
	V10idmAJtOkxz7MlNuF3oJyRoY77imAITYWgMYIwIWBv7igonlGs/eNshW9GUwAos/8zJ+4YV82
	s5HtneRyCDlDuUnY/dJBgvGhZ1S3ExssR/q0rRuivGzowmb3bcScHDQddzkK+Xoy37G3ClQvOGU
	RbYahugYKaGBivetP0ihlHf/M5WTiBqpCiVl7II90XsPvBv0IxjIKr7OB/X+xQY7AQY7tac2Tqt
	2zUNd/quQqXuX8kBLTcrA00CjxAc7rSONajN2Tpa5+eG2U469i3kNBgiQc0vdchMoIiuBXr6GVI
	3+mAqahkxpcldsIVfkPIK5NOaaUfklBB1ld8Xm3ipkLCyxskRL6qkuFMLuTs2S9HZ551o460unB
	Jst/5RKi4I
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873297c88.31.1793191679536;
        Wed, 28 Oct 2026 05:47:59 -0700 (PDT)
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873241c88.31.1793191678889;
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm8546468c88.21.2026.10.28.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Message-ID: <fa7ddad3-81e8-4c0e-a5a7-74434746bd88@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:17:52 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX/y88XMA1lKNo
 1imz7ygTvznChFDinZi5eQ1EOVGQZy/+Nlt7HnWuWrJd7ClE2p1daguf6oMzl3b15W8u7VTWYpk
 tQsgM/qWHUacGxavVITLSJmONrtnKAHItRFwtlSrKya+3vdD0GovSjIXM6VeKMCA2Jy+aVWYoC0
 BFa0lVOrG40xxFgDqdOEFOIQnE2HSe2l1fm6miVoPsA/LQLaWRskca6X+hFmNruU6MdU8wUqmTO
 HRVTo35GcVnxxSDYxSsw33SKIGRb9znF/8dX5ZPldQrVPqCn/4wotSvlQjtBif7uW9UrHxWNIcL
 4fjb/G/VL5B+qTh+ZpT97GXcoK2Q0MX1mYX0/bM8rMJ5KfELKi0wZZiObJKFYBqsOxs9SPbbx9X
 Ps9Ao73HEwUa0063UE7YCXxvAiLh/Yo7G8+4H+uY83Xs1TdE9Xf14/WizyhRLEbd8vS+d1hooLl
 5GdB8PD5xa4IxZfAfBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXywR8pxq2tSEp
 48/TmWfg1d2wF4zzTstdSEJ8A9qQABGxyr9qiKmm1247jW12wvrot6bbxZsWx1b3VTwnFaJhNT4
 YNzSsgDw62fPQEp8YY86X1FPq9WBk80=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1ef00 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lZdmFDQy_dSNCzDU9jwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: rjmQXT4Zrz9mwz_PWbKIGetoqKHtyBUH
X-Proofpoint-ORIG-GUID: rjmQXT4Zrz9mwz_PWbKIGetoqKHtyBUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQM EVK board.
> The Shikra CQM platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components.
>
> The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
> via the cpu_dai_fmt field introduced in the preceding patch.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com> Thanks,
Prasad



