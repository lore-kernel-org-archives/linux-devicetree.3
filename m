Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDD54A4EE0
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820277; cv=none; b=E1YUllNIbYs44mX2cvstF8u3hKgECvLreWdeDj9uNQ+40qBxylLhXUZFnzJBfr/kP8sNkUZupFpObzbZwjciEMKPaphqF2L8evtIVKVkV5VT6da+KGO8Jmkg+XOBV+nJuECDLjkzVIXmo/juhCGCXip+4Heq3yyaKgg/gkSya5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820277; c=relaxed/simple;
	bh=TpFiEWahAUmXhWwUwv8m3ObKJdXib6T1GyKvu7O4dHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi9bErvM2MV9HdeKVIJytbfRwVgc+GDR5aWztNovSGQoJniKSej0tbY9sOGfFCrg46X5r9AeFydSlv3sG3DjNP886h3LUIUM56DsBMNQWNGHMeM6Emc4WOLAmqL/UiIX1HoJwUDVTDdZzS/+3MKL37Db91bLMtjpDGMnK2IEa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYXFXdCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFzPkdcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYXFXdCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFzPkdcC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFeviI1895534
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jr24mde86SxLZlOcpFzA4cqha7URXRsTA0ve5aSUVtk=; b=gYXFXdCLmbv29x9q
	zdqLIy2xE9NXV0yGoq2NG0jeZmpD+is7h6dSz/xYR9TlY8NQ7zkFdrsOqcnS1uBV
	0U5Wbb4SiwhLOjasQSjVwtGZ6pYrEKAjgyX9El+Ul1OWOhuEs0zmjJSeXmukG7oq
	tP6hnjWyM36mXfulz8InCdaaVVZkyJlbViCHvOFiRKCdwJf6vCTXDUrgV8SxQmIo
	lFxYzM8CgyK2anCYJ//BYRmS3JuZOmm12EqNdVQ6SpNMnV5mNXbYh6QwaYjoRrGC
	VeN5Z/i1IfWmqg4vJ3XYjaryRZMq+Q3i9pgiIQWnjIBpkOSV9XtT4P1G6m+zKtPs
	FQzYnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kswgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea15d721so17328285a.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820275; x=1792425075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr24mde86SxLZlOcpFzA4cqha7URXRsTA0ve5aSUVtk=;
        b=DFzPkdcCjxrXxoSzCei36uk/zRK1sqcDIbSTnSLgwzc2acNljIS3BN33grA3heBE1p
         YKWs3lhuQ7DIubOu2EnTNugDxzcFJwoBgU8SqFvczTZACD9cr/wuH0hI5g/YIu2fzxrF
         Rf0O6a+sL/1WfEJrYh0Anwrxd3mZvi3Ozj5HbHFbCJmnP8X3rYihlQl7CmU4fP86VuCL
         CeVMneWHJ1m2ETfBpitl2Jml1jxvJBaPPbdeP1vBqw/9oU+MCN443kkdfoFi7IimSV9E
         WEcT5bsUFalLIq6sLIkx88o2R7qlaFFtx3lUFiRxxuM260VA62giaLtC7FJwHc/hI0Av
         Arbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820275; x=1792425075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jr24mde86SxLZlOcpFzA4cqha7URXRsTA0ve5aSUVtk=;
        b=baLotnNUza1sEjoYqBvabBG+RdBs1LsSYAQfFh3vKznaxVvPk0n8PEb1BpikOinNzw
         nXlqmukg5FL2gQfcbDO7M/1ja5B+xSJEgoLHkBgQsNY2ybr1j4Sb6d28Tffp/gmXpTqx
         u/MZVPRTkcbKO4h74cKlmL3IZRmHnrdhLKSaEbEug4Q0A50Qq5UfcvGjY0dzI5jjSiXM
         sUuAqu03SlqN+0ABIq+dNsVpXZD0n+oQM9U+QjJg5FHu/0M1sSEOZzQyQmWv82OZ1+LX
         zexuHMN8JnDvWGPKkLMI76bcsZR5Ba29wRNc+ARnlv5ndGeQqSMFeQPaxWoSgt5sQVQJ
         mcuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSYwNdzhVVGlWtARWnpH249lnpOqx2TPVN92BhXaPlTBkcVriEw7S3aO0kAzUuEPZKfUzcnFcF7nPs@vger.kernel.org
X-Gm-Message-State: AFq9FYJp4yESq4UgWcnN5OjrsTmTgz/xH4WbxswcGH/7clNHmCyHmkUA
	cXRUsI2XItpbFBgGxHXPzhXKShg0lr29+WgTzr/EQPtdWse5KX4jJZ9qWlR6agyPlEPYvyriZnV
	VajYEdK4oBDe6A2m1tiyD5JN/OL9qnbInYaOwF2togqV3J8L4JJ34vFz9VjIGr14k
X-Gm-Gg: AYBFou24WMoF1M0kOk3zE0Ee5UvgiygZ9Cb/MTzGbKk/6Ei8nkkjOJeWTOrIC14hdTh
	CN68OUpfeSVFrZ8Y2Ae8TrL1JqBViYb6EdVqDSAmKvsblTuByKz87gyiignRQMNHY9I6laG0Wrd
	Khk7URzZE6mxWhHsQfa6Df7bEh6HI59hS82/09VrERCQj9yOJYiAbfNaUvMnf+vod4guxK8R2dM
	Av/4yLPmbMhKUHtr/tc6z4dMHWuTPS44at8fsgnmAq0v+jRUK22vHh50iX96cnboQfkrh505EmY
	MVprUS7I7P3UeovlbG3sOUvGo7AGT5S7cE1uR0ntPQAt+f+NQNFebmllct0RSkqqit2WUoQF7yW
	ZGuvqZXs5t5Cz8jmdQudM0A==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1852565985a.3.1791820274749;
        Mon, 12 Oct 2026 08:51:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1852562485a.3.1791820274344;
        Mon, 12 Oct 2026 08:51:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:12 -0700 (PDT)
Message-ID: <efce358a-6279-4b9e-8328-6e704541095d@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/38] arm: dts: qcom: msm8974: Align closing brace
 properly
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <b5553955f03b7fc44d073451795b557668fe0a87.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b5553955f03b7fc44d073451795b557668fe0a87.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXy019tzuIoloG
 PsiNzrrRctfrth0bdKgMnoJBfeNBu9crFXNrR+8cSlh8gyQv7l2vXDSOtVFtWF+ux5DtSIDfmnc
 b2sEV/sKy7pDSyH4MdCMHGEZRlY90eov8Ff+0jeqsFohHqqW4T0n9FG7dv9nSWcMx0ZU7E5h6BO
 CvIGG6nLRMycpjeLa4781xTpLcA3sApDjDMm7NPfbaal8rvclVjeg1WPjtKZoCekw2f9eeP2jld
 6l5gXf6+BiE0mdJZVbrhlTSrLb/me9BHN56TTy4BtS5q5urCFdgf9hxoNdEE5eSGpXNh3h71Wdo
 xtSHGS27TkbTTo8Ij8+KO6CJcdMvBXl5gbGI9yeMHWPcuL+iJbd27g1VGKhl8RFOVv2zSF9XIRq
 PLKeG8zbuGRwQp+2Z8gBPbTm+lMNFOBUW96Qj7CsloIhlX1ggi7IhBNUXW9hLCIO2tIWpRAvZ47
 yyEIXeFR9d3GAfuJ3zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX8C/uVOXeisKO
 zu5HGvAi2XvxPOHw1lG2uQ+WE8EqVF/Jvwd39tH+rtHwyQypDJwFcO+kgUU4fkBGk0RK0v5C7Iv
 2SwIQVpSJHqSDVvqk4a4czg1h6kxouM=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd01f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=K5Q5qJNcHL0jdGHZGqYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: s9_QetmIG13owgvYynUt0LfR9rpPaw1q
X-Proofpoint-ORIG-GUID: s9_QetmIG13owgvYynUt0LfR9rpPaw1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing brace of a node definition should be indented like subnode name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
