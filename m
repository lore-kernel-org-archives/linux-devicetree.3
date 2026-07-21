Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A946A61B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648248; cv=none; b=XPCQT907wzXu6uEHUbFC6sPPOX2jhvpQgsdSNosr0XcQ5wY/LfHKVj+m/15VsLAQIZ9FjvGhrycYZzA4eSznBgCxBUo1OHo79cpN+438dTOHJX+0nNEG/9mZVT5qzCgTVLabrizvRVUlbZe6zXp0cJZIaEH7LsNeWnX0347AYAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648248; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C8s7DvgWcBw9SVSSSczXiZePpA2jbncWMtXJETXEOb55vQFlMkRjDgkrKXuFkA0LpY7X+UFTHnmJQS4CWs7eXBGjnwXBiEg/TU8+5CIgwuNuseO1ZXH40JinPQs6L7Z3A0mYTVzVajp8U21FoQIYZ/wGe3d2/K9MIOBAFnvdBxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRgzXZ99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dprId3sz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRgzXZ99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dprId3sz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6Mt1958707
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=CRgzXZ99PQVB+j5E
	6gBPhY/UisNIR1ZgYnJDzxxGDm7keJaX1rzARE0cWJUsrkclyhBdaTY2Fqqp4Vbo
	cAOhGhzPP4XsQ/Iw6cAUb652RhGelMk9GNG2OW7NKBrrVwuAvHaxfI4m332FMdhH
	vde7xhGPt3Ab65oHhBCos8pBuGJXGdnKmXKnXQnrdUKqQVTWIRdbemlE6PjqjoMY
	bPPGgjx/LOfWkeQzlt+iDDYytCnUn25fvLL07GKFBSrfGe1+UuBqs8yxf10+4B/t
	PoD3eXPJQtU+h1CmRBbeALcNlIl0ZxBJkSxPEpDyXgiO/KsDXS1OY3vDha98DQxe
	uBu8Lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvu8vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:37:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so31721861cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648244; x=1785253044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=dprId3szEgMfSll7HnD/i9T1W6LPw0cQJMc/QK3Q6XxrNEiqW+oVUbQBs9pI0iCKBm
         P9+ojIb5zkWNdyEbzUlewnvXl5YPKrA/RaMKv7wuVO9To6R9P+UvKQmt8YBJcEpb3Vuc
         23mPhMFSl9Uy/udFxoGoHHurEvIj2QwmhsddBD3gPXCImhNZQ7tC0+TQVXophgpRc1w+
         MAatMvg4B4S7VQfyhe2uVo3kCwf7OpeGBdSahZEcMzEETLrf72wKavimfBXA/DG0HBku
         G0NZjc/gk/szdKQtdWUYUKLoeEqwlVH5AOi8sr7E+IJM9jEz3lHcbMsD2HOMFSKSsk4+
         niqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648244; x=1785253044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=rE1/h0UZqfAaGX/e+TP297kfmDfzBRtKhnPa4bVNAhxtXVZXkxHwcYGgfVwYTqrPI3
         hGt547EP3sw3ONdCQTp3XYlYbPVW6lxyGb5TegIfumPu63zUF2yVdPdAS2YQUA8iflQE
         zcMkigFcMzgF1lS6nV/gfgeMVTJeDJbGUjtyo3yBqudV8NLMK4wldMJovsS5Vlc5c7RK
         jczYXndftdsR/mt6X1DCa7u6hR5B2+URwXZGhlOdjMIVYh6WMI79XmBtWMU6zu8N6Fyy
         v8Dg8LoP+zjfCvgmjFuNqsK1RktZAW29zr7nIpoPCyv9Kp6TnVjp4G0KPsnk+d37OYSj
         vjaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1EHdfQdXZA+Q/IAmSyEqhU7mOLCJYbitcA38FlErqfhHPIxHi08JF/YKnUKGIhb7szN70NIwsvmuT@vger.kernel.org
X-Gm-Message-State: AOJu0YyzcakoBWhJoiWovXhIXm/bT4YMzSSNOMJXSDzGT9/QygHvdKv9
	oBaAcnhB33f2oXOjL+H9gmh7jLCFYPGBym11KmwSO/PtymHT7DQ68vPueoPGCjVQDFI+9MsfgPn
	eHUXZMfU+YQfBzl1lhFebwnmGFIYfkOkTDgEqgT9L8W2Ld2nBCg7LqdyEmqDWe4gb
X-Gm-Gg: AfdE7cmy0r4dKyXXrbnJkmt5AJwxrZgVNg7H20olZ910C1Vm9EqPR/Tbt/Fl8esAXQ/
	TsHkkEVYlZqkt8jMLno3gaxa2l6F3BafsR9RU7MFYJRHDQ6MgbxQRNr8YuTO/ePTYOBk5aIRh1z
	GQvaiUZ8mg9T9X8EAoZvcilqsTUlr+aas8h6yA62H03JjlYLWKHKevS+vFOtLgha4g+FYrPbpJl
	JBIKwYbLribD6C+Ia5AlonLfr8ChjY9070xHZJ1mIy0rvuCr4qhyn7Q5airoinK14C0+JqLUkeW
	z5If6r3JdzL+px9YzFYEWTlnYRQMkTn91JmhS+XjBzJ/rXp1bF8uUE5DQEUUuWVvQvYWDZlE8Px
	9KgN/Qp3KMke1GYUmgYNoQ+Gr
X-Received: by 2002:a05:622a:9cb:20b0:51a:8945:312d with SMTP id d75a77b69052e-5266f715889mr22372721cf.0.1784648244307;
        Tue, 21 Jul 2026 08:37:24 -0700 (PDT)
X-Received: by 2002:a05:622a:9cb:20b0:51a:8945:312d with SMTP id d75a77b69052e-5266f715889mr22372471cf.0.1784648243819;
        Tue, 21 Jul 2026 08:37:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adff3sm601948666b.2.2026.07.21.08.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:37:22 -0700 (PDT)
Message-ID: <e102fad5-9d26-426a-ba2b-3a85b861f7ac@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:37:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s3WJbAqg4LXSq2EH0tAj8IHjEZn-Dq-9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NSBTYWx0ZWRfXxVssM7ESKMIa
 uzTDrnN/F9kERdrI9DpR4FsehdMZQiKTD90LhUiJzTwsBY/vI0en680CFyyjaeFyEHhUw/HMrng
 lD4iYOPI7IJkpD8Qs9fAaVak7ywuO30=
X-Proofpoint-GUID: s3WJbAqg4LXSq2EH0tAj8IHjEZn-Dq-9
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f9235 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NSBTYWx0ZWRfXx1YyAK4Bhtx5
 vw0AvgIOkoBYfK6jijc2Y2XJ9NzbptpCe9MCprxcto1FyeYBANMy7mzWD2sccGChy9dRr2XGSms
 WkXVJcrTasKrEocT1jOPjyT6jxrCZkWAhanSPpjLQ5XLZYgrGXE5WeAydW0J6tCj23ZyS2EO+pZ
 EDJpwYhpojOC8zBWosHxbdJ9gkhnrCjKFkYt5zees3o9IKNBlNbCqD1o9fQVPhqNdVv4BMS1yDU
 Ey+ReRlHX01tiB2Rw9uwJOrzHdKdKjRbpksfVw5EsBrRyMGArNOyTsPy5q6szeHnbniS/n7WD8B
 rE0b+SP1poIvaDpYY0J6Ag/wmWR4Lq/5kQyT1rZBcaEcPIXZ16brsSYKHYrbpsx3wWT2I2C/OUb
 iRx3tWxYrthOGKNkCtHLoUE0buljq1HMvrO7h52ckqDAMd7P+axHjFd6SO7qAYzHYWZc5ZxT+lP
 SgbEFdzHBZ4SkhU4tVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210165

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
