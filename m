Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C7C3B8D5C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030240; cv=none; b=uRt1JPjKcz4KsoC9w3sXsGWIpU8HlS/JLuowqESkkZ+h9gDkVogEUo2vziypqbR5i/Cor/4GG6lCyLOnaHkK2vlXbN4xLDwHZTMb1K0YLRWGD00yHQHC3jiIoN5nlBOyIVRW4v366i6D7XnuEnuFtnB5oSBuNppbuly388WqS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030240; c=relaxed/simple;
	bh=N88uKLZFsr/eQme2dS2SHYUBJuv+wPfdCIWa+hgH/Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZRXSYtnT5MXRxv7qVe2+oXew1q4NoZQKZHxtzVGhOOyU14eYSmFck0l4NeDw67s96AVywOqBllK2OnlKiDVfPG4lgaJJ5gElbBQ6mrrb5I+lHtpGqssA6cfLl5HqYae5pTsErg8dBvi50yFUDGEHRlvdxVhVkbFPYWoDxCaoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHkHA4Xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REsqzs7b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHkHA4Xh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REsqzs7b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gsr53655474
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=; b=nHkHA4Xh6TCyikqS
	Tz7a01TXy7FlCuV8obnbAT0ztKpeEzBqyhBrWJEd2vjFMrYQGXlzZUBzFyJ46yes
	aP9Yw9oJ+47OXnbfaoj8ibYIeh/KNaLk4NT3Fl5Gm/y6TMKwrEu5vrycGC/o27xv
	7pGpu/g3wLU5o14qAkq4QO7vlK+WzMsO/9B1YK9txh85205ET3jKAUlOLffdM+tb
	AJ1xj6BW8ts/cxe9WIOp96vgGJtcgAOaJzJAzJDAiryQLWD3VqNL+ZwyI1sEasg2
	WiL5vB1kiQmxEoumdk4YEix1QKgGT2un9O0F1qJ40l3TV27k4+64OTJXQyuPt+5D
	L7cv5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydtxj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:50:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso84171885a.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030236; x=1789635036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=;
        b=REsqzs7b+e9tNMbKU2kem4NaKC2hzKrNIvUff37wEZ36VK64aulKqzjhup1Jenj6zn
         jMhpgC654U9EIMiZqbu4aPXaebqo+Oa/7Ph5rplfePhcwVOwTXiIfPsFTiNdbpXVf3TU
         bJVer2H0Cbs3DNPCk8mdNC9KPvd/337aatyeJWDbaXKzXFixdaHH4Eqr8LyN9MIQd1J+
         xr53NJXvnPouNyS2il75XSpIGt6yqhF/mJtDdSUHTTogzHHaK4IfcBANMOC4SL0ev3rI
         m4lX2THKkUcLCkZs0YUByBecheps4XPxPUZOHtRMAaDvaU7Jwz5vulstWTnIsUFMeo+u
         S7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030236; x=1789635036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=;
        b=LGCHmjzePWxZRVBkKuDRzqE9h4IDXgewVEy/SvCzpy7+A7mMQp4cxQVNb38E33i5mo
         U2bVeS9EB3o6heoQ0cFCdhS33eWIh37nhqinUTm9gusOarezf8YUDtNOIZOaeGndMGM5
         nC1DBhDTuEFDgpQiLXc/T9etDMWmuCQuHctdwhOk/0qEOSdzRKVu54XnzMsyXC9Vb6ff
         XJUxY/Cob06lIUaB30Qu4CR3nHyzNncT8wIzE4gUrpBzUnTzAZRtPvJqDbBXSemDgEa4
         8u36Jf6LsANlr+ewql9GBUe/Vr9WkQMYUu8VBvj2e2AjJAWBsgNPnR8EZ8rLVFiAv6UC
         rbtw==
X-Forwarded-Encrypted: i=1; AKwUvBykO63Bau/aVHnvm6A8AWybgc2UZmRA6cxxjPOflww7gspgkl8uA4utgNsYX4EkvDZZHsuT4zXUQer5@vger.kernel.org
X-Gm-Message-State: AFuF++lZmr0K0yV4d3AtdOWkXT2YMRBXUy8F02DO6cgaxepva4KDCFij
	uT/S1EeBcRyaf7k2T5YYVyTDi7emD2FBraAJ2x9xzzuCIy9LKepxEc3UQivNk4a8UO3G3k9WHtP
	5TsEbD6zqZiEcd3s7xYS7bchqdyux8poRkJPALPDxnN6rqaSBP2FnFOtlyLyw2+RK
X-Gm-Gg: AYBFou1IPmO/aBwK9CP9qHeQtGSdViiwPBJczyQ28pP0RbBLsIAD/voOit+XB/SESGb
	IvGh2PkX9m0JK9A6rMG7E3E/8wzoJBaoXG1IirqaJYddwcv60vB+MlAcs4j0e6UnWP7NTdoggEl
	kKk1NBS+/I87oIfgq+VSzyHaRURV2p6nLZYOLDQCKv2AFpWPMB1DdKxwE3Y8zFGhX8fiGYD2pjU
	bLLJD0Wl4kQ/LarOgEr6EBuShNXLB0agyZ8wrtmB901YSEkwm+Q7KgamGfWxWSZnMwGulqAZKbt
	1Px/9FBMQnROS7NWT9ArOB3yn2q1JIBut5I8KJFgYH9tvBTE7OuNQWylZvWBRYovDLBQUMA9Cw+
	ehUj64GHr/3cGRHphYNry1g==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2784904585a.2.1789030236062;
        Thu, 10 Sep 2026 01:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2784901985a.2.1789030235452;
        Thu, 10 Sep 2026 01:50:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3f00sm7933412a12.12.2026.09.10.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:50:34 -0700 (PDT)
Message-ID: <7667d87e-4b2a-49d8-baa6-65930bcf3bc7@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:50:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI
 and IPA
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa26f5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vX_vO8opERNOMm73XEAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AlPMzAj1jMgFFpQpADPSq7XWvhtSP0aK
X-Proofpoint-ORIG-GUID: AlPMzAj1jMgFFpQpADPSq7XWvhtSP0aK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfXygTRv02o4sxD
 dmT/f4Ccp857Yw1knOrFfim2wPrzaJUbs2EuaFbSAwZwdgXu8jlkkSt5KPxDcXAtm6kiSmq+MHa
 TxcfL9iklf7X5N8xlJ3mKjUuG+jc+Ok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX4wRHvqdF1/Mf
 b0skHQiyHwspWNV5aNXsZfGElFjui5Xlb9kQwj92Xw7rH/qDjVNUm38huMliu0VtH+TQDsI/4wZ
 vQC95Ux9ir2G1WDMPC3KUDuT8RqA5iBV4ELbVU2LWDPqRPL8KvSCXFZa3GB+zAvsMya+4DmGSj+
 Ox0VHJngJ1Anx5TOx89/AOZokibvjNJgTqN7tBZ0vSm0CLM2BtiA74c2vNsRhP8FtlEkCCtKNTw
 JYnEn8ODvnOAeoWVRD7r7hqEbT2pHO1nFGSl887FNJkCaByMY8tLT+wO0iqGjF4u6SDBUpJ8bjY
 WJfi6CGadGfGxKmC0615bcmKc9oYamq3QgrnRiMwAp2usVH6ybd5VOMLn6liGTCmfSfnzxytsDw
 QBPqTjOdr+SOMsL169XaoSyxpy39iZBJeUu7VMflWhD6N5ogyejmxq7RVoNT2wFfFC5i3OUhuVM
 gQBkUetm/SA0m0WvveQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100098

On 9/10/26 6:05 AM, Shujath Mohd wrote:
> Enable the modem, SLPI and IPA subsystems on Sony Xperia TAMA
> devices and provide the corresponding firmware paths.
> 
> The modem requires ta-service for initialization:
> https://github.com/andersson/ta-service
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

for future submissions, please send new revisions in separate
threads as opposed to in reply to the previous one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
