Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83C34A79E
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682465; cv=none; b=DQh1lmzy/ydAAD2nVg1m82TmiwiUGz/A+BnAtoW2cMN1TXV2RntKTd8YAQMORuKi/pxT1UrpNkKvEjdDLL4CMqVQ+SSX16aeriR/zEgeLYDNz9/BCXoP54wM5V50Zj27jpi+5qS6mbp0Bu/Ad3aviNsEBad933bBEn8+kviAchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682465; c=relaxed/simple;
	bh=SxDZpMxhiKrgSusg12vnsvU0n1cgiERm8M4RRozXgYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJlPDFFrwA+gI19HG9RpAn2QknUELhNskh/Bon+/LjV2f8GGucYA6OpR/yodhlT0rB7DI/hwd4Cf9O2lAKJIpuzlq5dP6YsBasjDsdNyXrM65CrLpfltL6r5KwtPpv4nwIyARw93EWZKQcWoBbKVdTFMWFnzfzb4kKvAS5Netis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARVeGKW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QU+mntWl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARVeGKW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QU+mntWl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8m7W93474633
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=; b=ARVeGKW8PX1r3rvD
	KQdKkQyliQXBLS9zH0X5xDJ6vPWk6GP8eNa0TM/0DfB7W79XW3u+Y+KxOKzJHAQe
	GAV6YMnQDn3QEZ9EjMYJgGd2KJEs64dXitRXlT5XwRL3fioYGDGDlVd/IT3vrLA+
	1Kz3lW25e9Q47GsJC9+jN6pzC7zsAgqrf+QaYtQYstBegKUrZnsk5IDshPvAXcxM
	hLi5VqmwEiJqCpDR9LgU1Jkx29nhzmIOir6EclgUgdY99/ub+GMF+AH+sUuMYCW/
	7UYvBF6SzgDGoEBOaen87brv2CFATa1TFeBod+f1AErvdE9ketadkFtd4oXZ8Dok
	Pqhfxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41995q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:27:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63209622b03so2036320137.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682462; x=1779287262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=;
        b=QU+mntWlOp6PMKvwr4x+DjPzQ5tmJrk0HlwE559G9in0eUKJoVeg3jJIR/+dcfeVMZ
         1yE6Kp1Mhk8KTsJORooeflF97lhgYGk+KPxhjjehGethISh3TPu4u31X+TAw4mnCQ+h6
         B9w8x9Ynr4PbE+xUDGzq3q3e2Pk8SyVHMRAckR0U8TeyvoARwptxZdMeRTnN4HXUYF9C
         CwCYpVvQFz9im6sn1oT4aGsofRHkKhFiGzRtZEPy+O5SNF59aXotu4JhMJ6OJtSjasGU
         P03tqgzsbX3HBUzDmvQjdmKH3i+CucYAyvkK2yQ+eriOTkFWcoGJLjCroNQ7JlRClK8U
         5gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682462; x=1779287262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=;
        b=hTBi75idiqaJdcePvec9Nthi1Zp4uSUJtAhW9Bxw5A+Pc2F7QcJfg2kSmolls/qK2g
         uPSXdVQgVdXm5fgN/2DU1j2y7mUnyjt58Bq9/QFf5om8bbXTFXGDE9BTLKWmv0NKfrFn
         cfCn7WbQFHHdRmwphnlWbyEmbQE+RbHD7gr/OPbcwBLxs887WjTjmvOteqb7VS9KmMs/
         4CrysWgC2jl4N8Mizn+Dpk7Id0rRYv7pxRsU6jmTDk2VqkB7Mo0vobQnvIT5FvA77TPQ
         F6flciVHEkftBquupgil7unB+vwObAVOvYlrLhrBGdJ3I425ayGhUbg9M2+8KH83sZa3
         GSHw==
X-Forwarded-Encrypted: i=1; AFNElJ9W7uaCvQxYDbuBA2GBGSIpt8wm6RuewPNr9dhrn9VGEOlmYWwZqZO8zXnq3iKdCWOLYLcFp3QexoUd@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8jS+eusruO01zcNG8//979e4QO8Cw0PtTE1Z9fb6pUeiwNPK
	9T9odLclt3oOdRpIc87SwKCrTCs+sQld9ZuvASlQPvVjxHnbKXUf0MqhVC/uVe2MpQ4XeiwiGiY
	xBRT1i2512sS9ruM3Yvz3EMJMAWyue25faUbcpAzmWsh9DIkvLV5TSKS+vl83I0jO
X-Gm-Gg: Acq92OGOxsEFl+yhsGQ0FCWOeK67UpuZmWt3wNebGjGNvic007dN7JM4S78Sdq33+Ye
	ColHXEMcWNGoIi2WMelIoKJ0J/9Opt9bEvPM/l2UikOW5XViyD6w7bpdDd3OzwII0ixmI75JaU4
	3fLuKRq0hl/QZYxe1Y20DXKynUGgfMboWTaUV1EJNZL88YPK6mxVHeFE2wqGmlL5QhBdpvtg74P
	5k5dXD+MlgyPZRPwVeyH/1PF/Zl2bbqp1j3mHH8Ma8jV8hnLhKypMgt/wBHW/T3ggT2Ymj/OXBP
	JlGBeUpY6jcMCMixMP3v9qIIm5zKOzcFmcD9Yoe6cHR71WWCAMTcEOZ+JHqEDRnCgg1Y3KKKDi7
	20RGz03EVg37pDPF7Bt5H8qBAJv9XnyX4ZlbajAQYqWMI5/b4Y0OvABv/SSgpGFGNlw9fKmx9OR
	XUGi6MiwHVskKLiKHGA1V8RS5YIewOGa9UTB8=
X-Received: by 2002:a05:6102:6041:b0:633:c6c4:b328 with SMTP id ada2fe7eead31-637a6f3ba12mr1163657137.5.1778682461780;
        Wed, 13 May 2026 07:27:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6041:b0:633:c6c4:b328 with SMTP id ada2fe7eead31-637a6f3ba12mr1163636137.5.1778682461219;
        Wed, 13 May 2026 07:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2cfsm4203946e87.25.2026.05.13.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:27:38 -0700 (PDT)
Date: Wed, 13 May 2026 17:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <e6ufvm45w4v4nzdxcnzby4wbqof7eyvy6asffqpamb3twhwde2@jhl4yin72lyp>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
 <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
 <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
 <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a048a5e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=LygiS4vl0DVuJfOiXdsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX5vv8UKJhAt7p
 1lQXiAtb4D3/6AN/KBaKwFsWwhallyvW1C8WeNPdaGYQoF7q8LgM9zzggXFyzG7ZfcSwdXQMPu5
 c5EzURwyNeE1QVdIhJrzz0QUZrAbcTx4TdOAKgBbeEZz4MQAB2OyOPkpMsQ0fbmLdVNHFCDIPJW
 acVJO9VfvTs44ftENBKVUBzl5vPM47vtf7QQ9D02Elbj3HRw61Xuvd81zt8I+mYWigD9uDXUHeZ
 YCRmY07gAN2zRgrcmK8hbPS188NX+7DvE3MhfTUv38VZSP7f+uU24PCH/1bLL5ysZo5hTFeupXk
 aKZnpYG+p8e13iXz7+qtRXEfUl/GHDQ4Wm/xxutNDw83WBWBthqdtFFUp1creBhHbnlsa+9gZwU
 VVs5r36fv/15egYxEdkoe3V5m75pGvDvQh570zVmxTFnP8lV4Dm1tclEOL0LtyhP1JTm7NVBL4u
 gGXsQyTKyA3TAdV/96A==
X-Proofpoint-GUID: EfCM1w4Q3j4SuKW81YC9aedup7mifQxX
X-Proofpoint-ORIG-GUID: EfCM1w4Q3j4SuKW81YC9aedup7mifQxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

On Tue, May 12, 2026 at 03:07:42PM +0300, Ilpo Järvinen wrote:
> On Tue, 12 May 2026, Anvesh Jain P wrote:
> 
> > 
> > 
> > On 5/11/2026 7:40 PM, Ilpo Järvinen wrote:
> > > On Mon, 11 May 2026, Anvesh Jain P wrote:
> > > 
> > >> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >>
> > >> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> > >> reference boards. It handles fan control, temperature sensors, access
> > >> to EC state changes and supports reporting suspend entry/exit to the
> > >> EC.
> > >>
> > >> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > >> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > >> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > >> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > > 
> > > Thanks for the update.
> > > 
> > > Patch 2 applied to the review-ilpo-next branch.
> > >
> > 
> > Thank you!
> > 
> > Will you be taking care of merging the bindings changes (patch 1/6) as well?
> 
> If the bindings and dts changes go separate ways, DT linters won't be 
> happy so the bindings and dts changes should go in through the same tree.
> 
> As such, I only too the platform drivers patch. All this should come 
> together in linux-next once all patches are in some tree (and obviously 
> eventually in Linus' tree as well).

I think it's more typical to take bindings together with the driver.
Consider a more generic case of the bindings describing a PMIC or some
other common device which gets used by two different kinds of platforms.
Which of the DT users will pick the bindings?

-- 
With best wishes
Dmitry
