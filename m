Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BE45D90B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388921; cv=none; b=sYUKBoZkHx6H3yKyl+t0BQ55r3zk6gVhhGMEfm9Q7EUKwM7C0bimclMvxIJR5IfpSUbqN3O8IR9NCvUEbjY1n/Pngn+x8Ua2/gPxfk9gl48cPC6980wOgVjti/tbZfItsb5eoD7xhnfjb7/B+kFoWxVvXZ4KoHv53W58a6LvM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388921; c=relaxed/simple;
	bh=9DL0kYRPp1aAw5C12Omv4zJnYSX+EN6BhsllZoa07R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia/p246jkT7/fVQky/QDpZcb2hUdUrFb6HRAOOV9WK7qBMo0YzAyP1ajSJnF65vhpa6w2iEhbm1kuBH0ZcEyorx5vhPVj9ol8BgVg1LUGr3tLkUnbpiD1vuHcwsWCvV6AUz8Hh96oinH2FidGb+NMvyS9BNoQryS6t3uVQZLfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx00Yj/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G83dsUP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gx00Yj/4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G83dsUP2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5be3291475
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=; b=gx00Yj/4lf1hk1vz
	h9pFIJ4+/ofDNTuy4hODEOHSAs/KJMJX33SPXRaP40ygaHLpNRsksyP27n+SC+T0
	tBt+HvPGd9CQwJMjZEAVn/uIGds749EM7cFFkYwhSJgcs6ptcEVKS1Ye2kyXOEds
	VXBMAnQHhVL/x02lu2NTgge5FFOxOl1PonEUv8S6JZOWdTqsCY6b8olmxzh6pcyY
	ijZQMgaeoNkpZGHDLrvbF8hgzbsYod7SD7VUhwAFsQrFGhc4LvzPNY9Ouj0qKDXm
	ayxWO0YBHNOa60QNaF/phesyH/ZJJd6viYqvRmIaYH0Sa+tIxT27jIE71aYgLnOm
	YvhVKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8k46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so54213285a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388918; x=1789993718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=G83dsUP2LKYyw2Rf1h2hJni2cJ5VCfQP4XNgkSWM9EqTdePTuI5pjYs/3m1ph6V692
         tdIrm3Nhrm7gSpFBNW9yipJWZ6Po3+LoKnkixXzwUPpgbwlL3OQo6YYkwI+VmhaL6zqy
         f+MvJHH1Yxiszp5q3qQSXKB3hK32WbyeOcsnO0f27hhumIoJ55idtySurZVy3V9D6Mio
         t4fuAlKKJnwwqlaJVxATJUZYeGvxpbNTOV096yrk7wD+vsYTAiaBxpyDXDvnANxKK6kp
         D+Bqlc0mnghdn0zoMX1HVPUiRlpO6pF1BQQbymIQczQFyy8b45iU0abnhX1EgcC2Jv59
         lR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388918; x=1789993718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=Y+QlSYY9XUh2xDUBJiNfvnkdwb8gEaZ1kSynjFS/ssIZsM87AiH32omGQu5bQpPdiF
         DehC8pRTba0vrdIiRVqaax4Ejga5k2a2+1VaxkPIA7WK7IPuBTQ1YtIRVx61fOliGfR4
         Suvh09Ys+hilaDoJhT9oiJa8h5A8NCJ2mSvTfZLKFHAaU4U5S/pK1V6uUWMlyYW8hQgw
         zUbHQ4bVwIkHiHIrOTgWCRENWLjAHcKlWO2tS03Bi3mfri7+OKpaziYiBawni00V+NCK
         8nt6G32L42UoYj76GogqI4RBCGb8bpSpgjei5URQKIDz7/oXo3b60Z8cPKvpQ0zz0P5d
         8byw==
X-Forwarded-Encrypted: i=1; AKwUvBySi2plYqp2btI0H8JNxRCAHksDxB6SNn1mmoMN4ScGOjUsoro9vM6K63hN127gXhkjfG7xlEbAcsL1@vger.kernel.org
X-Gm-Message-State: AFuF++kTYLM0tDccVIoSrEGoAqw5G7TEPEyCAcGpUIk7Lmen2wvwTs+v
	tHiCsYydIaLshT2Z3+Ha1dpZoRjHJ9M3f8876QcU+z1Tulo+wrFgGZX2CCJ0jTHF6CroAgrljE7
	0xyaiQObEgXwYbpp0lijh3qB9JzzrJmnQJtly+QCK9uB2FDbil0zM0UiV9IliLUVk
X-Gm-Gg: AYBFou1bkonSziY8k9GtDtCQQPnW1s34GS2liFFmXq+k9ST3jJWE3BY9hUzkq/uHHlP
	mBYFTN8n1yKYuCo3MrwXsrSjlaTeeNW+O3Je/DZn4M9mWYBlUP81ro3VIxnC1vf2gmjyCj1UHQQ
	aRuijBHecogk93BhXn1fM96xXuYmqs63+t95Ex1pQJlpsfzjqmMzVXNQp6Q9zoaujnMEbzS42e1
	UbQg6S8jpfbfWOU/TL94P/ONbcn6OYsZ4+ff2xa/AACegOZNzKTNqOUQJxxzVKehciQzuot8IjV
	lqkpQcwLLc+onKmULapPxGPxqgpYmuTqywhpuqJJVcplHHnNxNgdAOjRZEnQNWWB3/qVf43ZR2a
	Vrfb4Zel8HcIoJmjLGVE7Lw==
X-Received: by 2002:a05:620a:288d:b0:939:e9a3:3105 with SMTP id af79cd13be357-93a29c7f55bmr259224785a.6.1789388917719;
        Mon, 14 Sep 2026 05:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:e9a3:3105 with SMTP id af79cd13be357-93a29c7f55bmr259221285a.6.1789388917344;
        Mon, 14 Sep 2026 05:28:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:36 -0700 (PDT)
Message-ID: <46ea46ab-5562-43df-a67e-876c5e1d2ec0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7e876 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5FgfX7gN2BgJvmEmFfjOl3H0mkhfelpa
X-Proofpoint-ORIG-GUID: 5FgfX7gN2BgJvmEmFfjOl3H0mkhfelpa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX5Ej51vujpJ3L
 sBJSYT5GK7367wFrz7hkiAP2k+Tu1zCo9FATVwJDfiIBtX4frUq4JAw52Gbndwh2Fanhza8owdB
 ak6Tl6l/AdyePO1OJQVR7ehza7TXPeapJSZvJCoPfitDhE3SS6yEvk5wUG9yogmDi+eJPwowVh+
 2IduGvEePONmPrTFMbw0Uo7ZeGCgJPvunH/i0h+ksUzuYqCBtx5PzT8tAPpjzRufmiRV4Q2tuM4
 JiEWQra0NvM08k0TeGAsLpvyPKX+Ht3T6EPqrYTC9SahFi9DIOsEwQO73cJkhNA259AMV8IVC/r
 n6v5oPlYQ5OlWqf5YscwIS/DylqpHYKEpdIWVI8Bb0Gii8/IqZOBVVf69XU4JtmNkUds2jHoOMS
 r1X0+JAl+xP1EhTtIPD0fxks1JtocIT9nRGKFTz0G6IudenmCyAWsW2ugTKU61sge844Y+JVWQX
 Z/L7Nu+92eXeGDC6Xqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX0HgCze9fKlux
 mrSZGqVXCkGnwdPADH5nEzmGPINt/+6QgJVKAAFJT1bIZVk6uF+MRVa4lBp2kTAFo9gIoA+vuuR
 ZLIefJNu8clvFjz1OlOLVEZl5AaEuh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
