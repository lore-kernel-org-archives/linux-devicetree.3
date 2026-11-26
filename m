Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708797;
	b=PC0Wuvub0xKcJZvWbVJHp3rusUjWJsMK38kJWmFEtT8R79KLe/dkIn1pvvX2DXvCykgi
	 b17BZbz0ZajQF4opBOHYhBaghJ6pK0Ryp1KS3qniVPX50oVSjR/xGbykWpjBVQqvyKdYI
	 U1CMV3ShYo+TJSyg84G3MsYeC6u+/9L/URezJKVw+c5EefTMF7KbZTvPZbc+qul/SYKbL
	 NzfDeCmHA/GVV5ZZDJWxkA/FoAg1iArHQcxzAqqsLzty2QiMuT3Ei0zQPjDejl6jlZ3zQ
	 PnyfzFQpnAVi0gRWAiLM+WSe4Db8BTRn2Y/duQ6L8DZyMX5EFGnUmTpTiXJ33ZPkvAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
	b=r+jAqDqZpIFpUYdjZD5iEMyE62QMGXAHNpkLsHFFQxkWUDFVZIYy5Wtp+Jk4sh5/qghe
	 tCjaBXK+lU+NPO9Qfgv1jiWe7lS51gzqZBT/poZwt6d5WKUT6wLluHgJpOHS/eh1SBoNB
	 SrKijP8jjn5Ui4UGzXOnhFC9T4DpSqVCZyk1XY/T6GD+T+IoQWJLdM14JL4m5o0VBlKCF
	 9hOu9aOmtrWjWe6V6nVq1Ts5k/VFfEyJXS1i/ZdvefRDmrSutanqyXhE/ThkwJq0eH2NV
	 Fc+V26B14ccnS9xhB1Dyk+7s+AhFsTQuCq67DN824IWLiQ4Po23tOn6GtcMoZI0kbRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhABBdDL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT+Y6Tez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD705606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD705606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhABBdDL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT+Y6Tez
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuaMC507332
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=; b=DhABBdDLvQum7O59
	AQvVo8O50yWYH+5zhVt/6j6Vqgfjjnij8Az8qaMhwCEyV3CPKRfqLrkEG3VuAsnk
	0FNCfNzlgWNW/xBcZqPfmY9lQQDOabPQHzkV77VHy03nfjujNO2Cb0zlE0e99XMm
	28NfwbtwNOiYDWAVV05jHM2VkSnvLv8pf1qKccyx/zQ+kAePPWp0xAcO+uoYue61
	vjPbmCDQjEkHNcg+RemJp103hjez7Z2Gb9bmgOD4Gkx/dZcgIintmjJuG92kCrxM
	b7JRTDq5zQr5lTh1KgnjL3kSpOEci+MBDOaoduULzXPBKXJttr9n+/QsTlCwIFES
	JsFuaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vavkpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:59:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1082741485a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708795; cv=none;
        d=google.com; s=arc-20260327;
        b=rZcslGgSLR7rxxknP9DT6sf7TEja5v47SxxVZjBOMgcIDU1ipSkNL+wT7RyjfoYw0r
         gyIufodX6d5QoarY5el8T6ZwzQR7Cjk69R37vuP1gtVy9Zewk2QrD/u2qQVDhd8YW2vr
         LG91o5XdVDcTqUhLmyT0XJDJyHzuBOmRM+mlY8f1prwPlJ7GdOO53x2FtIJC/9Ev/89T
         x+PhFpVS9PurDnEUG7jdBeMOKnYQNvY5DmphPr8pMo55dNCZ/FxqG0y1UzE0bxHtoher
         QgpXeiwGul7G+ZUJlf9vQCSfBEw4LeZ1qLK4ZOGvq1Pq5GJHzkUvWEdFcj8NkDykKZvG
         vQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
        fh=d4hQ9reidAnN0Va9tOjSdYHbW2wqR5xMVHuOWi4PtIU=;
        b=EtnyP2QqfP48QTpj1/G/+dRNvPeVyFSZaoHKcEuFHtxQu6oD2+3/X0pVDz0lt/0FAL
         UhH4Cv/ayjbgb+oDaGsr1VMxWDPpIgNozkd67e9EotZhP/KPA3Oj2dIwmWYW3CjRXCTS
         dRcblfBEIWpkArShApR8cMn0AJyB+eQv0aGtrM7MojOCJGw8LcA2Dm5b/FHv+KogRO4w
         xpTez287lNNuTQJ7IMowpLfaIDdwRNGZ86rznVXHXX5ul7YfKPJnQPPSqqi68JXCVfTB
         VxDTGzVZnUOZvW0klTqsNNloTDQM026kXefueXud2u64n71J/zdCSh24sGqRHPbBiWyb
         S7xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795708795; x=1796313595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
        b=CT+Y6TezZ7fQMIfeKzR2Ayn/82qAzLdh1YpUAKIJNZPrSx2LVBATcZwit7PO6aB5ud
         0wnt7UFMNo6uMxXg9Xv8IfgF6KlBz75Dy7Yrbbk1dJKTq70VVfmnvMMyorpqGFHDjC+t
         CeM0tHiq02YSKwuJ468cHRV+QlB8ma508eFOGJB259H4l0UArpJgQYV1XBUl5kVb7eNr
         odhI+xoYTtBgTxjrzQqGq1WE0iyYP0hqTH9Og/8qYp4chvdxlEs9JzMznAKdou5I0X3z
         8QuKTn3rchF4yeW3dpaYyUz4UklVGtP3Gunx2TUTRb5t+ienYNZY3NdUTrO7/ddfMOSj
         HHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708795; x=1796313595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
        b=ITEvfHvsKBX50opeKsI0uofTjzOeDR4s08vQ85z9jJAegZmRKBiYe/7nCnmMOTY6ZU
         dqf4jz549Vv16bl0kWBo4YkRC2pVoxugmoDdhNyXIovnq7NffpqFyfIjOjGophxPMo87
         M6Kfp9O3dTLIAzrWgqBCKOcTJCPOqtZjrS6q9eIUclgcOSD/P7xUkbiS0RpJ4+Gm2YPW
         S3oTxA6YfqDBnqM3+9k9IXcsP5K6QQpsH+T7BLB8VId3rVpGWMgl2DEYXmkja+ZHEp3E
         0EQLgNXx68YC1FGvz5hXud2n0uHIfj4ZVDi/zHfWA6VWWpSByEJmVv8J3799bX2w63Hq
         DpaQ==
X-Forwarded-Encrypted: i=1; AL+hErGaalSuVZR/YjBI7VYS98p6knnUWE/xmcxVVVf4klRVIrYiQhNgVcLls8tdQvlGtaiXUiirOkfSN1Qm@vger.kernel.org
X-Gm-Message-State: APuU4Z9DTn4oVzB1h4OULqpm7Z0hk7XVLKu+QTx4ebo9RkVz02Nt8Zen
	t5PemFtUXPbBQ5Tkztb+9lKsig7e+LGgWMOJpTMevAoFB79P+5KLzq7nC+gCk8JtK79gXBDGFXi
	dkINNRZeozuIwm6+L3Yv3FNzsp371Dl2i9PNmGQ1lJxunvtNcIQbOthvM06CwY4wk9gvB1Qu2Ms
	gqna+E9FHRS/yxxSUrW88qdAh4oCYMwkqo1nGSdq4/3r493V33MTd8
X-Gm-Gg: AZFdTZe+0KcUBpYwylUMgrZFJIhQHhP8F2dkcuXxWF2VRx520qiXC3rwqdaMsLPpZFf
	HOkwZ+CXmbMehTXcEb2QJHZbrVmZ+gqfj2xcWv+/9KcI9yCRIMrGBQX7WvLFudO3EnPRE1Xp0H/
	MlOSDYbtktvDbV7TMhhHlbr64JOqzp8td5nizlWBur8RjM/4Il4fZAGcSXrO3sZJ7IhHltI9jfD
	ceS7sExe1PJ88iaeWvVFKBcIuMZGPnJdZTzdbQKnHCC+P3ScYcjflMequHeMkPb+z0RfXEeE2M8
X-Received: by 2002:a05:620a:45a2:b0:945:d1b3:f047 with SMTP id af79cd13be357-949ba9acb4amr3818798785a.37.1795708794767;
        Thu, 26 Nov 2026 07:59:54 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:945:d1b3:f047 with SMTP id
 af79cd13be357-949ba9acb4amr3818795285a.37.1795708794291; Thu, 26 Nov 2026
 07:59:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org> <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
 <8a34e083-f364-4eee-9a46-9533647f323a@linaro.org>
In-Reply-To: <8a34e083-f364-4eee-9a46-9533647f323a@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:59:43 +0100
X-Gm-Features: Aa3M54peUk6XV8OD7QKnhkjRXQ2GxSLWWVGI6NCDtwyBprAYGTAHPkFhcVa-1Ws
Message-ID: <CAFEp6-09L0nwaRv-SQ2dXutFZwR1Vj56C_9bHXai8CPa=mqQ3g@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX8gQuJFNsPVh/
 QHsU/EB4V/Ms0q+maRgGQ1bzncb0P4Yu24AmtznSU/2SwYNOjhARF65HyZ/WYvymJbH3JgEI9tJ
 mzTEi3j/TouInQMyh/NTXQVb+UCSWmY=
X-Proofpoint-ORIG-GUID: CGEhwasHN_dr-JHAQXB-MeRtvKUcKyYo
X-Proofpoint-GUID: CGEhwasHN_dr-JHAQXB-MeRtvKUcKyYo
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08577b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rdiVOT_3p2XUELqUUpsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX+EZUvRAKYH76
 gZm0AfeR8loIeBaipTmiEJ8+QQjaBKWgFxYCb2gHgaVv/OO2lyDFHS2p3mHLRmsddDvSDYYOjKT
 C4+lqLwmOAMqWV2wLVullIEH7opLjuwsMjj9EPxBwthm6C7B5Oazz8oY4/r76uq0roqrtdaHp8+
 /6AUBj2SC0JAJLXDII7+1hxs3h0tEpILrxbSKc0BX1LBFRCfZwhXCT3HA5W/8Amey9x+VS44Y7J
 mVcNQfH4h3m+BmhAx50h/8eJeMQfUH88tNVsSQuSqJS00P6/NhrAxHJh0fhqONGYIvGEeeLs2PR
 z1c8wIacbMQfjodUTtOu6QqDzVtApDpmzfShkahr3Zj2pzYIZ2K2SIM03rkBYlQG0P8ont+1HnY
 3G9GWHybBcGNXuRxfNHI2/O9u6WUKPO6yrN7DJK1weZYkGhJ/nQ5uyuTFFLuVew+LDCE5lK3Tz3
 sXMlzCioO3n1oUQSs7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260062

On Thu, Nov 26, 2026 at 12:23=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Loic.
>
> On 11/26/26 12:52, Loic Poulain wrote:
> > On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> >>
> >> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) bloc=
ks.
> >> Describe their register spaces and the non-real time CAMNOC AXI clock,
> >> which is required to get TPG output frames passed to VFE.
> >
> > Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
> > the TPG perform any memory accesses?
>
> No, I don't know the details, here it is a simple experimental evidence,
> basically TPG works with this clock enabled and does not work without it.
>
> I believe the NRT clock is "cheaper" and good enough for TPG usecase, and
> to some extent it is a buffer data copying from some (static?) memory pag=
e
> sitting inside a TPG IP block, while dealing with PHYs requires more
> expensive RT clock.

Ok thanks, checked internally and it looks like there is some 'hw
channel handshake' requiring both RT and NRT AXI clocks. So fair
enough.

>
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> >> ---
> >>   .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++---=
--
> >>   1 file changed, 18 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> >> index 9c8de722601e..50ae30cdcb82 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> >> @@ -17,7 +17,7 @@ properties:
> >>       const: qcom,sm8650-camss
> >>
> >>     reg:
> >> -    maxItems: 17
> >> +    maxItems: 20
> >>
> >>     reg-names:
> >>       items:
> >> @@ -38,9 +38,12 @@ properties:
> >>         - const: vfe2
> >>         - const: vfe_lite0
> >>         - const: vfe_lite1
> >> +      - const: tpg0
> >> +      - const: tpg1
> >> +      - const: tpg2
> >>
> >>     clocks:
> >> -    maxItems: 33
> >> +    maxItems: 34
> >>
> >>     clock-names:
> >>       items:
> >> @@ -77,6 +80,7 @@ properties:
> >>         - const: vfe_lite_ahb
> >>         - const: vfe_lite_cphy_rx
> >>         - const: vfe_lite_csid
> >> +      - const: camnoc_nrt_axi
> >>
> >>     interrupts:
> >>       maxItems: 16
> >> @@ -226,7 +230,10 @@ examples:
> >>                     <0 0x0ac71000 0 0xf000>,
> >>                     <0 0x0ac80000 0 0xf000>,
> >>                     <0 0x0accc000 0 0x2000>,
> >> -                  <0 0x0acd1000 0 0x2000>;
> >> +                  <0 0x0acd1000 0 0x2000>,
> >> +                  <0 0x0acf6000 0 0x400>,
> >> +                  <0 0x0acf7000 0 0x400>,
> >> +                  <0 0x0acf8000 0 0x400>;
> >>               reg-names =3D "csid_wrapper",
> >>                           "csid0",
> >>                           "csid1",
> >> @@ -243,7 +250,10 @@ examples:
> >>                           "vfe1",
> >>                           "vfe2",
> >>                           "vfe_lite0",
> >> -                        "vfe_lite1";
> >> +                        "vfe_lite1",
> >> +                        "tpg0",
> >> +                        "tpg1",
> >> +                        "tpg2";
> >>               clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> >>                        <&camcc CAM_CC_CPAS_AHB_CLK>,
> >>                        <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> >> @@ -276,7 +286,8 @@ examples:
> >>                        <&camcc CAM_CC_IFE_LITE_CLK>,
> >>                        <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> >>                        <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> >> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> >> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> >> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
> >>               clock-names =3D "camnoc_axi",
> >>                             "cpas_ahb",
> >>                             "cpas_fast_ahb",
> >> @@ -309,7 +320,8 @@ examples:
> >>                             "vfe_lite",
> >>                             "vfe_lite_ahb",
> >>                             "vfe_lite_cphy_rx",
> >> -                          "vfe_lite_csid";
> >> +                          "vfe_lite_csid",
> >> +                          "camnoc_nrt_axi";
> >>               interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> >>                            <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> >>                            <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
>
> --
> Best wishes,
> Vladimir
