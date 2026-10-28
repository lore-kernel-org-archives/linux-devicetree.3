Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184145;
	b=zeaDK5J7+OhZsAnUV4pic6XIY5/3JhNj/TjonNViXB6obH6gTEalhFo71RBDfPyrcxb6
	 FpnpEiQAlO3gAIkzloCFCpgJ+yoONBFLLK8iNsBpv0D5jINDBqrgO5Lc5NV1SS2U6zjFy
	 CLRw4/aKI4qXzKZRLeFsILFmDgbjQ/gN3p3wgrqXzOwEXiNUEYqu42HgEBEnXK5zFb4Zi
	 WtGbX2UbSyKW1mhRKn1LXkpttLJKFwnFPnjE/++XRQzs+1gHyvhrUZ6iECjL4LBD9mY3O
	 qq8Gy6X/YI0N5lky8iueOjRuHfAwoJp5bRT3yxicj9wcVTkV6iHYdDFDOtF6KjuCyrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
	b=OaEhO8ycjj+YH2YucmXZMM7QO6Vs+1bJQ0WI4DTdxdzFpnsoPPF0TxdHhUvmBXtJ8hGZ
	 oLzcNXKK6be8Wm/qdaOqkWnW6IWPNh+C+fDIH4dQCXFUnO413iMCm7c886w9al2F2le/C
	 wV0FE4aoYXh/h6JhBRNaXbTlvkkVfhO1SYf5eDcb/eBF2upEis+tHURI3D/zDNEuG3q72
	 fz/0aQSLvRLHP7reORv3UIRDoXpBGgqI/75cy8RxUNq1mCVXQ9lhHWGCwc4j3SqIV+z0S
	 +G7MeGg6UtfTzBLLwHDTfxZrSARKMa+JsCKAZ8xoa7WJRS8ff1EHKBmRxJxv00A/LNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68929606A334
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68929606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K4Vt557254
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=; b=mmLAmyUmawismWCM
	8D1zgUydQ1Xhy0P+VxZ0PyGm0kc7/uWAHcrFCJVniY9LLW0PtJmObLbQ53/nsWr/
	CkbEEd2FsH21X2F4FW2p0R2yTU3kHIAQWN6ILFgLYGx88ZhTBJdo6Nc819UQwAmB
	XSw5K0I1fIuWgCWjKOQuT8mJpj1k+lz4AoNT8gc1rHESfTlLglKUd80vFkKqlgJ2
	rzB695UWp/wYvMzKlsu7kXFI+2C/+EuHzk8yiVlnKjYvCAFn4PgqtXtbA0XZZXSy
	1SHMQloONLSwZVaAY40+iOpWtV5f+j54p8Ck0uXszn6mtkTzk6+j/ee/SBpa5pyN
	9Zp6Ng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsnmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso897380a91.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184143; x=1793788943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=kfBdqoeIO0DRvKVGSd/doQ91F/4i/COtBaN2RGThuLLqL+GPRIXGi5hOIQXtXQucHh
         HmWeGhiY2r704PR6JraNEwE5rvjJOz3f+ja+1oWGQ4893jntRA/kBawued1AuQWSB6Nb
         dTiwommSdDP9oDqLzGNPhud2rzMPAN/oIbQMcjLQsELdChmdIWKlhfUJ5+bZnP5Opkqi
         6ojn5ODmaq6f1+RAVMLygCA35R3qst0LTDrq18AZVXcBhujC2UB/UwVIibNK37OHJdIW
         f4Yotz9RoWNmh9kBinPruzA/wO7y7lPN9UMTlUBhy87aOlBpcDHsJDDUaivV9FRFwlD1
         H+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184143; x=1793788943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=bH1qUeldM890OecWyrDH7JruimWzMFglIrw13uSpnYrF4HvxC+lKRSOykcXmgzYxsv
         1Y1SsHbDQKaTQsSUJQSwIust5asbo6TPZVj5+B6AcEpVLE8Hym2lN+UFsyXqqAggizqq
         Exb4dGvDfbWO5Z81yKRNCfDQVVrnzUCdOyPnocD0+aj56UDW4A7SYyMNxq0eumOWWLAi
         s7sKz6ESDQtU5U2mmM7IrYw5pEUkIgXA5Jay8hTN8XhoxIOkiPi63tLte1ungOpWPZLk
         4mrpacrFhZ3FkS5b1tOJlZ22iWVgPyNqb1R+LhBd/9iEwzKeM5d7kME3BxoC0uoYWcdm
         e1EA==
X-Forwarded-Encrypted: i=1; AKwUvBwmYw3UdOJTdCmg082tswjU5wgW3mN4icnUugUyAQ9zJMxinJNjVc+eVsBPuh5oP8lroVY4KgxdL7/I@vger.kernel.org
X-Gm-Message-State: AFq9FYKzEF51xyyZITlut1sZrCCUJT00/B7V4UpId70ETscQ4E7k7cIp
	JbhiV+67u70SoIOBCirblPK7O4T91sazu0BUFWBNlWsF+wBqIfyflK56QVSHi9uBJk7IdD/j7h1
	wqxJbFt3+mGG+YzZ6LVyGS2rLlpQyePZHllerzC1zKFSzDYHbVEY+oJ2OmN3+P2Ef
X-Gm-Gg: AYBFou3/ojzbswpZbKHky6woS3Cib0SJsjGsoCiFPV+SoD/57Pkh6TbL6Buqs/4SAeH
	3QC9HPlpbqd12Wl2ifxgH9BK3+G6AYtdZRxswmgRmmw518GxybLR3LFGl3pBBNSu+ovlCsQ3dEy
	a9jHVYTDhVRszQFyaRSFhDItNESuZJoZUmQFkFREmVaTPj5mVO+vCEnWTy6AwEUCy1C87g6Ak+m
	Y1+tuHOs9BFX34uj85lFurJbsfN5/rXOBdzo1zH7THAjYDhf6yyK/VhE+Ib1g33A3nfOApBL1ss
	7PtpLG0fcVO5xC0Gzfdfx2VDgHRHRm05cYCdKSB3qzKdWUDGyAe+n9xg+PT4xKLrI6l+BlwuVOu
	NChgwhlqX9Mt7rwvb7WOn52QVBddOaK3H9DSK+awsDQRfZmmnKsxG9wd4uzaP+EURJWf2TDy4b7
	LaSDOxcperWI/nm3dzgKEKoxvgsyVXZ6nuLA==
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449758a91.45.1793184143120;
        Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449738a91.45.1793184142665;
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a58d1sm2493140a91.9.2026.10.28.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Message-ID: <218d69dc-5761-4a8c-824f-7a15307f54a6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:42:17 +0800
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
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
        'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZfiIXOhrjvAgzg1zSXgAEkSwoLSr81gG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXwB905WVyfk9l
 KhEl2gkpyR56eUxyKrs9JmWQFjtBj1myxlXIa2OUKClqbGZ2APBW47V4/WjJD3ZTorbufrGa433
 uHDGouRLF4Y2/j5IYdRPs613qHhIUls=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1d190 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OGqcxO2SmPZ7BlYD9rsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZfiIXOhrjvAgzg1zSXgAEkSwoLSr81gG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX5DnUd+O2zbmO
 VXgURvJw6Eq7YfX7LMt1gEeRDss2TJOrRquviTx9MMMnaxgUGvzqxXeKy03b2YsMt29lUnfuNAm
 wjUlqpBwzc7EkJ6OvDiW5mnSipRXBUSON7+YqJ/Fss1zt7fe7l+3cVlP/2H6nPXMH16ZLHFX1X7
 UPQ1njWnfHZNyd70wTNd7u+dD7U4xVs/8XPYwSwrOj6w5UUXuAEMXiqIFCg60x8yQBNfMTu6sqD
 lTBol+89aKJqzTvPNurMbIHGOuTXBxgfWnBuUp1TuJ+ZbpfTuwQYfQo7o4RBPea/Y2BtwOXaK/g
 ABY+B7CChTpjE2qQqUEjpHDNEpnE7CMskNnVjYgwsPQPtPoBmXevlbFI+CQxGaDs87U1BSk4ec8
 d5cTKiAnAI/pkzfr29QfWVRoGesGFl+alZY3Aexcao7kTjGtTO3ziMh9GryS3zzjwY8UzBvIDoL
 Y0v3dAWzTxwU5FDx5Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

On 10/28/2026 5:29 PM, Qianhui Xu wrote:
> This series adds camera capture support for the Qualcomm SM8750 SoC
> (camera subsystem block with three full and two lite CSIDs, six CSIPHY,
> three full and two lite VFEs and three CSITPGs).  It was developed on a
> Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
> front gc08a8) capture at full resolution and 30 fps with it, through
> libcamera.
> 

Thanks for your interest in this work. It looks like this series is
based on my SM8750 series.

https://lore.kernel.org/all/20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com/

However, the original authorship and Signed-off-by appear to have been
dropped. When reusing someone else's patches, please keep the original
author and Signed-off-by, and add your own below it with a note on
what you changed (see Documentation/process/submitting-patches.rst).

Also, the follow-up work on top of the SM8750 series is already in
progress within our team, and it will be rebased on the Kaanapali
series once that is merged.

https://lore.kernel.org/all/20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com/

To avoid duplicated effort and split reviews, could you please hold
off on posting this series? If you have improvements in mind, I'd be
happy to discuss them on the original thread and include them with
proper credit. You can also split the CAMSS framework part out as a 
standalone series so that it will not influence the sm8750 CAMSS series.

---
Best Regards,
Hangxiang
