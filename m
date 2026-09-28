Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302C4AA579
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595391; cv=none; b=fYKbQzBPfb84vDw3UHl7BheriE++eLnf8YtuV/yZVVt9/e1dxwRe4yzfWKgY9otglmHdV7dNowoRRUwE3m0JvO+DcuBCMrwOZplry9peyBnpriq4p8vIsNAckyX1k6RXa37NPkQ/REGAb9NDA6yTwih1dVc0EdHss6Bbzv6HRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595391; c=relaxed/simple;
	bh=ehKSWvL0hxT5BEnXgdVsXrbsUARCc1Wn1UwZt+x7T8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCN/tT42JHo1jWc3uUgPqy6pTnw9fDcJZ0aDqV0xsrr1OTZdO6gNagf9dQYgagHaCOoNtZc9hTfLud4jVKhRmiVzY+4pzEM1+ALvoVCg2N3IKWHa9c15uV2eevosECCT0fOEqJj0yJRTvHwy5BQ5+gfMlTAwWpUowplG8ewEDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8uy+MKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyrxlphV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8uy+MKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyrxlphV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAOcp782742
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=46+rz0Sh2HfpjIWSfCxKOuxQ
	neQiiSNP8Sg0b+IGsVI=; b=D8uy+MKQ0+DsEdIvquSifssaWhQ9hOiEX3kYkuDM
	M9jjZsh3ZBZAM5kFZmbUf5bxyv8yFaY5M3sUxI+VYkbiMCpCk46EnN/f6xzgigP2
	fv7lg1ubUIxw+KoyHnxeFahyTD64f3g3app4f7Y2MMg7CokmHMnzy1jv/iMnQW68
	4oqvXvqLaR8+CfGHNDLowr3r/mllw47dZm795VNvnLrQcHVAHd7wyQVRApJCdaK/
	n8t7JjxG1RLcIC896SLfSDyWDiLStCynwcbSRmYOPe0RBlw5oD184+CZYQDjkdUC
	mawMb9Q+q6wVGvyIGzbl9UIWEFVZjF0AY4jSCwa86as53g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4a8ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:36:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so869199485a.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790595389; x=1791200189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46+rz0Sh2HfpjIWSfCxKOuxQneQiiSNP8Sg0b+IGsVI=;
        b=LyrxlphVc7UURQOhkYXsS3lWyJuDEcln1fNJwMsmxsgt3rvINtfuZu0MrOc9nDQHS3
         osDAaEsy0fPirQYpeipR5WiVmmjir7/AKzLx2e0z3kiYtpLkKoHr50ZDsKIR3fQFrJW+
         xULnnTO8tZAJ/fR6HDZIZs83lco/jAIvloyj3IKZ33VpRaEk8fCq4pzdChbS+uCbtdXP
         Eqp08qLV2uprIxBXkNzk20qY65btSrSODjqVfLgepPXNJW+kU1B4BSKNddxzYRcaS7Dv
         C0it3/aZKeLpuLNn+9Q6+DYk9OkmT4PbC2Wg99xUlnM4EwoT6mzzEHmWvOa52dOCwuKH
         K4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595389; x=1791200189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46+rz0Sh2HfpjIWSfCxKOuxQneQiiSNP8Sg0b+IGsVI=;
        b=aIG5cZXQ+BbiWLWb0Utn+5Cy/T13HARGVAi5/TpHDISxylsuzc+rw9t9V/saBxCZ77
         jYHe8/BDxOpeSt6b+1a1AQlF8p44p55hSxf+ATj6t+DnZO88v3QOVPhnczC/Bi0ycuIJ
         8LGFMOzRUMA6GldV59wIj391QhIV+b+IqCvBcEN6QhlrI9j0K+JbSc9qOheTlYAyeVDd
         SWDkiKr1tBCpxyF6Ejh5xtemwtiS31SGLTrC3rAWfsDQt62Alk7l5xNML9S46tdwfJFj
         ZTP+nywkNaLdNzgp8107UYiNTEDiQ+WaDlyK57fbMsyhHeHPz09Zv8XDSrPnMUXzLntt
         ZhgA==
X-Forwarded-Encrypted: i=1; AKwUvBxYhvbFkxuN086vRlFBzMNjUJ+lKU18cXUZuUGcVbaMVOgKnXqgQb/Zn0/lrlNK5VXAqirt39XKrbo5@vger.kernel.org
X-Gm-Message-State: AFuF++nGRXEx5cJ5cWi0js614NlAjh1RVilG3Gx76gq7ehaHZy7CR7QT
	j0/aqIL+Jqm9/yr88GcSLlE7ExD0871uFnv/SBoerci8fm/VScyBrMcAWTlSQwyZZK78+Ys2sC4
	6d+BL6fiolc0KGOXjifcKeH6cbI3pjN5FXcujk7n17dcmkxBhqnSZV4KE8TxycNvK
X-Gm-Gg: AYBFou3DOIU6dzoQgzzy52/IfjZJ4fWtpwLLzePPpGXBqCojp6944wFtj6dJOVF3e2E
	AxV8VFD1IBYaYUS42eliXDf5Bs50um/t53D2tqQy91/frjwrwn4ORxfPNwD+WhT9oDeKTGaB2vc
	v0Ej2/MhJczHQIGqQMbW/TGkhOLiHHRf8g0Zs9lMfYR3LKa7FZGODmXGDY3l5Jh15iluQMP2Qgg
	+Li58gYceiVHoqfAzmMA4Rpr9WEDBCw8vKNvRuSzs8c4A3oMF33ovPMD3AcIYNLEgTDj4uSYwI2
	FuYGddgdkCasicWhS0dmh2x9pwrNpcY0Lg+Box4X2ODxT+OCLtcdGsTHtp5t02+OH0yJcnklhcD
	1Ud3VXm2ueF+9+c4=
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr1785437185a.49.1790595388369;
        Mon, 28 Sep 2026 04:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr1785431185a.49.1790595387711;
        Mon, 28 Sep 2026 04:36:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a008f7f1c2sm43908035e9.1.2026.09.28.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:36:26 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:36:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
Message-ID: <cjxdoxqc7744q7gbgkbarcuaujkesa5sd4zhwhi4vzlhy2s4i4@zzfalkwc54qs>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
X-Proofpoint-GUID: qwaxFXQ-mvSz66FH-f2OWKXXnPzp4j6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX7uA3otvC2GYX
 xHnZbxefpOnM78DgVSnkkP5dhbls464QktfTUK0khq6rby1ddOwRI9V5+XswNyqBSMf5BSJtpCa
 YaQ2ekrSsg7YtDGkuW6elA+opO9Rx4Ixl7GXFqr1jBtdZc2WpzBLBQZch4xHXjiF/19lEkzhKre
 mzSWa5CzMc4IENumfBG4OpLIQ6qkWlCUTYmKLDs6qZgJzZKUaA5rEqMHFqEF8YwURZeg7wMILkP
 fG1JEpzYp7emgi6RJWwPxTdsGQP++aNo92LGdJqYaNgmIJRjMoN+MPED8huaKK6pJcDoMMu1+hV
 PVIE8Qxh0PYVQP7cvdGYgHLcwqEnE5DeeMyGbxxKSWT7Lg+OEvd31KRoltAryrSPN4ix6r2aZ8/
 itMyCbXQbERs84/1gGbiGuZoDs09F9EvuIYQU8CFxJb9fFXaVzA7xZDEYGnLDzxCcq2HwnmjyWP
 lLJULXpTAIfr7hlOXOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX79a6zBzBIUf2
 CuKDJvodsjM9p2mqYEnHpZPeDbK2H2Vgbi6QmoF0FlVkcJ0IdUZhQ+/va5BlihzHd4X5YtUXs0a
 TUj1Z/yCrTH786e6KbwYWAn4dmqj0vw=
X-Proofpoint-ORIG-GUID: qwaxFXQ-mvSz66FH-f2OWKXXnPzp4j6T
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba513d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LJH_WNpccHY5IcrVEfcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280046

On 26-08-31 20:53:44, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
