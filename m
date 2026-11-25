Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602834;
	b=bjjyBDZ/9B644ooVA7NQ0mZjbu6clbgf0aNx2IpQQqfFKcnrmXX7HjeVrfjTXrTKck4E
	 1pRYCfbR1axEVCsXQYM/DF49Z4K/vEt+7xlyWDAl74wJnPhoa8ebtFkXq2sFV1jTxWJ2T
	 78EZ6oAq3haYqHaP0k2cEnWGmZMR9xJ+BcDJ30M2mMekq2GjFXOrxkOklZJwn+qPd6aHS
	 NV9bAfka3avMnAafsSY1A1ZcW2V+IOfKaQlPmI+N960EW3hq+4kquUh36cvCMU/tNd6v+
	 2025QIGI0emMPd9WbWb2C7mIh0x+MJMh+6nk23Hkh6Fweaq3TfCV3a27FFtmBoOggqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
	b=fa0blEUxK6SuSo7Of12vlALLE1m/HGrmYdXaL9u7dR7/hbS4JBtAhOIcEnGrohMLGhnq
	 ttjuR86FYDF6CYWrZTUoEO6sBLX/doQi7gxd1kuFG1+kk3w9S3ijz4a2zzSw+h8XICahx
	 J8yLc/RKfZy+LGe+D3xN9swQPFj/zx3StM+EgVxVRHZQjpFuVAU9ZuYZFIQVBaYLn3i+6
	 uxnWV6BH7n7oheo1wR5FLETwGMbfv6022y5p0hpJSkaN8gwIveSjrkF4zzBfC7YtH4Vk9
	 nyRJ4zYGNpK1zHfPsu5cw3+78XrWKVVKILYj5Rkl3hhH2JYbda4ApuV+eAgCeySGKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1jkhZIa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaKf96Gr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB49606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB49606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1jkhZIa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaKf96Gr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9ml5M3611427
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=; b=g1jkhZIayrjzYxTj
	uUBCN5a/x+W2VAyWny9Xm7cCzFFqQNiQpJ4CFS6NtKtumxvjuhMrm+y1eiktdRf5
	o2MlhaQAlF813ddB1/efHervQUd/jA9kj+SVq9ZAK5puN9Yp6M/G3pdXzMILDVUC
	MgEPRlyZrMpFP3qV7n0mvkzgAo+NkJFjH+l+ygH18hIGU4kPxS4i13SAwTWBjphk
	KgvWc7W8ofJbN7EboJCKUmJTfrnRrdFZHuRyxK3PNbzvGJOXxjpW+bwt+0yw2bNU
	CvMfNamR9lCjwRYqAp4X46/uVC8JEH28eNIDuwmO5dhRyn6FSRM+AP0mhsq0Q8vY
	IHz4Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb5k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c4997063aso16502501cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602831; x=1796207631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
        b=RaKf96GrG6zG88VXlSI/sleEgjHzkgXkHYjLCw/XlKaQJfB0xDKTAiWD97axAeDlgn
         Nsfar/VVWh7/mCzZRp5aFY8u75JBRBX9+uSyDy0bF2VY7WplYRi8kBviGDrKCjgpZmd4
         8RyeK66n6pP7w1Vm7eNDEcGjkcJXeRtWSdrMRIAvAr8yKTwG/7r2uz/CoL0eb5vMYGPl
         ujXLPV02G7VKHdIl5nirZLLPMuaJEirM2rzs6/ScNU7ZibMXaDhtCjLYk4y/Rz+w3exJ
         Jz2JzJPrgaNb/ZhfVnUbfFebKLl7NBKeIMr1qHGc32dShdw5ttQPcG7HwoDkfVe0nwZX
         mdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602831; x=1796207631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
        b=VdcnMLavNizuGS6R8g19zcXpoq4Qf8nAAHPwLVYZj5R0jSk/ARb21zZvFj5Nwpzhsi
         PNvtZgjxFxyaOJVmf8sHEfxS6o8tQobl/E34W+js6UQbeIO7MTVUARdpK7AmLaU3txgM
         VujqV0GATaRlhOLv6iuuqnwNpJEKnODGeIwM5r5wHpFdnZBEwPRlVKIfXo/Hq6LPGEB7
         hyxDVTrzXP9UEkivE7U+XYvr6uxTyFenYvff7JVvul4DGJOnJW1uX4u/arZ2Rhj5HRBI
         i/tgGH1VmFZyPSymh50g92yk03cohdMU2EMKyCLFbB4FPfNLM2jV2muGk+7Oiv0VeQ3E
         Bzkw==
X-Forwarded-Encrypted: i=1; AL+hErFrfk8pWB1GFM+V87kk/uOI02N9+knwl2JaVl3JGgWApSoCHlpVeAw98C9usMjMb7KazuY/knEwwEip@vger.kernel.org
X-Gm-Message-State: APuU4Z9za1Akz5t965nc4jkHN89yZ2yu2+pgN4O7V6LxFvqt1uD3+yqd
	7uJHr9nDGIcPy0HI15xjtszaJqIzxv9OncItPEFGl++IrFWyYZ+U8EYJD8mvh8RKGYabzlRL38G
	49oedkctnbNZyQEzcfKUmtxPNpjLkITeesjHxy26JW5KFvI6K9XzBbIXJLwkPkLqF
X-Gm-Gg: AZFdTZeDUQvdYSmnMHC90I/Kr8yMhNPgiDhAYnnYehlkXgztz628LnITM17CfQ+RmyA
	nEa6n7w/utVhC0BfPYKQrlZe2qKnFL6Z2amqoa2QgNWcdMq0zkTBDp/9innexqS0WlxTBOlfRRP
	Ii8QkXkOqurZLIGq1KSfvWPapfewlbR6H6GUNLI8sw/JbUAoo5Tjxf8APk+UO3CgNHaYubpc3KH
	e0rgJcg6GyiivQBh0qSDqUgUgxVWdlaeHMkZdgeRyzsz59SmjeJEpoEUsu9TlGvGzDmDV+fO6LF
	fYoy6YYNLX+wGtbXFsaX715YGubnurBf3OLqBFcX0DvSXFT75vn5UFbJfqCO9NYs8XJQzpyQ4dW
	yELttt8TMUrEK1BsiDPMuy0ePU/2RnIaOAL8zgTC4g1Q4Sa0Sf+6XXLFUh/SY9DOHh4zv8Ww=
X-Received: by 2002:a05:622b:113:20b0:55d:36b1:9291 with SMTP id d75a77b69052e-55d76741cf4mr301146111cf.0.1795602831431;
        Wed, 25 Nov 2026 02:33:51 -0800 (PST)
X-Received: by 2002:a05:622b:113:20b0:55d:36b1:9291 with SMTP id d75a77b69052e-55d76741cf4mr301145681cf.0.1795602830983;
        Wed, 25 Nov 2026 02:33:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm7990385a12.18.2026.11.25.02.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:33:50 -0800 (PST)
Message-ID: <25ba0a24-85e8-4aa2-a2a0-23c64729fd70@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:33:46 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Describe the PCIe thermal
 inputs
To: manivannan.sadhasivam@oss.qualcomm.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261125-glymur-thermal-fix-v1-0-b93a9feae156@oss.qualcomm.com>
 <20261125-glymur-thermal-fix-v1-4-b93a9feae156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-thermal-fix-v1-4-b93a9feae156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bkt9D--4ROGjHABvF0iJiKzjLp_l6DA8
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06b990 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TtJGJgRM3qr-9yLlEbAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX2FAfm6ki9AWu
 ZNrm/B5soqnHVXM33I19L6pjlZABbkB1Q6JzzaLRpx/lL7Z6QYi1XAFKb82IAf9+HInGs4914EU
 BXSw4zHfJbrXlHB9uwWtG7Aj+XpKFic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX+/3NCC1zVMfZ
 Ykqu3AtNM2DADmzp7eQn2X+H9TKdb5SODmSWBqerqp3sJJsJhedghMxYhGr+ZTjJbR3UZNA9MLm
 89jGH4SE2rt5RExOoeEjCtCpvhLFHIPHCVIuKJ5XjXadQ2jCkKo6RWKwDs8yaWQjU5ntiRvEVWh
 7PGVz9cDYNqg7TzOQkREdceD6g+StkTaBC9jKcce9PrXK9uqvgprLPmbKSiD4yV8LYdd715vEv3
 hIBXw17uCf1BaoVyRSijU8qc0y/LMr7/OzVohXooTsOv3q84A0DqCQxOHmuR7xo5rqfUS3HLB/k
 GDtJicT2NdgTgE9TYm2016qjdk/CIOpY+SYxZaeBNwJdH+UbMA9OksSkMPINcyf5zAwvCV5IXgo
 nLUtHipUoOq+5fS2WBD2FvSYyotWF+vcRGZPfGQTQtTlAS9E0i+5VRSO3ek+5mjUh7Ugsdwm+eU
 tN2zJHjSjMCmECg86PQ==
X-Proofpoint-ORIG-GUID: bkt9D--4ROGjHABvF0iJiKzjLp_l6DA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On 11/25/26 11:17 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Some PCIe PHY instances on Glymur benefit from periodic recalibration to
> compensate for temperature-related drift and maintain stable link
> operation. The controller driver triggers the recalibration with a link
> speed switch once the temperature change on a polled sensor exceeds the
> defined threshold, but for that it needs to know which sensors track the
> PHY temperature and the drift temperature.
> 
> So add a property to identify the relevant temperature sensors,
> 'qcom,pcie-recalibration-thermal-zones', to PCIe domain 5 pointing at the
> aoss-6 zone and to PCIe domain 7 pointing at the nsphmx-0 zone, as those
> are the zones whose sensors track the respective PHY temperature. Both
> zones are allowed a drift temperature of 25 degC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
