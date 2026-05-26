Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F393CBE6B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781227; cv=none; b=Dm3azepTea0FdA27pClIyDdP6ciw7KdwY27aDIQPIsKBImOGirwYQWf++UdAfiQgXyelE0i2FS3zPBBavQ4B0wLyqAU5+GBpMifZibqQ9tnTPZbvi1QgWd6MXAwnM6wdy2i47aFVIClZsVyzGIoCwlC29D9nqjHofjsz1sonoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781227; c=relaxed/simple;
	bh=wkYHgE1zQioQdA22lstlI+PzjaWJbeDwxHaiVIjncUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjNugc76lveHBVS/Gvtau70v5S2YKMvG5v/yMixJLdmtYId3DALbS1SSOkHckNWHZCAhCeMjTO1VxIILU8xApC0u6d4fst+sE3ceoyEFqzLfhhULiTZZud+MTtSToFg7mz2qE4yQCVubP9u+1JP4p96AaUKk5dljHZIgvlqOLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRgWDnKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfzVroaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRgWDnKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfzVroaA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2rFiC2822430
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1lH9qHc9cUGrAmymdHhxBXYrU/XEbuaTeWZQzODhAU=; b=WRgWDnKQigeRchOr
	oVNiYJ+7bZQva/JaKwuw7y912rx9BVI6cVu5H7I72JVeO6crD0Edrwmy5p/PPHVA
	fpbhX8sgiNw8f12qfDLNF3qmtkVSs+zNmgkQdlOWFwteBsoCsytZzjsCiCdFwCwu
	sTqQnvYxkK+WmSH0VZuFZ4C/nIfTYbDh9bHIus1U/A3+2bF92f+Tdjze19x0FUYE
	nCHtsA4bEyOePe9abMtzEID5DE356ONaUYMBbb4zt/wekVIe9UYu8lPjRW/JldVL
	Q66zfg+2mvIwzxUORADDyb80QgmzNkLaMCU2yFW6GaLgmDArxnsjMiMw6/Lex33d
	xoucXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwtmr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:40:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso20073110a91.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781225; x=1780386025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1lH9qHc9cUGrAmymdHhxBXYrU/XEbuaTeWZQzODhAU=;
        b=bfzVroaAZGJniG5t2n9fV7j+TiQ6QizD3bbDAj+K+Jv3JUnFB3ho+fK6RcWn64RU9q
         qokDbz2WooSp7fNuZtWuxyY+Fj9TnV8cOW6oYW2QVqOPBlEZGHsPAhEPPni0EGMKuW6u
         wX7BXcdxhOjYWBKoZZELQOFwzrd0+EbsGAAbIITu3EJZeEKtqPSHd0jAYI2hdfDMqeGh
         p4XHu2qbiZNiqv/54my/1BCAo6HGsd5PI/TLe5F4VCWk5ox1m5ZkwKPMlFaZOn9EYEzT
         6N1lCRGTgAChtzqDYeDuW4HLJ+XveHsrNzvNEkUN+b6txQHku1o/dxUqMXn4gs2xiOzT
         qFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781225; x=1780386025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1lH9qHc9cUGrAmymdHhxBXYrU/XEbuaTeWZQzODhAU=;
        b=gvjX8n+gUp2zQ/6m/oz6l+6Z7pnXKmtXWLZi2tqkYsLgxVSKbT6b/34Lit+3U/oqIi
         ymMFvWNMYwNzved0Ee37kICP9udrbEzzgc98d7P37fvMUVOIFbq9EOE0jlJFSJM0Auxc
         MJFXG7kFyBRaIAb6RJDCk2/JO3onVWdJA72UFolu7JRrzJnQYp6SS03JWwACezAOPgka
         cBadu0Tb4Q0bz/d0uGb+55oC8LIjFvfo9cEl6J8zqf3/q3GXit6TOoYPVpX921eUfxGA
         4BN331PC2H0K4ARGsa6vM73M0cFnBuOlQVol4SGGYROt/npRNgXU0wPS0VcentXxc57p
         t9ZA==
X-Forwarded-Encrypted: i=1; AFNElJ+gl/AAOMvxEJl8WY8qmKO5JDrpuMRfhJE+aMxqV5aLqLm8oTH1mIcqTDNpqgPDsmzSeZMpmjZDRTr0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCChPGA8GTdl2pKtEqnJUpWvoLx8bhJHHrsZjNICGjGsGv4+Zz
	W/R9qZNkwduiTdZ+rtXQ2Q/sk5O1v5gRb9SIpMcyR8XcPMOvRu8RX7VefhEtv9B9tMN+n6bkDfO
	5kqV/mrsws+FsKCv4PjXJTztTKH4Pnr4laWZk9QVIo0QER04jiRVbtP4HdEAoIVcp
X-Gm-Gg: Acq92OFV3hi2jOaYBk3yGdvX6UdN6fEFQt+2ZZv4cAUXvWvRz+YYuBzsyCl1QgIu6Oo
	Ib61LAzxo9cip80Vqk2rPQgbCS/oA13d6SaV5ZPWsMwf74KqxnjeogbvYhG/Np5/YWGTEc0n2en
	QeKxC7ej7m64ab03ZFMPyWzb61uW+GxR5mBukqIjinRvWF3eJERKCM3bAI+ZfZTRyRjdp2pZcHK
	WIOS2MK5T2OVvjMroRll6CyxAE05fxvf80aCYKhlRE0sjNM8m+rg3R+qYm030P3duhD5atmS/QS
	Zkw59x9ceffBb0zuZEy/Qsqe2owPcg002iVV2Qs9R8VmacwtCpw3kL/hdP9GvqHymjVkyEZYY9x
	/51nzjCYlpzOmzXM8ubGB7P2nKybUu44Y3MGsdWwgBdeFPDVHqEIqni4yfSIeVA3vErt+5v90bC
	PMX3ff/HAPQeZXotM=
X-Received: by 2002:a17:90b:3582:b0:36a:e839:4f95 with SMTP id 98e67ed59e1d1-36ae83961acmr3714845a91.11.1779781225143;
        Tue, 26 May 2026 00:40:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3582:b0:36a:e839:4f95 with SMTP id 98e67ed59e1d1-36ae83961acmr3714826a91.11.1779781224669;
        Tue, 26 May 2026 00:40:24 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm14816010a91.9.2026.05.26.00.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:40:24 -0700 (PDT)
Message-ID: <f4f036ac-b150-4bf1-8b4a-b83641fc42cd@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:40:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for
 Qualcomm Hawi SoC
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3aYoZHdQj2Dnl1m_p6ACMdvYh_u9bh9D
X-Proofpoint-GUID: 3aYoZHdQj2Dnl1m_p6ACMdvYh_u9bh9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX6gsWaneQD0W/
 ln0+AE3FIxl2etXlAxkuZeL+/Ht4dWu+t1mdQHemacdEc3hdNZGb8yo6fMO8gDyqq11IY2jrGL0
 h1Dr2GmHdYAJD0vfawEOayATEVn6tjpmOBZ9HlL4XEGrM/etB8i83Pxz2aXf7ZWLRqyt7CVUwbS
 YO3I6fU0LXMzH+pQdpk4iai88Gb44m5vBGJnDnNWq7wB6tPinJ/SV3OAcZunCd2VtxhUnRMiSIQ
 IhQqmUfPZccEiFqtE15EOMo9rlUa/0wgGUXn1nLHWTA+oLbTc8LOmYqAhGyoJjATf/ax5mAHybp
 q3CbR4hHmDzxjr73rokLLoIxdcC8s2GGyTwu55xqc36B+qNSU7HdQoP7rrYbjhJMoSCjCJ6eTrn
 G/YB/9r2MlKTdCb3feK+GyEjnekC1CrXJpdmjwPZZjnGBY8Ti+GJZFnqd2eLLrH+yyf3qdofUa1
 x75RIADUoyzJgAwPZgg==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a154e69 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QCjGO55T7APnlLQUJ_AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260064


On 4/20/2026 10:25 AM, Fenglin Wu wrote:
> Add compatible for Hawi SoC and add pmic-arb v8.5 support.
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated the driver to include a "*check_chnl_status" hook function in
>    "pmic_arb_ver_ops," with separate implementations for each version,
>    as per Dmitry's feedback.
> - Remove the Reviewed-by tag.
> - Link to v2: https://patch.msgid.link/20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com
>
> Changes in v2:
> - Revise patch 1 commit text to highlight the new features of the
>    PMIC arbiter in the Hawi SoC, and clarify how it is compatible
>    within the Glymur SoC.
> - Link to v1: https://patch.msgid.link/20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com
>
> ---
> Fenglin Wu (2):
>        dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
>        spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5
>
>   .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |   1 +
>   drivers/spmi/spmi-pmic-arb.c                       | 142 ++++++++++++++++-----
>   2 files changed, 113 insertions(+), 30 deletions(-)
> ---
> base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
> change-id: 20260323-hawi-spmi-a29ef97409a4

Hi Stephen,

have you had a chance to review the changes and are you planning to pick 
them?

Fenglin Wu

> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
