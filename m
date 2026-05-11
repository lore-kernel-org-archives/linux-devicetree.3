Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1672C027A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480261; cv=none; b=VaOIUWao+fzK0yxCZRiHTH8YpkOJV2RN9XP+A97aUvPfdk+3dJhhzgxei009nZIu15DoMtbxxisJ+idbnInI+5aZm3ZGcoOBU0BJFiFn4KLav+1ki1bJ7zidw94e+bcASg2tgKmLEA9TNZMdVooyzj5BgB5UJ5fp26mUdck3dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480261; c=relaxed/simple;
	bh=F5pftz4nUbpl94JSxfXZG/o12H52F+RH7Ub3ebKkx38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R//iXDEuz3ktjXFpXDQQX8PyEe0UaSKaeBbYJzT3yAr96ngDIMD3LSJhdQHu/7Ojw8ObZJq021nTK9HBJbOncTskEu68TRongTwhzxeh57GdRPZ6ovqv6bWbEGnUbn023MIwQFrCw9ynj9Unbegt0ZbbSPiajHeewW8r0ApzZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldaiBxeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql/2eF9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldaiBxeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql/2eF9e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4At0Q3279170
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=; b=ldaiBxeN6B2UJi4v
	RkfgGLFCe4/NHqdkLrHu8o6xrAUsPdiIAUlw1g58ru308yCieBs1Gmg68fUSvA6a
	b4qeiWyb0sjXYDcQAswpscQYYGktp8izDswNk5VoRYFqpuFj0geJl/j5Jqc8MOJe
	r055bZUMikdCQgA+ANtQSecvU5c2+ezPhaB4taoRMAQY9LOsFFPWfCupPAJApOdy
	T7od/jY0GIslGNUzhgR+w9jSXpWQV90PliNerJrDpMzx1RoM5OGRs7FUdE0AjYe6
	FShXD+B53pkTmi+kw4a4e7Wkn42ck/J8lQhdtTZaKK9BbMzoaqE4NbF7V1xoP8Vw
	WXcFwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpecp7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:17:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8375e2df478so1959571b3a.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778480258; x=1779085058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=;
        b=Ql/2eF9exI3n5kk+jMkjfuLpqKfnEXwy3a+Qw0t4J+i6Xq9WZqQAXfXzgAtLtZnJgj
         LdmwT95uQjBTKUDLa5bmsXPpvZpihp1bpUfoxxj5p2HJ3mdOTrecrjQ6s2ntCpUuaImW
         cciQnibrFF9cUnX5v53AownXUFW5AVaKpvRRvRQ6CNYhMSX7e4owXBN+6GtjaEVYMHSb
         tSOPCj2gdWLzvPO/Kods61zIflEFtksqzRQW+wIoX1//AtD27Eyz6/MatXVVRhTz69Ms
         uhMpb6MAXPBVY8qdPmtkpvM8EoIzw65yoNb25+bGvqM6y58H0jMjwt/BCYKJtZBRlzoI
         BOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480258; x=1779085058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=;
        b=k0QEqHGTx5LQROCR2rqRnvVLpq0D79ncopmCXU9mH+g9agqMZetlgDaLQ9Pvem2tlU
         30a3T6+IFoIi+AR4Vblm2onAawWNRLbXshfGvVZJVPj67C/cRerDaFGs2aR+EoZc0knT
         zGggTmfTiZu/P1QChYI799x8Em8vi0eZfz/GAE5tlQicLfyJcPGikH2F/Ri010DWgSQD
         DgzY0/UgEkrHOGu8imDrRDcqecocOW4vcoWreX8vLywsFVQ7t0/H9ysYTZD6RZMxd1E0
         zupRuwQGx0Fs0Y5qV2KdJHHc7yZ23SR2MTvwtQrzTX9b5PjQtnAJgsjxAdDTPeoJlRAK
         a71Q==
X-Forwarded-Encrypted: i=1; AFNElJ/QpIGcfwZVjadW4IuqZNp7WVwo2j6r3BbD6Xct86iZTW5f4PxMkm0DuUBHM34AN+Zvv4QbQHe0Ephh@vger.kernel.org
X-Gm-Message-State: AOJu0YxRUmwVpxb0rJjKZnBYj5vZLnN3XfvlnrWMHcZud5XEfr78wcm/
	uQpZVZf+0iU+wl+cR58DwjUB1KCkNW6V2AR0OPP0dFmzZAtn6wAts1agmmY9oWxKG3IdEEYM573
	IeMnvwSeZzVq0X5Te3J+vp/dIfq9M5kvQg+GOCtDP/M9Jr6aGnisSg3/7+HHU+RnP
X-Gm-Gg: Acq92OGKviekjOqUAGbNXWhOULyEusCGons6HQjesUd69hemMMxOhkC7+Z4uT2pJPo7
	EciqwiC3eAwmWEY/hIRk5ZKlEEzhZRpMXO9ALc2A1VBlbFZD1Jw6m9DrHdgVS3YS0iv23b77whQ
	t/wSTvg0WFhwaEECs5bagHUYEd+E/LElfmhwHOa8qdNac5AB8WpqS1CQhKOSIuw/QhSkhZx5Ixz
	+etOHpRI05pLWKUKo1gErE43cAVRPfvPvNiOM3TR5d9geSl+7bEfsPLEOf3uhvo4CpYWDDnBzbX
	zl2l02W6MSl6wRTlFVw+UBKLXAW+tPwGOeGji4tPDjmNbp0hzsn0Q2WQED0+IuC7sdpDczwHWno
	LVKi8bGC5/tlcwjYJnDpsr29TPAY8oBFsFTN7pll8mIpejtXAojylZQ==
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr20275825b3a.17.1778480258014;
        Sun, 10 May 2026 23:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr20275785b3a.17.1778480257415;
        Sun, 10 May 2026 23:17:37 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm23840864b3a.21.2026.05.10.23.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:17:37 -0700 (PDT)
Message-ID: <a009cd46-0a89-75c4-8b10-35b653ac8fec@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:47:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s-TF3O7EiKv4j4dQ62OWtSXC3mL8gXK0
X-Proofpoint-ORIG-GUID: s-TF3O7EiKv4j4dQ62OWtSXC3mL8gXK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NyBTYWx0ZWRfX1MAfVNigUmS4
 Vg/sEOeTkkAUEPLgsnAg0AIuRJdXj5yYvowpxFSHVLna1iiMl8LpYTi9RJ7jbmHYc3sHMVIlUpl
 lGVnUV2gd14TDcyGvLsEcN8w5AJBf1qhw8ooH395q4Dw6+xTyfoLNgh13CYDsBbSfnXxbhxyDlR
 Y64v+hM7TSGvr+etQ64pcooipDOGQ3Okq5B7JoCZ/NSaOJjfY+MOWG8FU/P3B1xlh/y6ETG0D6e
 EHqNESNFzPSgKviKO4FWMM7XM+2WQlTQZLadb0hQN2x2YF0w90dyNBT8HvgPHNsdyyFM3ysgx4w
 OLtQrX3oRxh9AolPOYA0vLb7Lj7tD9V9xtzmAssBZg17tx8VEbagOHVxjCI2kUzxPr5k6RvrBik
 bgWu5f+bYt8YGvyM/FAt8V9yjIZ/ENzopxFzDhPLL0slrenlIaVoVP8pFps5rhQWgzInjYivjbU
 7O6txkzOeqxg477WKqA==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a017482 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=9TuWGWrZIemhly9L:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zf_DQBccePucUUHqg_YA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110067


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index ef7adac3764d..f438dddc19ba 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  	u32 work_route = inst->fw_caps[PIPE].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> +	if (!hfi_id)
> +		return 0;
> +
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
>  					     iris_get_port_info(inst, cap_id),

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

