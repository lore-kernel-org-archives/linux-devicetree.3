Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4079517A2E8
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420395; cv=none; b=qLBhqCEiyEFu7sIBetz1XxNSLokS7rCm5IZrRnQLGAyhrtc5rkEzLQEzPJk/0w1ZGFL6gjM4priwe/4vU4GSaRk8erpkiErlgLAI+FmmZCAGqmZfioA3+kBtQppLpAyxWZmOlUacJdXXFJ/sYEJ0mcr7P/fJMSE5bmOaGg0ZKRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420395; c=relaxed/simple;
	bh=cBx2KYokQieQkn09GfACSVjIHXBBt9w5AS1zTR8uLVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4i+vh9VGISohSwjLJRazLSCMAW48XxWPpAFbYy7IhTxRP3FkUPQGP3TT5DyqKdVvoHpmysf+t8zMfjG3TR6XCs+nVLqsEi4KDpcBcNoHUpu89VCA5eJOJ0ThfSIxxUiLVj7c56CKcQyCSyO5GWXIkwE3sKUuNR0OuVIvH+hbFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IE5Dv+vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mi6d818z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IE5Dv+vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mi6d818z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lcY2722041
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=; b=IE5Dv+vLFSsykooZ
	eriohbqfVxeFdcKUZuklkdAOD+jVsn2dGHctM3Mai+vSHF5sVMADe4QHGHw/SMfc
	SE80FOy7RXgz8gr5hLDGhvuaLwr6USRQRAKWSWZ87AlDILQ7Sa4fpvdDsIT98dyg
	oSkTfyxEpDrUa2BFmm7aI/2B6BUGumGScrv+RLvtzljeM8xWjMPD4aYzSHv/ltkE
	AIwOk8FqoRK/xzdVnATuB+1AJ6C96TP19Bi9umraIMNQRy4fPBw3N7/VPJf77lcA
	v3qCWo+vtRzmjTyGzsVxEYebOiNr1BT1MAB2Bdzcge+di6l/FVShWLOqVQ7lIQa4
	90eshg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnku1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:26:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390890ae83so43862785a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788420392; x=1789025192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=;
        b=Mi6d818z7pet8+RRrRcn0vgfwIzOLCq3GBSOsVQlfHDGeteVlm2OqUwrkBHn4o49Im
         HHncQzfBjhSexRiIULE9i3B3ZO6KlFjCTQHreiQPBt0ZzaXyD8MDsaq7pf8QO4y/o2Ai
         iz0u3LxMpu+YsuBZEY9fJ+cPNnbJfkrw73ysityARCt+SJcuy5ns7io20TqFcsVPuyWU
         VOX//if5zQc/E+kBxSKZ90ZbzZryZYplm/0KMvWrIckeM6kpuzrblsaxqiiDJlzUCC9O
         4SiMfJbcSxIv8tIrQ2+Wmvumz9tkwWbiWh2r05wNx/GNbNPtQbe1GLtfMsUxA+zL84ol
         RHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420392; x=1789025192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=;
        b=WKUy4aZ7rcYGqo4iNvixZdBAIqprf4hYh/Q+PSfONnEOJ72MsK2x8VuCcXNo+2tT/4
         9hyUbOOHoNehADrLIHRMZc8FZN2P5PVAb4/cig2iTU+cuehlXhBWdZglfJGQ/QGsPjA3
         Frkd5qcUnBuFJrHr40OgNOHcqd3t3/sTh3AyfofVPFukyyiY20awbmbbJDo8Bc458ZQI
         82WBNdB5jErehNY0/31NNnzcJULThqiAwoYUTn5nz5uVjdavY+g6Bljm7WX9PPcqHNuq
         17wHRA2/ImH749ejthnUqrx7NwsxDR8SSIz99aqWOP1A4W3ZpyyelsP9YEQpCvy3Jyhs
         snVg==
X-Forwarded-Encrypted: i=1; AKwUvBy8XttBBZEptHHMfYOw6RFXsWG2dC6AEeLCCKlTIPwtYwkGmjxsAPm9n2vrHBX5kb8iy/W/HY/np7xM@vger.kernel.org
X-Gm-Message-State: AFuF++ntc+cCS4pxuwCS4QFotBmwsa7DxmxYnpwrtPggpQR/+YsY57RC
	fu9SgWQ+eRJDslHwfeAEYTeybWehZFxPO8tBpNJraBvr+N/odryCZFz8sOgOL9mrmjXqejf2s3u
	imPnB9RL62+kVw3VZqGGISSos9zAHGZYTtupOhDUHHX+18Fz7L5RX3pMMkewXhXn8HPFstBl9
X-Gm-Gg: AYBFou0pbK1AisVTd1UfYqPvYCV6MTL+QWZMGXcG9/roEytLsMsm4xfu7j1VsSAc+X6
	GkyZkWQtlkJ1dpqGG/Vo6MAaZMMnhdCsSw0MyxW+RvOmpkdGPtKCEoyS8BmuImKyzd1Kbojb2ts
	1rKG+bdian+m0U3thprf5cd3ydTO/7N7myUkDPR3v1N1yQO2Fd9F1ZZ5NrUuROTdJ3J4IPAN8IF
	/WTNfyaXTkkn2Z5xY6cV3n1UBmz4bxZ9w0aO0QJVUTkDS1O84qsuHKlaVkXIUqwj5NYAfp2sFJh
	LM+LWza65liit8UmP8A34i7QcDxqwpOYsLc2c49xnuvNAXYTuWoN1v6LOEB45bjvQw2I1ZtbxkC
	mZv3nNXLuX3v9rZ4K/veDdQ==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr724238085a.4.1788420392510;
        Thu, 03 Sep 2026 00:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr724235885a.4.1788420392092;
        Thu, 03 Sep 2026 00:26:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm44785366b.35.2026.09.03.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:26:31 -0700 (PDT)
Message-ID: <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:26:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
 <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sWQLUbC9cGs1_lynVURD_P7J9Gcoy7-f
X-Proofpoint-ORIG-GUID: sWQLUbC9cGs1_lynVURD_P7J9Gcoy7-f
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a992129 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ULLzqpmbMi5bXA3aPCsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NCBTYWx0ZWRfX5S/wLazePJrV
 VyXo0z/FJ+bvLDyiKBz2zBMPIAOqw+pTJ7IqUwuvaMIoiCcDVzDcDPxYWMpZMqr6IGo26ds+DJ8
 YqGEboAS59E/m4W/yRBS5QLYEnSRsNQ9AcpK6eZet3OtaJKBhpO9UaoRHCxAqXQaRu3JtzvJdKh
 rTYzpVZZwaRLs89eEmE4WMV51JsF/FzJTr/84G2kMh/QfbMLIycUVv8dUN8N5AQ7ULj0HcASWQD
 Zmw2RX1FAXTT+OYDhtmLql7C2PdvZ3TezZ8CFHEFJl7sRaq1j3tfR5EI13WI04H+VYyXX0TZtFU
 iZhN6NDs0H/Ur7XZO9BtABzunZKTx1Pv3MeHfTCySRuGXvqS3gHW35WhT+hMeQxMaZJ4hP2DXnB
 vogTjDFP2IkukRS+j7i0ZL3B/iSACPWi5n/Dd21IDGC82crJF8MCqBVVSCWUfEXcmbcQl4k4zT7
 vN1jFn9cr1602+Suiww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NCBTYWx0ZWRfX6govcCCwMhN3
 ATopADgM0yCSz1gPJ9ZVcREJSpclJLKU2YsS61FS2S38VM/gr1Z5Q3JC5GPbaJqglx850oW35wu
 Lz6aj2nEu32DKsvWRbpPEuDCkVnaESs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030064

On 9/2/26 10:52 AM, Abel Vesa wrote:
> On 26-09-02 10:30:38, Konrad Dybcio wrote:
>> On 8/24/26 3:45 PM, Abel Vesa wrote:
>>> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
>>> and Volume Up.
>>>
>>> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
>>> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> Can this go to eliza-evk.dtsi instead?
> 
> They can, but what happens if the CQM variant remaps them to some
> different gpio? I don't know what CQM looks like.

Can you find out?

Konrad
