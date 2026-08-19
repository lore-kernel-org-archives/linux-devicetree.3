Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073E9231A3B
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144852; cv=none; b=jqAwbBgd7JjEOmPvVNN1lvWNv7UtXjHLByEqcxRyvK6o7y123PP27BsRsgBYX2z83ZHExu9cH/Xdqas1jgPTZhtZ6F8U0nQ5rTwRX91dTx28DLkxwqSxQO7h0D1TeimiPzhIyT46TPeK38nJVrGxVt24DgKmnypAqFWOJ9/ZT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144852; c=relaxed/simple;
	bh=fZgPT6qgh9FtEcr0c6VPD8qAa3eL0s4CIS1mIi66B+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyPnLWsJARAnyr22+cESXClGKqnA3QXZapTNJjYmel+F05YjwstFwuZLHS4gJKhtPQ0vpCj3lNFcIlUwL4fxsYTeBMouJCSyGP3gEXSX2ogxS1um3SxQUvk0aGcii/rNC5xKqt5AxXPJ7+GdjOgfxuycdo/tVw2M9wjyXe+kQow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SI/aUdwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYO5WUDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SI/aUdwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYO5WUDr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0VQb4136793
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX4WGw6rLTIthN+chKhI7bgUMumRGQoo44hxxKPoEaM=; b=SI/aUdwdjqaRKIux
	F3VFAbwCi9l4QHDHuhIhJOKQc2tkiIvMqOf1H7c2ZK9ZhsSOacGRdziYU7VE5rpg
	htYYd6Y8q/VdcOjhhT3sRQXIB/wHmtOdeVFQUMauf+fOYLvIBjacZjUcoYB6iV+9
	sWkGzO1ZE7RJhR21HZw5Xr3WcPzgQMcHS9qW4I+OL8U3M8UYiGsntjGmhXmPpD0u
	0YJUC9kCfKvnYIK0ITsO6gQW2maWSSBqix9eEcOs16nnxhtv6YgLJ9lpLYphEnj8
	Rtwf1WXwjCV70wJWkfMU3BxN8GzsuusszY4AokZTSGv/a+946fuGt65ZB96H/9u7
	s+objA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffk85b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:07:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c38fb5d952so31892e0c.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144847; x=1787749647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX4WGw6rLTIthN+chKhI7bgUMumRGQoo44hxxKPoEaM=;
        b=RYO5WUDrcbS85vEn7ocuroSnhksZVaLnUh8T0wp8SF4ILHPtC7KF5FP8l+zbTWPdrx
         2YM1vgEjB+q3A43qJdnjCrPOXS7SSX3XO0ztVGTJj3uWIbMF4wKu/lwPVVMJKMKBHU0+
         Iv8ERpfjElDwn1TORXS506gDoCfD2LqZ6JjoXsSS0C4X/Gv4Y4PY0ReaRlhH3kNLsW7t
         tGCKMfGx2D+Dgeqf7etq6IIGe6vxztWk1RKHHbBI7dAwck8vTZtPWgi5S5yEw0bq4ldW
         +rsyqiJOGvynS+Y1kaqERo63NvdE36FqQaZkoyj4DOqPrGeEuZnfgNThobrQRntHOQR7
         HjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144847; x=1787749647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX4WGw6rLTIthN+chKhI7bgUMumRGQoo44hxxKPoEaM=;
        b=MqQ5YHhYZ2F40KUAXohdnBcrw40oTxgl6Cnj9+/1Gxch8h2NtJP1GpW7WeZx9dSyhI
         fYxQnVe3YvpHo9BagAaCcPzn3rWYOQhdg2Zfkb1KzhT6RycNXoNOsZn8DzlE1fNhDZ5z
         jJCSexlYSPB7VEtXOJ+xytmGuJoZKDr/0vtYRN0VvwgnM5SiiD6KHa9QrNWooPlJYTR1
         xob+ePN+g0yqARSk4pd4KFDH9WZleIzRCJ0BHe/uLA8Y0V+k8+9l/XPocyCV5hEf9R1s
         MV4IXZW/alxNwabwNNatx3NooFcQ9NPW3JsCBusnFaLnauYP9ChZMkZIdQ8OaySSs0xh
         n4iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSsxR3tRsFdYH9iXAMTnQTNyR847U0iwnFk3Hv4xPXgvNMegW/VPTGyIyU90iUuNliUKupjFP12HUB@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTla0V6cTqX/mXELzlpMarXWWA1qLdb8ibYA0+fgTjpQ9w/L9
	ZiEKPOYrPzbi4FEGXaFBT35Pe1EckX3sQakaD6sdFI1DcuOcNbh55TT3zyaZyk0ahdjdVZs+3QN
	S3+zBWNicMWnUx9l6W2uQrYgGvmEZXx71Mh+Wj3OHVvIFJwnRc0Imcx2rHpF52Pkb
X-Gm-Gg: AR+sD13RmshnsDTcPrdXx7Ay4Yn0WHDkUPqVu0rfcalnPFikbDcSaYb/+Bff0xs8OIi
	Kq65ShOGKiQzrbkq8zLOSIiW7CeTpMV26sc0CuOf6UYz++ZtKbmLzl0BSZXf/UT+b/9sfDMvlQd
	eXszhPGkVOF926W9obyMagXFb1DJ0+gZoTwuADwRL8c7+vb4h3FM5NWdMQWka8mJrlHTxj1sWXk
	lh38Pki/e/VV1aoGOY9HZaT6+8WC8kSKUQGg8/IZvjfJd9y6JRaQYKqXEWLgEQM8x0muJR52Qjq
	8gI/WwK1qXJ150gzd5709K/8E0G9o43f3MH4KyvpbJVBJBOp/2HAnRR47JmtjKCCef4W1BQv3E0
	iVzdZEZa2752/t9y02W5WXRMl
X-Received: by 2002:a05:6102:8616:10b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-7781bcde03amr230542137.0.1787144847442;
        Wed, 19 Aug 2026 06:07:27 -0700 (PDT)
X-Received: by 2002:a05:6102:8616:10b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-7781bcde03amr230534137.0.1787144847064;
        Wed, 19 Aug 2026 06:07:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm795349a12.29.2026.08.19.06.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:07:25 -0700 (PDT)
Message-ID: <7bcb2c72-73a7-4b5e-89da-c7ef43ddb5e9@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:07:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <20260717132218.27007-1-oleksiionchul@gmail.com>
 <20260810115847.253474-1-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810115847.253474-1-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMiBTYWx0ZWRfX/wZqJJNBKYOU
 7C5sSq1MsUAe6xtQTMns3QCxT94Idronicx4Pr79zbZRRz1/upRdpMQLme0+FMLXHZBzCNxLnJS
 PuzjuZjdnpthVecc0SsVJEzPfZmk9A4=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85aa90 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=1m60O56Lj7va4YZgAfEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: vwr-3dOvaz-mEvPz_5LwcAeRPd0-BU2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMiBTYWx0ZWRfXznr1vkJ4dded
 AcEz4PAvzTQEzUeR9P5Vswz/8xrz8WMEnpLkqLidUAD83xxyRrIlMh1ODRwV/UmLejAg5BM/1ru
 cfRNw0SonxbCl9amjdAZn+sTJjlrvGYBc50oGXXGCQ4Z+VcvUlf4Oavy4jDiEKEZhcV+nGuePe8
 WCrrrXiVc8QH2YZQssy/2n1+1bXbgeUg+dSVH2ALzmTOjVCEcNrYS59yrYkhCLM8wxoCyxMaIlX
 AgwfVKIJKD2a6IlMcOXLBsnVPrEnLruGGX9Hhw3DluvyRLLzHLQq2EszbWgo3SbEEfJe7YTIGmm
 Uf1ApoOToqFt9mkGOLC6qt/5S6d04BAaEmcfFSCIJ0ztz2GFcLxkEMrzPwA+xz1gN9Bj7yi584f
 q72knKe0swO5hq8IGDCClKpqHsmexiqPjczqjn3j7Ortyd6iWN9BnsxX7J4NR0Q5WraQyEsMKqQ
 /mSf8ST3VvtVyT+5q/Q==
X-Proofpoint-GUID: vwr-3dOvaz-mEvPz_5LwcAeRPd0-BU2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190102

On 8/10/26 1:58 PM, Oleksii Onchul wrote:
> Hi,
> 
> Friendly ping on this series.
> 
> Is there anything else that needs to be changed?

Non-urgent patches can only be merged roughly when kernel.org shows
that the latest kernel is between rc1 and rc5. Then, rc6-rc8 are left
for bugfixes, so you just have to wait 

Konrad
