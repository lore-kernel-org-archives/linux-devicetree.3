Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B174378D87
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896666; cv=none; b=gFgZcKgvITew+xhNHazOXSLPOIzQk1rG94wYRFs70DGiGdCIzmC9U0grCU7R3LfGBesiQKKtg7y9hNsrCrP4IKffI/kjj+fLeBiNbHXl8AXWART4aegbKxcP096zuWWxt2smsk71RvXgj8a8H3McrlnHUkoZfvF2iVij/W0NZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896666; c=relaxed/simple;
	bh=qTx+DHtWre/vWRqrd4nb+kTk0I/WA3gYh9rVEZ8lRMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8lVRxragzyohIzz/nrEeu+EkCQNpZTwDFuW7/uNLgKWN1I+PrkKDZQUfWXu06P8YmSQOb7yXkKX23h5JxmOQ7CPuzyu7qgL7tT/b3jGawha0v8gKea+4GkVJFeSgVsKh3F1C39x65XnpUxXHEMnQq3qSV2ogEHsFCg6nG1ocaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQlEaXTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQYWfS9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQlEaXTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQYWfS9B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EnQe1575718
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=; b=SQlEaXTc2HTwUtKl
	vP6UjSZZiZ+KL94k8tWgc4R7n/XHQkay/RttbnXeazEA0guDyjMTBAy1uYo8xSST
	t5B6ig7rpZqMbcURmD2VdCoEpCCK12OS15fJo/hMf815er7dl7o5MMYAt/lDvqXC
	QZdsOyrhVgt5uE947omn+btpmZkXpEHuCGLL2IQOCCu5q0IS/9dhWuwTZa58sIE4
	KhPTpInViGAYiZq34qIPqyRe5BerWVAR0eoVRjFRBX314tLZ0Mg3i3oOAhgYhi37
	S4154se3lJV+B5mY/8TQJD2Ys2UfWE3yIgHPotvaTXkA+NmZvfS3fwXC5+DXyLjO
	VvNQsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxf3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:31:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517afbeda8eso28159231cf.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780896662; x=1781501462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=;
        b=iQYWfS9BeSuLd0qjI5xHtZzWKW08Z6w11KqP5fvmP7CZJjtsKR76dX2WiP3HL9uBkU
         zZfNiEGkgJglB8qQVe1RkHUsUEuJT5mI7gN3uAkGEs8Qk4o9sWSGd71mQMHenZygfxrD
         wwnaojlm6ZqRWdTBPBlXkJL8D5faYrhjCZJ2VZXo2mXcLb4x8xgWEeE7Vild12HDoe4p
         SwH+Pn6lSZIoBjFVaMCTJ1+Yrplof6QF8D6k0a85JvkcxvTyvk8d38NHuIuuTkV2S2Nh
         HqhY3W0PpMHoCnXOXR8hZUN06YYXurdWUfJjxhxYtAK08vpWSfn5kz5IdC0Zco3FtDSX
         tpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896662; x=1781501462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=;
        b=PsFClVGPvO+9CWNxTUUOKp+lpLsfoSnLaonc6cU9EA18VFVKY733RyZ/kPIn03Ae5k
         EFziALckp/GaoO5xfKLcBfHFhcfYO4O+OVvv+JURsIq8muMZb/FmaEIo2Z1zwW2Aymhw
         OC7LWwvbfA22RFyn6obYH4bVfDxQdsgyZbEAoV7wk3VG6kAo6Vm/n5P6V2dUMuxqRpeu
         QGZ4BwgoKQFRMBQPXWXKJWm627LSmbv6BrR4psTiSOmA+fWHn9eZoZB+pan5285mHykR
         Wl5b+YWxYe1lXtagPJLE1G+6vyMiW4RAu+xfEZ0MsiiINEdo9Qq3a/OUCJKhyJasBUpP
         g5kQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sysdtXT7BhEJNClKlpY33Fk2BmhEClxLA23opNzP4BeEj27FWT6N/CATZzMgzZRnVwTWqF445jciR@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/nl/mxTf+rf0pv59mJ8nRKIqN4pzSd1sywGvcap4H0M8DoCu
	bjbaJyYRpN4BPihUj6LFqYt7ro1WR3IT6uulkfXs+UE/L5BwNyd7ouiF4Dl/v750tKmjvJrJou4
	v8t7Kzgf3ChhzGAyLJfac9LEAvz4rnaqQzemh93B02RcaYbzkxZ5Fib1RgQCaCPWF
X-Gm-Gg: Acq92OHuq7TN1FJ5WGVRF3NqJnYnAo2eaLGj8RMd1pB+MNvJL7gZG5nJuI3XgZcMSso
	sikmiyn3bDxR18HvAC7un6o9ttkwH1XiqSF5ZEktWic7g4i5bmmc9SyhRMQNHrH507hO+lKokaE
	D1CE1qPM84sSqRgR17kvPNqbgglPl9JgZKpzPRGQZlUrwXYFjouA/5gNqrB7Px8j4UlUCV9XZrs
	hNGWgro4UVUNmB3dIOswfP2oi8zhTPu8ePQU7rP7KNEPJR/vF8JtPy6+HLXEcfLDsfvuT6UrVnY
	UyZ4EBKgVMV8lb24+7rswEkrd5afKCDKwTUP3piWM5f+HJI2PmkVVTypD0a60nGoxEy4mwSReDf
	ghKXVnmJDxHc7MX5YYmUGzQO5+DOm2b8EDYO6INL4ATCkrrUCxRYQ1ETrEkSb7Kku7A==
X-Received: by 2002:a05:622a:98d:b0:516:ef49:f6f5 with SMTP id d75a77b69052e-51795c5306emr207093171cf.39.1780896662651;
        Sun, 07 Jun 2026 22:31:02 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:516:ef49:f6f5 with SMTP id d75a77b69052e-51795c5306emr207092961cf.39.1780896662245;
        Sun, 07 Jun 2026 22:31:02 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851d7bsm6551413a12.14.2026.06.07.22.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:31:00 -0700 (PDT)
Message-ID: <75755586-0cc6-4dce-a1e2-726b33623eab@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:00:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] media: iris: Add support for glymur platform
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NyBTYWx0ZWRfX3G4MylCAbVTb
 mm1xdlMjd1eRaF8S9PQcuDF0CNsznTE5uAQMPo8P13g1+d9ANSv+eORlT3EQabNpi5N+gBbz7iL
 yozzr+05o1QKb0KZ/ytYgY2VZnKMEVutotI0Xzz2OjL6dCg7GGDA0ay09Z0sxYuruMhKvZbFwWt
 Fh64GxWfBt0e1biADa8MhG6Wjg45vEd1l75pOj4QlKgzTmFmMqYzoKpxobrvg0imero8R9sjjtV
 rKLYXWrsZTkzT/0PWnggqsEuNayeEQix5fHLVWDd4NT4ZCNsEi90TEL8xSBYZOgKCtZKtSwOhc7
 +GDVZWned9fDgeZNw5Kb8tdVX02q6E27yLHAPdbxNrDRyj82mIdKD9kV668bbDm6RVrVf6Tf9jR
 3tp8ZmCVDMhRI1w2fGmzFUrjPubFXVjRf4mArYdW60aXfF1IR7g3VdJam0glP4x988rvfo7yBF6
 WzmLrao4rCilX2SDzQg==
X-Proofpoint-ORIG-GUID: yXX5PsRIl8IdvNNnKn6LPgl7VUv_eaG6
X-Proofpoint-GUID: yXX5PsRIl8IdvNNnKn6LPgl7VUv_eaG6
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a265397 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LkejVvrHZj9QS69ASjwr7Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kk5GEcIQhxhgB6gqvmQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080047


On 6/3/2026 7:48 PM, Vishnu Reddy wrote:
> Glymur is a new generation video codec that supports dual hardware cores
> along with additional power domains and clocks.
> 
> This series adds platform specific support in the iris driver to handle
> the extra cores, power domains, and clock requirements introduced by
> glymur. Add support for firmware loading through context bank firmware
> device.
> 

<snip>

> 
> Vikash Garodia (2):
>        media: iris: Add iris vpu bus support
>        iommu: Add iris-vpu-bus to iommu_buses
> 

Bryan,

AFAIU, if media maintainer can review and ack these patches, then we can 
check with iommu maintainers to pick these ?

Regards,
Vikash

