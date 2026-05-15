Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B9F3CC327
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840691; cv=none; b=uBNDPFyEJuOyHd2VMf/ixp1TFTcZU7RKMWBlula0PCPXVhtB6Cm5reOoQHpQoiKBSSruOrvt6RNrg4l1Ss3qKt0i1e7bVbHqq/6XevhXiBofTjkGAQEdqJepeMWWuZp+l3zyQk/9xHesv9sQFwgQ1VijY5Q0D6jnB44nxP6O9TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840691; c=relaxed/simple;
	bh=unPGu6uS7YezciIq5jZHbFweXvFH7W8eGLAwSyl9WIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gox9KESy97orjnK33nX1DQhEupuJQPlWIsWV7d0Rha67jVEGB4sFflVtoFSB1etbdapSAaik63fymFMHVKA/VMpQzdhjM+A3IVYVLvll2o2UW7gL+xk4Z1WpE7/5NFdq2afAX09wL/683k+ihZbzKh8Bj4dI2yHv6bUYGn90hPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlXQuR6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I89QUfBj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlXQuR6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I89QUfBj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5G0rQ4008232
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnHqlOBnwCvxABsvz6RGyziXmPIuF99UYE4ADmlewwY=; b=MlXQuR6oOnVSOxk+
	VMWL0RjEW2SX3bYM9mKD9YjAPdmACEfJFzVePALzdOWDMXfulaGE2t4bwa0y6bQW
	ivSz8jZnRvNeNywYYL0XLj56jZIuObITLbi/4DwnbMnyvI3pQ1TYkunG2S9+TxQ/
	hZ6emTJJe63LjgRoPzX8oMa+e508I6W8GgHQcTPJL9uHirg+dnZqkb9KozBQYweA
	ScQ1/D9Ranevdw4coQuBVng5Pu1FaSItCha9UPZbTXSDafM7lRr+TjT8ZehsDrox
	gK1BHR1MQfWTKGmY1oGay8G2eJQWQlzrqRKqz+MlVHPS3HUpczvT7LV72NHuZHpl
	fqruFg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stuc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d01ff3eecso433686241.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840688; x=1779445488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnHqlOBnwCvxABsvz6RGyziXmPIuF99UYE4ADmlewwY=;
        b=I89QUfBjPCa5/VoZ4vTSzMGZnA178CnUY3jaU9a211W8D4og1P3FBQN/SF/QVKFYo/
         fRfYVdXmHdZEEoMy68WkYCoI2vTMUnbDpZwnorx8mcmb9WOyJTcZjsYkwWNLq+Qk1Qsj
         8G7Aa33YA3s8dqN3sPs93h4Fc9FExtn/sH9URtsnZKCFnS5Q3LqIptI5ovMHIVqPuhe+
         XFMon8OQ0TsfbPz0dqyG84ZF5DtROL3sye6/bquE5uW7RGesjA2934SjLl/s56Qyem66
         5MaBzNuZ9xUArGEBvYzAqazqO3/PcTMfH6Bb7ScKoM1g5fq+C2eXcYAjnmTEJRRNBvwO
         ZTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840688; x=1779445488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnHqlOBnwCvxABsvz6RGyziXmPIuF99UYE4ADmlewwY=;
        b=ABQinfm5EaSUS+MDFHToHgDYvn6iHwX9812W8F6Mz5+QdiEvn2Q00gKLBxP6BzLhUC
         mfO+QwdjfcukhbHZPMVEQpoO1xjSMvNKKtpFHfFQFtP43ArtM0dweCoOUmAjSH2eTf6u
         cZnEfRT8bzUCNVnrT2QJk+IlNAwQKtPfrxVM3yo/mYhiqHhUI2vKt+Zfmdz2dedfq6ZC
         bN+nwBh8dawI6h+hN1/Yx+eKw6MN6YlWzptl/PDLlAycIGoxmoi9EfefrQhKaMw59wlY
         4LWDoJeX4iQr/iz+eqEZKGX8eGHakLUelqIyLOTD5WOz+tAC1cdH50LqHSZzRiwn6c7q
         OclQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tTs1PwSZ4x8EANAjncOzeWoPoBlm/Yn+7+av2rW7H9kPkeyl/sAdu/gk9i3QUoRCMUJEMy2CSC+xG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt0m8DK+7Uo2F+VR1OnAfsw+a9N5mOfS6ELjkEiGbbldMVQeCz
	ATa36EgU6pf8fj1cJNB6JL6ae7aPQGdLnSGiQlo1GghvDsuI8goITmv+7hDEskY74u1BgzxQH73
	ED/ZdYG4tIZoP2WpMoZY/55fbOTkSN1Aa4Tkf2KofFb4/d3by5Pk1s+uxdzOiDpQT
X-Gm-Gg: Acq92OGB8MP/Gi/c9HOUNYoPEVLNgO4HLN3crdijJGTdxMB2bG5QuFksCvpkncOZIBu
	wV8tmzsQdzQ4Z8xIKlfGZDlgoPZGQO66ZAaOObMu35LSut3RBUxaYYf1FE/aCIZXB2uIviWenlO
	sMgggjp7olI+Cc+uvf5Nv4b4qJzCVW4UzoONxRbA7dEN3SW0Fu+JI9aN/0g4EZfsHSDbM21TsOn
	1cLdfl14dN7Ir3TbRJP0xU1Bezs/U6NnWc3xcXqkzhTxMWT6N9ZDXzfKvfTgZi/ZFC1rMI6C+Jj
	HnNjOobdObvBxa88qCNV9KzeRnXFawBaoU3JRQW3bIc1ZhsbyvMhnwBaZxk0YycH1OzatK5zuUk
	tvoNA/kfqLJ7ZTKZ2v1HFw7qIBSvehom+p6KKcQHqSy7UpNnflS3tBa6WzHFq7apVWOExRGQDj+
	1fzYeiAuqgyN7Eiw==
X-Received: by 2002:a05:6102:669:b0:634:8685:d331 with SMTP id ada2fe7eead31-63a3f59319dmr398405137.6.1778840688116;
        Fri, 15 May 2026 03:24:48 -0700 (PDT)
X-Received: by 2002:a05:6102:669:b0:634:8685:d331 with SMTP id ada2fe7eead31-63a3f59319dmr398403137.6.1778840687727;
        Fri, 15 May 2026 03:24:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm208202666b.15.2026.05.15.03.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:24:44 -0700 (PDT)
Message-ID: <e942c86a-d56b-48cd-a344-d154322bcd70@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:24:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
 <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TM9eA0n4s56e18922KWD7VgWXYIgmacr
X-Proofpoint-GUID: TM9eA0n4s56e18922KWD7VgWXYIgmacr
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06f470 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kIEpkeg7eEVi8S8yTT8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX7whwwHpugh2Q
 iiGZPz9kQu48kjbg/v09ehuUyYBT5DwTrVw9BzEwGieMm7pwIhsrWrcy5oLpk17dK8UXT8gZDHf
 X+t1Si0DwVujwNjGtflg54yND9xFqXBNAgt0fbxARVLvUAnAj9I7FfTpSmQnK9E5XTNTcnyDfLP
 OFCKbvRExz696bKZs5SOKd4YpmjwlsO0QSvd7vkdkb+mctc0mMi1Umz22IRFMWouF2QZJA62lYQ
 AZDVTiDylvstqxhwh3FW5vuy/3mTFddMe7WnbRSjBOdz2mSQEo4ob48k/XTEhaDH6KW1gO7wrVF
 zbfNSUZWFYBpoo8nAyhIOrQwWrrlpbibufAJq7c+yks0hrMhmIiYqbmF8rtz0RBAkwlJhhe6fBX
 3BXdPbCIAnWFgtxiU06PR32ivyvm6RyOT4tWpbKfluKdSSpGu6vASTTB7FiCdeMgoxkKTrBobtG
 SAqMMnt2zoPnxZrDhnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104

On 5/14/26 10:30 PM, Kuldeep Singh wrote:
> Add UFS inline crypto engine(ICE) support for shikra.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
