Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572014;
	b=qo+WWE4BMmSsAVOaHYHc/JJh5D8+Jv/X945wOZiHgnVyNOLj9/99YQRu6vws3MJqF+tX
	 M41yt19NCaQ6DFsWuKCw2urHG2xSAwmFQXYcb3cOx850GzZfcXP9CRuwW2kdhPpd04Nt7
	 /9t9cDsaE0n4spg5TXs9y39B9/7eC48J8hqq7ifXrrc8XnU3VlhuQqjxPUiJT8iH9Bdrz
	 5IlFmbSKPn6HdnkBX/F0nRpb83bqkpxe4ZnfMg9vWzuOuUXQ/XoBzN029+9LqYyz3F5I0
	 QSWlAYZlG5JT6WZ+d86L826MByiRi5G6ALbu7lYlADFYM2baWbgtaI3u37ZQpB5ziLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
	b=PRHAPCr9iII486FLBAzwbJGutFYcbvFwSknebSILq1hCmnanXe3aWeymKBSRjsyMHge1
	 6hThyx5/RbWMbDqwpxR37200vk/N3P6PAMvJBA3L+5aRAagSLDOboxaG81X3FkKjpXddb
	 P4NTiDu/qW/2ao4r3rspWk3EkHu6nBXP3f9sTVm9ms8aNGu8yzOhHVyOiAg4GkOd7wKKh
	 bbOUpFj6aY5IHPCZVE3aghLYeTjV0Db2S8mWgqu6cL+GcaqA7XNRiE79Aq8njz+EWeEhx
	 ymi9KxKT5I6MBNBy2sFK+7z39LPkzUxcJBDFhTp0FAZFJ3xe7anVLiTEN4SYbooX98w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RT3DAxHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BX7/cPsp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C660A5BCA
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1C660A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RT3DAxHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX7/cPsp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJcu2848275
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/bsu92Px2Xzs3mzwAmuQ4TO9
	HLtINGRv6UJpIugcPNo=; b=RT3DAxHsBuN15IMm0uOKOO6VloQUq5kLeZzhVcfV
	N6PTAxKu0uwP2EnKT/eb8iP19wxCD/ie69QtegI3Cu5wmKqxP2p2m6gx9fMERCwX
	I+QZFCsaN+U9bfJG7j046x2ro3ZDTE+hlz1rgVK0qA8MrvkqTDFDezV+QyR0IHoE
	p6VdGdRWWFbtHDTbCUHmeFIZlDQeRuuXtV+TIzv4vItdYGGLBZjvq/yvj7Bd9o6G
	KxKXUSI9Sg4HLCeosyKAHy7yIPTd1A2k7MpArJX2zUPFF4Nz/NtoPZHH/v9o/0Ex
	rsK3GAonS5zSQU7FWXqp+cboZHetaxuxQqHGES3Xzq1BwA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ar1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:40:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so2020702eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572011; x=1793176811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
        b=BX7/cPsp6cjMuIqkRn5wHuROkTbTjD/z0i2jUH+Jt8aqEvBcK62tXb8UGaj3c5DjoI
         ewjnAeWprpvUMWeFpjuYDcLryDkyCyf2CgoPbwVg+hMxLWkEhd4ZEf6wkG17RifHFmhJ
         KClfiv4b9qVtD7lz++hxeziYFmJYOM72PXVnAHbDKRv1mLeRGM6K04tjkYNjo9yzEZrk
         2B1lX0uyEdpMwbCLFVyNuiasMn50Ri1qGSlhRwsiCRO0L7RighnWmSlOkMeLbeU1csz2
         7SKw07sCRPVIPz4vc3ctotoPxR7SvvukQRdO90KSKR9sIJgJecS8G5k3DbZtzfKLrpK6
         jM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572011; x=1793176811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
        b=bJy9MOVY0VcAxVggaDMGWDFaKbKIrWjUpYOIMnDXcHiPrjdtFR+tbn82qoScMBd7F+
         QalcQV560J28dVt2jMkA0bNOe+xQI6fdQAbdkMP5KlsHK3jFntDgLODUDO96q33u5+pN
         lp1/mOobstqdkkwkAABZ8ceL9Uwd4XQPesPaDkSQR0SAT0oke4jEukNujZQmijeiTKwT
         CSLCSAps+qBN0AXE3azOLiU/SDRiEqXUBx9g8r4PF6ZvpRTjz3glStur0DnZwIF2tTN7
         SaSas33RyPBZKMMDKK5dShLRGKeoScpDtQ/8F5KeJ7gU/Yb7iZZktX5WNC5uTc4KC7iv
         Y6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA2qEWzht5qA+106r3ITIwcEKJIq5GQ1XohJDLQnM780/vfthDVUYVPowUSQ7m/UGPiEAjHimX7QXZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIRNXxYV5VBUWTwuVuJtTuFdH6jciViiW5NGF4npZnbf70TRGBe
	tyUHxmi4TcBUV8VFfkaRsP4KZ1QIrE76jE+DSs4jA21JESLRifHHb4yqGGQPg0M/Vwp1k6TMS+e
	4u/MjE/5D4X0VlysrCXW3ySptubETL8Fd63QZmNJ+UYvjwhbMro8nQoO8o1Vie1jY
X-Gm-Gg: AYBFou3IB17Cm1ZaJnpFEDedDExTdTREaNE7vdU6ix5bh4ZXMV40SE8AWlM1FGb7i2c
	PJja8Tr52Qnwt7S80xjtnOO47yMnPdT32CvbDmywyrXILaPXNumSOt82KCnlb/YbXS8bZOg4jyz
	FD8ZwL3b0wOTyWtD3k5MZU/RUoE82agJ0PfpmCLv9vQTRVhH1HKFEV4nE7x5i3OxUR6D86smqQe
	NbhQSvbJvIfHkwwrd/loMECORtbLRBwfh2haQBwtM6PwS46aDuBBidXaDJwORdKzwSRO2WfM3hW
	x4Y350hodyv2FNOa/NX/yzYBlWR6x0KnXwNz88m7zKjkFjt1L0pBC4iKEAWVI1N8oVT59OwktZ/
	5sWf7c+t7gwvAQRxsujL+mPnx35R8/aSuuSiWofiWiFI8actlftFON0H02ggqbKpsweHWZ0IqjW
	snK+QG+NthNv559FIhLCvzdgi/lXvU
X-Received: by 2002:a05:7022:ec07:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-18dc065e242mr6244534c88.20.1792572011218;
        Wed, 21 Oct 2026 01:40:11 -0700 (PDT)
X-Received: by 2002:a05:7022:ec07:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-18dc065e242mr6244485c88.20.1792572010671;
        Wed, 21 Oct 2026 01:40:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198e2d6sm4749009eec.22.2026.10.21.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:10:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <ath6Yrtq4HSGU5R6@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
 <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
 <ecc66886-1989-4e61-86e7-fba6555c870a@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecc66886-1989-4e61-86e7-fba6555c870a@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX1Xce6FFHVrAL
 s1ojY9SHL35ioEPOwjp83Q5Q0xQSkzaEV8bO5d3PnwK09DnVVUvK4nF8PQHEWL0AGjsuqo50M4z
 bgztPZoAoMXSizMd/mtgqhB4YGieNlo=
X-Proofpoint-GUID: eKSlo169Ls1EJtpEaKzrd_t9ieUJ-TKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX2akYtl+Ww9F1
 5XBDy/LeMkp8cZ/ODT4CTAZi5xApmYTLz4F85oM9JzZt4CHM5c0gaFiEN9y2ae35g7U6lqHpWta
 u2Z9Y8VAamzsgrdvBOMjY9lt6jNwf0V5Oj8bE3jJqGJCP2uTkwp3Wq57efeoWP2GrAPrxsv0e3A
 ieE5vdkRGdm9euujrXKkz3lNQfN+48OW61ukg7W3uOFuWytT4VkzS3XSC0XQ2luBTcs0o95tgUE
 EvDncA2p2Wgb7wNe3RVqePBDLQoFzqIkw6UMjNsjwgUxQ7HbcZSLNlxzUxzJev/L+m7KSDwELuE
 +q2JOxGqQuyaCRu0sz2NCr2RKdUyd/heulskSbjPh1/7RbCc7+R0KtTWrJs0Fo8QV15iBSDujAq
 +PNzanJlYTBIFEu1V7fmi9H+looFYmwJRMY7gwqw9Wk7VxcOSr4tBa7pjnKrpJQh+2jqC5nwTuB
 nuFrFUyGL1y04/w4CaQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87a6c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g1hkF5I6mjiIX44rm_4A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: eKSlo169Ls1EJtpEaKzrd_t9ieUJ-TKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On Wed, Oct 21, 2026 at 08:17:36AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 07:38, Varadarajan Narayanan wrote:
> > On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> >>> The OPP table node-name pattern also matches peripheral OPP tables on
> >>> supported SoCs. However, it only handles Qualcomm CPU and level OPP
> >>> compatibles, causing unevaluatedProperties errors for generic
> >>> operating-points-v2 tables.
> >>
> >> But the select should not select them. How can I reproduce the issue?
> >
> > Sorry for the delay, it was a long weekend here.
> >
> > With the attached patch, I get the following error.
> >
> Does not apply,

Sorry. Have rebased to next-20261020 and attached, please see.

> but exactly that sort of opp-table is already all over the tree. Just
> check yourself.

From what I see, SoCs that don't use operating-points-v2-kryo-cpu for the
CPU's opp table don't face an issue. Since ipq5210's CPU opp table's
compatible is operating-points-v2-kryo-cpu, it is facing this unevaluated
properties error.

The qcom-cpufreq-nvmem.yaml change is approved in [1]. And the change to
ipq5210.dtsi is to address the feedback in [2].

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260703-lively-intelligent-raptor-5edfbf@quoll/
2 - https://lore.kernel.org/linux-arm-msm/06e6868a-c106-40b1-85fb-5ebbc01eff16@oss.qualcomm.com/
