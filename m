Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393163D75D5
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879739; cv=pass; b=VTqgUcwFfro/ZnVDZ+0PzJVRfzhOWVu1ryKuw3IcGDqBxyystJm5sWwiQe++1Mrmrl/+Z2RCMunkzmej9/a+6kTNjNf/eh/ESVThUf4MvXSX/rjz0SKjnKioFIKdrQgy+tY2fOGZHgmYcjAQjUwPw1437YUEJWuJCc6zdgU8nlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879739; c=relaxed/simple;
	bh=6j3MrGMGJ8BaZT6b2AmYMG2GmSqY2yDP1O8mNQuJISA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdfYnM54YTBvKpD9SoFli0Ire0lziw7kn0ynNNDpnOl7UHNRiCJJ5Uop9w+7WorNELW7Ho5tuxKzGCWpr4AKRazQB+YAHvl74jQeH7hO0fWfeXjRTNTEs/bGJPTJMjEu/pR8glm9oH4epqEui4o9xGpZ77rp/C8n/ZLKgiJPJtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W36l8p+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G//hy1+T; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W36l8p+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G//hy1+T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCZurm703491
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=; b=W3
	6l8p+J0XWsL9jQ6AhGFi66uWIavFG8Ct733Y9ZIgxwCNIquINDtZR/ePRxVUdCMX
	FPUZRppvkn4alPbqsV+3/p/98LYjht8A+mZ+BihLx9+HnXfGP7SItsoj+HpZU6ym
	J6U3OHGzEK/Oh1nEiuyTL5LRaoIvy+LP/2dpkq1ea6LD7q8Yk3ABGDEf2y/qr1eD
	0a40/LoTn1sbPLwF3tPodmJDn87TbXXubvgVwQyr1O/sRx1FaEDSzoe81BkwUAZw
	/D+ByFFTsFLZPvsr31nEGovf/ww6S1bc2S0wMVHPry4DcASkdYo/hPn9MZyRoWLM
	j2njOQnDP4ZScoDkp22g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sanrbm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-415583a6862so10856294fac.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774879736; cv=none;
        d=google.com; s=arc-20240605;
        b=XRGHYpQp+Tr4hBiSER7ot6XdKjOe2P/z3Bhx/UDf6SAZhrp095ZzLOmnCaU73wGUoj
         lrI0k1sozqRU4oN6X2ud42u3+J+sQl+W8uy0syy6pbpjCm3IvOA41XSM8sViaGxzgR6o
         CI5SUL1BSYdNTEz9Z/z+25ol9pxkT2W1n5hQFsOQNNzj1QyQqhOfZlYWvvKeGh+nrX4S
         +e0QLilyhIA1oLS3LVvjWZIXFZz73N33wefJZYI5BZKrqVol1Ki7Nz8h4s8bSNSqiks9
         wkgh+Jd66LzPzGDWnap/vBH1fXFtJmNSVqMT8J0DjL2lIpbgAtDM5Gm8MitxpLe1XXTJ
         aGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        fh=bz5M+Me5u/pgsmhIM2UpOtMXiw7fz+gk8SQUTOk6p4w=;
        b=BRQ2Y314w2oivRkh15oKWz+M2dqvqnIp5WznDou5w+LgPWs4xiTqXpnHZLYXSlLwHT
         /6H4H6sW1oozA9GB6OLbvqHzVIOpWabuk8Fpwvz6wsXlEyQ7nguTEIq3XQPGpF3eZpZl
         QYlsif5MDUSBf6CKMpbMMbFhRiwAn6IglsWrxwb6v+XhBx6Ha9C//eJC/9RZxgXhaHmI
         MsRa5r/DbEKgkkW9J0mpBbmkzouLOtcUBT2E3z9eKv10MUfL+4P9hFXJMvZZwFYZ19ar
         SP0N2SwUbsC2r0Xs3GcnHdMdeiyDkfWH7aKCnUs1tQt2Uu6tN1cHXgzFfYFG5m/zygSj
         mezw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774879736; x=1775484536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        b=G//hy1+TDdX2BhFYmTa8lQSWpzMCK9zRFz6w4UdBwk8VlrxsWWsf9A5ux+/FnEFW0K
         QzJA7UNNiUXdd8im3e8L5AZ4uN8P1iXrJ6z2uzK2Qi/DHSjxH6unvvXuIcd3rtQqzdit
         8Wos6UngNJPrywYx6bb2VTaw5MjRHxJM+sngzxXZP7xxZYolZUxJ8DkCmKzdRd902U0Y
         KWOGW6dJaaMGFXMfb7JN9PPJ1tilLxcyXVCIAX+uD/6WUUeRotYI5282MwE4Vv4DWA94
         VC1NF2E2eU81x1bCcoBfE0QxO4XS1auDJYdfzPAmaBxk3Wvbp2fahueYr6t61jCBYtRm
         gDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879736; x=1775484536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        b=K1fVuE2WCKXVVp7aTI7hamKWgO0O9WxBjk9jeS0vuUnYBIQBgi3XdU6FYWwv619inJ
         FG+haowqa0E8v/KUn1v0aM06WajR+bq5TE3KuFPWBg8wDkCihhC/yjx4OZXNjo+Mz2Ql
         Qdq295NlMjA5+Qa2FpZRHA5IdjTvTUxtJtXRGvTveuFeH4EhkmrM0zyXYMEYDaYiKyHL
         au25CnQbWmmytgj9o/tTa7ubcAxWrIXJLBY+rxNCufr6FWFQxAT3gYmylFoAuNUP8/yK
         SKfQ4D1oFUiQQHDVbKDo70MDE9vOP9lFq5xiagv+s8D/y1YHRfLOGm5HVeI+kvpVnB1S
         bHUg==
X-Forwarded-Encrypted: i=1; AJvYcCVnRi0oqnirifymRBv7K81aKmUHK7dILO2oiJVXuyv0ZzEyZl8GV1XW4NQJPJnTvBNakdmqKOuI4wma@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdWib4YWn0wYf85nN0kqPX2gtSruQEF2mMznLw9K0VhulME8H
	C2x3Er5me1K4uE4cNgpKpTPLpYdary2mXcQuzr6tF+O1OQaIe/5UpuP3Z4LOWXS2YqGcTxEsCxt
	7WiuxfSgMPdAHYvCx+3eso/1RrBPpnIotabhf+ssp8EjArC/2nVSQ3kCjoDslchc3MHWj82VdKH
	wxv+wtC7xxOgEgInhLWCcFnVD+DUNrvEd8Fhc0a10=
X-Gm-Gg: ATEYQzxLCpHKKj8C4+4POhJdFU6hq7wTv9I+U5/ipjtZZl2s4bmKDAsZZy4+E0LgeTf
	gDGN3R8CXEjtKOepEBnPmEBN2Fj5SSjsw7j1a2QjbFdhS2yYHlE8rZW6L8jLnAlrdDcTq6jMb9e
	OUuOxhTGGyPDTQGIPDeNkDzbBBHMxNrOwlpwsFKgZmzOXwXu1Plj/eIJqjtU75+CR1SswJtIsMl
	8QrcE8VcLPdIsvx+zcbnnOKejv/rOajuexagg==
X-Received: by 2002:a05:6870:fb8a:b0:41c:6bae:2307 with SMTP id 586e51a60fabf-41cec63bf99mr6133530fac.12.1774879736418;
        Mon, 30 Mar 2026 07:08:56 -0700 (PDT)
X-Received: by 2002:a05:6870:fb8a:b0:41c:6bae:2307 with SMTP id
 586e51a60fabf-41cec63bf99mr6133506fac.12.1774879736029; Mon, 30 Mar 2026
 07:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com> <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
In-Reply-To: <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 07:08:45 -0700
X-Gm-Features: AQROBzDL6ig_KbiMSXTrORH4oZORYqMryEAtXqw9Iz3-jK_CaA9S6hXZtTmgKsE
Message-ID: <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 85hBMwHdbiqKcw5JdLF6ERsXIts5wCcK
X-Proofpoint-ORIG-GUID: 85hBMwHdbiqKcw5JdLF6ERsXIts5wCcK
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69ca83f9 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=N9dVvvH9XMu6gbUqmvYA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMCBTYWx0ZWRfX3h81V/vQVOlT
 OIgi8nFReBWHPQYA8SJh0MqkX6VZ8Un81FdMSwIxX4uV6bI7u+qptfYZNz8+959K5OStxzmx/WQ
 tUWo0X297rzadnov47wa2Z5UfAE/Ic5biXLGhjS7FVDwO52gfP72GhrmdtRXrCYfqPaZ8+fRTed
 ozB10Fo2nwWV3yOpqZ2sgY3x6X8Y3ME506CLZGmXUrzbTXSZXKUNQbmoVyn7RoCbrQMbqalV83y
 ve2gTJOof8uH58n0NkFrOcV8DPY//TUmTUEfPJGKeUUDoWTKrQ+pEvFyupGzQv0EbkMrKIXasMp
 iPPiQovrVl2ADZZY5ikeQZ+ApizdApYG8rTjAhaFxQvCnyIRWt2JEhjNiPrtOR1uN7PVwk1U3Hu
 rOLiEOZL03KvUURH1L47ovuNcYS1mT+Sp/95PYJWSQI0c0qowq6IqEJL0Hj11BeU6yth/m1+/N+
 k63Mcc9BWkB9CNYDpZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300110

On Sun, Mar 29, 2026 at 11:57=E2=80=AFPM Anvesh Jain P
<anvesh.p@oss.qualcomm.com> wrote:
>
>
>
> On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> > On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> >> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >>
> >> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> >> reference boards. It handles fan control, temperature sensors, access
> >> to EC state changes and supports reporting suspend entry/exit to the E=
C.
> >
> > Just a question, is it possible to force fan to run at full speed
> > constantly? That would be helpful to keep the passive cooling minimal
> > and get a more consistent results while doing performance profiling.
> >
> > I see that you are registering a cooling device in this series. So I
> > suppose we just need to update the cooling sysfs nodes.
> >
> > -Akhil
> >
>
> Hi Akhil,
>
> Yes, that is possible. The cooling device registered by this driver
> exposes the standard thermal sysfs interface. You can force the fan
> to full speed by writing the maximum cooling state directly:
>
>   # Find the max state
>   cat /sys/class/thermal/cooling_deviceX/max_state
>
>   # Set to max state (force full speed)
>   echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state
>
> Where X is the index of the cooling device corresponding to the EC fan.

Getting a bit off topic, but is there a good way to associated cooling
devices and thermal sensors to the GPU device?  I could see that being
useful for nvtop (which currently supports shows GPU load and memory
metrics, but thermal metrics are missing for us)

BR,
-R

> --
> Best Regards,
> Anvesh
>
>
