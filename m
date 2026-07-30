Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AA40860E
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411228; cv=none; b=WaH8mebqUtDROVTYVkR8n7kbjl4VhT8oF766qTPAeJY+2ugKRwcDMxbKu2YpgZ4KHHRR7tFQkK+tqGpvMtjsEFadbtXA1oNSyfOcvE6FQ15BNj3G86UcMPgjUxRSX2IwJToyknU/crLm0UOrtlk9SkmLfxWq5cGXJfImBqYPbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411228; c=relaxed/simple;
	bh=E90X3ep0AiMbcW0W2G3xXc3pPnZv3CiuTrXLSl+7Zz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8Ht61PR4xGpG2OGNa2/ewoa2nDQ36T/rB6OO6oflUgGeyhMGnrao3ZWVwvpcKzRwPsD788ZmK3qoedVisggG+NrxWJBzqpEmZyyyNf0XVW4caudCH7PYG+vg20WBIWe5LDlSW29Eyhz1Z2XJ/3m+yguzYeeVXaSZ6IfRCkFxyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTcqvxqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDhGV9nP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTcqvxqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDhGV9nP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBHRwf917837
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMKDj6XRNmwKnnZ2ZBwRvPjOhNkq9Ty1/URdEas3t0M=; b=kTcqvxqkpsj7/gVD
	7f9anPfrJGNUmmV4HYi/FgLSMWMAlHgiUbdvexC1ZHcvxwKwQ5nVymin2moR8hoO
	qCX4vB//H/HxcwNh4BOrTGkJGnSQaTm65urtbiYG7XeK3NfiWw8weWBQU8e/NYjn
	LsCPlgQ8D70U9me2tdVwBWhIelems6f+PjwV/AsuiwPVP95f9iOykNqlz/SjLoXQ
	1nv26DfC45bA45ccGanNpvaxRAF0KVkYNyyWhUGtAzqSc5oah8p2MWs34xJHM821
	NVprldkXygx+d5AmaSMWfAlOa2GfCNJ9yeBup++E3/gQ8iwUolWNRu1ZabSroAvr
	sXlD5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5m081vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:33:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so3890331cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411225; x=1786016025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMKDj6XRNmwKnnZ2ZBwRvPjOhNkq9Ty1/URdEas3t0M=;
        b=gDhGV9nPGyJZAlCyA+M0Vr+BemHlMgjlT+EI7nd5Z7pRzKQQkCt76PD5LKncrkaagQ
         eXakdUizijXCLRfFGkWCm8GPOXtpq2CpG5VoM0lgPyNALWqhMgbb/VQN8Ex2TnG0tqHg
         5tAz0PBhTHXPPnOmCeq8EZ8gYOFAd5fT38g/zSLeNLd61ThzAfjcO26mkD0ZLGa4Uyi1
         HCAQRp7o1RR6bR05/CkREKjRY6AqoiccZgcdNjJrkQYja6d7Ml0WDukI6Lzjq3mHbn8E
         62jb9aGtmExZLB1GI+uk2EGpLJwI5hFcVPVZzhGn2u/oJH651CXQcPK6faoRTD9xmhXc
         OkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411225; x=1786016025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMKDj6XRNmwKnnZ2ZBwRvPjOhNkq9Ty1/URdEas3t0M=;
        b=Et6aznNqTiR9RCIQ7mbmrBYjJCpotCTk81vDafQI7yhDEurDyBc9VYipkYa4Ah3+74
         NLfNjHiXsBbvFaTptqJwtPYgx71yyC1NOy3JnQy0lqGUZJuFC1sgtAZbVyBnZj/Cqc/1
         mD+UOgp1lWWC3wp1U85jq6x1pt0maWmidmABuf304sj1v9PyBNzGgB5VtJWX/UnoK+tq
         FS8v64FRHFzq645PN6Dk0UORzzm4X0azC/R6vnIHnhjjWibpFVj85EN/0vQbcyKe31zL
         lx0oHCRQmJS89Cf9JawSP92x7wi5qWsS8VpiAhz3j1+tBV7v1LSntdIEHhEkGcD8EfTA
         zagg==
X-Forwarded-Encrypted: i=1; AHgh+RpJGCDP6r+JvcOjCd2mcd2LOkT1G3N8ReK6qervJeyYVlpqCevbIrJomWkHmqaGJJ3m7hG5GY5NgyHE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YUV0tU5JKXOHOUR2vCObsGlj5/OFyb+M4IjEQAywogRzMpBY
	fdtfLwjQxZ+DVWsPjJNXaENr55U2tquinBXeRukFscbdyaS2rJQQrI7sw9voIOvVFSBnQuEArjd
	tkYHXmLATbXzDaTfiI8xT6pfo0WJACfPUgrek98PvxxRmIJ7Qzr1gKAcEYyWC4G14
X-Gm-Gg: AR+sD10iR5f4tfWUMqb7GTPiV4d19a3Wn3ceiO28YZ5ki0vucRrj51IT6q+3oEDnMwB
	amJFmo5RmLJy0af1c7zpFmYpi4LcpfkfKgZy/uMeEm+J0KlEuDh1uyOk8jCfZAk7tBTGfXm4zDO
	JW3YxRVDpVFTvbImCw4E1zKwodpr4dP7l4bmD0EUx9wC4OxB7G3ZYX6wdYbQe8D4li+6th/tQn7
	3up1lYuQ/ETmpvErPpeiZDMuo6xXgf+yg6MAl5l1fcAbydEmSsAYNnFlwUb5SXPPpheycAg/Svg
	AKBLpEFcXuZFoM6iwbq7+VGZHUDdZYmaEiMo6XfrTIx2oEnSUU9n4JEgd62oQt5H127ztD2u/UQ
	/89L9CYxbuwgVIl0kGtmHL5lc
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr39765101cf.4.1785411225338;
        Thu, 30 Jul 2026 04:33:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr39764551cf.4.1785411224830;
        Thu, 30 Jul 2026 04:33:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a088567bddsm413013a12.5.2026.07.30.04.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:33:44 -0700 (PDT)
Message-ID: <9143ad0b-97af-404a-bff2-ca975e3c0d1e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:33:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency
 typo
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ghuFaEQVCsv3f1b2DUvvQcBtkwfn9Hev
X-Proofpoint-ORIG-GUID: ghuFaEQVCsv3f1b2DUvvQcBtkwfn9Hev
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX4+/dMfwbb4CO
 1WAz3IUDEVJC7i92thaAq5Sik5wW4Vn7ki4i5Df9IQRY+Us2Wnn///0Z97M0HFZlfgYhW32aRru
 OPkFlgmkmALsx0DwN0nmJtJ1y60iW4I=
X-Authority-Analysis: v=2.4 cv=esPvCIpX c=1 sm=1 tr=0 ts=6a6b369a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UHcdz13I6WZheecbso8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfXwcnVjh6H3uGE
 Y0O5WYSAa9bs9i7ghJUAnPlXOn37er84tgMCMCcuzE4y1xUN3omP19d7JBB+aQXyPPvTyUcCxu1
 kc5+gYXqiBxg56YJzx0MZQxpcNtiaJaYIhelSkaOGE062wCC2V4wAdg04q2stz1ZaPfortpTWj2
 cvDpVco4YczJ/ZdG6JkxSduB7KYUk2IKCxB1T0DNSKqX5vRQwmxNTgMNXiY/eYB0y/PZ3VNnvHB
 RsDFp4eXDlmsFWDz7JEy791m1vg3ftfwvAWrnpJ2sapgXmUUXcg4uXrsIqlzuvthoLBvvCapzFj
 yD1S+a+/hkQE3uSMhQqg0TgT8SnK1rQisYN+TLbnhRANm74evVjl+AewHz7fjfdEFrLIxX8B2gO
 JjyYb0hCZSrrnEhcsypGYMpOU0QCEi37QMnrtIBY1qHRKknIcSGG6UbxPbXDJmZGmlfpovdlScY
 1s2ZHtXpkXLVl/i+xEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300086

On 7/30/26 12:15 PM, Imran Shaik wrote:
> opp-1094400000 in cpu6_opp_table has a typo in opp-hz, missing a trailing
> zero. Fix it to resolve the following OPP update failures:
> 
> cpu cpu6: Voltage update failed freq=1094400
> cpu cpu6: failed to update OPP for freq=1094400
> 
> Fixes: 44562f591890 ("arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and CPU OPP tables to scale DDR/L3")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
