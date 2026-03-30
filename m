Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3063BE627
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867247; cv=none; b=EtoYJr3Pi1AT5WZHhg4ccyg1BogJhK4Exb7xCgTExn+wTslZgKobcbyPhcOeQa5gJF8+1d1MlIMRnv0rs2urBKZ0kQzYYsbaEtRrqfPOCEMWHD8xHI4Ayea9NhCrPLeEdDDEwHf0hY5zp3kjcBsQSxb4NgC9lUIBHq33S24B4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867247; c=relaxed/simple;
	bh=BRcJGS/YsW2nABl/VhbDIQXg1hTmjAWp+etZ3eRJzGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb1/9dTj+eQcARcexMRhK7q7CdGRq8P1SM//wLy4zFaGYkg2CZ5eYVHVTHiEYTD/lVLdobAIZ0WZOnBNOseV8CYV4OGUIPNg3o+zIHthY5dOUbORPqLccozlDSH1M+XlhZi1F2D+RIGyT/H2JiZrfduf/r8FWoQw4uN/FwcKoK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WobDhBgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPXERP02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WobDhBgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPXERP02"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6pABo3320317
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sk/DIoeVKY0CC0dEsRtNd+7IweHQWp8ZoQvYoaVrBWE=; b=WobDhBgkfhqsbYrn
	RMJnZihJ91N75cHTPhfCxJcTXEAXzh309UfMLFRi6MCrmVKaQPC2q6sbVvs6N7/y
	16OAGEEr5Qs2MfDGSGM6iBdsR8NLTof7PiPQea+vTqOXrXVcgm1qEb7e/b+dLo0Z
	kaKoatMhg7slir8X5CrBpwZOcJiyFlqWb6BhqSscH9KdDTdOD+omDLAbrUngEz7Z
	s4jParQykN0k41yIKts+GRtD7KxnXD2+nFJ7beJN2V+KNyq1aD3VDvgDAE2OVtog
	+aRnlGz04bIdjHDm0P54jRrFG+FrmFR7AKQMnusB8tBNAQS6mo+nBVvP4CHaswe0
	vuF3Ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3q08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:40:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e9d327913so10354736d6.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867242; x=1775472042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sk/DIoeVKY0CC0dEsRtNd+7IweHQWp8ZoQvYoaVrBWE=;
        b=XPXERP02QtRANg5xT08S4n8z4GTU4kGcZfYMjbdAovrHEUG/Th0JFsPcpK9T2Y4Fi9
         ULjTW4fbJKHtFT2MvEnLv+rApOOWVP0L2b7q3h+tOR62Q5n5sWdy1evgZLrAxeoGZ9bw
         K/j92iNt9Qa4IvrYPqaP3QXZDMmghUy354jkoDmtZTHeZ52WMdZsdiJUib155DNgQh3/
         wju0Qk1j54zfjtiiVotzkcW2Pqg+O6inYfYYXta/25cWpCsAfjENX6NqEPmVk0cKqS7n
         XtlvcwIPDwpPwLmbw4qlkD6qTtquHBQj5MA4FeeBtIHYpwjtuuIYL1OhaeNSlpuzLxEP
         xZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867242; x=1775472042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sk/DIoeVKY0CC0dEsRtNd+7IweHQWp8ZoQvYoaVrBWE=;
        b=bOOMcETDUU+lJu8GYXZ97Q0FszcCTzChg5w1I6IrXfrTauT9wtnY+pZPienXVvsCrm
         H57/2T1ymuE9NnhlBEKyDylVKKC6S81+9SUCWjCODAPYtks4a6EqQTboOiU4aYt0sd3l
         m71O28n5cRXVZdkZTs2vb9EUQHtSjkzUYId+8e95ABPp3RlGQYYFR0vxZnFwnOsTo2fN
         eGmrmtw96fmXsAYyFhAtrUupNWkrLLeLbWZd0apHcs23xn+cAFc79BONjhuJz5B2d8aX
         NBqy0p6KUuGexHBIBi5l2244nmz+t3vOyteedYOUUEaPoTS/3PkLF1EtLF3Bv7aoZ+Od
         WyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9BeGx6uYqrYdrd7uTLm88TZbSo3ma7tXbivVRtnYO8xynMKx2c7foy2VcasqmqLoNOU3cOmbGJrAb@vger.kernel.org
X-Gm-Message-State: AOJu0YzPWT2x6woOdCz0pDBgzv22T+PF/OeU2BKiiogyFnQlGUMr6y12
	z6BiavIuzIizhvIlhIfZrm+sL28dexVJVmVkJaJsPgak8tpHq8x8jsqiAEH1M9K+GeD3cp0s0lU
	D2BG+0P6VaOSbE/TN/vF8mDoJ0DN5jTZxzCNt+Gy881jegIouwP9b1qKgmziTxD9O
X-Gm-Gg: ATEYQzyxYhl7WA6Qli22UdoTw/IKdNUWaCfKx8eQAkZem0jYqv/XVdsLYiyEse4Ffr+
	E3r/TB82zImaQ4woT7wEeeXm5d1P/kn/R4LzwUz8D+H8kKLjoFSWFylEXYJHyI30CZ7Lwun0KZt
	VI3Er4mIUE5nJIMHbj4EjXEmbu4f0S3/BSdlgYgFInkDlZM47joDuqTMLNs5o2Wuxbeb9HQJowh
	+ImBhpHeqHED4pdYiJN4ah8cZ+gyS4Sv8pw+zkdnp7iSxp/7T5mCvpwP2gLbN6CMkuoCHQymC/K
	sOBIeDcyzMbOtP0dJDFdqQkGcUSdi9VMqMstKlAcJVnR812OLtJMu6Jjxpy+9YKnjubLUNGKgSz
	2zbKwEGXxRgUbFYnYHWDqX7/GlfgeCGpwzhFZRsjeKdeBABHbx3sx6e09M+UikChi1VRUS6KNjc
	dyYu4=
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr8466386d6.8.1774867241858;
        Mon, 30 Mar 2026 03:40:41 -0700 (PDT)
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr8466176d6.8.1774867241441;
        Mon, 30 Mar 2026 03:40:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5dddsm277945566b.35.2026.03.30.03.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:40:40 -0700 (PDT)
Message-ID: <f9581412-6ad1-41b5-a484-930b06c54626@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:40:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza
 Synopsys eUSB2 PHY
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NCBTYWx0ZWRfXzksii4lQV+ni
 jkDnAPtKt4p906V+eYP3BRiqEB8xQQPfMD2NXqZwH5rPZiGO9e85yTyzAaA5Ym8sa8Ol0Udk9qw
 XJwL8A2tjXXwzUVBR1MWIdj5nFt1zjKrUPUqu6PZCvku+nqXQN2yD9WNZLwV/r0YfDDNMNtvgjf
 DytxRQRcBf6uag+m0UsmDJlMcf869MtqJEzHwgqUoJ0iunHVKSdpM1vSy51KcBG3TnEn1JR7ZuG
 L0J2y6bPuIUeMIrEfbtgRTyilx1VwJmdw3301fWOYgwVSttknDSWu+tBkXpAY0t9KfgXF65JI7G
 TT7YmG27W9HUU3iGr8YnaDmvcBA9HjexoH/hpLp2OFeDtr5MTSnY4eiRhVVDxWzQBjeOiCQ+6C/
 UWHRqsnwav1BySTo5e4vLl6w9z9U+n81kvFQDWyvdfbihKVDp4jIonHPrTXU4wUGKHgKPePOPs2
 0dpOJkLgGyNi31xll0w==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca532a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nuVsYHLnq4DG88yNg7kA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: m0WMLSLgTps9NEuFDAUJ5yqLYKaVdNHg
X-Proofpoint-ORIG-GUID: m0WMLSLgTps9NEuFDAUJ5yqLYKaVdNHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300084

On 3/27/26 3:14 PM, Abel Vesa wrote:
> The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
> one found the SM8550.
> 
> So document it by adding the compatible to the list that has the SM8550
> one as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
