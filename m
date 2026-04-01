Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7B390C81
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038267; cv=none; b=mNTyuc6CBxHrEiO/cvZC2u3wN+7YdvE511JSwT9hou4xtaX3EaF2BTo58J5aoch3n4I3jvGrdco8NCUwZgmIvFDRFmNKZyEQemlk8TU/+wkYcgpovC4aIQqdLDUp7+tCa6/pvqU1c6v4qbw5jx3nc09OqiB91U1Wwqa1mnOOs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038267; c=relaxed/simple;
	bh=2O4KPsHQ62J935zxDc2Ax3wT+rfA4m2j4eAJwp4ilEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1hCVqA/pONg/5pwJrw9+HHEm+17+r16CQxaWJYIwv9CtXpxi9I3l8gCBnIX1I4kAA/rb1cDYbmcoKhr8xqLynz1d3/j85M9Zi7EGq/F7GSbBCFyPx4FrAtzFV7lZK3HaCgGjBqldgc2QQ0c5ZQswotse6ChngkWPEhA+rRyStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFoMVVQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXqY6BJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFoMVVQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXqY6BJt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319WOGS1579405
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjHSbV2B23FVdY+pUIbGKmHP0rQ/BXiN+MmXtwCChiM=; b=TFoMVVQdycJz5Ylq
	YT+baWrBRyjeHPza9jlcKRKXMJ5xRaUsm80kK8Exfv3yqh9vYb8uidEoRWvQvC6g
	0l3GCJs4XYFMdC5W6fu5VrMQx3LDc4g1EIFmgGkxma+argFeRACPboMjjSAfQSfJ
	N08FT1gU1uzRGnDOTjj9UDC5bYD1Ycu23J9M/8XzYxn2dz0q62n1C9AxRf2Hytem
	uBC5YW7WYRFUAEjFIEtL3TUBFR8SXC+15l8JwlHFR0jvyOZZgWpWBnsyq/vshQyp
	OuAGP5B0T/YhJ9i2Of5p7TGcRl9WSv+3trA21lYktbLEYHheMww9AqOdimOVu0HY
	k3IDkw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2tys4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:11:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89eadc12c84so19522736d6.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038265; x=1775643065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjHSbV2B23FVdY+pUIbGKmHP0rQ/BXiN+MmXtwCChiM=;
        b=ZXqY6BJt0RblRb3fQbfttVFVNdEdTFpzvz5Ps+DhSGjLxN36/8GgaSz3Mb5OnN7UEi
         hh2Yi7e0/itPqhhVz1pa/+jKR85m1dTigfGEQQGBtxQLNNbklfpZRepbI8z5aIgpoY4M
         Z7E7nhm3HqOyNuWWpH166JtXlnExFjnuJ++/iBZQcGEmkhG4T/6F7Q3/8JH+3Ojkd0Li
         RzZg7Mj4w9Gjbsrb2V3tirc69rfRFr6rGbU8QXe7ENG9lVOxsOudUnN+B4lJwyFbL/hD
         WZmEV8fTSCt0li6lRvZ4Wy3quOxY0Y2SJymE0xEcloW9rcCBztbS/paHV3Y0dWweZNrr
         ENEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038265; x=1775643065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjHSbV2B23FVdY+pUIbGKmHP0rQ/BXiN+MmXtwCChiM=;
        b=izMsAwB5WVn4ZzvKETn2E44nTkg46d9qQxrr0bvlhKywheJTJD+HvumoDIT7PO0BPA
         r81oZeVa2IhR6o7eYMd6oIea9+1qKuM0/7H5ZQYZ+drU9jzpvBjE0gMsHbLTm1GbbzYI
         UCumL3Gj4UuSBYgZMUQw5U1aaygx95OO1IAyWI2zi5ML/cofRLO91I+95ZPMa4yThrYZ
         8223UgqYkwS3qmCXBGj73Oeqh6Yb+91rnjU4xox2dAbWj0wPPgNYqjGENRc8l2Ixlvuz
         zVdbwWHFwqa9h2icI9lLWF9xZz4l6UWaebVlFpQnLDNERIV56tZ+s41V+8a5zQP4k2mr
         3Ukg==
X-Forwarded-Encrypted: i=1; AJvYcCVIeFvKUr0iMnElP5xZlvPDo5cYQzGp391Ab0rfE/iUKhTAihjsa6yhTK6psYjJeq01pRSbKT2nvS4O@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9eDlYhnDx9zJ0BylvKTp+MyWkpNKMOj/ZxUHJrmHKHgzutgX
	+dOGCzcsHH4Qb4hOAFpYPO8RP93pLHMAh5StxoqsjcSpnCFBYi5zu/ez4UE9cM2At4vZqVFyppx
	tmk3gQqI2bjghfSaSB4zOe1wzBbsoC8hcWWdQ9AOLMU6OFihzDHZ1ict019SHZ6edT1mhI4JO
X-Gm-Gg: ATEYQzywf6cHFPCrmUbhlqX3mvpTb6DhX5Cm193HUVC/ax8krSmJHAESn41OikgY8KB
	GcUGlKcyQwVg2s9927SjxDlU4wo9/9zTLdTpv3Az3o1/Wj11yzdVirJ96VFjZAY4Fobj6NyFdSv
	btYBIP3efzuY1KpRl/bnH4fnuVRD3CjqCr2Tcdn63IG7mmCIRWUZZ5COTLCL48P8xzG6z/KXPDk
	anZumcNjVJ5OkK6kqvm0/XOKeJkXVj3x/j0RKol6ojEmyvPo5Kaihfay2Vjg8O4W96WfqI7LfeG
	XPm95pj6DNgH9uS8LMi9uSjuxr9RH5Tc8MOE0APEFUwukhgMAmyPl66zfwHDheUsual9RF2YjZO
	p5dAaGb6yWuREL/UekwwL5XFtH9WeJvRAh0mu6vGtMSnUjIoVOKXO0L6+1ONJOpLAIMVnpdm5mv
	E7mzI=
X-Received: by 2002:a05:6214:1d0c:b0:89c:51d0:20df with SMTP id 6a1803df08f44-8a43a179982mr33287246d6.3.1775038264951;
        Wed, 01 Apr 2026 03:11:04 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0c:b0:89c:51d0:20df with SMTP id 6a1803df08f44-8a43a179982mr33286886d6.3.1775038264532;
        Wed, 01 Apr 2026 03:11:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed66sm131245966b.40.2026.04.01.03.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:11:03 -0700 (PDT)
Message-ID: <e3d6f0ba-6c9f-4b93-b946-a33802f5a223@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:11:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69ccef39 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=eTI-YJAz-J8MpRop-NgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: nyPaAR-gMpn7-FZFdU6AucPjCazhyumk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MiBTYWx0ZWRfX63PY5XfSovhX
 kqVCsuPJF5IjO0QzNXtfrUYipZfsHaixWa1+ZVNbDrB782AspNyD5uv5P9EHFgZb4+2VQggNpxH
 JtpjoYNupd6at/78llr4kDSw2E58wt3gDr+MKcul0z1wFpYKJ7mx6qcn/7LFx5QgBkl9cFKa1qc
 GuFC7Kzhq7mLdi1DoyYwUwQFGs1bMQgSXKeVtoHqDXhwYHVyRGOgQHqDlKrvoXJK0SqlKlAA2lr
 Hl69lGTYMbi3rtNaiyZYBrMwjwK7ZXcd6TDQ7vdo8NGtIx3pebVOpPN3B5Dy2exuIHX2WuURtLG
 LUzQVYDviGislNwpqmedHJ5CxYqU96abRi/lLrqq9EyWpWZ3kU9UWyqtPbmYt9VMSN7ANKD1Snh
 rGIcBR9p2djbNFmqcbwrHhGXRGrfou37taYLV41oXYEeimZxh/Dkq5yn5ri0oVlGWpUP5gfV8Ck
 o8BYcdrv4THqFzbYGbw==
X-Proofpoint-GUID: nyPaAR-gMpn7-FZFdU6AucPjCazhyumk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010092

On 4/1/26 10:28 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Reorganize the DTS file for consistency with other msm8960 board files.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]


> +&gsbi5 {
> +	qcom,mode = <GSBI_PROT_I2C_UART>;
> +	status = "okay";

I know I'm being annoying, but.. if you're doing this on the entire file,
please also keep a \n above status consistently

Konrad
