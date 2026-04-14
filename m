Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D473D902A
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179775; cv=none; b=SlX1SUkFNgAq5bXDT2v9GuJWD6cD4WvOvC0s0b9wXSwPT2QCOUEazHoi7Q0aPcLqZyUXDL9AfCvDcV6bcjCoAOudyC7wUSM3DBy2PrIwYScPzZwRrigGg61YUmMY9Qbyma/xmKyHkbjfQuMJJKl38vs6T4h6ldate9v684xKHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179775; c=relaxed/simple;
	bh=GudSgVh5zGLUJIOGCDbMHamjSv/lulJ9mtwapINd6Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paURDUe4VwBoFnqgLjNpWM8OGAJ+V26iELUwi8PtA0c3rZWDlSSKu6iJC7tQq7+mvE92wW3xlSUJvMWoM6RfFWQ5GMjQkfVjYueuqCMjt0OMxO9e2MwkNqBIE0NeSiGJ61II3ih+vqtxpA85ZyoRM6h4/o465bImYS5VZ/COlik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbYhIVGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBqx4iQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbYhIVGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBqx4iQu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBBoiB2633313
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y2iIaBupa1ZFZoZaC493mfOp
	0zJnBLl7xcKpovJeqPw=; b=QbYhIVGT6CYES30c+BcksIQO4IoTyS0q0AE9Rgk6
	jbF6f6NtPvwVCgHojdo7aoSf1LxqwpLYwszQZsO0f58ixnO5TKRVjtSK0ZIzlqGM
	xgjj45B4VmaZn2fWZFTWWs5SYbKO8qJWJbqrmtY1G4Wydv+J/eq82EqAaxclu6Tp
	NHsqDvrc3HlYb2mQy0zNogC4ZW/qGFAIDnpguGH2lAbaH6RAJbt7mR0RD7PGIJ9j
	rWkJUvYlLfYYYgi5prNfhOK1qUYhfY3NmW40K0yRv4AH3KRp2J0aTz5nmH+XbPbG
	TIsPM7Ynj4n5uVAa/SGOQBWNbo6B6wQCs3Bcsx6KlUEGug==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86cba51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:16:13 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46f083f82c7so9346104b6e.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179773; x=1776784573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2iIaBupa1ZFZoZaC493mfOp0zJnBLl7xcKpovJeqPw=;
        b=LBqx4iQuXCnI8twknCEBE7pSQP1fRPck3EGnISjBNe3e20JzPc/VxFFw8W13XtzFpT
         gxTN9NpS29FGSu0z9peEKrdSOPjDxc8/8qMKKc8bTsgTkTC7RRv4uVfAkxpl8/CWJXYb
         zdBWh/TTY9izpggStAL6ncxt9LhhpnTkitgF4VM65LDirPFT3oLv/Tk2gu1r7j+VNLn5
         kXVDWh4wdGEkeq0SOgYVUxFwExyAgL3mQC1V+uT/8G8wJ9Nauj+kfzXFWdCzHU/9KzSD
         a2KhKKZQNEl5A8j8GMd8B9k13j+x1CVzyfNXzTR31b370OAEd/RyGYtceywZWEzIz2OX
         zk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179773; x=1776784573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2iIaBupa1ZFZoZaC493mfOp0zJnBLl7xcKpovJeqPw=;
        b=Mx1eneRimeytkRE/PWrQhrC9em3fQ10ioJ3ksXGOXgG0uX4OLCnNam7XQDQ9oeX3Zq
         6p8kDp+G/DqfxNaun+Hv8tqwVG3d/F70BVh8sihND4TJXtLwo9L9n0b54cG/1b1Ob/Dd
         2rmuLmMPYgMxXDpL69MovKuwPGy8IK8RpxWVzWSiW9o1ELEyqcbHTEgzDvzjpsGf4eid
         QD8pM5Ve6XMd6M4gotVeWjtXu90GIdQ3Rd93rgB5xI4o65elSh98a2gdfEG2kdwWA56m
         os1NqsWAEn3/KeqHIDmJ2n2wmswKTSqtDQJjFYrwzUJJUFG84S0FdvZEpNxp7ud7RhOV
         o0eA==
X-Forwarded-Encrypted: i=1; AFNElJ+Xh4U1xEENCS4eFHHnnlCDbSVnkrQKi4UlMmivY5082t+lfXv/oYeEMS/saM6XyOK8ZmQR0BeCK0jK@vger.kernel.org
X-Gm-Message-State: AOJu0YzirOX/EO4Gh/HkQPUXVZzLUEQ3XU9FMk5Jmtr6VlDVhupjoJI0
	pQ+znUUefiWdrHFBohhxV9wVvjRkSZJZyEMJmyjgIVuUIzWTKFqE8BrIYxBYa8mXqUTjzr5Pare
	bPbImuiSN0FLrN+JyuhstTGeemoTstN20NPs24iM7n6mcvXiEsJLQDOGFanUDALrr
X-Gm-Gg: AeBDiev2iuMp2BVD9IT8KyPMZFsCHhPZJ9qzQUx9V7GMHIMeou5CQOodffvzcTfLJRW
	q4wX6B5IO6LwcshcaZjUoKMG3RMytk5/Jc0sTsWveG3nrihRy4C7sq22I06Q8QQRoWkuEyob9KF
	spl+pzXcvW0ZwBsOt/Z8Ehdde6uBdrau13bmT+N8Qe90p3mzjuoMZN/UPTeXIPmAIjegkDSiLiU
	JPpEeqdz4brsmurj3X/HOB4XP6h//1qYKlOJ+7yQE+JngXEs2sipD+5QxpAuEv+KoZLXfWNkbCY
	ac6eyLALv8eyrE8hpvfd8ygZu7bRXaOyY2zOYKJjetQE5E6/TglimN/trEBXx9P0+LG3EIHuj+T
	koTPLSLHOqZlY8xL+mBlxHo3gKZTq7JbHlcreo7qvlr3HBUA8mRbbm4uWo/ULjESm/pw+G77Lyn
	cp1sqsvXtLwCjWkxS96qoljC1K3fUpRLizKkK79kIzVsK1AQ==
X-Received: by 2002:a05:6808:f14:b0:467:f56b:5267 with SMTP id 5614622812f47-4772a866badmr9869333b6e.10.1776179772791;
        Tue, 14 Apr 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a05:6808:f14:b0:467:f56b:5267 with SMTP id 5614622812f47-4772a866badmr9869302b6e.10.1776179772241;
        Tue, 14 Apr 2026 08:16:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40006d23dsm1131145e87.25.2026.04.14.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:16:11 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
Message-ID: <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AtC3rk1J6zqI2eXlbd_mkqDD1cYX1k9r
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de5a3d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Y-W-850UrnaCaRLArZcA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MyBTYWx0ZWRfX0MKxvb8ozkSk
 pH53wlb4gHaG0OFk4ntQBZyjl6Vnrc/bfQbbIvAj4crsJNKModTqmodVByMe59J+TZ0MDiJQyKc
 YMLej867+SHzctYWkTgpmw5i02v8gsr5dGpZTW3HsC+nwrChqAm07oZy+S0+fbmU8aeBszp7QMB
 SqwNYhdAqhkZtDeOl8GJUQCQMIUF0EyLQzMJBjh6J3iVp8wIBaU4mYhz2B/6cF7iGGixH/CTGCr
 p0EOp94wO0laImXGnxj1YbfpgD2dt/Ql4BJZqvysaGX6L3lg4Vtdda66K3Pm1pm9KGyCOR0HEsK
 UNp6eobD4iU8PiIalx67paMOXYrEgk4+ldqQ0+MpQ1x38S3SI/kMyk7xw7qz7b/dPQHpACMg442
 CeNhYJ+W1U4+Twy3cv0TCHNhnF+Y0M/8zUhRglgXhgQJtLAe3/byVl05gw+Rw37lPJsAotjm+nz
 Ep2YOzGyS1jnK7jRtdw==
X-Proofpoint-GUID: AtC3rk1J6zqI2eXlbd_mkqDD1cYX1k9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140143

On Tue, Apr 14, 2026 at 10:29:59AM +0530, Vishnu Reddy wrote:
> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.

Change the order of paragraphs. You should start with the definition of
the problem rather than putting the cart before the horse and starting
from the solution.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
