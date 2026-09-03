Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A7F3403E3
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422489; cv=none; b=fR0ov286pjT22wi+0s2UigDnypBB6xY+o7W1fMPzES0UY/G4RUfXwf6mA1yKZ2Bwux6NxcxOoFn0DwPzRpZQpjHxR84bs+XP3j4b8oWtJ9EZlP7mpz/XIHl0bzdtqgVMYAC+nmXorYfMQCd+0bXlm+8KRPWCDLhDOpkA5rPlB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422489; c=relaxed/simple;
	bh=6MRqnVTlxXGBzhgaGNkyW1sNAZ4bxwtiZcZhRiQo8Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/oNmadqkvoZxMGxYaJkmy28aALO5jgGn1wWzYZEGOS9pXV+sXAo4I6Gyw5Gm2Jo8Ee6i8Ic45ykYpjwhlJ7epBngKVyM5qGRSOBnJrczp6KK/GRGsPhY/UGCrODeTSgLOqtTMkfXC+23ozqIBxlSKZcrM8wddp213mTuYuVrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH2KB9XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT55MxGo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH2KB9XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT55MxGo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMQH324616
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=; b=EH2KB9XUXauUdDd6
	1c/kq/v+kzwIG4Up54zwXz3Pl3REZfAhKegVSni9D1vTSrcbfDPp7ToitnY9WcRe
	uM3LEQ5Qx/Dj1FI5LoAL3ak15oa3+E1kX1Tt1co5bcSeg21D1YI6IBur8033Ctcy
	gTimGjm4N9VQYRy+a0TMdFdc+m+mTt4eE6uzc9i8jj0aVFz4eXJuGOb1wj74idCJ
	4s5IblQHZW/1D5VCtk/xEwMS8/Q74kcEJVNuyW93tUyga7ox52sqVkMnboSpqUBs
	tmbdHIBF8PuzpdHOLycwD9azE5OrdIw8asH3/nx7lkkaZkFlLnDtnbuwQ0CGZORl
	DLmq5g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb7c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:01:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso80650137.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422486; x=1789027286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=;
        b=AT55MxGoWGB7T9b9vc5CVN/BgKHFpmMtTTQsotH+2JYjPbcFqsd4xvQ4dlYHPEV1KE
         dF15Tgt0bEy8DF5U5p2vYPIV9VrVGMjU/eT7uzSm5BQMSAIGBgAYJvdQZnbKhsau169B
         GzK5Zkh3/4Zbg4iCVmse8MOZLmQzd3xXQuPRch88Eyl0XSGi2lnKfc45i7o832Xxs3KB
         n2T8iRWvovkoL/RGbfd2+KOBLUA5RrxVUd4l6uKoo7v1VOB9UHO20DEvL4BjD3IDd1Wj
         vGxQmJKKOrtAv2kiZt+faUrUEepfiFnYhvwGmi0jlJZqSzNUN8U9vIMCBdEj/Z1SzVwd
         bHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422486; x=1789027286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=;
        b=EZ1JebpHkpb5jP+UDGy5i6IDy4O4lIQ8Ba7S09YDtxl4KctMiEEAjVAmROoeLMeBzp
         zUCIqQtmtMyME8UJBegeS6THIoDDzvY2gheVCEpuKWNlspBgtSQNPclLTTAhClxQ7mkn
         +Nm19KggsVHIsh9uVrv0G2OnTu7GOtgsIUGsFdyVkovPEaFAdrytyqrYY29mMuI+Rklt
         Jrns2ycgR0d6A9GZxjgdGmDVzirCyMP9cOZm+tf5JJgnkVvJ9doizOpSb2KBeGYm1WZ8
         DAFhCbu8dZsjvy6IgYJIDUzCNOzyX6wwK2H07tdWcAUUk5wf3zVFKAOcBh6FmX+zeXY4
         K+jg==
X-Forwarded-Encrypted: i=1; AKwUvBwUAhKtiUPYAY97eTK+qchK195lM2MJbHW8bPsiarg17Jmc+plWzTyICBB2ZuJ070KvaX7nKZdk/vEQ@vger.kernel.org
X-Gm-Message-State: AFuF++m1zYUVDxuTRR7PBEeL07suS6vTDa0FPn5QnM+yLFDyxiAhz02C
	0FPYZE12yPR5VpXUALUh6nopmKGX856z0rxy5QF9lyel/FIUmQLLnECJ6K3KvrrO9/0nfpOuhM+
	crSr2+sxQtCFa10p32JMXzk0uM8JFXc+HnzM9m+GbU/UIUBdhus1Wl6RGNY/CSn+C
X-Gm-Gg: AYBFou3+j5iYOrfVppz92JXM98oOFqYCCipOCKlXYa9vENX0K45kHW29Yl3IiqP26PC
	f9neio7GG02WBi7ge6TVfdevPNeLuFNFXAI01u3L8BDtu79HKUKv+7/WqEhphhpqZjO8otxx7iS
	C8ofSZhQZqlmsz/DzUYNJmABKlediB7XLlhHEobd6efq/FfMviyM+f/Ss4BU5lx9dzi5DTfQno3
	JPsU/4mg0cfjGy7Hs0xkVpBeVUUm7SsZrvQgxc6ZV7+s/vU76pJQgRT0nY1OVSttixDjxMsNYkZ
	Swzks0FQwvzyqdf4SVbV+qNf5UsBrkBKvnYvqh2Y/Z7/j+CuBgddf4pzePmrYvymmJUZEfd+oT0
	7cFWkXmmIFTEzwmzXeEyInw==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1512158137.1.1788422481405;
        Thu, 03 Sep 2026 01:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1512127137.1.1788422480769;
        Thu, 03 Sep 2026 01:01:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm59563266b.59.2026.09.03.01.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:01:20 -0700 (PDT)
Message-ID: <f7eb5a26-43e8-479c-b20c-cbf53ce54940@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:01:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a992957 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX+eeoVFutf89p
 QoUipBkrNLhDAP+YS4ewOFPVuSCFwOcYqsft4Y4v43OnyNruRUX4+LTZev267Pz/VEE7o8sFk/t
 7wbVYi9aahXQNbKGnfK1VyOChpftsKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX5tjn5a5iyTpD
 9YsupTSo8QYr/2JLODmUQLvSky30ElmzFJO3QOQKAzsfAOqh159EPGnXRadWdfMiSDKYtJc2T1p
 iWn3OFdA3SxMxjs2vJRVBvDYgtSUHzJO2LJcbe1NnrudEoarjNgTIf2VMvWX3eTmDJQaO4wJwCH
 6VvY8bh5uVfUSUJb8SrOx3C/rJZy3G1Zu5oxHpQUkaQABzqHHPlolRXPR4K2hQnoK1z3hwLi6ld
 HRaLOaGBSUpFScGmTnwHxqFRpZRYNt4buVhIlFAJDHhDZrBqdJQO2/urLK+iDlitRyrYeIqGBwK
 L2VJVzvMaeMEEMgQcmnh+AjHu8eYcGxLl3xftD2aXutxhw+oJt8QmRlfqSlMuIqavyoPsJcED71
 vIjqUriPoZ8aHe8s+Is1dqJrXn29+pgX88uXfGALAI9oqxqNU9jDSILs0BQQvk725MilPHcLZvH
 do2GNZR3FsxcTBVO5TQ==
X-Proofpoint-GUID: 4xpaPkEslUw7fHOQ6kSGHL6nJLZyA4ZZ
X-Proofpoint-ORIG-GUID: 4xpaPkEslUw7fHOQ6kSGHL6nJLZyA4ZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030071

On 9/3/26 9:18 AM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
