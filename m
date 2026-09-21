Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A03AF66F
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022502; cv=none; b=gMLpq/mkHf5Azr8cnBjirnGu4WGKSJ+ooXFx/nsu7FJzOLZDyuHZzccTfPgJ18Nfgqjrd18wbEx99jlJ8tV2MkOAg4CV8hawYj4tsOGRGb7bAzVcgjwwxkICTYfFrXx4soSmU4QugypfwB34bS+Vp1TOER1USaRbd7jAETG4szc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022502; c=relaxed/simple;
	bh=eFvMaJSP9NxzdmA5FpGFNUYIPQE1wmkjcWoOgddyaEw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oas3T7xWvB5Cuz5uxUnsjj70U4xB5C2Hv5mkT41ZXYJGR8gPHf3RZinEuxMD6LOWPQGhiEzFbfLd5KmSYJuscdh4u3AcayDcUQ4QEHRJNOSsprmyT+NXrTz/4FnAqNaa1VpUugyQAYxIBi6n3q/AZW1f4/OdIizTYZiBbmmgpD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH4Ft6Tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlFz2tdJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH4Ft6Tm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlFz2tdJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHNAPp1313558
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=; b=jH4Ft6TmxNUtpqz3
	GFzeyGCZQLrHj2pW+G4INc88sXK8cm36ZPUPS5XFm4mv7IqOeGooKJr9bsDHli1o
	GZ0MslftByyfTEmaquzDtVWs+nf3NhbAoRr/2iSByYgajXyXEw3TtgFHR4qyxNeL
	WUSAo5QyQVRwgOIUJI8vU01W8GTuroNzrExRD2NtwNttTLopFXuHCm8H0VmR3t4a
	NkKRglJm0AIfmzVgdKhudJZUU998774x2dE31/PFrKGEksBYA1vu1h+x08mVcKbX
	TfjMD0qsn82xfc16IXgSsbP1Q+vfkr3Wu8ll38FhM3wVKi0XyTe6gegc2QQt9PZN
	76Umcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerpy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:28:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4517538a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022493; x=1790627293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=HlFz2tdJCc8aTBWBhH/1UjBlf1SlDefpbXdtga9ogcg++xV7ZJxg5bKFuO91g/mLHT
         SjZP+fbsbXzaemXXtRfpLXcR5e6URXwRn8oJb50orYN+hpojlTyjalJMF2ULl50duugP
         opCNwt2Oe5VbbDbGU0fgiyOw1eHX9CaDxxFo0H9/G0y+U5pfs8hIZw1xrXhuod6XxNlT
         rJvGcbKa9ogvPYzddxnVswzwRZem4Kdjq34p/GO3srxZvNyp5x6tlBoBCKw2mAH0Hn8M
         U1CI+14Xq/ZCS3j3UTTb2XQsX0+WqGxJXUbFjVgtH8ZDhRLAFkBgzlsqmj+YNWJQtdNp
         TFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022493; x=1790627293;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=Tvxgm8YE15uGPGz6u6CJ12leMQ6aUI15eJ16qcipMF/f+aQbb7bLSH0O5hRo0MhgS9
         +qENxbypB03SQcds2BDSx+/zLpDaoY5LuRtq6W+H86DeIHDfdo68U9AF15jI5zCcsZX4
         mRApBm73WODzPghpDnmYFFhTNYRJOFS+jRwfOcVAWZqL0SforQGrdhHSb+dGa9og68ZK
         yvn88WKBTbBmaeyAdGTB/T/itmns2p+uzRIgJrciSk0nUR1mtvFTubqOX+NGcL2QKt7J
         A8LVC86DjkEhzZC1yftAOx3uqpVvPN/6Ohp542zxA51fFiaTSrQ1M8ZcKjCML9wL2dgp
         fhwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGGgkX/AfWqB73B+XYG96OLkgCc7nDkiOEsmr4kFijKJKkVHhSjs3BRVKWoyGWP0aw63IPrMBpjuTC@vger.kernel.org
X-Gm-Message-State: AFuF++n7v9RpXGaSTY15BMpqyqqmHYk5i4cqqNoNZ+dft3DpZWADZERT
	UE2fSzwpUqG0+gnvaRFjvfRKJ2JysGwao5LtfRejMXVaSSmLUNn2lQ1tADQYs75w7irL9yRQRLI
	eFQafbrF9tB5IiEnW5z1Y2zvCoBHKWF5ynPwiNyTIAg89PpksqraIxlpo2cHw40UI
X-Gm-Gg: AYBFou3BBIkrK3KCd89FWTwK9IiWFCQfF9q4Mv67Z/ZWldYtsLlT7ZAq8MgespfHdHc
	uWtN81NfVqkq9XHr/hmvqDZC6d0v8gpBzTLOHLr3SDs4AKPpQh10aBT+FZbOeVTp6IYzvrXxADB
	ANFcd3WasU97w2MyKbkddgbanLW1cYNnHNqBSsuGNT/wE9VMoZ8EpU/yCaEXGaGU+bq5HTIEqKP
	36S/dJZ3/sXPbM4+OdCtGfzcd4yiQ5oICZ2QJgRzCtXP89M1TRlVys4zYPxWPFm2k04YiSez20T
	vDvmG18kMqjKwGrgv2Ca7FKH6ljqat2lbiXlSTrrLRSm0y2U5Rn6HudFj8vIBpTcOOG+IakkZ53
	X5lxp9uerntreYpXuT2UzYo+2wfw+YZeZ
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871515637.55.1790022492697;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871484637.55.1790022492079;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba13f5sm396926eec.10.2026.09.21.13.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:28:11 -0700 (PDT)
Message-ID: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:58:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4yFOzN-IBARQiZC15kXT_qReZOFBv8DB
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab19361 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lq1buquVkbxOhH_QKIUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 4yFOzN-IBARQiZC15kXT_qReZOFBv8DB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX8DfV8qrZISYh
 ZpBKgl8MX2Ym9BaV21pkaZSMVwZxqaBFb4awd8rI9S09NP2+X3znqWvdKHGKIFHFeVzNevE9YXi
 l3J2R9+GC4iM1L2OwjSmPs3d/2oScwG2DkTb3UYPvse5UBaN5Qf49dcPyS4a3F7EXjSVzZjxouW
 KTEwiLz2214w09ORb5JNWkOIrDfraPZ4+sa9ZNWyQKBrrLs2Wnua+iSr5ELlWByNBVUcETxM+ZN
 YX2HIUFIkiLJ2PF5m5CxLUkrUAdtkj78VzQdV0uFB466YdcI6UZ6SKVZhZBGm0UsDNCa/CFOmEd
 zagQOXfAe5paZAtmy3tyR040SECUAlgfylfmuD0xlXHsXS1pL/o9Pk1WsOouioNC3ItwPDpp4MA
 3tShFOTflhCaPXdbS/diMoC5U/mJRaF5+qPxEqUwe056lzxBVjG3oMGkooJIwfGfJeJxYn0Itvh
 fk+AhjDhC9yu/PtTR8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX8kT61Ig1IAoB
 sTK/eWf5Zi3T2Ukgc4qki0CWU/rBo3uEETu97lbPh3y7xCbOUmeZ0uDlqydb3xU+AlY2RayjLNj
 AcrFDu2Q+q3RohXbxDXPkXV2MZlsKII=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210297

Hi Konrad, Apologies for the delayed response. I was waiting to verify 
the changes and ensure all the suggested updates were properly 
incorporated. The effort was further delayed due to some slave-side 
setup issues.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below.

On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> [...]
> 
>> +properties:
>> +  compatible:
>> +    const: qcom,geni-i3c
>> +
>> +  reg:
>> +    maxItems: 1
> 
> In another patchset, you expanded 'reg', can you coalesce that change
> into here, so that we don't have to worry about backwards compat?
> 
Do you mean as below ?
reg:
   minItems: 1
   maxItems: 2

I did it earlier to add support of IBI feature, but i plan to do it 
later. Right now, i only want to add plain i3c controller support 
without IBI hence.

I shall add expanded reg while adding i3c support. For now, its not 
required. Please let me know if this is fine for now.

> Konrad

