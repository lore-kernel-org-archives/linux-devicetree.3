Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1F3C1F4F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845628; cv=none; b=g3AK44Kj3gULKLNL8KHVIakcDntOE0Aiz5MUIrKdqtBW9gZSCJsTzGOXbkhhyrdn5axsF/5n1v2vWxYbcCF1pDAhiU8Inel1dTX5Kez6L1SRAapyiOF3EcBhkOeG7mxnrwBuss8uHr3xpLhTE5Tjcd1VxL1D9jhKRRkGw/iS9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845628; c=relaxed/simple;
	bh=xxINYb7KRet9mOnV/OAdNEkf2LjfFUGWBGdo/w8M1Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzD+3AGuijhm53kWXAWBQEfIuHE0zQ5KPzixJvsTMDujmEXVR/JvyNmEDGKMb2kBDlJs5t/Mq9QtAhlQ7/LauAAbLFY0wFMrgOYSdrkT6x/UAFRjwRJq1pCsepq/4J/jkelifEo3uAg7+sROwA7ZmaZ58L8sqIhPYEr91sicpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOLLa0RT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGeofJp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOLLa0RT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGeofJp8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xP7h2887770
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=; b=EOLLa0RTYRvY6Huc
	mbIsw8fBa3/+QjNRKqUH8/rAKJWdBWbZ0pAJHmLEn9hqyEV/rxVFkvmTPD9TjMKi
	gsFVeseG5UHUSwQCvMbPrpKtz+i9BsqPcjTsarUaq7KQHzxeI291ZGb/FDkixYJa
	KggUaq1Xt/4s14dD0Hhg29FRPXY97IK6zMTbt0CAojDSuukCwyewkI91d5QRRw/+
	G8mpGvMt9TKMo0+HHerbjOIv7P0p1QrbNVZJUEelI6zmzff540KcvowyOGOd1Eg9
	SFyK2CjmLFuBRs7TI9AuVEQC7YUvUZPM0cudV11ZkR041HZ1QMj/xYDZdBsWy4aR
	wBrBVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tmbb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:07:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5a9cc6acso68091485a.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845625; x=1791450425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=;
        b=FGeofJp8ZSHp6/BU45YkUgjIdaRg4vAXbN+k5brd5C0py5SMj+B+Ww2pivT/8OyRXV
         cLsuiCOj1NwfJkJe1fNBVLsUwGmKBu4k2h2LW5T9gpsXYqLKV58o3jmrPUdnnlzG0qrC
         eE/WOyAytXFioq9BPzk7jNlEtk8F5YBI44uzDPt+fpPZIyz2MCYJeodUgSw6RW3ddaq8
         KykUYmtCxe89sXdp+3Wc+OfjBz/xXBg+NLcdutSlQuOftjbjI1Bv/71bvGTgvyq02Dro
         /yRC75QKr+3hEQNbq1x6D2hgBprsPCz2ywpd7vsS9HZ/vFk4e9YfQ49V4YvnK2d8u9pT
         j1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845625; x=1791450425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=;
        b=j7nqs5rh0++8vxWRPFVQkRLzn/NlFShcU3yk/gPtH8mTnA1pK9yviYuQ4Jds10NFAw
         ZiBNfxhc8yqTbGSsGveFTtZl1W78E24PE/n8l3iod5bqRatLB/HbyvS7ZsjmzPTd/qBb
         jeUMWlJn+1031ubsxtLB4MLpMerOc+qbhwIw2U1pT2buNY2HkPYNpXdkMQJoxdoNvAlB
         qxY0ZHoRNzooszv0zA2H/UFn45TRDilbg5mmtDXfO9ZxJ+KfWmyTL5qYMZbrCjR31QR3
         mTWZmjdMv1OffZzTHpDEXwQo5vrVOrihYaqKo40Xr5CkGNK4HDL9WDgKyee/FQen5Ika
         mykg==
X-Forwarded-Encrypted: i=1; AKwUvByUA7kycugd2apJxk2bMK6ucRgb+8CqXIF3yjQCt1cek73psfOrKfWTUjsZRDwDSSqqaWDmZ8CGAPX2@vger.kernel.org
X-Gm-Message-State: AFuF++kWJLIhk5opG22wZqhVb7XR/0avdtMZOgQg9PCRFaWSEHlX06cv
	gImelqXAUd/8WQtSOhQA1EixaO43q1PqkDLVGl2KlvSfshulIbg4cNMkQUQEUQ26SWduF0LvPbo
	IGInifOhpnFscbv30V2TqtdaWUlexsqfTalP+GHhjwdhh4zfkDEZjNmsm1jVaRcrQLKIoF+Ha
X-Gm-Gg: AYBFou1+hNGSGeIuPBlxc/fhiPF+A4gXDFHpNHPiDSKRz28LBliJqroNKJCGv/osNc2
	Ufo2BljeLPhkMz26oy9jnAq4+18FYqyJ9eUGX5EhrGCVydXmMaKWxg1QaSxLShC6ESMgna3xz5s
	hYJmj14ESmfu8TaRL40CKgQn7NCh4IiqJWIGbTwqJARFlEOQXigUqzKRcvLNmzgGTUQNjR3Ad3s
	p3N6ivfZQuPD4vYEe53aDbi9q5LTUggKhcGnloLg1u8jRKuIGHllO/oFgWjfXKKfNszZ9ZLpjfJ
	fs8CoHFSzPAo51ivhkPYzBrWpuYgTDA1C5RD0+Fx6/bwOp/oV+aOdtkjXAvluk+SOypxBLhlzup
	lTSzU1IdPXjJQtfL6JSDQ0g==
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr733563885a.1.1790845625532;
        Thu, 01 Oct 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr733560785a.1.1790845625116;
        Thu, 01 Oct 2026 02:07:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d3f98dsm117803566b.40.2026.10.01.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:07:04 -0700 (PDT)
Message-ID: <4905ba01-7b74-40c7-9f99-513b26a0d9d9@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:07:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
To: Reza Kurniawan <imkyufie@gmail.com>, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
 <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNiBTYWx0ZWRfX9nok8rOz4x1v
 TGkbRJQDo8yk6n6WiQKnklxVOjX0h9WhPTcbjpin/dJLu5u6NGXg4W9em/BX9tcDaqxhm7bm502
 jail80VFjb/5wKhRmtWugreH42Wyo50=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abe22ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AYGg-ij1XDh01NWh1ucA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YMab1e_CqObyVauCGAOSh4RRFPqYwOw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNiBTYWx0ZWRfX4BtJMyTXDY/R
 mZjqutglFNb5FEWvpCdlGqWFwt2lxLf3Oltx8FZl5w7M0SPqGomrRVLVLRs1bmw3SLerYq1Cv/Y
 uvGHYzhzqRCYHPzlETk2AkfS4/S/3+BB6ZPuMJ8IsqOKbBLGv97mrkA3r6aJhiiouQ7SqUq65LW
 6JM5nzZTGB9xY6TTzWTxMMSVs39CRyscDWo3lgOEdmyxtNqQciANwEIUfrlOHsiVZuts7JPFZSw
 bnf7zrrC52Bf38fiShVOEnR8P17UAw3UhbX3u8hak7AUz9xPcJBtFQiCfb23wkxSKs64PMqrKLA
 Yg8zsBh47Ukd+ec0HkHfZd3le4X/anqMtm9E7lT7TJ3cw5Ib5bxh0mSSvQy5gOFmycjcCmLt61+
 jCN7kcgzvErSfdmHI6XvGCLgfsa2rbL4uz7kuzgwDY6Bgt7L43HbmbzRyEkFlQOUBhJSnKQqoO+
 hcdz/xg090Y9plcGDzA==
X-Proofpoint-GUID: YMab1e_CqObyVauCGAOSh4RRFPqYwOw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010036

On 9/12/26 5:18 PM, Reza Kurniawan wrote:
> Enable USB node and PHY. Since VBUS is wired to the charger IC, also
> set extcon of the USB node to inform the USB driver of cable events
> emitted by the charger driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
