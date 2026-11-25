Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600059;
	b=U570Y/RoR9P1smNdckWqrZ6/FkMsKZ4iQS3urV6/hEoHLWwHoWQVMj90mShaZgUtS/DN
	 f9PrrTGTUa2nn1NrvDBksQrJIfatyWrLm0/yUzt6bCsHvmqd4ztrxp0hx//YDpD8w6LrI
	 2On5BftRvTsM2A1v0/8DMvjoBYkjJOCjdx1Lxbh2h1y4Zs7Zqd89Mjtzzb+UAFddU3+/l
	 fHhZXITmvpu0sMTzhjQYP5KUOnfYQvnTUTj8CirDNILQs4c8nIHQqe/L/2r7Qx5a/EoX1
	 TQIbfFtdPX8hQfGN4PxsbpOmJBKPBl+I2IAQEEsOvY9cuLOaBAnE6GuXTgFnw9oAt+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
	b=jLy9+nUUziuj3SXdffkGz73+d3S/6LRX12FEp0SgoUeCnoYOzX5dWINpWctTuI0OBYBl
	 t43Yj5XAbIBeIvkFibkhh+lCa1H8h2tCgBnsOarS1nD5HTUWVRnaPZd1l0L01hjeEpeoH
	 +/7GUFfxT5MKaYuKrufJtCJ65eRxrN4TczE949kbZfXsbPj4cKto6wGFS8mJo+zq5hWtL
	 dZIIe1KBPiCxnibsQlKPVrFzuHQ8NKSNdEAeZsgKOazzsYEVaDrNCOrduTHgE82o2Q2Tw
	 efgTquQ0AHUp4JYai71s4TEkwvfiNuVeewRuVOVRk5qc57NCaXsF4ye8wxnJGpCpFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Wc0v6/T/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90987606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90987606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wc0v6/T/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68dT83113713
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=; b=Wc0v6/T//zOgi/kV
	Dvnswvuqy8DOPsBRut8jHdj3lf8SBHw6Rg0jgoG39nISG6LcbRjYmnyu1EJcZqSH
	RvAtqFrd8xSy5lWjeeMNwT0dQxT/SXjKgQiFmNtnuDCBHDLdJgX6P03eMcPztGXF
	gBtD5LfkQJmvmfUJshiBwB+BLEh4RYaxF1ZoHWQeqx3c0ColoeOu1gLqD7Po6pO9
	rKGZGxTY+4nimE3YIrdBL9ONTqZhofqcq1lRb2rw45FKJ+OCtPP26N9VqzN2wo7X
	+8nxqSBYlcTeESdO5yjmQ5lrm34BhNLrlgxG43TMejfRbh2DiR89GMmb6ocD2owp
	2LyLgA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsayjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:47:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so1762545eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600057; x=1796204857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=I8o74it+Za/xLr7v7u3b9UCBNHYvaqdZBN0XPNAkSR1gb01DqMMstfX6KwDpTOFpFw
         D11qI1v4JU73d95w+UNCl5qt6mOzhJz/Z1W5I7aH2ialqUNCYe3yB5x+RFyb6EcgusnE
         iB4E3qAF6VKLu6aunshk6TQDFDhBHnck6XwWyLSlXYnnTvTjbxBvXbZBk3NVs95/WU9B
         fbsLv6EtOBZUe1F/Wz/Ll5h87JgpmU0VpuLZGgTM/YXRi7iALAnUnj5Bxl5deFxpGnSo
         GQMZfhRNerbjAuZ10hudgK/Fb06Dar2spy/gewdBlzBs0E/KKHaBHz8VHoNsiVwB/0x6
         iKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600057; x=1796204857;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=V43H7AHyMqJhr5gQDm2P7HOyEOm5yOMgjvuu3LyEIkhIji/MusWMUp3VNiP0rSreUd
         /RbgUk51NEeu2i7y/tux4Yc/1vNNUiVH/YL4/h6qrw1n8s3sLwU8KFPS4W1DoJic9jlq
         TIJTS2FgO/pxkfCTcCU7KAujimk1iNG0TJiBBg23jnacJUgzWxjCpqyRedefxo1hWng0
         z955kHHaFxns//c63Fg2bZ5K7UP3UbXzHLlgME10axX/Q9wwcLSzbSgUb6sNues9tf57
         AVZX7uSXcrZY7SxiZGWaXPy9NL3gTtkCMamYsVKpBOHzpHhut6kmWs2iBzXhkfnboxCB
         lphg==
X-Forwarded-Encrypted: i=1; AL+hErHP6A1K34ijmYPT1blOsjhwhVwdeUo/2xd2u23Dfn5nhV/sIjMUapYYFY+8Dz7F+I4MLxdHhQL/vkjC@vger.kernel.org
X-Gm-Message-State: APuU4Z+bwJ0pcHQZjH0lkbSxZWR0E9up0U5OkW5eLCil4UGXE8YGarzc
	NlECK/hYr6Afs6VQmT1ABQIBVuoBewfJ7TfHh4naCTxqoMQ/zNv00aa/ekYU3yrUYg485PT3KWV
	UR7nE+jxuVB7ePqHXiNfxurP+xOAwHvGChNIJE9q3uqKqziqxRzdyiAW2gYiQWGug
X-Gm-Gg: AZFdTZfb0N5xfcz7yIQXr3G/vlq4ZW7PVYBLz90RPqZNWvOfK6F9jR7RlU5eDqXJlan
	J98qJv4A+rnuDLK+dTxOryQCO5cfsUxlgS4XXgqC7SiCHmfo8FP0rWJvEwrvxBQkP7lk/G1gND0
	9bFL6uLjrDY70Xyh2RkLDaSjRK2ZXft/OyPCXAJYTQFepGGt2oR5eMixX67eo7X3wS/NE7oQB0i
	sWZ6JXBs9Nrn1XZ/vHvfZSqFv38ZVp6edheyJQHZmnltXbSdeRkTPN+SY1ybsQjFdw1YXm+NAt7
	pV75vQAPJwbyoOfEpsm1kU9zDGxP1pFhfwnPbaqBrcR2uri/Q9VAcibtQiWEfD2cHdZ9lJoGjF5
	+k/n3bZQ0Plvnj2J3I8hTUh7I/Snt8NbBPPPv1oRFlJbq80XclwkgVwOX6Qv2pafe5MVfDUjCFS
	rOZQT4GA==
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788267eec.41.1795600056879;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788241eec.41.1795600056302;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm54307397eec.12.2026.11.25.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:35 -0800 (PST)
Message-ID: <3cbcbde4-39bc-dc36-72a6-b5171ee6730c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:17:27 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
 <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VSA75Fo3r_I79UFctOQuDjzvbm8-Zu_J
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06aeb9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dg-V5EUWANZTljz0_-gA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXxkt09/EDHEVA
 wmuaSxoReRDqRkpEjQ6Jdavw8mfUHYU77igLlHhdKG+Zx497v3UMcO7LhAg5TElaJvKk8zrx/UX
 QebOBLZfi+uGC+0O4o1LuLw71TSE39o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX3G/JlX72cZAo
 jwDYfGNe+oz/3p+E5mdIk9c+S+5BCP1GeSHeby/r5LKT3B2sKe+RpSHFjYlUm4+R+tHsH1uUMsY
 JJQ6ZoJLAOtZFkKkkqoUJ7iVNBS+HVhv1+aUFWqyXoo04uoB9vTIxyN/a+LmQkpPlyU99tAYUof
 2DCAKv3gRZ8CApclW2mZSyzTYfhUETZhxmKHMneBlIZP9nugeTlEKU/wQOzpxM4l6odp5AfqKD7
 3z/81WQMO1xhm2TPByiZjUbi9/NgcEyMsex9LDjhMphow7BCRhpzqUqVHq02X63MKIO5+t/CqiI
 Cg9iGSMNhVZHzbK1GfO+sDsbAJPD52dfI6eXABHfFADB+foYx2+1d50x1Tb/3IyxEHExDyP0P02
 m0fh0f7RDzOJhhsd12VYS+8vnmDtXocuUn5hpmDqnWg2gk/6HyTIVnK/ueMmJ1ZZ+QHZXwnTqyo
 PxxJsjk9B/1qJnIISHg==
X-Proofpoint-ORIG-GUID: VSA75Fo3r_I79UFctOQuDjzvbm8-Zu_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038


On 11/25/2026 1:54 PM, Mukesh Ojha wrote:
> On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> On platforms where a hypervisor is present, all Secure Monitor Calls
>> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
>> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
>> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
>> authentication SMC to TZ, and upon return maps the PIL region and
>> triggers the co-processor bring-up sequence:
>> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
>>
>> On platforms without a hypervisor, Linux drives these steps directly.
>> The SHM bridge infrastructure required for this is already upstream [1].
>> To isolate firmware memory in its own Input-Output Memory Management
>> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
>> is specified via the iommus property of a video-firmware child node in
>> the device tree. A firmware device is created from this node and mapped
>> to the SID.
>> The presence of the video-firmware child node is used to detect whether
>> a hypervisor is absent: when the node is present, Linux manages the
>> IOMMU directly; when it is absent, a hypervisor is assumed to be present
>> and these steps are skipped.
>> Extend the Iris driver to support Secure Peripheral Authentication
>> Service (PAS) on platforms where Linux manages the IOMMU, by creating
>> the firmware context device and performing the necessary IOMMU mapping
>> when the firmware device SID is present.
>> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
>> @oss.qualcomm.com/
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> Looks like it is almost two month after which you posted this series,

As listed in the cover letter prerequisites, this series depends on several
patches that required review and any follow-up updates, if needed. Since this
series would not work without those changes, posting this revision was delayed.

>
> So, I posted a series to move every mdt loader user to move to new pas load API.
>
> Please review this as well.
>
> https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/
>
>
