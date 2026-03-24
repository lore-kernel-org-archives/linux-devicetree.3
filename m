Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279A93FB055
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355787; cv=none; b=p63l85H1JVXfbsgWDbSTYVw/T/CM/1VtQsLsOYUYC1eOgXdfisKob3OMnEl7UGbzoak4uaggtH0OYAtQzrYsDrMPoD+r+21l7mZ3l9YP2p1SPfl7b9InIhYzv5yD7B6q0434SnS4v7X/EE/4z7iOzN/muqk4eKt1zFmVc+bxQx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355787; c=relaxed/simple;
	bh=l8KXVrTAkDzLuVlRAvJMWH6n6KoadC8nbAt6Phd2Ro4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsTw5FW1l1RHt7sgErmVLXhRLKwZzYx5AH9zNAsA5GUvZsSAtBeBNEj9LsZDqan0WkYnEG5XegKB8xE+daj9iKZAWvj4RkSsEiwB8s6Um6jFNBp3w2AFTEPqS0h0t7LBphxu7QjlPBWtOe41eUhMtOs9oMnwDxXzx7cizpypmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9Ea1L76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUbOl3AO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9Ea1L76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUbOl3AO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9WfxZ4059071
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMrbOK5sv+fvRDt5IDBBbr6qfYE+gH4iheNqDAD1m70=; b=W9Ea1L76rgcrkLmN
	qZkob5y6loXsHYm2NijQgakMU6w1Hgsjs7tHPanecO+0+6D3uk4VDFP0p1uaKjB9
	OABw+cCzMjMrzgq9jk5snQebjB0KMbQRYYBjCv2bS9vnML50ZOSHE2Bt+j3MZPgB
	B8A2b1u8d+rZFOC9CaR6COwtFqP3dI6FRki+G6Qj69oH+hGkOAXDmLnst39VvcZo
	WlvHPdIwhknkbznBR2CqSiXIT6sEMe7AJdL+C3yJxFM6TW+YamEbm/n3PHGS/Kfo
	4muH6F3A7M6yCNrLbyqGjxDeKCu5yNSEH3ldF4AxyaM6GVhbsR6R+4drWMKd6YVY
	BwtmAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jskswmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso32055871cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774355784; x=1774960584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMrbOK5sv+fvRDt5IDBBbr6qfYE+gH4iheNqDAD1m70=;
        b=SUbOl3AO9QUoNpW5Mri5r3AjTEhmPiUHbgwJRZMgmC2SUARSopdfvp9Nk+lxlIv0Sl
         EpGAE/M8Zv7rAFKwtKpY73puqXCUwaLEdT/syJtsTl7yVh/LXa/Np/R1OQ1MdL75/5mD
         6O/wTXTarSljhgl3vjg1W3HACpUdOEV0XQrVNYAns9QSzUrWBwV5INu39J9Tuhpkz6Hf
         lK/QBWfreXRhCRpdFSMzD1TCXBcz0ZAuXhbUMQ18fnzK457jQcquDdwdq5yMZwsUZVGS
         ALn2nAgiFUa4WPj+LtBRW0hnwTTTsqI6KMLE7A+8tS2xoigiybrALotialGTVjvpN0hM
         Jxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355784; x=1774960584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMrbOK5sv+fvRDt5IDBBbr6qfYE+gH4iheNqDAD1m70=;
        b=alGm5YA7SK6lzYs6+38A/d+d0RvXssTXqRJCBCsRa19iAGcFJ0+Gw4qNBKzv0+duRk
         czV0PNo1YOhM+TwBlao8m8k/oJtIBHncJncKWR71ucO6100Ox6wZVgsc//5kJkNEZnlB
         4Ibv5HntVZxtWJ0+I5L3EuEr5xUg6twux+Zc6ZE83fuCCm9OSMX95i3qOaFe5Bt/niIY
         dBtKMu0ugJ/DSRz9lscAcHMrHs3pe7390TYjR/pvYmAlb47RA6Fuh89FLEajsLczexkt
         3Olf2KueZL6O+RlQra5aes9PZZSL9DdcitX2FBoVazbUmQRAeInLFrKu5ZkokzVkmXi1
         epFA==
X-Forwarded-Encrypted: i=1; AJvYcCV+pYM+2s1qw9CSA8KWDxOdx7HeKtwCy8TGqlUZNndPfffWRXhVIUnKLED+LDGOxrvAXqR6X/YW5AgR@vger.kernel.org
X-Gm-Message-State: AOJu0YzYCJNAHdCeQ4n1WT1YfXbvAcbRaWvp3ePLnjNMiFJhj1v3zhOk
	iQB9WSun81Uo5ROkLkt1tT4tGNBfTyy0oFC2rhfafe9xEEmZ8g+w5opJW+UIjntv1EMNAT8s0u9
	Mixzj1KfEFNadKa3GsDEFm84+z7PL/NQJ4NdzvkpX2YfFDxGCHdMgcL68tRqjBW6N
X-Gm-Gg: ATEYQzyJ5zpNKjCTd1h3KUC9ufl63IqoBx17YR9OyAt9gLk9tDFWvwy3cc69HjcNRc/
	LOxiX9DUhD7sTA5ZcK3Bwv8eCBaInBsnICqyTGUogM+WMXufJhr79puyyHM+/hcE5Vg61AOFByc
	ev+eCJV2v3elimDsPkEB+aBOPskCYhZCrCmhhF4rNCS+sE2gHc95OMF9ZYQWkT2QTfj4kBrWSTc
	u13Tc+ZHJHgeH9GMgB1stQQtbapT33vULrOja62E2uATgXBGWZytnQTxGJyR3VjaEkBS1wS4f1H
	ivO7/wGiqkoxUVypIJ4mrNp5qhKskNqUwQ8ClvJDPNt2+zOasvraiY7VGgu/zfmJzTUifDRvT6F
	zlwuv98KvRv7Rb2qsGPuhKr0OvWMKALPumB8pJUqcdPMRSxB8Rk1JHaD0Mp/wZXFLzV+IpM1LWV
	7tEyM=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr73980921cf.9.1774355784206;
        Tue, 24 Mar 2026 05:36:24 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr73980721cf.9.1774355783755;
        Tue, 24 Mar 2026 05:36:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a14csm614764266b.43.2026.03.24.05.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:36:22 -0700 (PDT)
Message-ID: <12b2fd16-2429-4838-a709-a6fb6268c0c3@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:36:20 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-5-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-5-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMCBTYWx0ZWRfX7q5tvwoZ8fau
 D+IaatWuopATw6viiRQuFGO8SA+Tq+N1DXJL6Lg4AsO0zM9uYiED57BD0LyCT5kkF3sPSIYxiIl
 qaiWzvVrXZrtTHgFQht1SKaQNlXrtO6t2FJCzPUE2C71AT9YLuXecfx0aQhDpk8LURYtMbeWVjx
 lFY1YToca5nQb1leWyw8iL4X8D2Xx4kULumvPhHfal4GeCHBXAYwZZ1gSxH+s4OzkVShbk1yoXK
 CEh/wEZLt9ym7gXUqaFaoRbIhZRg0p5MJzD37kS/ABZk7l9Y/3xqpP+74C9nGKwubhEXkQ6Jc5z
 IbiGaq+KtDcxo+kwNCfg06VDGmsqGJy1NhnS2GwUg32GrMghq0HQBrqa7dGkYo97RAz6G0JsTMr
 8a2glLQ6qJV1co98haq9XH1/YDJvBCJeP4S03m/8ugvgFTZb1vHVHfAv0sx0nkc2arMU20tItuB
 W7z0HjLGGJEamaEJB4A==
X-Proofpoint-GUID: CQH3wGs1_NOj-1l1Sz4zgUmH8rMlUY90
X-Proofpoint-ORIG-GUID: CQH3wGs1_NOj-1l1Sz4zgUmH8rMlUY90
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c28549 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4PMlgOObqc5rzRHRgksA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240100

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 7-inch OLED touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
