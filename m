Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0338A715
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417495; cv=none; b=sEiakIan7RpgYcFQUqyxSmPvc5wiw9Xy/oM0TwIIJLFhe7Ebe53duPZUFkEDOcHuxhw7URS2gIFCNUhI3I+pTqWiB3K1s+KIvSRgzet7uELnzkudlWVuLuyQ/RKrtcqEjh9sN+P4WKrtxQmNSHGOj2yMvr7BHUrv9k4j7uMIkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417495; c=relaxed/simple;
	bh=kTSx32pwz72ST6W1u3JCf9MAJhvDpt92EnV9VM+cQfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhcqFrc+KrDB8BwuQ7CBOa2rEK2XzEn9cJT2MuR4fp3RBh1mucpqNd2X+Z6L3eUlo0+1LJ02F9b9wgU9q9AQtRFmHvNaybQrGIjBM+7D3r+oTPZN0BScn/3ZdQar9eJcejdfzAecjo8Mkdf5Fq/Hq3MDL1LrbwhafgpNymt96xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3ZpkMxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3h/M6MU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3ZpkMxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3h/M6MU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lg2B3176919
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPYnMIwUt1sAQ3vnoWcYPF0LEE0sls/qUz0yveE4jHY=; b=f3ZpkMxwK/+SFxYp
	1VSGD+lmxJUXup4wwz+QJ5EvxIHdseXWCXvCW8HI4C3+y2M+kOuN9OKa/3aRutCC
	T2BLKHtfW5/vXMexS6plX4GR9EtB2Odp91nytHy3+ZqwOghXrHd4MuID4b+YYyrh
	7DjkItl1GBFHEx88OWJ0nG0scpZ+CdF00vd3/xGN+h3XmWhxXFikFqqasnjmJWwo
	Fqc4vW5IxEsXyRflF4fFDFhOuuQ2q4NaNr0cU710IuGM2Zyedkm+tuef0Xm/+XqK
	1IgVs4Lq75IPKHimS2mAR/f91thuR6SmZsIaHrko5neIHtT3hNVOPg3I0P1v9tqc
	Mkc7Nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4uuca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:38:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9392788b3f8so49448285a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417489; x=1789022289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPYnMIwUt1sAQ3vnoWcYPF0LEE0sls/qUz0yveE4jHY=;
        b=P3h/M6MUC2Hl9btE5c7ksr8t6zBG6FubU5SAfHD+ehguKSExDEZ/Q2SkSxn5kvnnZC
         apVm2kREMsIK7tCn3mGpAj5tMNdXfrcYsVHivpEFvmvXp/stI6wyJHRo6M0vje+xMiwG
         2RB4KCtTKtZIIPPMMLUOivnSmvKZDyH6ghYfhe9c31Am+vhLZZStLZua+RIUhw/4BAP+
         sGNpH4mi2QeSIf6+2s1oLWhVjMVYelFjlmeIqu9gBB9H3PCuZmbhXmcG2CzBbCU5Z4Ar
         /F3V6E5PecrAtOcs4H/4RLsXMq5ahX7auTc5LwKuWQo8HtBNR9LbYiLsLuKFGrz6AWn+
         F0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417489; x=1789022289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPYnMIwUt1sAQ3vnoWcYPF0LEE0sls/qUz0yveE4jHY=;
        b=J4BwmdgKhR/IThZc07UPSjZ3sucEeor606O0jUeFdultT40jdMyrdZxYTjB0zhTFLE
         uZ3ZZCXBOAkxl4L+bW8ACgHxMOBS0BgfB+LEzchyaMVOPHsbMi0rvNzBf70BhLgAOd4B
         OWi34utdt3LV9YCAudvnMDG8p1O6rcN99XwEXopG2x2Q4SWstr1ObvWi3SPOANMoEMnO
         6qtH1uQ2q/Pc7NOW/c1mGzG0Tr/EJy1aZ/AfeIc57yRXlAbnyikn9Ol7aRapJzJnCrEO
         nYIHYLYJWafB5Ydifoz+eMHiTLB5B/hd7uH4kauw/0VvVRnKU950cv8Nv2rYohavKni3
         FGiA==
X-Forwarded-Encrypted: i=1; AKwUvBwOSW3c3GpAewn2C165IkwiCcUAjBXzVv27oENgF/1xjofeTKoDaKyw3vlY8cR/5bn/ZMrHUvLgxDIZ@vger.kernel.org
X-Gm-Message-State: AFuF++lZQ++cBhN95pSFBTuDyqmvkBb7bxRJOv/GyCB9/C9t7obMiaYq
	djlc9qBq3zmPqGVzVjoV7avc+BX1dxmdjuFg23DVY8/jICEkfp9mET26joNAUNJMWZDwJa4EtHX
	tsTWLvLLsY1RnEDiXbDNfyxVUVxtqyXzQC63lnW7FYLU9NjLuQXjQQDHLUqrgo0kv
X-Gm-Gg: AYBFou1Jq1Xag5FOcoWoxbI687zR0eXUer5D3Xr1kkoQ87iw7QfM0i3JiHfX3UAQn7n
	0rBcOnyRLq3BzLOetXOYLb4Qe5gAGSacF5Sgaj6YwZxUjwv8W7XbVhTzq2g9Fk+7c6HoslU8Zyo
	TkdySgnGVWt75rtVgs2YIfmo+/SFZWBciyPwEtkAIZXKKQzOjUhuSIm05YtPoE4ynYa/E6UshT7
	bkjmNcQByBTKqOynaXBCDE9hQuGUO1IH3ZeWjQboMBrw6Rkhgac+0sLTnPUX6SngRWoPJ3olFjL
	JCmRzArY+WpivE4MTVb+i4kgtUkT3AfwYKO2V/iFrreO1IZ3MriIfNvOlSeYzv1efHBcZrual1W
	28IQ7zFKq9PIqCsISkPV2Cw==
X-Received: by 2002:a05:620a:8388:b0:939:2880:3d6e with SMTP id af79cd13be357-939610433dcmr718368785a.5.1788417489253;
        Wed, 02 Sep 2026 23:38:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8388:b0:939:2880:3d6e with SMTP id af79cd13be357-939610433dcmr718366685a.5.1788417488768;
        Wed, 02 Sep 2026 23:38:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4236f8fsm50762866b.53.2026.09.02.23.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:38:08 -0700 (PDT)
Message-ID: <9c72e597-eef1-42c8-bb08-a9d3c08ad4f4@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:38:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-google: Improve NFC pins
 description
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-2-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-2-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX+dpvjYhjM/a8
 8ZaBoqOR52srJGS/MePRyw6jg5U2fMiP7XzhP/zffKryF8iTcmWoPMyAIirAEpoRbuV4k4u/LMO
 i0HjzoyA09hvE5ZclfYwhYREvphgwpfLKC6wbFHuhbYvtYTAVNhNhknqzoiNZMrtHtCxNGjRUTr
 0zS1H+ldq2/90RTR8N0ayD/pa+hoB0Hi2gZwfcAMxGxhS+tdnyDyH/DIJzIoPDwT3wDd1cS/cYK
 QctZGY+BsK0Gbiw97atKy4rYc5EUarq+ChxQoAuSR1nIBhBxY9FNq20vY3xMxXKsJpj0FLYq9GK
 E4/J9oDNgMl1hy6Bms04jw3YeCRLuVgyBSs/jvv1VsimXtd7viShVEizq+Kdbw4dd5QhU1bgouQ
 p3qeYQk8utRONEsIquz1KiBQYBo9HqQS2AK3bQI9kxbOSXKppKDtRtSe+zy/c0oTvl/El4ijhsb
 vLbE6RhbqWl8YBlsb5Q==
X-Proofpoint-ORIG-GUID: nJ5TZvejtX3LGulsl2eVVmW-hHvHubQU
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9915d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IwCXldT5zbx61SKktksA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nJ5TZvejtX3LGulsl2eVVmW-hHvHubQU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX2+ekgiyCItfS
 6dERCNxQ5PqrNVXrC5Q7T+DyzhoAaBaF/nyf/w/1NokecKUu1YWnw5A/ZxApHuG9f7rx+KLfNdL
 /PcvZ4HYGiEcAFHiT7t2y/t9DTmjTgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Be more clear with pin description and group all of them into one state.
> 
> No functional changes.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
