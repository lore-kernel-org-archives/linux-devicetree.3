Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443052FE48
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072008; cv=none; b=WBmRdu2d58080vHXvkKbMJ5mMuCpo9YeDlbV8Ju7RpNxih7YWc/GTH3KqY0wfdMPQfbbTt1JxxLbtwXHj7QzAxFzsNPQQGjIO8xz3grS/JfX8ZMh+fESdiJxDTKyiDLcynhaJtp2vRUqQS+uXrknxoGW15ED4F5CCsQeJKCsVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072008; c=relaxed/simple;
	bh=wB2i318i/HbPC0HKTfztwgU8Sf6arl+YZ4ZdMovJCxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keRT8KVS85RNXNCEFXrYeNY/kNqNbgA1EGtSzvWKBWJTlp5P5zRXGSsiS7OdcyhobPv4n4wseCyPMLB0F/dnI8CcBdVOclxU+zn5WMi9IQ4uicqrKzi1vZi9WyOxTzgbsv5EutAUp0GtfeG1R3DnYMaI1NUDtzFJhjpon2GQvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7SCOKDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VijmyVHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7SCOKDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VijmyVHP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9WRRR1842270
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0el7bjuErDhLYtuG9rneG619xk/rheRzGy3iRFFfwQ=; b=i7SCOKDXt2eU2cH0
	ansFF+NzxfioO9peEW4+f3IBOhJGRHojBi1dIa0LAZuhycDXOn4BF+43jaNsP0YD
	P7YtlMEjF1mGHD2XBTu5fzovZIw2Ky4K6Suz0EuvQ//UvvqnTbjzgaBUf/evLjcT
	MkhMEr3Wkj81dNdUS9Z2vGe6jfzjU9QuHSc1WDX1HvgMJAXzR3nksV4g/fm3xBuw
	3nokLj18kjCqThxbIS9ccbS0jGb1qGWghOpG9ZQyiNZZXKQEK24zIaG/+qIgUZvI
	08HhJvSTZPH96MfcSktZ8Mf4MNkUPFZv8aVQtA+ZnRIADCSMw1DuvAm26lslUOCZ
	scpHYA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111duc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:13:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a6634ef51bso87633137.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072004; x=1790676804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0el7bjuErDhLYtuG9rneG619xk/rheRzGy3iRFFfwQ=;
        b=VijmyVHPa6X9i0Ni4DJZvzOf7+BTGi2fXAR2qAKyrVz+mDWERltPiKACezRBbZHoBn
         Ptc+L2XKwsySx7GAtOFoKyrEKVT/HvH9wVZ+OMjcmGi5C8vUNzJjRrH09sW26NuqoOFC
         UlySh7SEfzmTMDX8f5WItBCLHN7HVkDcaC1Y91TI+g9ZEfWwMKRvL/wUzeSvetonDfm+
         vkFJ9Go9vULkK+0/g4HsMRrKXIGcfa1ydQDvPcVFzCFVEYsKrycdWNjFkrcD5KdJqVgH
         ZxlrSkwbRRftjabQX0NsFeIeCssftZLMpzuz8pJgWFpZz7fXm6vn4t73nZMwNST1JCcI
         sKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072004; x=1790676804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0el7bjuErDhLYtuG9rneG619xk/rheRzGy3iRFFfwQ=;
        b=mLbNGXHTQwyvCz+UagTaujgIJv6ROUNeUvnEAFFNQRbgUUmaoFcZdup2Q49DD+SvRp
         OBTcOp+fSI9FrJ7FMImy+5agmuYrcClHa9k0YAGNhAtTf3ji1veeL5R5MVfL9q7ZrRoH
         bbDQyujlPJdMyS5KDl83yuIxKziOfXS8/XME7ahaQ0dykvnFkJPUvwyskTkEAezrp05J
         PlDb8P4CjcjXLPvOrGIxdKSeU0y/oqloFlLMTSixJKcqF40aflWexlfFSPpAe4N0lZsV
         pKN9LEo+g5NPx95y+YBPE5SjTJwkVTN1zQTTMk37jEid2YUEDLiLcdqmVi3URYN412qo
         2mQw==
X-Forwarded-Encrypted: i=1; AKwUvBwfF57/uHo6DySqkkKWEGxseEcNUCcBuU/vfnWj66rrWZki6lM7dVfSf/vEkul+opztn+nRHaUJ2jZx@vger.kernel.org
X-Gm-Message-State: AFuF++kLrmJv5k2UqqLHM9BxV6XmogFueqvz7350GgpXLvk+6Yc8D0p0
	Y0gpfXGdd/lXdPz93g29TOI9DKIqTQB7eBiWcMNu9GilARI0qpniaRQzGkRA54Hyhr/JiwMILUT
	YeufSDMTlMqCephw8CMPlM1JKproTQkJ+JRTVbCHEsKtT7mZs7wxtiKZGBCCnvnp3
X-Gm-Gg: AYBFou2E1t5Dz2DwwJGzcAScWbOv376qgEEC3+O82YOV/qmAODT0su6FhPV1kTglzae
	m6XQW9jJB0JuO6HO6oQyo+ND7YpEHjVJtXWmuMiwaMg1pCd/nrNFiXHiJMzu69SwtO+8J0n3IaE
	KP8sJwJZvmmZ/VlSzRNi7Jr98cWOh20C+brNMZppIiyw+gLrczmzuCGF2Wyob/JluM7RFLzjqLF
	A4fxvSwqtJKfYZHOMuItK62WLEjb26mQanDv2zj1QTDQf0U/fxOMxgelcqz+h9Y9iAKbNej0VPD
	6ihA8GBZZP7/ZIPbdb1oaTL/JtigGT6RKCy4aaBzXpPEg4yTQIoy5Xrk/HVkeJUjgAEqFtCy8Y4
	wWYkrVXY9JsMrvyUtzeDUsQ==
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr4973409137.0.1790072004196;
        Tue, 22 Sep 2026 03:13:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr4973396137.0.1790072003762;
        Tue, 22 Sep 2026 03:13:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e7850sm60804766b.42.2026.09.22.03.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:13:23 -0700 (PDT)
Message-ID: <58efd258-dc43-4d5c-89c6-81d1f9b528ce@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:13:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
To: Lee Jones <lee@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>
 <20260922093327.GA2308615@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922093327.GA2308615@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TTVdvZo8IwO034YHMCLhhIxQCYx4Rr0B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX0lzHOSuYcvRS
 4N/Fo0c/3km+gZLqP4HSzqDggPfY9KYdeA1VSWfSoPe4rTRiCdU6CPvaUvbMnXX7W5oB19J5sZF
 MQwnwyyiLhZjzvQX7DI+FLzfPSshP9c=
X-Proofpoint-ORIG-GUID: TTVdvZo8IwO034YHMCLhhIxQCYx4Rr0B
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab254c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IqmdDbymtu-JnQ37yGIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX86ueZLmcOUX8
 N+y/EFqmGfRJ100OegLPoT1jupRsENZHDW4gBjlKOF/+otJZrpj3OY3xyoiA4Kn/Fi5gS885LrV
 e2fEKKZXXXy34AX3ZeSnr/6mrBS1GdMUZ+y1UfOR0gQKKu7Ppwa7GdQXFZ6h7D3EGS+sTUtFFcb
 8Yez1HBThHL83PiMQLVy51jzAQ90upGsnnLgJdg1XZCmHPHCSLfATqVe0Ld6hVljzayfMaUCuQp
 MGMIX9jwaJ6B+pMkGxWK4ExBgLMmGki54AuTSjPVgXiRTO3GtHzAQce7FLUfUf06XaSL7rbIpjf
 TUjIPp9nQJ/+aOba7z53P/XhMegDNUIqpeIYPP/nEHn+R5fEg3M4m3xRhm7vLalveuBkYAUUNt4
 zG1KJOxK4Tcw9pUfrkb9RkVgQ6FZm2mFJuqbJStZJIjqZ37iZaJuKCW3AkhfYB7SCpRz/tGiomF
 m1TUy6901kXMKuop7Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

On 9/22/26 11:33 AM, Lee Jones wrote:
> On Mon, 07 Sep 2026, Nihal Kumar Gupta wrote:
> 
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> The PM8010 is a variant of the PM8008 PMIC with a slightly different
>> IRQ layout and MFD cells. Introduce per-variant match data (IRQ chip
>> descriptor and MFD cells) selected via the new "qcom,pm8010-i2c"
>> compatible string, and support probing without an interrupt line by
>> falling back to a reduced set of MFD cells when the client has no IRQ
>> assigned.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Who are all of these people?
> 
> Did they all work on this?  If so, where are their Co-developed-bys?

I wrote an early/incomplete version of this patchset and handed it
off.

If that was used as base, please fix up the attribution, if not -
drop me from the list.

Konrad
