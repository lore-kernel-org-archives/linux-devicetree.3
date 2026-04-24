Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6329BDBD
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049548; cv=none; b=fAdyrO9ALRAtP19VsFPQiwE2TFu32V22hKRw16T4VUI1CuBi2Ny6KcQASQd9YPOgoTttskwVxHli6hly+TyYKxEvaSEsatd1s6Af7Z1hbkrg1BxPowvhErxfmOimK9f2RdmR6lV2qtPMzGHbnHdoCTJtmpiAeAtq3PAZoaixZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049548; c=relaxed/simple;
	bh=9xSazYawLTJx5H1mtxuPLWvttqXrXwEJAo2WZiAwZh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=og0ufYjxUOhrOpLc4UsWS6NiOykoOSscm1MEzlOL0TApl8IgLxFI16/TORYuo1rL1EyxIdf9+zv8NY0W86+PUpnk0QQDqxc8gPHUY3TVRjvcd+HyUaNvd77ikWo1hRbIRHzB6I8NOTCwj9edFpq+v8iAN9q9LaPrl5MW8SpArdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACOTE603; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZKyeToP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACOTE603";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZKyeToP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OGmkGW1028614
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	It6sYfKSiD01NnfF8Za0t86txMFNyiI2QETDX7JZZdM=; b=ACOTE603jB2BH065
	54l8eUREJQZBzJQnBmC+6qdSvIUlKxWLxmRfSdEczuxGWvsfXJGHRpNVI1p0tOp+
	qOrEtL4OoKtLBmvUCS6DGb9erYeu52RhC3KkxDE9XCNEO/ANoGKOu46hA7tn58zB
	6ud3vhf5KCJueoLkdoDJtC09NPzut3u+MDUiFgcjFIvBc1Co/yeb4Ywe7L/6HTc3
	mpSdnXxRkw/DOxmSw/ckixDTu+aSv0GfyTwpu4+0iw/Xd1R2eEwhnV9vS91+64PS
	0K8dEO7mNo3UtxEs9Em1oRODc26vIdywW/Wj7VJi92DgxP9dMavEHNirfTy1TPFy
	gdZuFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drbr585vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:52:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso9601050a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777049544; x=1777654344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It6sYfKSiD01NnfF8Za0t86txMFNyiI2QETDX7JZZdM=;
        b=eZKyeToP489wxcG+nxXGQtDTY2kW+ltIqI9d12wTB+Fv5tSawtrbXoXhVbXMEP1AUO
         AFArfKr2Kbctrt8CUTlS5tFmUa8nEKjAOsvOnZsL5C+kNpdJh6GtOV9q5F9pgdsxm6Hx
         XVsR2r1UcRZLz3zVnEylxj7XkM63HKMDy2w8LGAO2Zu3s2yH+clHtlB4cFygXsa5s7li
         DxNKfNt+NoEHSUEnEVEKocnsrMJIpRY2npiRIU9lUjSnjP854+PQn9pZDgJQTyT9KWAw
         QGYi02IwmTnbIFDOCY59hfgU/PTSopKzy1QVtCu3oSX80Joj+aOu/+Zt9CNJvoD5XkOE
         Gj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049544; x=1777654344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=It6sYfKSiD01NnfF8Za0t86txMFNyiI2QETDX7JZZdM=;
        b=T3vVzx98/WxQDAYcXuXQxwACLVWcZ8GlbPEzeR6hATlGW1yOQ7RgAyutODcHY9yf2A
         L47e3YMB+29niBDc5HSygm3QERW3bxk+sPSUmlUpk7uqq/Kk6+RWHshY1uVaatP4IHZI
         a8WW/IzZ8B6+on5v6MdgMLE9EfIfTYyTgtw0dU0eMyTUQ+v2FZp7EaEOzRWWL/9b4LIz
         q6HdBpqtCH5v70/0rnCQermaqjbLv817z8QCzlSrJopkmTfD9aWvf3ELtD1A2j/ppdIi
         vf/WKlSF30CK6LulxrNTcGkT3zfj6XWoIuSV4QnZd92KTASu9nhDZdh2+5BbO9dz4+Jy
         aaxg==
X-Forwarded-Encrypted: i=1; AFNElJ/HPgUIsNdIvmT+ujSKR1Dp4eR91hdPGiXAJaHianw11GfHtZ3RkxkWmet7E6MOj+6gRH5QcmW7A6QN@vger.kernel.org
X-Gm-Message-State: AOJu0YwbygLs9m/qUw7fsnQwEnpc9AGJLu/0EZibZ84UVJi9kzoMbEql
	w777KaZDsGMMd9bcPyOw4ztPdC2egrAz6bc2q1UuzY3VrJUeOpe+ISsA9liXcpwTQ4yG084qr0R
	JpzxIRbbAMtMnxMYo4phuHQ4wfvQ0COH7AHp4nMENiQPtpFdiChLQissv7fR1ggpE0SxnSz8t
X-Gm-Gg: AeBDieubjGWb7yQfBn/5OeCcVQC9CmWy+k4KURJxeFhTYUjJz5QPECAHHSloXeyOhC5
	jkiZpzvsainDQEQPK5Kpyt1r7tcTnS5sk86nnWBUethjQmZmfLEZFuXBxaEMWFrtQH10MCjp/AW
	Zikl7GrrNawCI6C7i9zc3xeOtR1UHsCCDKxpZMxD+4DwCe3WfdQAGEQBylibzxxZU3cZsAiUqxU
	P5T9zbgdep/DtixV8XfkDD0UYjwERzg9YLYAiaC6FUzjDwmXHZjN5keLVhExvHBIBoUDiuXtV7a
	Fd0p8mtHpXtSS3wkIXk+7q6S54E7zRhQ7spJ5chEfyJwHSw6om16ZcKWL0Pa03y52tI+q9BYV1U
	cnCmH9fLpq19fZxwIO4cO5ZAQXUfMqRPg1kWJolcUq8y0/MbIHXXo2MfSEL/Ce2P/Hnw=
X-Received: by 2002:a17:903:384c:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b5f9fb1b9cmr319062125ad.41.1777049544193;
        Fri, 24 Apr 2026 09:52:24 -0700 (PDT)
X-Received: by 2002:a17:903:384c:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b5f9fb1b9cmr319061815ad.41.1777049543591;
        Fri, 24 Apr 2026 09:52:23 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30134sm236758165ad.30.2026.04.24.09.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 09:52:23 -0700 (PDT)
Message-ID: <62c0372c-9683-487b-af53-03d15b4916f2@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 22:22:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
 <c38284d9-f7a9-4a0f-a4c7-cafdb1a1f720@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <c38284d9-f7a9-4a0f-a4c7-cafdb1a1f720@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE2NCBTYWx0ZWRfX8xp9uGIhQ2AA
 zUVst5BhVhCcjNfEDV0DsUzL/3QT3Pu2FVY+CQT3uotz1MEwQrs9A0V6+fWp2Xptmle6fNmu6Ji
 3GqHre3NuoGhJB6Ib9vP/3JoYHuu6Dqw9ZZnlhCcKwVe6EoOG+cjaVC3o/gJjDegzZTzdTOSOWd
 vHg8Z6ShKQmt43L/V0C69DS9YotlsNRkbl2sY6m5GhTV20PiYut+Q+jHWqbTmHR/K+FJLoV1mRg
 ns7EjnNI7zxhIiqMHpBGvDJRGniuadBsFpB70jdNHp4OsZQWqXjMog1YCHTkQcOef/Cwb9OVGlL
 1wUmEGRQD7oX/2w4vzq6nQcv6E4g7ultJsNxn7cc24xtvqIag4MlkCaVOuAEzzywQYsauriftC3
 NRiiLqEa7o2J0MQqgmh8+sTEjkanXSrO/z4LA8WWdCxj9jnXf+m1mpFy+i90Kb//92Tf880hDbG
 ajePS80mv8ghTcq2AYg==
X-Authority-Analysis: v=2.4 cv=bftbluPB c=1 sm=1 tr=0 ts=69eb9fc9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=DCeGIJpHnZWVbLPzD22jCA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=418Utox6nRxWSOscvWMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: IgiYnPrwUhtCD8YyJFJ_R37IIXsitdzg
X-Proofpoint-GUID: IgiYnPrwUhtCD8YyJFJ_R37IIXsitdzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240164



On 4/20/2026 9:59 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 11:42:49AM +0530, Viken Dadhaniya wrote:
>> The runtime PM functions had incomplete error handling that could leave the
>> system in an inconsistent state. If any operation failed midway through
>> suspend or resume, some resources would be left in the wrong state while
>> others were already changed, leading to potential clock/power imbalances.
> 
>> +err_select_default_state:
>> +	pinctrl_pm_select_default_state(dev);
>> +err_enable_icc:
>> +	icc_enable(ctrl->icc_path_cpu_to_qspi);
>> +err_enable_clk:
>> +	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
> 
> clk_bulk_prepare_enable() is marked __must_check.

I’ll update it in the next patch set.

