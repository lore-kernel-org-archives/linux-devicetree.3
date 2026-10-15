Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A919B2D2394
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041042; cv=none; b=kUgUbgidBEN1iK4grULgf5kO4HqK1dzkHt4mpVdX6UhUVg2D+231JB8BnYWtcwhjH9PqWZxJVACY/UNhPFvDFKiZ5oY14m50urGzv/1JlabOPfnnX+9deYzIneIm1Z9wQ2DKwYddMiTCHXnI0+3QzbOe8jCpSutUDCqoNJ23g94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041042; c=relaxed/simple;
	bh=sssIOgXcZE2/24fknlxXJ3s5eJ/OoslnpIdFTEo50tI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nik5+Cszud9xPjd3bGoip56x09QHV+Ea6B+axT2s2psQzxy2jSU0o9TKgaUTmTSlvwrGNIijDpQ/tg1m1JNznRYrYoXkMjZajz6YaePOgYJWQfwuvp01l8UkzdFF5SBwra0CfYJMfTQix7O2ae1oNbmkCU+jVThvAcryIiM/b4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfLGB4yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTby6h4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfLGB4yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTby6h4T"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xaHB2738648
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzATJjicdxKOoPMvx85ZokhsKNViTN7VDVAgDDyZFsw=; b=jfLGB4yKrVfnzO9N
	8uAqBkNe/EAfG0ufL9LX5rnszgjbNd+r6/5itF9HELLaBJK3PPrN8x1/YEHMy0Os
	s67f/JAOwAu7P83+ARCGL5sih93mIWkEWGs9TvJqRgYNTrpj1vH+J34+ovfOeMaf
	CgM9bhfbqatfCJLke/ON5uy75E2YX/JVAC4LikbwE6DPCNxQdPIdrjwIjSHwv5IO
	GrOnVMRbxPoCNny3W1mkELYun02QEhv8Mk+JbL8Nxg05zoumW7OLuMg8/IiWIMn4
	xK/1emLDGNeNLfQd9nKxuWTKx1alP2Fu4/1vhvHY77PJkoumtkSrinesEHxB/orN
	He8Fcw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds86r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:10:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8872ada18d7so952762b3a.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041039; x=1792645839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzATJjicdxKOoPMvx85ZokhsKNViTN7VDVAgDDyZFsw=;
        b=LTby6h4TLT6IAmx/Ae+efqx2Snz2AXhsM5jkXT5O1gvUz3WHsUn7zSsa8EnPzmaWf5
         WSC454L4ioSKgKdczedIXU/V8r105lX6VMGWrZQUEHRT9DbRD7d3IxqDtONLFdelK/ib
         7Fnny7H/B2v+R/SaLa1W90Au3chcFtLtSpJwzJYiYdSbXsD8Qi5nJ2gO/K2Cbqq0QAqc
         PBDsSXvoo936o5lqprti9y7FcMJrFbrSEj7xeUkIu3TmbDfOkl+Q5Sq7LKja9DQY76M7
         xw6O1R04C1VfGGkVzcUJkKlWnEMF0nFBkcTZcz7f1VKrdLpbyye9f9PLNjk3WX8kh+KL
         RJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041039; x=1792645839;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzATJjicdxKOoPMvx85ZokhsKNViTN7VDVAgDDyZFsw=;
        b=TVjnG6L66lvi5Lk/B3KzmIvnA6m2nhYLsmV2yIV2WGU0kCho8gneFz4KWz77sK+WN/
         f9Sg7mCjcg0pgqAMR+Z7iKZ1H1rQYX5JGZnUapHO9PNbilV2oi/2X8tiKE89D0cRjiVT
         k41wx7msrpHlhlfVkURLvNteKyrh6d6zhRESc5AVNqhmPKRcOMJnzh2ZS5FKBlhxg75l
         b8lvnXsMBIYmzy9K7h+8PbO3rG29bZZyEILbBAB45Rm48KU2QBkZ2vKD3kgZmaFsKF5L
         OwLNVg79e26xJlVbUDrW/mgjuTn8GroUwE0CifkpOYdLGDciChG+eR+Q2ncr65EeopTm
         tYqg==
X-Forwarded-Encrypted: i=1; AKwUvBzo4Eqq/zOCauOQUK7u5PP5VLTWK8NjuvB4E6r7J6gp1hVVa/INFUlgfu3ZgddCZEbtxMtgrbsyREJB@vger.kernel.org
X-Gm-Message-State: AFq9FYLv/oAOk49YzbSlZYr/oN3mt/IKAWZvcKcOxGM4MY9XASJLoc5u
	r+exvfnLPUDXblHBicG9JC8EMrlim+/7RafpsIAEljLvn8VGhjhYKCtdHxzrhBjjZkPBEpDsoLK
	xgJQmi/ySso84PiVS8xQKxaEvtVhx0uwein1S2z0okqi6Y1MbclAXDvg7+jtlg7+D
X-Gm-Gg: AYBFou2t4cTU8U3SrhV7vrD79uy6bBF+1sNwS/MARiS7YBVJE3buZo87VGblX4Q+JHM
	4F5H0CH5fbWrw1G/IBe+nV1oULGQ1dfRkLKe/L6GwFGe/BZeAUQPbWPB0JA+p4pJf91HcsB2V4F
	CJ1oofbvvizZyJv4hipn8KFHvA+bpbSZuu85TzWtjWWBCD4zWwlbokgOb5EbfWcBBWWNcHZza3o
	c623ZRZnhf2xbZKdzWbtqGxrrZeB6OworzAWt0VuWkYLpNL7PGkokclt/aNUZRxv2CFbvvD7mcp
	PEWS4YvWzGysEEmUy63os8DUg0qyfpKdXjNCYRoBUDnA/3+IrI7uF43tZKAj4a/grlo1iu6ux8l
	R0M7YS4ZwrPf9eiiTR3TyAOHSup8=
X-Received: by 2002:a05:6a00:811:b0:883:54dc:7892 with SMTP id d2e1a72fcca58-897c86a3c91mr16386221b3a.52.1792041039442;
        Wed, 14 Oct 2026 22:10:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:811:b0:883:54dc:7892 with SMTP id d2e1a72fcca58-897c86a3c91mr16386162b3a.52.1792041038316;
        Wed, 14 Oct 2026 22:10:38 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80508d5dsm1800223b3a.50.2026.10.14.22.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:10:38 -0700 (PDT)
Message-ID: <df8d5a9a-b1c1-4346-bac4-c2c028678d91@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:40:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
 <20261014-fast-swinging-dormouse-26b5bf@quoll>
Content-Language: en-US
In-Reply-To: <20261014-fast-swinging-dormouse-26b5bf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 868XuiQB86xZzw-9EdnaqAP99MDyOm88
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad06050 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=m9Dd15Dd7eNj5BCxSOQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXxsJqFw//ix/g
 OI7BTTqXzcT9yZjgctQSuxeheYt69GhIVCP/QWOkdv1pz4d9/cGxLGVnEkhLh8f9INoSxcHZDOa
 qtySeFJg/4h/Zqtl343oVsCpHqw8KH58D+Sq/vsdf1LGAGy8Mulk/k7AwgJDJxkeanGilvHy3DP
 iOjPsncZ9sk2GCMXyPOxt+UX1Ip9V9/VMGrYukA7G9DH/nt1IZdt2pIpxEd0BnzASeUXNDvgJ8h
 iPqcsqvKexJFUxWgCDJ18QkWaxbeCTs27DLrVM+T10bYRuE9AzHuLkm/4g5Q5DssQsmsZuD6EP5
 K0kRmDbC5YKWcfuZk0WHsS5KH7oEfsDuFy94c6pHh+LtoCCJB+I37v0vBzCVgssOzaEcQUosvA0
 JGPp6OMZWaSMsdr0tB42ifS6I3Waz7b6uH4sk+v1DqO3CjYGH6vMUPi9+RUkmrdEAh8MqxPZhou
 5F+gJKlvkLQUWyE7cLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX9/vdeh3g2S8v
 VkjOtqtyv3B4saDqcpnZxeFnjgVCpN/JgA6OsQyjuRDhDRmyVpMPV80EooblTNcSGQ1nWw/2yyd
 h3IYsA16VIwFmQp9dDFnIKrz5oDpPa4=
X-Proofpoint-GUID: 868XuiQB86xZzw-9EdnaqAP99MDyOm88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150020



On 14-10-2026 16:48, Krzysztof Kozlowski wrote:
> ... so here is the missing file from next patch, so just squash these
> two.
> 
> Don't add new device piece by piece.
Our earlier plan was to send Hawi and Maili as separate series.
However, since Maili uses Hawi as a direct fallback, we combined
both in the same series.

Sure, I will squash the patches. 
In a single series, it does not make sense to add the device piece by piece.

-- 
Regards,
Nihal Kumar Gupta

