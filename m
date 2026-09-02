Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5B3EC82A
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338648; cv=none; b=g3RGl5lDo4jcDYaGdKXnRS89Mr4PjXslZ0K4x3sfj+Mzf4x0I8RGHq0DAY1+AjckNcRUY7AJt9G+fhxAI/ervJuICgnOqtPtl0Jyzq4OJUpEDcbNlx1jIn/NjH05RJ5bu0nAB9jGUD161Tnj8+U2yLUQGFuJPFHTNQMf4unV43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338648; c=relaxed/simple;
	bh=GstLgIHtvyFTm90ArYuPevwty0lzfMMUujZRrcj/Sfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4zPHm52latMFt0jvHPspxhhEb+Ud3pidu7IFD4jR+WlLd0wbN//7GSn1BU/pB2JG4V6AuSykxE7U6HN/vaJZDUzGIYH0tjbo8gxdRP4b1E+baXBL5NevAQvCYQ+kenzhzDtej+OgtVGwFsBLCUyMc5jgegAkYlXwtn7xg4oD18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0JcRGmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqWu8kW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0JcRGmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqWu8kW4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WiLV695766
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=; b=h0JcRGmOW3yXBfJ3
	Jwg/N1/SmEx2X+CMj+1kJeGOLtnZ0m3Hzy7ubZpgM3LSK5QO8HNKhvVDxFOTFL+n
	cdKpYpumJFH8c12HE2yzjcbcsPSkXkpYoHbCx6wqEzWdGOad2n3eYt/By4kq8tsm
	qXgWaWidssOkHkYai8YrCFKBDW3Lnrmj8tiwsYd5vzPPMq+xZuMBQUsNZtiGvdpa
	mwVGB9FXu2w5aUUaxzAuIKl6Ssexe97sB8v3UzobuhuBSunsQ87miV0XuqtsCw7s
	uSXJ0Se2Xbu5nXqkmc31W5BnQ793GX4bG38y+9NTNTkNPD0zie7MiSPiUNCfr8XH
	TjG6ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb5618kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:44:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so1558141cf.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338644; x=1788943444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=RqWu8kW4mibLbWR2nI27m6CTBrK+YdZTF0Ros9FFWM8hZEa+bxqJuX2fvfy4iMiNM/
         SJZm3Mv8aNvjZX8uYH8xp2d8DN64dx1SIRWNpdmDTeNdZM759+MjBv6E8dU75SANr4eT
         9X7JlfefvFwr9l1W0rdLY+ncmoOETMFOF3CatAQ57pnI3IGXBjN9Su0/BpW2UVIvfgD5
         KldE5+nMLS33CHf0iPWjvBEfOqio8QU7V+RjJyBKVq8DEBOqYCztV5qzWODN9r0EbzCE
         TknEcrOOjTGT48EyxHMC0SiVvKuL26dLJOlOm36C2IzQY7pf7cS2XSCiOLe0o7xRm+3L
         4y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338644; x=1788943444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=fowQkWMmHunlTKA1VVGdalAF/JVN3qt6UB8o9fxryR1+dBD9HB7Jrqg61AVsfwhep1
         TIqlhacHtH38TnLfLolQk+R5cCB5gIckWuRN9qPiPAFTetd7jCYXhCXGUGthogwQ0C3d
         kkoi2AIjJdsx6Z7OuXmO+A3xnFL7uGZUMLo5cSuHd9OXnVYVjkSxO6lD3qH8z3yzgcdR
         NOBOXyQHas65qlyEN0xi+1DV63iTOLr5GJkqVnu4Iqg3DW+cZtcFUI64bS8oQekjPDsS
         TYu3690AVHbOEHM+oto90MvvIYzLCZCXxheCZhsZNTTIpGur49uxRGqM8cNTl8H8uZBy
         rflw==
X-Forwarded-Encrypted: i=1; AHgh+RrgYs2CuYoov00mMPm/6r+QE3RcMuLvgGFRTBNEbiUzR1OfmwyAoho9//vmQSrCaNhzhW1ARJlgJ7I/@vger.kernel.org
X-Gm-Message-State: AFuF++n6ljJkka1cE4Rz/WqVbuCRZLFR6HUPNZ3bG2YN4PxX/jIDEih/
	8Eiz0tvNlQHSvJtqU5iZf3zeRGhBMq5wB4y1Zm5O0cRIZWN11jMCmkSjT3HdciNLv6o1RDhr7NK
	KyItVxpVsD0DBadmjgChP/q7ouy3E4KAXxGnw1cFEZTbPIHMrVWfbbsN2GL1Wsets
X-Gm-Gg: AR+sD10zWAbxsgCpNSfC6hWvC6+JqZbVqranRxOQJrMhjTBO+CWYytXx2ZMeVSe1tYx
	IEo3IbTRvyAu7MIj0d3jAYQrceuLxgjlyU2lo1CY1NeLcWMtY1XXgNzBEz6O+RfGOxGtdCkJeEL
	dwrr6NWC2AmB09S+HyCm1TZuytb5Mi55guYygfjr8IQSaakEPDU17ggdCTo1MoKHk2ExJZ9NZaH
	T4/ZB0iEvocsm6hH/eGunnRkx+WCyQ/O+HWwxX1Ba6lYhWz9TiTYtykZzrQwWfPSbR7A2SgeCWB
	MWLOSOGdUpgs6+qsxraWzIC2GHBXAFQKJJ5Y/fPkVJerMjG13Z+l3I6BvrY22NUNXcAWt4z+iKF
	S4CCMrFpIzySrGr1LRNlOZA==
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22276371cf.0.1788338644093;
        Wed, 02 Sep 2026 01:44:04 -0700 (PDT)
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22276031cf.0.1788338643648;
        Wed, 02 Sep 2026 01:44:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm673780a12.3.2026.09.02.01.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:44:02 -0700 (PDT)
Message-ID: <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:43:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfXyo6H3cXcnEYt
 hwCbc7bQ73EstkU8AxR4YTTgfafdYHEdov4vGPvsULEBjn9AEhnwkB3tGXMKx0eah7u8gED4yv5
 ZKamsPs+bTfsGqKDWA0Ob6xn9LufHE8jR77dUNpmgGPctG1i6ZmGUbe/J0KFasdHwmOs2TzVVnr
 Zs5N/nP2SLhOlw3Rgmkuuf1YOBHJkE2z36LJod0TYtv+qrVuxq50JT9k5cIEALTWPop6w0A1tMb
 uVYN0ZRxZ13fdVIfs0FJmJLDASFrUJfP6Kzj60KlW8P4/g+Xh1tTqsDQj04IkQsKJ1aCiGwgjvk
 yVC3jT/ATRgPwGIYBhepPvhiGbyD1fKDuXtOsMR03WtWzJ+ynjbLsb7FhJhS/jCQHxH5cZf4Ix1
 ieh1fc0UEUfKDhDd4qVFOAYA/CA0mzseT212Ac4GLRjoXp7epvIlNmY95OWVUM58MablfMpBjsA
 pS3h714FAbXrBaWZmSA==
X-Proofpoint-GUID: _vu6CjPIq9MnKpPJaBXSjtmDFrM_PeiK
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97e1d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=i7MDaAbus5dcvw8aKywA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _vu6CjPIq9MnKpPJaBXSjtmDFrM_PeiK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX4aWt6ORgTj/v
 e2GUOPx4wlBg7D23vwiouhlCxzbcfjU2Ejc8bz0RpavqD8907o/Qr5dq2fHyyjgoZLHxXVLqA48
 gprn6E5olHT8dYmJ0wMFx60WgQ+mXjk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020076

On 9/1/26 10:47 AM, Xilin Wu wrote:
> The TC9563 PCI power-control driver powers off external downstream ports
> whose device tree nodes have status = "disabled".
> 
> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
> powered-off port functions during PCI enumeration raises an Arm SError
> instead of returning an all-ones PCI error response. This prevents the
> board from completing boot.

I agree with the premise of the patch, but I'd like to understand why
that happens - do you have any details?

Konrad
