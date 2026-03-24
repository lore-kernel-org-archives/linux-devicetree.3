Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D03DD527
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345216; cv=none; b=Aa6APHIiwQHrn5R0AWLSpB40i5/cemM/V2IprUO9bA4qz8DlvMQIsSAF61CJcDJ9E/1JKuaSArUhHYcxkoL4is7A/V/D5lIL+gpI/v8GDXjpGxf+Tqeq9qXG0N3CcZQvyWFgjN8jxx1ohPoWpUh3HodTlT9DkJo/siEizsNyDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345216; c=relaxed/simple;
	bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1JWTg2uOjirkhW8iMHmw3R4fg9+HHfJGKp85f4pjhl31u/L3O4PxoI9KwlQ3aEBszytpxAyobuNb+MKjfsd9QWhxC5fEOXAHBnBgKigRgfJxxPexpwZ/w19Zb/S2zT4kKR8soOhpHyt0aiIzIothZeEv/cEguiD6bFbIE+45Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBYikzRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ/cQhTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBYikzRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ/cQhTr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3kWFe3170748
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=; b=RBYikzRFVWKo1wAd
	3dLqM9UmVoyINmCuBRBa4N2rQecXgbGq5vbwARPO9H8rBCT8XW2OOcgsqzwXkFA4
	OcNoSR+OdRb5gYL5leBnjqsuA4/qF7wBnxNXJmWaGajp8lJ+kUYFgSZB+yfoFxhx
	o1XnAQfQX6Q5aeHkADrvap2VubKWugr9Y3tUJZj/S7HJ2daYPQyYw8Ix+F63ac8W
	LFShuCZ7g7HpwGdxfww4z6PrJIga+P6zyrPQ/NMdqsLS5lIJ8+aYsMM0vAMiqaXK
	n+L1P738qfm8g3nO/bXdlh06bWG68RpAkA15A5tyUHnQGxBLthC3VBX4G4gFR80n
	IQvENA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2421a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:40:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so415872785a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345211; x=1774950011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
        b=cQ/cQhTrrFvDdt+rN879SKTSSTvxb5ergkisBw7uwSBFvDx2jwYRMML1TIwljO/H6w
         T5J9DJqSvwmHhgYV7faAKFLonXlaPV2+y4MXkJKQcgUXZAQZpP5T2gK87l7hiCRvhOlR
         PZB3CasnjEvSf9OaC2+3b8x8+LDf5B6E0PWX8WQbb9US9M+Xas3aloo5ehnGCTTTIQi3
         VR5Oil6r9HJf5yeuYFr/4gC8Phb5RqsNfFdP5LSuwdltUSlWAgRdK3ZQGKvYygobZi3X
         LCgezMyfKGEfp5Sh5H02Z339+XbWrfFDcCG4Kcb0W+jwi/dMQd6ijoZMyz/EoawSewhk
         V9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345211; x=1774950011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
        b=OybGqCASDOVv2DlfvOhMNsTIBfNDUtmOijSjbqqHPCfn3NzSYFc5urKgFod1A9C/ZO
         pa+gGp8EiVTibdNRJoeupYfChtd9oizMssWQD0QtIFlpgYN4AdwlFGQRJ3khoG9Dqumq
         Hu1ZICzPN62HvZHg2mVpNXXxKLwnz6I663DRKC+/cihgBYDs0XwGerJ2apbxjmOBZkWv
         nR2quMC50DCFIwScWF936Lp77YmtLPnJ7lYU3keP5QujsDLbV9x16yt0/dFBJ75IR5ij
         yiDahIlyF5tzI8JYjVSVmVemewp15xrVaglqMyehNgO2qq9g6nxFwSulu6ziMQy6mKy+
         /yyw==
X-Forwarded-Encrypted: i=1; AJvYcCUvVfns3tKNYO70Bk85J8UgRIKBLCaDjDq6ap+AghPGUgqYtDdLqQIhw1A+Pc67BMsQZNpJ4UPBEBju@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxCH03vJlpO4IDi6jHc8oov1uuo4Fyd7OMTV8gK+8bxjVNyT7
	m56g4B2KxIwHWzpMEACaZUq2+USTnHYn+sk+z8SY4uLtTsRGLgH/7pkLiSh/xv+7EiJ7JhAbPab
	VfNQjUjg0hfvf0iXu3PSeHPCBZYCw7BMwR/Z2OxZcZiibdUt1ywK6BCZhtVtGXzLx
X-Gm-Gg: ATEYQzyfH5+6bldqrsupfOd5q782w8UKK/y2Nyat5/LhaHsPL9I1KyIdJW6CYpCETr8
	g2mDiq3ogQjef4Nwx3G/pe7FA7eDA38+SaVb7lHliEAmuqoNFDXrNsjNnqvH27Al06YUriHUd//
	FnsanXoh7JjCckbf1EgFvfiR4WbIqwI31tKgexP3VNtTBiOn29rvvzg6SpzfcLXWFHHQRFHZE24
	SK1m88kOW8FStlotE3mbWi6TRM3E4TyRvwQuvLywEkcy/xDaHl5VfK9URxJLJCXn3rmHUOrwWj/
	/zLalYoYcBOkPNLLi+4rgyr1WhXgVPSoKHaJmV7dCwTyJFe5JMN5wsTInDnM/DJVyJed5kXqC/3
	lIECfOidwwxB6B96j1843WB1pyXaxhhr7hITxhBjzut2Jfy8nsc9tcTGw372g8/w6OWSWZTGGfY
	t8yR0=
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr182543461cf.6.1774345210718;
        Tue, 24 Mar 2026 02:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr182543191cf.6.1774345210210;
        Tue, 24 Mar 2026 02:40:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm613580166b.62.2026.03.24.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:40:08 -0700 (PDT)
Message-ID: <020a891b-209a-47c2-a769-77197a257098@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:40:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Amir Dahan <system64fumo@protonmail.com>, Pavel Machek <pavel@ucw.cz>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c25bfb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Vgcxg6LKE1OHo-dCjS4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4BUJzvsTbc5UNbvuPMsMLlSwUYx8iKdX
X-Proofpoint-ORIG-GUID: 4BUJzvsTbc5UNbvuPMsMLlSwUYx8iKdX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX2abF3+mmcqJm
 n+PQtk/MSdAV2rpI52H7kO6IP6jdqzs7QgPDD3UFf7YosJqa1w7AlZez53MxMeXB47enrXBEPmg
 ambgPh5aAgeGdiNFGji2KmcBAqRF7Y81u7d0iPy70YoPAV6bJU7Ks5Gmbm8uJ3LVSXAd/+PKPv0
 wHq6EQX+joTWKU4BKln3LQfMAsVzIGPax6THPbOyZ9u+Olhh0Hhy/hBZe+rk0z8i3/eqVFG62HF
 Pcn4LsEImx4EzJh9FZBz1qmjCeilFvmWV3268eiPL/bN6ZDxrnVoLT32ktLKV+u4kBToZr695sT
 m8czTohZYY4ga5s/jL7mOvviXaibqpq2jaPgQQfYdcXtPh0PswzaDjNk2hFSpKwz5GbuUlrJeuW
 nf+GV4ZYblkPRgd2K9XpXji9k2MynhnGIFTByu3IzjAjoeUAuUuFjgF/HA41aFYzrfw8dqKUD0F
 zCLri2GWXF7FUyDLMEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 3:13 AM, Paul Sajna wrote:
> b4 got rate-limited by my email provider for the last 3 patches, I'm not sure what the best way to send just those is now :/

Send them by hand, --in-reply-to the cover letter

Konrad
