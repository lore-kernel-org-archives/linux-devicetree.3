Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569860;
	b=OY6ypFvPopBa1WZV1AVTxbcWAMSCezktnKBKHKRCA/CpRZd0HuQDGbMc5vv0OPo+D9Gu
	 SK1eFxDA8anWI6I/EMYOlBzOtC59dLZ+FQh34At0qpFYNceHpD2/AsFPVkoAypm9Rg9ef
	 NHs1MCe7y8uf2rk+B3PWrL2PoIAM39s+rro3OmsivKy6eVAw9cv1ye1kEgU3TbCblb3H5
	 tqMQuV6gQpWYrAEHmu0j+IvTgOmBqzlXLBnDeWCpgNrr2Jsf3Bt+19wt2jy+9gflGhJLY
	 DmKABZW0T49kk0RxnUcNrLvoICTrY7RS9D8PFz1XUr3+KtTc/0jjGfcWynNSqovDaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
	b=FrHJbIrIgEsb7OYOTVNT3LgytUA0Pv+hhO3WaxCGBR2YgpApzIDVXQTiJkRpdI1I7d+r
	 0ITP2ixYnu7yU8AYT+aZZlyEHTv7TKFa0JzgPVmFscgwROiBeJlzF5NMtD/matvWh9lyl
	 NdXWDBWRpZB3cQtv09mrmgSQGkz+SKHBvvl7vsQryUh6kfbt3VtlrxZYymhzlbMUI8/tH
	 gvnYFf82ogUkdaLQoVNJivQiQ1UMKAl8knI7u29YKUfmhWay8hydqOsIxNIHJURpqQOgZ
	 ohk7sRLBf1gpiiS/wngh5mvEYjp4qG8iiCRSNy8b8vekP0bh5DVQlj752zgh79oNGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrO1mXf7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRyQHIqR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CD4606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CD4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrO1mXf7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRyQHIqR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1jr3926222
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=; b=mrO1mXf7S9FLD5rt
	zKEStQDCnxwR4ZDxHSlqz3JTMFtg3oROyZU5AEL+R3ooq3uwBCRJeyqdJLHRCRRI
	Yje7ETm+9urgF9k2KzPwRzNV+cbyV+Vi9zXzVPtHdBmydn3WLjN1cXLOUY5oYp7l
	0sYyvlI5KgIqc5PhEtyXtcVoBtlbnpGa6v5XuOZfjjOPcNE8fHV2jQSb8LaYUz1b
	louPFnH5RuizqSBpbwmd6CdWh1i9ucm1fIkNULWBrbKBUsDUeyGwKYQR8p65/Pei
	RPMD7S8ks94DhKIL3V3hNZk3s5yPSG6vWFXq7SALTpBpz49CknchAmL0pwvnTZJh
	0wcElQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2c9d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:04:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e58614290so9653085a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569858; x=1793174658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
        b=kRyQHIqRh1abyHBwXj9qN2pXyLNMPAdpUqEUtNyDDOpWat1pwCbj5e5fi7saFrlfoB
         9rWuvqhzxXAh33b8cp2x0Q/fanZk+wiGjANin+99KwOGv3gp9noJVsiorJM/YwMDNvkj
         xsemtIrF9CwsML1IjYBByuppZpAe3GeArCYWgt8S7iPl5P3UGRlDgeWbwdSyKKmLMxo0
         ouDZ5yZU0cWVUSMm8VvNlHomYfjlDxb4zx35a0UpkE/Uv+4nR4njWOUp4IQWTsyFYWzB
         KDB0H+o+XrC9mSbCBlYD6W0lIMNvGaCdEiTuSa85vet8RgWohJqLFmQn/7OtS6UbpbUB
         JHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569858; x=1793174658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
        b=NMo1MLSOMWzpbrMPTGFpcQFglYJLdULRHlo9J4WM2WuPYB8uVIwOUZiXj1Ifqv0aL4
         yJ8i9og9CB8kuHF0brrhZCbRtzzxcNQe5a8a5n0w7YnN08EhTDRCCnb1tGKcGLTPECr1
         QGS/etFZN0hA+Xui/D9KKj8WOFUyCLY2UqEu+tfGSUzSUq8DHLkVWjYTTkUyLpxi2sbj
         hUVfanO7aomKJj1j5yXIa72exZb+5dxJgNWyVR9oIMW6l9cQCwXAVJxfQuH8AM2n0QFW
         hDnk1Lt68T2d7noNXH5akwldz0q8FFSToHmEoKSAllxLOf6APyPFaJwvLL46OZP0wqD+
         cXuQ==
X-Forwarded-Encrypted: i=1; AKwUvByMkFMdJW4onSAm0deZXuF8aySEhkL2Sdq+TWtzG2bEVdYNaUU8WFFfMOdg6jgQIpezqn8k2IfrKx0L@vger.kernel.org
X-Gm-Message-State: AFq9FYKiL/D0d2zO0W4PqsizAts/1qE5dezxzmHgLrKEqdBT47es+zB6
	FlUhSt7Hdh/cVcwFjX1/+S3SK5MRQhzq0CngSil9e8COV7H3RNiZxvNf2kPRPEVGjh61G81vFkY
	x8iudj84/A7fKh4LtsVsOaUkQXVx65z2vLO492SAWB7hIhLfRnaLU7fWO8tQcKmLt
X-Gm-Gg: AYBFou1F0s3ugiwNcuq9JjHBxUa6DPuiSJPV9gOpBcSOLYrS11VMu9YeOk+u2jKmykw
	206WVv9qvuvVwhJYzhASwrQ3oxAV7SegAfhOUNR9/vfDR5ZvsaHjLTkKmMRriJv1DPlOkjN0yXm
	GG2UGI67q15y8YU4N3994Yb85W7NIQqvkgDKeOxFFRilHtlOLpk6KZQF84kVuXok4KIbnLoocBZ
	9163yT/iprz765khPWicvO1zvbf7VXxjxpr8Mlx1M0Ds3C8y68yUahOgvGv5U0MEb3LkkC1TT5x
	PGv5iv60Tn9FF/gQf01jwNpAvQr8Puylmi14RkE1ar3N/t+nT1LHqMPxWSWmHA5wgXuvtEp0ob0
	VsyYj5ZMYttpcis5Qix5Dlg==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr324546585a.3.1792569857902;
        Wed, 21 Oct 2026 01:04:17 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr324544285a.3.1792569857519;
        Wed, 21 Oct 2026 01:04:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daf5bsm547898a12.6.2026.10.21.01.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:04:15 -0700 (PDT)
Message-ID: <b620b2de-77dc-4d90-acd6-464a85ec674f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:04:10 +0200
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
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while the
 PLL speeds up
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
 <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
 <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y9eqjuIlMTtiIl7VUQUlqQiMHWp9dd1P
X-Proofpoint-ORIG-GUID: Y9eqjuIlMTtiIl7VUQUlqQiMHWp9dd1P
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87202 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zcdO2QGPM5nA-iYd0ZEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX4E6Uhjw/PZYy
 fwpn1KBjivm+Up2xuG+02p96UoBgiGOOTgjh9jHBg7ZB0/6ad9dqnAjmhSnoBQ0laBd4Yl+cBRc
 IWfrhS6bg3vP+VZkkD+YsoNXJbW9KA8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX/zigZxBbBCPJ
 26ZYHAwezbLdh/bQBYb5Jt46tdC3lI26vOaeQTP0VxvQcKV+xoKPWLxwotLFfi/uLKYCZZv33dS
 dvv88q4MoaUZb0t+26XODmqAhuInnBs9KUX1xH9Qj1UVZoONwb2mXXbmLhRagTqEMPXgRp7LMYo
 PVwIAK2smU97VNWYpFxjT/d9j1OO2t+hf4HotO7ArmO6RnXFtjYhPJOppzz96Tj7Gad/MvAOiGk
 kO12f+jkdBDFKkWCeFL0FMHTOdVqNxd1e8GsgRAm160BwiIly4LOYKcDvuQeRJm8dis4i6WL4Lz
 AzptjTRjqZnah5rmhWAgpCV0pjCIadPoT3EOqWkYUqbdo0853PGOnyErdhC4w4mt7QpbZZewzNb
 lVUMHR45qNXFI/bGoA5JaFPVimNmfqON81SA1T7Vy7DLbCf5vQEOC+UOQ3mwxdZQpJoGQVYog7C
 LBd1jm1nA0UIOSGI1Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 12:10 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 20, 2026 at 08:52:49AM +0200, Konrad Dybcio wrote:
>> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
>>> The MSM8996 CPU clusters sometimes run at half the rate they report
>>> after going up between two frequencies above 600 MHz, and stay there
>>> until the cluster drops below 600 MHz. The PLL, the muxes and the rest
>>> of the cluster clock registers are all as expected: it is the ACD that
>>> latches at half the rate when the PLL is reprogrammed to a higher rate
>>> underneath it, and selecting the ACD leg again clears it. The driver
>>> only moves off the ACD leg when going below 600 MHz.

[...]

> Downstream isn't keeping the main output below 1190.4 either. After
> pre_set_rate(), cpu_clk_8996_set_rate() asks the HF mux for the target
> rate, which makes mux_set_rate() set the PLL rate and then switch the mux.
> So the main output follows the PLL up to new/2, e.g. 1075.2 MHz on the
> way to 2150.4 MHz, on every increase above 1190.4 MHz.
> 
> The main difference is where the cluster waits before the PLL moves: downstream
> first lowers the PLL to 1190.4 MHz and parks the output at 595.2 MHz, while
> this patch parks it at old/2. Both are lower than the target rate. Following
> the downstream approach would mean reprogramming the PLL from inside the pmux
> notifier while CCF is changing the rate of the same tree, which feels incorrect
> to me. Also it wouldn't lower the peak.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
