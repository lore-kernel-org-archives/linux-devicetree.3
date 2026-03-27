Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A645A3DDDBD
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604238; cv=none; b=Bl5HMevel/hW8gBrB9e4FmXC8Fsn32amoId3CCyr7OPN5XlPAEkdZ2MAfB7eMCCUj/+/qmczilEOKSl5KT0WtpbadG2fPSqvh+obzvy2kVKWTirRQqU/KhB2XzOXjUJUBFgrCHrPpUJJi2PJ8uYRsftqB4KU7DOjWyYcxKfchao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604238; c=relaxed/simple;
	bh=lQ54tNyhahNf981UtrtQ8c9xNcpge8AGj9UwF+P4TEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3Y8bm8Dlc8YI7t3o2AOS/U85HPIYJRVxF4jRL90txEjj151A+Efo389QCtWreAw4/m5CSF2EHCSu8B/VMVHqLUbg4k9nEdhMM2X3akCe+gn8XdBANVm1cwyP0IGjdr43dtj5uo7+mazzM/k4MSuLlveVAOK873/BjiIDE+73XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqouCsF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqGATYuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqouCsF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqGATYuI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wsu82845988
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=; b=CqouCsF/BSHA/4Sp
	I3lspYnwvcOJBCB9VvzvgzksbD7w1yjFOYl2dkSbNs5nwS2TN1Bp0nu6ey4FmXpY
	xSdxKWRumhwj6qDR5bHBscdPJ5oyaMDs0nd5bOlOfsTdkACBbLm5XhgirQIMhBcN
	8GqPdv3L4oY+nHQd5IlrlGYBrdCJuDiP6UQTvAa0KcBOF6K1eqKS/2JrFTT7iBYJ
	p+x4u7giiaE3IWI97MxnXC8bTzgRdDyDgyAjUCZbSvCIbGr7cHNzICZ48ByDvyfd
	C3M/v63aMdguvV7oWbSTugfAsL9qZU92gSxiKn+XHtmpHGiR/edslSk1jBxUYlsF
	C0LfcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmekh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:37:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd97debc51so60292085a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604236; x=1775209036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=;
        b=kqGATYuIYHUu9nAzWwacbA+VenzSym92Et7isGBxEk5xNaA5m8FliAuf6zbPzKaNg2
         CDfW4ijkNmpdY1vts0KIFtp8UFvLHZMh4gNAi1HYjPtT0Ogng0XanvOl0tUqJczFjPVu
         9e9GaGa1UGZQQSSHwrXjnZ4o+zBydNs+ddpa6q64R7cf1QHRr3Es39hcg6c5L4Xrfsw+
         8y6b2IGD3HExsQ7CvjwfRulVhR0aa7PFoDC0rSKZGDOc9aCFZU4cZhNPvrduyM+KR4sm
         kvPEmh8W4JRAPtbtGFk0sIxT+YSUQAok0fIAmU0YPw9+m8lFs0+J45X1hY1q0WHcp7bY
         8qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604236; x=1775209036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=;
        b=bnIy8JfGtM1+oB3FtZ//13rKSyZWqHupX3lfkVbBIygSGJ1JoIUttZf4GJKyFqrIuK
         1n8eCp1v8fCuAidiLb8IJNgHO9Sjny947AhKzVIEQTNbfop+vh4ewfECz5H4JEGIjgzR
         RANSlfNDXSUIHXMxAfYxTnC5c5aBUFgJE1Cj8XamzIrVNyXGlXlMmUUb/tsHIUzd0OVD
         kU1IB38rzswhmci17VBjXCCvU5bEFABWd3oaaEDEvbSK92kA0oS3UXCTIO1j26wVekrX
         CxwYPTK1d+pziSr3UIKwDx3iQFb1+LXEL2jSUWjWFD9VAe/g/75rhj82GUWlrBUsUNh7
         qu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqgsoWxvWpHu9/J+Pg5khdNqEIrx9Yjq7rnspXcbtF/aMWiS8/2w+1zicaH7+j73oWCSeSglBSLUVj@vger.kernel.org
X-Gm-Message-State: AOJu0YxSb7J3K68sZMi3KMFoTpspYz9Ne2g78rI5+M/YlYVtiJLeH7jU
	7mqm7rD8lxsF5L3bXHQ5ANxkylFmOhg5j3HiI0TUXzaQ0Lyh3m7dP2/tgeSNWMpGByRRzM8JAiY
	bw/TICkI2HBn8qULAES5ZpgXSKVAzQg/4WOekRaW5xJSoSWIVnEJ1dY4v/+JHivlb
X-Gm-Gg: ATEYQzyJFaO/MTyl7BY4/fX0MgHP8W7jvUdzzZ35NYhpguG3PKhZZgYDlMMPYVHW5wQ
	WJI1/b1cbySB/cCWXfn/bnCZdmgD9NmEPhoK5CTe6bRZ/4fufRc21l/AbVur2VxA5cBPnXH/+dW
	UfpHOkamkqLCnUNUu4XkvOnLB7u/RcJxALPSHzISxgwwCajqNDKasu7c+CpUrC3ZFbrdFEIibqa
	BIg4DEsJ63V5sdSpFJWeovd909+0CcY0UZKayUjUy7xNw53c3PUc4tzrPeCBbIUaaAvC2YMCR6t
	ZdiaTvpcnNBoGUqToCJWKfEK/2/D86myjPbI6V4Xx3h17kgcgROKEQWIuKaxfN4zec6W7lIo0lG
	XF+rDISio9Ilg1QTstriwL6M0UcwJDgmd5ovtTd/PGg9Re4OvheWaULlA7UvOGzDC7p39/clZCK
	Gk8HM=
X-Received: by 2002:a05:620a:444a:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8d01c5f28eemr140647585a.2.1774604235998;
        Fri, 27 Mar 2026 02:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8d01c5f28eemr140645785a.2.1774604235596;
        Fri, 27 Mar 2026 02:37:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6048508sm2026149a12.13.2026.03.27.02.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:37:14 -0700 (PDT)
Message-ID: <cde5bcb8-685e-4e1d-ac61-9a216e8ab040@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:37:12 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot
 expansion board
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfXxPc6F6q4VeR0
 aN+HIAD1e3WOk9skOGq/1qGIduAfrLwElHkPo0eeTbcEIy3QkdAu+pPSTWmW0zvvHDSD+tqI/yv
 I0pOf4qhyYzGrY/nNKagqdtB0dB/Irf2sFHfyQbA87yCvpdXEa6nscMRLFmUg33Ee0M4kqVhdna
 ndGwhZqJBeAcVinNCLCN3zD8l8+QPpxRzuKFbtUK7ofiRr4TavQwLK9hY2HCVIBOQ0/oUU20AzQ
 vrWPngvRu5kbakSGm3kpPCPhcyw1EtfWJ7pCrfMspA5gmbYm9/F5i1h7QkXaM94ivBuC5Qj1/16
 HZkodIOdM1bQNJekxUMytb1qyUMssQ8kM8EssSnZhzjoGHpwZ9Le9p1Iv23UND20s8Cb1Y/3TiT
 xAoAP6Gtf5DFORdb5uI6xVp1CRs3WSTCtP4BCfK87Q2Feg4yXrZH8PdRztLDRuXTfHp6rbZPnAe
 XlOQ6nah8DoRI/97LVg==
X-Proofpoint-GUID: B-YMGwzW0njHdQxqR4eY13Q0SsMC3ZcB
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c64fcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GeFP3kUyQ-hAHLItCtwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: B-YMGwzW0njHdQxqR4eY13Q0SsMC3ZcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070

On 3/27/26 9:31 AM, Canfeng Zhuang wrote:
> The lemans-evk mezzanine connector supports a robot expansion board that
> requires UART0, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART0 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
