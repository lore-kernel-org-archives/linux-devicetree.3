Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47483E7BB3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177846; cv=none; b=llhv1zVIvS3LGho8rx5LNfknoBrjZfLzw7iUCpbHBc4XUVYYsWXX4hLyYfwlYQeKfybGHRtPJcHg8CwXSHnq3GCN3M83z3yLm675FL1WxxN7b1Put9AiEwqTQdcjclcA1GX9scxqWxSUQkvKXVXrRm2/Pbb2h73EodEXGyV33/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177846; c=relaxed/simple;
	bh=wxd0z1K/jMxfFNLgwOXIm4LHEBf7fMJ8Se4Mlgv2iBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExjyoQ/FMmFa1ERGh7uQCtqCdzGDjdjnuNQ8W67sdZxpu6xfz+P9ju4CdcD1w0KtlbwLwvCxKm3SgAppi/05rSJpLbQvN74wyh4xRLffKFs+aTWRGcMdVtBq1X45YN/LbBHkR5s9/fS/MTfu/XAcl/QV2RlR69vf6JyNwqbf3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6NuDkJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcafSNF2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6NuDkJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcafSNF2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xB2Z263542
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=; b=m6NuDkJNG8QX8zcE
	gkdUhvsb9XlAjnjBQKBY9WZuctg3aYXqmiVABtIsgINfKBpZmcLKJ15MdECAlImY
	I56XicnQGmnU2CbV5mqPibC9gUXy2P3S0tHMO888/uOkE09riSwJ17q4hRwboUE3
	YgkrnT5A6ZWbUVAaOKWulxC3tQW8eqEqABqJCjfEgNu+Tb2lZBgf9mPX2AxVnGlS
	wXV7tREDML7XVXkPh6xeFj3r0xg6QssR/hvclZgcZU23prurIT8pe1L8FNLLvZYE
	BojTTHMxXB9BTktRAYJMVZY0x4mqRD/gKDODp9nEIER+IGmTaG2mUCceAUnbTXbI
	lKrSsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu5uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ded346eso15813341cf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177844; x=1781782644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=WcafSNF2Js622wI9yroqN99NEZPsvafcP5TIYOgRn+GFxqagStR5EJ5hbGT2HkQDnN
         cYKSq6l/ltWMXLh/l8jZaxKnBdBUumj+0NzwQpCsn7udUzlXLRKJsWB5PjnCIFRobxij
         JeX2URJcUqbar1ARcDkYzbXqNhBhwS7bBAkU/4bJfxUxsd/32BDuXeWRV247MWB3HwT/
         NJ4bmB/fx79pelffNMKIecEHWHHbdGN1ylwq7sCxV2EaCUzbH0OsplhC3g6Y6YRgP+Ji
         PeO58HgA2mYPDeuYQ9o7arE9S11Rlg+56DhM5voejMutD31zxk5Q+W7RBBgVnBNgsHVA
         1PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177844; x=1781782644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=odXYnrK+4OeKbUL4R1MtHQsliWQHPnAQtmUmWdd9Gan6AA4bBWWd0gC4xIcfbn72Kz
         X3ASVAYklLreR9gob2BQiFiJaO4VRVAdaOerfO9UZ2FNV1pe2j8+jvJQ7opnjEcE82FY
         ketnT2ouGmKDyVJCbdrug2cKJcLvT+94pgYyDWEphz65WFZfADOo2HbwXZ91YdQT0ABh
         ztcYd9tbRuub33DXcCJcTqgp4fW2kaaw4oGDqOfpOh728Xyu3oSfuG35AS267YCgJ3Iu
         qpzueOiQxDXP2mKxqZ+SRYPUYN+80yU04DL+8w0wjnqxjW91hQSZiNsVcgAnsRqo/zVp
         upaA==
X-Forwarded-Encrypted: i=1; AFNElJ92eP01bypDudpFBp8xXCr7YqxMV5WADfiN1DDx29lplpyFo0a6Yuy59177Jboj3f3gcXE+soTvoNhd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fUoI6MNENa9CRhMkpWjZLf/YLTfy4Q9hVHpbhsIgDWFF/O9Q
	yFDa9Z+b0FJiD5VpKsa9UoHUeZFUn9mL9926qOYvlG2ugMu+S2ngABiYiXprbvGmeL+/MVR22UC
	c/Xu7oequqJJcSEO8wUb1OD4aN/0kPbGrtnpPiY1iIp02F1A0PPKAiuZo8sjUG8fb
X-Gm-Gg: Acq92OGCHa6EYX7hJqSvkesJjAnnfVGf7KqrVNvuHx51nH39Xb5Ap3DfMrzlgTC3zKd
	I13PjMO3PHXn6JlozOqWxm5LFJktLINEquw49M8/cv0wuQvdmKBYJEGDd1+09QYvH0Oc7UNzNLC
	XkmaOztHOvZKBDyCD3f0MCj4cpXX9xol6V4CV5mRjtPNIgrWk9Cun6wgVwb5aPI91GJnU+u2w4M
	FWFO0Pk9Qu/a9hNl5jjFC98YiEavCZ84kvHxUS00zzW2aL908Zkhk0JsBY8orqnxHBJwX3yUx24
	2C8/m2pmqAnT21k7NTejVO+oVQoQ6cwnozGOqFI0JDMqyURZNRVdxe42CAsVYDE32E9xSIkF7YQ
	KGPUoKQYmw6Lvsk0DZhRHuISDGYX2uo27Arm2nN9qx7Cy0c31okHW4dzA
X-Received: by 2002:ac8:5ad1:0:b0:517:76dd:4c2a with SMTP id d75a77b69052e-517ee3d1a49mr23226031cf.7.1781177844001;
        Thu, 11 Jun 2026 04:37:24 -0700 (PDT)
X-Received: by 2002:ac8:5ad1:0:b0:517:76dd:4c2a with SMTP id d75a77b69052e-517ee3d1a49mr23225651cf.7.1781177843611;
        Thu, 11 Jun 2026 04:37:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:22 -0700 (PDT)
Message-ID: <1c2e7d1b-4c1b-4b34-9ed0-0b46a9adcc36@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/18] arm64: dts: qcom: sa8775p: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a9df4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EbZ0H_4aSGrsEeNKfi0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXyEGFTGK7AUYv
 WF+sjQY3F345P8S/KwuktbLhK3cfvbcKsKKxUzzpCL1PWgIrFU8vVh664hl5UtfD/xGxMcpS+Pm
 fVZHCi8vkVxU/Pm2Rz+BTglKxaXCWrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9r2GbG66gr82
 qkAu6WSGa5DAbaxbDH8yGtahuNv1rzYVQkgwgZo2v+ZQMwk0BW0fXgXJKdVj72BzbDFXKAXuMl6
 PFmsxIGuqAbi2RJgvI9ePi9q1cMtO7zwBhA403nzDj1rpnSPSpII0EqwimPvYCaBxTaYGav+f+a
 9Jle18RVB4dZn0EecSIBs96v4lJy6jyFmyFeN9EL/88mPOXur5V5zDFgSy7tl9ypi+pDi2z8xlE
 3tsazv3niJkX53B9sNj9PS9xfsMfaDSaKPpLWLQ18XyWtY5wXX7qyRCQXjFTpwFkvZr8Wd9WCP2
 ORVf6VGPER0btoqxghoA5Lw/URiF+T1I/l52cY4bIGGxXTuhQ8zllXS/bGkVhsTyV243l9KYk07
 YRfcljVkigeycSyptYXHDeSkFQnXjm+m2XcARtLlgXHjqCyiNA+b4JGX5ac4T/zGQ2aMWthO4P3
 lW0Ky9rC08lq+rvOvKQ==
X-Proofpoint-GUID: JOMZ8zw8rIeXIgaslA2Zssag4XaSDFz4
X-Proofpoint-ORIG-GUID: JOMZ8zw8rIeXIgaslA2Zssag4XaSDFz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
