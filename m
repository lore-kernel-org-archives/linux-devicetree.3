Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B73ACF02
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515931; cv=none; b=e4VVOTKaEYsX8MICu3uzDOcajinONblzoQICz8UI88vzgSMej/Wo54cEZRvqFt0jA8nYUZXQTGlii0jvwil0Wfl6+htaHlauwKFzyH7AkosWRq32VKKvg4Dzid9oPiUTRl1M/6+dmB1glZCDvQWQ39FuMeoP9NwNQW6QUgx9mJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515931; c=relaxed/simple;
	bh=RZQOYcB2jiyDS2LXspF4SSZXkopk8ECCnx7tcJS2WBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwZO0RxPxhITR6/8fZ3i4nnCyHvTACIjQesg8vgaC+DpKPm7tm3lQXQWieoLJUbkRujmccEMJAhmwv8IIX5NmcLEJ4G48lOf8wwYFiPv/TNumIgU5Vb6WUFo6RDLxn59dY+MtFi++uEmkHVOPKI99iiFXU5etpjpPlSmlaH2naI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WP/Rvuk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VU8GmYG2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WP/Rvuk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VU8GmYG2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mp0K2430105
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=; b=WP/Rvuk5si27fCdX
	TbcfRpWjVbcDEv9gjtvk/TIZDS15BYTju2ehorhc6zlNx6aPTmFUGCBkyJJH5zgS
	Sr4nwBY//P6buJ/BlyOzc3xaEjmloKOhHd+sT3hiPyy+AfCL47tcAFKS1qHlOIXi
	tehsv/3w9b63NCc2qEX7JIAZ1R+ECmTk/NbhyL3FF491HwcXar3AhUSclMOYNCPa
	NfhkCmiIScgCxUJyUl+NJWTLN58bVbZ+lEkPKUWMhFAI/ulTWQbC4tlOxVKms7kw
	+uHWpRPKMh1Pijf9yyfma7PLAMTk5PYOfqueCSJZFv27pg23Fd2V9AsthO+swzvm
	je6Nbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk921np1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:58:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso2100801cf.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515928; x=1789120728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=;
        b=VU8GmYG25SOrFa+ObUDtJJsKkelQbfipgzxFEuzfoA5APtSiaNLBfKZIMOhOUitKat
         RAvjTqsKsj5PywhEho6G4zbZfJaH8tyt+SamfOLeUoABjKXCaJvpX6ZSaiOmdG92xFPj
         fbHTmVmj8lJa3WphIzdLYPEFmuN1rc10CshiGqIny3jd1yKQebjRiMnwUKJcsmlfbaky
         OrGYPDrxZCF373C69GSlS7cKyQNMZyn1LytSFvrmzJsKcS8jOtNxhU3vS1sjSF8Llrz4
         gZmAozGJI2+QSZuzvxMkJHT8ELcqgx+JspiwI0Q/1LhTQq/lP5GWmM12O1fRBMRBhO8r
         DUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515928; x=1789120728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=;
        b=qToH7aYpCewZs0y6jRby3/1fRr0ssszb4CgzgkeNcrV6Mb+yf02593Yb0FV87eiqk/
         9w45KGIHh9tAWLLloADQUf+uLoy+HAwXuqsW+mq/ZTlj6KIaInKP+ffLnpscAOX9OB3o
         mgTnXMN/vAlUAYJc0iEugtAL+Fl+pp8pik/NSmYk4n2jqJF9EUAnehSiygdEuzuOvOoe
         js63O7N7IHrmF6wiPtwb9gO0uG2kU4oVmkeUTOpSSeJUxjWr+qATMR/nks75EWGFCT5u
         /K96D4gFCRVquinLyZ/XJVTdOzipES2WOnaVVwlqwwAQwTrYydijxctvE8B6mKg4Y2sf
         +e+A==
X-Forwarded-Encrypted: i=1; AKwUvBxoUVjRofKwzNpYz2OwLQhoRlvEnReQSqQgro36A3MKfA7NWKIs0BYKFlOJ7Ghd58cXHzBfa5G2YknJ@vger.kernel.org
X-Gm-Message-State: AFuF++mo2pukF1hT1GFF22DaDBo+t7kZtS1OzB75S19A7K/Owpjga1NO
	+i2fS41KplMyP4asCo7IxzyLUsvk/IN6ug0bJYL+HDUlTIPEGa6qiMIc1qSTtShHaO3F/R/HKhJ
	a2No3Gtcl38Y2VdSeaoNrCtxvDlGZ/tbWZRd70xjNKyyPF8A6u6D0dgHeqBlvvztm
X-Gm-Gg: AYBFou2R6L2b2JhnVknKT7wNZ2ZwfIeYyvLSxdRN6o0fG7buTrH0Vqc0MFnQowtnxxe
	FDR1eWwhCkp4o1XvbvrwWOytvt2d+bXKRIKfUrv/dRqs30PAJj4DlQuZvWUgYD+8bR3zgRPJjKN
	khFTilHo0IXojVtTY9nZ48mqlBlT5axJRaBOZGPtAdgRBWXS1zQ+DNVyiaIeSPl82FEHa+a6a8A
	UZ7NfCev6PXnxQ9cehNGKJ9y6UsxWl4m8sC99hcdrrXIRNRCHwtbvdGGdKDmYpIqysOPFOHD/JH
	4aElS53Ew/SGE22ZjQPXMNY6/6vwuINwm7uCmuZzNYfwafKiED4WDTqg/MKHOmv3u6uYD1ajbyT
	fyfd2VwwWCvJHRi+9jV7bWA==
X-Received: by 2002:a05:620a:27c4:b0:939:5924:e319 with SMTP id af79cd13be357-939803ac3b9mr301876085a.0.1788515928464;
        Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:27c4:b0:939:5924:e319 with SMTP id af79cd13be357-939803ac3b9mr301874685a.0.1788515928017;
        Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm84604766b.14.2026.09.04.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:58:47 -0700 (PDT)
Message-ID: <17067330-5c1c-46cb-a0b1-7e328820bce4@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:58:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX0OTrd7Ki+lOu
 ks0m6OsFNPz4pQike6DIVIrNubpJpRfjGO1S/G1FlKONGcNm/ZM1b+jm0EcM1vY1jN2eUbn2t+s
 QvCsmOEd++obLsETVUhc+L+wYzdFXqUsujw1Xtsxaf0AVZWE0P1L+Z7YcPnbQY3yDOKVkdamgQW
 nGTkJB1GARtJfoedxOoRzS7BAa+aIJFD/V/xlqUFM9wr0uVIZyNEoQLX8x9NJDLSh+oq6kh5fnr
 Tk4VES9ht46mBMzA3/iKFrof0nqTzMl/dbeeSFI3LkzZ98dBgnePD9WyYKMHCFGsOTWbZpEZcPB
 ufa4UYLVWBCvnFwDfXzH/6PSZJbF9HpRoJvd3IzHhr3OO11iIPmFYMnRay6jGiv3MngnTSi6yg3
 BdGwctN4CPhnNJ5s6NikkGjb/+BuiW2pm/zrixIA5frBr/LsYKGWGjw1jLx1XAGfAyuVJgZr/MJ
 p70clkjrdYEtSNNrRuQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a9659 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YHrH2t1qFSG2L-rfozMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0NGmD--W2WcBBfjYnqsQSUjTzlfsUyYV
X-Proofpoint-GUID: 0NGmD--W2WcBBfjYnqsQSUjTzlfsUyYV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX7aJuK2T2VNWc
 62Fvq8vN+FKRo3akNrq3yoihjbkCto7FP2nxV2hQtP/0nOoed0WBjxRe55igGBXlQ9eZU3mky6M
 ti1CnWCl2HgD+K4X1pheipfuoREgdvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040089

On 9/4/26 10:16 AM, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
