Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032422;
	b=YRaDBnT8Fy9qpStX0jNqftw6Q2O7a/73bDWc1z/Xq07/ivJRYK9PIiqCQPybGC7FH3/1
	 CpH6P6o1IursTYdpo1ccmLwo6vzPzpMmrZztSxQzP3bcjvXPzpgHMWe0uWtj21Bq6NmWT
	 crOhaiXsGzVBPs21rlUNhVU8guifm9DlpM53I/8508bgefW379mW7YqhwKtqs4r97lz5A
	 t4sqQ4YzTtk9RAvI0kYBUiLlYHadWwSorBJezW6/7iys7tIc25pjf+ulUCF/O+4X2QTyZ
	 fHOsGgyneQgJKnMlvm9opxKbtG7qkDBGrIe1ZpvjyWduleVPFdTuujeAALXgRsypDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
	b=XHwMqnsIpo+E+cAy5JixZlQsRu7ZmiPPNMrexdh+uFWIyXf0nojCVPMZZtFnut0zoNQ+
	 vtHkLZegrVwvS5SWrwYK5X60HafVGKdKzk96h6lS9pzJO30YGF0EVqqmirEpbMJEEhEvK
	 q9R4sfWlR1OJ+jO5xf3eWCYSqPceeDgh/IPDjKOopbz0pFIhB5iFE7wKPewyIA/Res8YU
	 MJrPN9/L008rQ+TlvmvS9IEZY1fqV9e/0uUwSK7p8cQMqLDZOEHTsx3GJTBAsFU3ONvD9
	 rsM8s2oEp8hWd4BemBdpPxOBmu7s5vOLK4sg/z0s86inq1ZOT+UKwqADVyCXxJcQ+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwCZMlVJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQnzDEFv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD3606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FD3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwCZMlVJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQnzDEFv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvtYW3567364
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0fQGdln8uuwOHJNK5c2o0V+8
	2oadJJd56FQOhqoEA48=; b=fwCZMlVJrnzG8kbFf7KqHYafY0dAThM4IbWaFOBy
	QT3KsXlQuzRCEyQ/BP4gVJDJ4nk0L12B4ZfSaxJc9OIyfY5Vp4NrnzaA4FVfQ28v
	oWHEo5s3n7CQx9cLAq/W7oa1ZRygQwA1BRA1xNw7oOvW/dBVldrhTUzMIe0sLA4r
	yJsGXU/+WWM4Zgf4/AW8NVOUWz00bFWn57d8lA0rXGqBl6KUeEZ11CBqMWrXjswP
	M2gLip2s8RgnqzpgtOqbdQdoeglxgbNz0CL+L3vgUhMIo21tyO3i7w6g6EiIvq+p
	X6cgeXs/IvrE8D0TvIOT3JcxnUFxp0Kb5kZvXuaApycd9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y1btw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:33:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso13886785a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032420; x=1793637220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
        b=dQnzDEFvpC53zCvxW6VsoFGqcKg028XbXBqFCVsawPd1x6315G7Uy2J2ZssBOvlmfv
         +oxSAXmA6WE9XnBjXSf7DfMCz80KheRDaufSqgMqwZ+LWOlQh0CyZeTgCWnEOUXrd0ew
         +m/hp+HhRKY4mysaWLP3c687OZCOCik9VkuBaNt7IkW3abkPcfyu4ZluZghVSux192S5
         op+p9MUT4P0GoPRoN2xn/Ed12ajdRcR/8voRdNbnkTRYwhAePaf7tv26W/f+bIE5fe+V
         TsDeZiyexe3IeeXQLrlYk+lHKNU5vHITTSt04fCnEKokveVyIEQD3maVRbJExoQHbHvC
         mnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032420; x=1793637220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
        b=Z9B3KWGHmojzyT5r4kjoUqfMu5wyZsVHTJDNekG8Py8ClL81e+AVYORkemNYvGcc//
         jmQ1dv3s1OYJjPjfbNu8EZQkAMYsaVnXx0LXfmkOudtXoHKj6bnQH/QK1/+fPY2/Bpwu
         6Z6KXLadN0I00qXUj1uIkEneQDGHFWYH6+4B/mR2lD5n8mKN8vdRplyPSWDQZRH4uE1c
         /xrVMo+OM34ELPedL61rT4nl+6tdWifduh/YJ/vEpG84E/KzJwUSL0KYEQtUju/3KBfY
         ATDMZeScuRny/1tSUDt1ntiFXsMk5L7sS51M6dp9ve9tulnvT8t/tywNJKqID/c4DQjK
         H4yA==
X-Forwarded-Encrypted: i=1; AKwUvBx2fcQKijG7YHHjBwP6H27GzWjrVbpIBIoTT19eaEsd2bQFwNqr8sxRs2j4UnzT9YX85RbuKeVy/sJg@vger.kernel.org
X-Gm-Message-State: AFq9FYLhZen/ThlNC8XFTw8uFq6MSzd7xIjCHhncps2gfvBC2GFjUY3L
	X6xudu0sHHnbjMWnQnZYLOdzMC0424GJwh+k0UP9iJBpyHoOMyXiJfsQoJc8xTsZuRCRoLwmyK2
	WzX8/J1J+fpwcDpBipiar/lEy00MecktDmOzJiRxj7ThLqGGPc7lSObFnaWHfSJwX
X-Gm-Gg: AYBFou3cKj73/Htilnd3pdrtjtf0rjZjPZPZCKWQuPImba+texumZZ6J8iNoTT6bEBc
	Z+xRCmMt4lzhrRZzGWyalO31enIqykotsMVhJyYtz5aphsSuoGMCy4ADufSE7GIs3VKUfRAXdlH
	PnNcwWHtNKVCPmGiGFfDSkEVC79Bf2cSWzkfQZmMJszK2FGoLduLy0Mpb84Ou903y1MJK6MsA3B
	KMIAHC0MzUuEySH6bJ0BWDxp13I6s5zd5EZ3geAZc9W7U82eddW4yNKEPexGl1gI4gaNVUfRMfL
	ac2zNpqT5ljmB/ZtznmDtl8fuCL6TcR3PF52f75t4BCSrLd9yKm/D7mT0mWcoaSWNwlOi6XqdC0
	O9ntnYcfyHd3XG8v8
X-Received: by 2002:a05:620a:4515:b0:93c:891b:90f1 with SMTP id af79cd13be357-943f4ba8037mr31283585a.26.1793032420064;
        Mon, 26 Oct 2026 09:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:891b:90f1 with SMTP id af79cd13be357-943f4ba8037mr31278185a.26.1793032419429;
        Mon, 26 Oct 2026 09:33:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm16862342f8f.6.2026.10.26.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:33:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:33:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
Message-ID: <cx7qdacerxz2zi23ti522dtjssowumkbvtn7jmb7m4lhxfc4sd@p4yzdvzqrp4y>
References: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
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
In-Reply-To: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXw/l0jiodhwnC
 8TSBzzvQogbyLfxhiDu81QEAHAGmoGgDAdM0g9Bd6mj6PPkZq5VIlkljQIdDehgHFVxtuoYiSJ5
 Gkja+/wa5dGUlON1bW8GAAchKgoclKo=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf80e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2hiNXssHTY28xlfzKCsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX+NLEzhWPY3ET
 i5MVHkjJMah2Btw3H2qmA83djClPoGwYMKdeAq1DXxtcVW/ZfE5OXJaVWUjzrxNhPz4oXR394v7
 k/vDdKC3Kg/unLHvJZi+cRtfan05g1WH/FOk7C903WbiWqAuxjaY+YwtLxQUqPl2hv06FAZcxwa
 SqQ0hhqg3C57mIhwKJTeOeZj0zM/fa/bJtZE+Ubu+Juq+KswQWs2kRFuYJqDT8B3fOuLN7s9L9r
 79ZaoDnXVUNN+Wb3IhrVNE2gDFwFu2rgBGOolCV7sf0TF/H6teOq/eduxXP0OPZluxR5yOPudxq
 FNxghH6jZ8cPWciVDqRqJPLlq45nGhaFb62UU2RihapkOsbZAAxlcftJP9fGlst0xzCBArV8kce
 aRMlBGikBKg/TDouOzUBA3SpqdSBbsNg56WgFUxbcSVQoeW0WlEtdO/wevNqccNJGU7AboA6n68
 4tfbUeZsfjCHPUczjgw==
X-Proofpoint-GUID: DCv_jmS59TeMxLM79Ti1f18JhBABkS-y
X-Proofpoint-ORIG-GUID: DCv_jmS59TeMxLM79Ti1f18JhBABkS-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On 26-10-24 21:09:44, Tyler Baker wrote:
> monaco.dtsi does not reserve the DDR carve-outs used by firmware at
> runtime.
> 
> The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
> [0] builds its memory map from the SMEM DDR banks, which do not list
> them, so it hands them to Linux as RAM, and the first write to one of
> those pages takes an SError.
> 
> Reserve them as no-map, at the base and size the QCS8300 boot binaries
> use, as lemans.dtsi does.
> 
> Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
> with the downstream UEFI, which already withholds these regions.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
