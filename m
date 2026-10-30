Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349422;
	b=EcT1S9yNNiTIbGyEW6vswiNK+hNkf/SqtlW8gy1KrqJ4KIGBhQss4v3uQPbyR97fMZPV
	 /60JwetMVRmXmqyuDB6k9cgDQbLdFun4gxtW7PqQO576rfUl1imiBB0cfnrwoQAVg2dow
	 aMKxTL/QGwZyUQ/emA2l90LwnIN+Nb2HOyEXeNSOybOfiE/XkmMwF2eW+389ekqmD0uFi
	 jZRY306UVgP1LcXvqAYJBBZyS01ZkqSfMy1FryIEbueSUKfPjkMoFXFL0qd/HuU0C3KOY
	 z1a3FIqjzoOcxo/Q/XFKTR2hqb2L+lJGl9tDMNYrdH7HrUtH9TZ0y0hhc2xvtYIZ2eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
	b=Yf1MAkQltgKr6x34UA+hxjS9LGiMZDcOsKFsv+5EcweXxUbsMYggaiyieW1AIFFwtiwG
	 K2aNLvSG0SM2/yFTvrsPcLl8VHrut9LdcCLmG7jLgfJRdoOeBBUUNe8uLDc3K+azLdL+q
	 ZuD+QCgnHuQM65NBjWmdMrMnD84NUU8IDoIITUOXQw7K3bk0I3TXzLGfuAax+R3Yhk33x
	 Jhc9GreVpmYSylyW5rruPyCBuZXBNkWWG6ZZvTGkL3b1Yoa3djZ06jMA3ScVZI6ol78LU
	 SZqDBrI+Un5AE9vKn21aUUyslB7uLRt3LM0CXCd9v2YAf4AlvGTNWsbx1SRK5cIja4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQ9pIGGL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guRcoSsl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA99606A32C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA99606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQ9pIGGL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guRcoSsl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIhL2733212
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=; b=CQ9pIGGLRtsEKglA
	dyfY+1PCcr129kLm/j4EmwwQ33yGFTIMwQkS6Z/JRu7is6X+oEImWsvDjTm8qvnZ
	BnN187k1rFL5mDeOEERloEdGDvEFqHZFnpALLy94GCaihgjcuLHZZpJuyivJT84w
	FOA6vLXYIw9cD77+uhqXqqoHBYYcBey/bwm0BBHdBzPTkRifVTohx5/ngddc8asu
	S5nXfJK/0NcQfimVLCxH7ENfmYHeO0+iAFNUi3ggZeWWLLK+kgRtVEcsaPoFfWP1
	E7/0VkZLmNj68xc974k0J8Ewn6Z1F7ULkn0bPSDhhpn0VWWDYodbKhO9ZC3t31I3
	7F4ccw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj14t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so2399785a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349420; x=1793954220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
        b=guRcoSsltxLg7pNV7iXFJlgO+gkzEYrFYdz/SdPQx3A5yfIIMIQFcn6Y7iJLbtoiuQ
         sQx5Ej9PRMIdlcym9AAi7R0x7CoZYmZmWA4WpfxrS41AK7v+45l+Jrkmg+r3KExiwkTX
         9jIzQf4b+m9hcAh4y4gdUIwFCggtF03JMwP2/b14/Xm8H7FRK49OEB8dKZvWs0Ui7e+E
         hTpCwSuHOrCzSklaz2kjlhSiAl3D9NgYyUq7DLi7+hE2qpVLg+vrOLeYAJMyo4bTh+sJ
         574ehhDLTcGe47jOEd9RPssxOm6nVlWc0YxvIEva7rmX+yfkhXwtmGE8mTqeLKOsjTIB
         NUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349420; x=1793954220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
        b=F3l78IGL8JeYbMJx8Lz/VieYruuyyuV4x+KBLKkrjHbt8pke+aGSP+ibGr4xxzNi7k
         n0dMHNRVMp9b8mszBxV4b9QrGARJKk5bJFkI593MkZNkG2vaBzmAw6KdaFSQqmit6JWG
         TyBvasRdqQ2Va5LZ7tlzqfIgzYNiPHDRnGlf2IwiEEjrDAKnjSee9/KY25B9AJLvO7Z9
         MzNgOuMfO6a6wL/2HrQjlur7c/VB4z7Ay7JSsRx1GjirUE1p5XgFWEKP7otCJOyCa7kR
         PKSkWF0YXISfKzIZRCw4LChhXF8MoDXTG4Rmk3uebGTJ42B8Jx4LErUDomgS2KrtyPbQ
         8Zog==
X-Forwarded-Encrypted: i=1; AKwUvBznsGwhSFLolAkOhUM+8LZpm29uiiJT8cosDogtf/6JebrRNxTrhnj/3MTKQCH0kJvXJ6LEhS1qEASx@vger.kernel.org
X-Gm-Message-State: AFq9FYI07XZULlUbJHdN4WI0sy7kh13EudKLh8tlEGfiPfs/O4KvWAxI
	Jy6wCo/+ZbiJ0Xc8VLfUcfAnDDpZ7JNwYwkHmaBZo941qJojwFPgSnrETgVsjEm4G3PXPTnEyL0
	KnT2LVAlX1xdHb6hEaPBDcsCNybDw+HXbaovDJQOryVc9eQrNXrBsJyHTvv6ZDhebrlnT1mPU
X-Gm-Gg: AYBFou3rnAOp86It9hzyZeAwukqLEmMh0leDdwft2p4s3EpWiZu3rV2BmNqx4I6/slh
	JzshAznMucl0tpCiylxwAqV4Kemmu0uhe4C4kh90yRT9KqYyMUoAKcry5O2A9cirYTtjttjIXcn
	beRQbgtAsdLSnQkF8zRvswXAsyfU9887p/PmBN1dpDVaD4KL3S398uMqdAWBSsyMvK96XzSYDPs
	Kf2NzsrLbq3zJ6glVLrnf2v7gCiIEgQ1GX6wV38/JrqdJ0yp0yAUbwECgOgoyQF8bIyB+xXSnVY
	UqRveRmfNqHl3R7IWmTBnJEjiZ+EXCkyVWAz1nkTcHXDTIOlh1CSr/Vt/EEZ+Mg/FZi17NqIsxJ
	7MkX80QKkBdlbCtV8b0fOuYEIH/Jx1Z3kmYrUv8Fq1EKqqVF6QFQKVWMI0s0EzLN7YQghT8c=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264285185a.6.1793349419899;
        Fri, 30 Oct 2026 01:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264281485a.6.1793349419400;
        Fri, 30 Oct 2026 01:36:59 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b42653sm381344a12.34.2026.10.30.01.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:58 -0700 (PDT)
Message-ID: <fafb11e3-2ab2-444c-8eac-e98173db103b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:56 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PsUPcjJCJkRX2ArxMLmgc3___VJAdA66
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX2idhNtsFbT+k
 EDBf8zyIlQ/0qfuUPQG3n6QShG1JleyNbwQX9xh2CETuysOsSbw+tP0SjcK5dhgbUP8s1WqDysy
 9rBL2KnrRJrjw8G5YVOJHGYwci0vmZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX9PyOoeeio6M/
 /yadjiCiuyvSKSSp+gSbgKbbryC564QFo0ys6gXGfa0hS4Yd2ByZ+g9zypDBqYNPwJnBxnSq1Ed
 5KpUMn/3MP02dpUCDbv+2uJrIxn1xVaqV895TP2xRbXqaOMYl2HufhQY1DJFNOjbt1O8Xd4Hc4O
 /R103QrddSFQXQbdiES5SyHDNizyqYOsRGkioZaE9Rh10jXGjaWEsJl9QhAXUEAo/xdVKSJf8my
 7TfWCR9ZUyKK93/Hhte9tumwot/Q4/nvcAUcCnZ2QCuEOjnei4n7zZuxQQO5/cyNos4S9aiRVif
 sS4QNrx5aW/RXnSARVvlF5ltyXtN7KMCk9+cjMa138vN2QvgF0562ita7iENnzhH+69+jUyPYMA
 ZprDqgQiFd4/UfykU7TQ3QOj/WNi6+rTAQBXfKO37smnWRa6T/ISW1hlMoee3mwtIitSV6FXhEp
 aF14wr3YU6aDbANcKsw==
X-Proofpoint-ORIG-GUID: PsUPcjJCJkRX2ArxMLmgc3___VJAdA66
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4572c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wC0WDq5Qq4zySJWTHJ8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> Both USB controllers on Kodiak are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
