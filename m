Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054B3C7E1C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436974; cv=none; b=GmRbDZ6usWO7Omxl/ivfuZF4KRgMQdG18Kjq0TF3LItMWYfYvNtK8ny5O3qXB7wTgiU0MBfFihGyZ51MC9Ju5hVmaTprM54aGbYkEfSF1Z0dy24JJPB0ehQZ1WdNUmvkoWkjT7/t+ee8I4asz2lQM6gVOABJqWFhIAvOJ9K+ILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436974; c=relaxed/simple;
	bh=skMDzRGLmL+RLYn+0YoUEH0DRrPOB3C3eYsnAREruSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9qBJqLrhxt32y9sRAm9GH0uTBIEXswadbkBk2h0Tm7YAIuI19XiTM2DRxlwkXYsEuAAlEN9ZEZdBvPKbDsDYN5ntuHmVxn/hltXxMdks63Tr3wAnjxIWtajre7VUjkCIwjX1DRAxkBD4JI0tmYbRPge68muOws08Ku3NNm790g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGpa3P+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMAINK10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGpa3P+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMAINK10"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA2s0V560040
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfLGrQX0KfBi3itj/xvxgbMtp+4f9Cmc6FRNiEiB3j4=; b=HGpa3P+s7lV+2Ulv
	Nd2NiMtFdlVmSy+zdbpwPqlBJS5EogBqaBjlQxMsx3X9dn1UPi2vHnoPTyO/V1q8
	PHqI9Q+ogNItYJ8KmmhhfXkMtwtuBVTj/ePO/nuLDUSZb6vZjC/25laZ53nwSgBL
	sbPNEtsp8q87v1oENn6akoLXfisF0H4q/ePH0HH0GMTg/GNlvKN3BvrLdNpdBlkh
	73/AxTdrlaVCziC/3/PAoInxGONHklNiLeR/+2NJq5cv5oaP03oNYTJ8mDMDStIC
	TCFd2urIXQuWMRi2LRgHoQ33DjEL3QADsV0d0uVAkdtLFFPeXaub5fHw2RAAQoub
	CSkaJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2r804-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a01982dc5so56481886d6.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436971; x=1775041771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfLGrQX0KfBi3itj/xvxgbMtp+4f9Cmc6FRNiEiB3j4=;
        b=bMAINK10PTLgOvwWCFxi3a8XQZ6CKI9qTH5A0ejWOe2+V/TgXH08xhQHQY7P2z8Erd
         4MwBBvb7GnbEaF2XszrB5pDyLUn4s1l87cvsHhSVUsqdr1cguPrjqO6UVCtM/Aom6g8o
         mdoq5OzU4TL9cw2kRdnI981yWdOoMBG52A++60bM3+4w6hTSbrzmHjgJmgUIQ+GSyEkO
         K5tJjGBHCpZruQts9uUxkd8/JXwt5XNCzJlJ8DWUnLKo87mz4kR0rgza6JqfEk9L6HWl
         3zuokELzteuRTkfC6YkqO3iUygR26FU3cz19zWiC0T6TLlt+WwFy4cbchSiatmox8FsG
         +80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436971; x=1775041771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfLGrQX0KfBi3itj/xvxgbMtp+4f9Cmc6FRNiEiB3j4=;
        b=kSCfGPDApxquwqv3mhqLEJTzwTWsIRDIACc+JkKgWL2Blx0QiG1PwOiXDsDABhqDLG
         MxOHL1iiRP65Uaup64pP6C0rbk5JthE64nbMPyJ207y9UtISSMzWEDME4Fvvx/usfNaz
         XF+xGmt+c/glh7sCgsssjibiZEXRs2BoFlYhmoSuD7wgyaVUrziyvQPwoKu80vNJxrJH
         0iA1rtpk1DvbI0KRWjYZf1Sasd8NbLhNcCxhISD/MdMzUXtkvGCieeJXu76YbEgU18TZ
         Q6KQPi12yZy4BDtyRh6HKTX/a4GnyIxcGA2BOQpywXFSlVPKtOztES47q5w2Q8mW58cy
         e/tg==
X-Forwarded-Encrypted: i=1; AJvYcCU+G8HG+COp4KQ2+fUlIWgTSkvh7lUVW0GGi3Rh83MjGU++abjblJfwUBjqgpirB9A+NMmj9pcVb0VT@vger.kernel.org
X-Gm-Message-State: AOJu0YzprcN6BexgM/vNDXXHarh3cRsQjK1L5A2SLd/At8DDWS4iHRqW
	JrmKZTtvWP568sYBgK464/a+atoHWzaP6vWYsS9F9lFy44ieWIYnKQ0RY2yV9KF1W6r33L+eyi5
	RVJjakMO5hIQgsbQO2BJQmALcBukuFtc0AJnDWWLemPiaVqPmoarxjO40f8Rs6W7pgwkutGuG
X-Gm-Gg: ATEYQzxz4eSXglVVeu8iNAkcQyqZGkdBUCCRH/8LE/90lzM+Zxs2nC20w+nUf/AaM/b
	MxOnGyailc6nuOWBsrfV4Ke9MMZurDS42NrBrH8y8DRpJfiYQxvRSFmPb9JWPXW91KX+wwP6jjZ
	soN94E3CkKPmtgyjkKn8ItdVYZh27LBnMQ3VumsEi2Pv3qi0d89I4ad40MG4ULkdyI+zKBSswE7
	pZw08IoV2tuzV7QS94e5+31DIsgXLcVL1peL/AcSWiClDwVp29LbRp39XVXhr/4xevhzlpiJyyD
	RVTSSxYvEu7cAD+AtBjS1Q9V1xkFY0tJHDnASYAEkxKiOAzluY/txcTNEeY+A542IfeTBcxf2Q2
	CS2SQi7nt4yqjI30Pb43wahgv5RwD17mQBWBeaEuL7IH4tUXtk1y4Dvz344xPZhZJEWZglgjTvq
	fI+kc=
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr27280021cf.9.1774436971171;
        Wed, 25 Mar 2026 04:09:31 -0700 (PDT)
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr27279481cf.9.1774436970567;
        Wed, 25 Mar 2026 04:09:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a33e0fb64sm2042794a12.12.2026.03.25.04.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:09:28 -0700 (PDT)
Message-ID: <919a157e-84cd-4588-8557-64542fd08e7e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:09:25 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX67jl3IN9/P8A
 T4X1/5zSnoUxP7dO6mf7jlPA8ZMYR/iWRP6LyZhre7Wo4Is/f8dMnImW+SeS61+sKg62Xr3lpmx
 ek8pDFLkNFG1/ULfQgwPDk2wxUeWaHFL6nphFyaKIe41mzGzMvZDDTx1HJa7GjHDFKkt3F2dAGW
 DhRTN46Crp69/1TgeOZLnwVda82hN/YJURvGJsAXCzlmuKyO0vfQTeHpzT3L4DH5QzgoEVtewM7
 YNaVJoRFeTBO3ru+JO+28O5gTJq8AcMEQ0kt4ZsRc/8kkCYxzH8il66CyZGVuBsW3uVeM3sVkFN
 njHVdHV9324M2Xgjxvg5UuptBzH/7duSL90hsSngfVvQGrdLo2+obs8FL3fQLpCHQr8chlJ80PQ
 qsPSymdnG95wlkyxzdV6igeN4EsV9pDgkMzN+rA08+Fs/rbkmd8R3DiGvSGkXjaLA+mqu0ffMCV
 bLMQiCFpP6xOPyiabhw==
X-Proofpoint-GUID: cPFRPHU1CtsamItJ-eNLb2h-J9TKFa26
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3c26c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=I5Wf6Tv452McHZCWETcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: cPFRPHU1CtsamItJ-eNLb2h-J9TKFa26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +&{/} {
> +	model = "AYN Thor";
> +	compatible = "ayntec,thor", "qcom,qcs8550", "qcom,sm8550";
> +
> +	gpio-keys {

Please override gpio-keys from common by label reference

[...]

> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +	status = "okay";

nit: Please uniformly keep a \n before status

> +};
> +
> +&mdss_dsi1_out {
> +	qcom,te-source = "mdp_vsync_s";
> +};
> +
> +&pm8550_pwm {
> +	multi-led {
> +		status = "disabled";
> +	};

Please override the multi-led node by label directly

Konrad
