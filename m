Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8134D2EDC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062029; cv=none; b=rPIaKlyFhfzBE5cTMaK13xWiJKUT6r8AqX0TtxhL/MT5gWykWZlsJXcrffGeODqRq/3O2tuK6CaIjUbJGso7Qjy1oFa1a2JHuYRhaN+EucxltLyosFDTIGVK1lOurrD7/vFnFAbAkuTP8tR0uRug780aEl7WpWf9b3MN5SmSWMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062029; c=relaxed/simple;
	bh=rBYJ+VBooPiZVjyoQritmIrBDC7txb3ZU8qUUwQjDyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIVvWvRSFbJH1vrr42YkbidbLgi7LCyD1hTx/mjScAzEgbiHDldQcRk/UJtmpgH4sL3DR64RC2Z8XIlqd7hX8zarbcNm6UTzCKdzzw7Out+8aHNDWlrxUhPdCXMeLyAa7UA0QFVM2zhxiOP24uZUskwRwtljVJJE+rn9btaS4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9HO6y/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5oXgeAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9HO6y/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5oXgeAK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuHH1596368
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=; b=j9HO6y/ydwVkyQOZ
	K8H62hOQxCyXL01kFo4Cp+Ga69p5a/kYJYfitjkaFWM6nrwxHgR77RQ2mqAZ4ur8
	9MHoSRTgy/IviyWUUIAbw58xUl4vBiKIoaB7pxxzULpV4w3K2Q6NnWPXOXjkmMEv
	ZZdfFtaWmC3ptr5DJ74mB43KWQHAkf6leg3SA9moBzm97wbWFQ1+NxJmjHWnEdNB
	dfy1Vcn4qiuJNApNuURj7LrcAveB3fq3DpFL01kBeAr5QQS0AL4K/G7SwtISwoHh
	zvdaTiOLykLu1FWwkmIpJBLkz8w9r7Jt+ttmaYToZrThrYeMqlFg2H6C+SZkSgFa
	arFHzQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v83wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:00:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1704190a12.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062024; x=1792666824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=W5oXgeAKPuWboxjvGh+NLz9BLz0M6NCqIgJnNRqTh6UvWTW22CN7j1FpNUHGe5j1ti
         Ylz0hU7S77E6tAW5Vv8EwQHeO6foQ3YEx39VdcSrIepR7i8VLEB9KVs6ln98uFzDEqBE
         LFAPh6iVY0p8ex6TvQZQi2UN1rbfrCCs8OlObFPqhk89uiOts+ghuaGX5i05TJxl7nrm
         7AosqAbNDwcZX7GVGIgWRP78cIFcgItN8G8+JjMRJh5bb64JDX9mUE3EOzKnE4uhEbkC
         OrBwHIMDOgPDk14zoCut8E+mGZEjdnOFX6Of4rq6UDIIfs1qt2+2eRfxwJCf2wXZ45JQ
         P1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062024; x=1792666824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=l9GlFbEz3WFlYFSk/4caYBLgrVGhtQbLy2586iPnuzpMs6ZtEwJYK/dn8wVCNikLbu
         ke/lp/E2z3EyNWFcuoCRE8pkpj/TnCWo7+vzmm5M3s4MVrrobC/z+I+jml+TFnrnALN0
         yD/K7uVpsp++eBNFp24RFTu4C/obe6jXOR8+LpzrWuUOdS1+A5U/wk+9WG/VITanww5C
         HohmSFkHZQ4XSi0oJkkDc4EJh4OEPW6RJkmh+Vz9Id1e9RMaaTF+zxCkcxgqfiC0VOfw
         qYJUGO8eLJVlVGQSWDBtoZ1b20BF05cmox3V9In7D+ckzTvk8ua/ejD7z1CDwZBRaeR+
         nF3A==
X-Forwarded-Encrypted: i=1; AKwUvBxX4F8FIvlDjFdHn/no8D5amCm3I8CbT+tCfPuosOK7fx92XL+PyTa8IW4BnAtoXaf6H8Tu03Axy9Kp@vger.kernel.org
X-Gm-Message-State: AFq9FYJj2RVDrtjGsY5VjNt7xor5ZctB4UVBFjjYtybswX14FVjfiPtt
	wDxDkjezW284qyNPFR83qM4CAZYrrB6X9ytYdvQPSsuB0KhcLMc3F1Jzgnc4bR+x7U20daYOZGD
	+vxiHCX7SH5kWT/OJyx7Bh1RL2uOZOVTMpd6GM40z1awTB+nvIwlwb4+9aX340LGI
X-Gm-Gg: AYBFou1cno0+zCHzZ5hgPZk/3oBVtNJg58HXFinH9tiLBCmlQUMsPVBYfOjmBXtO4MZ
	BzElU4PzSTbUcgVK+s4a9vFplx7bVjJ7oWeieqRMP6BNf2BE8+I0KyLDGqmuGGPFOkw40AUDWSd
	dMHAlagGcBn5vO+jjgiq72H+Gtwd4sZa1rM0/+6tIWlP74UCnX32OwcP930V4Bm9XuPf9D39eju
	GHhJA9Ms/4ll0hryHf24rfo6K/NV2GY1f2GvJzWJW1U2UBbGH321f0F42JkqLu57ZbxcE3gbWYO
	7F2svJ+v05b6+aIcpciIXso2Oy8TMnPyiOXjYhBKSGf5ZoUb8raIIO7XDgRPHBjjydciYutzfLM
	R/Jy0kFpEzYNkfgLfPRiqxruV6Jo=
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268704a91.56.1792062023494;
        Thu, 15 Oct 2026 04:00:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268644a91.56.1792062022861;
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a31aa8sm2134817a91.0.2026.10.15.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Message-ID: <fe833dd6-0124-428f-95a4-bfc48c3a0dc7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:30:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX/N+vrCHh1Jx5
 l6VPr5E1MW44hA8ZhLdh/Radk8BHdCg7ujy9tyhbcD4dWFCrc87Xxz9KzvYvF5UEVCljzsOMy7O
 HaYDOeJySnZkFqZxj2Dm8tPWKV7Ckf3YiS3yjwCRGuxVpUPHbFDGJ0WYV70hLpy2JIah4Z7Px/8
 EkwbV3FA7nKN7rgdmI9w+DUjcUYZLiZFyYZzzsnbaljJx8+S5ui2nRlRG0wrfpZoKj27dTXYr+n
 KYs8jTgLLuMS6ziqOPn6yKmUPRPzi6Ex9GDnj+FER+I+Q+2znrNTpBpSXzixvdsFQNaItr7Q505
 gD8xO9x0UyYWvKQ5Xnx5qVKF3cL1JuhxkkNkWN9bHn6CubqtVpahGncQjBIwkOTe3BdFeOKs9wq
 2pFEhQ2EALqISIDViegFtxVlQ4QcWaM6YZC7ulo+UAgGkXFzb5w2dubQ/XUMjanH0v9f3wk+LJ9
 nJX+EkkD7yA7TVOAO+Q==
X-Proofpoint-ORIG-GUID: 1tKEXjF_s8Pfko_MIRY9n4ppeFzhFJXo
X-Proofpoint-GUID: 1tKEXjF_s8Pfko_MIRY9n4ppeFzhFJXo
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0b248 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hpE6E10lv6cxlDq8Q4MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8ZfF1CDK6rF/
 FkASj+XvMFexMGmoLKnWfHd7MGvT23Gy98l802gRtGl5wUNgMe7nS2HtW6BMCizn/W/5pbTH37L
 v5+n2yQWEw8j+YQqXzL06oAdQUscpZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043



On 14-10-2026 16:02, Jishnu Prakash wrote:
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 

-- 
Regards,
Nihal Kumar Gupta

