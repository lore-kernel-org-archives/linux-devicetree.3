Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380F476681
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767063; cv=none; b=W8EAhQHwRglA1S6h/flotfoOWH4DPJK8dHrR13ORIZYBHcQgg2ucKQVA6bXWzxOoFzh3Bp/fGSnjMIYtc7vLStdQLJ6OijQUnhkjhZB5unroF2r4ZwFk2h8ZDqd2yOBypOx4YH4v2kQ3w77c0b5yZGj07EQhtJawvyD/gj1wiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767063; c=relaxed/simple;
	bh=EeqgvxyLfTni+7IKc4kWoIM6ayYzhXt4o9qX/MOfp4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt0dcjhoM+klezeLvpKhWB2Zr8jlwppjSN7YH2WhsyVEfOMdoeoeoJVPIIQ/yCtDdHJwQQWlYqfrvomtfWzUHH/vJ2C0xQy+QVXUUTG3sKTXVEkzBN7Tqa0e+dbm7ndSMkh81jH8UOhykODGj6/KaPQv+Baw1rh94GQd1+itXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAmalE74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSjwxPbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAmalE74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSjwxPbq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8JFr2898175
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=; b=MAmalE74m4oGRRkZ
	YgpBQMEenKNVe2j7WtcEurb35fYnSCR7ilC5hYyibKe74uJ3X6RzHM6bj79DU4Cs
	/iF89I4rpvZtwroibcOs4PGkoDgA9bnHbDlLhot6OmuYMvLRBclnfhAeZpBf6B4P
	wRJ8Rx/srv/10GUtUaelmBGHdaIYS20C6mTl6IC1uN2FgO2hrUIImFsbhqUA8Kcb
	rnfnJtRho3OB5h6vwihZhjp6Fw2Hmvm5ax5h+mdci3Q0QX+kcT1G0sjgmdZEacqf
	ZiJkC3eQCixEUMXYhKauFsS6AQW9hZIAhDrxitP4DbPgNStv01BQTlFwiVLUbrm+
	RQ45WQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn1w0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9178ba8eb30so2909746d6.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790767060; x=1791371860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=;
        b=WSjwxPbqaRfjlvBig4tQE5Nx3B5WZrjNOMpnl8ZhSxHJdGKx50Dd/0aj+EwJHKLV3M
         jl5SqrkIjJoFOBn+IVMkHemyZjD8Tp2ku8Uw8cxDSud210MQNtPhhSp3i/Pch6Y/ETiU
         MNQxpKSG1ITSHyFtIwZZAj2GMXsIPOTdeg6qPg1DuzJIL2et+9EE4AoiUEuxpg9XRIxr
         tyJ6YvvbVXzAafe8eSVMnvnRYyV3YhW/5AVrZSv8OFVp3HJkKhahi0R+1wW5R/p2Clxh
         KzSOsH9JNfyelRxho9jkK3JpFmJIQjRAGHcjGdX5dWvA53s+rsLsHxn3B+ZaI2PYvD9i
         XzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767060; x=1791371860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=;
        b=x1O6l8A0TQzj0Pd0blVKz6dLzOEfdK1aZR3ojoDBpNZLf5R1l6FE9dRlQqzqRyk3f+
         QqdedTbOAnik42EodltOYa+02MfWhp0SqEADq1D0fYWr6iE4GmFsbm912sYufgS8pmK/
         L47j54f4ivU+Ce4gRnra0TTwkBXrn/puj96wc8BTtuXWMNI2XlaHRCz8oe688JDWmfGD
         JaUm5nWFFaTiR1Y5U6fa/uMMJyHBL3TRMM/qogOkFO9FUSDBI6GLUfSWrgVhWVHCIIQh
         SwxyMluPb5K1T2mbuyxYilO9GMeIb+oX80Oq08lvA/DYyM0NQDfkDrYlwre8vQLIPU/b
         t+IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoEET1kQL8NUX7nL44tR3XxR9WtjugmIcUdnx60nYtP6t4w7Bn789MsF8IsYZheOLP5gYV7ee6KV7+@vger.kernel.org
X-Gm-Message-State: AFuF++k/NhfV7MlCePiInxbCcBwn1DuxHa14eYpuhRmob7FTkA+Os0ZO
	zgDVmy+LYWINbPpoJZ+L3FQRWvzRhuI7pllvasW0+ips2zqC63CiS/U76YEFKpEFxbeXNbFJXTh
	RzxdJfQZyRPJPF20Z80PUTWM0SVnUHgtE+/VDE+1MLs+1f9DHSpFofX6lZZlAEK25
X-Gm-Gg: AYBFou0VrRS52gCm2D4++pQLzJU1ANpty7JunDFOLN51+s9mTxDoNxCrlfVGlIzSBGN
	xNfgUc37HuI8ZKM1jXHSae4CzUR1l74N+iZZbhIhUm0ksBwzBPRkOmxFJiKnbIP6KmSebakKEzT
	pA83jmgU7mrMDkYD07zewO7KWsFQXknHQ2lsI3FPxF+t/PBVWLsYNjW5yTcO4J9kiHvtKf8jxuD
	VI7en+XMsjJROUWfDROiVJTO+LN3iBvwMHxs/mbSQYOArm8gVvePQoIvroM1e8g9ApB0tw9iwMs
	Fb1CoGeqYbtHh0OCb9JF2mZcbKYvUMwZW5FnGik13h9dsAedjlBoNBW7fvl/kY6Km3BqY3VUVj4
	330YKOX/s81HLusG3G7RLiA==
X-Received: by 2002:a05:620a:4554:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ca97b852cmr133008285a.6.1790767059805;
        Wed, 30 Sep 2026 04:17:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ca97b852cmr133001185a.6.1790767059096;
        Wed, 30 Sep 2026 04:17:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1558b289sm616849a12.15.2026.09.30.04.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:17:38 -0700 (PDT)
Message-ID: <361320d3-4c4e-448f-b883-1f9d6115f7a4@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:17:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcefd5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DhuRJU6gBchJA4Z4gf4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: BPJBP-7DOw5lK_x3bsD7XfMyjCy6vN_f
X-Proofpoint-GUID: BPJBP-7DOw5lK_x3bsD7XfMyjCy6vN_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX72zGMAXbW7xh
 8BjRlVPB/yXlmNDuKJaqnX4e4fJxwJGmmebkcr3csfHgjUyVkHgeiUMAia5tItT28uB6McEkDV4
 oEjifRKatasiv41oibMvAW7hKIHUgEWg1nR2WNFpTlNXZVk6aQ9yGTo2rjgaC1fd9l/qWkEs69r
 +B8z/llJmqOlVvujWfaaHKqi5zcaffvqVnzsTacZU3cabI0x1dgOEZlaDD1nlpIK3nc5cQIPDTi
 y1ozNZGIXBt+ukptViHq+LramPtNiMk2Rs25YfxUDfNGIPiuuXZYW17ECBN6/7aD0og+7vfKjDb
 36Uq2DhCs1AFyemjbQFRGWUIbkq8TvXlgwWRO9oV8xqDSSJWKaA56evN4VOa4hdRtp3vnsRbC82
 w+mpvfFspkT0anneVvlGdMIaLo5RM/v0Fvtg51/f4NaN8wEI0dCjEYN9xf3vedyWocoBhc+52bq
 b8Z7JBmPxoTGCrxz5Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX2SJgmfedVfLP
 d0NUWGfW6M6Jbh2Imxo3o6dMq0cFGmqJBUMEIHKfe7SBX1+46uDoLyoyc4MUSwvqHNsBTiquji2
 VYOZi5xPz1sU0QCuhnNqCtWh+hGO+Bo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 5:27 AM, Wangao Wang wrote:
> Add the iris video codec device node for the hawi SoC, describing the
> register space, interrupt, nine power domains (including the
> VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
> interconnect paths for CPU config and video memory bandwidth, IOMMU
> mappings, and the operating point table covering 150 MHz through 1000 MHz.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
