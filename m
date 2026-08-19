Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940C48124D
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153263; cv=none; b=rH2RDDF6c9FRDW7tdYl1PJGOey/wMcOymsaVVfjgdWVbuLXOz5TXf9rOans4ffoASebrZZ31z5kkrfv1ec3GyVxfSuwmifH3doQ7Mo/h/edX7N7HDXN5NElhAe9otI+1kHIfCyF+9Zg5ROcXT0VIDPzuhrVwfHRT17hcapSTHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153263; c=relaxed/simple;
	bh=siZDHvxx3lSLS+5j62sQIDeXqihgS66odMFsdkJQn1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOA/iZvWybFOb0FVCZ+qOzLdEz4TKbFn39zUo1hPlL+BzPLnTHYuUBi1A2LYAUGwL+tOZ5kVLAaJf7kG6hQZKbIBaIznlgE6Rvi7MIJe3w+T48AxtXPRs3HbOW0ZqaqxY3Yh2QFNugRYbDfP35CwKUquLEavPXxvUuKzhhDJzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGMP3D99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM6RBeI1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGMP3D99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM6RBeI1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1aFU963625
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=; b=GGMP3D99kmrzvDWC
	X+V4qVixkFVSmUZa3sDKVGZXq0zU6zl7lrfz9n7+v7XNphreTXFGjtcPXRK5EwBd
	+8b5U3S+jDj7QFd58VyPQSuPw3/PRwgzAqwdPNtmOWWTLMb+8LAcpnryw8+9Ez0d
	v/iXjSKFwupJmBg0cV54+vBsIfghZPvtFWs3GbYgygyvrdztneuHKBpeemDhfJdE
	yfeG1rQ0+qDLMfvn+Hu6S6tvErWwZmxdrXobIcfDhxz0WckIdtnhVwIhoiKkk7X/
	bmYSjWFDgaCbtihwsp8yCq6ltlGzp1fDs0pyQsX9u7aiLF4kpBeRh9F585M47iyy
	nKfsMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3g47b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:27:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so18224585a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153259; x=1787758059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=;
        b=RM6RBeI1eFTTWnLRTZk5kckExsqZ0z/QbxAKQyBmAGsiX7EyC0FOEKSSjDiQXIaFcL
         TIYwVNxZRIlUA2JuGPgwvKfmbRQJsUlg+KhJP0XeX5WoWlGqrQZCIQJ/ZpJ0e4mI89yn
         5vrhQVrmI8Aw/x5xxXp/dfrVrSk2BLdOlEQ17/QB8uZlg6lqKGbOoqD6YSJ40JYjufrW
         ioX+TXlhpTCrb19ncaYd7r5at+fIGWj5RmNucjEYFiOjW4HoJb/u4eQfsnGCko8RVKtZ
         zaX7wtPvxJQVtgpf4/99Mahjo2OIvkjChGRbakSK6UR/Ox8hzPu7FF+cP7IXdRbwkXJt
         vUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153259; x=1787758059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=;
        b=UmrnDSbIcOGK28FhM3XSsmEZOiIYUhRMPpU3mWhKVr5il/shCySmZSpj9y9n1ruXQw
         jPBNCJC/9hadMa44wNCR+kHFGjTVLHBey1uo+Pxs1qDpO516A6oaRj+wv8R+OA8/9wJS
         WT4mOx6Q6bJE4egdn9TxwTCICHAPFhNbcxKzyR/SvyLndanQBbFp+4eN9OodBaKND1tt
         H6vPa2IodC69LmfeLROXfDcAfqdUqI2mthMjBq4U9ULSltSaFIgWI6KS9gfJTvhd2O3u
         3Epz/ZVoN8c02ByGtFHWmtCIpwCykXRLlAoyjeX2YVtlrQ/ivIvM7h9roUkywfeI++7t
         BsoA==
X-Forwarded-Encrypted: i=1; AHgh+RoQhrzW9kbAfq2I8asw3U9L8FozoVytbdUEfVFwqNEE78laLrTjqCRJroJwSWlMYZwg002389FZs3cS@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0aBefORNQ8Dmvpq4ryR2K/5R2xhS3rPM0EQocMs84CtGDbo/
	042x92/PClQy3yv8Bmc+2FfRaSc83KgBGfdG7o4kA3a3504eV5bAwJ6KPPBsMj7O2FYI7LdYV3j
	C57YnYtVxSSE3lkaTdhBKrVJPYvLrdQ8Z9xisAZzDGYbV3Qnx37esExXsYZ55JToq
X-Gm-Gg: AR+sD13uQ6D90LoOMKylDa3OmZxPmZxM4upcGIjPcsQKd0pYm92cBliB570APEsjjQp
	40IRlB5udviegq91j81fMpaSudpJGgYNdh9Y0lw241AJQ+tny/8l2ea6irP1yWd8J3uk1EFTQEp
	Zlsiz00qYqebmjoCPbwJe6O4Ce6aywcQ2UQrIqmrztJZXs4nDpGuWC7uatmoOhXaXnaGAxxrnl8
	+waYkmHOT3eb/WeJOptNAscRtVlZMXdkOuhQFxjDrqnX6BeZinj/Ol24qaqyDPdIWNkZMfAPmnA
	kMjIT2SnpUT7X+mHsJsIZ3gHxvntVPDndex5+2kV8tbuduKnkQi98D7XcoYdMFwQGVVKFQ/TlGO
	BbSM6QSoQoP4JUe1ClSty/Shi
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr351349485a.3.1787153259329;
        Wed, 19 Aug 2026 08:27:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr351345785a.3.1787153258725;
        Wed, 19 Aug 2026 08:27:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c3bbsm987608a12.24.2026.08.19.08.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:27:37 -0700 (PDT)
Message-ID: <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:27:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85cb6b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9ngJe6dVrqvN9JGSoxUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX+tmfLIFGQYTp
 Yh/lPIebrORbcA3zwZCAb3/yKbsEc6HprjERJgn9G9bhprD9Bhk7XubV8jV3SY5xXCIFJXEUMNZ
 8e+GREib/QRcrKiI01pwKMK/oW7Puwb2NlMAqv1J3ByXb40hgdggWZCr/IoxwAzDAQWzMmS5vwS
 HpAcEcJIKdvxvmDZbuiDHdevooRLoMU4H9XUAyqHwO7/Sk2Kq0djyDi9yEW36jSpEWcP3HkCm1A
 IFB6ROtkKVM14uN5qdd1NnNhhbpNmD9IgJGTLwNiTUYOqssAUhnbPhZQkUNbfLfQVVIE4mvZ468
 03AqD39i/wh+sHPsUHwenLvAw3n1hBYEYnLZN4L8+gU9z0XXVVngS1oPw1mRwXCNAjGSwlBg+ZD
 ZoaYcqvTlWP11yYuAOpRkSdmDFPzRJRaKAZoo7FaT2PUKXiBZHOvrGoTFeObn4rEFA4Z1T2qAJu
 SoIzljMFhk39uSIfL8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX3NY8cy+usrxC
 WXcEzLIFjjEokfH3N1tJ0icBVrnnyJAvcNduULUSdl7q3nTsjU8gEJL8sZVjKL1QXfyvTvLrI1T
 BZNWciDJbQmdmp7+UgzNeOWEV+bydDg=
X-Proofpoint-ORIG-GUID: NkMPSnB-NidyhLBBA97lBT6gNvrJKQpJ
X-Proofpoint-GUID: NkMPSnB-NidyhLBBA97lBT6gNvrJKQpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On 8/19/26 5:23 PM, Shawn Guo wrote:
> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> respectively.

[...]

> +	msm_mux_qup1_se2_01,

other drivers where this is necessary stick an 'l' before the
lane indices, e.g. se2_l2, let's keep this 

The bindings change must be separate

Konrad
