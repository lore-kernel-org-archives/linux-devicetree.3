Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F04A8FF7
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363285; cv=none; b=eKye/jf3bb094+o5PY98lmGU/oD4ZWoMRKR21BkpMFi4Z4hIHlgp7wlju2+ZCu0E7xNmU8o9jOo5/3Ev00Ura9QPnKjeEwKjpCnmjQl2JFgwU9hPz79OdIYHV1ZnHG7P7X+T1sdTx0jUBIjXX2VuSBmZzL0taubFwlfVR7bqLvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363285; c=relaxed/simple;
	bh=111HryzAB3+BmsU9N8tLYwKEyvYhIGzqqk3NSmGK9+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuiEYOa3I5pUu4aOjdcXQuK8LH0FkIRzRcBE2FE7blWgSZTkuigk/2XOAhhTccLXZRpLm4QxmevrsF0COF6IVSWQOhLKdpDkmFKKy/2qKkYrWe5VNltov8qf1h13VQWFfJbnXJixrxmEkpBwHxS6nMH4J/REiVI61ijvmDFXtsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpJN5MBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCztkWi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpJN5MBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCztkWi4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682D23pV948863
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=; b=OpJN5MBfxd7f5L0I
	usmbjBFo1h+2/8y7RkUKk2IJkFuy8AbcnK1GzmlPlnfnjsCCSRL4asH6GM9eBJ0N
	cDUC976k1JRmxJgYhxxcGH/2s+8rdST0guLo59KiWiBzVMHF2og13jCceXKcqvdG
	KQ6VP4AkCeZcLv0XEmP/BRWW2hfvJhn65AT722CJ/hAXap2dts+ONm/GhRHsG1xl
	T5Fzvfr7YPm+NnrwIhM2+EhuG0VA+xzMJER7RJbOpgjPsWaZe9Ktlyqh1mJwfynz
	BSNNkcNFM1+aYz7WkCEoINJ0EmLYZ605DoflJjH4VSwcRc5jBa2yt5cEbuAEfXb8
	df3ISw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb00ka0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:34:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7530aaa7212so44468137.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788363271; x=1788968071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=FCztkWi4iSBs9Cbps0bL+f46Y884BqBCv4WkdH0ee0JCW3cOTk8ipYiXerPsWizetV
         axmYOhQJFxXvVvCvkd8Qmcz5ZW1pleq0pTd6IqPbTAaCLLR/ZoRs9uaOHnFu5ir5uYKS
         9mTvGxfOxJDQuLxQG7k1vAzrqGvjrpOdG3xEzvFeKrGEMqV6Kfy4rUGzp+zLZfanxzzx
         qr8iN1QBweBHf1s4AGINaR1+c8rBaFOvXroq8rtmDF2j2wrGvisxGURJrlwQM9v0ckU5
         pQOKFdLZALggI1Fst9cIIlegAPkm0nERoly+VP7hCsC5yWU0KjAtKgBnYkytilFjv7fn
         zceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363271; x=1788968071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=TBycV+SWd1Hv8VSBOOmYN5NBtKM1LU166OMDh4ojCtxea3M3rQzPoORcvo2ZEAwhFI
         j5z1LBXa8ht03a5FYCbovzaENmZ9cqkwLCK2yhmdHAI+uXLby+8l16df5CfJXjGxRXtC
         vAPo/e/yW7OV2LX95N0k7kxlEu9kKnlIiwALurS4NCe2aXetwtvqDCNs69EOnbXcSmY5
         Kdnp/mNyY3ZsbmaRkIrcbUVuORk5NdhTvd0ZbsaOa0JU4jtyavWWK1XadRtUYZJlsg7K
         nEOqZ/Lb86f5sDNhCff4v7T+dEqUT8R6wZqRTobxxJfzdA9bWNdSpSQ2D8EDrqStxOwq
         iAnQ==
X-Forwarded-Encrypted: i=1; AKwUvByG599+7SzhfiOWOXc3HiNZpgiX8XpUzlcAHLtfQPjdbSxaGYt60M3BfpO+xobBBWYG6Tz3t5NsmAU2@vger.kernel.org
X-Gm-Message-State: AFuF++klxyVMjKYkPHZSk2ZEQxO1tgGjsoLcBDxkyP9UVagyd5SPVBfr
	zkaQ7J3TRbqXnZvvgL17aV1xm3qcTUTVPAfw7ZCMBYrnHGZ/QcBlRf3TX+PwZVJXyNplIVni55U
	I9+ovkY3jTKwV4MYiAQLUxeqHjzRJ8GQKElnvoDZIg9xj3Vprquc7YXNNYFTqF0NQh4ao0ag6
X-Gm-Gg: AYBFou3ALr4OjuTvcsAZ0ctPMCVCRT1Z5RFBJMrluj3TK/zUWJY37ONq+OU91bgM35D
	v6hU8ef9joWaWsT6mf5Vy48y1E3a+znsOGYixGHtSpVY7dGcKOdn2xI4IYDCcur0naSz3/6VgGU
	/FJlKlkfvI4u4LO4ovYNN4JjgN7KTrL9E0dgt3BE9wXla5ZFQqS0Iouh6wLSYyHQMkvCHKM9z8Z
	Kc4C2ggUJ1mgH+QdSMzqcYp3pLfVE7bluI6TSMPzDCJFOqiNuKMEGj+XEr9xmJtZmgMNOqTyeDp
	fU0efZ7MzUQ8wCGw+IwvrzZorlSoSVUvQnhzw9hgujFynQh2pAobM36qIjHX5gxDcD5NEPsTbTW
	1VmVe96OiJd1m/i3ZlHVvqg==
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928044e0c.0.1788363270857;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928010e0c.0.1788363270357;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a35a5e887asm1147281fa.33.2026.09.02.08.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:34:29 -0700 (PDT)
Message-ID: <e1d809dd-0972-4ad3-9dba-0b7d573d9190@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:34:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260901-pixel3-camera-v8-0-99f159883348@ixit.cz>
 <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6AKrwJ_WptdoANWU6nK3IGy9ykobQwSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX/sXj/qBAriHB
 D2iMmOIKgPmRYrP55kqpnsNQnmf7uTtIK+Q9tblOBtp5DjEeytJaoDEwCIhz0gEtljlGUa7zIl+
 EXZTAxt42DJn0DNT0R5IwQ20/rUtrIRVV5OoZGsZLz1sBXwvnPvbftM8nvoHC2UGDHuaqX5Aqnj
 EM0sN0Cl46iKdp1kDLJRsI9BVPedwnm/wq+wCRyfWq8ipAlC+YPLOopl0wM2/9LODKpbS+Kajv0
 Pjfogwemz5064H/f86+/RyAcRt+bzfl3YG/TR/9Q0JiT2U9Rr5kx6kgEottDeiAYFQRRCxE6GME
 YUinfpRtRtOXDxgILCaF6XZ/Tm+uny9XcoN6qn5QnweTp9FvB+JtER/ABcTQ3+3poB97wk5rX3j
 7aCL3VMXXbAlvdsVbtxwe0S9/9bntRsc95BTrIgbYfqyAKVfXLIaOj0o0NUQ/9G5LU0Dwpd7TjL
 TWXHwiOue5c3AA4HCsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX4xeSv7Kc4dc2
 5PCy9lB8dh+cLrkof1fSw+AZDbmzP+JwTSPeSzlcX4nIxLEQAsBXvShSbw/1UXdhZNojg3Rrbxq
 7m7I+3NcCdQAoDVc8DV9MdWvNoGSRO4=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a984208 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 6AKrwJ_WptdoANWU6nK3IGy9ykobQwSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020136

On 9/1/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
